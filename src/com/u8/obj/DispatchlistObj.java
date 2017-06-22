package com.u8.obj;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

public class DispatchlistObj extends AbstractDataSyncObj
{
	private Long dlid;
	private String cdlcode;
	private String cvouchtype;
	private String cstcode;
	private Timestamp ddate;
	private String crdcode;
	private String cdepcode;
	private String cpersoncode;
	private Long sbvid;
	private String csbvcode;
	private String csocode;
	private String ccuscode;
	private String cpaycode;
	private String csccode;
	private String cshipaddress;
	private String cexch_name;
	private Double iexchrate;
	private Double itaxrate;
	private Boolean bfirst;
	private Boolean breturnflag;
	private Boolean bsettleall;
	private String cmemo;
	private String csaleout;
	private String cdefine1;
	private String cdefine2;
	private String cdefine3;
	private Timestamp cdefine4;
	private Long cdefine5;
	private Timestamp cdefine6;
	private Double cdefine7;
	private String cdefine8;
	private String cdefine9;
	private String cdefine10;
	private String cverifier;
	private String cmaker;
	private Double inetlock;
	private Long isale;
	private String ccusname;
	private Long ivtid;
//	private String ufts;
	private String cbustype;
	private String ccloser;
	private String caccounter;
	private String ccrechpname;
	private String cdefine11;
	private String cdefine12;
	private String cdefine13;
	private String cdefine14;
	private Long cdefine15;
	private Double cdefine16;
	private Boolean biafirst;
	private Long ioutgolden;
	private String cgatheringplan;
	private Timestamp dcreditstart;
	private Timestamp dgatheringdate;
	private Long icreditdays;
	private Boolean bcredit;
	private String caddcode;
	private Long iverifystate;
	private String ireturncount;
	private String iswfcontrolled;
	private String icreditstate;
	private Boolean barfirst;
	private String cmodifier;
	private Timestamp dmoddate;
	private Timestamp dverifydate;
	private String ccusperson;
	private Timestamp dcreatesystime;
	private Timestamp dverifysystime;
	private Timestamp dmodifysystime;
	private String csvouchtype;
	private Long iflowid;
	private Boolean bsigncreate;
	private Boolean bcashsale;
	private String cgathingcode;
	private String cchanger;
	private String cchangememo;
	private String outid;
	private Boolean bmustbook;
	private String cbookdepcode;
	private String cbooktype;
	private Boolean bsaused;
	private Boolean bneedbill;
	private Boolean baccswitchflag;
	private Long iprintcount;
	private String ccuspersoncode;
	private String csourcecode;
	private Boolean bsaleoutcreatebill;
	private String csysbarcode;
	private String ccurrentauditor;
	private String csscode;
	private String cinvoicecompany;
	private Double febweight;
	private String cebweightunit;
	private String cebexpresscode;
	private Long iebexpresscoid;
	private Long separateid;
	private String bnottogoldtax;

	@Override
	public String findKeyColumnName()
	{
		return "dlid";
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
		return "dispatchlist";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "Dispatchlist";
	}

