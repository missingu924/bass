package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class VCustomerRecentObj extends BaseDbObj
{
	private String ccccode;
	private String cccname;
	private String ccuscode;
	private String ccusname;
	private String ccusabbname;
	private Timestamp drecentdate;
	private Long idays;

	@Override
	public String findKeyColumnName()
	{
		return "ccccode";
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
		StringBuffer sql = new StringBuffer();

		sql.append(" ( \n");
		sql.append(" select \n");
		sql.append(" custclass.cCCCode, \n");
		sql.append(" custclass.cCCName, \n");
		sql.append(" cust.cCusCode, \n");
		sql.append(" cust.cCusName, \n");
		sql.append(" cust.cCusAbbName, \n");
		sql.append(" dl.dRecentDate, \n");
		sql.append(" dl.iDays \n");
		sql.append(" from \n");
		sql.append(" ( \n");
		sql.append(" 	select  \n");
		sql.append(" 	cCusCode, \n");
		sql.append(" 	MAX(dDate) dRecentDate, \n");
		sql.append(" 	DATEDIFF(day,max(dDate),getdate()) iDays \n");
		sql.append(" 	from  \n");
		sql.append(" 	salebillvouch dl \n");
		sql.append(" 	group by \n");
		sql.append(" 	cCusCode \n");
		sql.append(" ) dl \n");
		sql.append(" left join \n");
		sql.append(" Customer cust \n");
		sql.append(" on dl.cCusCode=cust.cCusCode \n");
		sql.append(" left join CustomerClass custclass \n");
		sql.append(" on cust.cCCCode=custclass.cCCCode \n");
		sql.append(" ) t \n");

		return sql.toString();
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "idays desc";
	}

	@Override
	public String getBasePath()
	{
		return "VCustomerRecent";
	}

	@Override
	public String getCnName()
	{
		return "客户休眠分析";
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

		pros.put("ccccode", "客户类别编码");
		pros.put("cccname", "客户类别名称");
		pros.put("ccuscode", "客户编码");
		pros.put("ccusname", "客户名称");
		// pros.put("ccusabbname", "客户简称");
		pros.put("drecentdate", "最近成交日期");
		pros.put("idays", "休眠天数");
		return pros;
	}

	public String getCcccode()
	{
		return ccccode;
	}

	public void setCcccode(String ccccode)
	{
		this.ccccode = ccccode;
	}

	public String getCccname()
	{
		return cccname;
	}

	public void setCccname(String cccname)
	{
		this.cccname = cccname;
	}

	public String getCcuscode()
	{
		return ccuscode;
	}

	public void setCcuscode(String ccuscode)
	{
		this.ccuscode = ccuscode;
	}

	public String getCcusname()
	{
		return ccusname;
	}

	public void setCcusname(String ccusname)
	{
		this.ccusname = ccusname;
	}

	public String getCcusabbname()
	{
		return ccusabbname;
	}

	public void setCcusabbname(String ccusabbname)
	{
		this.ccusabbname = ccusabbname;
	}

	public Timestamp getDrecentdate()
	{
		return drecentdate;
	}

	public void setDrecentdate(Timestamp drecentdate)
	{
		this.drecentdate = drecentdate;
	}

	public Long getIdays()
	{
		return idays;
	}

	public void setIdays(Long idays)
	{
		this.idays = idays;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
