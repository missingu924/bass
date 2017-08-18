package com.u8.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class CustomerObj extends BaseDbObj
{
	private String ccuscode;
	private String ccusname;
	private String ccusabbname;
	private String ccccode;
	private String cdccode;
	private String ctrade;
	private String ccusaddress;
	private String ccuspostcode;
	private String ccusregcode;
	private String ccusbank;
	private String ccusaccount;
	private Timestamp dcusdevdate;
	private String ccuslperson;
	private String ccusemail;
	private String ccusperson;
	private String ccusphone;
	private String ccusfax;
	private String ccusbp;
	private String ccushand;
	private String ccuspperson;
	private Double icusdisrate;
	private String ccuscregrade;
	private Double icuscreline;
	private Long icuscredate;
	private String ccuspaycond;
	private String ccusoaddress;
	private String ccusotype;
	private String ccusheadcode;
	private String ccuswhcode;
	private String ccusdepart;
	private Double iarmoney;
	private Timestamp dlastdate;
	private Double ilastmoney;
	private Timestamp dlrdate;
	private Double ilrmoney;
	private Timestamp denddate;
	private Long ifrequency;
	private String ccusdefine1;
	private String ccusdefine2;
	private String ccusdefine3;
	private Long icostgrade;
	private String ccreateperson;
	private String cmodifyperson;
	private Timestamp dmodifydate;
	private String crelvendor;
	private String iid;
	private String cpricegroup;
	private String coffergrade;
	private Double iofferrate;
	private String ccusdefine4;
	private String ccusdefine5;
	private String ccusdefine6;
	private String ccusdefine7;
	private String ccusdefine8;
	private String ccusdefine9;
	private String ccusdefine10;
	private Long ccusdefine11;
	private Long ccusdefine12;
	private Double ccusdefine13;
	private Double ccusdefine14;
	private Timestamp ccusdefine15;
	private Timestamp ccusdefine16;
	private String pubufts;
	private String cinvoicecompany;
	private Boolean bcredit;
	private Boolean bcreditdate;
	private Boolean bcreditbyhead;
	private Boolean blicencedate;
	private Timestamp dlicencesdate;
	private Timestamp dlicenceedate;
	private Long ilicenceadays;
	private Boolean bbusinessdate;
	private Timestamp dbusinesssdate;
	private Timestamp dbusinessedate;
	private Long ibusinessadays;
	private Boolean bproxy;
	private Timestamp dproxysdate;
	private Timestamp dproxyedate;
	private Long iproxyadays;
	private String cmemo;
	private Boolean blimitsale;
	private String ccuscontactcode;
	private String ccuscountrycode;
	private String ccusenname;
	private String ccusenaddr1;
	private String ccusenaddr2;
	private String ccusenaddr3;
	private String ccusenaddr4;
	private String ccusportcode;
	private String cprimaryven;
	private Double fcommisionrate;
	private Double finsuerate;
	private Boolean bhomebranch;
	private String cbranchaddr;
	private String cbranchphone;
	private String cbranchperson;
	private String ccustradeccode;
	private String customerkcode;
	private Boolean bcusstate;
	private Long bshop;
	private String ccusbankcode;
	private String ccusexch_name;
	private Long icusgsptype;
	private Long icusgspauth;
	private String ccusgspauthno;
	private String ccusbusinessno;
	private String ccuslicenceno;
	private Boolean bcusdomestic;
	private Boolean bcusoverseas;
	private String ccuscreditcompany;
	private String ccussaprotocol;
	private String ccusexprotocol;
	private String ccusotherprotocol;
	private Double fcusdiscountrate;
	private String ccussscode;
	private String ccuscmprotocol;
	private Timestamp dcuscreatedatetime;
	private String ccusappdocno;
	private String ccusmnemcode;
	private Double fadvancepaymentratio;
	private Boolean bserviceattribute;
	private Boolean brequestsign;
	private Boolean bongpinstore;
	private String ccusmngtypecode;
	private Long account_type;
	private String ccusimagentprotocol;
	private Long isourcetype;
	private String isourceid;
	private Double fexpense;
	private Double fapprovedexpense;
	private Timestamp dtouchedtime;
	private Timestamp drecentlyinvoicetime;
	private Timestamp drecentlyquotetime;
	private Timestamp drecentlyactivitytime;
	private Timestamp drecentlychancetime;
	private Timestamp drecentlycontracttime;
	private String cltccustomercode;
	private Boolean btransflag;
	private String cltcperson;
	private Timestamp dltcdate;
	private String clocationsite;
	private Double icustaxrate;
	private Timestamp alloct_dept_time;
	private Timestamp allot_user_time;
	private Timestamp recyle_dept_time;
	private Timestamp recyle_pub_time;
	private String clicenceno;
	private String clicencerange;
	private String ccusbusinessrange;
	private String ccusgspauthrange;
	private Timestamp dcusgspedate;
	private Timestamp dcusgspsdate;
	private Long icusgspadays;
	private Boolean biscusattachfile;
	private Timestamp drecentcontractdate;
	private Timestamp drecentdeliverydate;
	private Timestamp drecentoutbounddate;

	@Override
	public String findKeyColumnName()
	{
		return "ccusname";
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
		return "customer";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "Customer";
	}

	@Override
	public String getCnName()
	{
		return "客户档案";
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

		pros.put("ccuscode", "ccuscode");
		pros.put("ccusname", "ccusname");
		pros.put("ccusabbname", "ccusabbname");
		pros.put("ccccode", "ccccode");
		pros.put("cdccode", "cdccode");
		pros.put("ctrade", "ctrade");
		pros.put("ccusaddress", "ccusaddress");
		pros.put("ccuspostcode", "ccuspostcode");
		pros.put("ccusregcode", "ccusregcode");
		pros.put("ccusbank", "ccusbank");
		pros.put("ccusaccount", "ccusaccount");
		pros.put("dcusdevdate", "dcusdevdate");
		pros.put("ccuslperson", "ccuslperson");
		pros.put("ccusemail", "ccusemail");
		pros.put("ccusperson", "ccusperson");
		pros.put("ccusphone", "ccusphone");
		pros.put("ccusfax", "ccusfax");
		pros.put("ccusbp", "ccusbp");
		pros.put("ccushand", "ccushand");
		pros.put("ccuspperson", "ccuspperson");
		pros.put("icusdisrate", "icusdisrate");
		pros.put("ccuscregrade", "ccuscregrade");
		pros.put("icuscreline", "icuscreline");
		pros.put("icuscredate", "icuscredate");
		pros.put("ccuspaycond", "ccuspaycond");
		pros.put("ccusoaddress", "ccusoaddress");
		pros.put("ccusotype", "ccusotype");
		pros.put("ccusheadcode", "ccusheadcode");
		pros.put("ccuswhcode", "ccuswhcode");
		pros.put("ccusdepart", "ccusdepart");
		pros.put("iarmoney", "iarmoney");
		pros.put("dlastdate", "dlastdate");
		pros.put("ilastmoney", "ilastmoney");
		pros.put("dlrdate", "dlrdate");
		pros.put("ilrmoney", "ilrmoney");
		pros.put("denddate", "denddate");
		pros.put("ifrequency", "ifrequency");
		pros.put("ccusdefine1", "ccusdefine1");
		pros.put("ccusdefine2", "ccusdefine2");
		pros.put("ccusdefine3", "ccusdefine3");
		pros.put("icostgrade", "icostgrade");
		pros.put("ccreateperson", "ccreateperson");
		pros.put("cmodifyperson", "cmodifyperson");
		pros.put("dmodifydate", "dmodifydate");
		pros.put("crelvendor", "crelvendor");
		pros.put("iid", "iid");
		pros.put("cpricegroup", "cpricegroup");
		pros.put("coffergrade", "coffergrade");
		pros.put("iofferrate", "iofferrate");
		pros.put("ccusdefine4", "ccusdefine4");
		pros.put("ccusdefine5", "ccusdefine5");
		pros.put("ccusdefine6", "ccusdefine6");
		pros.put("ccusdefine7", "ccusdefine7");
		pros.put("ccusdefine8", "ccusdefine8");
		pros.put("ccusdefine9", "ccusdefine9");
		pros.put("ccusdefine10", "ccusdefine10");
		pros.put("ccusdefine11", "ccusdefine11");
		pros.put("ccusdefine12", "ccusdefine12");
		pros.put("ccusdefine13", "ccusdefine13");
		pros.put("ccusdefine14", "ccusdefine14");
		pros.put("ccusdefine15", "ccusdefine15");
		pros.put("ccusdefine16", "ccusdefine16");
		pros.put("pubufts", "pubufts");
		pros.put("cinvoicecompany", "cinvoicecompany");
		pros.put("bcredit", "bcredit");
		pros.put("bcreditdate", "bcreditdate");
		pros.put("bcreditbyhead", "bcreditbyhead");
		pros.put("blicencedate", "blicencedate");
		pros.put("dlicencesdate", "dlicencesdate");
		pros.put("dlicenceedate", "dlicenceedate");
		pros.put("ilicenceadays", "ilicenceadays");
		pros.put("bbusinessdate", "bbusinessdate");
		pros.put("dbusinesssdate", "dbusinesssdate");
		pros.put("dbusinessedate", "dbusinessedate");
		pros.put("ibusinessadays", "ibusinessadays");
		pros.put("bproxy", "bproxy");
		pros.put("dproxysdate", "dproxysdate");
		pros.put("dproxyedate", "dproxyedate");
		pros.put("iproxyadays", "iproxyadays");
		pros.put("cmemo", "cmemo");
		pros.put("blimitsale", "blimitsale");
		pros.put("ccuscontactcode", "ccuscontactcode");
		pros.put("ccuscountrycode", "ccuscountrycode");
		pros.put("ccusenname", "ccusenname");
		pros.put("ccusenaddr1", "ccusenaddr1");
		pros.put("ccusenaddr2", "ccusenaddr2");
		pros.put("ccusenaddr3", "ccusenaddr3");
		pros.put("ccusenaddr4", "ccusenaddr4");
		pros.put("ccusportcode", "ccusportcode");
		pros.put("cprimaryven", "cprimaryven");
		pros.put("fcommisionrate", "fcommisionrate");
		pros.put("finsuerate", "finsuerate");
		pros.put("bhomebranch", "bhomebranch");
		pros.put("cbranchaddr", "cbranchaddr");
		pros.put("cbranchphone", "cbranchphone");
		pros.put("cbranchperson", "cbranchperson");
		pros.put("ccustradeccode", "ccustradeccode");
		pros.put("customerkcode", "customerkcode");
		pros.put("bcusstate", "bcusstate");
		pros.put("bshop", "bshop");
		pros.put("ccusbankcode", "ccusbankcode");
		pros.put("ccusexch_name", "ccusexch_name");
		pros.put("icusgsptype", "icusgsptype");
		pros.put("icusgspauth", "icusgspauth");
		pros.put("ccusgspauthno", "ccusgspauthno");
		pros.put("ccusbusinessno", "ccusbusinessno");
		pros.put("ccuslicenceno", "ccuslicenceno");
		pros.put("bcusdomestic", "bcusdomestic");
		pros.put("bcusoverseas", "bcusoverseas");
		pros.put("ccuscreditcompany", "ccuscreditcompany");
		pros.put("ccussaprotocol", "ccussaprotocol");
		pros.put("ccusexprotocol", "ccusexprotocol");
		pros.put("ccusotherprotocol", "ccusotherprotocol");
		pros.put("fcusdiscountrate", "fcusdiscountrate");
		pros.put("ccussscode", "ccussscode");
		pros.put("ccuscmprotocol", "ccuscmprotocol");
		pros.put("dcuscreatedatetime", "dcuscreatedatetime");
		pros.put("ccusappdocno", "ccusappdocno");
		pros.put("ccusmnemcode", "ccusmnemcode");
		pros.put("fadvancepaymentratio", "fadvancepaymentratio");
		pros.put("bserviceattribute", "bserviceattribute");
		pros.put("brequestsign", "brequestsign");
		pros.put("bongpinstore", "bongpinstore");
		pros.put("ccusmngtypecode", "ccusmngtypecode");
		pros.put("account_type", "account_type");
		pros.put("ccusimagentprotocol", "ccusimagentprotocol");
		pros.put("isourcetype", "isourcetype");
		pros.put("isourceid", "isourceid");
		pros.put("fexpense", "fexpense");
		pros.put("fapprovedexpense", "fapprovedexpense");
		pros.put("dtouchedtime", "dtouchedtime");
		pros.put("drecentlyinvoicetime", "drecentlyinvoicetime");
		pros.put("drecentlyquotetime", "drecentlyquotetime");
		pros.put("drecentlyactivitytime", "drecentlyactivitytime");
		pros.put("drecentlychancetime", "drecentlychancetime");
		pros.put("drecentlycontracttime", "drecentlycontracttime");
		pros.put("cltccustomercode", "cltccustomercode");
		pros.put("btransflag", "btransflag");
		pros.put("cltcperson", "cltcperson");
		pros.put("dltcdate", "dltcdate");
		pros.put("clocationsite", "clocationsite");
		pros.put("icustaxrate", "icustaxrate");
		pros.put("alloct_dept_time", "alloct_dept_time");
		pros.put("allot_user_time", "allot_user_time");
		pros.put("recyle_dept_time", "recyle_dept_time");
		pros.put("recyle_pub_time", "recyle_pub_time");
		pros.put("clicenceno", "clicenceno");
		pros.put("clicencerange", "clicencerange");
		pros.put("ccusbusinessrange", "ccusbusinessrange");
		pros.put("ccusgspauthrange", "ccusgspauthrange");
		pros.put("dcusgspedate", "dcusgspedate");
		pros.put("dcusgspsdate", "dcusgspsdate");
		pros.put("icusgspadays", "icusgspadays");
		pros.put("biscusattachfile", "biscusattachfile");
		pros.put("drecentcontractdate", "drecentcontractdate");
		pros.put("drecentdeliverydate", "drecentdeliverydate");
		pros.put("drecentoutbounddate", "drecentoutbounddate");
		return pros;
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

	public String getCcccode()
	{
		return ccccode;
	}

	public void setCcccode(String ccccode)
	{
		this.ccccode = ccccode;
	}

	public String getCdccode()
	{
		return cdccode;
	}

	public void setCdccode(String cdccode)
	{
		this.cdccode = cdccode;
	}

	public String getCtrade()
	{
		return ctrade;
	}

	public void setCtrade(String ctrade)
	{
		this.ctrade = ctrade;
	}

	public String getCcusaddress()
	{
		return ccusaddress;
	}

	public void setCcusaddress(String ccusaddress)
	{
		this.ccusaddress = ccusaddress;
	}

	public String getCcuspostcode()
	{
		return ccuspostcode;
	}

	public void setCcuspostcode(String ccuspostcode)
	{
		this.ccuspostcode = ccuspostcode;
	}

	public String getCcusregcode()
	{
		return ccusregcode;
	}

	public void setCcusregcode(String ccusregcode)
	{
		this.ccusregcode = ccusregcode;
	}

	public String getCcusbank()
	{
		return ccusbank;
	}

	public void setCcusbank(String ccusbank)
	{
		this.ccusbank = ccusbank;
	}

	public String getCcusaccount()
	{
		return ccusaccount;
	}

	public void setCcusaccount(String ccusaccount)
	{
		this.ccusaccount = ccusaccount;
	}

	public Timestamp getDcusdevdate()
	{
		return dcusdevdate;
	}

	public void setDcusdevdate(Timestamp dcusdevdate)
	{
		this.dcusdevdate = dcusdevdate;
	}

	public String getCcuslperson()
	{
		return ccuslperson;
	}

	public void setCcuslperson(String ccuslperson)
	{
		this.ccuslperson = ccuslperson;
	}

	public String getCcusemail()
	{
		return ccusemail;
	}

	public void setCcusemail(String ccusemail)
	{
		this.ccusemail = ccusemail;
	}

	public String getCcusperson()
	{
		return ccusperson;
	}

	public void setCcusperson(String ccusperson)
	{
		this.ccusperson = ccusperson;
	}

	public String getCcusphone()
	{
		return ccusphone;
	}

	public void setCcusphone(String ccusphone)
	{
		this.ccusphone = ccusphone;
	}

	public String getCcusfax()
	{
		return ccusfax;
	}

	public void setCcusfax(String ccusfax)
	{
		this.ccusfax = ccusfax;
	}

	public String getCcusbp()
	{
		return ccusbp;
	}

	public void setCcusbp(String ccusbp)
	{
		this.ccusbp = ccusbp;
	}

	public String getCcushand()
	{
		return ccushand;
	}

	public void setCcushand(String ccushand)
	{
		this.ccushand = ccushand;
	}

	public String getCcuspperson()
	{
		return ccuspperson;
	}

	public void setCcuspperson(String ccuspperson)
	{
		this.ccuspperson = ccuspperson;
	}

	public Double getIcusdisrate()
	{
		return icusdisrate;
	}

	public void setIcusdisrate(Double icusdisrate)
	{
		this.icusdisrate = icusdisrate;
	}

	public String getCcuscregrade()
	{
		return ccuscregrade;
	}

	public void setCcuscregrade(String ccuscregrade)
	{
		this.ccuscregrade = ccuscregrade;
	}

	public Double getIcuscreline()
	{
		return icuscreline;
	}

	public void setIcuscreline(Double icuscreline)
	{
		this.icuscreline = icuscreline;
	}

	public Long getIcuscredate()
	{
		return icuscredate;
	}

	public void setIcuscredate(Long icuscredate)
	{
		this.icuscredate = icuscredate;
	}

	public String getCcuspaycond()
	{
		return ccuspaycond;
	}

	public void setCcuspaycond(String ccuspaycond)
	{
		this.ccuspaycond = ccuspaycond;
	}

	public String getCcusoaddress()
	{
		return ccusoaddress;
	}

	public void setCcusoaddress(String ccusoaddress)
	{
		this.ccusoaddress = ccusoaddress;
	}

	public String getCcusotype()
	{
		return ccusotype;
	}

	public void setCcusotype(String ccusotype)
	{
		this.ccusotype = ccusotype;
	}

	public String getCcusheadcode()
	{
		return ccusheadcode;
	}

	public void setCcusheadcode(String ccusheadcode)
	{
		this.ccusheadcode = ccusheadcode;
	}

	public String getCcuswhcode()
	{
		return ccuswhcode;
	}

	public void setCcuswhcode(String ccuswhcode)
	{
		this.ccuswhcode = ccuswhcode;
	}

	public String getCcusdepart()
	{
		return ccusdepart;
	}

	public void setCcusdepart(String ccusdepart)
	{
		this.ccusdepart = ccusdepart;
	}

	public Double getIarmoney()
	{
		return iarmoney;
	}

	public void setIarmoney(Double iarmoney)
	{
		this.iarmoney = iarmoney;
	}

	public Timestamp getDlastdate()
	{
		return dlastdate;
	}

	public void setDlastdate(Timestamp dlastdate)
	{
		this.dlastdate = dlastdate;
	}

	public Double getIlastmoney()
	{
		return ilastmoney;
	}

	public void setIlastmoney(Double ilastmoney)
	{
		this.ilastmoney = ilastmoney;
	}

	public Timestamp getDlrdate()
	{
		return dlrdate;
	}

	public void setDlrdate(Timestamp dlrdate)
	{
		this.dlrdate = dlrdate;
	}

	public Double getIlrmoney()
	{
		return ilrmoney;
	}

	public void setIlrmoney(Double ilrmoney)
	{
		this.ilrmoney = ilrmoney;
	}

	public Timestamp getDenddate()
	{
		return denddate;
	}

	public void setDenddate(Timestamp denddate)
	{
		this.denddate = denddate;
	}

	public Long getIfrequency()
	{
		return ifrequency;
	}

	public void setIfrequency(Long ifrequency)
	{
		this.ifrequency = ifrequency;
	}

	public String getCcusdefine1()
	{
		return ccusdefine1;
	}

	public void setCcusdefine1(String ccusdefine1)
	{
		this.ccusdefine1 = ccusdefine1;
	}

	public String getCcusdefine2()
	{
		return ccusdefine2;
	}

	public void setCcusdefine2(String ccusdefine2)
	{
		this.ccusdefine2 = ccusdefine2;
	}

	public String getCcusdefine3()
	{
		return ccusdefine3;
	}

	public void setCcusdefine3(String ccusdefine3)
	{
		this.ccusdefine3 = ccusdefine3;
	}

	public Long getIcostgrade()
	{
		return icostgrade;
	}

	public void setIcostgrade(Long icostgrade)
	{
		this.icostgrade = icostgrade;
	}

	public String getCcreateperson()
	{
		return ccreateperson;
	}

	public void setCcreateperson(String ccreateperson)
	{
		this.ccreateperson = ccreateperson;
	}

	public String getCmodifyperson()
	{
		return cmodifyperson;
	}

	public void setCmodifyperson(String cmodifyperson)
	{
		this.cmodifyperson = cmodifyperson;
	}

	public Timestamp getDmodifydate()
	{
		return dmodifydate;
	}

	public void setDmodifydate(Timestamp dmodifydate)
	{
		this.dmodifydate = dmodifydate;
	}

	public String getCrelvendor()
	{
		return crelvendor;
	}

	public void setCrelvendor(String crelvendor)
	{
		this.crelvendor = crelvendor;
	}

	public String getIid()
	{
		return iid;
	}

	public void setIid(String iid)
	{
		this.iid = iid;
	}

	public String getCpricegroup()
	{
		return cpricegroup;
	}

	public void setCpricegroup(String cpricegroup)
	{
		this.cpricegroup = cpricegroup;
	}

	public String getCoffergrade()
	{
		return coffergrade;
	}

	public void setCoffergrade(String coffergrade)
	{
		this.coffergrade = coffergrade;
	}

	public Double getIofferrate()
	{
		return iofferrate;
	}

	public void setIofferrate(Double iofferrate)
	{
		this.iofferrate = iofferrate;
	}

	public String getCcusdefine4()
	{
		return ccusdefine4;
	}

	public void setCcusdefine4(String ccusdefine4)
	{
		this.ccusdefine4 = ccusdefine4;
	}

	public String getCcusdefine5()
	{
		return ccusdefine5;
	}

	public void setCcusdefine5(String ccusdefine5)
	{
		this.ccusdefine5 = ccusdefine5;
	}

	public String getCcusdefine6()
	{
		return ccusdefine6;
	}

	public void setCcusdefine6(String ccusdefine6)
	{
		this.ccusdefine6 = ccusdefine6;
	}

	public String getCcusdefine7()
	{
		return ccusdefine7;
	}

	public void setCcusdefine7(String ccusdefine7)
	{
		this.ccusdefine7 = ccusdefine7;
	}

	public String getCcusdefine8()
	{
		return ccusdefine8;
	}

	public void setCcusdefine8(String ccusdefine8)
	{
		this.ccusdefine8 = ccusdefine8;
	}

	public String getCcusdefine9()
	{
		return ccusdefine9;
	}

	public void setCcusdefine9(String ccusdefine9)
	{
		this.ccusdefine9 = ccusdefine9;
	}

	public String getCcusdefine10()
	{
		return ccusdefine10;
	}

	public void setCcusdefine10(String ccusdefine10)
	{
		this.ccusdefine10 = ccusdefine10;
	}

	public Long getCcusdefine11()
	{
		return ccusdefine11;
	}

	public void setCcusdefine11(Long ccusdefine11)
	{
		this.ccusdefine11 = ccusdefine11;
	}

	public Long getCcusdefine12()
	{
		return ccusdefine12;
	}

	public void setCcusdefine12(Long ccusdefine12)
	{
		this.ccusdefine12 = ccusdefine12;
	}

	public Double getCcusdefine13()
	{
		return ccusdefine13;
	}

	public void setCcusdefine13(Double ccusdefine13)
	{
		this.ccusdefine13 = ccusdefine13;
	}

	public Double getCcusdefine14()
	{
		return ccusdefine14;
	}

	public void setCcusdefine14(Double ccusdefine14)
	{
		this.ccusdefine14 = ccusdefine14;
	}

	public Timestamp getCcusdefine15()
	{
		return ccusdefine15;
	}

	public void setCcusdefine15(Timestamp ccusdefine15)
	{
		this.ccusdefine15 = ccusdefine15;
	}

	public Timestamp getCcusdefine16()
	{
		return ccusdefine16;
	}

	public void setCcusdefine16(Timestamp ccusdefine16)
	{
		this.ccusdefine16 = ccusdefine16;
	}

	public String getPubufts()
	{
		return pubufts;
	}

	public void setPubufts(String pubufts)
	{
		this.pubufts = pubufts;
	}

	public String getCinvoicecompany()
	{
		return cinvoicecompany;
	}

	public void setCinvoicecompany(String cinvoicecompany)
	{
		this.cinvoicecompany = cinvoicecompany;
	}

	public Boolean getBcredit()
	{
		return bcredit;
	}

	public void setBcredit(Boolean bcredit)
	{
		this.bcredit = bcredit;
	}

	public Boolean getBcreditdate()
	{
		return bcreditdate;
	}

	public void setBcreditdate(Boolean bcreditdate)
	{
		this.bcreditdate = bcreditdate;
	}

	public Boolean getBcreditbyhead()
	{
		return bcreditbyhead;
	}

	public void setBcreditbyhead(Boolean bcreditbyhead)
	{
		this.bcreditbyhead = bcreditbyhead;
	}

	public Boolean getBlicencedate()
	{
		return blicencedate;
	}

	public void setBlicencedate(Boolean blicencedate)
	{
		this.blicencedate = blicencedate;
	}

	public Timestamp getDlicencesdate()
	{
		return dlicencesdate;
	}

	public void setDlicencesdate(Timestamp dlicencesdate)
	{
		this.dlicencesdate = dlicencesdate;
	}

	public Timestamp getDlicenceedate()
	{
		return dlicenceedate;
	}

	public void setDlicenceedate(Timestamp dlicenceedate)
	{
		this.dlicenceedate = dlicenceedate;
	}

	public Long getIlicenceadays()
	{
		return ilicenceadays;
	}

	public void setIlicenceadays(Long ilicenceadays)
	{
		this.ilicenceadays = ilicenceadays;
	}

	public Boolean getBbusinessdate()
	{
		return bbusinessdate;
	}

	public void setBbusinessdate(Boolean bbusinessdate)
	{
		this.bbusinessdate = bbusinessdate;
	}

	public Timestamp getDbusinesssdate()
	{
		return dbusinesssdate;
	}

	public void setDbusinesssdate(Timestamp dbusinesssdate)
	{
		this.dbusinesssdate = dbusinesssdate;
	}

	public Timestamp getDbusinessedate()
	{
		return dbusinessedate;
	}

	public void setDbusinessedate(Timestamp dbusinessedate)
	{
		this.dbusinessedate = dbusinessedate;
	}

	public Long getIbusinessadays()
	{
		return ibusinessadays;
	}

	public void setIbusinessadays(Long ibusinessadays)
	{
		this.ibusinessadays = ibusinessadays;
	}

	public Boolean getBproxy()
	{
		return bproxy;
	}

	public void setBproxy(Boolean bproxy)
	{
		this.bproxy = bproxy;
	}

	public Timestamp getDproxysdate()
	{
		return dproxysdate;
	}

	public void setDproxysdate(Timestamp dproxysdate)
	{
		this.dproxysdate = dproxysdate;
	}

	public Timestamp getDproxyedate()
	{
		return dproxyedate;
	}

	public void setDproxyedate(Timestamp dproxyedate)
	{
		this.dproxyedate = dproxyedate;
	}

	public Long getIproxyadays()
	{
		return iproxyadays;
	}

	public void setIproxyadays(Long iproxyadays)
	{
		this.iproxyadays = iproxyadays;
	}

	public String getCmemo()
	{
		return cmemo;
	}

	public void setCmemo(String cmemo)
	{
		this.cmemo = cmemo;
	}

	public Boolean getBlimitsale()
	{
		return blimitsale;
	}

	public void setBlimitsale(Boolean blimitsale)
	{
		this.blimitsale = blimitsale;
	}

	public String getCcuscontactcode()
	{
		return ccuscontactcode;
	}

	public void setCcuscontactcode(String ccuscontactcode)
	{
		this.ccuscontactcode = ccuscontactcode;
	}

	public String getCcuscountrycode()
	{
		return ccuscountrycode;
	}

	public void setCcuscountrycode(String ccuscountrycode)
	{
		this.ccuscountrycode = ccuscountrycode;
	}

	public String getCcusenname()
	{
		return ccusenname;
	}

	public void setCcusenname(String ccusenname)
	{
		this.ccusenname = ccusenname;
	}

	public String getCcusenaddr1()
	{
		return ccusenaddr1;
	}

	public void setCcusenaddr1(String ccusenaddr1)
	{
		this.ccusenaddr1 = ccusenaddr1;
	}

	public String getCcusenaddr2()
	{
		return ccusenaddr2;
	}

	public void setCcusenaddr2(String ccusenaddr2)
	{
		this.ccusenaddr2 = ccusenaddr2;
	}

	public String getCcusenaddr3()
	{
		return ccusenaddr3;
	}

	public void setCcusenaddr3(String ccusenaddr3)
	{
		this.ccusenaddr3 = ccusenaddr3;
	}

	public String getCcusenaddr4()
	{
		return ccusenaddr4;
	}

	public void setCcusenaddr4(String ccusenaddr4)
	{
		this.ccusenaddr4 = ccusenaddr4;
	}

	public String getCcusportcode()
	{
		return ccusportcode;
	}

	public void setCcusportcode(String ccusportcode)
	{
		this.ccusportcode = ccusportcode;
	}

	public String getCprimaryven()
	{
		return cprimaryven;
	}

	public void setCprimaryven(String cprimaryven)
	{
		this.cprimaryven = cprimaryven;
	}

	public Double getFcommisionrate()
	{
		return fcommisionrate;
	}

	public void setFcommisionrate(Double fcommisionrate)
	{
		this.fcommisionrate = fcommisionrate;
	}

	public Double getFinsuerate()
	{
		return finsuerate;
	}

	public void setFinsuerate(Double finsuerate)
	{
		this.finsuerate = finsuerate;
	}

	public Boolean getBhomebranch()
	{
		return bhomebranch;
	}

	public void setBhomebranch(Boolean bhomebranch)
	{
		this.bhomebranch = bhomebranch;
	}

	public String getCbranchaddr()
	{
		return cbranchaddr;
	}

	public void setCbranchaddr(String cbranchaddr)
	{
		this.cbranchaddr = cbranchaddr;
	}

	public String getCbranchphone()
	{
		return cbranchphone;
	}

	public void setCbranchphone(String cbranchphone)
	{
		this.cbranchphone = cbranchphone;
	}

	public String getCbranchperson()
	{
		return cbranchperson;
	}

	public void setCbranchperson(String cbranchperson)
	{
		this.cbranchperson = cbranchperson;
	}

	public String getCcustradeccode()
	{
		return ccustradeccode;
	}

	public void setCcustradeccode(String ccustradeccode)
	{
		this.ccustradeccode = ccustradeccode;
	}

	public String getCustomerkcode()
	{
		return customerkcode;
	}

	public void setCustomerkcode(String customerkcode)
	{
		this.customerkcode = customerkcode;
	}

	public Boolean getBcusstate()
	{
		return bcusstate;
	}

	public void setBcusstate(Boolean bcusstate)
	{
		this.bcusstate = bcusstate;
	}

	public Long getBshop()
	{
		return bshop;
	}

	public void setBshop(Long bshop)
	{
		this.bshop = bshop;
	}

	public String getCcusbankcode()
	{
		return ccusbankcode;
	}

	public void setCcusbankcode(String ccusbankcode)
	{
		this.ccusbankcode = ccusbankcode;
	}

	public String getCcusexch_name()
	{
		return ccusexch_name;
	}

	public void setCcusexch_name(String ccusexch_name)
	{
		this.ccusexch_name = ccusexch_name;
	}

	public Long getIcusgsptype()
	{
		return icusgsptype;
	}

	public void setIcusgsptype(Long icusgsptype)
	{
		this.icusgsptype = icusgsptype;
	}

	public Long getIcusgspauth()
	{
		return icusgspauth;
	}

	public void setIcusgspauth(Long icusgspauth)
	{
		this.icusgspauth = icusgspauth;
	}

	public String getCcusgspauthno()
	{
		return ccusgspauthno;
	}

	public void setCcusgspauthno(String ccusgspauthno)
	{
		this.ccusgspauthno = ccusgspauthno;
	}

	public String getCcusbusinessno()
	{
		return ccusbusinessno;
	}

	public void setCcusbusinessno(String ccusbusinessno)
	{
		this.ccusbusinessno = ccusbusinessno;
	}

	public String getCcuslicenceno()
	{
		return ccuslicenceno;
	}

	public void setCcuslicenceno(String ccuslicenceno)
	{
		this.ccuslicenceno = ccuslicenceno;
	}

	public Boolean getBcusdomestic()
	{
		return bcusdomestic;
	}

	public void setBcusdomestic(Boolean bcusdomestic)
	{
		this.bcusdomestic = bcusdomestic;
	}

	public Boolean getBcusoverseas()
	{
		return bcusoverseas;
	}

	public void setBcusoverseas(Boolean bcusoverseas)
	{
		this.bcusoverseas = bcusoverseas;
	}

	public String getCcuscreditcompany()
	{
		return ccuscreditcompany;
	}

	public void setCcuscreditcompany(String ccuscreditcompany)
	{
		this.ccuscreditcompany = ccuscreditcompany;
	}

	public String getCcussaprotocol()
	{
		return ccussaprotocol;
	}

	public void setCcussaprotocol(String ccussaprotocol)
	{
		this.ccussaprotocol = ccussaprotocol;
	}

	public String getCcusexprotocol()
	{
		return ccusexprotocol;
	}

	public void setCcusexprotocol(String ccusexprotocol)
	{
		this.ccusexprotocol = ccusexprotocol;
	}

	public String getCcusotherprotocol()
	{
		return ccusotherprotocol;
	}

	public void setCcusotherprotocol(String ccusotherprotocol)
	{
		this.ccusotherprotocol = ccusotherprotocol;
	}

	public Double getFcusdiscountrate()
	{
		return fcusdiscountrate;
	}

	public void setFcusdiscountrate(Double fcusdiscountrate)
	{
		this.fcusdiscountrate = fcusdiscountrate;
	}

	public String getCcussscode()
	{
		return ccussscode;
	}

	public void setCcussscode(String ccussscode)
	{
		this.ccussscode = ccussscode;
	}

	public String getCcuscmprotocol()
	{
		return ccuscmprotocol;
	}

	public void setCcuscmprotocol(String ccuscmprotocol)
	{
		this.ccuscmprotocol = ccuscmprotocol;
	}

	public Timestamp getDcuscreatedatetime()
	{
		return dcuscreatedatetime;
	}

	public void setDcuscreatedatetime(Timestamp dcuscreatedatetime)
	{
		this.dcuscreatedatetime = dcuscreatedatetime;
	}

	public String getCcusappdocno()
	{
		return ccusappdocno;
	}

	public void setCcusappdocno(String ccusappdocno)
	{
		this.ccusappdocno = ccusappdocno;
	}

	public String getCcusmnemcode()
	{
		return ccusmnemcode;
	}

	public void setCcusmnemcode(String ccusmnemcode)
	{
		this.ccusmnemcode = ccusmnemcode;
	}

	public Double getFadvancepaymentratio()
	{
		return fadvancepaymentratio;
	}

	public void setFadvancepaymentratio(Double fadvancepaymentratio)
	{
		this.fadvancepaymentratio = fadvancepaymentratio;
	}

	public Boolean getBserviceattribute()
	{
		return bserviceattribute;
	}

	public void setBserviceattribute(Boolean bserviceattribute)
	{
		this.bserviceattribute = bserviceattribute;
	}

	public Boolean getBrequestsign()
	{
		return brequestsign;
	}

	public void setBrequestsign(Boolean brequestsign)
	{
		this.brequestsign = brequestsign;
	}

	public Boolean getBongpinstore()
	{
		return bongpinstore;
	}

	public void setBongpinstore(Boolean bongpinstore)
	{
		this.bongpinstore = bongpinstore;
	}

	public String getCcusmngtypecode()
	{
		return ccusmngtypecode;
	}

	public void setCcusmngtypecode(String ccusmngtypecode)
	{
		this.ccusmngtypecode = ccusmngtypecode;
	}

	public Long getAccount_type()
	{
		return account_type;
	}

	public void setAccount_type(Long account_type)
	{
		this.account_type = account_type;
	}

	public String getCcusimagentprotocol()
	{
		return ccusimagentprotocol;
	}

	public void setCcusimagentprotocol(String ccusimagentprotocol)
	{
		this.ccusimagentprotocol = ccusimagentprotocol;
	}

	public Long getIsourcetype()
	{
		return isourcetype;
	}

	public void setIsourcetype(Long isourcetype)
	{
		this.isourcetype = isourcetype;
	}

	public String getIsourceid()
	{
		return isourceid;
	}

	public void setIsourceid(String isourceid)
	{
		this.isourceid = isourceid;
	}

	public Double getFexpense()
	{
		return fexpense;
	}

	public void setFexpense(Double fexpense)
	{
		this.fexpense = fexpense;
	}

	public Double getFapprovedexpense()
	{
		return fapprovedexpense;
	}

	public void setFapprovedexpense(Double fapprovedexpense)
	{
		this.fapprovedexpense = fapprovedexpense;
	}

	public Timestamp getDtouchedtime()
	{
		return dtouchedtime;
	}

	public void setDtouchedtime(Timestamp dtouchedtime)
	{
		this.dtouchedtime = dtouchedtime;
	}

	public Timestamp getDrecentlyinvoicetime()
	{
		return drecentlyinvoicetime;
	}

	public void setDrecentlyinvoicetime(Timestamp drecentlyinvoicetime)
	{
		this.drecentlyinvoicetime = drecentlyinvoicetime;
	}

	public Timestamp getDrecentlyquotetime()
	{
		return drecentlyquotetime;
	}

	public void setDrecentlyquotetime(Timestamp drecentlyquotetime)
	{
		this.drecentlyquotetime = drecentlyquotetime;
	}

	public Timestamp getDrecentlyactivitytime()
	{
		return drecentlyactivitytime;
	}

	public void setDrecentlyactivitytime(Timestamp drecentlyactivitytime)
	{
		this.drecentlyactivitytime = drecentlyactivitytime;
	}

	public Timestamp getDrecentlychancetime()
	{
		return drecentlychancetime;
	}

	public void setDrecentlychancetime(Timestamp drecentlychancetime)
	{
		this.drecentlychancetime = drecentlychancetime;
	}

	public Timestamp getDrecentlycontracttime()
	{
		return drecentlycontracttime;
	}

	public void setDrecentlycontracttime(Timestamp drecentlycontracttime)
	{
		this.drecentlycontracttime = drecentlycontracttime;
	}

	public String getCltccustomercode()
	{
		return cltccustomercode;
	}

	public void setCltccustomercode(String cltccustomercode)
	{
		this.cltccustomercode = cltccustomercode;
	}

	public Boolean getBtransflag()
	{
		return btransflag;
	}

	public void setBtransflag(Boolean btransflag)
	{
		this.btransflag = btransflag;
	}

	public String getCltcperson()
	{
		return cltcperson;
	}

	public void setCltcperson(String cltcperson)
	{
		this.cltcperson = cltcperson;
	}

	public Timestamp getDltcdate()
	{
		return dltcdate;
	}

	public void setDltcdate(Timestamp dltcdate)
	{
		this.dltcdate = dltcdate;
	}

	public String getClocationsite()
	{
		return clocationsite;
	}

	public void setClocationsite(String clocationsite)
	{
		this.clocationsite = clocationsite;
	}

	public Double getIcustaxrate()
	{
		return icustaxrate;
	}

	public void setIcustaxrate(Double icustaxrate)
	{
		this.icustaxrate = icustaxrate;
	}

	public Timestamp getAlloct_dept_time()
	{
		return alloct_dept_time;
	}

	public void setAlloct_dept_time(Timestamp alloct_dept_time)
	{
		this.alloct_dept_time = alloct_dept_time;
	}

	public Timestamp getAllot_user_time()
	{
		return allot_user_time;
	}

	public void setAllot_user_time(Timestamp allot_user_time)
	{
		this.allot_user_time = allot_user_time;
	}

	public Timestamp getRecyle_dept_time()
	{
		return recyle_dept_time;
	}

	public void setRecyle_dept_time(Timestamp recyle_dept_time)
	{
		this.recyle_dept_time = recyle_dept_time;
	}

	public Timestamp getRecyle_pub_time()
	{
		return recyle_pub_time;
	}

	public void setRecyle_pub_time(Timestamp recyle_pub_time)
	{
		this.recyle_pub_time = recyle_pub_time;
	}

	public String getClicenceno()
	{
		return clicenceno;
	}

	public void setClicenceno(String clicenceno)
	{
		this.clicenceno = clicenceno;
	}

	public String getClicencerange()
	{
		return clicencerange;
	}

	public void setClicencerange(String clicencerange)
	{
		this.clicencerange = clicencerange;
	}

	public String getCcusbusinessrange()
	{
		return ccusbusinessrange;
	}

	public void setCcusbusinessrange(String ccusbusinessrange)
	{
		this.ccusbusinessrange = ccusbusinessrange;
	}

	public String getCcusgspauthrange()
	{
		return ccusgspauthrange;
	}

	public void setCcusgspauthrange(String ccusgspauthrange)
	{
		this.ccusgspauthrange = ccusgspauthrange;
	}

	public Timestamp getDcusgspedate()
	{
		return dcusgspedate;
	}

	public void setDcusgspedate(Timestamp dcusgspedate)
	{
		this.dcusgspedate = dcusgspedate;
	}

	public Timestamp getDcusgspsdate()
	{
		return dcusgspsdate;
	}

	public void setDcusgspsdate(Timestamp dcusgspsdate)
	{
		this.dcusgspsdate = dcusgspsdate;
	}

	public Long getIcusgspadays()
	{
		return icusgspadays;
	}

	public void setIcusgspadays(Long icusgspadays)
	{
		this.icusgspadays = icusgspadays;
	}

	public Boolean getBiscusattachfile()
	{
		return biscusattachfile;
	}

	public void setBiscusattachfile(Boolean biscusattachfile)
	{
		this.biscusattachfile = biscusattachfile;
	}

	public Timestamp getDrecentcontractdate()
	{
		return drecentcontractdate;
	}

	public void setDrecentcontractdate(Timestamp drecentcontractdate)
	{
		this.drecentcontractdate = drecentcontractdate;
	}

	public Timestamp getDrecentdeliverydate()
	{
		return drecentdeliverydate;
	}

	public void setDrecentdeliverydate(Timestamp drecentdeliverydate)
	{
		this.drecentdeliverydate = drecentdeliverydate;
	}

	public Timestamp getDrecentoutbounddate()
	{
		return drecentoutbounddate;
	}

	public void setDrecentoutbounddate(Timestamp drecentoutbounddate)
	{
		this.drecentoutbounddate = drecentoutbounddate;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