	@Override
	public String getCnName()
	{
		return "销售出库单";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "cvouchtype","cdlcode" });
	}
	
	@Override
	public Class findChildClz()
	{
		return DispatchlistsObj.class;
	}
	
	@Override
	public Map<String, String> findMainObjColumnMap()
	{
		Map<String, String> columnMap = new HashMap<String, String>();
		columnMap.put("cdepcode", "部门档案");
		columnMap.put("ccuscode", "客户档案");
		columnMap.put("cpersoncode", "业务员档案");
		columnMap.put("csscode", "结算方式");
		return columnMap;
	}
	
	@Override
	public Map<String, String> findChildObjColumnMap()
	{
		Map<String, String> columnMap = new HashMap<String, String>();
		columnMap.put("cwhcode", "仓库档案");
		columnMap.put("cinvcode", "存货档案");
		return columnMap;
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("dlid", "编码");
		pros.put("cdlcode", "单据号");
		pros.put("cvouchtype", "单据类型编码");
		pros.put("cstcode", "cstcode");
		pros.put("ddate", "单据日期");
		pros.put("crdcode", "crdcode");
		pros.put("cdepcode", "部门编码");
		pros.put("cpersoncode", "cpersoncode");
		pros.put("sbvid", "sbvid");
		pros.put("csbvcode", "csbvcode");
		pros.put("csocode", "csocode");
		pros.put("ccuscode", "客户编码");
		pros.put("cpaycode", "cpaycode");
		pros.put("csccode", "csccode");
		pros.put("cshipaddress", "cshipaddress");
		pros.put("cexch_name", "cexch_name");
		pros.put("iexchrate", "iexchrate");
		pros.put("itaxrate", "itaxrate");
		pros.put("bfirst", "bfirst");
		pros.put("breturnflag", "breturnflag");
		pros.put("bsettleall", "bsettleall");
		pros.put("cmemo", "cmemo");
		pros.put("csaleout", "csaleout");
		pros.put("cdefine1", "cdefine1");
		pros.put("cdefine2", "cdefine2");
		pros.put("cdefine3", "cdefine3");
		pros.put("cdefine4", "cdefine4");
		pros.put("cdefine5", "cdefine5");
		pros.put("cdefine6", "cdefine6");
		pros.put("cdefine7", "cdefine7");
		pros.put("cdefine8", "cdefine8");
		pros.put("cdefine9", "cdefine9");
		pros.put("cdefine10", "cdefine10");
		pros.put("cverifier", "cverifier");
		pros.put("cmaker", "cmaker");
		pros.put("inetlock", "inetlock");
		pros.put("isale", "isale");
		pros.put("ccusname", "ccusname");
		pros.put("ivtid", "ivtid");
		pros.put("ufts", "ufts");
		pros.put("cbustype", "cbustype");
		pros.put("ccloser", "ccloser");
		pros.put("caccounter", "caccounter");
		pros.put("ccrechpname", "ccrechpname");
		pros.put("cdefine11", "cdefine11");
		pros.put("cdefine12", "cdefine12");
		pros.put("cdefine13", "cdefine13");
		pros.put("cdefine14", "cdefine14");
		pros.put("cdefine15", "cdefine15");
		pros.put("cdefine16", "cdefine16");
		pros.put("biafirst", "biafirst");
		pros.put("ioutgolden", "ioutgolden");
		pros.put("cgatheringplan", "cgatheringplan");
		pros.put("dcreditstart", "dcreditstart");
		pros.put("dgatheringdate", "dgatheringdate");
		pros.put("icreditdays", "icreditdays");
		pros.put("bcredit", "bcredit");
		pros.put("caddcode", "caddcode");
		pros.put("iverifystate", "iverifystate");
		pros.put("ireturncount", "ireturncount");
		pros.put("iswfcontrolled", "iswfcontrolled");
		pros.put("icreditstate", "icreditstate");
		pros.put("barfirst", "barfirst");
		pros.put("cmodifier", "cmodifier");
		pros.put("dmoddate", "dmoddate");
		pros.put("dverifydate", "dverifydate");
		pros.put("ccusperson", "ccusperson");
		pros.put("dcreatesystime", "dcreatesystime");
		pros.put("dverifysystime", "dverifysystime");
		pros.put("dmodifysystime", "dmodifysystime");
		pros.put("csvouchtype", "csvouchtype");
		pros.put("iflowid", "iflowid");
		pros.put("bsigncreate", "bsigncreate");
		pros.put("bcashsale", "bcashsale");
		pros.put("cgathingcode", "cgathingcode");
		pros.put("cchanger", "cchanger");
		pros.put("cchangememo", "cchangememo");
		pros.put("outid", "outid");
		pros.put("bmustbook", "bmustbook");
		pros.put("cbookdepcode", "cbookdepcode");
		pros.put("cbooktype", "cbooktype");
		pros.put("bsaused", "bsaused");
		pros.put("bneedbill", "bneedbill");
		pros.put("baccswitchflag", "baccswitchflag");
		pros.put("iprintcount", "iprintcount");
		pros.put("ccuspersoncode", "ccuspersoncode");
		pros.put("csourcecode", "csourcecode");
		pros.put("bsaleoutcreatebill", "bsaleoutcreatebill");
		pros.put("csysbarcode", "csysbarcode");
		pros.put("ccurrentauditor", "ccurrentauditor");
		pros.put("csscode", "csscode");
		pros.put("cinvoicecompany", "cinvoicecompany");
		pros.put("febweight", "febweight");
		pros.put("cebweightunit", "cebweightunit");
		pros.put("cebexpresscode", "cebexpresscode");
		pros.put("iebexpresscoid", "iebexpresscoid");
		pros.put("separateid", "separateid");
		pros.put("bnottogoldtax", "bnottogoldtax");
		pros.put("alreadysaved", "是否已导入");
		return pros;
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

	public String getCvouchtype()
	{
		return cvouchtype;
	}

	public void setCvouchtype(String cvouchtype)
	{
		this.cvouchtype = cvouchtype;
	}

	public String getCstcode()
	{
		return cstcode;
	}

	public void setCstcode(String cstcode)
	{
		this.cstcode = cstcode;
	}

	public Timestamp getDdate()
	{
		return ddate;
	}

	public void setDdate(Timestamp ddate)
	{
		this.ddate = ddate;
	}

	public String getCrdcode()
	{
		return crdcode;
	}

	public void setCrdcode(String crdcode)
	{
		this.crdcode = crdcode;
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

	public Long getSbvid()
	{
		return sbvid;
	}

	public void setSbvid(Long sbvid)
	{
		this.sbvid = sbvid;
	}

	public String getCsbvcode()
	{
		return csbvcode;
	}

	public void setCsbvcode(String csbvcode)
	{
		this.csbvcode = csbvcode;
	}

	public String getCsocode()
	{
		return csocode;
	}

	public void setCsocode(String csocode)
	{
		this.csocode = csocode;
	}

	public String getCcuscode()
	{
		return ccuscode;
	}

	public void setCcuscode(String ccuscode)
	{
		this.ccuscode = ccuscode;
	}

	public String getCpaycode()
	{
		return cpaycode;
	}

	public void setCpaycode(String cpaycode)
	{
		this.cpaycode = cpaycode;
	}

	public String getCsccode()
	{
		return csccode;
	}

	public void setCsccode(String csccode)
	{
		this.csccode = csccode;
	}

	public String getCshipaddress()
	{
		return cshipaddress;
	}

	public void setCshipaddress(String cshipaddress)
	{
		this.cshipaddress = cshipaddress;
	}

	public String getCexch_name()
	{
		return cexch_name;
	}

	public void setCexch_name(String cexch_name)
	{
		this.cexch_name = cexch_name;
	}

	public Double getIexchrate()
	{
		return iexchrate;
	}

	public void setIexchrate(Double iexchrate)
	{
		this.iexchrate = iexchrate;
	}

	public Double getItaxrate()
	{
		return itaxrate;
	}

	public void setItaxrate(Double itaxrate)
	{
		this.itaxrate = itaxrate;
	}

	public Boolean getBfirst()
	{
		return bfirst;
	}

	public void setBfirst(Boolean bfirst)
	{
		this.bfirst = bfirst;
	}

	public Boolean getBreturnflag()
	{
		return breturnflag;
	}

	public void setBreturnflag(Boolean breturnflag)
	{
		this.breturnflag = breturnflag;
	}

	public Boolean getBsettleall()
	{
		return bsettleall;
	}

	public void setBsettleall(Boolean bsettleall)
	{
		this.bsettleall = bsettleall;
	}

	public String getCmemo()
	{
		return cmemo;
	}

	public void setCmemo(String cmemo)
	{
		this.cmemo = cmemo;
	}

	public String getCsaleout()
	{
		return csaleout;
	}

	public void setCsaleout(String csaleout)
	{
		this.csaleout = csaleout;
	}

	public String getCdefine1()
	{
		return cdefine1;
	}

	public void setCdefine1(String cdefine1)
	{
		this.cdefine1 = cdefine1;
	}

	public String getCdefine2()
	{
		return cdefine2;
	}

	public void setCdefine2(String cdefine2)
	{
		this.cdefine2 = cdefine2;
	}

	public String getCdefine3()
	{
		return cdefine3;
	}

	public void setCdefine3(String cdefine3)
	{
		this.cdefine3 = cdefine3;
	}

	public Timestamp getCdefine4()
	{
		return cdefine4;
	}

	public void setCdefine4(Timestamp cdefine4)
	{
		this.cdefine4 = cdefine4;
	}

	public Long getCdefine5()
	{
		return cdefine5;
	}

	public void setCdefine5(Long cdefine5)
	{
		this.cdefine5 = cdefine5;
	}

	public Timestamp getCdefine6()
	{
		return cdefine6;
	}

	public void setCdefine6(Timestamp cdefine6)
	{
		this.cdefine6 = cdefine6;
	}

	public Double getCdefine7()
	{
		return cdefine7;
	}

	public void setCdefine7(Double cdefine7)
	{
		this.cdefine7 = cdefine7;
	}

	public String getCdefine8()
	{
		return cdefine8;
	}

	public void setCdefine8(String cdefine8)
	{
		this.cdefine8 = cdefine8;
	}

	public String getCdefine9()
	{
		return cdefine9;
	}

	public void setCdefine9(String cdefine9)
	{
		this.cdefine9 = cdefine9;
	}

	public String getCdefine10()
	{
		return cdefine10;
	}

	public void setCdefine10(String cdefine10)
	{
		this.cdefine10 = cdefine10;
	}

	public String getCverifier()
	{
		return cverifier;
	}

	public void setCverifier(String cverifier)
	{
		this.cverifier = cverifier;
	}

	public String getCmaker()
	{
		return cmaker;
	}

	public void setCmaker(String cmaker)
	{
		this.cmaker = cmaker;
	}

	public Double getInetlock()
	{
		return inetlock;
	}

	public void setInetlock(Double inetlock)
	{
		this.inetlock = inetlock;
	}

	public Long getIsale()
	{
		return isale;
	}

	public void setIsale(Long isale)
	{
		this.isale = isale;
	}

	public String getCcusname()
	{
		return ccusname;
	}

	public void setCcusname(String ccusname)
	{
		this.ccusname = ccusname;
	}

	public Long getIvtid()
	{
		return ivtid;
	}

	public void setIvtid(Long ivtid)
	{
		this.ivtid = ivtid;
	}

//	public String getUfts()
//	{
//		return ufts;
//	}
//
//	public void setUfts(String ufts)
//	{
//		this.ufts = ufts;
//	}

	public String getCbustype()
	{
		return cbustype;
	}

	public void setCbustype(String cbustype)
	{
		this.cbustype = cbustype;
	}

	public String getCcloser()
	{
		return ccloser;
	}

	public void setCcloser(String ccloser)
	{
		this.ccloser = ccloser;
	}

	public String getCaccounter()
	{
		return caccounter;
	}

	public void setCaccounter(String caccounter)
	{
		this.caccounter = caccounter;
	}

	public String getCcrechpname()
	{
		return ccrechpname;
	}

	public void setCcrechpname(String ccrechpname)
	{
		this.ccrechpname = ccrechpname;
	}

	public String getCdefine11()
	{
		return cdefine11;
	}

	public void setCdefine11(String cdefine11)
	{
		this.cdefine11 = cdefine11;
	}

	public String getCdefine12()
	{
		return cdefine12;
	}

	public void setCdefine12(String cdefine12)
	{
		this.cdefine12 = cdefine12;
	}

	public String getCdefine13()
	{
		return cdefine13;
	}

	public void setCdefine13(String cdefine13)
	{
		this.cdefine13 = cdefine13;
	}

	public String getCdefine14()
	{
		return cdefine14;
	}

	public void setCdefine14(String cdefine14)
	{
		this.cdefine14 = cdefine14;
	}

	public Long getCdefine15()
	{
		return cdefine15;
	}

	public void setCdefine15(Long cdefine15)
	{
		this.cdefine15 = cdefine15;
	}

	public Double getCdefine16()
	{
		return cdefine16;
	}

	public void setCdefine16(Double cdefine16)
	{
		this.cdefine16 = cdefine16;
	}

	public Boolean getBiafirst()
	{
		return biafirst;
	}

	public void setBiafirst(Boolean biafirst)
	{
		this.biafirst = biafirst;
	}

	public Long getIoutgolden()
	{
		return ioutgolden;
	}

	public void setIoutgolden(Long ioutgolden)
	{
		this.ioutgolden = ioutgolden;
	}

	public String getCgatheringplan()
	{
		return cgatheringplan;
	}

	public void setCgatheringplan(String cgatheringplan)
	{
		this.cgatheringplan = cgatheringplan;
	}

	public Timestamp getDcreditstart()
	{
		return dcreditstart;
	}

	public void setDcreditstart(Timestamp dcreditstart)
	{
		this.dcreditstart = dcreditstart;
	}

	public Timestamp getDgatheringdate()
	{
		return dgatheringdate;
	}

	public void setDgatheringdate(Timestamp dgatheringdate)
	{
		this.dgatheringdate = dgatheringdate;
	}

	public Long getIcreditdays()
	{
		return icreditdays;
	}

	public void setIcreditdays(Long icreditdays)
	{
		this.icreditdays = icreditdays;
	}

	public Boolean getBcredit()
	{
		return bcredit;
	}

	public void setBcredit(Boolean bcredit)
	{
		this.bcredit = bcredit;
	}

	public String getCaddcode()
	{
		return caddcode;
	}

	public void setCaddcode(String caddcode)
	{
		this.caddcode = caddcode;
	}

	public Long getIverifystate()
	{
		return iverifystate;
	}

	public void setIverifystate(Long iverifystate)
	{
		this.iverifystate = iverifystate;
	}

	public String getIreturncount()
	{
		return ireturncount;
	}

	public void setIreturncount(String ireturncount)
	{
		this.ireturncount = ireturncount;
	}

	public String getIswfcontrolled()
	{
		return iswfcontrolled;
	}

	public void setIswfcontrolled(String iswfcontrolled)
	{
		this.iswfcontrolled = iswfcontrolled;
	}

	public String getIcreditstate()
	{
		return icreditstate;
	}

	public void setIcreditstate(String icreditstate)
	{
		this.icreditstate = icreditstate;
	}

	public Boolean getBarfirst()
	{
		return barfirst;
	}

	public void setBarfirst(Boolean barfirst)
	{
		this.barfirst = barfirst;
	}

	public String getCmodifier()
	{
		return cmodifier;
	}

	public void setCmodifier(String cmodifier)
	{
		this.cmodifier = cmodifier;
	}

	public Timestamp getDmoddate()
	{
		return dmoddate;
	}

	public void setDmoddate(Timestamp dmoddate)
	{
		this.dmoddate = dmoddate;
	}

	public Timestamp getDverifydate()
	{
		return dverifydate;
	}

	public void setDverifydate(Timestamp dverifydate)
	{
		this.dverifydate = dverifydate;
	}

	public String getCcusperson()
	{
		return ccusperson;
	}

	public void setCcusperson(String ccusperson)
	{
		this.ccusperson = ccusperson;
	}

	public Timestamp getDcreatesystime()
	{
		return dcreatesystime;
	}

	public void setDcreatesystime(Timestamp dcreatesystime)
	{
		this.dcreatesystime = dcreatesystime;
	}

	public Timestamp getDverifysystime()
	{
		return dverifysystime;
	}

	public void setDverifysystime(Timestamp dverifysystime)
	{
		this.dverifysystime = dverifysystime;
	}

	public Timestamp getDmodifysystime()
	{
		return dmodifysystime;
	}

	public void setDmodifysystime(Timestamp dmodifysystime)
	{
		this.dmodifysystime = dmodifysystime;
	}

	public String getCsvouchtype()
	{
		return csvouchtype;
	}

	public void setCsvouchtype(String csvouchtype)
	{
		this.csvouchtype = csvouchtype;
	}

	public Long getIflowid()
	{
		return iflowid;
	}

	public void setIflowid(Long iflowid)
	{
		this.iflowid = iflowid;
	}

	public Boolean getBsigncreate()
	{
		return bsigncreate;
	}

	public void setBsigncreate(Boolean bsigncreate)
	{
		this.bsigncreate = bsigncreate;
	}

	public Boolean getBcashsale()
	{
		return bcashsale;
	}

	public void setBcashsale(Boolean bcashsale)
	{
		this.bcashsale = bcashsale;
	}

	public String getCgathingcode()
	{
		return cgathingcode;
	}

	public void setCgathingcode(String cgathingcode)
	{
		this.cgathingcode = cgathingcode;
	}

	public String getCchanger()
	{
		return cchanger;
	}

	public void setCchanger(String cchanger)
	{
		this.cchanger = cchanger;
	}

	public String getCchangememo()
	{
		return cchangememo;
	}

	public void setCchangememo(String cchangememo)
	{
		this.cchangememo = cchangememo;
	}

	public String getOutid()
	{
		return outid;
	}

	public void setOutid(String outid)
	{
		this.outid = outid;
	}

	public Boolean getBmustbook()
	{
		return bmustbook;
	}

	public void setBmustbook(Boolean bmustbook)
	{
		this.bmustbook = bmustbook;
	}

	public String getCbookdepcode()
	{
		return cbookdepcode;
	}

	public void setCbookdepcode(String cbookdepcode)
	{
		this.cbookdepcode = cbookdepcode;
	}

	public String getCbooktype()
	{
		return cbooktype;
	}

	public void setCbooktype(String cbooktype)
	{
		this.cbooktype = cbooktype;
	}

	public Boolean getBsaused()
	{
		return bsaused;
	}

	public void setBsaused(Boolean bsaused)
	{
		this.bsaused = bsaused;
	}

	public Boolean getBneedbill()
	{
		return bneedbill;
	}

	public void setBneedbill(Boolean bneedbill)
	{
		this.bneedbill = bneedbill;
	}

	public Boolean getBaccswitchflag()
	{
		return baccswitchflag;
	}

	public void setBaccswitchflag(Boolean baccswitchflag)
	{
		this.baccswitchflag = baccswitchflag;
	}

	public Long getIprintcount()
	{
		return iprintcount;
	}

	public void setIprintcount(Long iprintcount)
	{
		this.iprintcount = iprintcount;
	}

	public String getCcuspersoncode()
	{
		return ccuspersoncode;
	}

	public void setCcuspersoncode(String ccuspersoncode)
	{
		this.ccuspersoncode = ccuspersoncode;
	}

	public String getCsourcecode()
	{
		return csourcecode;
	}

	public void setCsourcecode(String csourcecode)
	{
		this.csourcecode = csourcecode;
	}

	public Boolean getBsaleoutcreatebill()
	{
		return bsaleoutcreatebill;
	}

	public void setBsaleoutcreatebill(Boolean bsaleoutcreatebill)
	{
		this.bsaleoutcreatebill = bsaleoutcreatebill;
	}

	public String getCsysbarcode()
	{
		return csysbarcode;
	}

	public void setCsysbarcode(String csysbarcode)
	{
		this.csysbarcode = csysbarcode;
	}

	public String getCcurrentauditor()
	{
		return ccurrentauditor;
	}

	public void setCcurrentauditor(String ccurrentauditor)
	{
		this.ccurrentauditor = ccurrentauditor;
	}

	public String getCsscode()
	{
		return csscode;
	}

	public void setCsscode(String csscode)
	{
		this.csscode = csscode;
	}

	public String getCinvoicecompany()
	{
		return cinvoicecompany;
	}

	public void setCinvoicecompany(String cinvoicecompany)
	{
		this.cinvoicecompany = cinvoicecompany;
	}

	public Double getFebweight()
	{
		return febweight;
	}

	public void setFebweight(Double febweight)
	{
		this.febweight = febweight;
	}

	public String getCebweightunit()
	{
		return cebweightunit;
	}

	public void setCebweightunit(String cebweightunit)
	{
		this.cebweightunit = cebweightunit;
	}

	public String getCebexpresscode()
	{
		return cebexpresscode;
	}

	public void setCebexpresscode(String cebexpresscode)
	{
		this.cebexpresscode = cebexpresscode;
	}

	public Long getIebexpresscoid()
	{
		return iebexpresscoid;
	}

	public void setIebexpresscoid(Long iebexpresscoid)
	{
		this.iebexpresscoid = iebexpresscoid;
	}

	public Long getSeparateid()
	{
		return separateid;
	}

	public void setSeparateid(Long separateid)
	{
		this.separateid = separateid;
	}

	public String getBnottogoldtax()
	{
		return bnottogoldtax;
	}

	public void setBnottogoldtax(String bnottogoldtax)
	{
		this.bnottogoldtax = bnottogoldtax;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
