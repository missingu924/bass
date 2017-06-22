package com.wuyg.tree.obj;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.alibaba.fastjson.JSON;
import com.inspur.common.tree.Node;
import com.inspur.common.tree.TreeBuilder;
import com.wuyg.common.util.MySqlUtil;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;

public class ZTreeNode
{
	private String id;
	private String name;
	private String pId;
	private boolean open = true;
	private boolean checked = false;
	private String icon;
	private String url;
	private List<ZTreeNode> children = new ArrayList<ZTreeNode>();

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public boolean isOpen()
	{
		return open;
	}

	public void setOpen(boolean open)
	{
		this.open = open;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getName()
	{
		return name;
	}

	public String getPId()
	{
		return pId;
	}

	public boolean isChecked()
	{
		return checked;
	}

	public void setChecked(boolean checked)
	{
		this.checked = checked;
	}

	public void setPId(String id)
	{
		pId = id;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public List<ZTreeNode> getChildren()
	{
		return children;
	}

	public void setChildren(List<ZTreeNode> children)
	{
		this.children = children;
	}

	public void addChild(ZTreeNode zTreeNode)
	{
		this.children.add(zTreeNode);
	}

	public String getIcon()
	{
		return icon;
	}

	public void setIcon(String icon)
	{
		this.icon = icon;
	}

	public String toJson()
	{
		return JSON.toJSONString(this);
	}
}
