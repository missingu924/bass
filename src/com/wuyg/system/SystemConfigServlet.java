package com.wuyg.system;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;
import com.wuyg.system.extend.ISystemConfigAfter;
import com.wuyg.system.obj.SystemConfigObj;
import com.wuyg.system.util.SystemConfigUtil;

public class SystemConfigServlet extends AbstractBaseServletTemplate
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
		return com.wuyg.system.obj.SystemConfigObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.wuyg.system.searchcondition.SystemConfigSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.list(request, response);
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

	// 查询4设置
	public void list4set(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<SystemConfigObj> list = getDomainDao().searchByClause(getDomainInstanceClz(), "be_stop='否'", "sort_code", 0, Integer.MAX_VALUE);

		request.setAttribute("list", list);
		request.setAttribute(DOMAIN_INSTANCE, domainInstance);

		request.getRequestDispatcher("/" + getBasePath() + "/set.jsp").forward(request, response);
	}

	// 查询4设置
	public void detail4set(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<SystemConfigObj> list = getDomainDao().searchByClause(getDomainInstanceClz(), "be_stop='否'", "sort_code", 0, Integer.MAX_VALUE);

		request.setAttribute("list", list);
		request.setAttribute(DOMAIN_INSTANCE, domainInstance);

		request.getRequestDispatcher("/" + getBasePath() + "/detail4set.jsp").forward(request, response);
	}

	// 设置
	public void set4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<BaseDbObj> systemConfigList = new ArrayList<BaseDbObj>();

		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements())
		{
			String parameterName = parameterNames.nextElement();
			String parameterValue = request.getParameter(parameterName);

			SystemConfigObj o = new SystemConfigObj();
			o.setName(parameterName);
			o.setValue(parameterValue);
			systemConfigList.add(o);
		}

		boolean success = getDomainDao().update(systemConfigList);

		
		// 执行值修改后的动作
		if (success)
		{
			for (int i = 0; i < systemConfigList.size(); i++)
			{
				SystemConfigObj o = (SystemConfigObj) systemConfigList.get(i);
				SystemConfigUtil.doAfter(o.getName());
			}
		}

		// response.getWriter().print(success);

		detail4set(request, response);
	}
}
