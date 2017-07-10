package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class VInventoryRecentObj extends BaseDbObj
{
	private String cinvccode;
	private String cinvcname;
	private String cinvcode;
	private String cinvname;
	private String cinvstd;
	private String ccomunitcode;
	private String ccomunitname;
	private Timestamp drecentdate;
	private Long idays;

	@Override
	public String findKeyColumnName()
	{
		return "cinvccode";
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
		sql.append(" invc.cInvCCode, \n");
		sql.append(" invc.cInvCName, \n");
		sql.append(" inv.cInvCode, \n");
		sql.append(" inv.cInvName, \n");
		sql.append(" inv.cInvStd, \n");
		sql.append(" inv.cComUnitCode, \n");
		sql.append(" cu.cComUnitName, \n");
		sql.append(" dls.dRecentDate, \n");
		sql.append(" dls.iDays \n");
		sql.append(" from \n");
		sql.append(" ( \n");
		sql.append(" 	select  \n");
		sql.append(" 	cInvCode, \n");
		sql.append(" 	MAX(dDate) dRecentDate, \n");
		sql.append(" 	DATEDIFF(day,max(dDate),getdate()) iDays \n");
		sql.append(" 	from  \n");
		sql.append(" 	DispatchList dl \n");
		sql.append(" 	left join \n");
		sql.append(" 	DispatchLists dls \n");
		sql.append(" 	on dl.DLID=dls.DLID \n");
		sql.append(" 	group by \n");
		sql.append(" 	cInvCode \n");
		sql.append(" ) dls \n");
		sql.append(" left join inventory inv \n");
		sql.append(" on inv.cInvCode=dls.cInvCode \n");
		sql.append(" left join InventoryClass invc \n");
		sql.append(" on inv.cInvCCode=invc.cInvCCode \n");
		sql.append(" left join ComputationUnit cu \n");
		sql.append(" on inv.cComUnitCode=cu.cComunitCode \n");
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
		return "VInventoryRecent";
	}

	@Override
	public String getCnName()
	{
		return "休眠产品分析";
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

		// pros.put("cinvccode", "存货分类编码");
		// pros.put("cinvcname", "存货分类名称");
		pros.put("cinvcode", "存货编码");
		pros.put("cinvname", "存货名称");
		pros.put("cinvstd", "规格型号");
		// pros.put("ccomunitcode", "主计量编码");
		pros.put("ccomunitname", "主计量");
		pros.put("drecentdate", "最近成交日期");
		pros.put("idays", "休眠天数");
		return pros;
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

	public String getCinvcode()
	{
		return cinvcode;
	}

	public void setCinvcode(String cinvcode)
	{
		this.cinvcode = cinvcode;
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

	public String getCcomunitcode()
	{
		return ccomunitcode;
	}

	public void setCcomunitcode(String ccomunitcode)
	{
		this.ccomunitcode = ccomunitcode;
	}

	public String getCcomunitname()
	{
		return ccomunitname;
	}

	public void setCcomunitname(String ccomunitname)
	{
		this.ccomunitname = ccomunitname;
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
