package com.bass;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;
import com.wuyg.system.util.SystemConfigUtil;

public class VCurrentStockServlet extends AbstractBaseServletTemplate
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
		// return new DefaultBaseDAO(getDomainInstanceClz(), SystemConstant.U8_DB_01 + "," + SystemConstant.U8_DB_02);
		return new DefaultBaseDAO(getDomainInstanceClz(), SystemConstant.U8_DB);
	}

	@Override
	public Class getDomainInstanceClz()
	{
		return com.bass.obj.VCurrentStockObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.bass.searchcondition.VCurrentStockSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		domainSearchCondition.setOtherWhere(StringUtil.getInSql("cinvccode", SystemConfigUtil.getValueListByName("cs_inventory_class")) + " and  " + StringUtil.getInSql("cwhcode", SystemConfigUtil.getValueListByName("cs_warehourse")));

		String where = MyBeanUtils.getWhereByBaseSearchCondition(domainSearchCondition, getDomainDao().getTableMetaData(), false);

		StringBuffer sql = new StringBuffer();
		sql.append("select * from ( \n");
		sql.append("  select \n");
		sql.append("  GROUPING(autoid) autoid_g, \n");
		sql.append("  GROUPING(cinvcode) cinvcode_g, \n");
		sql.append("  AutoID,  \n");
		sql.append("  max(cWhCode) cWhCode,  \n");
		sql.append("  max(cWhName) cWhName,  \n");
		sql.append("  max(cInvCCode) cInvCCode,  \n");
		sql.append("  max(cInvCName) cInvCName,  \n");
		sql.append("  cInvCode,  \n");
		sql.append("  max(cInvName) cInvName,  \n");
		sql.append("  max(cInvStd) cInvStd,  \n");
		sql.append("  max(cComUnitCode) cComUnitCode,  \n");
		sql.append("  max(expirationDate) expirationDate,  \n");
		sql.append("  max(cComUnitName) cComUnitName,  \n");
		sql.append("  max(cBatch) cBatch,  \n");
		sql.append("  sum(iQuantity) iQuantity,  \n");
		sql.append("  sum(iNum) iNum \n");
		sql.append("  from \n");
		sql.append("  (select   \n");
		sql.append("  cs.AutoID,  \n");
		sql.append("  cs.cWhCode,  \n");
		sql.append("  wh.cWhName,  \n");
		sql.append("  invc.cInvCCode,  \n");
		sql.append("  invc.cInvCName,  \n");
		sql.append("  cs.cInvCode,  \n");
		sql.append("  inv.cInvName,  \n");
		sql.append("  inv.cInvStd,  \n");
		sql.append("  inv.cComUnitCode,  \n");
		sql.append("  inv.cinvDefine9 expirationDate,  \n");
		sql.append("  cu.cComUnitName,  \n");
		sql.append("  cs.cBatch,  \n");
		sql.append("  cs.iQuantity,  \n");
		sql.append("  cs.iNum  \n");
		sql.append("  from   \n");
		sql.append("  currentstock cs  \n");
		sql.append("  left join inventory inv  \n");
		sql.append("  on cs.cInvCode=inv.cInvCode  \n");
		sql.append("  left join inventoryClass invc  \n");
		sql.append("  on inv.cInvCCode=invc.cInvCCode  \n");
		sql.append("  left join Warehouse wh  \n");
		sql.append("  on cs.cWhCode=wh.cWhCode  \n");
		sql.append("  left join ComputationUnit cu  \n");
		sql.append("  on inv.cComUnitCode=cu.cComunitCode  \n");
		sql.append(" ) t \n");
		if (!StringUtil.isEmpty(where))
		{
			sql.append(" where 1=1 " + where);
		}
		sql.append(" group by   \n");
		sql.append("  cInvCode,autoid \n");
		sql.append(" with rollup \n");
		sql.append(" having \n");
		sql.append("  (GROUPING(autoid)=1 and GROUPING(cinvcode)=0) \n");
		sql.append("  or \n");
		sql.append("  (GROUPING(autoid)=0 and GROUPING(cinvcode)=0) \n");
		sql.append(") t \n");

		// super.list(request, response);

		// 查询
		// PaginationObj domainPagination = getDomainDao().searchPaginationByCondition(domainSearchCondition);// 使用like构造条件

		List dataList = getDomainDao().searchBySql(getDomainInstanceClz(), sql.toString());

		PaginationObj domainPagination = new PaginationObj();
		domainPagination.setDataList(dataList);
		domainPagination.setPageCount(domainSearchCondition.getPageCount());
		domainPagination.setTotalCount(dataList.size());

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_SEARCH_CONDITION, domainSearchCondition);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		// 转向
		if ("true".equalsIgnoreCase(request.getParameter("4m")))
		{
			request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + "4m.jsp").forward(request, response);
		} else
		{
			request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + ".jsp").forward(request, response);
		}
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

		// 设置文件名
		request.setAttribute("fileName", "现存量_" + TimeUtil.nowTime2str("yyyyMMdd"));
		super.exportFromHtml(request, response);
	}

}
