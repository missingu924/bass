package com.wuyg.echarts.obj;

import java.util.LinkedHashMap;

import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.util.StringUtil;

public class InvObj extends BaseDbObj
{
	private String id;// key
	private String name;// name
	private Double value;// value
	private String name1;// name
	private Double value1;// value
	private String name2;// name
	private Double value2;// value
	private String name3;// name
	private Double value3;// value
	private String name4;// name
	private Double value4;// value

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
	
	public InvObj(String sql, String orderBy, String cnName, String[] nameCnName, String[] valueCnName)
	{
		this.sql = sql;
		this.orderBy = orderBy;
		
		this.cnName = cnName;

		// this.properties.put("key", keyCnName);
		this.properties.put("name", nameCnName[0]);
		this.properties.put("value", valueCnName[0]);
		
		if (nameCnName.length>1)
		{
			this.properties.put("name1", nameCnName[1]);
			this.properties.put("value1", valueCnName[1]);
		}
		if (nameCnName.length>2)
		{
			this.properties.put("name2", nameCnName[2]);
			this.properties.put("value2", valueCnName[2]);
		}
		if (nameCnName.length>3)
		{
			this.properties.put("name3", nameCnName[3]);
			this.properties.put("value3", valueCnName[3]);
		}
		if (nameCnName.length>4)
		{
			this.properties.put("name4", nameCnName[4]);
			this.properties.put("value4", valueCnName[4]);
		}
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

	public String getName1()
	{
		return name1;
	}

	public void setName1(String name1)
	{
		this.name1 = name1;
	}

	public Double getValue1()
	{
		return value1;
	}

	public void setValue1(Double value1)
	{
		this.value1 = value1;
	}

	public String getName2()
	{
		return name2;
	}

	public void setName2(String name2)
	{
		this.name2 = name2;
	}

	public Double getValue2()
	{
		return value2;
	}

	public void setValue2(Double value2)
	{
		this.value2 = value2;
	}

	public String getName3()
	{
		return name3;
	}

	public void setName3(String name3)
	{
		this.name3 = name3;
	}

	public Double getValue3()
	{
		return value3;
	}

	public void setValue3(Double value3)
	{
		this.value3 = value3;
	}

	public String getName4()
	{
		return name4;
	}

	public void setName4(String name4)
	{
		this.name4 = name4;
	}

	public Double getValue4()
	{
		return value4;
	}

	public void setValue4(Double value4)
	{
		this.value4 = value4;
	}

	public LinkedHashMap<String, String> getProperties()
	{
		return properties;
	}
}
