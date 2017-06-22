package com.u8.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.hcp.obj.HcpDataSourceBaseInfoMapDetailObj;
import com.hcp.obj.HcpDataSourceBaseInfoMapObj;
import com.hcp.obj.HcpDataSourceBaseInfoObj;
import com.hcp.util.HcpDataSourceBaseInfoMapDetailUtil;
import com.u8.obj.RdrecordObj;
import com.u8.obj.RdrecordsObj;
import com.u8.searchcondition.Rdrecord01SearchCondition;
import com.u8.searchcondition.RdrecordSearchCondition;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;
import com.wuyg.dictionary.DictionaryUtil;

public class RdrecordService
{
	private Logger logger = Logger.getLogger(getClass());

	public void syncDataFromOutDs(HttpServletRequest request, HttpServletResponse response, RdrecordSearchCondition condition) throws Exception
	{
		// 本次需要入库的数据
		List<RdrecordObj> needSaveMainDataList = new ArrayList<RdrecordObj>();
		List<RdrecordsObj> needSaveDetailDataList = new ArrayList<RdrecordsObj>();

		// 外部数据源编码
		String out_ds_code = condition.getOut_ds_code();

		long startTime = System.currentTimeMillis();
		logger.info("====从外部数据源" + out_ds_code + "中同步数据:开始----");

		// 需要补充完善的对照关系
		Map<String, Integer> needCompleteMap = new LinkedHashMap<String, Integer>();

		// ========主表处理========
		// 1、从外部系统查询到所有符合条件的记录
		IBaseDAO rdMainDao = new DefaultBaseDAO(RdrecordObj.class, SystemConstant.U8_DB);
		IBaseDAO rdMainOutDao = new DefaultBaseDAO(RdrecordObj.class, out_ds_code);
		IBaseDAO rdDetailOutDao = new DefaultBaseDAO(RdrecordsObj.class, out_ds_code);

		// 外部数据
		String keyColumnname = condition.getDomainObj().findKeyColumnName();
		String[] keyValues = request.getParameterValues(keyColumnname);// 前台选择的
		condition.setOtherWhere(StringUtil.getInSql(keyColumnname, Arrays.asList(keyValues)));
		List<RdrecordObj> rdMainOutList = rdMainOutDao.searchPaginationByCondition(condition).getDataList();
		logger.info("----主表：从外部数据源" + out_ds_code + "中查询符合条件的主表数据共计" + rdMainOutList.size() + "条----");
		// 用友数据，根据cCode查询
		List<String> cCodeList = new ArrayList<String>();
		for (int i = 0; i < rdMainOutList.size(); i++)
		{
			cCodeList.add(rdMainOutList.get(i).getCcode());
		}
		List<RdrecordObj> rdMainList = rdMainDao.searchByClause(RdrecordObj.class, " cCode in(" + StringUtil.getStringByList(cCodeList, true) + ")", null, 0, Integer.MAX_VALUE);
		logger.info("----主表：从用友系统中查询已经入库的数据共计" + rdMainList.size() + "条，外部系统需要新入库的数据" + (rdMainOutList.size() - rdMainList.size()) + "条----");

		if (rdMainOutList.size() <= rdMainList.size())
		{
			logger.info("----主表：没有需要新入库的数据----");
			request.setAttribute("message", "本次查询出的" + rdMainOutList.size() + "条数据之前均已导入用友系统，因此没有需要新导入的数据");
			request.getRequestDispatcher("/Rdrecord/syncDataResult.jsp").forward(request, response);
			return;
		}

		for (int i = 0; i < rdMainOutList.size(); i++)
		{
			RdrecordObj rdMainOut = rdMainOutList.get(i);

			// 2、是否已经在用友系统存在，如果已经存在则不处理，如果用友系统不存在，则继续处理
			if (isInU8(rdMainOut, rdMainList))
			{
				logger.info("----主表：cCode=" + rdMainOut.getCcode() + "的数据在用友系统中已经存在，不处理----");
				continue;
			} else
			{
				logger.info("----主表：cCode=" + rdMainOut.getCcode() + "的数据在用友系统中不存在，需要处理----");
			}

			// 3、检查需要对照的字段是否已经有对照关系，对照关系不全的，进行提示，字典中的key的格式为:src_ds_code=U8_DB,base_info_type_code=部门档案,src_code=01
			// cWhCode
			String base_info_type_code = "库房档案";
			String dst_cwhcode = HcpDataSourceBaseInfoMapDetailUtil.getDstcode(out_ds_code, SystemConstant.U8_DB, base_info_type_code, rdMainOut.getCwhcode(), needCompleteMap);
			if (!StringUtil.isEmpty(dst_cwhcode))
			{
				rdMainOut.setCwhcode(dst_cwhcode);
			}
			// cDepCode
			base_info_type_code = "部门档案";
			String dst_cdepcode = HcpDataSourceBaseInfoMapDetailUtil.getDstcode(out_ds_code, SystemConstant.U8_DB, base_info_type_code, rdMainOut.getCdepcode(), needCompleteMap);
			if (!StringUtil.isEmpty(dst_cdepcode))
			{
				rdMainOut.setCdepcode(dst_cdepcode);
			}
			// cVenCode
			base_info_type_code = "供应商档案";
			String dst_cvencode = HcpDataSourceBaseInfoMapDetailUtil.getDstcode(out_ds_code, SystemConstant.U8_DB, base_info_type_code, rdMainOut.getCvencode(), needCompleteMap);
			if (!StringUtil.isEmpty(dst_cvencode))
			{
				rdMainOut.setCvencode(dst_cvencode);
			}

			// 4、对照关系齐全则可以入库
			needSaveMainDataList.add(rdMainOut);
		}

		// ========子表处理========
		// 1、从外部系统查询到所有符合条件的记录
		List<String> mainIdList = new ArrayList<String>();
		for (int i = 0; i < needSaveMainDataList.size(); i++)
		{
			mainIdList.add(needSaveMainDataList.get(i).getId() + "");
		}
		List<RdrecordsObj> rdDetailOutList = rdDetailOutDao.searchByClause(RdrecordsObj.class, " id in(" + StringUtil.getStringByList(mainIdList, true) + ")", null, 0, Integer.MAX_VALUE);
		logger.info("----子表：从外部数据源" + out_ds_code + "中查询符合条件的子表数据共计" + rdDetailOutList.size() + "条----");

		// 2、检查需要对照的字段是否已经有对照关系
		for (int i = 0; i < rdDetailOutList.size(); i++)
		{
			RdrecordsObj rdDetailOut = rdDetailOutList.get(i);

			// cVendorCode
			String base_info_type_code = "供应商档案";
			String dst_cvendorcode = HcpDataSourceBaseInfoMapDetailUtil.getDstcode(out_ds_code, SystemConstant.U8_DB, base_info_type_code, rdDetailOut.getCvendorcode(), needCompleteMap);
			if (!StringUtil.isEmpty(dst_cvendorcode))
			{
				rdDetailOut.setCvendorcode(dst_cvendorcode);
			}
			// cInvCode
			base_info_type_code = "耗材档案";
			String dst_cinvcode = HcpDataSourceBaseInfoMapDetailUtil.getDstcode(out_ds_code, SystemConstant.U8_DB, base_info_type_code, rdDetailOut.getCinvcode(), needCompleteMap);
			if (!StringUtil.isEmpty(dst_cinvcode))
			{
				rdDetailOut.setCinvcode(dst_cinvcode);
			}

			// 3、对照关系齐全则可以入库
			needSaveDetailDataList.add(rdDetailOut);
		}

		// 所有对照关系正常，则可以进行数据入库
		boolean success = true;
		if (needCompleteMap.size() == 0)
		{
			for (int i = 0; i < needSaveMainDataList.size(); i++)
			{
				RdrecordObj rdMain = needSaveMainDataList.get(i);

				long mainIdOld = rdMain.getId();

				rdMain.setKeyValue(null);// 清除原来主键的值
				rdMain.setCvouchtype("01");
				rdMain.setCsource("库存");
				rdMain.setBtransflag(false);
				rdMain.setBisstqc(false);

				success &= rdMain.save(SystemConstant.U8_DB);

				long mainIdNew = rdMain.getId();

				for (int j = 0; j < needSaveDetailDataList.size(); j++)
				{
					RdrecordsObj rdDetail = needSaveDetailDataList.get(j);
					if (rdDetail.getId().longValue() == mainIdOld)
					{
						rdDetail.setKeyValue(null);// 清除原来主键的值

						rdDetail.setId(mainIdNew);
						rdDetail.setIbillsettlecount(0l);
						rdDetail.setImatsettlestate(0l);
						rdDetail.setIflag("0");
						
						// 如果子表税率为空则使用主表税率
						if (rdDetail.getItaxrate()==null)
						{
							rdDetail.setItaxrate(rdMain.getItaxrate());
						}

						success &= rdDetail.save(SystemConstant.U8_DB);
					}
				}
			}

			long endTime = System.currentTimeMillis();
			logger.info("====从外部数据源" + out_ds_code + "中同步数据:结束，耗时" + TimeUtil.timeInerval2str(endTime - startTime) + "----");
			String message = "";
			if (success)
			{
				message = "导入成功：本次查询出的" + rdMainOutList.size() + "条主表数据，有" + (rdMainList.size()) + "条之前已经导入用友系统，本次共导入" + needSaveMainDataList.size() + "条主表数据和" + needSaveDetailDataList.size() + "条子表数据，耗时" + TimeUtil.timeInerval2str(endTime - startTime);
			} else
			{
				message = "导入过程中出现异常，请联系软件开发厂商技术人员解决。";
			}
			request.setAttribute("message", message);
			request.getRequestDispatcher("/Rdrecord/syncDataResult.jsp").forward(request, response);
		} else
		{
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

	private boolean isInU8(RdrecordObj rdMainOut, List<RdrecordObj> rdMainList)
	{
		for (int i = 0; i < rdMainList.size(); i++)
		{
			if (rdMainOut.getCcode() != null && rdMainOut.getCcode().equalsIgnoreCase(rdMainList.get(i).getCcode()))
			{
				return true;
			}
		}

		return false;
	}
}
