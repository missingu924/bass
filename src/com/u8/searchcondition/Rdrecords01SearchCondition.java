package com.u8.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class Rdrecords01SearchCondition extends BaseSearchCondition
{
private Long id_min;
private Long id_max;
private Double inum_min;
private Double inum_max;
private Double iquantity_min;
private Double iquantity_max;
private Double iunitcost_min;
private Double iunitcost_max;
private Double iprice_min;
private Double iprice_max;
private Double iaprice_min;
private Double iaprice_max;
private Double ipunitcost_min;
private Double ipunitcost_max;
private Double ipprice_min;
private Double ipprice_max;
private Long cvouchcode_min;
private Long cvouchcode_max;
private Double isoutquantity_min;
private Double isoutquantity_max;
private Double isoutnum_min;
private Double isoutnum_max;
private Timestamp dsdate_min;
private Timestamp dsdate_max;
private Double itax_min;
private Double itax_max;
private Double isquantity_min;
private Double isquantity_max;
private Double isnum_min;
private Double isnum_max;
private Double imoney_min;
private Double imoney_max;
private Double ifnum_min;
private Double ifnum_max;
private Double ifquantity_min;
private Double ifquantity_max;
private Timestamp dvdate_min;
private Timestamp dvdate_max;
private Double cdefine26_min;
private Double cdefine26_max;
private Double cdefine27_min;
private Double cdefine27_max;
private Long iposid_min;
private Long iposid_max;
private Double facost_min;
private Double facost_max;
private Double inquantity_min;
private Double inquantity_max;
private Double innum_min;
private Double innum_max;
private Timestamp dmadedate_min;
private Timestamp dmadedate_max;
private Long imassdate_min;
private Long imassdate_max;
private Long cdefine34_min;
private Long cdefine34_max;
private Long cdefine35_min;
private Long cdefine35_max;
private Timestamp cdefine36_min;
private Timestamp cdefine36_max;
private Timestamp cdefine37_min;
private Timestamp cdefine37_max;
private Long icheckids_min;
private Long icheckids_max;
private Long iarrsid_min;
private Long iarrsid_max;
private Long icheckidbaks_min;
private Long icheckidbaks_max;
private Long irejectids_min;
private Long irejectids_max;
private Timestamp dcheckdate_min;
private Timestamp dcheckdate_max;
private Double ioritaxcost_min;
private Double ioritaxcost_max;
private Double ioricost_min;
private Double ioricost_max;
private Double iorimoney_min;
private Double iorimoney_max;
private Double ioritaxprice_min;
private Double ioritaxprice_max;
private Double iorisum_min;
private Double iorisum_max;
private Double itaxrate_min;
private Double itaxrate_max;
private Double itaxprice_min;
private Double itaxprice_max;
private Double isum_min;
private Double isum_max;
private Long cmassunit_min;
private Long cmassunit_max;
private Double imaterialfee_min;
private Double imaterialfee_max;
private Double iprocesscost_min;
private Double iprocesscost_max;
private Double iprocessfee_min;
private Double iprocessfee_max;
private Timestamp dmsdate_min;
private Timestamp dmsdate_max;
private Double ismaterialfee_min;
private Double ismaterialfee_max;
private Double isprocessfee_min;
private Double isprocessfee_max;
private Long iomodid_min;
private Long iomodid_max;
private Long iomomid_min;
private Long iomomid_max;
private Long imatsettlestate_min;
private Long imatsettlestate_max;
private Long ibillsettlecount_min;
private Long ibillsettlecount_max;
private Long ioritrackid_min;
private Long ioritrackid_max;
private Timestamp dbkeepdate_min;
private Timestamp dbkeepdate_max;
private Double isumbillquantity_min;
private Double isumbillquantity_max;
private Double ivmisettlequantity_min;
private Double ivmisettlequantity_max;
private Double ivmisettlenum_min;
private Double ivmisettlenum_max;
private Long iinvsncount_min;
private Long iinvsncount_max;
private Double impcost_min;
private Double impcost_max;
private Long iimosid_min;
private Long iimosid_max;
private Long iimbsid_min;
private Long iimbsid_max;
private Double iinvexchrate_min;
private Double iinvexchrate_max;
private Long iexpiratdatecalcu_min;
private Long iexpiratdatecalcu_max;
private Timestamp dexpirationdate_min;
private Timestamp dexpirationdate_max;
private Double ibondedsumqty_min;
private Double ibondedsumqty_max;
private Long iorderdid_min;
private Long iorderdid_max;
private Long iorderseq_min;
private Long iorderseq_max;
private Long isoseq_min;
private Long isoseq_max;
private Double cbatchproperty1_min;
private Double cbatchproperty1_max;
private Double cbatchproperty2_min;
private Double cbatchproperty2_max;
private Double cbatchproperty3_min;
private Double cbatchproperty3_max;
private Double cbatchproperty4_min;
private Double cbatchproperty4_max;
private Double cbatchproperty5_min;
private Double cbatchproperty5_max;
private Timestamp cbatchproperty10_min;
private Timestamp cbatchproperty10_max;
private Double ifaqty_min;
private Double ifaqty_max;
private Double istax_min;
private Double istax_max;
private Long irowno_min;
private Long irowno_max;
private Double ipreuseqty_min;
private Double ipreuseqty_max;
private Double ipreuseinum_min;
private Double ipreuseinum_max;
private Long idebitids_min;
private Long idebitids_max;
private Double outcopiedquantity_min;
private Double outcopiedquantity_max;
private Long ioldpartid_min;
private Long ioldpartid_max;
private Double foldquantity_min;
private Double foldquantity_max;
private Long imergecheckautoid_min;
private Long imergecheckautoid_max;
private Long ireworkmodetailsid_min;
private Long ireworkmodetailsid_max;
private Long iproducttype_min;
private Long iproducttype_max;
private Long imainmodetailsid_min;
private Long imainmodetailsid_max;
private Double isharematerialfee_min;
private Double isharematerialfee_max;
private Long bgift_min;
private Long bgift_max;
private Long iposflag_min;
private Long iposflag_max;
public Long getId_min()
{
	return id_min;
}
public void setId_min(Long id_min)
{
	this.id_min = id_min;
}
public Long getId_max()
{
	return id_max;
}
public void setId_max(Long id_max)
{
	this.id_max = id_max;
}
public Double getInum_min()
{
	return inum_min;
}
public void setInum_min(Double inum_min)
{
	this.inum_min = inum_min;
}
public Double getInum_max()
{
	return inum_max;
}
public void setInum_max(Double inum_max)
{
	this.inum_max = inum_max;
}
public Double getIquantity_min()
{
	return iquantity_min;
}
public void setIquantity_min(Double iquantity_min)
{
	this.iquantity_min = iquantity_min;
}
public Double getIquantity_max()
{
	return iquantity_max;
}
public void setIquantity_max(Double iquantity_max)
{
	this.iquantity_max = iquantity_max;
}
public Double getIunitcost_min()
{
	return iunitcost_min;
}
public void setIunitcost_min(Double iunitcost_min)
{
	this.iunitcost_min = iunitcost_min;
}
public Double getIunitcost_max()
{
	return iunitcost_max;
}
public void setIunitcost_max(Double iunitcost_max)
{
	this.iunitcost_max = iunitcost_max;
}
public Double getIprice_min()
{
	return iprice_min;
}
public void setIprice_min(Double iprice_min)
{
	this.iprice_min = iprice_min;
}
public Double getIprice_max()
{
	return iprice_max;
}
public void setIprice_max(Double iprice_max)
{
	this.iprice_max = iprice_max;
}
public Double getIaprice_min()
{
	return iaprice_min;
}
public void setIaprice_min(Double iaprice_min)
{
	this.iaprice_min = iaprice_min;
}
public Double getIaprice_max()
{
	return iaprice_max;
}
public void setIaprice_max(Double iaprice_max)
{
	this.iaprice_max = iaprice_max;
}
public Double getIpunitcost_min()
{
	return ipunitcost_min;
}
public void setIpunitcost_min(Double ipunitcost_min)
{
	this.ipunitcost_min = ipunitcost_min;
}
public Double getIpunitcost_max()
{
	return ipunitcost_max;
}
public void setIpunitcost_max(Double ipunitcost_max)
{
	this.ipunitcost_max = ipunitcost_max;
}
public Double getIpprice_min()
{
	return ipprice_min;
}
public void setIpprice_min(Double ipprice_min)
{
	this.ipprice_min = ipprice_min;
}
public Double getIpprice_max()
{
	return ipprice_max;
}
public void setIpprice_max(Double ipprice_max)
{
	this.ipprice_max = ipprice_max;
}
public Long getCvouchcode_min()
{
	return cvouchcode_min;
}
public void setCvouchcode_min(Long cvouchcode_min)
{
	this.cvouchcode_min = cvouchcode_min;
}
public Long getCvouchcode_max()
{
	return cvouchcode_max;
}
public void setCvouchcode_max(Long cvouchcode_max)
{
	this.cvouchcode_max = cvouchcode_max;
}
public Double getIsoutquantity_min()
{
	return isoutquantity_min;
}
public void setIsoutquantity_min(Double isoutquantity_min)
{
	this.isoutquantity_min = isoutquantity_min;
}
public Double getIsoutquantity_max()
{
	return isoutquantity_max;
}
public void setIsoutquantity_max(Double isoutquantity_max)
{
	this.isoutquantity_max = isoutquantity_max;
}
public Double getIsoutnum_min()
{
	return isoutnum_min;
}
public void setIsoutnum_min(Double isoutnum_min)
{
	this.isoutnum_min = isoutnum_min;
}
public Double getIsoutnum_max()
{
	return isoutnum_max;
}
public void setIsoutnum_max(Double isoutnum_max)
{
	this.isoutnum_max = isoutnum_max;
}
public Timestamp getDsdate_min()
{
	return dsdate_min;
}
public void setDsdate_min(Timestamp dsdate_min)
{
	this.dsdate_min = dsdate_min;
}
public Timestamp getDsdate_max()
{
	return dsdate_max;
}
public void setDsdate_max(Timestamp dsdate_max)
{
	this.dsdate_max = dsdate_max;
}
public Double getItax_min()
{
	return itax_min;
}
public void setItax_min(Double itax_min)
{
	this.itax_min = itax_min;
}
public Double getItax_max()
{
	return itax_max;
}
public void setItax_max(Double itax_max)
{
	this.itax_max = itax_max;
}
public Double getIsquantity_min()
{
	return isquantity_min;
}
public void setIsquantity_min(Double isquantity_min)
{
	this.isquantity_min = isquantity_min;
}
public Double getIsquantity_max()
{
	return isquantity_max;
}
public void setIsquantity_max(Double isquantity_max)
{
	this.isquantity_max = isquantity_max;
}
public Double getIsnum_min()
{
	return isnum_min;
}
public void setIsnum_min(Double isnum_min)
{
	this.isnum_min = isnum_min;
}
public Double getIsnum_max()
{
	return isnum_max;
}
public void setIsnum_max(Double isnum_max)
{
	this.isnum_max = isnum_max;
}
public Double getImoney_min()
{
	return imoney_min;
}
public void setImoney_min(Double imoney_min)
{
	this.imoney_min = imoney_min;
}
public Double getImoney_max()
{
	return imoney_max;
}
public void setImoney_max(Double imoney_max)
{
	this.imoney_max = imoney_max;
}
public Double getIfnum_min()
{
	return ifnum_min;
}
public void setIfnum_min(Double ifnum_min)
{
	this.ifnum_min = ifnum_min;
}
public Double getIfnum_max()
{
	return ifnum_max;
}
public void setIfnum_max(Double ifnum_max)
{
	this.ifnum_max = ifnum_max;
}
public Double getIfquantity_min()
{
	return ifquantity_min;
}
public void setIfquantity_min(Double ifquantity_min)
{
	this.ifquantity_min = ifquantity_min;
}
public Double getIfquantity_max()
{
	return ifquantity_max;
}
public void setIfquantity_max(Double ifquantity_max)
{
	this.ifquantity_max = ifquantity_max;
}
public Timestamp getDvdate_min()
{
	return dvdate_min;
}
public void setDvdate_min(Timestamp dvdate_min)
{
	this.dvdate_min = dvdate_min;
}
public Timestamp getDvdate_max()
{
	return dvdate_max;
}
public void setDvdate_max(Timestamp dvdate_max)
{
	this.dvdate_max = dvdate_max;
}
public Double getCdefine26_min()
{
	return cdefine26_min;
}
public void setCdefine26_min(Double cdefine26_min)
{
	this.cdefine26_min = cdefine26_min;
}
public Double getCdefine26_max()
{
	return cdefine26_max;
}
public void setCdefine26_max(Double cdefine26_max)
{
	this.cdefine26_max = cdefine26_max;
}
public Double getCdefine27_min()
{
	return cdefine27_min;
}
public void setCdefine27_min(Double cdefine27_min)
{
	this.cdefine27_min = cdefine27_min;
}
public Double getCdefine27_max()
{
	return cdefine27_max;
}
public void setCdefine27_max(Double cdefine27_max)
{
	this.cdefine27_max = cdefine27_max;
}
public Long getIposid_min()
{
	return iposid_min;
}
public void setIposid_min(Long iposid_min)
{
	this.iposid_min = iposid_min;
}
public Long getIposid_max()
{
	return iposid_max;
}
public void setIposid_max(Long iposid_max)
{
	this.iposid_max = iposid_max;
}
public Double getFacost_min()
{
	return facost_min;
}
public void setFacost_min(Double facost_min)
{
	this.facost_min = facost_min;
}
public Double getFacost_max()
{
	return facost_max;
}
public void setFacost_max(Double facost_max)
{
	this.facost_max = facost_max;
}
public Double getInquantity_min()
{
	return inquantity_min;
}
public void setInquantity_min(Double inquantity_min)
{
	this.inquantity_min = inquantity_min;
}
public Double getInquantity_max()
{
	return inquantity_max;
}
public void setInquantity_max(Double inquantity_max)
{
	this.inquantity_max = inquantity_max;
}
public Double getInnum_min()
{
	return innum_min;
}
public void setInnum_min(Double innum_min)
{
	this.innum_min = innum_min;
}
public Double getInnum_max()
{
	return innum_max;
}
public void setInnum_max(Double innum_max)
{
	this.innum_max = innum_max;
}
public Timestamp getDmadedate_min()
{
	return dmadedate_min;
}
public void setDmadedate_min(Timestamp dmadedate_min)
{
	this.dmadedate_min = dmadedate_min;
}
public Timestamp getDmadedate_max()
{
	return dmadedate_max;
}
public void setDmadedate_max(Timestamp dmadedate_max)
{
	this.dmadedate_max = dmadedate_max;
}
public Long getImassdate_min()
{
	return imassdate_min;
}
public void setImassdate_min(Long imassdate_min)
{
	this.imassdate_min = imassdate_min;
}
public Long getImassdate_max()
{
	return imassdate_max;
}
public void setImassdate_max(Long imassdate_max)
{
	this.imassdate_max = imassdate_max;
}
public Long getCdefine34_min()
{
	return cdefine34_min;
}
public void setCdefine34_min(Long cdefine34_min)
{
	this.cdefine34_min = cdefine34_min;
}
public Long getCdefine34_max()
{
	return cdefine34_max;
}
public void setCdefine34_max(Long cdefine34_max)
{
	this.cdefine34_max = cdefine34_max;
}
public Long getCdefine35_min()
{
	return cdefine35_min;
}
public void setCdefine35_min(Long cdefine35_min)
{
	this.cdefine35_min = cdefine35_min;
}
public Long getCdefine35_max()
{
	return cdefine35_max;
}
public void setCdefine35_max(Long cdefine35_max)
{
	this.cdefine35_max = cdefine35_max;
}
public Timestamp getCdefine36_min()
{
	return cdefine36_min;
}
public void setCdefine36_min(Timestamp cdefine36_min)
{
	this.cdefine36_min = cdefine36_min;
}
public Timestamp getCdefine36_max()
{
	return cdefine36_max;
}
public void setCdefine36_max(Timestamp cdefine36_max)
{
	this.cdefine36_max = cdefine36_max;
}
public Timestamp getCdefine37_min()
{
	return cdefine37_min;
}
public void setCdefine37_min(Timestamp cdefine37_min)
{
	this.cdefine37_min = cdefine37_min;
}
public Timestamp getCdefine37_max()
{
	return cdefine37_max;
}
public void setCdefine37_max(Timestamp cdefine37_max)
{
	this.cdefine37_max = cdefine37_max;
}
public Long getIcheckids_min()
{
	return icheckids_min;
}
public void setIcheckids_min(Long icheckids_min)
{
	this.icheckids_min = icheckids_min;
}
public Long getIcheckids_max()
{
	return icheckids_max;
}
public void setIcheckids_max(Long icheckids_max)
{
	this.icheckids_max = icheckids_max;
}
public Long getIarrsid_min()
{
	return iarrsid_min;
}
public void setIarrsid_min(Long iarrsid_min)
{
	this.iarrsid_min = iarrsid_min;
}
public Long getIarrsid_max()
{
	return iarrsid_max;
}
public void setIarrsid_max(Long iarrsid_max)
{
	this.iarrsid_max = iarrsid_max;
}
public Long getIcheckidbaks_min()
{
	return icheckidbaks_min;
}
public void setIcheckidbaks_min(Long icheckidbaks_min)
{
	this.icheckidbaks_min = icheckidbaks_min;
}
public Long getIcheckidbaks_max()
{
	return icheckidbaks_max;
}
public void setIcheckidbaks_max(Long icheckidbaks_max)
{
	this.icheckidbaks_max = icheckidbaks_max;
}
public Long getIrejectids_min()
{
	return irejectids_min;
}
public void setIrejectids_min(Long irejectids_min)
{
	this.irejectids_min = irejectids_min;
}
public Long getIrejectids_max()
{
	return irejectids_max;
}
public void setIrejectids_max(Long irejectids_max)
{
	this.irejectids_max = irejectids_max;
}
public Timestamp getDcheckdate_min()
{
	return dcheckdate_min;
}
public void setDcheckdate_min(Timestamp dcheckdate_min)
{
	this.dcheckdate_min = dcheckdate_min;
}
public Timestamp getDcheckdate_max()
{
	return dcheckdate_max;
}
public void setDcheckdate_max(Timestamp dcheckdate_max)
{
	this.dcheckdate_max = dcheckdate_max;
}
public Double getIoritaxcost_min()
{
	return ioritaxcost_min;
}
public void setIoritaxcost_min(Double ioritaxcost_min)
{
	this.ioritaxcost_min = ioritaxcost_min;
}
public Double getIoritaxcost_max()
{
	return ioritaxcost_max;
}
public void setIoritaxcost_max(Double ioritaxcost_max)
{
	this.ioritaxcost_max = ioritaxcost_max;
}
public Double getIoricost_min()
{
	return ioricost_min;
}
public void setIoricost_min(Double ioricost_min)
{
	this.ioricost_min = ioricost_min;
}
public Double getIoricost_max()
{
	return ioricost_max;
}
public void setIoricost_max(Double ioricost_max)
{
	this.ioricost_max = ioricost_max;
}
public Double getIorimoney_min()
{
	return iorimoney_min;
}
public void setIorimoney_min(Double iorimoney_min)
{
	this.iorimoney_min = iorimoney_min;
}
public Double getIorimoney_max()
{
	return iorimoney_max;
}
public void setIorimoney_max(Double iorimoney_max)
{
	this.iorimoney_max = iorimoney_max;
}
public Double getIoritaxprice_min()
{
	return ioritaxprice_min;
}
public void setIoritaxprice_min(Double ioritaxprice_min)
{
	this.ioritaxprice_min = ioritaxprice_min;
}
public Double getIoritaxprice_max()
{
	return ioritaxprice_max;
}
public void setIoritaxprice_max(Double ioritaxprice_max)
{
	this.ioritaxprice_max = ioritaxprice_max;
}
public Double getIorisum_min()
{
	return iorisum_min;
}
public void setIorisum_min(Double iorisum_min)
{
	this.iorisum_min = iorisum_min;
}
public Double getIorisum_max()
{
	return iorisum_max;
}
public void setIorisum_max(Double iorisum_max)
{
	this.iorisum_max = iorisum_max;
}
public Double getItaxrate_min()
{
	return itaxrate_min;
}
public void setItaxrate_min(Double itaxrate_min)
{
	this.itaxrate_min = itaxrate_min;
}
public Double getItaxrate_max()
{
	return itaxrate_max;
}
public void setItaxrate_max(Double itaxrate_max)
{
	this.itaxrate_max = itaxrate_max;
}
public Double getItaxprice_min()
{
	return itaxprice_min;
}
public void setItaxprice_min(Double itaxprice_min)
{
	this.itaxprice_min = itaxprice_min;
}
public Double getItaxprice_max()
{
	return itaxprice_max;
}
public void setItaxprice_max(Double itaxprice_max)
{
	this.itaxprice_max = itaxprice_max;
}
public Double getIsum_min()
{
	return isum_min;
}
public void setIsum_min(Double isum_min)
{
	this.isum_min = isum_min;
}
public Double getIsum_max()
{
	return isum_max;
}
public void setIsum_max(Double isum_max)
{
	this.isum_max = isum_max;
}
public Long getCmassunit_min()
{
	return cmassunit_min;
}
public void setCmassunit_min(Long cmassunit_min)
{
	this.cmassunit_min = cmassunit_min;
}
public Long getCmassunit_max()
{
	return cmassunit_max;
}
public void setCmassunit_max(Long cmassunit_max)
{
	this.cmassunit_max = cmassunit_max;
}
public Double getImaterialfee_min()
{
	return imaterialfee_min;
}
public void setImaterialfee_min(Double imaterialfee_min)
{
	this.imaterialfee_min = imaterialfee_min;
}
public Double getImaterialfee_max()
{
	return imaterialfee_max;
}
public void setImaterialfee_max(Double imaterialfee_max)
{
	this.imaterialfee_max = imaterialfee_max;
}
public Double getIprocesscost_min()
{
	return iprocesscost_min;
}
public void setIprocesscost_min(Double iprocesscost_min)
{
	this.iprocesscost_min = iprocesscost_min;
}
public Double getIprocesscost_max()
{
	return iprocesscost_max;
}
public void setIprocesscost_max(Double iprocesscost_max)
{
	this.iprocesscost_max = iprocesscost_max;
}
public Double getIprocessfee_min()
{
	return iprocessfee_min;
}
public void setIprocessfee_min(Double iprocessfee_min)
{
	this.iprocessfee_min = iprocessfee_min;
}
public Double getIprocessfee_max()
{
	return iprocessfee_max;
}
public void setIprocessfee_max(Double iprocessfee_max)
{
	this.iprocessfee_max = iprocessfee_max;
}
public Timestamp getDmsdate_min()
{
	return dmsdate_min;
}
public void setDmsdate_min(Timestamp dmsdate_min)
{
	this.dmsdate_min = dmsdate_min;
}
public Timestamp getDmsdate_max()
{
	return dmsdate_max;
}
public void setDmsdate_max(Timestamp dmsdate_max)
{
	this.dmsdate_max = dmsdate_max;
}
public Double getIsmaterialfee_min()
{
	return ismaterialfee_min;
}
public void setIsmaterialfee_min(Double ismaterialfee_min)
{
	this.ismaterialfee_min = ismaterialfee_min;
}
public Double getIsmaterialfee_max()
{
	return ismaterialfee_max;
}
public void setIsmaterialfee_max(Double ismaterialfee_max)
{
	this.ismaterialfee_max = ismaterialfee_max;
}
public Double getIsprocessfee_min()
{
	return isprocessfee_min;
}
public void setIsprocessfee_min(Double isprocessfee_min)
{
	this.isprocessfee_min = isprocessfee_min;
}
public Double getIsprocessfee_max()
{
	return isprocessfee_max;
}
public void setIsprocessfee_max(Double isprocessfee_max)
{
	this.isprocessfee_max = isprocessfee_max;
}
public Long getIomodid_min()
{
	return iomodid_min;
}
public void setIomodid_min(Long iomodid_min)
{
	this.iomodid_min = iomodid_min;
}
public Long getIomodid_max()
{
	return iomodid_max;
}
public void setIomodid_max(Long iomodid_max)
{
	this.iomodid_max = iomodid_max;
}
public Long getIomomid_min()
{
	return iomomid_min;
}
public void setIomomid_min(Long iomomid_min)
{
	this.iomomid_min = iomomid_min;
}
public Long getIomomid_max()
{
	return iomomid_max;
}
public void setIomomid_max(Long iomomid_max)
{
	this.iomomid_max = iomomid_max;
}
public Long getImatsettlestate_min()
{
	return imatsettlestate_min;
}
public void setImatsettlestate_min(Long imatsettlestate_min)
{
	this.imatsettlestate_min = imatsettlestate_min;
}
public Long getImatsettlestate_max()
{
	return imatsettlestate_max;
}
public void setImatsettlestate_max(Long imatsettlestate_max)
{
	this.imatsettlestate_max = imatsettlestate_max;
}
public Long getIbillsettlecount_min()
{
	return ibillsettlecount_min;
}
public void setIbillsettlecount_min(Long ibillsettlecount_min)
{
	this.ibillsettlecount_min = ibillsettlecount_min;
}
public Long getIbillsettlecount_max()
{
	return ibillsettlecount_max;
}
public void setIbillsettlecount_max(Long ibillsettlecount_max)
{
	this.ibillsettlecount_max = ibillsettlecount_max;
}
public Long getIoritrackid_min()
{
	return ioritrackid_min;
}
public void setIoritrackid_min(Long ioritrackid_min)
{
	this.ioritrackid_min = ioritrackid_min;
}
public Long getIoritrackid_max()
{
	return ioritrackid_max;
}
public void setIoritrackid_max(Long ioritrackid_max)
{
	this.ioritrackid_max = ioritrackid_max;
}
public Timestamp getDbkeepdate_min()
{
	return dbkeepdate_min;
}
public void setDbkeepdate_min(Timestamp dbkeepdate_min)
{
	this.dbkeepdate_min = dbkeepdate_min;
}
public Timestamp getDbkeepdate_max()
{
	return dbkeepdate_max;
}
public void setDbkeepdate_max(Timestamp dbkeepdate_max)
{
	this.dbkeepdate_max = dbkeepdate_max;
}
public Double getIsumbillquantity_min()
{
	return isumbillquantity_min;
}
public void setIsumbillquantity_min(Double isumbillquantity_min)
{
	this.isumbillquantity_min = isumbillquantity_min;
}
public Double getIsumbillquantity_max()
{
	return isumbillquantity_max;
}
public void setIsumbillquantity_max(Double isumbillquantity_max)
{
	this.isumbillquantity_max = isumbillquantity_max;
}
public Double getIvmisettlequantity_min()
{
	return ivmisettlequantity_min;
}
public void setIvmisettlequantity_min(Double ivmisettlequantity_min)
{
	this.ivmisettlequantity_min = ivmisettlequantity_min;
}
public Double getIvmisettlequantity_max()
{
	return ivmisettlequantity_max;
}
public void setIvmisettlequantity_max(Double ivmisettlequantity_max)
{
	this.ivmisettlequantity_max = ivmisettlequantity_max;
}
public Double getIvmisettlenum_min()
{
	return ivmisettlenum_min;
}
public void setIvmisettlenum_min(Double ivmisettlenum_min)
{
	this.ivmisettlenum_min = ivmisettlenum_min;
}
public Double getIvmisettlenum_max()
{
	return ivmisettlenum_max;
}
public void setIvmisettlenum_max(Double ivmisettlenum_max)
{
	this.ivmisettlenum_max = ivmisettlenum_max;
}
public Long getIinvsncount_min()
{
	return iinvsncount_min;
}
public void setIinvsncount_min(Long iinvsncount_min)
{
	this.iinvsncount_min = iinvsncount_min;
}
public Long getIinvsncount_max()
{
	return iinvsncount_max;
}
public void setIinvsncount_max(Long iinvsncount_max)
{
	this.iinvsncount_max = iinvsncount_max;
}
public Double getImpcost_min()
{
	return impcost_min;
}
public void setImpcost_min(Double impcost_min)
{
	this.impcost_min = impcost_min;
}
public Double getImpcost_max()
{
	return impcost_max;
}
public void setImpcost_max(Double impcost_max)
{
	this.impcost_max = impcost_max;
}
public Long getIimosid_min()
{
	return iimosid_min;
}
public void setIimosid_min(Long iimosid_min)
{
	this.iimosid_min = iimosid_min;
}
public Long getIimosid_max()
{
	return iimosid_max;
}
public void setIimosid_max(Long iimosid_max)
{
	this.iimosid_max = iimosid_max;
}
public Long getIimbsid_min()
{
	return iimbsid_min;
}
public void setIimbsid_min(Long iimbsid_min)
{
	this.iimbsid_min = iimbsid_min;
}
public Long getIimbsid_max()
{
	return iimbsid_max;
}
public void setIimbsid_max(Long iimbsid_max)
{
	this.iimbsid_max = iimbsid_max;
}
public Double getIinvexchrate_min()
{
	return iinvexchrate_min;
}
public void setIinvexchrate_min(Double iinvexchrate_min)
{
	this.iinvexchrate_min = iinvexchrate_min;
}
public Double getIinvexchrate_max()
{
	return iinvexchrate_max;
}
public void setIinvexchrate_max(Double iinvexchrate_max)
{
	this.iinvexchrate_max = iinvexchrate_max;
}
public Long getIexpiratdatecalcu_min()
{
	return iexpiratdatecalcu_min;
}
public void setIexpiratdatecalcu_min(Long iexpiratdatecalcu_min)
{
	this.iexpiratdatecalcu_min = iexpiratdatecalcu_min;
}
public Long getIexpiratdatecalcu_max()
{
	return iexpiratdatecalcu_max;
}
public void setIexpiratdatecalcu_max(Long iexpiratdatecalcu_max)
{
	this.iexpiratdatecalcu_max = iexpiratdatecalcu_max;
}
public Timestamp getDexpirationdate_min()
{
	return dexpirationdate_min;
}
public void setDexpirationdate_min(Timestamp dexpirationdate_min)
{
	this.dexpirationdate_min = dexpirationdate_min;
}
public Timestamp getDexpirationdate_max()
{
	return dexpirationdate_max;
}
public void setDexpirationdate_max(Timestamp dexpirationdate_max)
{
	this.dexpirationdate_max = dexpirationdate_max;
}
public Double getIbondedsumqty_min()
{
	return ibondedsumqty_min;
}
public void setIbondedsumqty_min(Double ibondedsumqty_min)
{
	this.ibondedsumqty_min = ibondedsumqty_min;
}
public Double getIbondedsumqty_max()
{
	return ibondedsumqty_max;
}
public void setIbondedsumqty_max(Double ibondedsumqty_max)
{
	this.ibondedsumqty_max = ibondedsumqty_max;
}
public Long getIorderdid_min()
{
	return iorderdid_min;
}
public void setIorderdid_min(Long iorderdid_min)
{
	this.iorderdid_min = iorderdid_min;
}
public Long getIorderdid_max()
{
	return iorderdid_max;
}
public void setIorderdid_max(Long iorderdid_max)
{
	this.iorderdid_max = iorderdid_max;
}
public Long getIorderseq_min()
{
	return iorderseq_min;
}
public void setIorderseq_min(Long iorderseq_min)
{
	this.iorderseq_min = iorderseq_min;
}
public Long getIorderseq_max()
{
	return iorderseq_max;
}
public void setIorderseq_max(Long iorderseq_max)
{
	this.iorderseq_max = iorderseq_max;
}
public Long getIsoseq_min()
{
	return isoseq_min;
}
public void setIsoseq_min(Long isoseq_min)
{
	this.isoseq_min = isoseq_min;
}
public Long getIsoseq_max()
{
	return isoseq_max;
}
public void setIsoseq_max(Long isoseq_max)
{
	this.isoseq_max = isoseq_max;
}
public Double getCbatchproperty1_min()
{
	return cbatchproperty1_min;
}
public void setCbatchproperty1_min(Double cbatchproperty1_min)
{
	this.cbatchproperty1_min = cbatchproperty1_min;
}
public Double getCbatchproperty1_max()
{
	return cbatchproperty1_max;
}
public void setCbatchproperty1_max(Double cbatchproperty1_max)
{
	this.cbatchproperty1_max = cbatchproperty1_max;
}
public Double getCbatchproperty2_min()
{
	return cbatchproperty2_min;
}
public void setCbatchproperty2_min(Double cbatchproperty2_min)
{
	this.cbatchproperty2_min = cbatchproperty2_min;
}
public Double getCbatchproperty2_max()
{
	return cbatchproperty2_max;
}
public void setCbatchproperty2_max(Double cbatchproperty2_max)
{
	this.cbatchproperty2_max = cbatchproperty2_max;
}
public Double getCbatchproperty3_min()
{
	return cbatchproperty3_min;
}
public void setCbatchproperty3_min(Double cbatchproperty3_min)
{
	this.cbatchproperty3_min = cbatchproperty3_min;
}
public Double getCbatchproperty3_max()
{
	return cbatchproperty3_max;
}
public void setCbatchproperty3_max(Double cbatchproperty3_max)
{
	this.cbatchproperty3_max = cbatchproperty3_max;
}
public Double getCbatchproperty4_min()
{
	return cbatchproperty4_min;
}
public void setCbatchproperty4_min(Double cbatchproperty4_min)
{
	this.cbatchproperty4_min = cbatchproperty4_min;
}
public Double getCbatchproperty4_max()
{
	return cbatchproperty4_max;
}
public void setCbatchproperty4_max(Double cbatchproperty4_max)
{
	this.cbatchproperty4_max = cbatchproperty4_max;
}
public Double getCbatchproperty5_min()
{
	return cbatchproperty5_min;
}
public void setCbatchproperty5_min(Double cbatchproperty5_min)
{
	this.cbatchproperty5_min = cbatchproperty5_min;
}
public Double getCbatchproperty5_max()
{
	return cbatchproperty5_max;
}
public void setCbatchproperty5_max(Double cbatchproperty5_max)
{
	this.cbatchproperty5_max = cbatchproperty5_max;
}
public Timestamp getCbatchproperty10_min()
{
	return cbatchproperty10_min;
}
public void setCbatchproperty10_min(Timestamp cbatchproperty10_min)
{
	this.cbatchproperty10_min = cbatchproperty10_min;
}
public Timestamp getCbatchproperty10_max()
{
	return cbatchproperty10_max;
}
public void setCbatchproperty10_max(Timestamp cbatchproperty10_max)
{
	this.cbatchproperty10_max = cbatchproperty10_max;
}
public Double getIfaqty_min()
{
	return ifaqty_min;
}
public void setIfaqty_min(Double ifaqty_min)
{
	this.ifaqty_min = ifaqty_min;
}
public Double getIfaqty_max()
{
	return ifaqty_max;
}
public void setIfaqty_max(Double ifaqty_max)
{
	this.ifaqty_max = ifaqty_max;
}
public Double getIstax_min()
{
	return istax_min;
}
public void setIstax_min(Double istax_min)
{
	this.istax_min = istax_min;
}
public Double getIstax_max()
{
	return istax_max;
}
public void setIstax_max(Double istax_max)
{
	this.istax_max = istax_max;
}
public Long getIrowno_min()
{
	return irowno_min;
}
public void setIrowno_min(Long irowno_min)
{
	this.irowno_min = irowno_min;
}
public Long getIrowno_max()
{
	return irowno_max;
}
public void setIrowno_max(Long irowno_max)
{
	this.irowno_max = irowno_max;
}
public Double getIpreuseqty_min()
{
	return ipreuseqty_min;
}
public void setIpreuseqty_min(Double ipreuseqty_min)
{
	this.ipreuseqty_min = ipreuseqty_min;
}
public Double getIpreuseqty_max()
{
	return ipreuseqty_max;
}
public void setIpreuseqty_max(Double ipreuseqty_max)
{
	this.ipreuseqty_max = ipreuseqty_max;
}
public Double getIpreuseinum_min()
{
	return ipreuseinum_min;
}
public void setIpreuseinum_min(Double ipreuseinum_min)
{
	this.ipreuseinum_min = ipreuseinum_min;
}
public Double getIpreuseinum_max()
{
	return ipreuseinum_max;
}
public void setIpreuseinum_max(Double ipreuseinum_max)
{
	this.ipreuseinum_max = ipreuseinum_max;
}
public Long getIdebitids_min()
{
	return idebitids_min;
}
public void setIdebitids_min(Long idebitids_min)
{
	this.idebitids_min = idebitids_min;
}
public Long getIdebitids_max()
{
	return idebitids_max;
}
public void setIdebitids_max(Long idebitids_max)
{
	this.idebitids_max = idebitids_max;
}
public Double getOutcopiedquantity_min()
{
	return outcopiedquantity_min;
}
public void setOutcopiedquantity_min(Double outcopiedquantity_min)
{
	this.outcopiedquantity_min = outcopiedquantity_min;
}
public Double getOutcopiedquantity_max()
{
	return outcopiedquantity_max;
}
public void setOutcopiedquantity_max(Double outcopiedquantity_max)
{
	this.outcopiedquantity_max = outcopiedquantity_max;
}
public Long getIoldpartid_min()
{
	return ioldpartid_min;
}
public void setIoldpartid_min(Long ioldpartid_min)
{
	this.ioldpartid_min = ioldpartid_min;
}
public Long getIoldpartid_max()
{
	return ioldpartid_max;
}
public void setIoldpartid_max(Long ioldpartid_max)
{
	this.ioldpartid_max = ioldpartid_max;
}
public Double getFoldquantity_min()
{
	return foldquantity_min;
}
public void setFoldquantity_min(Double foldquantity_min)
{
	this.foldquantity_min = foldquantity_min;
}
public Double getFoldquantity_max()
{
	return foldquantity_max;
}
public void setFoldquantity_max(Double foldquantity_max)
{
	this.foldquantity_max = foldquantity_max;
}
public Long getImergecheckautoid_min()
{
	return imergecheckautoid_min;
}
public void setImergecheckautoid_min(Long imergecheckautoid_min)
{
	this.imergecheckautoid_min = imergecheckautoid_min;
}
public Long getImergecheckautoid_max()
{
	return imergecheckautoid_max;
}
public void setImergecheckautoid_max(Long imergecheckautoid_max)
{
	this.imergecheckautoid_max = imergecheckautoid_max;
}
public Long getIreworkmodetailsid_min()
{
	return ireworkmodetailsid_min;
}
public void setIreworkmodetailsid_min(Long ireworkmodetailsid_min)
{
	this.ireworkmodetailsid_min = ireworkmodetailsid_min;
}
public Long getIreworkmodetailsid_max()
{
	return ireworkmodetailsid_max;
}
public void setIreworkmodetailsid_max(Long ireworkmodetailsid_max)
{
	this.ireworkmodetailsid_max = ireworkmodetailsid_max;
}
public Long getIproducttype_min()
{
	return iproducttype_min;
}
public void setIproducttype_min(Long iproducttype_min)
{
	this.iproducttype_min = iproducttype_min;
}
public Long getIproducttype_max()
{
	return iproducttype_max;
}
public void setIproducttype_max(Long iproducttype_max)
{
	this.iproducttype_max = iproducttype_max;
}
public Long getImainmodetailsid_min()
{
	return imainmodetailsid_min;
}
public void setImainmodetailsid_min(Long imainmodetailsid_min)
{
	this.imainmodetailsid_min = imainmodetailsid_min;
}
public Long getImainmodetailsid_max()
{
	return imainmodetailsid_max;
}
public void setImainmodetailsid_max(Long imainmodetailsid_max)
{
	this.imainmodetailsid_max = imainmodetailsid_max;
}
public Double getIsharematerialfee_min()
{
	return isharematerialfee_min;
}
public void setIsharematerialfee_min(Double isharematerialfee_min)
{
	this.isharematerialfee_min = isharematerialfee_min;
}
public Double getIsharematerialfee_max()
{
	return isharematerialfee_max;
}
public void setIsharematerialfee_max(Double isharematerialfee_max)
{
	this.isharematerialfee_max = isharematerialfee_max;
}
public Long getBgift_min()
{
	return bgift_min;
}
public void setBgift_min(Long bgift_min)
{
	this.bgift_min = bgift_min;
}
public Long getBgift_max()
{
	return bgift_max;
}
public void setBgift_max(Long bgift_max)
{
	this.bgift_max = bgift_max;
}
public Long getIposflag_min()
{
	return iposflag_min;
}
public void setIposflag_min(Long iposflag_min)
{
	this.iposflag_min = iposflag_min;
}
public Long getIposflag_max()
{
	return iposflag_max;
}
public void setIposflag_max(Long iposflag_max)
{
	this.iposflag_max = iposflag_max;
}

}