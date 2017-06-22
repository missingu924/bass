package com.u8.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

public class ApClosebillObj extends AbstractDataSyncObj
{
	private String cvouchtype;
	private String cvouchid;
	private Timestamp dvouchdate;
	private String iperiod;
	private String cdwcode;
	private String cdeptcode;
	private String cperson;
	private String citem_class;
	private String citemcode;
	private String csscode;
	private String cnoteno;
	private String ccovouchtype;
	private String ccovouchid;
	private String cdigest;
	private String cbankaccount;
	private String cexch_name;
	private Double iexchrate;
	private Double iamount;
	private Double iamount_f;
	private Double iramount;
	private Double iramount_f;
	private String coperator;
	private String ccancelman;
	private String crpman;
	private Boolean bprepay;
	private Boolean bstartflag;
	private String corderno;
	private String ccode;
	private String cprecode;
	private Boolean ipayforother;
	private String csrcflag;
	private String cpzid;
	private String cflag;
	private Boolean bsend;
	private Boolean breceived;
	private String csitemcode;
	private Long iid;
	private String ccancelno;
	private String cbank;
	private String cnatbank;
	private String cnatbankaccount;
	private Boolean bfrombank;
	private Boolean btobank;
	private Boolean bsure;
	private Long vt_id;
	private String ccheckman;
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
	private String cdefine11;
	private String cdefine12;
	private String cdefine13;
	private String cdefine14;
	private Long cdefine15;
	private Double cdefine16;
	// private String ufts;
	private String citemname;
	private String ccontracttype;
	private String ccontractid;
	private Double iamount_s;
	private Boolean iswfcontrolled;
	private String isource;
	private String sdlcode;
	private Long registerflag;
	private Long iverifystate;
	private Long ireturncount;
	private Timestamp dcreatesystime;
	private Timestamp dverifysystime;
	private Timestamp dmodifysystime;
	private String cmodifier;
	private Timestamp dmoddate;
	private Timestamp dverifydate;
	private Long ibg_overflag;
	private String cbg_auditor;
	private String cbg_audittime;
	private Long controlresult;
	private String cbg_itemcode;
	private String cbg_itemname;
	private String cbg_caliberkey1;
	private String cbg_caliberkeyname1;
	private String cbg_caliberkey2;
	private String cbg_caliberkeyname2;
	private String cbg_caliberkey3;
	private String cbg_caliberkeyname3;
	private String cbg_calibercode1;
	private String cbg_calibername1;
	private String cbg_calibercode2;
	private String cbg_calibername2;
	private String cbg_calibercode3;
	private String cbg_calibername3;
	private Boolean ibg_ctrl;
	private String cbg_auditopinion;
	private String capplycode;
	private String cpznum;
	private Timestamp doutbilldate;
	private String cbg_caliberkey4;
	private String cbg_caliberkeyname4;
	private String cbg_caliberkey5;
	private String cbg_caliberkeyname5;
	private String cbg_caliberkey6;
	private String cbg_caliberkeyname6;
	private String cbg_calibercode4;
	private String cbg_calibername4;
	private String cbg_calibercode5;
	private String cbg_calibername5;
	private String cbg_calibercode6;
	private String cbg_calibername6;
	private Long iprintcount;
	private String creservedeptcode;
	private Boolean bdealmode;
	private Long ibustype;
	private Long ipaytype;
	private String cagentcuscode;
	private String csysbarcode;
	private String ccurrentauditor;
	private Long lacctid;

	@Override
	public String findKeyColumnName()
	{
		return "iid";
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
		return "ap_closebill";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "ApClosebill";
	}

