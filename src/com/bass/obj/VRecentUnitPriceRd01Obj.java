package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class VRecentUnitPriceRd01Obj extends BaseDbObj
{
	private String cinvccode;
	private String cinvcname;
	private String cinvcode;
	private String cinvname;
	private String cinvstd;
	private String ccomunitcode;
	private String ccomunitname;
	private Double iunitcost;
	private Timestamp ddate;

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
		sql.append("(");
		sql.append(" select  \n");
		sql.append(" invc.cInvCCode, \n");
		sql.append(" invc.cInvCName, \n");
		sql.append(" inv.cInvCode, \n");
		sql.append(" inv.cInvName, \n");
		sql.append(" inv.cInvStd, \n");
		sql.append(" inv.cComUnitCode, \n");
		sql.append(" cu.cComUnitName, \n");
		sql.append(" iunitcost, \n");
		sql.append(" ddate  \n");
		sql.append(" from  \n");
		sql.append(" rdrecord01  \n");
		sql.append(" inner join rdrecords01  \n");
		sql.append(" on rdrecord01.id=rdrecords01.ID \n");
		sql.append(" inner join  \n");
		sql.append(" ( \n");
		sql.append(" 	select cInvCode,MAX(autoid) as autoid  from rdrecord01 inner join rdrecords01 on rdrecord01.id=rdrecords01.ID \n");
		sql.append(" 	group by cInvCode  \n");
		sql.append(" ) \n");
		sql.append(" t on rdrecords01.AutoID =t.autoid  \n");
		sql.append(" inner join inventory inv \n");
		sql.append(" on inv.cInvCode=t.cInvCode \n");
		sql.append(" left join InventoryClass invc \n");
		sql.append(" on inv.cInvCCode=invc.cInvCCode \n");
		sql.append(" left join ComputationUnit cu \n");
		sql.append(" on inv.cComUnitCode=cu.cComunitCode \n");
		sql.append(") t ");

		return sql.toString();
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "cInvCCode,cInvCode";
	}

	@Override
	public String getBasePath()
	{
		return "VRecentUnitPriceRd01";
	}

	@Override
	public String getCnName()
	{
		return "产品最近入库单价";
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

		pros.put("cinvccode", "存货分类编码");
		pros.put("cinvcname", "存货分类名称");
		pros.put("cinvcode", "存货编码");
		pros.put("cinvname", "存货名称");
		pros.put("cinvstd", "规格型号");
		// pros.put("ccomunitcode", "主计量编码");
		pros.put("ccomunitname", "主计量");
		pros.put("iunitcost", "单价");
		pros.put("ddate", "最近入库时间");
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

	public Double getIunitcost()
	{
		return iunitcost;
	}

	public void setIunitcost(Double iunitcost)
	{
		this.iunitcost = iunitcost;
	}

	public Timestamp getDdate()
	{
		return ddate;
	}

	public void setDdate(Timestamp ddate)
	{
		this.ddate = ddate;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
