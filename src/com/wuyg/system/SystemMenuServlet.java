package com.wuyg.system;

import java.util.ArrayList;
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
import com.wuyg.system.obj.SystemMenuObj;
import com.wuyg.system.searchcondition.SystemMenuSearchCondition;

public class SystemMenuServlet extends AbstractBaseServletTemplate
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
		return com.wuyg.system.obj.SystemMenuObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.wuyg.system.searchcondition.SystemMenuSearchCondition.class;
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
		// 保存或更新
		boolean success = false;
		if (domainInstance.findKeyValue() < 0)
		{
			domainInstance.setKeyValue(getDomainDao().getMaxKeyValue());
			success = getDomainDao().save(domainInstance);
		} else
		{
			success = getDomainDao().updateIncludeNullProperties(domainInstance);
		}

		// 声明是新增后转到的详情页面
		request.setAttribute("needRefresh", true);

		// 转向
		if (success)
		{
			SystemMenuObj parentMenu = (SystemMenuObj) domainInstance;

			// menu_code发生变化
			if (!parentMenu.getMenu_code().equals(parentMenu.getPre_menu_code()))
			{
				// 更新所有子孙菜单的菜单编码及其上级菜单编码
				List<BaseDbObj> subMenuList = getDomainDao().searchByClause(SystemMenuObj.class, "menu_code like '" + parentMenu.getPre_menu_code() + "%'", "", 0, Integer.MAX_VALUE);
				for (int i = 0; i < subMenuList.size(); i++)
				{
					SystemMenuObj systemMenu = (SystemMenuObj) subMenuList.get(i);
					systemMenu.setMenu_code(systemMenu.getMenu_code().replaceFirst(parentMenu.getPre_menu_code(), parentMenu.getMenu_code()));
					systemMenu.setParent_code(systemMenu.getParent_code().replaceFirst(parentMenu.getPre_menu_code(), parentMenu.getMenu_code()));
				}

				getDomainDao().update(subMenuList);
			}

			detail(request, response);
		} else
		{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	// 修改前查询领域对象信息
	public void preModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		SystemMenuObj domainObj = (SystemMenuObj) domainInstance;
		List<SystemMenuObj> list = getDomainDao().searchByClause(getDomainInstanceClz(), "parent_code='" + domainObj.getParent_code() + "'", "menu_code desc", 0, 1);
		if (list.size() > 0)
		{
			request.setAttribute("last_code", list.get(0).getMenu_code());
		}

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
		// 删除该菜单及其所有子菜单
		SystemMenuObj systemMenu = (SystemMenuObj) domainInstance;

		getDomainDao().deleteByClause(" menu_code like '" + systemMenu.getMenu_code() + "%' ");

		// 传递needRefresh
		request.setAttribute("needRefresh", true);

		list4this(request, response);
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
