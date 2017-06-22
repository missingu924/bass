package com.hcp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.hcp.obj.HcpDataSourceBaseInfoMapDetailObj;
import com.hcp.obj.HcpDataSourceBaseInfoMapObjExtended;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;
import com.wuyg.dictionary.DictionaryUtil;

public class HcpDataSourceBaseInfoMapServlet extends AbstractBaseServletTemplate
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
		return new DefaultBaseDAO(getDomainInstanceClz());
	}

	@Override
	public Class getDomainInstanceClz()
	{
		return com.hcp.obj.HcpDataSourceBaseInfoMapObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.hcp.searchcondition.HcpDataSourceBaseInfoMapSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// super.list(request,response);

		PaginationObj domainPagination = new DefaultBaseDAO(HcpDataSourceBaseInfoMapObjExtended.class).searchPaginationByCondition(domainSearchCondition);// 使用like构造条件

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_SEARCH_CONDITION, domainSearchCondition);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

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
		// 保存或更新
		boolean success = false;
		if (domainInstance.findKeyValue() < 0)
		{
			domainInstance.setKeyValue(getDomainDao().getMaxKeyValue());
			success = getDomainDao().save(domainInstance);
		} else
		{
			success = getDomainDao().update(domainInstance);
		}

		// 声明是新增后转到的详情页面
		request.setAttribute("needRefresh", true);

		// 转向
		if (success)
		{
			detail4this(request, response);
		} else
		{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	// 修改前查询领域对象信息
	public void preModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.preModify(request, response);
	}

	// 详情
	public void detail4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 查询
		Object domainObj = new DefaultBaseDAO(HcpDataSourceBaseInfoMapObjExtended.class).searchByKey(getDomainInstanceClz(), domainInstance.findKeyValue() + "");

		if (domainObj != null)
		{
			request.setAttribute(DOMAIN_INSTANCE, domainObj);
		}

		// 传递needRefresh
		if (request.getAttribute("needRefresh") == null)
		{
			request.setAttribute("needRefresh", request.getParameter("needRefresh"));
		}

		// 转向
		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_DETAIL + ".jsp").forward(request, response);
		
	}

	// 删除
	public void delete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// super.delete(request, response);
		
		// 清空字典缓存
		DictionaryUtil.clearCache("数据源-基础档案对照字典-明细");

		int successCount = getDomainDao().deleteByKey(domainInstanceKeyValue);

		// 删除子表数据
		if (successCount > 0)
		{
			IBaseDAO detailDao = new DefaultBaseDAO(HcpDataSourceBaseInfoMapDetailObj.class);
			detailDao.deleteByParentKey(domainInstanceKeyValue);
		}

		// 传递needRefresh
		request.setAttribute("needRefresh", true);

		// 转向
		if (successCount > 0)
		{
			list4this(request, response);
		} else
		{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
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

}