	@Override
	public String getCnName()
	{
		return "付款收款单";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "cvouchtype", "cvouchid" });
	}

	@Override
	public Class findChildClz()
	{
		return ApClosebillsObj.class;
	}
	
	@Override
	public Map<String, String> findMainObjColumnMap()
	{
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Map<String, String> findChildObjColumnMap()
	{
		// TODO Auto-generated method stub
		return null;
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("cvouchtype", "单据类型");
		pros.put("cvouchid", "单据号");
		pros.put("dvouchdate", "单据日期");
		pros.put("iperiod", "期间");
		pros.put("cdwcode", "cdwcode");
		pros.put("cdeptcode", "部门编码");
		pros.put("cperson", "cperson");
		pros.put("citem_class", "citem_class");
		pros.put("citemcode", "citemcode");
		pros.put("csscode", "csscode");
		pros.put("cnoteno", "cnoteno");
		pros.put("ccovouchtype", "ccovouchtype");
		pros.put("ccovouchid", "ccovouchid");
		pros.put("cdigest", "cdigest");
		pros.put("cbankaccount", "cbankaccount");
		pros.put("cexch_name", "cexch_name");
		pros.put("iexchrate", "iexchrate");
		pros.put("iamount", "iamount");
		pros.put("iamount_f", "iamount_f");
		pros.put("iramount", "iramount");
		pros.put("iramount_f", "iramount_f");
		pros.put("coperator", "coperator");
		pros.put("ccancelman", "ccancelman");
		pros.put("crpman", "crpman");
		pros.put("bprepay", "bprepay");
		pros.put("bstartflag", "bstartflag");
		pros.put("corderno", "corderno");
		pros.put("ccode", "ccode");
		pros.put("cprecode", "cprecode");
		pros.put("ipayforother", "ipayforother");
		pros.put("csrcflag", "csrcflag");
		pros.put("cpzid", "cpzid");
		pros.put("cflag", "cflag");
		pros.put("bsend", "bsend");
		pros.put("breceived", "breceived");
		pros.put("csitemcode", "csitemcode");
		pros.put("iid", "编码");
		pros.put("ccancelno", "ccancelno");
		pros.put("cbank", "cbank");
		pros.put("cnatbank", "cnatbank");
		pros.put("cnatbankaccount", "cnatbankaccount");
		pros.put("bfrombank", "bfrombank");
		pros.put("btobank", "btobank");
		pros.put("bsure", "bsure");
		pros.put("vt_id", "vt_id");
		pros.put("ccheckman", "ccheckman");
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
		pros.put("cdefine11", "cdefine11");
		pros.put("cdefine12", "cdefine12");
		pros.put("cdefine13", "cdefine13");
		pros.put("cdefine14", "cdefine14");
		pros.put("cdefine15", "cdefine15");
		pros.put("cdefine16", "cdefine16");
		pros.put("ufts", "ufts");
		pros.put("citemname", "citemname");
		pros.put("ccontracttype", "ccontracttype");
		pros.put("ccontractid", "ccontractid");
		pros.put("iamount_s", "iamount_s");
		pros.put("iswfcontrolled", "iswfcontrolled");
		pros.put("isource", "isource");
		pros.put("sdlcode", "sdlcode");
		pros.put("registerflag", "registerflag");
		pros.put("iverifystate", "iverifystate");
		pros.put("ireturncount", "ireturncount");
		pros.put("dcreatesystime", "dcreatesystime");
		pros.put("dverifysystime", "dverifysystime");
		pros.put("dmodifysystime", "dmodifysystime");
		pros.put("cmodifier", "cmodifier");
		pros.put("dmoddate", "dmoddate");
		pros.put("dverifydate", "dverifydate");
		pros.put("ibg_overflag", "ibg_overflag");
		pros.put("cbg_auditor", "cbg_auditor");
		pros.put("cbg_audittime", "cbg_audittime");
		pros.put("controlresult", "controlresult");
		pros.put("cbg_itemcode", "cbg_itemcode");
		pros.put("cbg_itemname", "cbg_itemname");
		pros.put("cbg_caliberkey1", "cbg_caliberkey1");
		pros.put("cbg_caliberkeyname1", "cbg_caliberkeyname1");
		pros.put("cbg_caliberkey2", "cbg_caliberkey2");
		pros.put("cbg_caliberkeyname2", "cbg_caliberkeyname2");
		pros.put("cbg_caliberkey3", "cbg_caliberkey3");
		pros.put("cbg_caliberkeyname3", "cbg_caliberkeyname3");
		pros.put("cbg_calibercode1", "cbg_calibercode1");
		pros.put("cbg_calibername1", "cbg_calibername1");
		pros.put("cbg_calibercode2", "cbg_calibercode2");
		pros.put("cbg_calibername2", "cbg_calibername2");
		pros.put("cbg_calibercode3", "cbg_calibercode3");
		pros.put("cbg_calibername3", "cbg_calibername3");
		pros.put("ibg_ctrl", "ibg_ctrl");
		pros.put("cbg_auditopinion", "cbg_auditopinion");
		pros.put("capplycode", "capplycode");
		pros.put("cpznum", "cpznum");
		pros.put("doutbilldate", "doutbilldate");
		pros.put("cbg_caliberkey4", "cbg_caliberkey4");
		pros.put("cbg_caliberkeyname4", "cbg_caliberkeyname4");
		pros.put("cbg_caliberkey5", "cbg_caliberkey5");
		pros.put("cbg_caliberkeyname5", "cbg_caliberkeyname5");
		pros.put("cbg_caliberkey6", "cbg_caliberkey6");
		pros.put("cbg_caliberkeyname6", "cbg_caliberkeyname6");
		pros.put("cbg_calibercode4", "cbg_calibercode4");
		pros.put("cbg_calibername4", "cbg_calibername4");
		pros.put("cbg_calibercode5", "cbg_calibercode5");
		pros.put("cbg_calibername5", "cbg_calibername5");
		pros.put("cbg_calibercode6", "cbg_calibercode6");
		pros.put("cbg_calibername6", "cbg_calibername6");
		pros.put("iprintcount", "iprintcount");
		pros.put("creservedeptcode", "creservedeptcode");
		pros.put("bdealmode", "bdealmode");
		pros.put("ibustype", "ibustype");
		pros.put("ipaytype", "ipaytype");
		pros.put("cagentcuscode", "cagentcuscode");
		pros.put("csysbarcode", "csysbarcode");
		pros.put("ccurrentauditor", "ccurrentauditor");
		pros.put("lacctid", "lacctid");
		pros.put("alreadysaved", "是否已导入");
		return pros;
	}

	public String getCvouchtype()
	{
		return cvouchtype;
	}

	public void setCvouchtype(String cvouchtype)
	{
		this.cvouchtype = cvouchtype;
	}

	public String getCvouchid()
	{
		return cvouchid;
	}

	public void setCvouchid(String cvouchid)
	{
		this.cvouchid = cvouchid;
	}

	public Timestamp getDvouchdate()
	{
		return dvouchdate;
	}

	public void setDvouchdate(Timestamp dvouchdate)
	{
		this.dvouchdate = dvouchdate;
	}

	public String getIperiod()
	{
		return iperiod;
	}

	public void setIperiod(String iperiod)
	{
		this.iperiod = iperiod;
	}

	public String getCdwcode()
	{
		return cdwcode;
	}

	public void setCdwcode(String cdwcode)
	{
		this.cdwcode = cdwcode;
	}

	public String getCdeptcode()
	{
		return cdeptcode;
	}

	public void setCdeptcode(String cdeptcode)
	{
		this.cdeptcode = cdeptcode;
	}

	public String getCperson()
	{
		return cperson;
	}

	public void setCperson(String cperson)
	{
		this.cperson = cperson;
	}

	public String getCitem_class()
	{
		return citem_class;
	}

	public void setCitem_class(String citem_class)
	{
		this.citem_class = citem_class;
	}

	public String getCitemcode()
	{
		return citemcode;
	}

	public void setCitemcode(String citemcode)
	{
		this.citemcode = citemcode;
	}

	public String getCsscode()
	{
		return csscode;
	}

	public void setCsscode(String csscode)
	{
		this.csscode = csscode;
	}

	public String getCnoteno()
	{
		return cnoteno;
	}

	public void setCnoteno(String cnoteno)
	{
		this.cnoteno = cnoteno;
	}

	public String getCcovouchtype()
	{
		return ccovouchtype;
	}

	public void setCcovouchtype(String ccovouchtype)
	{
		this.ccovouchtype = ccovouchtype;
	}

	public String getCcovouchid()
	{
		return ccovouchid;
	}

	public void setCcovouchid(String ccovouchid)
	{
		this.ccovouchid = ccovouchid;
	}

	public String getCdigest()
	{
		return cdigest;
	}

	public void setCdigest(String cdigest)
	{
		this.cdigest = cdigest;
	}

	public String getCbankaccount()
	{
		return cbankaccount;
	}

	public void setCbankaccount(String cbankaccount)
	{
		this.cbankaccount = cbankaccount;
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

	public Double getIamount()
	{
		return iamount;
	}

	public void setIamount(Double iamount)
	{
		this.iamount = iamount;
	}

	public Double getIamount_f()
	{
		return iamount_f;
	}

	public void setIamount_f(Double iamount_f)
	{
		this.iamount_f = iamount_f;
	}

	public Double getIramount()
	{
		return iramount;
	}

	public void setIramount(Double iramount)
	{
		this.iramount = iramount;
	}

	public Double getIramount_f()
	{
		return iramount_f;
	}

	public void setIramount_f(Double iramount_f)
	{
		this.iramount_f = iramount_f;
	}

	public String getCoperator()
	{
		return coperator;
	}

	public void setCoperator(String coperator)
	{
		this.coperator = coperator;
	}

	public String getCcancelman()
	{
		return ccancelman;
	}

	public void setCcancelman(String ccancelman)
	{
		this.ccancelman = ccancelman;
	}

	public String getCrpman()
	{
		return crpman;
	}

	public void setCrpman(String crpman)
	{
		this.crpman = crpman;
	}

	public Boolean getBprepay()
	{
		return bprepay;
	}

	public void setBprepay(Boolean bprepay)
	{
		this.bprepay = bprepay;
	}

	public Boolean getBstartflag()
	{
		return bstartflag;
	}

	public void setBstartflag(Boolean bstartflag)
	{
		this.bstartflag = bstartflag;
	}

	public String getCorderno()
	{
		return corderno;
	}

	public void setCorderno(String corderno)
	{
		this.corderno = corderno;
	}

	public String getCcode()
	{
		return ccode;
	}

	public void setCcode(String ccode)
	{
		this.ccode = ccode;
	}

	public String getCprecode()
	{
		return cprecode;
	}

	public void setCprecode(String cprecode)
	{
		this.cprecode = cprecode;
	}

	public Boolean getIpayforother()
	{
		return ipayforother;
	}

	public void setIpayforother(Boolean ipayforother)
	{
		this.ipayforother = ipayforother;
	}

	public String getCsrcflag()
	{
		return csrcflag;
	}

	public void setCsrcflag(String csrcflag)
	{
		this.csrcflag = csrcflag;
	}

	public String getCpzid()
	{
		return cpzid;
	}

	public void setCpzid(String cpzid)
	{
		this.cpzid = cpzid;
	}

	public String getCflag()
	{
		return cflag;
	}

	public void setCflag(String cflag)
	{
		this.cflag = cflag;
	}

	public Boolean getBsend()
	{
		return bsend;
	}

	public void setBsend(Boolean bsend)
	{
		this.bsend = bsend;
	}

	public Boolean getBreceived()
	{
		return breceived;
	}

	public void setBreceived(Boolean breceived)
	{
		this.breceived = breceived;
	}

	public String getCsitemcode()
	{
		return csitemcode;
	}

	public void setCsitemcode(String csitemcode)
	{
		this.csitemcode = csitemcode;
	}

	public Long getIid()
	{
		return iid;
	}

	public void setIid(Long iid)
	{
		this.iid = iid;
	}

	public String getCcancelno()
	{
		return ccancelno;
	}

	public void setCcancelno(String ccancelno)
	{
		this.ccancelno = ccancelno;
	}

	public String getCbank()
	{
		return cbank;
	}

	public void setCbank(String cbank)
	{
		this.cbank = cbank;
	}

	public String getCnatbank()
	{
		return cnatbank;
	}

	public void setCnatbank(String cnatbank)
	{
		this.cnatbank = cnatbank;
	}

	public String getCnatbankaccount()
	{
		return cnatbankaccount;
	}

	public void setCnatbankaccount(String cnatbankaccount)
	{
		this.cnatbankaccount = cnatbankaccount;
	}

	public Boolean getBfrombank()
	{
		return bfrombank;
	}

	public void setBfrombank(Boolean bfrombank)
	{
		this.bfrombank = bfrombank;
	}

	public Boolean getBtobank()
	{
		return btobank;
	}

	public void setBtobank(Boolean btobank)
	{
		this.btobank = btobank;
	}

	public Boolean getBsure()
	{
		return bsure;
	}

	public void setBsure(Boolean bsure)
	{
		this.bsure = bsure;
	}

	public Long getVt_id()
	{
		return vt_id;
	}

	public void setVt_id(Long vt_id)
	{
		this.vt_id = vt_id;
	}

	public String getCcheckman()
	{
		return ccheckman;
	}

	public void setCcheckman(String ccheckman)
	{
		this.ccheckman = ccheckman;
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

	// public String getUfts()
	// {
	// return ufts;
	// }
	// public void setUfts(String ufts)
	// {
	// this.ufts = ufts;
	// }
	public String getCitemname()
	{
		return citemname;
	}

	public void setCitemname(String citemname)
	{
		this.citemname = citemname;
	}

	public String getCcontracttype()
	{
		return ccontracttype;
	}

	public void setCcontracttype(String ccontracttype)
	{
		this.ccontracttype = ccontracttype;
	}

	public String getCcontractid()
	{
		return ccontractid;
	}

	public void setCcontractid(String ccontractid)
	{
		this.ccontractid = ccontractid;
	}

	public Double getIamount_s()
	{
		return iamount_s;
	}

	public void setIamount_s(Double iamount_s)
	{
		this.iamount_s = iamount_s;
	}

	public Boolean getIswfcontrolled()
	{
		return iswfcontrolled;
	}

	public void setIswfcontrolled(Boolean iswfcontrolled)
	{
		this.iswfcontrolled = iswfcontrolled;
	}

	public String getIsource()
	{
		return isource;
	}

	public void setIsource(String isource)
	{
		this.isource = isource;
	}

	public String getSdlcode()
	{
		return sdlcode;
	}

	public void setSdlcode(String sdlcode)
	{
		this.sdlcode = sdlcode;
	}

	public Long getRegisterflag()
	{
		return registerflag;
	}

	public void setRegisterflag(Long registerflag)
	{
		this.registerflag = registerflag;
	}

	public Long getIverifystate()
	{
		return iverifystate;
	}

	public void setIverifystate(Long iverifystate)
	{
		this.iverifystate = iverifystate;
	}

	public Long getIreturncount()
	{
		return ireturncount;
	}

	public void setIreturncount(Long ireturncount)
	{
		this.ireturncount = ireturncount;
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

	public Long getIbg_overflag()
	{
		return ibg_overflag;
	}

	public void setIbg_overflag(Long ibg_overflag)
	{
		this.ibg_overflag = ibg_overflag;
	}

	public String getCbg_auditor()
	{
		return cbg_auditor;
	}

	public void setCbg_auditor(String cbg_auditor)
	{
		this.cbg_auditor = cbg_auditor;
	}

	public String getCbg_audittime()
	{
		return cbg_audittime;
	}

	public void setCbg_audittime(String cbg_audittime)
	{
		this.cbg_audittime = cbg_audittime;
	}

	public Long getControlresult()
	{
		return controlresult;
	}

	public void setControlresult(Long controlresult)
	{
		this.controlresult = controlresult;
	}

	public String getCbg_itemcode()
	{
		return cbg_itemcode;
	}

	public void setCbg_itemcode(String cbg_itemcode)
	{
		this.cbg_itemcode = cbg_itemcode;
	}

	public String getCbg_itemname()
	{
		return cbg_itemname;
	}

	public void setCbg_itemname(String cbg_itemname)
	{
		this.cbg_itemname = cbg_itemname;
	}

	public String getCbg_caliberkey1()
	{
		return cbg_caliberkey1;
	}

	public void setCbg_caliberkey1(String cbg_caliberkey1)
	{
		this.cbg_caliberkey1 = cbg_caliberkey1;
	}

	public String getCbg_caliberkeyname1()
	{
		return cbg_caliberkeyname1;
	}

	public void setCbg_caliberkeyname1(String cbg_caliberkeyname1)
	{
		this.cbg_caliberkeyname1 = cbg_caliberkeyname1;
	}

	public String getCbg_caliberkey2()
	{
		return cbg_caliberkey2;
	}

	public void setCbg_caliberkey2(String cbg_caliberkey2)
	{
		this.cbg_caliberkey2 = cbg_caliberkey2;
	}

	public String getCbg_caliberkeyname2()
	{
		return cbg_caliberkeyname2;
	}

	public void setCbg_caliberkeyname2(String cbg_caliberkeyname2)
	{
		this.cbg_caliberkeyname2 = cbg_caliberkeyname2;
	}

	public String getCbg_caliberkey3()
	{
		return cbg_caliberkey3;
	}

	public void setCbg_caliberkey3(String cbg_caliberkey3)
	{
		this.cbg_caliberkey3 = cbg_caliberkey3;
	}

	public String getCbg_caliberkeyname3()
	{
		return cbg_caliberkeyname3;
	}

	public void setCbg_caliberkeyname3(String cbg_caliberkeyname3)
	{
		this.cbg_caliberkeyname3 = cbg_caliberkeyname3;
	}

	public String getCbg_calibercode1()
	{
		return cbg_calibercode1;
	}

	public void setCbg_calibercode1(String cbg_calibercode1)
	{
		this.cbg_calibercode1 = cbg_calibercode1;
	}

	public String getCbg_calibername1()
	{
		return cbg_calibername1;
	}

	public void setCbg_calibername1(String cbg_calibername1)
	{
		this.cbg_calibername1 = cbg_calibername1;
	}

	public String getCbg_calibercode2()
	{
		return cbg_calibercode2;
	}

	public void setCbg_calibercode2(String cbg_calibercode2)
	{
		this.cbg_calibercode2 = cbg_calibercode2;
	}

	public String getCbg_calibername2()
	{
		return cbg_calibername2;
	}

	public void setCbg_calibername2(String cbg_calibername2)
	{
		this.cbg_calibername2 = cbg_calibername2;
	}

	public String getCbg_calibercode3()
	{
		return cbg_calibercode3;
	}

	public void setCbg_calibercode3(String cbg_calibercode3)
	{
		this.cbg_calibercode3 = cbg_calibercode3;
	}

	public String getCbg_calibername3()
	{
		return cbg_calibername3;
	}

	public void setCbg_calibername3(String cbg_calibername3)
	{
		this.cbg_calibername3 = cbg_calibername3;
	}

	public Boolean getIbg_ctrl()
	{
		return ibg_ctrl;
	}

	public void setIbg_ctrl(Boolean ibg_ctrl)
	{
		this.ibg_ctrl = ibg_ctrl;
	}

	public String getCbg_auditopinion()
	{
		return cbg_auditopinion;
	}

	public void setCbg_auditopinion(String cbg_auditopinion)
	{
		this.cbg_auditopinion = cbg_auditopinion;
	}

	public String getCapplycode()
	{
		return capplycode;
	}

	public void setCapplycode(String capplycode)
	{
		this.capplycode = capplycode;
	}

	public String getCpznum()
	{
		return cpznum;
	}

	public void setCpznum(String cpznum)
	{
		this.cpznum = cpznum;
	}

	public Timestamp getDoutbilldate()
	{
		return doutbilldate;
	}

	public void setDoutbilldate(Timestamp doutbilldate)
	{
		this.doutbilldate = doutbilldate;
	}

	public String getCbg_caliberkey4()
	{
		return cbg_caliberkey4;
	}

	public void setCbg_caliberkey4(String cbg_caliberkey4)
	{
		this.cbg_caliberkey4 = cbg_caliberkey4;
	}

	public String getCbg_caliberkeyname4()
	{
		return cbg_caliberkeyname4;
	}

	public void setCbg_caliberkeyname4(String cbg_caliberkeyname4)
	{
		this.cbg_caliberkeyname4 = cbg_caliberkeyname4;
	}

	public String getCbg_caliberkey5()
	{
		return cbg_caliberkey5;
	}

	public void setCbg_caliberkey5(String cbg_caliberkey5)
	{
		this.cbg_caliberkey5 = cbg_caliberkey5;
	}

	public String getCbg_caliberkeyname5()
	{
		return cbg_caliberkeyname5;
	}

	public void setCbg_caliberkeyname5(String cbg_caliberkeyname5)
	{
		this.cbg_caliberkeyname5 = cbg_caliberkeyname5;
	}

	public String getCbg_caliberkey6()
	{
		return cbg_caliberkey6;
	}

	public void setCbg_caliberkey6(String cbg_caliberkey6)
	{
		this.cbg_caliberkey6 = cbg_caliberkey6;
	}

	public String getCbg_caliberkeyname6()
	{
		return cbg_caliberkeyname6;
	}

	public void setCbg_caliberkeyname6(String cbg_caliberkeyname6)
	{
		this.cbg_caliberkeyname6 = cbg_caliberkeyname6;
	}

	public String getCbg_calibercode4()
	{
		return cbg_calibercode4;
	}

	public void setCbg_calibercode4(String cbg_calibercode4)
	{
		this.cbg_calibercode4 = cbg_calibercode4;
	}

	public String getCbg_calibername4()
	{
		return cbg_calibername4;
	}

	public void setCbg_calibername4(String cbg_calibername4)
	{
		this.cbg_calibername4 = cbg_calibername4;
	}

	public String getCbg_calibercode5()
	{
		return cbg_calibercode5;
	}

	public void setCbg_calibercode5(String cbg_calibercode5)
	{
		this.cbg_calibercode5 = cbg_calibercode5;
	}

	public String getCbg_calibername5()
	{
		return cbg_calibername5;
	}

	public void setCbg_calibername5(String cbg_calibername5)
	{
		this.cbg_calibername5 = cbg_calibername5;
	}

	public String getCbg_calibercode6()
	{
		return cbg_calibercode6;
	}

	public void setCbg_calibercode6(String cbg_calibercode6)
	{
		this.cbg_calibercode6 = cbg_calibercode6;
	}

	public String getCbg_calibername6()
	{
		return cbg_calibername6;
	}

	public void setCbg_calibername6(String cbg_calibername6)
	{
		this.cbg_calibername6 = cbg_calibername6;
	}

	public Long getIprintcount()
	{
		return iprintcount;
	}

	public void setIprintcount(Long iprintcount)
	{
		this.iprintcount = iprintcount;
	}

	public String getCreservedeptcode()
	{
		return creservedeptcode;
	}

	public void setCreservedeptcode(String creservedeptcode)
	{
		this.creservedeptcode = creservedeptcode;
	}

	public Boolean getBdealmode()
	{
		return bdealmode;
	}

	public void setBdealmode(Boolean bdealmode)
	{
		this.bdealmode = bdealmode;
	}

	public Long getIbustype()
	{
		return ibustype;
	}

	public void setIbustype(Long ibustype)
	{
		this.ibustype = ibustype;
	}

	public Long getIpaytype()
	{
		return ipaytype;
	}

	public void setIpaytype(Long ipaytype)
	{
		this.ipaytype = ipaytype;
	}

	public String getCagentcuscode()
	{
		return cagentcuscode;
	}

	public void setCagentcuscode(String cagentcuscode)
	{
		this.cagentcuscode = cagentcuscode;
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

	public Long getLacctid()
	{
		return lacctid;
	}

	public void setLacctid(Long lacctid)
	{
		this.lacctid = lacctid;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
