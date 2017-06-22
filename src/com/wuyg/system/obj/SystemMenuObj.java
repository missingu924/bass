package com.wuyg.system.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class SystemMenuObj extends BaseDbObj
{
	private Long id;
	private String menu_code;
	private String pre_menu_code;// 修改前的menu_code
	private String menu_name;
	private String parent_code;
	private Long menu_level;
	private String menu_url;
	private String menu_auth_func_code;
	private String menu_icon;
	private String be_stop;
	private String be_system;
	private String be_open;

	@Override
	public String findKeyColumnName()
	{
		return "id";
	}

	@Override
	public String findParentKeyColumnName()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findTableName()
	{
		return "system_menu";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "SystemMenu";
	}

	@Override
	public String getCnName()
	{
		return "菜单管理";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "menu_code" });
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "id");
		pros.put("menu_code", "菜单编码");
		pros.put("menu_name", "菜单名称");
		pros.put("parent_code", "上级编码");
		// pros.put("menu_level", "菜单级别");
		pros.put("menu_url", "url");
		pros.put("menu_auth_func_code", "权限项");
		pros.put("menu_icon", "图标");
		pros.put("be_stop", "停用");
		pros.put("be_system", "预置");
		pros.put("be_open", "默认展开");
		return pros;
	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getPre_menu_code()
	{
		return pre_menu_code;
	}

	public void setPre_menu_code(String pre_menu_code)
	{
		this.pre_menu_code = pre_menu_code;
	}

	public String getBe_open()
	{
		return be_open;
	}

	public void setBe_open(String be_open)
	{
		this.be_open = be_open;
	}

	public String getMenu_code()
	{
		return menu_code;
	}

	public void setMenu_code(String menu_code)
	{
		this.menu_code = menu_code;
	}

	public String getMenu_name()
	{
		return menu_name;
	}

	public void setMenu_name(String menu_name)
	{
		this.menu_name = menu_name;
	}

	public String getParent_code()
	{
		return parent_code;
	}

	public void setParent_code(String parent_code)
	{
		this.parent_code = parent_code;
	}

	public Long getMenu_level()
	{
		return menu_level;
	}

	public void setMenu_level(Long menu_level)
	{
		this.menu_level = menu_level;
	}

	public String getMenu_url()
	{
		return menu_url;
	}

	public void setMenu_url(String menu_url)
	{
		this.menu_url = menu_url;
	}

	public String getMenu_auth_func_code()
	{
		return menu_auth_func_code;
	}

	public void setMenu_auth_func_code(String menu_auth_func_code)
	{
		this.menu_auth_func_code = menu_auth_func_code;
	}

	public String getMenu_icon()
	{
		return menu_icon;
	}

	public void setMenu_icon(String menu_icon)
	{
		this.menu_icon = menu_icon;
	}

	public String getBe_stop()
	{
		return be_stop;
	}

	public void setBe_stop(String be_stop)
	{
		this.be_stop = be_stop;
	}

	public String getBe_system()
	{
		return be_system;
	}

	public void setBe_system(String be_system)
	{
		this.be_system = be_system;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
