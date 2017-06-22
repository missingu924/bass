package com.u8.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class RdrecordsObj extends BaseDbObj
{
	private Long autoid;
	private Long id;
	private String cinvcode;
	private Double inum;
	private Double iquantity;
	private Double iunitcost;
	private Double iprice;
	private Double iaprice;
	private Double ipunitcost;
	private Double ipprice;
	private String cbatch;
	private String cobjcode;
	private String cvouchcode;
	private String cfree1;
	private String cfree2;
	private String iflag = "0";
	private Timestamp dsdate;
	private Double itax;
	private Double isquantity = 0d;
	private Double isnum = 0d;
	private Double imoney = 0d;
	private Double isoutquantity;
	private Double isoutnum;
	private Double ifnum;
	private Double ifquantity;
	private Timestamp dvdate;
	private Long itrids;
	private String cposition;
	private String cdefine22;
	private String cdefine23;
	private String cdefine24;
	private String cdefine25;
	private Double cdefine26;
	private Double cdefine27;
	private String citem_class;
	private String citemcode;
	private Long iposid;
	private Double facost;
	private Long idlsid;
	private Long isbsid;
	private Double isendquantity = 0d;
	private Double isendnum = 0d;
	private String cname;
	private String citemcname;
	private Long iensid;
	private String cfree3;
	private String cfree4;
	private String cfree5;
	private String cfree6;
	private String cfree7;
	private String cfree8;
	private String cfree9;
	private String cfree10;
	private String cbarcode;
	private Double inquantity;
	private Double innum;
	private String cassunit;
	private Timestamp dmadedate;
	private Long imassdate;
	private String cdefine28;
	private String cdefine29;
	private String cdefine30;
	private String cdefine31;
	private String cdefine32;
	private String cdefine33;
	private Long cdefine34;
	private Long cdefine35;
	private Long impoids;
	private Long icheckids;
	private String cbvencode;
	private String cinvouchcode;
	private Boolean bgsp;
	private String cgspstate;
	private Long iarrsid;
	private String ccheckcode;
	private Long icheckidbaks;
	private String crejectcode;
	private Long irejectids;
	private String ccheckpersoncode;
	private Timestamp dcheckdate;
	private Double ioritaxcost;
	private Double ioricost;
	private Double iorimoney;
	private Double ioritaxprice;
	private Double iorisum;
	private Double itaxrate;
	private Double itaxprice;
	private Double isum;
	private Boolean btaxcost = false;
	private String cpoid;
	private Long cmassunit;
	private String cmolotcode;
	private Long irefundinspectflag;
	private Double imaterialfee;
	private Double iprocesscost;
	private Double iprocessfee;
	private Timestamp dmsdate;
	private Double ismaterialfee;
	private Double isprocessfee;
	private Long iomodid;
	private Long iorderdid;
	private String strcontractid;
	private String strcode;
	private Long bfilled;
	private Boolean bchecked;
	private Boolean brelated;
	private Long iomomid;
	private String cmworkcentercode;
	private Long imatsettlestate;
	private Long ibillsettlecount;
	private Long iordertype;
	private Long ieqdid;
	private String cvendorcode;
	private Boolean blpusefree;
	private Long irsrowno;
	private Long ioritrackid;
	private String cbaccounter;
	private Boolean bcosting;
	private Double isumbillquantity;
	private Boolean bvmiused;
	private Double ivmisettlequantity;
	private Double ivmisettlenum;
	private String cvmivencode;
	private Long iinvsncount;
	private String cwhpersoncode;
	private String cwhpersonname;
	private Long imaids;
	private Double impcost;
	private Long iimosid;
	private Long iimbsid;
	private String cserviceoid;
	private String cbserviceoid;
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
	private Double ibgstsum;
	private Double ibgiasum;
	private String cbarvcode;
	private String dbarvdate;
	private Double iinvexchrate;
	private String cbdlcode;
	private String iordercode;
	private Long iorderseq;
	private String corufts;
	private String comcode;
	private String cmocode;
	private String invcode;
	private Long imoseq;
	private String iopseq;
	private String copdesc;
	private String strcontractguid;
	private Long iexpiratdatecalcu;
	private String cexpirationdate;
	private Timestamp dexpirationdate;
	private String cciqbookcode;
	private Double ibondedsumqty;
	private String ccusinvcode;
	private String ccusinvname;
	private Long productinids;
	private String isodid;
	private Long isotype;
	private String csocode;
	private Long isoseq;
	private Double cbatchproperty1;
	private Double cbatchproperty2;
	private Double cbatchproperty3;
	private Double cbatchproperty4;
	private Double cbatchproperty5;
	private String cbatchproperty6;
	private String cbatchproperty7;
	private String cbatchproperty8;
	private String cbatchproperty9;
	private Timestamp cbatchproperty10;
	private String cbmemo;
	private Double ifaqty;
	private Double istax;
	private Long applydid;
	private String applycode;
	private Long irowno;
	private String strowguid;
	private String cservicecode;
	private String cdefine36;
	private String cdefine37;

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
		return "rdrecords";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return findKeyColumnName();
	}

	@Override
	public String getBasePath()
	{
		return "Rdrecords";
	}

	@Override
	public String getCnName()
	{
		return "采购入库单子表";
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

		pros.put("autoid", "autoid");
		pros.put("id", "id");
		pros.put("cinvcode", "cinvcode");
		pros.put("inum", "inum");
		pros.put("iquantity", "iquantity");
		pros.put("iunitcost", "iunitcost");
		pros.put("iprice", "iprice");
		pros.put("iaprice", "iaprice");
		pros.put("ipunitcost", "ipunitcost");
		pros.put("ipprice", "ipprice");
		pros.put("cbatch", "cbatch");
		pros.put("cobjcode", "cobjcode");
		pros.put("cvouchcode", "cvouchcode");
		pros.put("cfree1", "cfree1");
		pros.put("cfree2", "cfree2");
		pros.put("iflag", "iflag");
		pros.put("dsdate", "dsdate");
		pros.put("itax", "itax");
		pros.put("isquantity", "isquantity");
		pros.put("isnum", "isnum");
		pros.put("imoney", "imoney");
		pros.put("isoutquantity", "isoutquantity");
		pros.put("isoutnum", "isoutnum");
		pros.put("ifnum", "ifnum");
		pros.put("ifquantity", "ifquantity");
		pros.put("dvdate", "dvdate");
		pros.put("itrids", "itrids");
		pros.put("cposition", "cposition");
		pros.put("cdefine22", "cdefine22");
		pros.put("cdefine23", "cdefine23");
		pros.put("cdefine24", "cdefine24");
		pros.put("cdefine25", "cdefine25");
		pros.put("cdefine26", "cdefine26");
		pros.put("cdefine27", "cdefine27");
		pros.put("citem_class", "citem_class");
		pros.put("citemcode", "citemcode");
		pros.put("iposid", "iposid");
		pros.put("facost", "facost");
		pros.put("idlsid", "idlsid");
		pros.put("isbsid", "isbsid");
		pros.put("isendquantity", "isendquantity");
		pros.put("isendnum", "isendnum");
		pros.put("cname", "cname");
		pros.put("citemcname", "citemcname");
		pros.put("iensid", "iensid");
		pros.put("cfree3", "cfree3");
		pros.put("cfree4", "cfree4");
		pros.put("cfree5", "cfree5");
		pros.put("cfree6", "cfree6");
		pros.put("cfree7", "cfree7");
		pros.put("cfree8", "cfree8");
		pros.put("cfree9", "cfree9");
		pros.put("cfree10", "cfree10");
		pros.put("cbarcode", "cbarcode");
		pros.put("inquantity", "inquantity");
		pros.put("innum", "innum");
		pros.put("cassunit", "cassunit");
		pros.put("dmadedate", "dmadedate");
		pros.put("imassdate", "imassdate");
		pros.put("cdefine28", "cdefine28");
		pros.put("cdefine29", "cdefine29");
		pros.put("cdefine30", "cdefine30");
		pros.put("cdefine31", "cdefine31");
		pros.put("cdefine32", "cdefine32");
		pros.put("cdefine33", "cdefine33");
		pros.put("cdefine34", "cdefine34");
		pros.put("cdefine35", "cdefine35");
		pros.put("impoids", "impoids");
		pros.put("icheckids", "icheckids");
		pros.put("cbvencode", "cbvencode");
		pros.put("cinvouchcode", "cinvouchcode");
		pros.put("bgsp", "bgsp");
		pros.put("cgspstate", "cgspstate");
		pros.put("iarrsid", "iarrsid");
		pros.put("ccheckcode", "ccheckcode");
		pros.put("icheckidbaks", "icheckidbaks");
		pros.put("crejectcode", "crejectcode");
		pros.put("irejectids", "irejectids");
		pros.put("ccheckpersoncode", "ccheckpersoncode");
		pros.put("dcheckdate", "dcheckdate");
		pros.put("ioritaxcost", "ioritaxcost");
		pros.put("ioricost", "ioricost");
		pros.put("iorimoney", "iorimoney");
		pros.put("ioritaxprice", "ioritaxprice");
		pros.put("iorisum", "iorisum");
		pros.put("itaxrate", "itaxrate");
		pros.put("itaxprice", "itaxprice");
		pros.put("isum", "isum");
		pros.put("btaxcost", "btaxcost");
		pros.put("cpoid", "cpoid");
		pros.put("cmassunit", "cmassunit");
		pros.put("cmolotcode", "cmolotcode");
		pros.put("irefundinspectflag", "irefundinspectflag");
		pros.put("imaterialfee", "imaterialfee");
		pros.put("iprocesscost", "iprocesscost");
		pros.put("iprocessfee", "iprocessfee");
		pros.put("dmsdate", "dmsdate");
		pros.put("ismaterialfee", "ismaterialfee");
		pros.put("isprocessfee", "isprocessfee");
		pros.put("iomodid", "iomodid");
		pros.put("iorderdid", "iorderdid");
		pros.put("strcontractid", "strcontractid");
		pros.put("strcode", "strcode");
		pros.put("bfilled", "bfilled");
		pros.put("bchecked", "bchecked");
		pros.put("brelated", "brelated");
		pros.put("iomomid", "iomomid");
		pros.put("cmworkcentercode", "cmworkcentercode");
		pros.put("imatsettlestate", "imatsettlestate");
		pros.put("ibillsettlecount", "ibillsettlecount");
		pros.put("iordertype", "iordertype");
		pros.put("ieqdid", "ieqdid");
		pros.put("cvendorcode", "cvendorcode");
		pros.put("blpusefree", "blpusefree");
		pros.put("irsrowno", "irsrowno");
		pros.put("ioritrackid", "ioritrackid");
		pros.put("cbaccounter", "cbaccounter");
		pros.put("bcosting", "bcosting");
		pros.put("isumbillquantity", "isumbillquantity");
		pros.put("bvmiused", "bvmiused");
		pros.put("ivmisettlequantity", "ivmisettlequantity");
		pros.put("ivmisettlenum", "ivmisettlenum");
		pros.put("cvmivencode", "cvmivencode");
		pros.put("iinvsncount", "iinvsncount");
		pros.put("cwhpersoncode", "cwhpersoncode");
		pros.put("cwhpersonname", "cwhpersonname");
		pros.put("imaids", "imaids");
		pros.put("impcost", "impcost");
		pros.put("iimosid", "iimosid");
		pros.put("iimbsid", "iimbsid");
		pros.put("cserviceoid", "cserviceoid");
		pros.put("cbserviceoid", "cbserviceoid");
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
		pros.put("ibgstsum", "ibgstsum");
		pros.put("ibgiasum", "ibgiasum");
		pros.put("cbarvcode", "cbarvcode");
		pros.put("dbarvdate", "dbarvdate");
		pros.put("iinvexchrate", "iinvexchrate");
		pros.put("cbdlcode", "cbdlcode");
		pros.put("iordercode", "iordercode");
		pros.put("iorderseq", "iorderseq");
		pros.put("corufts", "corufts");
		pros.put("comcode", "comcode");
		pros.put("cmocode", "cmocode");
		pros.put("invcode", "invcode");
		pros.put("imoseq", "imoseq");
		pros.put("iopseq", "iopseq");
		pros.put("copdesc", "copdesc");
		pros.put("strcontractguid", "strcontractguid");
		pros.put("iexpiratdatecalcu", "iexpiratdatecalcu");
		pros.put("cexpirationdate", "cexpirationdate");
		pros.put("dexpirationdate", "dexpirationdate");
		pros.put("cciqbookcode", "cciqbookcode");
		pros.put("ibondedsumqty", "ibondedsumqty");
		pros.put("ccusinvcode", "ccusinvcode");
		pros.put("ccusinvname", "ccusinvname");
		pros.put("productinids", "productinids");
		pros.put("isodid", "isodid");
		pros.put("isotype", "isotype");
		pros.put("csocode", "csocode");
		pros.put("isoseq", "isoseq");
		pros.put("cbatchproperty1", "cbatchproperty1");
		pros.put("cbatchproperty2", "cbatchproperty2");
		pros.put("cbatchproperty3", "cbatchproperty3");
		pros.put("cbatchproperty4", "cbatchproperty4");
		pros.put("cbatchproperty5", "cbatchproperty5");
		pros.put("cbatchproperty6", "cbatchproperty6");
		pros.put("cbatchproperty7", "cbatchproperty7");
		pros.put("cbatchproperty8", "cbatchproperty8");
		pros.put("cbatchproperty9", "cbatchproperty9");
		pros.put("cbatchproperty10", "cbatchproperty10");
		pros.put("cbmemo", "cbmemo");
		pros.put("ifaqty", "ifaqty");
		pros.put("istax", "istax");
		pros.put("applydid", "applydid");
		pros.put("applycode", "applycode");
		pros.put("irowno", "irowno");
		pros.put("strowguid", "strowguid");
		pros.put("cservicecode", "cservicecode");
		pros.put("cdefine36", "cdefine36");
		pros.put("cdefine37", "cdefine37");
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

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getCinvcode()
	{
		return cinvcode;
	}

	public void setCinvcode(String cinvcode)
	{
		this.cinvcode = cinvcode;
	}

	public Double getInum()
	{
		return inum;
	}

	public void setInum(Double inum)
	{
		this.inum = inum;
	}

	public Double getIquantity()
	{
		return iquantity;
	}

	public void setIquantity(Double iquantity)
	{
		this.iquantity = iquantity;
	}

	public Double getIunitcost()
	{
		return iunitcost;
	}

	public void setIunitcost(Double iunitcost)
	{
		this.iunitcost = iunitcost;
	}

	public Double getIprice()
	{
		return iprice;
	}

	public void setIprice(Double iprice)
	{
		this.iprice = iprice;
	}

	public Double getIaprice()
	{
		// return iaprice;
		return getIprice();
	}

	public void setIaprice(Double iaprice)
	{
		this.iaprice = iaprice;
	}

	public Double getIpunitcost()
	{
		return ipunitcost;
	}

	public void setIpunitcost(Double ipunitcost)
	{
		this.ipunitcost = ipunitcost;
	}

	public Double getIpprice()
	{
		return ipprice;
	}

	public void setIpprice(Double ipprice)
	{
		this.ipprice = ipprice;
	}

	public String getCbatch()
	{
		return cbatch;
	}

	public void setCbatch(String cbatch)
	{
		this.cbatch = cbatch;
	}

	public String getCobjcode()
	{
		return cobjcode;
	}

	public void setCobjcode(String cobjcode)
	{
		this.cobjcode = cobjcode;
	}

	public String getCvouchcode()
	{
		return cvouchcode;
	}

	public void setCvouchcode(String cvouchcode)
	{
		this.cvouchcode = cvouchcode;
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

	public String getIflag()
	{
		return iflag;
	}

	public void setIflag(String iflag)
	{
		this.iflag = iflag;
	}

	public Timestamp getDsdate()
	{
		return dsdate;
	}

	public void setDsdate(Timestamp dsdate)
	{
		this.dsdate = dsdate;
	}

	public Double getItax()
	{
		return itax;
	}

	public void setItax(Double itax)
	{
		this.itax = itax;
	}

	public Double getIsquantity()
	{
		return isquantity;
	}

	public void setIsquantity(Double isquantity)
	{
		this.isquantity = isquantity;
	}

	public Double getIsnum()
	{
		return isnum;
	}

	public void setIsnum(Double isnum)
	{
		this.isnum = isnum;
	}

	public Double getImoney()
	{
		return imoney;
	}

	public void setImoney(Double imoney)
	{
		this.imoney = imoney;
	}

	public Double getIsoutquantity()
	{
		return isoutquantity;
	}

	public void setIsoutquantity(Double isoutquantity)
	{
		this.isoutquantity = isoutquantity;
	}

	public Double getIsoutnum()
	{
		return isoutnum;
	}

	public void setIsoutnum(Double isoutnum)
	{
		this.isoutnum = isoutnum;
	}

	public Double getIfnum()
	{
		return ifnum;
	}

	public void setIfnum(Double ifnum)
	{
		this.ifnum = ifnum;
	}

	public Double getIfquantity()
	{
		return ifquantity;
	}

	public void setIfquantity(Double ifquantity)
	{
		this.ifquantity = ifquantity;
	}

	public Timestamp getDvdate()
	{
		return dvdate;
	}

	public void setDvdate(Timestamp dvdate)
	{
		this.dvdate = dvdate;
	}

	public Long getItrids()
	{
		return itrids;
	}

	public void setItrids(Long itrids)
	{
		this.itrids = itrids;
	}

	public String getCposition()
	{
		return cposition;
	}

	public void setCposition(String cposition)
	{
		this.cposition = cposition;
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

	public Long getIposid()
	{
		return iposid;
	}

	public void setIposid(Long iposid)
	{
		this.iposid = iposid;
	}

	public Double getFacost()
	{
		// return facost;
		return getIunitcost();
	}

	public void setFacost(Double facost)
	{
		this.facost = facost;
	}

	public Long getIdlsid()
	{
		return idlsid;
	}

	public void setIdlsid(Long idlsid)
	{
		this.idlsid = idlsid;
	}

	public Long getIsbsid()
	{
		return isbsid;
	}

	public void setIsbsid(Long isbsid)
	{
		this.isbsid = isbsid;
	}

	public Double getIsendquantity()
	{
		return isendquantity;
	}

	public void setIsendquantity(Double isendquantity)
	{
		this.isendquantity = isendquantity;
	}

	public Double getIsendnum()
	{
		return isendnum;
	}

	public void setIsendnum(Double isendnum)
	{
		this.isendnum = isendnum;
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

	public Long getIensid()
	{
		return iensid;
	}

	public void setIensid(Long iensid)
	{
		this.iensid = iensid;
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

	public String getCbarcode()
	{
		return cbarcode;
	}

	public void setCbarcode(String cbarcode)
	{
		this.cbarcode = cbarcode;
	}

	public Double getInquantity()
	{
		return inquantity;
	}

	public void setInquantity(Double inquantity)
	{
		this.inquantity = inquantity;
	}

	public Double getInnum()
	{
		return innum;
	}

	public void setInnum(Double innum)
	{
		this.innum = innum;
	}

	public String getCassunit()
	{
		return cassunit;
	}

	public void setCassunit(String cassunit)
	{
		this.cassunit = cassunit;
	}

	public Timestamp getDmadedate()
	{
		return dmadedate;
	}

	public void setDmadedate(Timestamp dmadedate)
	{
		this.dmadedate = dmadedate;
	}

	public Long getImassdate()
	{
		return imassdate;
	}

	public void setImassdate(Long imassdate)
	{
		this.imassdate = imassdate;
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

	public Long getImpoids()
	{
		return impoids;
	}

	public void setImpoids(Long impoids)
	{
		this.impoids = impoids;
	}

	public Long getIcheckids()
	{
		return icheckids;
	}

	public void setIcheckids(Long icheckids)
	{
		this.icheckids = icheckids;
	}

	public String getCbvencode()
	{
		return cbvencode;
	}

	public void setCbvencode(String cbvencode)
	{
		this.cbvencode = cbvencode;
	}

	public String getCinvouchcode()
	{
		return cinvouchcode;
	}

	public void setCinvouchcode(String cinvouchcode)
	{
		this.cinvouchcode = cinvouchcode;
	}

	public Boolean getBgsp()
	{
		return bgsp;
	}

	public void setBgsp(Boolean bgsp)
	{
		this.bgsp = bgsp;
	}

	public String getCgspstate()
	{
		return cgspstate;
	}

	public void setCgspstate(String cgspstate)
	{
		this.cgspstate = cgspstate;
	}

	public Long getIarrsid()
	{
		return iarrsid;
	}

	public void setIarrsid(Long iarrsid)
	{
		this.iarrsid = iarrsid;
	}

	public String getCcheckcode()
	{
		return ccheckcode;
	}

	public void setCcheckcode(String ccheckcode)
	{
		this.ccheckcode = ccheckcode;
	}

	public Long getIcheckidbaks()
	{
		return icheckidbaks;
	}

	public void setIcheckidbaks(Long icheckidbaks)
	{
		this.icheckidbaks = icheckidbaks;
	}

	public String getCrejectcode()
	{
		return crejectcode;
	}

	public void setCrejectcode(String crejectcode)
	{
		this.crejectcode = crejectcode;
	}

	public Long getIrejectids()
	{
		return irejectids;
	}

	public void setIrejectids(Long irejectids)
	{
		this.irejectids = irejectids;
	}

	public String getCcheckpersoncode()
	{
		return ccheckpersoncode;
	}

	public void setCcheckpersoncode(String ccheckpersoncode)
	{
		this.ccheckpersoncode = ccheckpersoncode;
	}

	public Timestamp getDcheckdate()
	{
		return dcheckdate;
	}

	public void setDcheckdate(Timestamp dcheckdate)
	{
		this.dcheckdate = dcheckdate;
	}

	public Double getIoritaxcost()
	{
		// return ioritaxcost;
		return getIoricost() * (1 + getItaxrate() / 100);
	}

	public void setIoritaxcost(Double ioritaxcost)
	{
		this.ioritaxcost = ioritaxcost;
	}

	public Double getIoricost()
	{
		// return ioricost;
		return getIunitcost();
	}

	public void setIoricost(Double ioricost)
	{
		this.ioricost = ioricost;
	}

	public Double getIorimoney()
	{
		// return iorimoney;
		return getIprice();
	}

	public void setIorimoney(Double iorimoney)
	{
		this.iorimoney = iorimoney;
	}

	public Double getIoritaxprice()
	{
		// return ioritaxprice;
		return getIprice() * getItaxrate() / 100;
	}

	public void setIoritaxprice(Double ioritaxprice)
	{
		this.ioritaxprice = ioritaxprice;
	}

	public Double getIorisum()
	{
		// return iorisum;
		return getIorimoney() + getIoritaxprice();
	}

	public void setIorisum(Double iorisum)
	{
		this.iorisum = iorisum;
	}

	public Double getItaxrate()
	{
		return itaxrate;
	}

	public void setItaxrate(Double itaxrate)
	{
		this.itaxrate = itaxrate;
	}

	public Double getItaxprice()
	{
		// return itaxprice;
		return getIoritaxprice();
	}

	public void setItaxprice(Double itaxprice)
	{
		this.itaxprice = itaxprice;
	}

	public Double getIsum()
	{
		// return isum;
		return getIorimoney() + getIoritaxprice();
	}

	public void setIsum(Double isum)
	{
		this.isum = isum;
	}

	public Boolean getBtaxcost()
	{
		return btaxcost;
	}

	public void setBtaxcost(Boolean btaxcost)
	{
		this.btaxcost = btaxcost;
	}

	public String getCpoid()
	{
		return cpoid;
	}

	public void setCpoid(String cpoid)
	{
		this.cpoid = cpoid;
	}

	public Long getCmassunit()
	{
		return cmassunit;
	}

	public void setCmassunit(Long cmassunit)
	{
		this.cmassunit = cmassunit;
	}

	public String getCmolotcode()
	{
		return cmolotcode;
	}

	public void setCmolotcode(String cmolotcode)
	{
		this.cmolotcode = cmolotcode;
	}

	public Long getIrefundinspectflag()
	{
		return irefundinspectflag;
	}

	public void setIrefundinspectflag(Long irefundinspectflag)
	{
		this.irefundinspectflag = irefundinspectflag;
	}

	public Double getImaterialfee()
	{
		return imaterialfee;
	}

	public void setImaterialfee(Double imaterialfee)
	{
		this.imaterialfee = imaterialfee;
	}

	public Double getIprocesscost()
	{
		return iprocesscost;
	}

	public void setIprocesscost(Double iprocesscost)
	{
		this.iprocesscost = iprocesscost;
	}

	public Double getIprocessfee()
	{
		return iprocessfee;
	}

	public void setIprocessfee(Double iprocessfee)
	{
		this.iprocessfee = iprocessfee;
	}

	public Timestamp getDmsdate()
	{
		return dmsdate;
	}

	public void setDmsdate(Timestamp dmsdate)
	{
		this.dmsdate = dmsdate;
	}

	public Double getIsmaterialfee()
	{
		return ismaterialfee;
	}

	public void setIsmaterialfee(Double ismaterialfee)
	{
		this.ismaterialfee = ismaterialfee;
	}

	public Double getIsprocessfee()
	{
		return isprocessfee;
	}

	public void setIsprocessfee(Double isprocessfee)
	{
		this.isprocessfee = isprocessfee;
	}

	public Long getIomodid()
	{
		return iomodid;
	}

	public void setIomodid(Long iomodid)
	{
		this.iomodid = iomodid;
	}

	public Long getIorderdid()
	{
		return iorderdid;
	}

	public void setIorderdid(Long iorderdid)
	{
		this.iorderdid = iorderdid;
	}

	public String getStrcontractid()
	{
		return strcontractid;
	}

	public void setStrcontractid(String strcontractid)
	{
		this.strcontractid = strcontractid;
	}

	public String getStrcode()
	{
		return strcode;
	}

	public void setStrcode(String strcode)
	{
		this.strcode = strcode;
	}

	public Long getBfilled()
	{
		return bfilled;
	}

	public void setBfilled(Long bfilled)
	{
		this.bfilled = bfilled;
	}

	public Boolean getBchecked()
	{
		return bchecked;
	}

	public void setBchecked(Boolean bchecked)
	{
		this.bchecked = bchecked;
	}

	public Boolean getBrelated()
	{
		return brelated;
	}

	public void setBrelated(Boolean brelated)
	{
		this.brelated = brelated;
	}

	public Long getIomomid()
	{
		return iomomid;
	}

	public void setIomomid(Long iomomid)
	{
		this.iomomid = iomomid;
	}

	public String getCmworkcentercode()
	{
		return cmworkcentercode;
	}

	public void setCmworkcentercode(String cmworkcentercode)
	{
		this.cmworkcentercode = cmworkcentercode;
	}

	public Long getImatsettlestate()
	{
		return imatsettlestate;
	}

	public void setImatsettlestate(Long imatsettlestate)
	{
		this.imatsettlestate = imatsettlestate;
	}

	public Long getIbillsettlecount()
	{
		return ibillsettlecount;
	}

	public void setIbillsettlecount(Long ibillsettlecount)
	{
		this.ibillsettlecount = ibillsettlecount;
	}

	public Long getIordertype()
	{
		return iordertype;
	}

	public void setIordertype(Long iordertype)
	{
		this.iordertype = iordertype;
	}

	public Long getIeqdid()
	{
		return ieqdid;
	}

	public void setIeqdid(Long ieqdid)
	{
		this.ieqdid = ieqdid;
	}

	public String getCvendorcode()
	{
		return cvendorcode;
	}

	public void setCvendorcode(String cvendorcode)
	{
		this.cvendorcode = cvendorcode;
	}

	public Boolean getBlpusefree()
	{
		return blpusefree;
	}

	public void setBlpusefree(Boolean blpusefree)
	{
		this.blpusefree = blpusefree;
	}

	public Long getIrsrowno()
	{
		return irsrowno;
	}

	public void setIrsrowno(Long irsrowno)
	{
		this.irsrowno = irsrowno;
	}

	public Long getIoritrackid()
	{
		return ioritrackid;
	}

	public void setIoritrackid(Long ioritrackid)
	{
		this.ioritrackid = ioritrackid;
	}

	public String getCbaccounter()
	{
		return cbaccounter;
	}

	public void setCbaccounter(String cbaccounter)
	{
		this.cbaccounter = cbaccounter;
	}

	public Boolean getBcosting()
	{
		return bcosting;
	}

	public void setBcosting(Boolean bcosting)
	{
		this.bcosting = bcosting;
	}

	public Double getIsumbillquantity()
	{
		return isumbillquantity;
	}

	public void setIsumbillquantity(Double isumbillquantity)
	{
		this.isumbillquantity = isumbillquantity;
	}

	public Boolean getBvmiused()
	{
		return bvmiused;
	}

	public void setBvmiused(Boolean bvmiused)
	{
		this.bvmiused = bvmiused;
	}

	public Double getIvmisettlequantity()
	{
		return ivmisettlequantity;
	}

	public void setIvmisettlequantity(Double ivmisettlequantity)
	{
		this.ivmisettlequantity = ivmisettlequantity;
	}

	public Double getIvmisettlenum()
	{
		return ivmisettlenum;
	}

	public void setIvmisettlenum(Double ivmisettlenum)
	{
		this.ivmisettlenum = ivmisettlenum;
	}

	public String getCvmivencode()
	{
		return cvmivencode;
	}

	public void setCvmivencode(String cvmivencode)
	{
		this.cvmivencode = cvmivencode;
	}

	public Long getIinvsncount()
	{
		return iinvsncount;
	}

	public void setIinvsncount(Long iinvsncount)
	{
		this.iinvsncount = iinvsncount;
	}

	public String getCwhpersoncode()
	{
		return cwhpersoncode;
	}

	public void setCwhpersoncode(String cwhpersoncode)
	{
		this.cwhpersoncode = cwhpersoncode;
	}

	public String getCwhpersonname()
	{
		return cwhpersonname;
	}

	public void setCwhpersonname(String cwhpersonname)
	{
		this.cwhpersonname = cwhpersonname;
	}

	public Long getImaids()
	{
		return imaids;
	}

	public void setImaids(Long imaids)
	{
		this.imaids = imaids;
	}

	public Double getImpcost()
	{
		return impcost;
	}

	public void setImpcost(Double impcost)
	{
		this.impcost = impcost;
	}

	public Long getIimosid()
	{
		return iimosid;
	}

	public void setIimosid(Long iimosid)
	{
		this.iimosid = iimosid;
	}

	public Long getIimbsid()
	{
		return iimbsid;
	}

	public void setIimbsid(Long iimbsid)
	{
		this.iimbsid = iimbsid;
	}

	public String getCserviceoid()
	{
		return cserviceoid;
	}

	public void setCserviceoid(String cserviceoid)
	{
		this.cserviceoid = cserviceoid;
	}

	public String getCbserviceoid()
	{
		return cbserviceoid;
	}

	public void setCbserviceoid(String cbserviceoid)
	{
		this.cbserviceoid = cbserviceoid;
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

	public Double getIbgstsum()
	{
		return ibgstsum;
	}

	public void setIbgstsum(Double ibgstsum)
	{
		this.ibgstsum = ibgstsum;
	}

	public Double getIbgiasum()
	{
		return ibgiasum;
	}

	public void setIbgiasum(Double ibgiasum)
	{
		this.ibgiasum = ibgiasum;
	}

	public String getCbarvcode()
	{
		return cbarvcode;
	}

	public void setCbarvcode(String cbarvcode)
	{
		this.cbarvcode = cbarvcode;
	}

	public String getDbarvdate()
	{
		return dbarvdate;
	}

	public void setDbarvdate(String dbarvdate)
	{
		this.dbarvdate = dbarvdate;
	}

	public Double getIinvexchrate()
	{
		return iinvexchrate;
	}

	public void setIinvexchrate(Double iinvexchrate)
	{
		this.iinvexchrate = iinvexchrate;
	}

	public String getCbdlcode()
	{
		return cbdlcode;
	}

	public void setCbdlcode(String cbdlcode)
	{
		this.cbdlcode = cbdlcode;
	}

	public String getIordercode()
	{
		return iordercode;
	}

	public void setIordercode(String iordercode)
	{
		this.iordercode = iordercode;
	}

	public Long getIorderseq()
	{
		return iorderseq;
	}

	public void setIorderseq(Long iorderseq)
	{
		this.iorderseq = iorderseq;
	}

	public String getCorufts()
	{
		return corufts;
	}

	public void setCorufts(String corufts)
	{
		this.corufts = corufts;
	}

	public String getComcode()
	{
		return comcode;
	}

	public void setComcode(String comcode)
	{
		this.comcode = comcode;
	}

	public String getCmocode()
	{
		return cmocode;
	}

	public void setCmocode(String cmocode)
	{
		this.cmocode = cmocode;
	}

	public String getInvcode()
	{
		return invcode;
	}

	public void setInvcode(String invcode)
	{
		this.invcode = invcode;
	}

	public Long getImoseq()
	{
		return imoseq;
	}

	public void setImoseq(Long imoseq)
	{
		this.imoseq = imoseq;
	}

	public String getIopseq()
	{
		return iopseq;
	}

	public void setIopseq(String iopseq)
	{
		this.iopseq = iopseq;
	}

	public String getCopdesc()
	{
		return copdesc;
	}

	public void setCopdesc(String copdesc)
	{
		this.copdesc = copdesc;
	}

	public String getStrcontractguid()
	{
		return strcontractguid;
	}

	public void setStrcontractguid(String strcontractguid)
	{
		this.strcontractguid = strcontractguid;
	}

	public Long getIexpiratdatecalcu()
	{
		return iexpiratdatecalcu;
	}

	public void setIexpiratdatecalcu(Long iexpiratdatecalcu)
	{
		this.iexpiratdatecalcu = iexpiratdatecalcu;
	}

	public String getCexpirationdate()
	{
		return cexpirationdate;
	}

	public void setCexpirationdate(String cexpirationdate)
	{
		this.cexpirationdate = cexpirationdate;
	}

	public Timestamp getDexpirationdate()
	{
		return dexpirationdate;
	}

	public void setDexpirationdate(Timestamp dexpirationdate)
	{
		this.dexpirationdate = dexpirationdate;
	}

	public String getCciqbookcode()
	{
		return cciqbookcode;
	}

	public void setCciqbookcode(String cciqbookcode)
	{
		this.cciqbookcode = cciqbookcode;
	}

	public Double getIbondedsumqty()
	{
		return ibondedsumqty;
	}

	public void setIbondedsumqty(Double ibondedsumqty)
	{
		this.ibondedsumqty = ibondedsumqty;
	}

	public String getCcusinvcode()
	{
		return ccusinvcode;
	}

	public void setCcusinvcode(String ccusinvcode)
	{
		this.ccusinvcode = ccusinvcode;
	}

	public String getCcusinvname()
	{
		return ccusinvname;
	}

	public void setCcusinvname(String ccusinvname)
	{
		this.ccusinvname = ccusinvname;
	}

	public Long getProductinids()
	{
		return productinids;
	}

	public void setProductinids(Long productinids)
	{
		this.productinids = productinids;
	}

	public String getIsodid()
	{
		return isodid;
	}

	public void setIsodid(String isodid)
	{
		this.isodid = isodid;
	}

	public Long getIsotype()
	{
		return isotype;
	}

	public void setIsotype(Long isotype)
	{
		this.isotype = isotype;
	}

	public String getCsocode()
	{
		return csocode;
	}

	public void setCsocode(String csocode)
	{
		this.csocode = csocode;
	}

	public Long getIsoseq()
	{
		return isoseq;
	}

	public void setIsoseq(Long isoseq)
	{
		this.isoseq = isoseq;
	}

	public Double getCbatchproperty1()
	{
		return cbatchproperty1;
	}

	public void setCbatchproperty1(Double cbatchproperty1)
	{
		this.cbatchproperty1 = cbatchproperty1;
	}

	public Double getCbatchproperty2()
	{
		return cbatchproperty2;
	}

	public void setCbatchproperty2(Double cbatchproperty2)
	{
		this.cbatchproperty2 = cbatchproperty2;
	}

	public Double getCbatchproperty3()
	{
		return cbatchproperty3;
	}

	public void setCbatchproperty3(Double cbatchproperty3)
	{
		this.cbatchproperty3 = cbatchproperty3;
	}

	public Double getCbatchproperty4()
	{
		return cbatchproperty4;
	}

	public void setCbatchproperty4(Double cbatchproperty4)
	{
		this.cbatchproperty4 = cbatchproperty4;
	}

	public Double getCbatchproperty5()
	{
		return cbatchproperty5;
	}

	public void setCbatchproperty5(Double cbatchproperty5)
	{
		this.cbatchproperty5 = cbatchproperty5;
	}

	public String getCbatchproperty6()
	{
		return cbatchproperty6;
	}

	public void setCbatchproperty6(String cbatchproperty6)
	{
		this.cbatchproperty6 = cbatchproperty6;
	}

	public String getCbatchproperty7()
	{
		return cbatchproperty7;
	}

	public void setCbatchproperty7(String cbatchproperty7)
	{
		this.cbatchproperty7 = cbatchproperty7;
	}

	public String getCbatchproperty8()
	{
		return cbatchproperty8;
	}

	public void setCbatchproperty8(String cbatchproperty8)
	{
		this.cbatchproperty8 = cbatchproperty8;
	}

	public String getCbatchproperty9()
	{
		return cbatchproperty9;
	}

	public void setCbatchproperty9(String cbatchproperty9)
	{
		this.cbatchproperty9 = cbatchproperty9;
	}

	public Timestamp getCbatchproperty10()
	{
		return cbatchproperty10;
	}

	public void setCbatchproperty10(Timestamp cbatchproperty10)
	{
		this.cbatchproperty10 = cbatchproperty10;
	}

	public String getCbmemo()
	{
		return cbmemo;
	}

	public void setCbmemo(String cbmemo)
	{
		this.cbmemo = cbmemo;
	}

	public Double getIfaqty()
	{
		return ifaqty;
	}

	public void setIfaqty(Double ifaqty)
	{
		this.ifaqty = ifaqty;
	}

	public Double getIstax()
	{
		return istax;
	}

	public void setIstax(Double istax)
	{
		this.istax = istax;
	}

	public Long getApplydid()
	{
		return applydid;
	}

	public void setApplydid(Long applydid)
	{
		this.applydid = applydid;
	}

	public String getApplycode()
	{
		return applycode;
	}

	public void setApplycode(String applycode)
	{
		this.applycode = applycode;
	}

	public Long getIrowno()
	{
		return irowno;
	}

	public void setIrowno(Long irowno)
	{
		this.irowno = irowno;
	}

	public String getStrowguid()
	{
		return strowguid;
	}

	public void setStrowguid(String strowguid)
	{
		this.strowguid = strowguid;
	}

	public String getCservicecode()
	{
		return cservicecode;
	}

	public void setCservicecode(String cservicecode)
	{
		this.cservicecode = cservicecode;
	}

	public String getCdefine36()
	{
		return cdefine36;
	}

	public void setCdefine36(String cdefine36)
	{
		this.cdefine36 = cdefine36;
	}

	public String getCdefine37()
	{
		return cdefine37;
	}

	public void setCdefine37(String cdefine37)
	{
		this.cdefine37 = cdefine37;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
