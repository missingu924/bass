package com.u8.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.hcp.util.HcpDataSourceBaseInfoMapDetailUtil;
import com.u8.obj.AbstractDataSyncObj;
import com.u8.obj.DispatchlistObj;
import com.u8.searchcondition.AbstractDataSyncSearchCondition;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.BaseSearchCondition;
import com.wuyg.common.util.MySqlUtil;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class DataSyncService
{
	private Logger logger = Logger.getLogger(getClass());

	public void syncDataFromOutDs(HttpServletRequest request, HttpServletResponse response, AbstractDataSyncSearchCondition condition) throws Exception
	{
		AbstractDataSyncObj mainObj = (AbstractDataSyncObj) condition.getDomainObj();
		Class mainObjClz = mainObj.getClass();
		Class detailObjClz = mainObj.findChildClz();
		Map<String, String> mainObjColumnMap = mainObj.findMainObjColumnMap();
		Map<String, String> detailObjColumnMap = mainObj.findChildObjColumnMap();

		IDataSyncExtendService extendService = null;
		try
		{
			String extendServiceDefault = mainObj.getClass().getCanonicalName() + "DataSyncExtendService";
			extendService = (IDataSyncExtendService) Thread.currentThread().getContextClassLoader().loadClass(extendServiceDefault).newInstance();
		} catch (Exception e)
		{
		}

		syncDataFromOutDs(request, response, condition, mainObjClz, detailObjClz, mainObjColumnMap, detailObjColumnMap, extendService);
	}

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
	public void syncDataFromOutDs(HttpServletRequest request, HttpServletResponse response, AbstractDataSyncSearchCondition condition, Class mainObjClz, Class detailObjClz, Map<String, String> mainObjColumnMap, Map<String, String> detailObjColumnMap, IDataSyncExtendService extendService) throws Exception
	{
		BaseDbObj mainInstance = (BaseDbObj) mainObjClz.newInstance();
		String mainObjTable = mainInstance.findTableName();// 主表
		String mainObjKeyColumnName = mainInstance.findKeyColumnName();// 主表ID

		Connection conn_OUT = null;
		String mainKeysTable = null; // 保存主键的表
		String sql = null;

		long firstStartTime = System.currentTimeMillis();

		try
		{

			// 外部数据源编码
			String out_ds_code = BeanUtils.getProperty(condition, "out_ds_code");
			// 前台选中的主键
			String[] mainObjKeyValues = request.getParameterValues(mainObjKeyColumnName);// 前台选择的

			// 主表的主键入临时表
			conn_OUT = MySqlUtil.getConnection(out_ds_code);

			mainKeysTable = mainObjTable + "_keys";
			insertKeys(conn_OUT, mainObjKeyValues, mainKeysTable, mainObjKeyColumnName);

			// 本次需要入库的数据
			List<BaseDbObj> needSaveMainObjList = new ArrayList<BaseDbObj>();
			List<BaseDbObj> needSaveDetailObjList = new ArrayList<BaseDbObj>();
			// 需要补充完善的对照关系
			Map<String, Integer> needCompleteMap = new LinkedHashMap<String, Integer>();

			logger.info("====从外部数据源" + out_ds_code + "中同步数据:开始----");

			// 主表查询
			long startTime = System.currentTimeMillis();
			IBaseDAO mainDao_U8 = new DefaultBaseDAO(mainObjClz, SystemConstant.U8_DB);
			IBaseDAO detailDao_U8 = new DefaultBaseDAO(detailObjClz, SystemConstant.U8_DB);
			IBaseDAO mainDao_OUT = new DefaultBaseDAO(mainObjClz, out_ds_code);
			IBaseDAO detailDao_OUT = new DefaultBaseDAO(detailObjClz, out_ds_code);

			sql = "select t0.* from " + mainObjTable + " t0 join " + mainKeysTable + " t1 on t0." + mainObjKeyColumnName + "=t1." + mainObjKeyColumnName;
			List<BaseDbObj> mainObjList_OUT = mainDao_OUT.searchBySql(mainObjClz, sql);

			logger.info("----主表：从外部数据源" + out_ds_code + "中查询符合条件的主表数据，共计" + mainObjList_OUT.size() + "条，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime) + "----");

			// 检查主表需要对照的字段是否已经有对照关系，对照关系不全的，进行提示
			startTime = System.currentTimeMillis();
			for (int i = 0; i < mainObjList_OUT.size(); i++)
			{
				BaseDbObj mainObj_OUT = mainObjList_OUT.get(i);
				checkMapped(mainObj_OUT, mainObjColumnMap, out_ds_code, needCompleteMap);
				// 对照关系齐全则可以入库
				needSaveMainObjList.add(mainObj_OUT);
			}
			logger.info("----主表：检查对照关系，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime) + "----");

			// 子表查询
			if (detailObjClz != null)
			{
				startTime = System.currentTimeMillis();

				BaseDbObj detailInstance = (BaseDbObj) detailObjClz.newInstance();
				String detailObjTable = detailInstance.findTableName();
				String detailObjParentKeyColumnName = detailInstance.findParentKeyColumnName();

				sql = "select t0.* from " + detailObjTable + " t0 join " + mainKeysTable + " t1 on t0." + detailObjParentKeyColumnName + "=t1." + mainObjKeyColumnName;
				List<BaseDbObj> detailObjList_OUT = detailDao_OUT.searchBySql(detailObjClz, sql);
				logger.info("----子表：从外部数据源" + out_ds_code + "中查询符合条件的子表数据，共计" + detailObjList_OUT.size() + "条，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime) + "----");

				// 检查子表需要对照的字段是否已经有对照关系，对照关系不全的，进行提示
				startTime = System.currentTimeMillis();
				for (int i = 0; i < detailObjList_OUT.size(); i++)
				{
					BaseDbObj detailObj_OUT = detailObjList_OUT.get(i);
					checkMapped(detailObj_OUT, detailObjColumnMap, out_ds_code, needCompleteMap);
					// 对照关系齐全则可以入库
					needSaveDetailObjList.add(detailObj_OUT);
				}
				logger.info("----子表：检查对照关系，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime) + "----");
			}

			// 所有对照关系齐全，则可以进行数据入库，否则前台提示补充对照关系
			boolean success = true;
			if (needCompleteMap.size() == 0)
			{
				// 主表保存入U8数据库
				startTime = System.currentTimeMillis();
				List<Long> oldKeyList = new ArrayList<Long>();
				for (int i = 0; i < needSaveMainObjList.size(); i++)
				{
					BaseDbObj mainObj = needSaveMainObjList.get(i);

					// 记录原有主键值
					long mainObjKeyValue_OLD = mainObj.findKeyValue();
					oldKeyList.add(mainObjKeyValue_OLD);

					// 清除原来的主键值
					mainObj.setKeyValue(null);

					// 子对象构建，防止去数据库中查询
					mainObj.putChildren(new ArrayList<BaseDbObj>());
				}
				success = mainDao_U8.save(needSaveMainObjList);
				logger.info("----主表：保存入库，共" + needSaveMainObjList.size() + "条，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime) + "----");

				// 子表保存入U8数据库
				startTime = System.currentTimeMillis();
				if (success && detailObjClz != null)
				{
					for (int i = 0; i < needSaveDetailObjList.size(); i++)
					{
						BaseDbObj detailObj = needSaveDetailObjList.get(i);

						// 清除原来的主键值
						if (!StringUtil.isEmpty(detailObj.findKeyColumnName()))
						{
							detailObj.setKeyValue(null);
						}

						// 父对象的旧主键值
						long detailObjParentKeyValue_OLD = StringUtil.parseLong(BeanUtils.getProperty(detailObj, detailObj.findParentKeyColumnName()));

						for (int j = 0; j < oldKeyList.size(); j++)
						{
							if (detailObjParentKeyValue_OLD == oldKeyList.get(j))
							{
								BaseDbObj mainObj = needSaveMainObjList.get(j);

								// 父对象的新主键值
								detailObj.setParentKeyValue(mainObj.findKeyValue());

								// 子对象关联到父对象
								mainObj.findChildren().add(detailObj);
							}
						}
					}
				}
				success = detailDao_U8.save(needSaveDetailObjList);
				logger.info("----子表：保存入库，共" + needSaveDetailObjList.size() + "条，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime) + "----");

				// 如果子表保存失败，则主表对应记录也删除
				if (!success)
				{
					List<String> newKeyList = new ArrayList<String>();
					for (int i = 0; i < needSaveMainObjList.size(); i++)
					{
						newKeyList.add(needSaveMainObjList.get(i).findKeyValue() + "");
					}
					mainDao_U8.deleteByKeys(newKeyList);
				}

				// 扩展操作
				if (success && needSaveMainObjList.size() > 0 && extendService != null)
				{
					try
					{
						startTime = System.currentTimeMillis();
						logger.info("----扩展操作:" + extendService.getClass().getName() + " 开始----");
						extendService.process(needSaveMainObjList);
						logger.info("----扩展操作:" + extendService.getClass().getName() + " 结束,耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime) + "----");

					} catch (Exception e)
					{
						logger.error(e.getMessage(), e);
					}
				}

				// 构造导入成功的提示信息
				long endTime = System.currentTimeMillis();
				logger.info("====从外部数据源" + out_ds_code + "中同步数据:结束，耗时" + TimeUtil.timeInerval2str(endTime - firstStartTime) + "----");
				String message = "";
				if (success)
				{
					message = "导入成功：本次共导入" + needSaveMainObjList.size() + "条主表数据和" + needSaveDetailObjList.size() + "条子表数据，耗时" + TimeUtil.timeInerval2str(endTime - firstStartTime);
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

				logger.info("====从外部数据源" + out_ds_code + "中同步数据:结束，需要完善对照关系，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - firstStartTime) + "----");

				request.setAttribute("needCompleteMap", needCompleteMap);
				request.setAttribute("out_ds_code", out_ds_code);
				request.getRequestDispatcher("/Rdrecord/needCompleteMap.jsp").forward(request, response);
			}
		} catch (Exception e)
		{
			logger.error(e.getMessage(), e);
		} finally
		{
			// drop表
			dropMainKeysTable(conn_OUT, mainKeysTable);

			MySqlUtil.closeConnection(conn_OUT);
		}
	}

	private void dropMainKeysTable(Connection conn, String mainKeysTable)
	{
		String sql;
		sql = "drop table " + mainKeysTable;
		try
		{
			conn.createStatement().execute(sql);
		} catch (Exception e)
		{
		}
	}

	private void insertKeys(Connection conn_OUT, String[] mainObjKeyValues, String mainKeysTable, String mainKeyColumnName) throws SQLException
	{
		// drop表，不管存不存在
		dropMainKeysTable(conn_OUT, mainKeysTable);

		// 建表
		String sql = "create table " + mainKeysTable + "( " + mainKeyColumnName + " [numeric](18, 0))";
		conn_OUT.createStatement().execute(sql);

		// 主键入库
		sql = "insert into " + mainKeysTable + " values (?)";
		PreparedStatement pstmt = conn_OUT.prepareStatement(sql);

		for (int i = 0; i < mainObjKeyValues.length; i++)
		{
			pstmt.setString(1, mainObjKeyValues[i]);

			pstmt.addBatch();

			if ((i % 5000) == 0)
			{
				pstmt.executeBatch();
			}
		}
		pstmt.executeBatch();
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

	public static void main(String[] args)
	{
		System.out.println(new DataSyncService().getClass().getCanonicalName());
	}
}
