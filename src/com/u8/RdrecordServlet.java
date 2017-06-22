package com.u8;

import java.beans.PropertyDescriptor;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;

import com.sun.org.apache.commons.beanutils.BeanUtils;
import com.u8.obj.RdrecordObj;
import com.u8.searchcondition.RdrecordSearchCondition;
import com.u8.service.RdrecordService;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class RdrecordServlet extends AbstractBaseServletTemplate
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
		return com.u8.obj.RdrecordObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.u8.searchcondition.RdrecordSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// super.list(request, response);

		String out_ds_code = request.getParameter("out_ds_code");

		PaginationObj domainPaginationOut = PaginationObj.NULL_PAGE;
		domainPaginationOut.setPageCount(domainSearchCondition.getPageCount());

		RdrecordSearchCondition condition = (RdrecordSearchCondition) domainSearchCondition;
		String where = " 1=1 ";
		if (condition.getDdate_min() != null)
		{
			where += " and ddate>='" + TimeUtil.date2str(condition.getDdate_min()) + "'";
		}
		if (condition.getDdate_max() != null)
		{
			where += " and ddate<='" + TimeUtil.date2str(condition.getDdate_max()) + "'";
		}

		// 外部系统数据
		if (!StringUtil.isEmpty(out_ds_code))
		{
			domainPaginationOut = new DefaultBaseDAO(RdrecordObj.class, out_ds_code).searchPaginationByClause(getDomainInstanceClz(), where, null, domainSearchCondition.getPageNo(), domainSearchCondition.getPageCount());
		}

		// 用友系统数据
		PaginationObj domainPaginationU8 = new DefaultBaseDAO(RdrecordObj.class, SystemConstant.U8_DB).searchPaginationByClause(getDomainInstanceClz(), where, null, domainSearchCondition.getPageNo(), domainSearchCondition.getPageCount());

		for (int i = 0; i < domainPaginationOut.getDataList().size(); i++)
		{
			RdrecordObj outRd = (RdrecordObj) domainPaginationOut.getDataList().get(i);
			outRd.setAlreadysaved("否");
			for (int j = 0; j < domainPaginationU8.getDataList().size(); j++)
			{
				RdrecordObj u8Rd = (RdrecordObj) domainPaginationU8.getDataList().get(j);
				if (StringUtil.getNotEmptyStr(u8Rd.getCcode()).equalsIgnoreCase(outRd.getCcode()))
				{
					outRd.setAlreadysaved("是");
					break;
				}
			}
		}

		// 筛选 是否 已导入
		String alreadysaved = request.getParameter("alreadysaved");
		if (!StringUtil.isEmpty(alreadysaved))
		{
			List list = new ArrayList();
			for (int i = 0; i < domainPaginationOut.getDataList().size(); i++)
			{
				RdrecordObj outRd = (RdrecordObj) domainPaginationOut.getDataList().get(i);
				if (alreadysaved.equalsIgnoreCase(outRd.getAlreadysaved()))
				{
					list.add(outRd);
				}
			}

			domainPaginationOut.setDataList(list);
			domainPaginationOut.setTotalCount(list.size());
		}

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_SEARCH_CONDITION, domainSearchCondition);
		request.setAttribute(DOMAIN_PAGINATION, domainPaginationOut);

		// 转向
		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + ".jsp").forward(request, response);
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
	public void sync4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		RdrecordService service = new RdrecordService();

		service.syncDataFromOutDs(request, response, (RdrecordSearchCondition) domainSearchCondition);
	}
}
