package com.u8.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.hcp.util.HcpDataSourceBaseInfoMapDetailUtil;
import com.u8.obj.DispatchlistObj;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.BaseSearchCondition;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class DataSyncServiceOld
{
	private Logger logger = Logger.getLogger(getClass());

	/**
	 * 从外部系统同步数据
	 * 
	 * @param request
	 * @param response
	 * @param condition
	 * @param mainObjClz
	 * @param detailObjClz
	 * @param mainObjColumnMap
	 * @param detailObjColumnMap
	 * @throws Exception
	 */
	public void syncDataFromOutDs(HttpServletRequest request, HttpServletResponse response, BaseSearchCondition condition, Class mainObjClz, Class detailObjClz, Map<String, String> mainObjColumnMap, Map<String, String> detailObjColumnMap, IDataSyncExtendService extendService) throws Exception
	{
		// 本次需要入库的数据
		List<BaseDbObj> needSaveMainObjList = new ArrayList<BaseDbObj>();
		List<BaseDbObj> needSaveDetailObjList = new ArrayList<BaseDbObj>();
		// 需要补充完善的对照关系
		Map<String, Integer> needCompleteMap = new LinkedHashMap<String, Integer>();

		// 外部数据源编码
		String out_ds_code = BeanUtils.getProperty(condition, "out_ds_code");

		long startTime = System.currentTimeMillis();
		logger.info("====从外部数据源" + out_ds_code + "中同步数据:开始----");

		// ================主表处理================
		IBaseDAO mainDao_U8 = new DefaultBaseDAO(mainObjClz, SystemConstant.U8_DB);
		IBaseDAO detailDao_U8 = new DefaultBaseDAO(detailObjClz, SystemConstant.U8_DB);
		IBaseDAO mainDao_OUT = new DefaultBaseDAO(mainObjClz, out_ds_code);
		IBaseDAO detailDao_OUT = new DefaultBaseDAO(detailObjClz, out_ds_code);

		// 1、外部数据
		String mainObjKeyColumn = condition.getDomainObj().findKeyColumnName();// 主键名称
		String[] mainObjKeyValues = request.getParameterValues(mainObjKeyColumn);// 前台选择的

		condition.setOtherWhere(StringUtil.getInSql(mainObjKeyColumn, Arrays.asList(mainObjKeyValues)));
		List<BaseDbObj> mainObjList_OUT = mainDao_OUT.searchPaginationByCondition(condition).getDataList();

		logger.info("----主表：从外部数据源" + out_ds_code + "中查询符合条件的主表数据共计" + mainObjList_OUT.size() + "条----");

		// 2、用友数据，根据唯一索引查询
		String mainObjWhereClause_U8 = "";
		List<String> mainObjUniqueIndexColumns = condition.getDomainObj().findUniqueIndexProperties();
		if (mainObjUniqueIndexColumns.size() == 1)// 唯一索引只有一个字段
		{
			String mainObjUniqueIndexColumn = mainObjUniqueIndexColumns.get(0);
			List<String> mainObjUniqueIndexValues = new ArrayList<String>();
			for (int i = 0; i < mainObjList_OUT.size(); i++)
			{
				mainObjUniqueIndexValues.add(BeanUtils.getProperty(mainObjList_OUT.get(i), mainObjUniqueIndexColumn));
			}
			mainObjWhereClause_U8 = StringUtil.getInSql(mainObjUniqueIndexColumn, mainObjUniqueIndexValues);
		} else
		{
			mainObjWhereClause_U8 = " 0=1 ";
			for (int i = 0; i < mainObjList_OUT.size(); i++)
			{
				mainObjWhereClause_U8 += " or " + mainObjList_OUT.get(i).findUniqueIndexClause();
			}
		}

		List<BaseDbObj> mainObjList_U8 = mainDao_U8.searchByClause(mainObjClz, mainObjWhereClause_U8, null, 0, Integer.MAX_VALUE);
		logger.info("----主表：从用友系统中查询已经入库的数据共计" + mainObjList_U8.size() + "条，外部系统需要新入库的数据" + (mainObjList_OUT.size() - mainObjList_U8.size()) + "条----");

		// 3、判断是否有需要导入的数据
		if (mainObjList_OUT.size() <= mainObjList_U8.size())
		{
			logger.info("----主表：没有需要新入库的数据----");
			request.setAttribute("message", "本次查询出的" + mainObjList_OUT.size() + "条数据之前均已导入用友系统，因此没有需要新导入的数据");
			request.getRequestDispatcher("/Rdrecord/syncDataResult.jsp").forward(request, response);
			return;
		} else
		{
			for (int i = 0; i < mainObjList_OUT.size(); i++)
			{
				BaseDbObj mainObj_OUT = mainObjList_OUT.get(i);

				// 3.1、是否已经在用友系统存在，如果已经存在则不处理，如果用友系统不存在，则继续处理
				if (isInU8(mainObj_OUT, mainObjList_U8))
				{
					logger.debug("----主表：" + mainObj_OUT.findUniqueIndexClause() + "的数据在用友系统中已经存在，不处理----");
					continue;
				} else
				{
					logger.info("----主表：" + mainObj_OUT.findUniqueIndexClause() + "的数据在用友系统中不存在，需要处理----");
				}

				// 3.2、检查需要对照的字段是否已经有对照关系，对照关系不全的，进行提
				checkMapped(mainObj_OUT, mainObjColumnMap, out_ds_code, needCompleteMap);

				// 3.3、对照关系齐全则可以入库
				needSaveMainObjList.add(mainObj_OUT);
			}
		}

		// ================子表处理================
		if (detailObjClz != null)
		{
			// 1、从外部系统查询到所有符合条件的记录
			List<String> mainObjKeyValues_OUT = new ArrayList<String>();
			for (int i = 0; i < needSaveMainObjList.size(); i++)
			{
				mainObjKeyValues_OUT.add(needSaveMainObjList.get(i).findKeyValue() + "");
			}

			List<BaseDbObj> detailObjList_OUT = detailDao_OUT.searchByClause(detailObjClz, StringUtil.getInSql(((BaseDbObj) detailObjClz.newInstance()).findParentKeyColumnName(), mainObjKeyValues_OUT), null, 0, Integer.MAX_VALUE);
			logger.info("----子表：从外部数据源" + out_ds_code + "中查询符合条件的子表数据共计" + detailObjList_OUT.size() + "条----");

			// 2、检查需要对照的字段是否已经有对照关系
			for (int i = 0; i < detailObjList_OUT.size(); i++)
			{
				BaseDbObj detailObj_OUT = detailObjList_OUT.get(i);

				checkMapped(detailObj_OUT, detailObjColumnMap, out_ds_code, needCompleteMap);

				// 对照关系齐全则可以入库
				needSaveDetailObjList.add(detailObj_OUT);
			}
		}

		// 3、所有对照关系齐全，则可以进行数据入库，否则前台提示补充对照关系
		boolean success = true;
		if (needCompleteMap.size() == 0)
		{
			// 对照关系齐全
			for (int i = 0; i < needSaveMainObjList.size(); i++)
			{
				// 3.1、主表入库
				BaseDbObj mainObj = needSaveMainObjList.get(i);

				long mainObjKeyValue_OLD = mainObj.findKeyValue();

				mainObj.setKeyValue(null);// 清除原来的主键值
				
				mainObj.putChildren(new ArrayList<BaseDbObj>());// 子对象置空，防止去数据库中查询

				success = mainObj.save(SystemConstant.U8_DB);

				if (success)
				{
					// 3.2、子表入库
					if (detailObjClz != null)
					{
						long mainObjKeyValue_NEW = mainObj.findKeyValue();

						List<BaseDbObj> detailObjList = new ArrayList<BaseDbObj>();

						for (int j = 0; j < needSaveDetailObjList.size(); j++)
						{
							BaseDbObj detailObj = needSaveDetailObjList.get(j);
							String detailObjParentKeyColumn = detailObj.findParentKeyColumnName();
							if (BeanUtils.getProperty(detailObj, detailObjParentKeyColumn).equalsIgnoreCase(mainObjKeyValue_OLD + ""))
							{
								if (!StringUtil.isEmpty(detailObj.findKeyColumnName()))
								{
									detailObj.setKeyValue(null);// 清除原来的主键值
								}
								detailObj.setParentKeyValue(mainObjKeyValue_NEW);
								detailObjList.add(detailObj);
							}
						}

						success = detailDao_U8.save(detailObjList);// 子对象入库

						mainObj.putChildren(detailObjList);// 子对象关联到父对象

						// 如果子表保存失败，则主表对应记录也删除
						if (!success)
						{
							mainObj.delete(SystemConstant.U8_DB);

							break;
						}
					}
				} else
				{
					break;
				}
			}

			// 扩展操作
			if (success && needSaveDetailObjList.size() > 0 && extendService != null)
			{
				logger.info("====扩展操作:" + extendService.getClass().getName() + " 开始----");
				extendService.process(needSaveMainObjList);
				logger.info("====扩展操作:" + extendService.getClass().getName() + " 结束----");
			}

			// 构造导入成功的提示信息
			long endTime = System.currentTimeMillis();
			logger.info("====从外部数据源" + out_ds_code + "中同步数据:结束，耗时" + TimeUtil.timeInerval2str(endTime - startTime) + "----");
			String message = "";
			if (success)
			{
				message = "导入成功：本次查询出的" + mainObjList_OUT.size() + "条主表数据，有" + (mainObjList_U8.size()) + "条之前已经导入用友系统，本次共导入" + needSaveMainObjList.size() + "条主表数据和" + needSaveDetailObjList.size() + "条子表数据，耗时" + TimeUtil.timeInerval2str(endTime - startTime);
			} else
			{
				message = "导入过程中出现异常，请联系软件开发厂商技术人员解决。";
			}
			request.setAttribute("message", message);
			request.getRequestDispatcher("/Rdrecord/syncDataResult.jsp").forward(request, response);
		} else
		{
			// 缺少对照关系，前台提示处理
			Iterator<String> iter = needCompleteMap.keySet().iterator();
			while (iter.hasNext())
			{
				String key = iter.next();
				logger.info("----有" + needCompleteMap.get(key) + "条数据的'" + key + "'需要完善对照关系----");
			}

			request.setAttribute("needCompleteMap", needCompleteMap);
			request.setAttribute("out_ds_code", out_ds_code);
			request.getRequestDispatcher("/Rdrecord/needCompleteMap.jsp").forward(request, response);
		}
	}

	/**
	 * 检查对照关系是否具备
	 * 
	 * @param baseDbObj
	 * @param columnMap
	 * @param out_ds_code
	 * @param needCompleteMap
	 * @throws Exception
	 */
	private void checkMapped(BaseDbObj baseDbObj, Map<String, String> columnMap, String out_ds_code, Map<String, Integer> needCompleteMap) throws Exception
	{
		Iterator<String> mainObjColumns = columnMap.keySet().iterator();
		while (mainObjColumns.hasNext())
		{
			// 属性名
			String columnName = mainObjColumns.next();
			// 对照类型
			String baseInfoTypeCode = columnMap.get(columnName);
			// 属性值-对照前
			String columnValueBeforemap = BeanUtils.getProperty(baseDbObj, columnName);
			// 属性值-对照后
			String columnValueAftermap = HcpDataSourceBaseInfoMapDetailUtil.getDstcode(out_ds_code, SystemConstant.U8_DB, baseInfoTypeCode, columnValueBeforemap, needCompleteMap);
			if (!StringUtil.isEmpty(columnValueAftermap))
			{
				BeanUtils.setProperty(baseDbObj, columnName, columnValueAftermap);
			}
		}
	}

	/**
	 * 根据唯一索引判断外部系统的某条记录是否已经在U8中
	 * 
	 * @param mainObj_OUT
	 * @param mainObjList_U8
	 * @return
	 * @throws Exception
	 */
	private boolean isInU8(BaseDbObj mainObj_OUT, List<BaseDbObj> mainObjList_U8) throws Exception
	{
		for (int i = 0; i < mainObjList_U8.size(); i++)
		{
			if (mainObj_OUT.findUniqueIndexClause().equalsIgnoreCase(mainObjList_U8.get(i).findUniqueIndexClause()))
			{
				return true;
			}
		}

		return false;
	}
}
