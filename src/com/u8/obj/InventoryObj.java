package com.u8.obj;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.dictionary.DictionaryUtil;

public class InventoryObj extends BaseDbObj
{
	private String cinvcode;
	private String cinvccode;
	private String cinvcname;
	private String cinvname;
	private String cinvstd;
	private String cvencode;
	private String cvenname;
	private String ccomunitcode;
	private String ccomunitname;
	private Long i_id;

	@Override
	public String findKeyColumnName()
	{
		return "i_id";
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
		return "inventory";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "Inventory";
	}

	@Override
	public String getCnName()
	{
		return "存货";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "cinvcode" });
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("cinvcode", "编码");
		pros.put("cinvccode", "分类");
		pros.put("cinvname", "名称");
		pros.put("cinvstd", "规格型号");
		pros.put("cvencode", "供应商");
		pros.put("ccomunitcode", "主计量单位");
		return pros;
	}

	public String getCinvcode()
	{
		return cinvcode;
	}

	public void setCinvcode(String cinvcode)
	{
		this.cinvcode = cinvcode;
	}

	public String getCinvccode()
	{
		return cinvccode;
	}

	public void setCinvccode(String cinvccode)
	{
		this.cinvccode = cinvccode;
	}

	public String getCinvname()
	{
		return cinvname;
	}

	public void setCinvname(String cinvname)
	{
		this.cinvname = cinvname;
	}

	public String getCinvstd()
	{
		return cinvstd;
	}

	public void setCinvstd(String cinvstd)
	{
		this.cinvstd = cinvstd;
	}

	public String getCvencode()
	{
		return cvencode;
	}

	public void setCvencode(String cvencode)
	{
		this.cvencode = cvencode;
	}

	public String getCcomunitcode()
	{
		return ccomunitcode;
	}

	public void setCcomunitcode(String ccomunitcode)
	{
		this.ccomunitcode = ccomunitcode;
	}

	public Long getI_id()
	{
		return i_id;
	}

	public void setI_id(Long i_id)
	{
		this.i_id = i_id;
	}

	public String getCinvcname()
	{
		return DictionaryUtil.getDictValueByDictKey("U8存货类别字典", getCinvccode());
	}

	public void setCinvcname(String cinvcname)
	{
		this.cinvcname = cinvcname;
	}

	public String getCvenname()
	{
		return DictionaryUtil.getDictValueByDictKey("U8供应商字典", getCvencode());
	}

	public void setCvenname(String cvenname)
	{
		this.cvenname = cvenname;
	}

	public String getCcomunitname()
	{
		return DictionaryUtil.getDictValueByDictKey("U8计量单位字典", getCcomunitcode());
	}

	public void setCcomunitname(String ccomunitname)
	{
		this.ccomunitname = ccomunitname;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
