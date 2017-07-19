package com.bass;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bass.searchcondition.VDispatchCustInvYoySearchCondition;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class VDispatchCustInvYoyServlet extends AbstractBaseServletTemplate
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
		return com.bass.obj.VDispatchCustInvYoyObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.bass.searchcondition.VDispatchCustInvYoySearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// super.list(request,response);

		VDispatchCustInvYoySearchCondition condition = (VDispatchCustInvYoySearchCondition) domainSearchCondition;

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

		VDispatchCustInvYoySearchCondition condition = (VDispatchCustInvYoySearchCondition) domainSearchCondition;

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
		sql.append(" (t.year_00_inatsum/(case when t.year_01_inatsum=0 then 1 else year_01_inatsum end)-1)*100 year_00_inatsum_yoy, \n");
		sql.append(" (t.year_01_inatsum/(case when t.year_02_inatsum=0 then 1 else year_02_inatsum end)-1)*100 year_01_inatsum_yoy, \n");
		sql.append(" (t.year_02_inatsum/(case when t.year_03_inatsum=0 then 1 else year_03_inatsum end)-1)*100 year_02_inatsum_yoy, \n");
		sql.append(" (t.year_03_inatsum/(case when t.year_04_inatsum=0 then 1 else year_04_inatsum end)-1)*100 year_03_inatsum_yoy, \n");
		sql.append(" (t.year_04_inatsum/(case when t.year_05_inatsum=0 then 1 else year_05_inatsum end)-1)*100 year_04_inatsum_yoy, \n");
		sql.append(" (t.year_05_inatsum/(case when t.year_06_inatsum=0 then 1 else year_06_inatsum end)-1)*100 year_05_inatsum_yoy, \n");
		sql.append(" (t.year_06_inatsum/(case when t.year_07_inatsum=0 then 1 else year_07_inatsum end)-1)*100 year_06_inatsum_yoy, \n");
		sql.append(" (t.year_07_inatsum/(case when t.year_08_inatsum=0 then 1 else year_08_inatsum end)-1)*100 year_07_inatsum_yoy, \n");
		sql.append(" (t.year_08_inatsum/(case when t.year_09_inatsum=0 then 1 else year_09_inatsum end)-1)*100 year_08_inatsum_yoy, \n");
		sql.append(" (t.year_09_inatsum/(case when t.year_10_inatsum=0 then 1 else year_10_inatsum end)-1)*100 year_09_inatsum_yoy, \n");
		sql.append(" (t.year_10_inatsum/(case when t.year_11_inatsum=0 then 1 else year_11_inatsum end)-1)*100 year_10_inatsum_yoy \n");
		sql.append(" from \n");
		sql.append(" ( \n");
		sql.append(" select \n");
		sql.append(" 	" + code + ", \n");
		sql.append(" 	SUM(case when year_interval=0 then iNatSum else null end) as year_00_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=1 then iNatSum else null end) as year_01_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=2 then iNatSum else null end) as year_02_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=3 then iNatSum else null end) as year_03_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=4 then iNatSum else null end) as year_04_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=5 then iNatSum else null end) as year_05_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=6 then iNatSum else null end) as year_06_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=7 then iNatSum else null end) as year_07_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=8 then iNatSum else null end) as year_08_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=9 then iNatSum else null end) as year_09_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=10 then iNatSum else null end) as year_10_inatsum, \n");
		sql.append(" 	SUM(case when year_interval=11 then iNatSum else null end) as year_11_inatsum, \n");
		sql.append(" 	SUM(iNatSum) year_inatsum \n");
		sql.append(" 	from \n");
		sql.append(" 	( \n");
		sql.append(" 		select " + condition.getIyear() + "-YEAR(dDate) year_interval, DATENAME(year,dDate) iyear,DATENAME(month,dDate) imonth,cCusCode,cInvCode,cPersonCode,iQuantity,iNatSum/10000 iNatSum from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where iNatSum<>0 \n");
		sql.append(" 	) t \n");
		sql.append(" 	where  \n");
		sql.append(" 	iyear>=" + (condition.getIyear() - 11) + " and iyear<=" + condition.getIyear() + " \n");
		sql.append(" 	group by \n");
		sql.append(" 	" + code + " \n");
		sql.append(" ) t \n");
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
