package com.wuyg.system.util;

import java.util.List;

import com.wuyg.auth.obj.AuthUserObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.util.StringUtil;
import com.wuyg.system.obj.SystemMenuObj;
import com.wuyg.tree.obj.ZTreeNode;

public class SystemMenuUtil
{
	/**
	 * 获取系统菜单所需HTML代码
	 * 
	 * @return
	 */
	public static String buildMenuHtml(ZTreeNode treeNode, String contextPath, AuthUserObj user)
	{
		List<SystemMenuObj> systemMenuList = new DefaultBaseDAO(SystemMenuObj.class).searchAll(SystemMenuObj.class);

		StringBuffer html = new StringBuffer();

		for (int i = 0; i < treeNode.getChildren().size(); i++)
		{
			ZTreeNode child = treeNode.getChildren().get(i);

			SystemMenuObj systemMenu = getSystemMenuByCode(child.getId(), systemMenuList);

			html.append("<table id=\"menu_table_" + systemMenu.getMenu_code() + "\" class=\"menu_table\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"display: none\">");
			html.append(buildSubMenuHtml(child, systemMenuList, contextPath, user));
			html.append("</table>");
		}

		return html.toString();
	}

	/**
	 * 获取系统菜单所需HTML代码
	 * 
	 * @return
	 */
	public static String buildHeaderMenuHtml(ZTreeNode treeNode, String contextPath, AuthUserObj user)
	{
		List<SystemMenuObj> systemMenuList = new DefaultBaseDAO(SystemMenuObj.class).searchAll(SystemMenuObj.class);

		StringBuffer html = new StringBuffer();
		html.append("<table id=\"top_menu_table\" class=\"top_menu_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
		html.append("<tr>\n");

		for (int i = 0; i < treeNode.getChildren().size(); i++)
		{
			ZTreeNode child = treeNode.getChildren().get(i);

			SystemMenuObj systemMenu = getSystemMenuByCode(child.getId(), systemMenuList);
			
			// 是否有权限
			if (user.hasFunction(systemMenu.getMenu_auth_func_code()))
			{
				html.append("<td onclick=\"openMenu(this,'menu_table_" + child.getId() + "')\">" + child.getName() + "</td>\n");
			}
		}
		
		html.append("</tr>");
		html.append("</table>");

		return html.toString();
	}

	private static String buildSubMenuHtml(ZTreeNode treeNode, List<SystemMenuObj> systemMenuList, String contextPath, AuthUserObj user)
	{
		StringBuffer subMenuHtml = new StringBuffer();

		String whitespace = "";
		for (int i = 0; i < treeNode.getId().length() - 2; i++)
		{
			whitespace += "&nbsp;";
		}

		SystemMenuObj systemMenu = getSystemMenuByCode(treeNode.getId(), systemMenuList);

		// 是否展开
		boolean open = ("是".equals(systemMenu.getBe_open()));

		// 是否有权限
		if (user.hasFunction(systemMenu.getMenu_auth_func_code()))
		{
			if (treeNode.getChildren().size() > 0)
			{

				subMenuHtml.append("			<tr onclick=\"toggleMenuGroup(this)\"> \n");
				subMenuHtml.append("				<td class=\"" + (open ? "menu_header_expand" : "menu_header_not_expand") + "\"> \n");
				subMenuHtml.append("					" + whitespace + "<img src=\"" + contextPath + "/images/menu_right.png\" style=\"vertical-align:middle\"/>&nbsp;&nbsp;" + treeNode.getName() + " \n");
				subMenuHtml.append("				</td> \n");
				subMenuHtml.append("			</tr> \n");
				subMenuHtml.append("			<tr style=\"display:" + (open ? "" : "none") + "\"> \n");
				subMenuHtml.append("				<td> \n");
				subMenuHtml.append("					<table width=\"100%\"> \n");

				for (int i = 0; i < treeNode.getChildren().size(); i++)
				{

					subMenuHtml.append(buildSubMenuHtml(treeNode.getChildren().get(i), systemMenuList, contextPath, user));
				}

				subMenuHtml.append("					</table> \n");
				subMenuHtml.append("				</td> \n");
				subMenuHtml.append("			</tr> \n");
			} else
			{
				subMenuHtml.append("						<tr> \n");
				subMenuHtml.append("							<td class=\"menu_not_selected\" " + (!StringUtil.isEmpty(treeNode.getUrl()) ? ("onclick=\"openInMainFrame(this,'" + contextPath + treeNode.getUrl() + "')\"") : "") + "> \n");
				subMenuHtml.append(whitespace);
				if (!StringUtil.isEmpty(treeNode.getIcon()))
				{
					subMenuHtml.append("							<img src=\"" + contextPath + "/" + treeNode.getIcon() + "\" width=12 height=12 style=\"vertical-align:middle\"/>");
				} else
				{
					subMenuHtml.append("◆");
				}
				subMenuHtml.append("								" + treeNode.getName() + " \n");
				subMenuHtml.append("							</td> \n");
				subMenuHtml.append("						</tr> \n");
			}
		}

		return subMenuHtml.toString();
	}

	private static SystemMenuObj getSystemMenuByCode(String menu_code, List<SystemMenuObj> systemMenuList)
	{
		for (int i = 0; i < systemMenuList.size(); i++)
		{
			SystemMenuObj sysMenu = systemMenuList.get(i);

			if (sysMenu.getMenu_code().equalsIgnoreCase(menu_code))
			{
				return sysMenu;
			}
		}

		return null;
	}
}
