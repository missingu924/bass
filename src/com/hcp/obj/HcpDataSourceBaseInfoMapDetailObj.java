package com.hcp.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class HcpDataSourceBaseInfoMapDetailObj extends BaseDbObj
{
	private Long id;
	private Long map_id;
	private String src_code;
	private String src_name;
	private String dst_code;
	private String dst_name;
	private String dont_mapped;

	@Override
	public String findKeyColumnName()
	{
		return "id";
	}

	@Override
	public String findParentKeyColumnName()
	{
		return "map_id";
	}

	@Override
	public String findTableName()
	{
		return "hcp_data_source_base_info_map_detail";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "HcpDataSourceBaseInfoMapDetail";
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
		{ "map_id", "src_code" });
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("id", "编号");
		pros.put("map_id", "对照主表ID");
		pros.put("src_code", "编码");
		pros.put("src_name", "名称");
		pros.put("dst_code", "对照到编码");
		pros.put("dst_name", "对照到名称");
		pros.put("dont_mapped", "只查未对照的");
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

	public Long getMap_id()
	{
		return map_id;
	}

	public void setMap_id(Long map_id)
	{
		this.map_id = map_id;
	}

	public String getDont_mapped()
	{
		return dont_mapped;
	}

	public void setDont_mapped(String dont_mapped)
	{
		this.dont_mapped = dont_mapped;
	}

	public String getSrc_code()
	{
		return src_code;
	}

	public void setSrc_code(String src_code)
	{
		this.src_code = src_code;
	}

	public String getSrc_name()
	{
		return src_name;
	}

	public void setSrc_name(String src_name)
	{
		this.src_name = src_name;
	}

	public String getDst_code()
	{
		return dst_code;
	}

	public void setDst_code(String dst_code)
	{
		this.dst_code = dst_code;
	}

	public String getDst_name()
	{
		return dst_name;
	}

	public void setDst_name(String dst_name)
	{
		this.dst_name = dst_name;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
