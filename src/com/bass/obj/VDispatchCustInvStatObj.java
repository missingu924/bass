package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class VDispatchCustInvStatObj extends BaseDbObj
{
	private Long id;
	private String ccccode;
	private String cccname;
	private String ccuscode;
	private String ccusname;
	private String ccusabbname;
	private String cinvccode;
	private String cinvcname;
	private String cinvcode;
	private String cinvname;
	private String cinvstd;
	private String ccomunitcode;
	private String ccomunitname;
	private Long icount;
	private Double iquantity;
	private Double isum;

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
		StringBuffer sql = new StringBuffer();

//		sql.append(" ( \n");
//		sql.append(" select \n");
//		sql.append(" 1 as id, \n");
//		sql.append(" custclass.cCCCode, \n");
//		sql.append(" custclass.cCCName, \n");
//		sql.append(" cust.cCusCode, \n");
//		sql.append(" cust.cCusName, \n");
//		sql.append(" cust.cCusAbbName, \n");
//		sql.append(" invc.cInvCCode, \n");
//		sql.append(" invc.cInvCName, \n");
//		sql.append(" inv.cInvCode, \n");
//		sql.append(" inv.cInvName, \n");
//		sql.append(" inv.cInvStd, \n");
//		sql.append(" inv.cComUnitCode, \n");
//		sql.append(" cu.cComUnitName, \n");
//		sql.append(" dl.iCount, \n");
//		sql.append(" dl.iQuantity, \n");
//		sql.append(" dl.iSum \n");
//		sql.append(" from \n");
//		sql.append(" ( \n");
//		sql.append(" 	select  \n");
//		sql.append(" 	dl.cCusCode, \n");
//		sql.append(" 	dls.cInvCode, \n");
//		sql.append(" 	COUNT(*) iCount, \n");
//		sql.append(" 	sum(dls.iQuantity) iQuantity, \n");
//		sql.append(" 	sum(dls.iSum) iSum \n");
//		sql.append(" 	from  \n");
//		sql.append(" 	DispatchList dl \n");
//		sql.append(" 	left join \n");
//		sql.append(" 	DispatchLists dls \n");
//		sql.append(" 	on dl.DLID=dls.DLID \n");
//		sql.append(" 	where \n");
//		sql.append(" 	dls.cInvCode is not null \n");
//		sql.append(" 	and dDate>='2010' and dDate<='2018' \n");
//		sql.append(" 	--and cCusCode='' \n");
//		sql.append(" 	group by \n");
//		sql.append(" 	dl.cCusCode, \n");
//		sql.append(" 	dls.cInvCode \n");
//		sql.append(" ) dl \n");
//		sql.append(" left join \n");
//		sql.append(" Customer cust \n");
//		sql.append(" on dl.cCusCode=cust.cCusCode \n");
//		sql.append(" left join CustomerClass custclass \n");
//		sql.append(" on cust.cCCCode=custclass.cCCCode \n");
//		sql.append(" left join inventory inv \n");
//		sql.append(" on inv.cInvCode=dl.cInvCode \n");
//		sql.append(" left join InventoryClass invc \n");
//		sql.append(" on inv.cInvCCode=invc.cInvCCode \n");
//		sql.append(" left join ComputationUnit cu \n");
//		sql.append(" on inv.cComUnitCode=cu.cComunitCode \n");
//		sql.append(" ) t \n");

		return sql.toString();
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "iSum desc,cCusCode,cInvCode";
	}

	@Override
	public String getBasePath()
	{
		return "VDispatchCustInvStat";
	}

	@Override
	public String getCnName()
	{
		return "客户产品发货统计";
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

		// pros.put("id", "id");
		// pros.put("ccccode", "客户类别编码");
		// pros.put("cccname", "客户类别名称");
		pros.put("ccuscode", "客户编码");
		pros.put("ccusname", "客户名称");
		// pros.put("ccusabbname", "客户简称");
		pros.put("cinvccode", "存货分类编码");
		pros.put("cinvcname", "存货分类名称");
		pros.put("cinvcode", "存货编码");
		pros.put("cinvname", "存货名称");
		pros.put("cinvstd", "规格型号");
		// pros.put("ccomunitcode", "主计量编码");
		pros.put("ccomunitname", "主计量");
		pros.put("icount", "发货次数");
		pros.put("iquantity", "发货数量");
		pros.put("isum", "发货金额");
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

	public Long getIcount()
	{
		return icount;
	}

	public void setIcount(Long icount)
	{
		this.icount = icount;
	}

	public Double getIquantity()
	{
		return iquantity;
	}

	public void setIquantity(Double iquantity)
	{
		this.iquantity = iquantity;
	}

	public Double getIsum()
	{
		return isum;
	}

	public void setIsum(Double isum)
	{
		this.isum = isum;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
