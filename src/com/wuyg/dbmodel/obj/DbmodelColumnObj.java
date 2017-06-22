package com.wuyg.dbmodel.obj;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.wuyg.common.dao.BaseDbObj;

public class DbmodelColumnObj extends BaseDbObj
{
	private Long id;
	private Long tableid;
	private String columnname;
	private String columntype;
	private Long columnscale;
	private String columncnname;
	private String dictname;
	private Boolean columnshow;
	private Boolean columnforsearch;
	private Boolean iskeycolumn;
	private Boolean notnull;

	@Override
	public String findKeyColumnName()
	{
		return "id";
	}

	@Override
	public String findParentKeyColumnName()
	{
		return "tableid";
	}

	@Override
	public String findTableName()
	{
		return "dbmodel_column";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "DbmodelColumn";
	}

	@Override
	public String getCnName()
	{
		return "数据列";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{"tableid","columnname"});
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "编号");
		pros.put("tableid", "数据表编号");
		pros.put("columnname", "英文名");
		pros.put("columntype", "数据类型");
		pros.put("columnscale", "数据精度");
		pros.put("columncnname", "中文名");
		pros.put("dictname", "所用字典");
		pros.put("columnshow", "是否显示");
		pros.put("columnforsearch", "是否用作查询");
		pros.put("iskeycolumn", "是否主键");
		pros.put("notnull", "可否为空");
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

	public Long getTableid()
	{
		return tableid;
	}

	public void setTableid(Long tableid)
	{
		this.tableid = tableid;
	}

	public String getColumnname()
	{
		return columnname;
	}

	public void setColumnname(String columnname)
	{
		this.columnname = columnname;
	}

	public String getColumntype()
	{
		return columntype;
	}

	public void setColumntype(String columntype)
	{
		this.columntype = columntype;
	}

	public Long getColumnscale()
	{
		return columnscale;
	}

	public void setColumnscale(Long columnscale)
	{
		this.columnscale = columnscale;
	}

	public String getColumncnname()
	{
		return columncnname;
	}

	public void setColumncnname(String columncnname)
	{
		this.columncnname = columncnname;
	}

	public String getDictname()
	{
		return dictname;
	}

	public void setDictname(String dictname)
	{
		this.dictname = dictname;
	}

	public Boolean getColumnshow()
	{
		return columnshow;
	}

	public void setColumnshow(Boolean columnshow)
	{
		this.columnshow = columnshow;
	}

	public Boolean getColumnforsearch()
	{
		return columnforsearch;
	}

	public void setColumnforsearch(Boolean columnforsearch)
	{
		this.columnforsearch = columnforsearch;
	}

	public Boolean getIskeycolumn()
	{
		return iskeycolumn;
	}

	public void setIskeycolumn(Boolean iskeycolumn)
	{
		this.iskeycolumn = iskeycolumn;
	}

	public Boolean getNotnull()
	{
		return notnull;
	}

	public void setNotnull(Boolean notnull)
	{
		this.notnull = notnull;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
