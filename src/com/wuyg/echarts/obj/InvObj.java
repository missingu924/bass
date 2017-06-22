package com.wuyg.echarts.obj;

import java.util.LinkedHashMap;

import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.util.StringUtil;

public class InvObj extends BaseDbObj
{
	private String id;// key
	private String name;// name
	private Double value;// value

	private String sql; // 该sql直接用于进行数据查询，查询的列中必须包含id,name,value三个字段，其中name是x轴、value是数据
	private String orderBy;

	private String cnName;

	private LinkedHashMap<String, String> properties = new LinkedHashMap<String, String>();

	public InvObj(String sql, String orderBy, String cnName, String nameCnName, String valueCnName)
	{
		this.sql = sql;
		this.orderBy = orderBy;
		
		this.cnName = cnName;

		// this.properties.put("key", keyCnName);
		this.properties.put("name", nameCnName);
		this.properties.put("value", valueCnName);
	}

	public InvObj()
	{

	}

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
	public String findDefaultOrderBy()
	{
		return this.orderBy;
	}

	@Override
	public LinkedHashMap<String, String> findProperties()
	{
		return properties;
	}

	@Override
	public String findTableName()
	{
		// return " (select " + keyDbColumn + " as id," + nameDbColumn + " as name," + valueDbColumn + " as value from (" + tablename + ") tttt) tttttt ";

		return "(" + sql + ") t ";
	}

	@Override
	public String getBasePath()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getCnName()
	{
		return cnName;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public Double getValue()
	{
		return value;
	}

	public void setValue(Double value)
	{
		this.value = value;
	}

	public LinkedHashMap<String, String> getProperties()
	{
		return properties;
	}
}
