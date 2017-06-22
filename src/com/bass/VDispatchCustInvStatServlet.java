package com.bass;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.bass.searchcondition.VDispatchCustInvStatSearchCondition;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class VDispatchCustInvStatServlet extends AbstractBaseServletTemplate
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
		return com.bass.obj.VDispatchCustInvStatObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.bass.searchcondition.VDispatchCustInvStatSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String sql = getSql();

		List dataList = getDomainDao().searchBySql(getDomainInstanceClz(), sql);

		PaginationObj domainPagination = new PaginationObj(dataList, dataList.size(), 1, Integer.MAX_VALUE);

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_SEARCH_CONDITION, domainSearchCondition);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		// 转向
		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + ".jsp").forward(request, response);
	}

	private String getSql() throws Exception
	{
		String sql = getBaseSql();

		String where = " 1=1 ";
		where += MyBeanUtils.getWhereByBaseSearchCondition(domainSearchCondition, getDomainDao().getTableMetaData(), domainSearchCondition.isUseLike());

		String orderBy = domainSearchCondition.getOrderBy();
		if (StringUtil.isEmpty(orderBy))
		{
			orderBy = StringUtil.getNotEmptyStr(domainInstance.findDefaultOrderBy());
		}

		if (!StringUtil.isEmpty(where))
		{
			sql += " where " + where;
		}
		if (!StringUtil.isEmpty(orderBy))
		{
			sql += " order by " + orderBy;
		}

		return sql;
	}

	private String getBaseSql()
	{
		StringBuffer sql = new StringBuffer();

		VDispatchCustInvStatSearchCondition condition = (VDispatchCustInvStatSearchCondition) domainSearchCondition;

		sql.append(" select  * from (\n");
		sql.append(" select \n");
		sql.append(" 1 as id, \n");
		sql.append(" custclass.cCCCode, \n");
		sql.append(" custclass.cCCName, \n");
		sql.append(" cust.cCusCode, \n");
		sql.append(" cust.cCusName, \n");
		sql.append(" cust.cCusAbbName, \n");
		sql.append(" invc.cInvCCode, \n");
		sql.append(" invc.cInvCName, \n");
		sql.append(" inv.cInvCode, \n");
		sql.append(" inv.cInvName, \n");
		sql.append(" inv.cInvStd, \n");
		sql.append(" inv.cComUnitCode, \n");
		sql.append(" cu.cComUnitName, \n");
		sql.append(" dl.iCount, \n");
		sql.append(" dl.iQuantity, \n");
		sql.append(" dl.iSum \n");
		sql.append(" from \n");
		sql.append(" ( \n");
		sql.append(" 	select  \n");
		
		if (condition.GROUP_BY_CUST.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	dl.cCusCode, \n");
			sql.append(" 	'' cInvCode, \n");
		}
		if (condition.GROUP_BY_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	'' cCusCode, \n");
			sql.append(" 	dls.cInvCode, \n");
		}
		if (condition.GROUP_BY_CUST_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	dl.cCusCode, \n");
			sql.append(" 	dls.cInvCode, \n");
		}
		
		sql.append(" 	COUNT(*) iCount, \n");
		sql.append(" 	sum(dls.iQuantity) iQuantity, \n");
		sql.append(" 	sum(dls.iSum) iSum \n");
		sql.append(" 	from  \n");
		sql.append(" 	DispatchList dl \n");
		sql.append(" 	left join \n");
		sql.append(" 	DispatchLists dls \n");
		sql.append(" 	on dl.DLID=dls.DLID \n");
		sql.append(" 	where \n");
		sql.append(" 	dls.cInvCode is not null \n");
		// date clause
		if (condition.getDdate_min() != null)
		{
			sql.append(" 	and dDate>='" + TimeUtil.date2str(condition.getDdate_min(), "yyyy-MM-dd 00:00:00") + "' \n");
		}
		if (condition.getDdate_max() != null)
		{
			sql.append(" 	and dDate<='" + TimeUtil.date2str(condition.getDdate_max(), "yyyy-MM-dd 23:59:59") + "' \n");
		}
		// group by
		sql.append(" 	group by \n");
		if (condition.GROUP_BY_CUST.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	dl.cCusCode \n");
		} else if (condition.GROUP_BY_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	dls.cInvCode \n");
		} else if (condition.GROUP_BY_CUST_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	dl.cCusCode, \n");
			sql.append(" 	dls.cInvCode \n");
		}
		sql.append(" ) dl \n");
		sql.append(" left join \n");
		sql.append(" Customer cust \n");
		sql.append(" on dl.cCusCode=cust.cCusCode \n");
		sql.append(" left join CustomerClass custclass \n");
		sql.append(" on cust.cCCCode=custclass.cCCCode \n");
		sql.append(" left join inventory inv \n");
		sql.append(" on inv.cInvCode=dl.cInvCode \n");
		sql.append(" left join InventoryClass invc \n");
		sql.append(" on inv.cInvCCode=invc.cInvCCode \n");
		sql.append(" left join ComputationUnit cu \n");
		sql.append(" on inv.cComUnitCode=cu.cComunitCode \n");
		sql.append(" ) t \n");

		return sql.toString();
	}

	// 选择
	public void select4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.select(request, response);
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
		super.exportFromHtml(request, response);
	}

}
