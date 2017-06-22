package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class StRepKctzSumObj extends BaseDbObj
{
	private Long id;
	private String cinvcode;
	private String cvmivencode;
	private String cvmivenname;
	private String cinvname;
	private String cinvaddcode;
	private String cinvstd;
	private String cinvm_unit;
	private String cinva_unit;
	private String cinvccode;
	private String cinvcname;
	private Double isafenum;
	private Double itopsum;
	private Double ilowsum;
	private Double ibeginqtty;
	private Double ibeginnum;
	


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
		return "st_rep_kctz_sum";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "StRepKctzSum";
	}

	@Override
	public String getCnName()
	{
		return "库存台账";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{});
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "id");
		pros.put("cinvcode", "存货编码");
		pros.put("cvmivencode", "cvmivencode");
		pros.put("cvmivenname", "代管供应商");
		pros.put("cinvname", "存货名称");
		pros.put("cinvaddcode", "代码");
		pros.put("cinvstd", "规格型号");
		pros.put("cinvm_unit", "单位");
		pros.put("cinva_unit", "库存单位");
		pros.put("cinvccode", "cinvccode");
		pros.put("cinvcname", "存货分类");
		pros.put("isafenum", "安全库存");
		pros.put("itopsum", "最高库存");
		pros.put("ilowsum", "最低库存");
		pros.put("ibeginqtty", "期初数量");
		pros.put("ibeginnum", "ibeginnum");
		pros.put("cwhcoce", "仓库");
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

	public String getCinvcode()
	{
		return cinvcode;
	}

	public void setCinvcode(String cinvcode)
	{
		this.cinvcode = cinvcode;
	}

	public String getCvmivencode()
	{
		return cvmivencode;
	}

	public void setCvmivencode(String cvmivencode)
	{
		this.cvmivencode = cvmivencode;
	}

	public String getCvmivenname()
	{
		return cvmivenname;
	}

	public void setCvmivenname(String cvmivenname)
	{
		this.cvmivenname = cvmivenname;
	}

	public String getCinvname()
	{
		return cinvname;
	}

	public void setCinvname(String cinvname)
	{
		this.cinvname = cinvname;
	}

	public String getCinvaddcode()
	{
		return cinvaddcode;
	}

	public void setCinvaddcode(String cinvaddcode)
	{
		this.cinvaddcode = cinvaddcode;
	}

	public String getCinvstd()
	{
		return cinvstd;
	}

	public void setCinvstd(String cinvstd)
	{
		this.cinvstd = cinvstd;
	}

	public String getCinvm_unit()
	{
		return cinvm_unit;
	}

	public void setCinvm_unit(String cinvm_unit)
	{
		this.cinvm_unit = cinvm_unit;
	}

	public String getCinva_unit()
	{
		return cinva_unit;
	}

	public void setCinva_unit(String cinva_unit)
	{
		this.cinva_unit = cinva_unit;
	}

	public String getCinvccode()
	{
		return cinvccode;
	}

	public void setCinvccode(String cinvccode)
	{
		this.cinvccode = cinvccode;
	}

	public String getCinvcname()
	{
		return cinvcname;
	}

	public void setCinvcname(String cinvcname)
	{
		this.cinvcname = cinvcname;
	}

	public Double getIsafenum()
	{
		return isafenum;
	}

	public void setIsafenum(Double isafenum)
	{
		this.isafenum = isafenum;
	}

	public Double getItopsum()
	{
		return itopsum;
	}

	public void setItopsum(Double itopsum)
	{
		this.itopsum = itopsum;
	}

	public Double getIlowsum()
	{
		return ilowsum;
	}

	public void setIlowsum(Double ilowsum)
	{
		this.ilowsum = ilowsum;
	}

	public Double getIbeginqtty()
	{
		return ibeginqtty;
	}

	public void setIbeginqtty(Double ibeginqtty)
	{
		this.ibeginqtty = ibeginqtty;
	}

	public Double getIbeginnum()
	{
		return ibeginnum;
	}

	public void setIbeginnum(Double ibeginnum)
	{
		this.ibeginnum = ibeginnum;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
