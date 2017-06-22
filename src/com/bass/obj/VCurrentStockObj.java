package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class VCurrentStockObj extends BaseDbObj
{
	private Long autoid;
	private String cwhcode;
	private String cwhname;
	private String cinvccode;
	private String cinvcname;
	private String cinvcode;
	private String cinvname;
	private String cinvstd;
	private String cbatch;
	private String ccomunitcode;
	private String ccomunitname;
	private Double iquantity;
	private Double inum;
	private String expirationDate;

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
		sql.append("( \n");
		sql.append("  select \n");
		sql.append("  GROUPING(autoid) autoid_g, \n");
		sql.append("  GROUPING(cinvcode) cinvcode_g, \n");
		sql.append("  AutoID,  \n");
		sql.append("  max(cWhCode) cWhCode,  \n");
		sql.append("  max(cWhName) cWhName,  \n");
		sql.append("  max(cInvCCode) cInvCCode,  \n");
		sql.append("  max(cInvCName) cInvCName,  \n");
		sql.append("  cInvCode,  \n");
		sql.append("  max(cInvName) cInvName,  \n");
		sql.append("  max(cInvStd) cInvStd,  \n");
		sql.append("  max(cComUnitCode) cComUnitCode,  \n");
		sql.append("  max(cComUnitName) cComUnitName,  \n");
		sql.append("  max(expirationDate) expirationDate,  \n");
		sql.append("  max(cBatch) cBatch,  \n");
		sql.append("  sum(iQuantity) iQuantity,  \n");
		sql.append("  sum(iNum) iNum \n");
		sql.append("  from \n");
		sql.append("  (select   \n");
		sql.append("  cs.AutoID,  \n");
		sql.append("  cs.cWhCode,  \n");
		sql.append("  wh.cWhName,  \n");
		sql.append("  invc.cInvCCode,  \n");
		sql.append("  invc.cInvCName,  \n");
		sql.append("  cs.cInvCode,  \n");
		sql.append("  inv.cInvName,  \n");
		sql.append("  inv.cInvStd,  \n");
		sql.append("  inv.cComUnitCode,  \n");
		sql.append("  inv.cinvDefine9 expirationDate,  \n");
		sql.append("  cu.cComUnitName,  \n");
		sql.append("  cs.cBatch,  \n");
		sql.append("  cs.iQuantity,  \n");
		sql.append("  cs.iNum  \n");
		sql.append("  from   \n");
		sql.append("  currentstock cs  \n");
		sql.append("  left join inventory inv  \n");
		sql.append("  on cs.cInvCode=inv.cInvCode  \n");
		sql.append("  left join inventoryClass invc  \n");
		sql.append("  on inv.cInvCCode=invc.cInvCCode  \n");
		sql.append("  left join Warehouse wh  \n");
		sql.append("  on cs.cWhCode=wh.cWhCode  \n");
		sql.append("  left join ComputationUnit cu  \n");
		sql.append("  on inv.cComUnitCode=cu.cComunitCode  \n");
		sql.append(" ) t \n");
		sql.append(" group by   \n");
		sql.append("  cInvCode,autoid \n");
		sql.append(" with rollup \n");
		sql.append(" having \n");
		sql.append("  (GROUPING(autoid)=1 and GROUPING(cinvcode)=0) \n");
		sql.append("  or \n");
		sql.append("  (GROUPING(autoid)=0 and GROUPING(cinvcode)=0) \n");
		sql.append(") t \n");
		return sql.toString();
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "cinvcode";
	}

	@Override
	public String getBasePath()
	{
		return "VCurrentStock";
	}

	@Override
	public String getCnName()
	{
		return "现存量";
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

		pros.put("cwhcode", "仓库编码");
		pros.put("cwhname", "仓库名称");
		pros.put("cinvcode", "存货编码");
		pros.put("cinvname", "存货名称");
		pros.put("cinvstd", "规格型号");
		pros.put("cinvccode", "存货分类代码");
		pros.put("cinvcname", "存货分类名称");
		pros.put("cbatch", "批号");
		pros.put("expirationDate", "保质期");
		// pros.put("ccomunitcode", "ccomunitcode");
		pros.put("ccomunitname", "主计量单位");
		pros.put("iquantity", "现存数量");
		// pros.put("inum", "inum");
		return pros;
	}

	public String getCbatch()
	{
		return cbatch;
	}

	public void setCbatch(String cbatch)
	{
		this.cbatch = cbatch;
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

	public Long getAutoid()
	{
		return autoid;
	}

	public void setAutoid(Long autoid)
	{
		this.autoid = autoid;
	}

	public String getCwhcode()
	{
		return cwhcode;
	}

	public void setCwhcode(String cwhcode)
	{
		this.cwhcode = cwhcode;
	}

	public String getCwhname()
	{
		return cwhname;
	}

	public void setCwhname(String cwhname)
	{
		this.cwhname = cwhname;
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

	public Double getInum()
	{
		return inum;
	}

	public void setInum(Double inum)
	{
		this.inum = inum;
	}

	public String getExpirationDate()
	{
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate)
	{
		this.expirationDate = expirationDate;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
