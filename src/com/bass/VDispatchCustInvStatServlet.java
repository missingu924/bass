package com.bass;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
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
		VDispatchCustInvStatSearchCondition condition = (VDispatchCustInvStatSearchCondition) domainSearchCondition;

		// 如果有iYear,iMonth
		if (condition.getIyear() != null && condition.getImonth() != null)
		{
			condition.setDdate_min(new Timestamp(TimeUtil.getTheFirstDayOfTheMonth(condition.getIyear(), condition.getImonth()).getTime()));
			condition.setDdate_max(new Timestamp(TimeUtil.getTheLastDayOfTheMonth(condition.getIyear(), condition.getImonth()).getTime()));
		}

		// 如果没输入时间
		Calendar cal = Calendar.getInstance();
		if (condition.getDdate_min() == null)
		{
			condition.setDdate_min(new Timestamp(TimeUtil.getTheFirstDayOfTheMonth(cal.get(cal.YEAR), cal.get(cal.MONTH) + 1).getTime()));
		}
		if (condition.getDdate_max() == null)
		{
			condition.setDdate_max(new Timestamp(TimeUtil.getTheLastDayOfTheMonth(cal.get(cal.YEAR), cal.get(cal.MONTH) + 1).getTime()));
		}

		// 构造sql
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
		String where = " 1=1 ";
		where += MyBeanUtils.getWhereByBaseSearchCondition(domainSearchCondition, getDomainDao().getTableMetaData(), domainSearchCondition.isUseLike());

		String orderBy = domainSearchCondition.getOrderBy();
		if (StringUtil.isEmpty(orderBy))
		{
			orderBy = StringUtil.getNotEmptyStr(domainInstance.findDefaultOrderBy());
		}

		String sql = getBaseSql(where, orderBy);

		return sql;
	}

	private String getBaseSql(String where, String orderBy)
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
		sql.append(" dl.cpersoncode, \n");
		sql.append(" isnull(ps.cpersonname,'其他') cpersonname, \n");
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
			sql.append(" 	'' cPersonCode, \n");
		}
		if (condition.GROUP_BY_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	'' cCusCode, \n");
			sql.append(" 	dl.cInvCode, \n");
			sql.append(" 	'' cPersonCode, \n");
		}
		if (condition.GROUP_BY_CUST_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	dl.cCusCode, \n");
			sql.append(" 	dl.cInvCode, \n");
			sql.append(" 	'' cPersonCode, \n");
		}
		if (condition.GROUP_BY_PERSON.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	'' cCusCode, \n");
			sql.append(" 	'' cInvCode, \n");
			sql.append(" 	dl.cPersonCode, \n");
		}

		sql.append(" 	COUNT(*) iCount, \n");
		sql.append(" 	isnull(sum(dl.iQuantity),0) iQuantity, \n");
		sql.append(" 	isnull(sum(dl.iNatSum)/10000,0) iSum \n");
		sql.append(" 	from  \n");
		sql.append(" 	(select dl.dDate,dl.cCusCode,dl.cPersonCode,dls.cInvCode,inv.cInvName,cust.cCusName,ps.cPersonName,dls.iQuantity,dls.iNatSum from dispatchlist dl left join DispatchLists dls on dl.DLID=dls.DLID left join Inventory inv on dls.cInvCode=inv.cInvCode left join Customer cust on dl.cCusCode=cust.cCusCode left join Person ps on dl.cPersonCode=ps.cPersonCode) dl \n");
		if (!StringUtil.isEmpty(where))
		{
			sql.append(" 	 where " + where + "\n");
		}
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
			sql.append(" 	dl.cInvCode \n");
		} else if (condition.GROUP_BY_CUST_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	dl.cCusCode, \n");
			sql.append(" 	dl.cInvCode \n");
		}
		else if (condition.GROUP_BY_PERSON.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" 	dl.cPersonCode \n");
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
		sql.append(" left join Person ps \n");
		sql.append(" on dl.cPersonCode=ps.cPersonCode \n");
		sql.append(" ) t \n");
		
		if (!StringUtil.isEmpty(orderBy))
		{
			sql.append(" order by " + orderBy + " \n");
		}

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
