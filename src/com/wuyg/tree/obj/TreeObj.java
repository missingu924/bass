package com.wuyg.tree.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.util.SystemConstant;

import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class TreeObj extends BaseDbObj
{
	private String name;
	private String data_soure = SystemConstant.DEFAULT_DB;
	private Boolean open = false;
	private String select_ids = "";
	private String fiter = "";

	@Override
	public String findKeyColumnName()
	{
		return null;
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
		return "tree";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "Tree";
	}

	@Override
	public String getCnName()
	{
		return "树";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "name" });
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("name", "name");
		pros.put("data_soure", "data_soure");
		pros.put("open", "open");
		pros.put("select_ids", "select_ids");
		pros.put("fiter", "fiter");
		return pros;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getData_soure()
	{
		return data_soure;
	}

	public void setData_soure(String data_soure)
	{
		this.data_soure = data_soure;
	}

	public Boolean getOpen()
	{
		return open;
	}

	public void setOpen(Boolean open)
	{
		this.open = open;
	}

	public String getSelect_ids()
	{
		return select_ids;
	}

	public void setSelect_ids(String select_ids)
	{
		this.select_ids = select_ids;
	}

	public String getFiter()
	{
		return fiter;
	}

	public void setFiter(String fiter)
	{
		this.fiter = fiter;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
