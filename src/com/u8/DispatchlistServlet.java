package com.u8;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.u8.searchcondition.DispatchlistSearchCondition;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class DispatchlistServlet extends AbstractDataSyncServlet
{
	private Logger logger = Logger.getLogger(getClass());

	@Override
	public String getBasePath()
	{
		return domainInstance.getBasePath();
	}

	@Override
	public IBaseDAO getDomainDao()
	{
		return new DefaultBaseDAO(getDomainInstanceClz(), SystemConstant.U8_DB);
	}

	@Override
	public Class getDomainInstanceClz()
	{
		return com.u8.obj.DispatchlistObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.u8.searchcondition.DispatchlistSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// super.list(request, response);

		// 当月第一天
		DispatchlistSearchCondition condition = (DispatchlistSearchCondition) domainSearchCondition;
		if (condition.getDdate_min() == null)
		{
			condition.setDdate_min(TimeUtil.getTimeStamp(TimeUtil.nowTime2str("yyyy-MM-01")));
		}

		super.list4sync(request, response);
	}

	// 检查ID是否已录入系统
	public void checkId4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.checkId(request, response);
	}

	// 增加 or 修改
	public void addOrModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.addOrModify(request, response);
	}

	// 修改前查询领域对象信息
	public void preModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.preModify(request, response);
	}

	// 详情
	public void detail4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.detail(request, response);
	}

	// 删除
	public void delete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.delete(request, response);
	}

	// 批量删除
	public void batchDelete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.batchDelete(request, response);
	}

	// 删除 按前台条件查出的所有数据
	public void deleteAll4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.deleteAll(request, response);
	}

	// 导出
	public void export4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.export(request, response);
	}

//	// 同步数据
//	public void dataImport2U8(HttpServletRequest request, HttpServletResponse response) throws Exception
//	{
//		DataSyncService service = new DataSyncService();
//
//		BaseSearchCondition condition = domainSearchCondition;
//		Class mainObjClz = DispatchlistObj.class;
//		Class detailObjClz = DispatchlistsObj.class;
//		Map<String, String> mainObjColumnMap = new HashMap<String, String>();
//		mainObjColumnMap.put("cdepcode", "部门档案");
//		mainObjColumnMap.put("ccuscode", "客户档案");
//		mainObjColumnMap.put("cpersoncode", "业务员档案");
//		mainObjColumnMap.put("csscode", "结算方式");
//
//		Map<String, String> detailObjColumnMap = new HashMap<String, String>();
//		detailObjColumnMap.put("cwhcode", "仓库档案");
//		detailObjColumnMap.put("cinvcode", "存货档案");
//
//		IDataSyncExtendService extendService = new DataSyncExtendService4Dispatchlist();
//
//		service.syncDataFromOutDs(request, response, condition, mainObjClz, detailObjClz, mainObjColumnMap, detailObjColumnMap, extendService);
//	}
}
