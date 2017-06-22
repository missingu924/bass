package com.u8;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.u8.obj.ApClosebillObj;
import com.u8.obj.ApClosebillsObj;
import com.u8.searchcondition.AbstractDataSyncSearchCondition;
import com.u8.searchcondition.ApClosebillSearchCondition;
import com.u8.service.DataSyncService;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.BaseSearchCondition;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.MySqlUtil;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class ApClosebillServlet extends AbstractDataSyncServlet
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
		return com.u8.obj.ApClosebillObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.u8.searchcondition.ApClosebillSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 当月第一天
		ApClosebillSearchCondition condition = (ApClosebillSearchCondition) domainSearchCondition;
		if (condition.getDvouchdate_min() == null)
		{
			condition.setDvouchdate_min(TimeUtil.getTimeStamp(TimeUtil.nowTime2str("yyyy-MM-01")));
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

	// 同步数据
	public void dataImport2U8(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DataSyncService service = new DataSyncService();

		AbstractDataSyncSearchCondition condition = (AbstractDataSyncSearchCondition) domainSearchCondition;

		Map<String, String> mainObjColumnMap = new HashMap<String, String>();
		mainObjColumnMap.put("cdeptcode", "部门档案");
		mainObjColumnMap.put("cperson", "业务员档案");
		mainObjColumnMap.put("csscode", "结算方式");

		Map<String, String> detailObjColumnMap = new HashMap<String, String>();
		detailObjColumnMap.put("cdepcode", "部门档案");
		detailObjColumnMap.put("cpersoncode", "业务员档案");

		// 48收款，49付款；收款对应的是 客户档案 ，付款对应的是 供应商档案
		ApClosebillObj instance = (ApClosebillObj) domainInstance;
		if ("48".equalsIgnoreCase(instance.getCvouchtype()))
		{
			mainObjColumnMap.put("cdwcode", "客户档案");
			detailObjColumnMap.put("ccusven", "客户档案");
		} else if ("49".equalsIgnoreCase(instance.getCvouchtype()))
		{
			mainObjColumnMap.put("cdwcode", "供应商档案");
			detailObjColumnMap.put("ccusven", "供应商档案");
			detailObjColumnMap.put("cdefine23", "存货档案");
		}

		service.syncDataFromOutDs(request, response, condition, condition.getDomainObj().getClass(), condition.getDomainObj().findChildClz(), mainObjColumnMap, detailObjColumnMap, null);
	}

	// 增加红字付款单
	public void addRed4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ApClosebillObj mainObj = (ApClosebillObj) domainInstance;

		long maxCvouchid = getMaxCvouchid();
		String cvouchid = StringUtil.fillStringFromLeft((++maxCvouchid) + "", '0', 10);
		mainObj.setCvouchid(cvouchid);
		mainObj.setIpaytype(1l);
		mainObj.setCvouchtype("49");// 付款单
		mainObj.setDvouchdate(TimeUtil.nowTime2TimeStamp());
		mainObj.setIperiod(TimeUtil.nowTime2str("M"));
		mainObj.setCexch_name("人民币");
		mainObj.setCoperator(currentUser.getName());// 待明确
		mainObj.setCflag("AR");// AR(Accounting Receivable)是应收、AP(Accounting Payable)是应付、GL(General Ledger)是总帐的意思.
		mainObj.setBfrombank(false);
		mainObj.setBtobank(false);
		mainObj.setBsure(false);
		mainObj.setVt_id(8052l);
		mainObj.setIprintcount(0l);

		mainObj.setIamount_f(mainObj.getIamount());
		mainObj.setIramount(mainObj.getIamount());
		mainObj.setIramount_f(mainObj.getIamount_f());

		// iPayType (U8110) 付款类型 
		// cVouchType (U861) 单据类型编码 
		// cVouchID (U861) 单据编号 
		// dVouchDate (U861) 单据日期 
		// iPeriod (U861) 会计期间 
		// cDwCode (U861) 单位编码 
		// cexch_name (U861) 币种名称 
		// cOperator (U861) 录入人 
		// cFlag (U861) 应收应付标志 
		// iID (U861) 主表标识 
		// bFromBank (U861) 银行导入标志 
		// bToBank (U861) 导出银行标志 
		// bSure (U861) 银行确认标志 
		// VT_ID (U861) 单据模版号 

		ApClosebillsObj detailObj = (ApClosebillsObj) mainObj.findChildren().get(0);

		detailObj.setIfaresettled_f(0d);
		detailObj.setItype("0");
		detailObj.setBprepay(false);
		detailObj.setIamt(mainObj.getIamount());
		detailObj.setIamt_f(mainObj.getIamount_f());
		detailObj.setIramt(mainObj.getIramount());
		detailObj.setIramt_f(mainObj.getIramount_f());

		// ifaresettled_f (U8110) 费用结算金额 
		// iID (U861) 主表标识 
		// ID (U861) 子表标识 
		// iType (U861) 款项类型号 
		// bPrePay (U861) 预收预付标志 
		// cCusVen (U861) 客户或供应商编码 
		// iAmt_f (U861) 原币金额 
		// iAmt (U861) 本币金额 
		// iRAmt_f (U861) 原币余额 
		// iRAmt (U861) 本币余额 

		boolean rst = getDomainDao().save(mainObj);

		// response.setCharacterEncoding("gbk");
		response.getWriter().print("红字付款单保存" + (rst ? "成功" : "出问题了") + "!");
	}

	private long getMaxCvouchid()
	{
		String sql = "select cast(MAX(cvouchid) as numeric) cvouchid from " + domainInstance.findTableName();
		Connection conn = null;
		try
		{
			conn = MySqlUtil.getConnection(SystemConstant.U8_DB);
			ResultSet rst = conn.createStatement().executeQuery(sql);
			if (rst.next())
			{
				return rst.getLong(1);
			}
		} catch (Exception e)
		{
			MySqlUtil.closeConnection(conn);
		}

		return 0;
	}
}
