package com.u8.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class ApClosebillsObj extends BaseDbObj
{
	private Long iid;
	private Long id;
	private String itype;
	private Boolean bprepay;
	private String ccusven;
	private Double iamt_f;
	private Double iamt;
	private Double iramt_f;
	private Double iramt;
	private String ckm;
	private String cxmclass;
	private String cxm;
	private String cdepcode;
	private String cpersoncode;
	private String corderid;
	private String citemname;
	private String ccontype;
	private String cconid;
	private Double iamt_s;
	private Double iramt_s;
	private String iordertype;
	private String cdlcode;
	private String ccitemcode;
	private Long registerflag;
	private String cdefine22;
	private String cdefine23;
	private String cdefine24;
	private String cdefine25;
	private Double cdefine26;
	private Double cdefine27;
	private String cdefine28;
	private String cdefine29;
	private String cdefine30;
	private String cdefine31;
	private String cdefine32;
	private String cdefine33;
	private Long cdefine34;
	private Long cdefine35;
	private Timestamp cdefine36;
	private Timestamp cdefine37;
	private String cstagecode;
	private String ccovouchid;
	private String cexecid;
	private String cmemo;
	private Long isrcclosesid;
	private Double ifaresettled_f;
	private String cebordercode;

	@Override
	public String findKeyColumnName()
	{
		return "id";
	}

	@Override
	public String findParentKeyColumnName()
	{
		return "iid";
	}

	@Override
	public String findTableName()
	{
		return "ap_closebills";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "ApClosebills";
	}

	@Override
	public String getCnName()
	{
		return "收款付款单子表";
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

		pros.put("iid", "iid");
		pros.put("id", "id");
		pros.put("itype", "itype");
		pros.put("bprepay", "bprepay");
		pros.put("ccusven", "ccusven");
		pros.put("iamt_f", "iamt_f");
		pros.put("iamt", "iamt");
		pros.put("iramt_f", "iramt_f");
		pros.put("iramt", "iramt");
		pros.put("ckm", "ckm");
		pros.put("cxmclass", "cxmclass");
		pros.put("cxm", "cxm");
		pros.put("cdepcode", "cdepcode");
		pros.put("cpersoncode", "cpersoncode");
		pros.put("corderid", "corderid");
		pros.put("citemname", "citemname");
		pros.put("ccontype", "ccontype");
		pros.put("cconid", "cconid");
		pros.put("iamt_s", "iamt_s");
		pros.put("iramt_s", "iramt_s");
		pros.put("iordertype", "iordertype");
		pros.put("cdlcode", "cdlcode");
		pros.put("ccitemcode", "ccitemcode");
		pros.put("registerflag", "registerflag");
		pros.put("cdefine22", "cdefine22");
		pros.put("cdefine23", "cdefine23");
		pros.put("cdefine24", "cdefine24");
		pros.put("cdefine25", "cdefine25");
		pros.put("cdefine26", "cdefine26");
		pros.put("cdefine27", "cdefine27");
		pros.put("cdefine28", "cdefine28");
		pros.put("cdefine29", "cdefine29");
		pros.put("cdefine30", "cdefine30");
		pros.put("cdefine31", "cdefine31");
		pros.put("cdefine32", "cdefine32");
		pros.put("cdefine33", "cdefine33");
		pros.put("cdefine34", "cdefine34");
		pros.put("cdefine35", "cdefine35");
		pros.put("cdefine36", "cdefine36");
		pros.put("cdefine37", "cdefine37");
		pros.put("cstagecode", "cstagecode");
		pros.put("ccovouchid", "ccovouchid");
		pros.put("cexecid", "cexecid");
		pros.put("cmemo", "cmemo");
		pros.put("isrcclosesid", "isrcclosesid");
		pros.put("ifaresettled_f", "ifaresettled_f");
		pros.put("cebordercode", "cebordercode");
		return pros;
	}

	public Long getIid()
	{
		return iid;
	}

	public void setIid(Long iid)
	{
		this.iid = iid;
	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getItype()
	{
		return itype;
	}

	public void setItype(String itype)
	{
		this.itype = itype;
	}

	public Boolean getBprepay()
	{
		return bprepay;
	}

	public void setBprepay(Boolean bprepay)
	{
		this.bprepay = bprepay;
	}

	public String getCcusven()
	{
		return ccusven;
	}

	public void setCcusven(String ccusven)
	{
		this.ccusven = ccusven;
	}

	public Double getIamt_f()
	{
		return iamt_f;
	}

	public void setIamt_f(Double iamt_f)
	{
		this.iamt_f = iamt_f;
	}

	public Double getIamt()
	{
		return iamt;
	}

	public void setIamt(Double iamt)
	{
		this.iamt = iamt;
	}

	public Double getIramt_f()
	{
		return iramt_f;
	}

	public void setIramt_f(Double iramt_f)
	{
		this.iramt_f = iramt_f;
	}

	public Double getIramt()
	{
		return iramt;
	}

	public void setIramt(Double iramt)
	{
		this.iramt = iramt;
	}

	public String getCkm()
	{
		return ckm;
	}

	public void setCkm(String ckm)
	{
		this.ckm = ckm;
	}

	public String getCxmclass()
	{
		return cxmclass;
	}

	public void setCxmclass(String cxmclass)
	{
		this.cxmclass = cxmclass;
	}

	public String getCxm()
	{
		return cxm;
	}

	public void setCxm(String cxm)
	{
		this.cxm = cxm;
	}

	public String getCdepcode()
	{
		return cdepcode;
	}

	public void setCdepcode(String cdepcode)
	{
		this.cdepcode = cdepcode;
	}

	public String getCpersoncode()
	{
		return cpersoncode;
	}

	public void setCpersoncode(String cpersoncode)
	{
		this.cpersoncode = cpersoncode;
	}

	public String getCorderid()
	{
		return corderid;
	}

	public void setCorderid(String corderid)
	{
		this.corderid = corderid;
	}

	public String getCitemname()
	{
		return citemname;
	}

	public void setCitemname(String citemname)
	{
		this.citemname = citemname;
	}

	public String getCcontype()
	{
		return ccontype;
	}

	public void setCcontype(String ccontype)
	{
		this.ccontype = ccontype;
	}

	public String getCconid()
	{
		return cconid;
	}

	public void setCconid(String cconid)
	{
		this.cconid = cconid;
	}

	public Double getIamt_s()
	{
		return iamt_s;
	}

	public void setIamt_s(Double iamt_s)
	{
		this.iamt_s = iamt_s;
	}

	public Double getIramt_s()
	{
		return iramt_s;
	}

	public void setIramt_s(Double iramt_s)
	{
		this.iramt_s = iramt_s;
	}

	public String getIordertype()
	{
		return iordertype;
	}

	public void setIordertype(String iordertype)
	{
		this.iordertype = iordertype;
	}

	public String getCdlcode()
	{
		return cdlcode;
	}

	public void setCdlcode(String cdlcode)
	{
		this.cdlcode = cdlcode;
	}

	public String getCcitemcode()
	{
		return ccitemcode;
	}

	public void setCcitemcode(String ccitemcode)
	{
		this.ccitemcode = ccitemcode;
	}

	public Long getRegisterflag()
	{
		return registerflag;
	}

	public void setRegisterflag(Long registerflag)
	{
		this.registerflag = registerflag;
	}

	public String getCdefine22()
	{
		return cdefine22;
	}

	public void setCdefine22(String cdefine22)
	{
		this.cdefine22 = cdefine22;
	}

	public String getCdefine23()
	{
		return cdefine23;
	}

	public void setCdefine23(String cdefine23)
	{
		this.cdefine23 = cdefine23;
	}

	public String getCdefine24()
	{
		return cdefine24;
	}

	public void setCdefine24(String cdefine24)
	{
		this.cdefine24 = cdefine24;
	}

	public String getCdefine25()
	{
		return cdefine25;
	}

	public void setCdefine25(String cdefine25)
	{
		this.cdefine25 = cdefine25;
	}

	public Double getCdefine26()
	{
		return cdefine26;
	}

	public void setCdefine26(Double cdefine26)
	{
		this.cdefine26 = cdefine26;
	}

	public Double getCdefine27()
	{
		return cdefine27;
	}

	public void setCdefine27(Double cdefine27)
	{
		this.cdefine27 = cdefine27;
	}

	public String getCdefine28()
	{
		return cdefine28;
	}

	public void setCdefine28(String cdefine28)
	{
		this.cdefine28 = cdefine28;
	}

	public String getCdefine29()
	{
		return cdefine29;
	}

	public void setCdefine29(String cdefine29)
	{
		this.cdefine29 = cdefine29;
	}

	public String getCdefine30()
	{
		return cdefine30;
	}

	public void setCdefine30(String cdefine30)
	{
		this.cdefine30 = cdefine30;
	}

	public String getCdefine31()
	{
		return cdefine31;
	}

	public void setCdefine31(String cdefine31)
	{
		this.cdefine31 = cdefine31;
	}

	public String getCdefine32()
	{
		return cdefine32;
	}

	public void setCdefine32(String cdefine32)
	{
		this.cdefine32 = cdefine32;
	}

	public String getCdefine33()
	{
		return cdefine33;
	}

	public void setCdefine33(String cdefine33)
	{
		this.cdefine33 = cdefine33;
	}

	public Long getCdefine34()
	{
		return cdefine34;
	}

	public void setCdefine34(Long cdefine34)
	{
		this.cdefine34 = cdefine34;
	}

	public Long getCdefine35()
	{
		return cdefine35;
	}

	public void setCdefine35(Long cdefine35)
	{
		this.cdefine35 = cdefine35;
	}

	public Timestamp getCdefine36()
	{
		return cdefine36;
	}

	public void setCdefine36(Timestamp cdefine36)
	{
		this.cdefine36 = cdefine36;
	}

	public Timestamp getCdefine37()
	{
		return cdefine37;
	}

	public void setCdefine37(Timestamp cdefine37)
	{
		this.cdefine37 = cdefine37;
	}

	public String getCstagecode()
	{
		return cstagecode;
	}

	public void setCstagecode(String cstagecode)
	{
		this.cstagecode = cstagecode;
	}

	public String getCcovouchid()
	{
		return ccovouchid;
	}

	public void setCcovouchid(String ccovouchid)
	{
		this.ccovouchid = ccovouchid;
	}

	public String getCexecid()
	{
		return cexecid;
	}

	public void setCexecid(String cexecid)
	{
		this.cexecid = cexecid;
	}

	public String getCmemo()
	{
		return cmemo;
	}

	public void setCmemo(String cmemo)
	{
		this.cmemo = cmemo;
	}

	public Long getIsrcclosesid()
	{
		return isrcclosesid;
	}

	public void setIsrcclosesid(Long isrcclosesid)
	{
		this.isrcclosesid = isrcclosesid;
	}

	public Double getIfaresettled_f()
	{
		return ifaresettled_f;
	}

	public void setIfaresettled_f(Double ifaresettled_f)
	{
		this.ifaresettled_f = ifaresettled_f;
	}

	public String getCebordercode()
	{
		return cebordercode;
	}

	public void setCebordercode(String cebordercode)
	{
		this.cebordercode = cebordercode;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
