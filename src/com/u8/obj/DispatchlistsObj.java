package com.u8.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class DispatchlistsObj extends BaseDbObj
{
//	private Long autoid;
	private Long dlid;
	private Long icorid;
	private String cwhcode;
	private String cinvcode;
	private Double iquantity;
	private Double inum;
	private Double iquotedprice;
	private Double iunitprice;
	private Double itaxunitprice;
	private Double imoney;
	private Double itax;
	private Double isum;
	private Double idiscount;
	private Double inatunitprice;
	private Double inatmoney;
	private Double inattax;
	private Double inatsum;
	private Double inatdiscount;
	private Double isettlenum;
	private Double isettlequantity;
	private Long ibatch;
	private String cbatch;
	private Boolean bsettleall;
	private String cmemo;
	private String cfree1;
	private String cfree2;
	private String itb;
	private Timestamp dvdate;
	private Double tbquantity;
	private Double tbnum;
	private Long isosid;
	private Long idlsid;
	private Double kl;
	private Double kl2;
	private String cinvname;
	private Double itaxrate;
	private String cdefine22;
	private String cdefine23;
	private String cdefine24;
	private String cdefine25;
	private Double cdefine26;
	private Double cdefine27;
	private Double foutquantity;
	private Double foutnum;
	private String citemcode;
	private String citem_class;
	private Double fsalecost;
	private Double fsaleprice;
	private String cvenabbname;
	private String citemname;
	private String citem_cname;
	private String cfree3;
	private String cfree4;
	private String cfree5;
	private String cfree6;
	private String cfree7;
	private String cfree8;
	private String cfree9;
	private String cfree10;
	private Boolean bisstqc;
	private Double iinvexchrate;
	private String cunitid;
	private String ccode;
	private Double iretquantity;
	private Double fensettlequan;
	private Double fensettlesum;
	private Double isettleprice;
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
	private Timestamp dmdate;
	private Boolean bgsp;
	private String cgspstate;
	private String csocode;
	private String ccorcode;
	private Long ippartseqid;
	private Long ippartid;
	private Double ippartqty;
	private String ccontractid;
	private String ccontracttagcode;
	private String ccontractrowguid;
	private Long imassdate;
	private Long cmassunit;
	private Boolean bqaneedcheck;
	private Boolean bqaurgency;
	private Boolean bqachecking;
	private Boolean bqachecked;
	private Double iqaquantity;
	private Double iqanum;
	private String ccusinvcode;
	private String ccusinvname;
	private Double fsumsignquantity;
	private Double fsumsignnum;
	private String cbaccounter;
	private Boolean bcosting;
	private String cordercode;
	private Long iorderrowno;
	private Double fcusminprice;
	private Double icostquantity;
	private Double icostsum;
	private String ispecialtype;
	private String cvmivencode;
	private Double iexchsum;
	private Double imoneysum;
	private Long irowno;
	private Double frettbquantity;
	private Double fretsum;
	private Long iexpiratdatecalcu;
	private Timestamp dexpirationdate;
	private String cexpirationdate;
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
	private Double dblpreexchmomey;
	private Double dblpremomey;
	private Long idemandtype;
	private String cdemandcode;
	private String cdemandmemo;
	private String cdemandid;
	private Long idemandseq;
	private String cvencode;
	private String creasoncode;
	private String cinvsn;
	private Long iinvsncount;
	private Boolean bneedsign;
	private Boolean bsignover;
	private Boolean bneedloss;
	private Double flossrate;
	private Double frlossqty;
	private Double fulossqty;
	private Long isettletype;
	private String crelacuscode;
	private String clossmaker;
	private Timestamp dlossdate;
	private Timestamp dlosstime;
	private Long icoridlsid;
	private Double fretoutqty;
	private String body_outid;
	private Double fveribillqty;
	private Double fveribillsum;
	private Double fveriretqty;
	private Double fveriretsum;
	private Double flastsettleqty;
	private Double flastsettlesum;
	private String cbookwhcode;
	private String cinvouchtype;
	private String cposition;
	private Double fretqtywkp;
	private Double fretqtyykp;
	private Double frettbqtyykp;
	private Double fretsumykp;
	private Timestamp dkeepdate;
	private String cscloser;
	private Long isaleoutid;
	private Boolean bsaleprice;
	private Boolean bgift;
	private Boolean bmpforderclosed;
	private String cbsysbarcode;
	private Double fxjquantity;
	private Double fxjnum;
	private Boolean biacreatebill;
	private String cparentcode;
	private String cchildcode;
	private Double fchildqty;
	private Double fchildrate;
	private String icalctype;
	private Double fappretwkpqty;
	private Double fappretwkpsum;
	private Double fappretykpqty;
	private Double fappretykpsum;
	private Double fappretwkptbqty;
	private Double fappretykptbqty;
	private Long irtnappid;
	private String crtnappcode;

	@Override
	public String findKeyColumnName()
	{
		return null;
	}

	@Override
	public String findParentKeyColumnName()
	{
		return "dlid";
	}

	@Override
	public String findTableName()
	{
		return "dispatchlists";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "Dispatchlists";
	}

	@Override
	public String getCnName()
	{
		return "销售发货单子表";
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
		pros.put("dlid", "dlid");
		pros.put("icorid", "icorid");
		pros.put("cwhcode", "cwhcode");
		pros.put("cinvcode", "cinvcode");
		pros.put("iquantity", "iquantity");
		pros.put("inum", "inum");
		pros.put("iquotedprice", "iquotedprice");
		pros.put("iunitprice", "iunitprice");
		pros.put("itaxunitprice", "itaxunitprice");
		pros.put("imoney", "imoney");
		pros.put("itax", "itax");
		pros.put("isum", "isum");
		pros.put("idiscount", "idiscount");
		pros.put("inatunitprice", "inatunitprice");
		pros.put("inatmoney", "inatmoney");
		pros.put("inattax", "inattax");
		pros.put("inatsum", "inatsum");
		pros.put("inatdiscount", "inatdiscount");
		pros.put("isettlenum", "isettlenum");
		pros.put("isettlequantity", "isettlequantity");
		pros.put("ibatch", "ibatch");
		pros.put("cbatch", "cbatch");
		pros.put("bsettleall", "bsettleall");
		pros.put("cmemo", "cmemo");
		pros.put("cfree1", "cfree1");
		pros.put("cfree2", "cfree2");
		pros.put("itb", "itb");
		pros.put("dvdate", "dvdate");
		pros.put("tbquantity", "tbquantity");
		pros.put("tbnum", "tbnum");
		pros.put("isosid", "isosid");
		pros.put("idlsid", "idlsid");
		pros.put("kl", "kl");
		pros.put("kl2", "kl2");
		pros.put("cinvname", "cinvname");
		pros.put("itaxrate", "itaxrate");
		pros.put("cdefine22", "cdefine22");
		pros.put("cdefine23", "cdefine23");
		pros.put("cdefine24", "cdefine24");
		pros.put("cdefine25", "cdefine25");
		pros.put("cdefine26", "cdefine26");
		pros.put("cdefine27", "cdefine27");
		pros.put("foutquantity", "foutquantity");
		pros.put("foutnum", "foutnum");
		pros.put("citemcode", "citemcode");
		pros.put("citem_class", "citem_class");
		pros.put("fsalecost", "fsalecost");
		pros.put("fsaleprice", "fsaleprice");
		pros.put("cvenabbname", "cvenabbname");
		pros.put("citemname", "citemname");
		pros.put("citem_cname", "citem_cname");
		pros.put("cfree3", "cfree3");
		pros.put("cfree4", "cfree4");
		pros.put("cfree5", "cfree5");
		pros.put("cfree6", "cfree6");
		pros.put("cfree7", "cfree7");
		pros.put("cfree8", "cfree8");
		pros.put("cfree9", "cfree9");
		pros.put("cfree10", "cfree10");
		pros.put("bisstqc", "bisstqc");
		pros.put("iinvexchrate", "iinvexchrate");
		pros.put("cunitid", "cunitid");
		pros.put("ccode", "ccode");
		pros.put("iretquantity", "iretquantity");
		pros.put("fensettlequan", "fensettlequan");
		pros.put("fensettlesum", "fensettlesum");
		pros.put("isettleprice", "isettleprice");
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
		pros.put("dmdate", "dmdate");
		pros.put("bgsp", "bgsp");
		pros.put("cgspstate", "cgspstate");
		pros.put("csocode", "csocode");
		pros.put("ccorcode", "ccorcode");
		pros.put("ippartseqid", "ippartseqid");
		pros.put("ippartid", "ippartid");
		pros.put("ippartqty", "ippartqty");
		pros.put("ccontractid", "ccontractid");
		pros.put("ccontracttagcode", "ccontracttagcode");
		pros.put("ccontractrowguid", "ccontractrowguid");
		pros.put("imassdate", "imassdate");
		pros.put("cmassunit", "cmassunit");
		pros.put("bqaneedcheck", "bqaneedcheck");
		pros.put("bqaurgency", "bqaurgency");
		pros.put("bqachecking", "bqachecking");
		pros.put("bqachecked", "bqachecked");
		pros.put("iqaquantity", "iqaquantity");
		pros.put("iqanum", "iqanum");
		pros.put("ccusinvcode", "ccusinvcode");
		pros.put("ccusinvname", "ccusinvname");
		pros.put("fsumsignquantity", "fsumsignquantity");
		pros.put("fsumsignnum", "fsumsignnum");
		pros.put("cbaccounter", "cbaccounter");
		pros.put("bcosting", "bcosting");
		pros.put("cordercode", "cordercode");
		pros.put("iorderrowno", "iorderrowno");
		pros.put("fcusminprice", "fcusminprice");
		pros.put("icostquantity", "icostquantity");
		pros.put("icostsum", "icostsum");
		pros.put("ispecialtype", "ispecialtype");
		pros.put("cvmivencode", "cvmivencode");
		pros.put("iexchsum", "iexchsum");
		pros.put("imoneysum", "imoneysum");
		pros.put("irowno", "irowno");
		pros.put("frettbquantity", "frettbquantity");
		pros.put("fretsum", "fretsum");
		pros.put("iexpiratdatecalcu", "iexpiratdatecalcu");
		pros.put("dexpirationdate", "dexpirationdate");
		pros.put("cexpirationdate", "cexpirationdate");
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
		pros.put("dblpreexchmomey", "dblpreexchmomey");
		pros.put("dblpremomey", "dblpremomey");
		pros.put("idemandtype", "idemandtype");
		pros.put("cdemandcode", "cdemandcode");
		pros.put("cdemandmemo", "cdemandmemo");
		pros.put("cdemandid", "cdemandid");
		pros.put("idemandseq", "idemandseq");
		pros.put("cvencode", "cvencode");
		pros.put("creasoncode", "creasoncode");
		pros.put("cinvsn", "cinvsn");
		pros.put("iinvsncount", "iinvsncount");
		pros.put("bneedsign", "bneedsign");
		pros.put("bsignover", "bsignover");
		pros.put("bneedloss", "bneedloss");
		pros.put("flossrate", "flossrate");
		pros.put("frlossqty", "frlossqty");
		pros.put("fulossqty", "fulossqty");
		pros.put("isettletype", "isettletype");
		pros.put("crelacuscode", "crelacuscode");
		pros.put("clossmaker", "clossmaker");
		pros.put("dlossdate", "dlossdate");
		pros.put("dlosstime", "dlosstime");
		pros.put("icoridlsid", "icoridlsid");
		pros.put("fretoutqty", "fretoutqty");
		pros.put("body_outid", "body_outid");
		pros.put("fveribillqty", "fveribillqty");
		pros.put("fveribillsum", "fveribillsum");
		pros.put("fveriretqty", "fveriretqty");
		pros.put("fveriretsum", "fveriretsum");
		pros.put("flastsettleqty", "flastsettleqty");
		pros.put("flastsettlesum", "flastsettlesum");
		pros.put("cbookwhcode", "cbookwhcode");
		pros.put("cinvouchtype", "cinvouchtype");
		pros.put("cposition", "cposition");
		pros.put("fretqtywkp", "fretqtywkp");
		pros.put("fretqtyykp", "fretqtyykp");
		pros.put("frettbqtyykp", "frettbqtyykp");
		pros.put("fretsumykp", "fretsumykp");
		pros.put("dkeepdate", "dkeepdate");
		pros.put("cscloser", "cscloser");
		pros.put("isaleoutid", "isaleoutid");
		pros.put("bsaleprice", "bsaleprice");
		pros.put("bgift", "bgift");
		pros.put("bmpforderclosed", "bmpforderclosed");
		pros.put("cbsysbarcode", "cbsysbarcode");
		pros.put("fxjquantity", "fxjquantity");
		pros.put("fxjnum", "fxjnum");
		pros.put("biacreatebill", "biacreatebill");
		pros.put("cparentcode", "cparentcode");
		pros.put("cchildcode", "cchildcode");
		pros.put("fchildqty", "fchildqty");
		pros.put("fchildrate", "fchildrate");
		pros.put("icalctype", "icalctype");
		pros.put("fappretwkpqty", "fappretwkpqty");
		pros.put("fappretwkpsum", "fappretwkpsum");
		pros.put("fappretykpqty", "fappretykpqty");
		pros.put("fappretykpsum", "fappretykpsum");
		pros.put("fappretwkptbqty", "fappretwkptbqty");
		pros.put("fappretykptbqty", "fappretykptbqty");
		pros.put("irtnappid", "irtnappid");
		pros.put("crtnappcode", "crtnappcode");
		return pros;
	}

//	public Long getAutoid()
//	{
//		return autoid;
//	}
//
//	public void setAutoid(Long autoid)
//	{
//		this.autoid = autoid;
//	}

	public Long getDlid()
	{
		return dlid;
	}

	public void setDlid(Long dlid)
	{
		this.dlid = dlid;
	}

	public Long getIcorid()
	{
		return icorid;
	}

	public void setIcorid(Long icorid)
	{
		this.icorid = icorid;
	}

	public String getCwhcode()
	{
		return cwhcode;
	}

	public void setCwhcode(String cwhcode)
	{
		this.cwhcode = cwhcode;
	}

	public String getCinvcode()
	{
		return cinvcode;
	}

	public void setCinvcode(String cinvcode)
	{
		this.cinvcode = cinvcode;
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

	public Double getIquotedprice()
	{
		return iquotedprice;
	}

	public void setIquotedprice(Double iquotedprice)
	{
		this.iquotedprice = iquotedprice;
	}

	public Double getIunitprice()
	{
		return iunitprice;
	}

	public void setIunitprice(Double iunitprice)
	{
		this.iunitprice = iunitprice;
	}

	public Double getItaxunitprice()
	{
		return itaxunitprice;
	}

	public void setItaxunitprice(Double itaxunitprice)
	{
		this.itaxunitprice = itaxunitprice;
	}

	public Double getImoney()
	{
		return imoney;
	}

	public void setImoney(Double imoney)
	{
		this.imoney = imoney;
	}

	public Double getItax()
	{
		return itax;
	}

	public void setItax(Double itax)
	{
		this.itax = itax;
	}

	public Double getIsum()
	{
		return isum;
	}

	public void setIsum(Double isum)
	{
		this.isum = isum;
	}

	public Double getIdiscount()
	{
		return idiscount;
	}

	public void setIdiscount(Double idiscount)
	{
		this.idiscount = idiscount;
	}

	public Double getInatunitprice()
	{
		return inatunitprice;
	}

	public void setInatunitprice(Double inatunitprice)
	{
		this.inatunitprice = inatunitprice;
	}

	public Double getInatmoney()
	{
		return inatmoney;
	}

	public void setInatmoney(Double inatmoney)
	{
		this.inatmoney = inatmoney;
	}

	public Double getInattax()
	{
		return inattax;
	}

	public void setInattax(Double inattax)
	{
		this.inattax = inattax;
	}

	public Double getInatsum()
	{
		return inatsum;
	}

	public void setInatsum(Double inatsum)
	{
		this.inatsum = inatsum;
	}

	public Double getInatdiscount()
	{
		return inatdiscount;
	}

	public void setInatdiscount(Double inatdiscount)
	{
		this.inatdiscount = inatdiscount;
	}

	public Double getIsettlenum()
	{
		return isettlenum;
	}

	public void setIsettlenum(Double isettlenum)
	{
		this.isettlenum = isettlenum;
	}

	public Double getIsettlequantity()
	{
		return isettlequantity;
	}

	public void setIsettlequantity(Double isettlequantity)
	{
		this.isettlequantity = isettlequantity;
	}

	public Long getIbatch()
	{
		return ibatch;
	}

	public void setIbatch(Long ibatch)
	{
		this.ibatch = ibatch;
	}

	public String getCbatch()
	{
		return cbatch;
	}

	public void setCbatch(String cbatch)
	{
		this.cbatch = cbatch;
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

	public String getItb()
	{
		return itb;
	}

	public void setItb(String itb)
	{
		this.itb = itb;
	}

	public Timestamp getDvdate()
	{
		return dvdate;
	}

	public void setDvdate(Timestamp dvdate)
	{
		this.dvdate = dvdate;
	}

	public Double getTbquantity()
	{
		return tbquantity;
	}

	public void setTbquantity(Double tbquantity)
	{
		this.tbquantity = tbquantity;
	}

	public Double getTbnum()
	{
		return tbnum;
	}

	public void setTbnum(Double tbnum)
	{
		this.tbnum = tbnum;
	}

	public Long getIsosid()
	{
		return isosid;
	}

	public void setIsosid(Long isosid)
	{
		this.isosid = isosid;
	}

	public Long getIdlsid()
	{
		return idlsid;
	}

	public void setIdlsid(Long idlsid)
	{
		this.idlsid = idlsid;
	}

	public Double getKl()
	{
		return kl;
	}

	public void setKl(Double kl)
	{
		this.kl = kl;
	}

	public Double getKl2()
	{
		return kl2;
	}

	public void setKl2(Double kl2)
	{
		this.kl2 = kl2;
	}

	public String getCinvname()
	{
		return cinvname;
	}

	public void setCinvname(String cinvname)
	{
		this.cinvname = cinvname;
	}

	public Double getItaxrate()
	{
		return itaxrate;
	}

	public void setItaxrate(Double itaxrate)
	{
		this.itaxrate = itaxrate;
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

	public Double getFoutquantity()
	{
		return foutquantity;
	}

	public void setFoutquantity(Double foutquantity)
	{
		this.foutquantity = foutquantity;
	}

	public Double getFoutnum()
	{
		return foutnum;
	}

	public void setFoutnum(Double foutnum)
	{
		this.foutnum = foutnum;
	}

	public String getCitemcode()
	{
		return citemcode;
	}

	public void setCitemcode(String citemcode)
	{
		this.citemcode = citemcode;
	}

	public String getCitem_class()
	{
		return citem_class;
	}

	public void setCitem_class(String citem_class)
	{
		this.citem_class = citem_class;
	}

	public Double getFsalecost()
	{
		return fsalecost;
	}

	public void setFsalecost(Double fsalecost)
	{
		this.fsalecost = fsalecost;
	}

	public Double getFsaleprice()
	{
		return fsaleprice;
	}

	public void setFsaleprice(Double fsaleprice)
	{
		this.fsaleprice = fsaleprice;
	}

	public String getCvenabbname()
	{
		return cvenabbname;
	}

	public void setCvenabbname(String cvenabbname)
	{
		this.cvenabbname = cvenabbname;
	}

	public String getCitemname()
	{
		return citemname;
	}

	public void setCitemname(String citemname)
	{
		this.citemname = citemname;
	}

	public String getCitem_cname()
	{
		return citem_cname;
	}

	public void setCitem_cname(String citem_cname)
	{
		this.citem_cname = citem_cname;
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

	public Boolean getBisstqc()
	{
		return bisstqc;
	}

	public void setBisstqc(Boolean bisstqc)
	{
		this.bisstqc = bisstqc;
	}

	public Double getIinvexchrate()
	{
		return iinvexchrate;
	}

	public void setIinvexchrate(Double iinvexchrate)
	{
		this.iinvexchrate = iinvexchrate;
	}

	public String getCunitid()
	{
		return cunitid;
	}

	public void setCunitid(String cunitid)
	{
		this.cunitid = cunitid;
	}

	public String getCcode()
	{
		return ccode;
	}

	public void setCcode(String ccode)
	{
		this.ccode = ccode;
	}

	public Double getIretquantity()
	{
		return iretquantity;
	}

	public void setIretquantity(Double iretquantity)
	{
		this.iretquantity = iretquantity;
	}

	public Double getFensettlequan()
	{
		return fensettlequan;
	}

	public void setFensettlequan(Double fensettlequan)
	{
		this.fensettlequan = fensettlequan;
	}

	public Double getFensettlesum()
	{
		return fensettlesum;
	}

	public void setFensettlesum(Double fensettlesum)
	{
		this.fensettlesum = fensettlesum;
	}

	public Double getIsettleprice()
	{
		return isettleprice;
	}

	public void setIsettleprice(Double isettleprice)
	{
		this.isettleprice = isettleprice;
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

	public Timestamp getDmdate()
	{
		return dmdate;
	}

	public void setDmdate(Timestamp dmdate)
	{
		this.dmdate = dmdate;
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

	public String getCsocode()
	{
		return csocode;
	}

	public void setCsocode(String csocode)
	{
		this.csocode = csocode;
	}

	public String getCcorcode()
	{
		return ccorcode;
	}

	public void setCcorcode(String ccorcode)
	{
		this.ccorcode = ccorcode;
	}

	public Long getIppartseqid()
	{
		return ippartseqid;
	}

	public void setIppartseqid(Long ippartseqid)
	{
		this.ippartseqid = ippartseqid;
	}

	public Long getIppartid()
	{
		return ippartid;
	}

	public void setIppartid(Long ippartid)
	{
		this.ippartid = ippartid;
	}

	public Double getIppartqty()
	{
		return ippartqty;
	}

	public void setIppartqty(Double ippartqty)
	{
		this.ippartqty = ippartqty;
	}

	public String getCcontractid()
	{
		return ccontractid;
	}

	public void setCcontractid(String ccontractid)
	{
		this.ccontractid = ccontractid;
	}

	public String getCcontracttagcode()
	{
		return ccontracttagcode;
	}

	public void setCcontracttagcode(String ccontracttagcode)
	{
		this.ccontracttagcode = ccontracttagcode;
	}

	public String getCcontractrowguid()
	{
		return ccontractrowguid;
	}

	public void setCcontractrowguid(String ccontractrowguid)
	{
		this.ccontractrowguid = ccontractrowguid;
	}

	public Long getImassdate()
	{
		return imassdate;
	}

	public void setImassdate(Long imassdate)
	{
		this.imassdate = imassdate;
	}

	public Long getCmassunit()
	{
		return cmassunit;
	}

	public void setCmassunit(Long cmassunit)
	{
		this.cmassunit = cmassunit;
	}

	public Boolean getBqaneedcheck()
	{
		return bqaneedcheck;
	}

	public void setBqaneedcheck(Boolean bqaneedcheck)
	{
		this.bqaneedcheck = bqaneedcheck;
	}

	public Boolean getBqaurgency()
	{
		return bqaurgency;
	}

	public void setBqaurgency(Boolean bqaurgency)
	{
		this.bqaurgency = bqaurgency;
	}

	public Boolean getBqachecking()
	{
		return bqachecking;
	}

	public void setBqachecking(Boolean bqachecking)
	{
		this.bqachecking = bqachecking;
	}

	public Boolean getBqachecked()
	{
		return bqachecked;
	}

	public void setBqachecked(Boolean bqachecked)
	{
		this.bqachecked = bqachecked;
	}

	public Double getIqaquantity()
	{
		return iqaquantity;
	}

	public void setIqaquantity(Double iqaquantity)
	{
		this.iqaquantity = iqaquantity;
	}

	public Double getIqanum()
	{
		return iqanum;
	}

	public void setIqanum(Double iqanum)
	{
		this.iqanum = iqanum;
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

	public Double getFsumsignquantity()
	{
		return fsumsignquantity;
	}

	public void setFsumsignquantity(Double fsumsignquantity)
	{
		this.fsumsignquantity = fsumsignquantity;
	}

	public Double getFsumsignnum()
	{
		return fsumsignnum;
	}

	public void setFsumsignnum(Double fsumsignnum)
	{
		this.fsumsignnum = fsumsignnum;
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

	public String getCordercode()
	{
		return cordercode;
	}

	public void setCordercode(String cordercode)
	{
		this.cordercode = cordercode;
	}

	public Long getIorderrowno()
	{
		return iorderrowno;
	}

	public void setIorderrowno(Long iorderrowno)
	{
		this.iorderrowno = iorderrowno;
	}

	public Double getFcusminprice()
	{
		return fcusminprice;
	}

	public void setFcusminprice(Double fcusminprice)
	{
		this.fcusminprice = fcusminprice;
	}

	public Double getIcostquantity()
	{
		return icostquantity;
	}

	public void setIcostquantity(Double icostquantity)
	{
		this.icostquantity = icostquantity;
	}

	public Double getIcostsum()
	{
		return icostsum;
	}

	public void setIcostsum(Double icostsum)
	{
		this.icostsum = icostsum;
	}

	public String getIspecialtype()
	{
		return ispecialtype;
	}

	public void setIspecialtype(String ispecialtype)
	{
		this.ispecialtype = ispecialtype;
	}

	public String getCvmivencode()
	{
		return cvmivencode;
	}

	public void setCvmivencode(String cvmivencode)
	{
		this.cvmivencode = cvmivencode;
	}

	public Double getIexchsum()
	{
		return iexchsum;
	}

	public void setIexchsum(Double iexchsum)
	{
		this.iexchsum = iexchsum;
	}

	public Double getImoneysum()
	{
		return imoneysum;
	}

	public void setImoneysum(Double imoneysum)
	{
		this.imoneysum = imoneysum;
	}

	public Long getIrowno()
	{
		return irowno;
	}

	public void setIrowno(Long irowno)
	{
		this.irowno = irowno;
	}

	public Double getFrettbquantity()
	{
		return frettbquantity;
	}

	public void setFrettbquantity(Double frettbquantity)
	{
		this.frettbquantity = frettbquantity;
	}

	public Double getFretsum()
	{
		return fretsum;
	}

	public void setFretsum(Double fretsum)
	{
		this.fretsum = fretsum;
	}

	public Long getIexpiratdatecalcu()
	{
		return iexpiratdatecalcu;
	}

	public void setIexpiratdatecalcu(Long iexpiratdatecalcu)
	{
		this.iexpiratdatecalcu = iexpiratdatecalcu;
	}

	public Timestamp getDexpirationdate()
	{
		return dexpirationdate;
	}

	public void setDexpirationdate(Timestamp dexpirationdate)
	{
		this.dexpirationdate = dexpirationdate;
	}

	public String getCexpirationdate()
	{
		return cexpirationdate;
	}

	public void setCexpirationdate(String cexpirationdate)
	{
		this.cexpirationdate = cexpirationdate;
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

	public Double getDblpreexchmomey()
	{
		return dblpreexchmomey;
	}

	public void setDblpreexchmomey(Double dblpreexchmomey)
	{
		this.dblpreexchmomey = dblpreexchmomey;
	}

	public Double getDblpremomey()
	{
		return dblpremomey;
	}

	public void setDblpremomey(Double dblpremomey)
	{
		this.dblpremomey = dblpremomey;
	}

	public Long getIdemandtype()
	{
		return idemandtype;
	}

	public void setIdemandtype(Long idemandtype)
	{
		this.idemandtype = idemandtype;
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

	public String getCdemandid()
	{
		return cdemandid;
	}

	public void setCdemandid(String cdemandid)
	{
		this.cdemandid = cdemandid;
	}

	public Long getIdemandseq()
	{
		return idemandseq;
	}

	public void setIdemandseq(Long idemandseq)
	{
		this.idemandseq = idemandseq;
	}

	public String getCvencode()
	{
		return cvencode;
	}

	public void setCvencode(String cvencode)
	{
		this.cvencode = cvencode;
	}

	public String getCreasoncode()
	{
		return creasoncode;
	}

	public void setCreasoncode(String creasoncode)
	{
		this.creasoncode = creasoncode;
	}

	public String getCinvsn()
	{
		return cinvsn;
	}

	public void setCinvsn(String cinvsn)
	{
		this.cinvsn = cinvsn;
	}

	public Long getIinvsncount()
	{
		return iinvsncount;
	}

	public void setIinvsncount(Long iinvsncount)
	{
		this.iinvsncount = iinvsncount;
	}

	public Boolean getBneedsign()
	{
		return bneedsign;
	}

	public void setBneedsign(Boolean bneedsign)
	{
		this.bneedsign = bneedsign;
	}

	public Boolean getBsignover()
	{
		return bsignover;
	}

	public void setBsignover(Boolean bsignover)
	{
		this.bsignover = bsignover;
	}

	public Boolean getBneedloss()
	{
		return bneedloss;
	}

	public void setBneedloss(Boolean bneedloss)
	{
		this.bneedloss = bneedloss;
	}

	public Double getFlossrate()
	{
		return flossrate;
	}

	public void setFlossrate(Double flossrate)
	{
		this.flossrate = flossrate;
	}

	public Double getFrlossqty()
	{
		return frlossqty;
	}

	public void setFrlossqty(Double frlossqty)
	{
		this.frlossqty = frlossqty;
	}

	public Double getFulossqty()
	{
		return fulossqty;
	}

	public void setFulossqty(Double fulossqty)
	{
		this.fulossqty = fulossqty;
	}

	public Long getIsettletype()
	{
		return isettletype;
	}

	public void setIsettletype(Long isettletype)
	{
		this.isettletype = isettletype;
	}

	public String getCrelacuscode()
	{
		return crelacuscode;
	}

	public void setCrelacuscode(String crelacuscode)
	{
		this.crelacuscode = crelacuscode;
	}

	public String getClossmaker()
	{
		return clossmaker;
	}

	public void setClossmaker(String clossmaker)
	{
		this.clossmaker = clossmaker;
	}

	public Timestamp getDlossdate()
	{
		return dlossdate;
	}

	public void setDlossdate(Timestamp dlossdate)
	{
		this.dlossdate = dlossdate;
	}

	public Timestamp getDlosstime()
	{
		return dlosstime;
	}

	public void setDlosstime(Timestamp dlosstime)
	{
		this.dlosstime = dlosstime;
	}

	public Long getIcoridlsid()
	{
		return icoridlsid;
	}

	public void setIcoridlsid(Long icoridlsid)
	{
		this.icoridlsid = icoridlsid;
	}

	public Double getFretoutqty()
	{
		return fretoutqty;
	}

	public void setFretoutqty(Double fretoutqty)
	{
		this.fretoutqty = fretoutqty;
	}

	public String getBody_outid()
	{
		return body_outid;
	}

	public void setBody_outid(String body_outid)
	{
		this.body_outid = body_outid;
	}

	public Double getFveribillqty()
	{
		return fveribillqty;
	}

	public void setFveribillqty(Double fveribillqty)
	{
		this.fveribillqty = fveribillqty;
	}

	public Double getFveribillsum()
	{
		return fveribillsum;
	}

	public void setFveribillsum(Double fveribillsum)
	{
		this.fveribillsum = fveribillsum;
	}

	public Double getFveriretqty()
	{
		return fveriretqty;
	}

	public void setFveriretqty(Double fveriretqty)
	{
		this.fveriretqty = fveriretqty;
	}

	public Double getFveriretsum()
	{
		return fveriretsum;
	}

	public void setFveriretsum(Double fveriretsum)
	{
		this.fveriretsum = fveriretsum;
	}

	public Double getFlastsettleqty()
	{
		return flastsettleqty;
	}

	public void setFlastsettleqty(Double flastsettleqty)
	{
		this.flastsettleqty = flastsettleqty;
	}

	public Double getFlastsettlesum()
	{
		return flastsettlesum;
	}

	public void setFlastsettlesum(Double flastsettlesum)
	{
		this.flastsettlesum = flastsettlesum;
	}

	public String getCbookwhcode()
	{
		return cbookwhcode;
	}

	public void setCbookwhcode(String cbookwhcode)
	{
		this.cbookwhcode = cbookwhcode;
	}

	public String getCinvouchtype()
	{
		return cinvouchtype;
	}

	public void setCinvouchtype(String cinvouchtype)
	{
		this.cinvouchtype = cinvouchtype;
	}

	public String getCposition()
	{
		return cposition;
	}

	public void setCposition(String cposition)
	{
		this.cposition = cposition;
	}

	public Double getFretqtywkp()
	{
		return fretqtywkp;
	}

	public void setFretqtywkp(Double fretqtywkp)
	{
		this.fretqtywkp = fretqtywkp;
	}

	public Double getFretqtyykp()
	{
		return fretqtyykp;
	}

	public void setFretqtyykp(Double fretqtyykp)
	{
		this.fretqtyykp = fretqtyykp;
	}

	public Double getFrettbqtyykp()
	{
		return frettbqtyykp;
	}

	public void setFrettbqtyykp(Double frettbqtyykp)
	{
		this.frettbqtyykp = frettbqtyykp;
	}

	public Double getFretsumykp()
	{
		return fretsumykp;
	}

	public void setFretsumykp(Double fretsumykp)
	{
		this.fretsumykp = fretsumykp;
	}

	public Timestamp getDkeepdate()
	{
		return dkeepdate;
	}

	public void setDkeepdate(Timestamp dkeepdate)
	{
		this.dkeepdate = dkeepdate;
	}

	public String getCscloser()
	{
		return cscloser;
	}

	public void setCscloser(String cscloser)
	{
		this.cscloser = cscloser;
	}

	public Long getIsaleoutid()
	{
		return isaleoutid;
	}

	public void setIsaleoutid(Long isaleoutid)
	{
		this.isaleoutid = isaleoutid;
	}

	public Boolean getBsaleprice()
	{
		return bsaleprice;
	}

	public void setBsaleprice(Boolean bsaleprice)
	{
		this.bsaleprice = bsaleprice;
	}

	public Boolean getBgift()
	{
		return bgift;
	}

	public void setBgift(Boolean bgift)
	{
		this.bgift = bgift;
	}

	public Boolean getBmpforderclosed()
	{
		return bmpforderclosed;
	}

	public void setBmpforderclosed(Boolean bmpforderclosed)
	{
		this.bmpforderclosed = bmpforderclosed;
	}

	public String getCbsysbarcode()
	{
		return cbsysbarcode;
	}

	public void setCbsysbarcode(String cbsysbarcode)
	{
		this.cbsysbarcode = cbsysbarcode;
	}

	public Double getFxjquantity()
	{
		return fxjquantity;
	}

	public void setFxjquantity(Double fxjquantity)
	{
		this.fxjquantity = fxjquantity;
	}

	public Double getFxjnum()
	{
		return fxjnum;
	}

	public void setFxjnum(Double fxjnum)
	{
		this.fxjnum = fxjnum;
	}

	public Boolean getBiacreatebill()
	{
		return biacreatebill;
	}

	public void setBiacreatebill(Boolean biacreatebill)
	{
		this.biacreatebill = biacreatebill;
	}

	public String getCparentcode()
	{
		return cparentcode;
	}

	public void setCparentcode(String cparentcode)
	{
		this.cparentcode = cparentcode;
	}

	public String getCchildcode()
	{
		return cchildcode;
	}

	public void setCchildcode(String cchildcode)
	{
		this.cchildcode = cchildcode;
	}

	public Double getFchildqty()
	{
		return fchildqty;
	}

	public void setFchildqty(Double fchildqty)
	{
		this.fchildqty = fchildqty;
	}

	public Double getFchildrate()
	{
		return fchildrate;
	}

	public void setFchildrate(Double fchildrate)
	{
		this.fchildrate = fchildrate;
	}

	public String getIcalctype()
	{
		return icalctype;
	}

	public void setIcalctype(String icalctype)
	{
		this.icalctype = icalctype;
	}

	public Double getFappretwkpqty()
	{
		return fappretwkpqty;
	}

	public void setFappretwkpqty(Double fappretwkpqty)
	{
		this.fappretwkpqty = fappretwkpqty;
	}

	public Double getFappretwkpsum()
	{
		return fappretwkpsum;
	}

	public void setFappretwkpsum(Double fappretwkpsum)
	{
		this.fappretwkpsum = fappretwkpsum;
	}

	public Double getFappretykpqty()
	{
		return fappretykpqty;
	}

	public void setFappretykpqty(Double fappretykpqty)
	{
		this.fappretykpqty = fappretykpqty;
	}

	public Double getFappretykpsum()
	{
		return fappretykpsum;
	}

	public void setFappretykpsum(Double fappretykpsum)
	{
		this.fappretykpsum = fappretykpsum;
	}

	public Double getFappretwkptbqty()
	{
		return fappretwkptbqty;
	}

	public void setFappretwkptbqty(Double fappretwkptbqty)
	{
		this.fappretwkptbqty = fappretwkptbqty;
	}

	public Double getFappretykptbqty()
	{
		return fappretykptbqty;
	}

	public void setFappretykptbqty(Double fappretykptbqty)
	{
		this.fappretykptbqty = fappretykptbqty;
	}

	public Long getIrtnappid()
	{
		return irtnappid;
	}

	public void setIrtnappid(Long irtnappid)
	{
		this.irtnappid = irtnappid;
	}

	public String getCrtnappcode()
	{
		return crtnappcode;
	}

	public void setCrtnappcode(String crtnappcode)
	{
		this.crtnappcode = crtnappcode;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
