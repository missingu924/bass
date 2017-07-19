package com.bass;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.bass.searchcondition.VDispatchCustInvMomSearchCondition;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class VDispatchCustInvMomServlet extends AbstractBaseServletTemplate
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
		return com.bass.obj.VDispatchCustInvMomObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.bass.searchcondition.VDispatchCustInvMomSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// super.list(request, response);

		VDispatchCustInvMomSearchCondition condition = (VDispatchCustInvMomSearchCondition) domainSearchCondition;

		if (condition.getIyear() == null)
		{
			condition.setIyear(StringUtil.parseInt(TimeUtil.nowTime2str("yyyy")));
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
		StringBuffer sql = new StringBuffer();

		VDispatchCustInvMomSearchCondition condition = (VDispatchCustInvMomSearchCondition) domainSearchCondition;

		String code = "cInvCode";
		String name = "cInvName";
		if (condition.GROUP_BY_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			code = "cInvCode";
			name = "cInvName";
		} else if (condition.GROUP_BY_CUST.equalsIgnoreCase(condition.getGroupBy()))
		{
			code = "cCusCode";
			name = "cCusName";
		} else if (condition.GROUP_BY_PERSON.equalsIgnoreCase(condition.getGroupBy()))
		{
			code = "cPersonCode";
			name = "cPersonName";
		} else if (condition.GROUP_BY_CUST_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			code = "cCusCode,cInvCode";
			name = "cCusName,cInvName";
		}

		sql.append(" select * from ( \n");
		sql.append(" select t.*, \n");
		sql.append(" " + name + ", \n");
		sql.append(" (t.month_01_inatsum/(case when l.month_01_inatsum=0 then 1 else l.month_01_inatsum end)-1)*100 month_01_inatsum_yoy, \n");
		sql.append(" (t.month_02_inatsum/(case when l.month_02_inatsum=0 then 1 else l.month_02_inatsum end)-1)*100 month_02_inatsum_yoy, \n");
		sql.append(" (t.month_03_inatsum/(case when l.month_03_inatsum=0 then 1 else l.month_03_inatsum end)-1)*100 month_03_inatsum_yoy, \n");
		sql.append(" (t.month_04_inatsum/(case when l.month_04_inatsum=0 then 1 else l.month_04_inatsum end)-1)*100 month_04_inatsum_yoy, \n");
		sql.append(" (t.month_05_inatsum/(case when l.month_05_inatsum=0 then 1 else l.month_05_inatsum end)-1)*100 month_05_inatsum_yoy, \n");
		sql.append(" (t.month_06_inatsum/(case when l.month_06_inatsum=0 then 1 else l.month_06_inatsum end)-1)*100 month_06_inatsum_yoy, \n");
		sql.append(" (t.month_07_inatsum/(case when l.month_07_inatsum=0 then 1 else l.month_07_inatsum end)-1)*100 month_07_inatsum_yoy, \n");
		sql.append(" (t.month_08_inatsum/(case when l.month_08_inatsum=0 then 1 else l.month_08_inatsum end)-1)*100 month_08_inatsum_yoy, \n");
		sql.append(" (t.month_09_inatsum/(case when l.month_09_inatsum=0 then 1 else l.month_09_inatsum end)-1)*100 month_09_inatsum_yoy, \n");
		sql.append(" (t.month_10_inatsum/(case when l.month_10_inatsum=0 then 1 else l.month_10_inatsum end)-1)*100 month_10_inatsum_yoy, \n");
		sql.append(" (t.month_11_inatsum/(case when l.month_11_inatsum=0 then 1 else l.month_11_inatsum end)-1)*100 month_11_inatsum_yoy, \n");
		sql.append(" (t.month_12_inatsum/(case when l.month_12_inatsum=0 then 1 else l.month_12_inatsum end)-1)*100 month_12_inatsum_yoy, \n");
		sql.append(" (t.month_01_inatsum/(case when l.month_12_inatsum=0 then 1 else l.month_12_inatsum end)-1)*100 month_01_inatsum_mom, \n");
		sql.append(" (t.month_02_inatsum/(case when t.month_01_inatsum=0 then 1 else t.month_01_inatsum end)-1)*100 month_02_inatsum_mom, \n");
		sql.append(" (t.month_03_inatsum/(case when t.month_02_inatsum=0 then 1 else t.month_02_inatsum end)-1)*100 month_03_inatsum_mom, \n");
		sql.append(" (t.month_04_inatsum/(case when t.month_03_inatsum=0 then 1 else t.month_03_inatsum end)-1)*100 month_04_inatsum_mom, \n");
		sql.append(" (t.month_05_inatsum/(case when t.month_04_inatsum=0 then 1 else t.month_04_inatsum end)-1)*100 month_05_inatsum_mom, \n");
		sql.append(" (t.month_06_inatsum/(case when t.month_05_inatsum=0 then 1 else t.month_05_inatsum end)-1)*100 month_06_inatsum_mom, \n");
		sql.append(" (t.month_07_inatsum/(case when t.month_06_inatsum=0 then 1 else t.month_06_inatsum end)-1)*100 month_07_inatsum_mom, \n");
		sql.append(" (t.month_08_inatsum/(case when t.month_07_inatsum=0 then 1 else t.month_07_inatsum end)-1)*100 month_08_inatsum_mom, \n");
		sql.append(" (t.month_09_inatsum/(case when t.month_08_inatsum=0 then 1 else t.month_08_inatsum end)-1)*100 month_09_inatsum_mom, \n");
		sql.append(" (t.month_10_inatsum/(case when t.month_09_inatsum=0 then 1 else t.month_09_inatsum end)-1)*100 month_10_inatsum_mom, \n");
		sql.append(" (t.month_11_inatsum/(case when t.month_10_inatsum=0 then 1 else t.month_10_inatsum end)-1)*100 month_11_inatsum_mom, \n");
		sql.append(" (t.month_12_inatsum/(case when t.month_11_inatsum=0 then 1 else t.month_11_inatsum end)-1)*100 month_12_inatsum_mom, \n");
		sql.append(" (t.year_inatsum/(case when l.year_inatsum=0 then 1 else l.year_inatsum end)-1)*100 year_inatsum_yoy \n");
		sql.append(" from \n");
		sql.append(" (	 \n");
		sql.append(" 	select \n");
		sql.append(" 	iyear, \n");
		sql.append(" 	" + code + ", \n");
		sql.append(" 	SUM(case when imonth='01' then iNatSum else null end) as month_01_inatsum, \n");
		sql.append(" 	SUM(case when imonth='02' then iNatSum else null end) as month_02_inatsum, \n");
		sql.append(" 	SUM(case when imonth='03' then iNatSum else null end) as month_03_inatsum, \n");
		sql.append(" 	SUM(case when imonth='04' then iNatSum else null end) as month_04_inatsum, \n");
		sql.append(" 	SUM(case when imonth='05' then iNatSum else null end) as month_05_inatsum, \n");
		sql.append(" 	SUM(case when imonth='06' then iNatSum else null end) as month_06_inatsum, \n");
		sql.append(" 	SUM(case when imonth='07' then iNatSum else null end) as month_07_inatsum, \n");
		sql.append(" 	SUM(case when imonth='08' then iNatSum else null end) as month_08_inatsum, \n");
		sql.append(" 	SUM(case when imonth='09' then iNatSum else null end) as month_09_inatsum, \n");
		sql.append(" 	SUM(case when imonth='10' then iNatSum else null end) as month_10_inatsum, \n");
		sql.append(" 	SUM(case when imonth='11' then iNatSum else null end) as month_11_inatsum, \n");
		sql.append(" 	SUM(case when imonth='12' then iNatSum else null end) as month_12_inatsum, \n");
		sql.append(" 	SUM(iNatSum) year_inatsum \n");
		sql.append(" 	from \n");
		sql.append(" 	( \n");
		sql.append(" 		select DATENAME(year,dDate) iyear,DATENAME(month,dDate) imonth,cCusCode,cInvCode,cPersonCode,iQuantity,iNatSum/10000 iNatSum from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where iNatSum<>0 \n");
		sql.append(" 	) t \n");
		sql.append(" 	where  \n");
		sql.append(" 	iyear='" + (condition.getIyear()) + "' \n");
		sql.append(" 	group by \n");
		sql.append(" 	iyear, \n");
		sql.append(" 	" + code + " \n");
		sql.append(" ) t \n");
		sql.append(" left join \n");
		sql.append(" ( \n");
		sql.append(" 	select \n");
		sql.append(" 	iyear, \n");
		sql.append(" 	" + code + ", \n");
		sql.append(" 	SUM(case when imonth='01' then iNatSum else null end) as month_01_inatsum, \n");
		sql.append(" 	SUM(case when imonth='02' then iNatSum else null end) as month_02_inatsum, \n");
		sql.append(" 	SUM(case when imonth='03' then iNatSum else null end) as month_03_inatsum, \n");
		sql.append(" 	SUM(case when imonth='04' then iNatSum else null end) as month_04_inatsum, \n");
		sql.append(" 	SUM(case when imonth='05' then iNatSum else null end) as month_05_inatsum, \n");
		sql.append(" 	SUM(case when imonth='06' then iNatSum else null end) as month_06_inatsum, \n");
		sql.append(" 	SUM(case when imonth='07' then iNatSum else null end) as month_07_inatsum, \n");
		sql.append(" 	SUM(case when imonth='08' then iNatSum else null end) as month_08_inatsum, \n");
		sql.append(" 	SUM(case when imonth='09' then iNatSum else null end) as month_09_inatsum, \n");
		sql.append(" 	SUM(case when imonth='10' then iNatSum else null end) as month_10_inatsum, \n");
		sql.append(" 	SUM(case when imonth='11' then iNatSum else null end) as month_11_inatsum, \n");
		sql.append(" 	SUM(case when imonth='12' then iNatSum else null end) as month_12_inatsum, \n");
		sql.append(" 	SUM(iNatSum) year_inatsum \n");
		sql.append(" 	from \n");
		sql.append(" 	( \n");
		sql.append(" 		select DATENAME(year,dDate) iyear,DATENAME(month,dDate) imonth,cCusCode,cInvCode,cPersonCode,iQuantity,iNatSum/10000 iNatSum from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where iNatSum<>0 \n");
		sql.append(" 	) t \n");
		sql.append(" 	where  \n");
		sql.append(" 	iyear='" + (condition.getIyear() - 1) + "' \n");
		sql.append(" 	group by \n");
		sql.append(" 	iyear, \n");
		sql.append(" 	" + code + " \n");
		sql.append(" ) l \n");
		if (condition.GROUP_BY_CUST_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" on t.cInvCode = l.cInvCode and t.cCusCode=l.cCusCode \n");
		} else
		{
			sql.append(" on t." + code + "=l." + code + " \n");
		}
		if (condition.GROUP_BY_INV.equalsIgnoreCase(condition.getGroupBy()) || condition.GROUP_BY_CUST_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" left join inventory inv on inv.cInvCode=t.cInvCode \n");
		}
		if (condition.GROUP_BY_CUST.equalsIgnoreCase(condition.getGroupBy()) || condition.GROUP_BY_CUST_INV.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" left join customer cust on cust.cCusCode=t.cCusCode \n");
		}
		if (condition.GROUP_BY_PERSON.equalsIgnoreCase(condition.getGroupBy()))
		{
			sql.append(" left join person ps on ps.cPersonCode=t.cPersonCode \n");
		}
		sql.append(") tt \n ");

		String where = " 1=1 ";
		where += MyBeanUtils.getWhereByBaseSearchCondition(domainSearchCondition, getDomainDao().getTableMetaData(), domainSearchCondition.isUseLike());
		if (!StringUtil.isEmpty(where))
		{
			sql.append(" where " + where + "\n");
		}

		String orderBy = StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), code);
		if (!StringUtil.isEmpty(orderBy))
		{
			sql.append(" order by " + orderBy);
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
