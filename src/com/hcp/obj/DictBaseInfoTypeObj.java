package com.hcp.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;

import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class DictBaseInfoTypeObj extends BaseDbObj
{
	private Long id;
	private String base_info_type_code;
	private String base_info_type_name;

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
		return "dict_base_info_type";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "DictBaseInfoType";
	}

	@Override
	public String getCnName()
	{
		return "基础档案类型";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "base_info_type_code" });
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("id", "编号");
		pros.put("base_info_type_code", "基础档案类型编码");
		pros.put("base_info_type_name", "基础档案类型名称");
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

	public String getBase_info_type_code()
	{
		return base_info_type_code;
	}

	public void setBase_info_type_code(String base_info_type_code)
	{
		this.base_info_type_code = base_info_type_code;
	}

	public String getBase_info_type_name()
	{
		return base_info_type_name;
	}

	public void setBase_info_type_name(String base_info_type_name)
	{
		this.base_info_type_name = base_info_type_name;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
	
	//  没有注册基础档案模型
	public boolean canDelete()
	{
		int num = baseInfoDao.countByClause("base_info_type_code='" + this.base_info_type_code + "'");

		return num == 0 ;
	}

	// 该类型的基础档案模型
	public List<HcpDataSourceBaseInfoObj> findHcpDataSourceBaseInfoList()
	{
		return baseInfoDao.searchByClause(HcpDataSourceBaseInfoObj.class, "base_info_type_code='" + this.base_info_type_code + "'", null, 0, Integer.MAX_VALUE);
	}

	private IBaseDAO baseInfoDao = new DefaultBaseDAO(HcpDataSourceBaseInfoObj.class);
}
