package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class StRepKctzMxObj extends BaseDbObj
{
	private Long id;
	private Long autoid;
	private String cvouchtype;
	private String cvouchname;
	private String cwhcode;
	private String cinvcode;
	private Timestamp ddate;
	private Timestamp dveridate;
	private String yl;
	private String cbustype;
	private String cbuscode;
	private String ccode;
	private String cdepname;
	private String cpersonname;
	private String chandler;
	private String cmaker;
	private String cbatch;
	private String dvdate;
	private String iexpiratdatecalcu;
	private String cexpirationdate;
	private String cciqbookcode;
	private Double ichangrate;
	private String igrouptype;
	private Double iqcnum;
	private Double iqcqty;
	private Double iinnum;
	private Double iinqtty;
	private Double ioutnum;
	private Double ioutqtty;
	private String ccusabbname;
	private String cvenabbname;
	private String crdname;
	private String cwhname;
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
	private String cdefine11;
	private String cdefine12;
	private String cdefine13;
	private String cdefine14;
	private Long cdefine15;
	private Double cdefine16;
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
	private String cfree1;
	private String cfree2;
	private String cfree3;
	private String cfree4;
	private String cfree5;
	private String cfree6;
	private String cfree7;
	private String cfree8;
	private String cfree9;
	private String cfree10;
	private String cvmivencode;
	private String cvmivenname;
	private Timestamp dcheckdate;
	private String ccheckcode;
	private String ccheckpersonname;
	private String crejectcode;
	private String dvalidatedate;
	private String cbmemo;
	private String isotype;
	private String csocode;
	private Long isoseq;
	private String isodid;
	private String cdemandmemo;
	private String cmolotcode;
	private String cshipaddress;
	
	private String cddh;//出口产品生产订单号

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
		return "st_rep_kctz_mx";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "StRepKctzMx";
	}

	@Override
	public String getCnName()
	{
		return "库存台账";
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
		// pros.put("autoid", "autoid");
		// pros.put("cvouchtype", "cvouchtype");
		pros.put("cvouchname", "单据类型");
		pros.put("cwhcode", "仓库");
		pros.put("cinvcode", "存货编码");
		pros.put("ddate", "单据日期");
		pros.put("dveridate", "审核日期");
		// pros.put("yl", "yl");
		pros.put("cbustype", "单据类型");
		// pros.put("cbuscode", "cbuscode");
		// pros.put("ccode", "ccode");
		// pros.put("cdepname", "cdepname");
		// pros.put("cpersonname", "cpersonname");
		// pros.put("chandler", "chandler");
		// pros.put("cmaker", "cmaker");
		pros.put("cbatch", "批号");
		// pros.put("dvdate", "dvdate");
		// pros.put("iexpiratdatecalcu", "iexpiratdatecalcu");
		// pros.put("cexpirationdate", "cexpirationdate");
		// pros.put("cciqbookcode", "cciqbookcode");
		// pros.put("ichangrate", "ichangrate");
		// pros.put("igrouptype", "igrouptype");
		// pros.put("iqcnum", "iqcnum");
		pros.put("iqcqty", "期初数量");
		// pros.put("iinnum", "iinnum");
		pros.put("iinqtty", "收入数量");
		// pros.put("ioutnum", "ioutnum");
		pros.put("ioutqtty", "发出数量");
		// pros.put("ccusabbname", "ccusabbname");
		// pros.put("cvenabbname", "cvenabbname");
		// pros.put("crdname", "crdname");
		pros.put("cwhname", "仓库");
		// pros.put("cmemo", "cmemo");
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
		pros.put("cfree1", "cfree1");
		pros.put("cfree2", "cfree2");
		pros.put("cfree3", "cfree3");
		pros.put("cfree4", "cfree4");
		pros.put("cfree5", "cfree5");
		pros.put("cfree6", "cfree6");
		pros.put("cfree7", "cfree7");
		pros.put("cfree8", "cfree8");
		pros.put("cfree9", "cfree9");
		pros.put("cfree10", "cfree10");
		pros.put("cvmivencode", "cvmivencode");
		pros.put("cvmivenname", "cvmivenname");
		pros.put("dcheckdate", "dcheckdate");
		pros.put("ccheckcode", "ccheckcode");
		pros.put("ccheckpersonname", "ccheckpersonname");
		pros.put("crejectcode", "crejectcode");
		pros.put("dvalidatedate", "dvalidatedate");
		pros.put("cbmemo", "cbmemo");
		pros.put("isotype", "isotype");
		pros.put("csocode", "csocode");
		pros.put("isoseq", "isoseq");
		pros.put("isodid", "isodid");
		pros.put("cdemandmemo", "cdemandmemo");
		pros.put("cmolotcode", "cmolotcode");
		pros.put("cshipaddress", "cshipaddress");
		pros.put("cddh", "出口产品生产订单号");
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

	public Long getAutoid()
	{
		return autoid;
	}

	public void setAutoid(Long autoid)
	{
		this.autoid = autoid;
	}

	public String getCvouchtype()
	{
		return cvouchtype;
	}

	public void setCvouchtype(String cvouchtype)
	{
		this.cvouchtype = cvouchtype;
	}

	public String getCvouchname()
	{
		return cvouchname;
	}

	public void setCvouchname(String cvouchname)
	{
		this.cvouchname = cvouchname;
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

	public Timestamp getDdate()
	{
		return ddate;
	}

	public void setDdate(Timestamp ddate)
	{
		this.ddate = ddate;
	}

	public Timestamp getDveridate()
	{
		return dveridate;
	}

	public void setDveridate(Timestamp dveridate)
	{
		this.dveridate = dveridate;
	}

	public String getYl()
	{
		return yl;
	}

	public void setYl(String yl)
	{
		this.yl = yl;
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

	public String getCcode()
	{
		return ccode;
	}

	public void setCcode(String ccode)
	{
		this.ccode = ccode;
	}

	public String getCdepname()
	{
		return cdepname;
	}

	public void setCdepname(String cdepname)
	{
		this.cdepname = cdepname;
	}

	public String getCpersonname()
	{
		return cpersonname;
	}

	public void setCpersonname(String cpersonname)
	{
		this.cpersonname = cpersonname;
	}

	public String getChandler()
	{
		return chandler;
	}

	public void setChandler(String chandler)
	{
		this.chandler = chandler;
	}

	public String getCmaker()
	{
		return cmaker;
	}

	public void setCmaker(String cmaker)
	{
		this.cmaker = cmaker;
	}

	public String getCbatch()
	{
		return cbatch;
	}

	public void setCbatch(String cbatch)
	{
		this.cbatch = cbatch;
	}

	public String getDvdate()
	{
		return dvdate;
	}

	public void setDvdate(String dvdate)
	{
		this.dvdate = dvdate;
	}

	public String getIexpiratdatecalcu()
	{
		return iexpiratdatecalcu;
	}

	public void setIexpiratdatecalcu(String iexpiratdatecalcu)
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

	public String getCciqbookcode()
	{
		return cciqbookcode;
	}

	public void setCciqbookcode(String cciqbookcode)
	{
		this.cciqbookcode = cciqbookcode;
	}

	public Double getIchangrate()
	{
		return ichangrate;
	}

	public void setIchangrate(Double ichangrate)
	{
		this.ichangrate = ichangrate;
	}

	public String getIgrouptype()
	{
		return igrouptype;
	}

	public void setIgrouptype(String igrouptype)
	{
		this.igrouptype = igrouptype;
	}

	public Double getIqcnum()
	{
		return iqcnum;
	}

	public void setIqcnum(Double iqcnum)
	{
		this.iqcnum = iqcnum;
	}

	public Double getIqcqty()
	{
		return iqcqty;
	}

	public void setIqcqty(Double iqcqty)
	{
		this.iqcqty = iqcqty;
	}

	public Double getIinnum()
	{
		return iinnum;
	}

	public void setIinnum(Double iinnum)
	{
		this.iinnum = iinnum;
	}

	public Double getIinqtty()
	{
		return iinqtty;
	}

	public void setIinqtty(Double iinqtty)
	{
		this.iinqtty = iinqtty;
	}

	public Double getIoutnum()
	{
		return ioutnum;
	}

	public void setIoutnum(Double ioutnum)
	{
		this.ioutnum = ioutnum;
	}

	public Double getIoutqtty()
	{
		return ioutqtty;
	}

	public void setIoutqtty(Double ioutqtty)
	{
		this.ioutqtty = ioutqtty;
	}

	public String getCcusabbname()
	{
		return ccusabbname;
	}

	public void setCcusabbname(String ccusabbname)
	{
		this.ccusabbname = ccusabbname;
	}

	public String getCvenabbname()
	{
		return cvenabbname;
	}

	public void setCvenabbname(String cvenabbname)
	{
		this.cvenabbname = cvenabbname;
	}

	public String getCrdname()
	{
		return crdname;
	}

	public void setCrdname(String crdname)
	{
		this.crdname = crdname;
	}

	public String getCwhname()
	{
		return cwhname;
	}

	public void setCwhname(String cwhname)
	{
		this.cwhname = cwhname;
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

	public String getCvmivencode()
	{
		return cvmivencode;
	}

	public void setCvmivencode(String cvmivencode)
	{
		this.cvmivencode = cvmivencode;
	}

	public String getCvmivenname()
	{
		return cvmivenname;
	}

	public void setCvmivenname(String cvmivenname)
	{
		this.cvmivenname = cvmivenname;
	}

	public Timestamp getDcheckdate()
	{
		return dcheckdate;
	}

	public void setDcheckdate(Timestamp dcheckdate)
	{
		this.dcheckdate = dcheckdate;
	}

	public String getCcheckcode()
	{
		return ccheckcode;
	}

	public void setCcheckcode(String ccheckcode)
	{
		this.ccheckcode = ccheckcode;
	}

	public String getCcheckpersonname()
	{
		return ccheckpersonname;
	}

	public void setCcheckpersonname(String ccheckpersonname)
	{
		this.ccheckpersonname = ccheckpersonname;
	}

	public String getCrejectcode()
	{
		return crejectcode;
	}

	public void setCrejectcode(String crejectcode)
	{
		this.crejectcode = crejectcode;
	}

	public String getDvalidatedate()
	{
		return dvalidatedate;
	}

	public void setDvalidatedate(String dvalidatedate)
	{
		this.dvalidatedate = dvalidatedate;
	}

	public String getCbmemo()
	{
		return cbmemo;
	}

	public void setCbmemo(String cbmemo)
	{
		this.cbmemo = cbmemo;
	}

	public String getIsotype()
	{
		return isotype;
	}

	public void setIsotype(String isotype)
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

	public String getIsodid()
	{
		return isodid;
	}

	public void setIsodid(String isodid)
	{
		this.isodid = isodid;
	}

	public String getCdemandmemo()
	{
		return cdemandmemo;
	}

	public void setCdemandmemo(String cdemandmemo)
	{
		this.cdemandmemo = cdemandmemo;
	}

	public String getCmolotcode()
	{
		return cmolotcode;
	}

	public void setCmolotcode(String cmolotcode)
	{
		this.cmolotcode = cmolotcode;
	}

	public String getCshipaddress()
	{
		return cshipaddress;
	}

	public void setCshipaddress(String cshipaddress)
	{
		this.cshipaddress = cshipaddress;
	}

	public String getCddh()
	{
		return cddh;
	}

	public void setCddh(String cddh)
	{
		this.cddh = cddh;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
