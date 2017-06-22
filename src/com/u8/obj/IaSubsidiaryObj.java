package com.u8.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;
public class IaSubsidiaryObj extends BaseDbObj
{
private Long autoid;
private Boolean brdflag;
private String cbustype;
private String cbuscode;
private String cvoucode;
private Long id;
private Long valueid;
private Long justid;
private Timestamp dvoudate;
private Timestamp dkeepdate;
private String imonth;
private Long ipzid;
private Timestamp ipzdate;
private String cpztype;
private String cpzdigest;
private String cinvhead;
private String cdifhead;
private String copphead;
private String cvoutype;
private String cptcode;
private String cstcode;
private String cwhcode;
private String caccdep;
private String cinvcode;
private String crdcode;
private String cvencode;
private String ccuscode;
private String cordercode;
private String carvcode;
private Long cbillcode;
private Long cdlcode;
private String cpspcode;
private String cprocode;
private String cdepcode;
private String cpersoncode;
private String chandler;
private Double iainquantity;
private Double iaoutquantity;
private Double iincost;
private Double ioutcost;
private Double iainprice;
private Double iaoutprice;
private String cbatchcode;
private Double idebitdifcost;
private Double icreditdifcost;
private String caccounter;
private String cmaker;
private String bflag;
private Boolean bmoneyflag;
private Boolean bsale;
private String cmemo;
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
private String cfree1;
private String cfree2;
private String cpzid;
private String cdefine22;
private String cdefine23;
private String cdefine24;
private String cdefine25;
private Double cdefine26;
private Double cdefine27;
private String citem_class;
private String citemcode;
private String cname;
private String citemcname;
private Double nojustquantity;
private String cfree3;
private String cfree4;
private String cfree5;
private String cfree6;
private String cfree7;
private String cfree8;
private String cfree9;
private String cfree10;
private String cdefine11;
private String cdefine12;
private String cdefine13;
private String cdefine14;
private Long cdefine15;
private Double cdefine16;
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
private Long psvsid;
private String ccxhdcode;
private String ccxfscode;
private String cbatchia;
private Timestamp dmadedateia;
private Long imassdateia;
private Long cmassunit;
private Timestamp dvdateia;
private String cproordercode;
private Long iproorderid;
private Long iproorderids;
private String cworkprocode;
private String cworkprocodedis;
private String cworkcentercode;
private String cworkcentername;
private String cendcode;
private String csaleordercode;
private Long isaleorderid;
private Long isaleordersid;
private Long isaleorderids;
private String centrustordercode;
private Long ientrustorderid;
private Long ientrustordersid;
private String cpurordercode;
private Long ipurordersid;
private Long idlsid;
private String strcontractcode;
private Double inum;
private String cassunit;
private String exocode;
private Long iexrowno;
private String consignmentcode;
private Long iconsignmentautoid;
private Long itrans;
private Long ilevel;
private Long bakid;
private Boolean ibg_ctrl;
private String cimordercode;
private Double imaterialfee;
private Double iprocessfee;
private String cmaterialhead;
private String cprocesshead;
private String csrcvoutype;
private Double flaborstdcoste;
private Double fmanufixstdcoste;
private Double fmanuvarstdcoste;
private Double fomcoste;
private String cdemandcode;
private String cdemandmemo;
private Double imaterialfeedif;
private Double flaborcosteffratedif;
private Double flaborcostratedif;
private Double fmanufixcosteffratedif;
private Double fmanufixcostratedif;
private Double fmanuvarcosteffratedif;
private Double fmanuvarcostratedif;
private Double fomcostedif;
private String cbmemo;
private Long msdetailsid;
private Timestamp dtaudit;
private Long iymonth;
private Long iyear;
private Timestamp dcreatedate;
private String guid;
private Long moneysrc;
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
	return "ia_subsidiary";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "IaSubsidiary";
}
@Override
public String getCnName()
{
	return "存货明细账";
}
@Override
public List<String> findUniqueIndexProperties()
{
	return Arrays.asList(new String[]
	{ 	});
}
public LinkedHashMap<String, String> findProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("autoid", "autoid");
		pros.put("brdflag", "brdflag");
		pros.put("cbustype", "cbustype");
		pros.put("cbuscode", "cbuscode");
		pros.put("cvoucode", "cvoucode");
		pros.put("id", "id");
		pros.put("valueid", "valueid");
		pros.put("justid", "justid");
		pros.put("dvoudate", "dvoudate");
		pros.put("dkeepdate", "dkeepdate");
		pros.put("imonth", "imonth");
		pros.put("ipzid", "ipzid");
		pros.put("ipzdate", "ipzdate");
		pros.put("cpztype", "cpztype");
		pros.put("cpzdigest", "cpzdigest");
		pros.put("cinvhead", "cinvhead");
		pros.put("cdifhead", "cdifhead");
		pros.put("copphead", "copphead");
		pros.put("cvoutype", "cvoutype");
		pros.put("cptcode", "cptcode");
		pros.put("cstcode", "cstcode");
		pros.put("cwhcode", "cwhcode");
		pros.put("caccdep", "caccdep");
		pros.put("cinvcode", "cinvcode");
		pros.put("crdcode", "crdcode");
		pros.put("cvencode", "cvencode");
		pros.put("ccuscode", "ccuscode");
		pros.put("cordercode", "cordercode");
		pros.put("carvcode", "carvcode");
		pros.put("cbillcode", "cbillcode");
		pros.put("cdlcode", "cdlcode");
		pros.put("cpspcode", "cpspcode");
		pros.put("cprocode", "cprocode");
		pros.put("cdepcode", "cdepcode");
		pros.put("cpersoncode", "cpersoncode");
		pros.put("chandler", "chandler");
		pros.put("iainquantity", "iainquantity");
		pros.put("iaoutquantity", "iaoutquantity");
		pros.put("iincost", "iincost");
		pros.put("ioutcost", "ioutcost");
		pros.put("iainprice", "iainprice");
		pros.put("iaoutprice", "iaoutprice");
		pros.put("cbatchcode", "cbatchcode");
		pros.put("idebitdifcost", "idebitdifcost");
		pros.put("icreditdifcost", "icreditdifcost");
		pros.put("caccounter", "caccounter");
		pros.put("cmaker", "cmaker");
		pros.put("bflag", "bflag");
		pros.put("bmoneyflag", "bmoneyflag");
		pros.put("bsale", "bsale");
		pros.put("cmemo", "cmemo");
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
		pros.put("cfree1", "cfree1");
		pros.put("cfree2", "cfree2");
		pros.put("cpzid", "cpzid");
		pros.put("cdefine22", "cdefine22");
		pros.put("cdefine23", "cdefine23");
		pros.put("cdefine24", "cdefine24");
		pros.put("cdefine25", "cdefine25");
		pros.put("cdefine26", "cdefine26");
		pros.put("cdefine27", "cdefine27");
		pros.put("citem_class", "citem_class");
		pros.put("citemcode", "citemcode");
		pros.put("cname", "cname");
		pros.put("citemcname", "citemcname");
		pros.put("nojustquantity", "nojustquantity");
		pros.put("cfree3", "cfree3");
		pros.put("cfree4", "cfree4");
		pros.put("cfree5", "cfree5");
		pros.put("cfree6", "cfree6");
		pros.put("cfree7", "cfree7");
		pros.put("cfree8", "cfree8");
		pros.put("cfree9", "cfree9");
		pros.put("cfree10", "cfree10");
		pros.put("cdefine11", "cdefine11");
		pros.put("cdefine12", "cdefine12");
		pros.put("cdefine13", "cdefine13");
		pros.put("cdefine14", "cdefine14");
		pros.put("cdefine15", "cdefine15");
		pros.put("cdefine16", "cdefine16");
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
		pros.put("psvsid", "psvsid");
		pros.put("ccxhdcode", "ccxhdcode");
		pros.put("ccxfscode", "ccxfscode");
		pros.put("cbatchia", "cbatchia");
		pros.put("dmadedateia", "dmadedateia");
		pros.put("imassdateia", "imassdateia");
		pros.put("cmassunit", "cmassunit");
		pros.put("dvdateia", "dvdateia");
		pros.put("cproordercode", "cproordercode");
		pros.put("iproorderid", "iproorderid");
		pros.put("iproorderids", "iproorderids");
		pros.put("cworkprocode", "cworkprocode");
		pros.put("cworkprocodedis", "cworkprocodedis");
		pros.put("cworkcentercode", "cworkcentercode");
		pros.put("cworkcentername", "cworkcentername");
		pros.put("cendcode", "cendcode");
		pros.put("csaleordercode", "csaleordercode");
		pros.put("isaleorderid", "isaleorderid");
		pros.put("isaleordersid", "isaleordersid");
		pros.put("isaleorderids", "isaleorderids");
		pros.put("centrustordercode", "centrustordercode");
		pros.put("ientrustorderid", "ientrustorderid");
		pros.put("ientrustordersid", "ientrustordersid");
		pros.put("cpurordercode", "cpurordercode");
		pros.put("ipurordersid", "ipurordersid");
		pros.put("idlsid", "idlsid");
		pros.put("strcontractcode", "strcontractcode");
		pros.put("inum", "inum");
		pros.put("cassunit", "cassunit");
		pros.put("exocode", "exocode");
		pros.put("iexrowno", "iexrowno");
		pros.put("consignmentcode", "consignmentcode");
		pros.put("iconsignmentautoid", "iconsignmentautoid");
		pros.put("itrans", "itrans");
		pros.put("ilevel", "ilevel");
		pros.put("bakid", "bakid");
		pros.put("ibg_ctrl", "ibg_ctrl");
		pros.put("cimordercode", "cimordercode");
		pros.put("imaterialfee", "imaterialfee");
		pros.put("iprocessfee", "iprocessfee");
		pros.put("cmaterialhead", "cmaterialhead");
		pros.put("cprocesshead", "cprocesshead");
		pros.put("csrcvoutype", "csrcvoutype");
		pros.put("flaborstdcoste", "flaborstdcoste");
		pros.put("fmanufixstdcoste", "fmanufixstdcoste");
		pros.put("fmanuvarstdcoste", "fmanuvarstdcoste");
		pros.put("fomcoste", "fomcoste");
		pros.put("cdemandcode", "cdemandcode");
		pros.put("cdemandmemo", "cdemandmemo");
		pros.put("imaterialfeedif", "imaterialfeedif");
		pros.put("flaborcosteffratedif", "flaborcosteffratedif");
		pros.put("flaborcostratedif", "flaborcostratedif");
		pros.put("fmanufixcosteffratedif", "fmanufixcosteffratedif");
		pros.put("fmanufixcostratedif", "fmanufixcostratedif");
		pros.put("fmanuvarcosteffratedif", "fmanuvarcosteffratedif");
		pros.put("fmanuvarcostratedif", "fmanuvarcostratedif");
		pros.put("fomcostedif", "fomcostedif");
		pros.put("cbmemo", "cbmemo");
		pros.put("msdetailsid", "msdetailsid");
		pros.put("dtaudit", "dtaudit");
		pros.put("iymonth", "iymonth");
		pros.put("iyear", "iyear");
		pros.put("dcreatedate", "dcreatedate");
		pros.put("guid", "guid");
		pros.put("moneysrc", "moneysrc");
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
public Boolean getBrdflag()
{
	return brdflag;
}
public void setBrdflag(Boolean brdflag)
{
	this.brdflag = brdflag;
}
public String getCbustype()
{
	return cbustype;
}
public void setCbustype(String cbustype)
{
	this.cbustype = cbustype;
}
public String getCbuscode()
{
	return cbuscode;
}
public void setCbuscode(String cbuscode)
{
	this.cbuscode = cbuscode;
}
public String getCvoucode()
{
	return cvoucode;
}
public void setCvoucode(String cvoucode)
{
	this.cvoucode = cvoucode;
}
public Long getId()
{
	return id;
}
public void setId(Long id)
{
	this.id = id;
}
public Long getValueid()
{
	return valueid;
}
public void setValueid(Long valueid)
{
	this.valueid = valueid;
}
public Long getJustid()
{
	return justid;
}
public void setJustid(Long justid)
{
	this.justid = justid;
}
public Timestamp getDvoudate()
{
	return dvoudate;
}
public void setDvoudate(Timestamp dvoudate)
{
	this.dvoudate = dvoudate;
}
public Timestamp getDkeepdate()
{
	return dkeepdate;
}
public void setDkeepdate(Timestamp dkeepdate)
{
	this.dkeepdate = dkeepdate;
}
public String getImonth()
{
	return imonth;
}
public void setImonth(String imonth)
{
	this.imonth = imonth;
}
public Long getIpzid()
{
	return ipzid;
}
public void setIpzid(Long ipzid)
{
	this.ipzid = ipzid;
}
public Timestamp getIpzdate()
{
	return ipzdate;
}
public void setIpzdate(Timestamp ipzdate)
{
	this.ipzdate = ipzdate;
}
public String getCpztype()
{
	return cpztype;
}
public void setCpztype(String cpztype)
{
	this.cpztype = cpztype;
}
public String getCpzdigest()
{
	return cpzdigest;
}
public void setCpzdigest(String cpzdigest)
{
	this.cpzdigest = cpzdigest;
}
public String getCinvhead()
{
	return cinvhead;
}
public void setCinvhead(String cinvhead)
{
	this.cinvhead = cinvhead;
}
public String getCdifhead()
{
	return cdifhead;
}
public void setCdifhead(String cdifhead)
{
	this.cdifhead = cdifhead;
}
public String getCopphead()
{
	return copphead;
}
public void setCopphead(String copphead)
{
	this.copphead = copphead;
}
public String getCvoutype()
{
	return cvoutype;
}
public void setCvoutype(String cvoutype)
{
	this.cvoutype = cvoutype;
}
public String getCptcode()
{
	return cptcode;
}
public void setCptcode(String cptcode)
{
	this.cptcode = cptcode;
}
public String getCstcode()
{
	return cstcode;
}
public void setCstcode(String cstcode)
{
	this.cstcode = cstcode;
}
public String getCwhcode()
{
	return cwhcode;
}
public void setCwhcode(String cwhcode)
{
	this.cwhcode = cwhcode;
}
public String getCaccdep()
{
	return caccdep;
}
public void setCaccdep(String caccdep)
{
	this.caccdep = caccdep;
}
public String getCinvcode()
{
	return cinvcode;
}
public void setCinvcode(String cinvcode)
{
	this.cinvcode = cinvcode;
}
public String getCrdcode()
{
	return crdcode;
}
public void setCrdcode(String crdcode)
{
	this.crdcode = crdcode;
}
public String getCvencode()
{
	return cvencode;
}
public void setCvencode(String cvencode)
{
	this.cvencode = cvencode;
}
public String getCcuscode()
{
	return ccuscode;
}
public void setCcuscode(String ccuscode)
{
	this.ccuscode = ccuscode;
}
public String getCordercode()
{
	return cordercode;
}
public void setCordercode(String cordercode)
{
	this.cordercode = cordercode;
}
public String getCarvcode()
{
	return carvcode;
}
public void setCarvcode(String carvcode)
{
	this.carvcode = carvcode;
}
public Long getCbillcode()
{
	return cbillcode;
}
public void setCbillcode(Long cbillcode)
{
	this.cbillcode = cbillcode;
}
public Long getCdlcode()
{
	return cdlcode;
}
public void setCdlcode(Long cdlcode)
{
	this.cdlcode = cdlcode;
}
public String getCpspcode()
{
	return cpspcode;
}
public void setCpspcode(String cpspcode)
{
	this.cpspcode = cpspcode;
}
public String getCprocode()
{
	return cprocode;
}
public void setCprocode(String cprocode)
{
	this.cprocode = cprocode;
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
public String getChandler()
{
	return chandler;
}
public void setChandler(String chandler)
{
	this.chandler = chandler;
}
public Double getIainquantity()
{
	return iainquantity;
}
public void setIainquantity(Double iainquantity)
{
	this.iainquantity = iainquantity;
}
public Double getIaoutquantity()
{
	return iaoutquantity;
}
public void setIaoutquantity(Double iaoutquantity)
{
	this.iaoutquantity = iaoutquantity;
}
public Double getIincost()
{
	return iincost;
}
public void setIincost(Double iincost)
{
	this.iincost = iincost;
}
public Double getIoutcost()
{
	return ioutcost;
}
public void setIoutcost(Double ioutcost)
{
	this.ioutcost = ioutcost;
}
public Double getIainprice()
{
	return iainprice;
}
public void setIainprice(Double iainprice)
{
	this.iainprice = iainprice;
}
public Double getIaoutprice()
{
	return iaoutprice;
}
public void setIaoutprice(Double iaoutprice)
{
	this.iaoutprice = iaoutprice;
}
public String getCbatchcode()
{
	return cbatchcode;
}
public void setCbatchcode(String cbatchcode)
{
	this.cbatchcode = cbatchcode;
}
public Double getIdebitdifcost()
{
	return idebitdifcost;
}
public void setIdebitdifcost(Double idebitdifcost)
{
	this.idebitdifcost = idebitdifcost;
}
public Double getIcreditdifcost()
{
	return icreditdifcost;
}
public void setIcreditdifcost(Double icreditdifcost)
{
	this.icreditdifcost = icreditdifcost;
}
public String getCaccounter()
{
	return caccounter;
}
public void setCaccounter(String caccounter)
{
	this.caccounter = caccounter;
}
public String getCmaker()
{
	return cmaker;
}
public void setCmaker(String cmaker)
{
	this.cmaker = cmaker;
}
public String getBflag()
{
	return bflag;
}
public void setBflag(String bflag)
{
	this.bflag = bflag;
}
public Boolean getBmoneyflag()
{
	return bmoneyflag;
}
public void setBmoneyflag(Boolean bmoneyflag)
{
	this.bmoneyflag = bmoneyflag;
}
public Boolean getBsale()
{
	return bsale;
}
public void setBsale(Boolean bsale)
{
	this.bsale = bsale;
}
public String getCmemo()
{
	return cmemo;
}
public void setCmemo(String cmemo)
{
	this.cmemo = cmemo;
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
public String getCfree1()
{
	return cfree1;
}
public void setCfree1(String cfree1)
{
	this.cfree1 = cfree1;
}
public String getCfree2()
{
	return cfree2;
}
public void setCfree2(String cfree2)
{
	this.cfree2 = cfree2;
}
public String getCpzid()
{
	return cpzid;
}
public void setCpzid(String cpzid)
{
	this.cpzid = cpzid;
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
public String getCname()
{
	return cname;
}
public void setCname(String cname)
{
	this.cname = cname;
}
public String getCitemcname()
{
	return citemcname;
}
public void setCitemcname(String citemcname)
{
	this.citemcname = citemcname;
}
public Double getNojustquantity()
{
	return nojustquantity;
}
public void setNojustquantity(Double nojustquantity)
{
	this.nojustquantity = nojustquantity;
}
public String getCfree3()
{
	return cfree3;
}
public void setCfree3(String cfree3)
{
	this.cfree3 = cfree3;
}
public String getCfree4()
{
	return cfree4;
}
public void setCfree4(String cfree4)
{
	this.cfree4 = cfree4;
}
public String getCfree5()
{
	return cfree5;
}
public void setCfree5(String cfree5)
{
	this.cfree5 = cfree5;
}
public String getCfree6()
{
	return cfree6;
}
public void setCfree6(String cfree6)
{
	this.cfree6 = cfree6;
}
public String getCfree7()
{
	return cfree7;
}
public void setCfree7(String cfree7)
{
	this.cfree7 = cfree7;
}
public String getCfree8()
{
	return cfree8;
}
public void setCfree8(String cfree8)
{
	this.cfree8 = cfree8;
}
public String getCfree9()
{
	return cfree9;
}
public void setCfree9(String cfree9)
{
	this.cfree9 = cfree9;
}
public String getCfree10()
{
	return cfree10;
}
public void setCfree10(String cfree10)
{
	this.cfree10 = cfree10;
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
public Long getPsvsid()
{
	return psvsid;
}
public void setPsvsid(Long psvsid)
{
	this.psvsid = psvsid;
}
public String getCcxhdcode()
{
	return ccxhdcode;
}
public void setCcxhdcode(String ccxhdcode)
{
	this.ccxhdcode = ccxhdcode;
}
public String getCcxfscode()
{
	return ccxfscode;
}
public void setCcxfscode(String ccxfscode)
{
	this.ccxfscode = ccxfscode;
}
public String getCbatchia()
{
	return cbatchia;
}
public void setCbatchia(String cbatchia)
{
	this.cbatchia = cbatchia;
}
public Timestamp getDmadedateia()
{
	return dmadedateia;
}
public void setDmadedateia(Timestamp dmadedateia)
{
	this.dmadedateia = dmadedateia;
}
public Long getImassdateia()
{
	return imassdateia;
}
public void setImassdateia(Long imassdateia)
{
	this.imassdateia = imassdateia;
}
public Long getCmassunit()
{
	return cmassunit;
}
public void setCmassunit(Long cmassunit)
{
	this.cmassunit = cmassunit;
}
public Timestamp getDvdateia()
{
	return dvdateia;
}
public void setDvdateia(Timestamp dvdateia)
{
	this.dvdateia = dvdateia;
}
public String getCproordercode()
{
	return cproordercode;
}
public void setCproordercode(String cproordercode)
{
	this.cproordercode = cproordercode;
}
public Long getIproorderid()
{
	return iproorderid;
}
public void setIproorderid(Long iproorderid)
{
	this.iproorderid = iproorderid;
}
public Long getIproorderids()
{
	return iproorderids;
}
public void setIproorderids(Long iproorderids)
{
	this.iproorderids = iproorderids;
}
public String getCworkprocode()
{
	return cworkprocode;
}
public void setCworkprocode(String cworkprocode)
{
	this.cworkprocode = cworkprocode;
}
public String getCworkprocodedis()
{
	return cworkprocodedis;
}
public void setCworkprocodedis(String cworkprocodedis)
{
	this.cworkprocodedis = cworkprocodedis;
}
public String getCworkcentercode()
{
	return cworkcentercode;
}
public void setCworkcentercode(String cworkcentercode)
{
	this.cworkcentercode = cworkcentercode;
}
public String getCworkcentername()
{
	return cworkcentername;
}
public void setCworkcentername(String cworkcentername)
{
	this.cworkcentername = cworkcentername;
}
public String getCendcode()
{
	return cendcode;
}
public void setCendcode(String cendcode)
{
	this.cendcode = cendcode;
}
public String getCsaleordercode()
{
	return csaleordercode;
}
public void setCsaleordercode(String csaleordercode)
{
	this.csaleordercode = csaleordercode;
}
public Long getIsaleorderid()
{
	return isaleorderid;
}
public void setIsaleorderid(Long isaleorderid)
{
	this.isaleorderid = isaleorderid;
}
public Long getIsaleordersid()
{
	return isaleordersid;
}
public void setIsaleordersid(Long isaleordersid)
{
	this.isaleordersid = isaleordersid;
}
public Long getIsaleorderids()
{
	return isaleorderids;
}
public void setIsaleorderids(Long isaleorderids)
{
	this.isaleorderids = isaleorderids;
}
public String getCentrustordercode()
{
	return centrustordercode;
}
public void setCentrustordercode(String centrustordercode)
{
	this.centrustordercode = centrustordercode;
}
public Long getIentrustorderid()
{
	return ientrustorderid;
}
public void setIentrustorderid(Long ientrustorderid)
{
	this.ientrustorderid = ientrustorderid;
}
public Long getIentrustordersid()
{
	return ientrustordersid;
}
public void setIentrustordersid(Long ientrustordersid)
{
	this.ientrustordersid = ientrustordersid;
}
public String getCpurordercode()
{
	return cpurordercode;
}
public void setCpurordercode(String cpurordercode)
{
	this.cpurordercode = cpurordercode;
}
public Long getIpurordersid()
{
	return ipurordersid;
}
public void setIpurordersid(Long ipurordersid)
{
	this.ipurordersid = ipurordersid;
}
public Long getIdlsid()
{
	return idlsid;
}
public void setIdlsid(Long idlsid)
{
	this.idlsid = idlsid;
}
public String getStrcontractcode()
{
	return strcontractcode;
}
public void setStrcontractcode(String strcontractcode)
{
	this.strcontractcode = strcontractcode;
}
public Double getInum()
{
	return inum;
}
public void setInum(Double inum)
{
	this.inum = inum;
}
public String getCassunit()
{
	return cassunit;
}
public void setCassunit(String cassunit)
{
	this.cassunit = cassunit;
}
public String getExocode()
{
	return exocode;
}
public void setExocode(String exocode)
{
	this.exocode = exocode;
}
public Long getIexrowno()
{
	return iexrowno;
}
public void setIexrowno(Long iexrowno)
{
	this.iexrowno = iexrowno;
}
public String getConsignmentcode()
{
	return consignmentcode;
}
public void setConsignmentcode(String consignmentcode)
{
	this.consignmentcode = consignmentcode;
}
public Long getIconsignmentautoid()
{
	return iconsignmentautoid;
}
public void setIconsignmentautoid(Long iconsignmentautoid)
{
	this.iconsignmentautoid = iconsignmentautoid;
}
public Long getItrans()
{
	return itrans;
}
public void setItrans(Long itrans)
{
	this.itrans = itrans;
}
public Long getIlevel()
{
	return ilevel;
}
public void setIlevel(Long ilevel)
{
	this.ilevel = ilevel;
}
public Long getBakid()
{
	return bakid;
}
public void setBakid(Long bakid)
{
	this.bakid = bakid;
}
public Boolean getIbg_ctrl()
{
	return ibg_ctrl;
}
public void setIbg_ctrl(Boolean ibg_ctrl)
{
	this.ibg_ctrl = ibg_ctrl;
}
public String getCimordercode()
{
	return cimordercode;
}
public void setCimordercode(String cimordercode)
{
	this.cimordercode = cimordercode;
}
public Double getImaterialfee()
{
	return imaterialfee;
}
public void setImaterialfee(Double imaterialfee)
{
	this.imaterialfee = imaterialfee;
}
public Double getIprocessfee()
{
	return iprocessfee;
}
public void setIprocessfee(Double iprocessfee)
{
	this.iprocessfee = iprocessfee;
}
public String getCmaterialhead()
{
	return cmaterialhead;
}
public void setCmaterialhead(String cmaterialhead)
{
	this.cmaterialhead = cmaterialhead;
}
public String getCprocesshead()
{
	return cprocesshead;
}
public void setCprocesshead(String cprocesshead)
{
	this.cprocesshead = cprocesshead;
}
public String getCsrcvoutype()
{
	return csrcvoutype;
}
public void setCsrcvoutype(String csrcvoutype)
{
	this.csrcvoutype = csrcvoutype;
}
public Double getFlaborstdcoste()
{
	return flaborstdcoste;
}
public void setFlaborstdcoste(Double flaborstdcoste)
{
	this.flaborstdcoste = flaborstdcoste;
}
public Double getFmanufixstdcoste()
{
	return fmanufixstdcoste;
}
public void setFmanufixstdcoste(Double fmanufixstdcoste)
{
	this.fmanufixstdcoste = fmanufixstdcoste;
}
public Double getFmanuvarstdcoste()
{
	return fmanuvarstdcoste;
}
public void setFmanuvarstdcoste(Double fmanuvarstdcoste)
{
	this.fmanuvarstdcoste = fmanuvarstdcoste;
}
public Double getFomcoste()
{
	return fomcoste;
}
public void setFomcoste(Double fomcoste)
{
	this.fomcoste = fomcoste;
}
public String getCdemandcode()
{
	return cdemandcode;
}
public void setCdemandcode(String cdemandcode)
{
	this.cdemandcode = cdemandcode;
}
public String getCdemandmemo()
{
	return cdemandmemo;
}
public void setCdemandmemo(String cdemandmemo)
{
	this.cdemandmemo = cdemandmemo;
}
public Double getImaterialfeedif()
{
	return imaterialfeedif;
}
public void setImaterialfeedif(Double imaterialfeedif)
{
	this.imaterialfeedif = imaterialfeedif;
}
public Double getFlaborcosteffratedif()
{
	return flaborcosteffratedif;
}
public void setFlaborcosteffratedif(Double flaborcosteffratedif)
{
	this.flaborcosteffratedif = flaborcosteffratedif;
}
public Double getFlaborcostratedif()
{
	return flaborcostratedif;
}
public void setFlaborcostratedif(Double flaborcostratedif)
{
	this.flaborcostratedif = flaborcostratedif;
}
public Double getFmanufixcosteffratedif()
{
	return fmanufixcosteffratedif;
}
public void setFmanufixcosteffratedif(Double fmanufixcosteffratedif)
{
	this.fmanufixcosteffratedif = fmanufixcosteffratedif;
}
public Double getFmanufixcostratedif()
{
	return fmanufixcostratedif;
}
public void setFmanufixcostratedif(Double fmanufixcostratedif)
{
	this.fmanufixcostratedif = fmanufixcostratedif;
}
public Double getFmanuvarcosteffratedif()
{
	return fmanuvarcosteffratedif;
}
public void setFmanuvarcosteffratedif(Double fmanuvarcosteffratedif)
{
	this.fmanuvarcosteffratedif = fmanuvarcosteffratedif;
}
public Double getFmanuvarcostratedif()
{
	return fmanuvarcostratedif;
}
public void setFmanuvarcostratedif(Double fmanuvarcostratedif)
{
	this.fmanuvarcostratedif = fmanuvarcostratedif;
}
public Double getFomcostedif()
{
	return fomcostedif;
}
public void setFomcostedif(Double fomcostedif)
{
	this.fomcostedif = fomcostedif;
}
public String getCbmemo()
{
	return cbmemo;
}
public void setCbmemo(String cbmemo)
{
	this.cbmemo = cbmemo;
}
public Long getMsdetailsid()
{
	return msdetailsid;
}
public void setMsdetailsid(Long msdetailsid)
{
	this.msdetailsid = msdetailsid;
}
public Timestamp getDtaudit()
{
	return dtaudit;
}
public void setDtaudit(Timestamp dtaudit)
{
	this.dtaudit = dtaudit;
}
public Long getIymonth()
{
	return iymonth;
}
public void setIymonth(Long iymonth)
{
	this.iymonth = iymonth;
}
public Long getIyear()
{
	return iyear;
}
public void setIyear(Long iyear)
{
	this.iyear = iyear;
}
public Timestamp getDcreatedate()
{
	return dcreatedate;
}
public void setDcreatedate(Timestamp dcreatedate)
{
	this.dcreatedate = dcreatedate;
}
public String getGuid()
{
	return guid;
}
public void setGuid(String guid)
{
	this.guid = guid;
}
public Long getMoneysrc()
{
	return moneysrc;
}
public void setMoneysrc(Long moneysrc)
{
	this.moneysrc = moneysrc;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

