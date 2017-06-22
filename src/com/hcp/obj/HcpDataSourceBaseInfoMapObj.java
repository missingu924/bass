package com.hcp.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class HcpDataSourceBaseInfoMapObj extends BaseDbObj
{
	private Long id;
	private String src_ds_code;
	private String src_base_info_name;
	private String src_base_info_type_code;
	private String dst_ds_code;
	private String dst_base_info_name;
	private String dst_base_info_type_code;
	private Long relation_total_num;
	private Long relation_ok_num;
	private Long relation_not_ok_num;

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
		return "hcp_data_source_base_info_map";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "HcpDataSourceBaseInfoMap";
	}

	@Override
	public String getCnName()
	{
		return "基础档案对照";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "src_base_info_name","dst_base_info_name" });
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("id", "编号");
		pros.put("src_ds_code", "数据源");
		pros.put("src_base_info_name", "基础档案名称");
		pros.put("src_base_info_type_code", "基础档案类型");
		pros.put("dst_ds_code", "对照到数据源");
		pros.put("dst_base_info_name", "对照到基础档案名称");
		pros.put("dst_base_info_type_code", "对照到基础档案类型");
		pros.put("relation_total_num", "对照关系总条数");
		pros.put("relation_ok_num", "已完善对照关系条数");
		pros.put("relation_not_ok_num", "待完善对照关系条数");
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

	public String getSrc_ds_code()
	{
		return src_ds_code;
	}

	public void setSrc_ds_code(String src_ds_code)
	{
		this.src_ds_code = src_ds_code;
	}


	public String getSrc_base_info_type_code()
	{
		return src_base_info_type_code;
	}

	public void setSrc_base_info_type_code(String src_base_info_type_code)
	{
		this.src_base_info_type_code = src_base_info_type_code;
	}

	public String getDst_ds_code()
	{
		return dst_ds_code;
	}

	public void setDst_ds_code(String dst_ds_code)
	{
		this.dst_ds_code = dst_ds_code;
	}


	public String getSrc_base_info_name()
	{
		return src_base_info_name;
	}

	public void setSrc_base_info_name(String src_base_info_name)
	{
		this.src_base_info_name = src_base_info_name;
	}

	public String getDst_base_info_name()
	{
		return dst_base_info_name;
	}

	public void setDst_base_info_name(String dst_base_info_name)
	{
		this.dst_base_info_name = dst_base_info_name;
	}

	public String getDst_base_info_type_code()
	{
		return dst_base_info_type_code;
	}

	public void setDst_base_info_type_code(String dst_base_info_type_code)
	{
		this.dst_base_info_type_code = dst_base_info_type_code;
	}

	public Long getRelation_total_num()
	{
		return relation_total_num;
	}

	public void setRelation_total_num(Long relation_total_num)
	{
		this.relation_total_num = relation_total_num;
	}

	public Long getRelation_ok_num()
	{
		return relation_ok_num;
	}

	public void setRelation_ok_num(Long relation_ok_num)
	{
		this.relation_ok_num = relation_ok_num;
	}

	public Long getRelation_not_ok_num()
	{
		return relation_not_ok_num;
	}

	public void setRelation_not_ok_num(Long relation_not_ok_num)
	{
		this.relation_not_ok_num = relation_not_ok_num;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
