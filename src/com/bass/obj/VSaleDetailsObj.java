package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.util.TimeUtil;

import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class VSaleDetailsObj extends BaseDbObj
{
	private Long autoid;
	private Timestamp ddate;
	private Long dlid;
	private String cdlcode;
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
	private Double iquantity;
	private Double isum;

	@Override
	public String findKeyColumnName()
	{
		return "autoid";
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
		sql.append(" select  \n");
		sql.append(" dls.AutoID, \n");
		sql.append(" dl.dDate, \n");
		sql.append(" dl.cSoCode cdlcode, \n");
		sql.append(" custclass.cCCCode, \n");
		sql.append(" custclass.cCCName, \n");
		sql.append(" cust.cCusCode, \n");
		sql.append(" cust.cCusName, \n");
		sql.append(" cust.cCusAbbName, \n");
		sql.append(" invc.cInvCCode, \n");
		sql.append(" invc.cInvCName, \n");
		sql.append(" inv.cInvCode, \n");
		sql.append(" inv.cInvName, \n");
		sql.append(" inv.cInvStd, \n");
		sql.append(" inv.cComUnitCode, \n");
		sql.append(" cu.cComUnitName, \n");
		sql.append(" isnull(dls.iQuantity,0) iQuantity, \n");
		sql.append(" isnull(dls.iNatSum/10000,0) iSum   \n");
		sql.append(" from  \n");
		sql.append(" So_SoMain dl \n");
		sql.append(" left join \n");
		sql.append(" So_SoDetails dls \n");
		sql.append(" on dl.cSoCode=dls.cSoCode \n");
		sql.append(" left join \n");
		sql.append(" Customer cust \n");
		sql.append(" on dl.cCusCode=cust.cCusCode \n");
		sql.append(" left join CustomerClass custclass \n");
		sql.append(" on cust.cCCCode=custclass.cCCCode \n");
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
		return "ddate,cdlcode desc,ccuscode,cinvcode";
	}

	@Override
	public String getBasePath()
	{
		return "VSaleDetails";
	}

	@Override
	public String getCnName()
	{
		return "销售订单明细";
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

		// pros.put("autoid", "autoid");
		pros.put("ddate", "日期");
		// pros.put("dlid", "dlid");
		pros.put("cdlcode", "单据编号");
		// pros.put("ccccode", "客户类别编码");
		// pros.put("cccname", "客户类别名称");
		pros.put("ccuscode", "客户编码");
		pros.put("ccusname", "客户名称");
		// pros.put("ccusabbname", "客户简称");
		// pros.put("cinvccode", "存货分类编码");
		// pros.put("cinvcname", "存货分类名称");
		pros.put("cinvcode", "存货编码");
		pros.put("cinvname", "存货名称");
		pros.put("cinvstd", "规格型号");
		pros.put("ccomunitcode", "主计量编码");
		pros.put("ccomunitname", "主计量");
		pros.put("iquantity", "数量");
		pros.put("isum", "金额（万元）");
		return pros;
	}

	public Long getAutoid()
	{
		return autoid;
	}

	public void setAutoid(Long autoid)
	{
		this.autoid = autoid;
	}

	public Timestamp getDdate()
	{
		return ddate;
	}

	public void setDdate(Timestamp ddate)
	{
		this.ddate = ddate;
	}

	public Long getDlid()
	{
		return dlid;
	}

	public void setDlid(Long dlid)
	{
		this.dlid = dlid;
	}

	public String getCdlcode()
	{
		return cdlcode;
	}

	public void setCdlcode(String cdlcode)
	{
		this.cdlcode = cdlcode;
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
	
	public String getDdate4show()
	{
		return TimeUtil.date2str(ddate,"M月d日");
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
