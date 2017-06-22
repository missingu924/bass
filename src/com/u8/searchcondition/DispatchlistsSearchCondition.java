package com.u8.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class DispatchlistsSearchCondition extends BaseSearchCondition
{
private Long dlid_min;
private Long dlid_max;
private Long icorid_min;
private Long icorid_max;
private Double iquantity_min;
private Double iquantity_max;
private Double inum_min;
private Double inum_max;
private Double iquotedprice_min;
private Double iquotedprice_max;
private Double iunitprice_min;
private Double iunitprice_max;
private Double itaxunitprice_min;
private Double itaxunitprice_max;
private Double imoney_min;
private Double imoney_max;
private Double itax_min;
private Double itax_max;
private Double isum_min;
private Double isum_max;
private Double idiscount_min;
private Double idiscount_max;
private Double inatunitprice_min;
private Double inatunitprice_max;
private Double inatmoney_min;
private Double inatmoney_max;
private Double inattax_min;
private Double inattax_max;
private Double inatsum_min;
private Double inatsum_max;
private Double inatdiscount_min;
private Double inatdiscount_max;
private Double isettlenum_min;
private Double isettlenum_max;
private Double isettlequantity_min;
private Double isettlequantity_max;
private Long ibatch_min;
private Long ibatch_max;
private Timestamp dvdate_min;
private Timestamp dvdate_max;
private Double tbquantity_min;
private Double tbquantity_max;
private Double tbnum_min;
private Double tbnum_max;
private Long isosid_min;
private Long isosid_max;
private Long idlsid_min;
private Long idlsid_max;
private Double kl_min;
private Double kl_max;
private Double kl2_min;
private Double kl2_max;
private Double itaxrate_min;
private Double itaxrate_max;
private Double cdefine26_min;
private Double cdefine26_max;
private Double cdefine27_min;
private Double cdefine27_max;
private Double foutquantity_min;
private Double foutquantity_max;
private Double foutnum_min;
private Double foutnum_max;
private Double fsalecost_min;
private Double fsalecost_max;
private Double fsaleprice_min;
private Double fsaleprice_max;
private Double iinvexchrate_min;
private Double iinvexchrate_max;
private Double iretquantity_min;
private Double iretquantity_max;
private Double fensettlequan_min;
private Double fensettlequan_max;
private Double fensettlesum_min;
private Double fensettlesum_max;
private Double isettleprice_min;
private Double isettleprice_max;
private Long cdefine34_min;
private Long cdefine34_max;
private Long cdefine35_min;
private Long cdefine35_max;
private Timestamp cdefine36_min;
private Timestamp cdefine36_max;
private Timestamp cdefine37_min;
private Timestamp cdefine37_max;
private Timestamp dmdate_min;
private Timestamp dmdate_max;
private Long ippartseqid_min;
private Long ippartseqid_max;
private Long ippartid_min;
private Long ippartid_max;
private Double ippartqty_min;
private Double ippartqty_max;
private Long imassdate_min;
private Long imassdate_max;
private Long cmassunit_min;
private Long cmassunit_max;
private Double iqaquantity_min;
private Double iqaquantity_max;
private Double iqanum_min;
private Double iqanum_max;
private Double fsumsignquantity_min;
private Double fsumsignquantity_max;
private Double fsumsignnum_min;
private Double fsumsignnum_max;
private Long iorderrowno_min;
private Long iorderrowno_max;
private Double fcusminprice_min;
private Double fcusminprice_max;
private Double icostquantity_min;
private Double icostquantity_max;
private Double icostsum_min;
private Double icostsum_max;
private Double iexchsum_min;
private Double iexchsum_max;
private Double imoneysum_min;
private Double imoneysum_max;
private Long irowno_min;
private Long irowno_max;
private Double frettbquantity_min;
private Double frettbquantity_max;
private Double fretsum_min;
private Double fretsum_max;
private Long iexpiratdatecalcu_min;
private Long iexpiratdatecalcu_max;
private Timestamp dexpirationdate_min;
private Timestamp dexpirationdate_max;
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
private Double dblpreexchmomey_min;
private Double dblpreexchmomey_max;
private Double dblpremomey_min;
private Double dblpremomey_max;
private Long idemandtype_min;
private Long idemandtype_max;
private Long idemandseq_min;
private Long idemandseq_max;
private Long iinvsncount_min;
private Long iinvsncount_max;
private Double flossrate_min;
private Double flossrate_max;
private Double frlossqty_min;
private Double frlossqty_max;
private Double fulossqty_min;
private Double fulossqty_max;
private Long isettletype_min;
private Long isettletype_max;
private Timestamp dlossdate_min;
private Timestamp dlossdate_max;
private Timestamp dlosstime_min;
private Timestamp dlosstime_max;
private Long icoridlsid_min;
private Long icoridlsid_max;
private Double fretoutqty_min;
private Double fretoutqty_max;
private Double fveribillqty_min;
private Double fveribillqty_max;
private Double fveribillsum_min;
private Double fveribillsum_max;
private Double fveriretqty_min;
private Double fveriretqty_max;
private Double fveriretsum_min;
private Double fveriretsum_max;
private Double flastsettleqty_min;
private Double flastsettleqty_max;
private Double flastsettlesum_min;
private Double flastsettlesum_max;
private Double fretqtywkp_min;
private Double fretqtywkp_max;
private Double fretqtyykp_min;
private Double fretqtyykp_max;
private Double frettbqtyykp_min;
private Double frettbqtyykp_max;
private Double fretsumykp_min;
private Double fretsumykp_max;
private Timestamp dkeepdate_min;
private Timestamp dkeepdate_max;
private Long isaleoutid_min;
private Long isaleoutid_max;
private Double fxjquantity_min;
private Double fxjquantity_max;
private Double fxjnum_min;
private Double fxjnum_max;
private Double fchildqty_min;
private Double fchildqty_max;
private Double fchildrate_min;
private Double fchildrate_max;
private Double fappretwkpqty_min;
private Double fappretwkpqty_max;
private Double fappretwkpsum_min;
private Double fappretwkpsum_max;
private Double fappretykpqty_min;
private Double fappretykpqty_max;
private Double fappretykpsum_min;
private Double fappretykpsum_max;
private Double fappretwkptbqty_min;
private Double fappretwkptbqty_max;
private Double fappretykptbqty_min;
private Double fappretykptbqty_max;
private Long irtnappid_min;
private Long irtnappid_max;
public Long getDlid_min()
{
	return dlid_min;
}
public void setDlid_min(Long dlid_min)
{
	this.dlid_min = dlid_min;
}
public Long getDlid_max()
{
	return dlid_max;
}
public void setDlid_max(Long dlid_max)
{
	this.dlid_max = dlid_max;
}
public Long getIcorid_min()
{
	return icorid_min;
}
public void setIcorid_min(Long icorid_min)
{
	this.icorid_min = icorid_min;
}
public Long getIcorid_max()
{
	return icorid_max;
}
public void setIcorid_max(Long icorid_max)
{
	this.icorid_max = icorid_max;
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
public Double getIquotedprice_min()
{
	return iquotedprice_min;
}
public void setIquotedprice_min(Double iquotedprice_min)
{
	this.iquotedprice_min = iquotedprice_min;
}
public Double getIquotedprice_max()
{
	return iquotedprice_max;
}
public void setIquotedprice_max(Double iquotedprice_max)
{
	this.iquotedprice_max = iquotedprice_max;
}
public Double getIunitprice_min()
{
	return iunitprice_min;
}
public void setIunitprice_min(Double iunitprice_min)
{
	this.iunitprice_min = iunitprice_min;
}
public Double getIunitprice_max()
{
	return iunitprice_max;
}
public void setIunitprice_max(Double iunitprice_max)
{
	this.iunitprice_max = iunitprice_max;
}
public Double getItaxunitprice_min()
{
	return itaxunitprice_min;
}
public void setItaxunitprice_min(Double itaxunitprice_min)
{
	this.itaxunitprice_min = itaxunitprice_min;
}
public Double getItaxunitprice_max()
{
	return itaxunitprice_max;
}
public void setItaxunitprice_max(Double itaxunitprice_max)
{
	this.itaxunitprice_max = itaxunitprice_max;
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
public Double getIdiscount_min()
{
	return idiscount_min;
}
public void setIdiscount_min(Double idiscount_min)
{
	this.idiscount_min = idiscount_min;
}
public Double getIdiscount_max()
{
	return idiscount_max;
}
public void setIdiscount_max(Double idiscount_max)
{
	this.idiscount_max = idiscount_max;
}
public Double getInatunitprice_min()
{
	return inatunitprice_min;
}
public void setInatunitprice_min(Double inatunitprice_min)
{
	this.inatunitprice_min = inatunitprice_min;
}
public Double getInatunitprice_max()
{
	return inatunitprice_max;
}
public void setInatunitprice_max(Double inatunitprice_max)
{
	this.inatunitprice_max = inatunitprice_max;
}
public Double getInatmoney_min()
{
	return inatmoney_min;
}
public void setInatmoney_min(Double inatmoney_min)
{
	this.inatmoney_min = inatmoney_min;
}
public Double getInatmoney_max()
{
	return inatmoney_max;
}
public void setInatmoney_max(Double inatmoney_max)
{
	this.inatmoney_max = inatmoney_max;
}
public Double getInattax_min()
{
	return inattax_min;
}
public void setInattax_min(Double inattax_min)
{
	this.inattax_min = inattax_min;
}
public Double getInattax_max()
{
	return inattax_max;
}
public void setInattax_max(Double inattax_max)
{
	this.inattax_max = inattax_max;
}
public Double getInatsum_min()
{
	return inatsum_min;
}
public void setInatsum_min(Double inatsum_min)
{
	this.inatsum_min = inatsum_min;
}
public Double getInatsum_max()
{
	return inatsum_max;
}
public void setInatsum_max(Double inatsum_max)
{
	this.inatsum_max = inatsum_max;
}
public Double getInatdiscount_min()
{
	return inatdiscount_min;
}
public void setInatdiscount_min(Double inatdiscount_min)
{
	this.inatdiscount_min = inatdiscount_min;
}
public Double getInatdiscount_max()
{
	return inatdiscount_max;
}
public void setInatdiscount_max(Double inatdiscount_max)
{
	this.inatdiscount_max = inatdiscount_max;
}
public Double getIsettlenum_min()
{
	return isettlenum_min;
}
public void setIsettlenum_min(Double isettlenum_min)
{
	this.isettlenum_min = isettlenum_min;
}
public Double getIsettlenum_max()
{
	return isettlenum_max;
}
public void setIsettlenum_max(Double isettlenum_max)
{
	this.isettlenum_max = isettlenum_max;
}
public Double getIsettlequantity_min()
{
	return isettlequantity_min;
}
public void setIsettlequantity_min(Double isettlequantity_min)
{
	this.isettlequantity_min = isettlequantity_min;
}
public Double getIsettlequantity_max()
{
	return isettlequantity_max;
}
public void setIsettlequantity_max(Double isettlequantity_max)
{
	this.isettlequantity_max = isettlequantity_max;
}
public Long getIbatch_min()
{
	return ibatch_min;
}
public void setIbatch_min(Long ibatch_min)
{
	this.ibatch_min = ibatch_min;
}
public Long getIbatch_max()
{
	return ibatch_max;
}
public void setIbatch_max(Long ibatch_max)
{
	this.ibatch_max = ibatch_max;
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
public Double getTbquantity_min()
{
	return tbquantity_min;
}
public void setTbquantity_min(Double tbquantity_min)
{
	this.tbquantity_min = tbquantity_min;
}
public Double getTbquantity_max()
{
	return tbquantity_max;
}
public void setTbquantity_max(Double tbquantity_max)
{
	this.tbquantity_max = tbquantity_max;
}
public Double getTbnum_min()
{
	return tbnum_min;
}
public void setTbnum_min(Double tbnum_min)
{
	this.tbnum_min = tbnum_min;
}
public Double getTbnum_max()
{
	return tbnum_max;
}
public void setTbnum_max(Double tbnum_max)
{
	this.tbnum_max = tbnum_max;
}
public Long getIsosid_min()
{
	return isosid_min;
}
public void setIsosid_min(Long isosid_min)
{
	this.isosid_min = isosid_min;
}
public Long getIsosid_max()
{
	return isosid_max;
}
public void setIsosid_max(Long isosid_max)
{
	this.isosid_max = isosid_max;
}
public Long getIdlsid_min()
{
	return idlsid_min;
}
public void setIdlsid_min(Long idlsid_min)
{
	this.idlsid_min = idlsid_min;
}
public Long getIdlsid_max()
{
	return idlsid_max;
}
public void setIdlsid_max(Long idlsid_max)
{
	this.idlsid_max = idlsid_max;
}
public Double getKl_min()
{
	return kl_min;
}
public void setKl_min(Double kl_min)
{
	this.kl_min = kl_min;
}
public Double getKl_max()
{
	return kl_max;
}
public void setKl_max(Double kl_max)
{
	this.kl_max = kl_max;
}
public Double getKl2_min()
{
	return kl2_min;
}
public void setKl2_min(Double kl2_min)
{
	this.kl2_min = kl2_min;
}
public Double getKl2_max()
{
	return kl2_max;
}
public void setKl2_max(Double kl2_max)
{
	this.kl2_max = kl2_max;
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
public Double getFoutquantity_min()
{
	return foutquantity_min;
}
public void setFoutquantity_min(Double foutquantity_min)
{
	this.foutquantity_min = foutquantity_min;
}
public Double getFoutquantity_max()
{
	return foutquantity_max;
}
public void setFoutquantity_max(Double foutquantity_max)
{
	this.foutquantity_max = foutquantity_max;
}
public Double getFoutnum_min()
{
	return foutnum_min;
}
public void setFoutnum_min(Double foutnum_min)
{
	this.foutnum_min = foutnum_min;
}
public Double getFoutnum_max()
{
	return foutnum_max;
}
public void setFoutnum_max(Double foutnum_max)
{
	this.foutnum_max = foutnum_max;
}
public Double getFsalecost_min()
{
	return fsalecost_min;
}
public void setFsalecost_min(Double fsalecost_min)
{
	this.fsalecost_min = fsalecost_min;
}
public Double getFsalecost_max()
{
	return fsalecost_max;
}
public void setFsalecost_max(Double fsalecost_max)
{
	this.fsalecost_max = fsalecost_max;
}
public Double getFsaleprice_min()
{
	return fsaleprice_min;
}
public void setFsaleprice_min(Double fsaleprice_min)
{
	this.fsaleprice_min = fsaleprice_min;
}
public Double getFsaleprice_max()
{
	return fsaleprice_max;
}
public void setFsaleprice_max(Double fsaleprice_max)
{
	this.fsaleprice_max = fsaleprice_max;
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
public Double getIretquantity_min()
{
	return iretquantity_min;
}
public void setIretquantity_min(Double iretquantity_min)
{
	this.iretquantity_min = iretquantity_min;
}
public Double getIretquantity_max()
{
	return iretquantity_max;
}
public void setIretquantity_max(Double iretquantity_max)
{
	this.iretquantity_max = iretquantity_max;
}
public Double getFensettlequan_min()
{
	return fensettlequan_min;
}
public void setFensettlequan_min(Double fensettlequan_min)
{
	this.fensettlequan_min = fensettlequan_min;
}
public Double getFensettlequan_max()
{
	return fensettlequan_max;
}
public void setFensettlequan_max(Double fensettlequan_max)
{
	this.fensettlequan_max = fensettlequan_max;
}
public Double getFensettlesum_min()
{
	return fensettlesum_min;
}
public void setFensettlesum_min(Double fensettlesum_min)
{
	this.fensettlesum_min = fensettlesum_min;
}
public Double getFensettlesum_max()
{
	return fensettlesum_max;
}
public void setFensettlesum_max(Double fensettlesum_max)
{
	this.fensettlesum_max = fensettlesum_max;
}
public Double getIsettleprice_min()
{
	return isettleprice_min;
}
public void setIsettleprice_min(Double isettleprice_min)
{
	this.isettleprice_min = isettleprice_min;
}
public Double getIsettleprice_max()
{
	return isettleprice_max;
}
public void setIsettleprice_max(Double isettleprice_max)
{
	this.isettleprice_max = isettleprice_max;
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
public Timestamp getDmdate_min()
{
	return dmdate_min;
}
public void setDmdate_min(Timestamp dmdate_min)
{
	this.dmdate_min = dmdate_min;
}
public Timestamp getDmdate_max()
{
	return dmdate_max;
}
public void setDmdate_max(Timestamp dmdate_max)
{
	this.dmdate_max = dmdate_max;
}
public Long getIppartseqid_min()
{
	return ippartseqid_min;
}
public void setIppartseqid_min(Long ippartseqid_min)
{
	this.ippartseqid_min = ippartseqid_min;
}
public Long getIppartseqid_max()
{
	return ippartseqid_max;
}
public void setIppartseqid_max(Long ippartseqid_max)
{
	this.ippartseqid_max = ippartseqid_max;
}
public Long getIppartid_min()
{
	return ippartid_min;
}
public void setIppartid_min(Long ippartid_min)
{
	this.ippartid_min = ippartid_min;
}
public Long getIppartid_max()
{
	return ippartid_max;
}
public void setIppartid_max(Long ippartid_max)
{
	this.ippartid_max = ippartid_max;
}
public Double getIppartqty_min()
{
	return ippartqty_min;
}
public void setIppartqty_min(Double ippartqty_min)
{
	this.ippartqty_min = ippartqty_min;
}
public Double getIppartqty_max()
{
	return ippartqty_max;
}
public void setIppartqty_max(Double ippartqty_max)
{
	this.ippartqty_max = ippartqty_max;
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
public Double getIqaquantity_min()
{
	return iqaquantity_min;
}
public void setIqaquantity_min(Double iqaquantity_min)
{
	this.iqaquantity_min = iqaquantity_min;
}
public Double getIqaquantity_max()
{
	return iqaquantity_max;
}
public void setIqaquantity_max(Double iqaquantity_max)
{
	this.iqaquantity_max = iqaquantity_max;
}
public Double getIqanum_min()
{
	return iqanum_min;
}
public void setIqanum_min(Double iqanum_min)
{
	this.iqanum_min = iqanum_min;
}
public Double getIqanum_max()
{
	return iqanum_max;
}
public void setIqanum_max(Double iqanum_max)
{
	this.iqanum_max = iqanum_max;
}
public Double getFsumsignquantity_min()
{
	return fsumsignquantity_min;
}
public void setFsumsignquantity_min(Double fsumsignquantity_min)
{
	this.fsumsignquantity_min = fsumsignquantity_min;
}
public Double getFsumsignquantity_max()
{
	return fsumsignquantity_max;
}
public void setFsumsignquantity_max(Double fsumsignquantity_max)
{
	this.fsumsignquantity_max = fsumsignquantity_max;
}
public Double getFsumsignnum_min()
{
	return fsumsignnum_min;
}
public void setFsumsignnum_min(Double fsumsignnum_min)
{
	this.fsumsignnum_min = fsumsignnum_min;
}
public Double getFsumsignnum_max()
{
	return fsumsignnum_max;
}
public void setFsumsignnum_max(Double fsumsignnum_max)
{
	this.fsumsignnum_max = fsumsignnum_max;
}
public Long getIorderrowno_min()
{
	return iorderrowno_min;
}
public void setIorderrowno_min(Long iorderrowno_min)
{
	this.iorderrowno_min = iorderrowno_min;
}
public Long getIorderrowno_max()
{
	return iorderrowno_max;
}
public void setIorderrowno_max(Long iorderrowno_max)
{
	this.iorderrowno_max = iorderrowno_max;
}
public Double getFcusminprice_min()
{
	return fcusminprice_min;
}
public void setFcusminprice_min(Double fcusminprice_min)
{
	this.fcusminprice_min = fcusminprice_min;
}
public Double getFcusminprice_max()
{
	return fcusminprice_max;
}
public void setFcusminprice_max(Double fcusminprice_max)
{
	this.fcusminprice_max = fcusminprice_max;
}
public Double getIcostquantity_min()
{
	return icostquantity_min;
}
public void setIcostquantity_min(Double icostquantity_min)
{
	this.icostquantity_min = icostquantity_min;
}
public Double getIcostquantity_max()
{
	return icostquantity_max;
}
public void setIcostquantity_max(Double icostquantity_max)
{
	this.icostquantity_max = icostquantity_max;
}
public Double getIcostsum_min()
{
	return icostsum_min;
}
public void setIcostsum_min(Double icostsum_min)
{
	this.icostsum_min = icostsum_min;
}
public Double getIcostsum_max()
{
	return icostsum_max;
}
public void setIcostsum_max(Double icostsum_max)
{
	this.icostsum_max = icostsum_max;
}
public Double getIexchsum_min()
{
	return iexchsum_min;
}
public void setIexchsum_min(Double iexchsum_min)
{
	this.iexchsum_min = iexchsum_min;
}
public Double getIexchsum_max()
{
	return iexchsum_max;
}
public void setIexchsum_max(Double iexchsum_max)
{
	this.iexchsum_max = iexchsum_max;
}
public Double getImoneysum_min()
{
	return imoneysum_min;
}
public void setImoneysum_min(Double imoneysum_min)
{
	this.imoneysum_min = imoneysum_min;
}
public Double getImoneysum_max()
{
	return imoneysum_max;
}
public void setImoneysum_max(Double imoneysum_max)
{
	this.imoneysum_max = imoneysum_max;
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
public Double getFrettbquantity_min()
{
	return frettbquantity_min;
}
public void setFrettbquantity_min(Double frettbquantity_min)
{
	this.frettbquantity_min = frettbquantity_min;
}
public Double getFrettbquantity_max()
{
	return frettbquantity_max;
}
public void setFrettbquantity_max(Double frettbquantity_max)
{
	this.frettbquantity_max = frettbquantity_max;
}
public Double getFretsum_min()
{
	return fretsum_min;
}
public void setFretsum_min(Double fretsum_min)
{
	this.fretsum_min = fretsum_min;
}
public Double getFretsum_max()
{
	return fretsum_max;
}
public void setFretsum_max(Double fretsum_max)
{
	this.fretsum_max = fretsum_max;
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
public Double getDblpreexchmomey_min()
{
	return dblpreexchmomey_min;
}
public void setDblpreexchmomey_min(Double dblpreexchmomey_min)
{
	this.dblpreexchmomey_min = dblpreexchmomey_min;
}
public Double getDblpreexchmomey_max()
{
	return dblpreexchmomey_max;
}
public void setDblpreexchmomey_max(Double dblpreexchmomey_max)
{
	this.dblpreexchmomey_max = dblpreexchmomey_max;
}
public Double getDblpremomey_min()
{
	return dblpremomey_min;
}
public void setDblpremomey_min(Double dblpremomey_min)
{
	this.dblpremomey_min = dblpremomey_min;
}
public Double getDblpremomey_max()
{
	return dblpremomey_max;
}
public void setDblpremomey_max(Double dblpremomey_max)
{
	this.dblpremomey_max = dblpremomey_max;
}
public Long getIdemandtype_min()
{
	return idemandtype_min;
}
public void setIdemandtype_min(Long idemandtype_min)
{
	this.idemandtype_min = idemandtype_min;
}
public Long getIdemandtype_max()
{
	return idemandtype_max;
}
public void setIdemandtype_max(Long idemandtype_max)
{
	this.idemandtype_max = idemandtype_max;
}
public Long getIdemandseq_min()
{
	return idemandseq_min;
}
public void setIdemandseq_min(Long idemandseq_min)
{
	this.idemandseq_min = idemandseq_min;
}
public Long getIdemandseq_max()
{
	return idemandseq_max;
}
public void setIdemandseq_max(Long idemandseq_max)
{
	this.idemandseq_max = idemandseq_max;
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
public Double getFlossrate_min()
{
	return flossrate_min;
}
public void setFlossrate_min(Double flossrate_min)
{
	this.flossrate_min = flossrate_min;
}
public Double getFlossrate_max()
{
	return flossrate_max;
}
public void setFlossrate_max(Double flossrate_max)
{
	this.flossrate_max = flossrate_max;
}
public Double getFrlossqty_min()
{
	return frlossqty_min;
}
public void setFrlossqty_min(Double frlossqty_min)
{
	this.frlossqty_min = frlossqty_min;
}
public Double getFrlossqty_max()
{
	return frlossqty_max;
}
public void setFrlossqty_max(Double frlossqty_max)
{
	this.frlossqty_max = frlossqty_max;
}
public Double getFulossqty_min()
{
	return fulossqty_min;
}
public void setFulossqty_min(Double fulossqty_min)
{
	this.fulossqty_min = fulossqty_min;
}
public Double getFulossqty_max()
{
	return fulossqty_max;
}
public void setFulossqty_max(Double fulossqty_max)
{
	this.fulossqty_max = fulossqty_max;
}
public Long getIsettletype_min()
{
	return isettletype_min;
}
public void setIsettletype_min(Long isettletype_min)
{
	this.isettletype_min = isettletype_min;
}
public Long getIsettletype_max()
{
	return isettletype_max;
}
public void setIsettletype_max(Long isettletype_max)
{
	this.isettletype_max = isettletype_max;
}
public Timestamp getDlossdate_min()
{
	return dlossdate_min;
}
public void setDlossdate_min(Timestamp dlossdate_min)
{
	this.dlossdate_min = dlossdate_min;
}
public Timestamp getDlossdate_max()
{
	return dlossdate_max;
}
public void setDlossdate_max(Timestamp dlossdate_max)
{
	this.dlossdate_max = dlossdate_max;
}
public Timestamp getDlosstime_min()
{
	return dlosstime_min;
}
public void setDlosstime_min(Timestamp dlosstime_min)
{
	this.dlosstime_min = dlosstime_min;
}
public Timestamp getDlosstime_max()
{
	return dlosstime_max;
}
public void setDlosstime_max(Timestamp dlosstime_max)
{
	this.dlosstime_max = dlosstime_max;
}
public Long getIcoridlsid_min()
{
	return icoridlsid_min;
}
public void setIcoridlsid_min(Long icoridlsid_min)
{
	this.icoridlsid_min = icoridlsid_min;
}
public Long getIcoridlsid_max()
{
	return icoridlsid_max;
}
public void setIcoridlsid_max(Long icoridlsid_max)
{
	this.icoridlsid_max = icoridlsid_max;
}
public Double getFretoutqty_min()
{
	return fretoutqty_min;
}
public void setFretoutqty_min(Double fretoutqty_min)
{
	this.fretoutqty_min = fretoutqty_min;
}
public Double getFretoutqty_max()
{
	return fretoutqty_max;
}
public void setFretoutqty_max(Double fretoutqty_max)
{
	this.fretoutqty_max = fretoutqty_max;
}
public Double getFveribillqty_min()
{
	return fveribillqty_min;
}
public void setFveribillqty_min(Double fveribillqty_min)
{
	this.fveribillqty_min = fveribillqty_min;
}
public Double getFveribillqty_max()
{
	return fveribillqty_max;
}
public void setFveribillqty_max(Double fveribillqty_max)
{
	this.fveribillqty_max = fveribillqty_max;
}
public Double getFveribillsum_min()
{
	return fveribillsum_min;
}
public void setFveribillsum_min(Double fveribillsum_min)
{
	this.fveribillsum_min = fveribillsum_min;
}
public Double getFveribillsum_max()
{
	return fveribillsum_max;
}
public void setFveribillsum_max(Double fveribillsum_max)
{
	this.fveribillsum_max = fveribillsum_max;
}
public Double getFveriretqty_min()
{
	return fveriretqty_min;
}
public void setFveriretqty_min(Double fveriretqty_min)
{
	this.fveriretqty_min = fveriretqty_min;
}
public Double getFveriretqty_max()
{
	return fveriretqty_max;
}
public void setFveriretqty_max(Double fveriretqty_max)
{
	this.fveriretqty_max = fveriretqty_max;
}
public Double getFveriretsum_min()
{
	return fveriretsum_min;
}
public void setFveriretsum_min(Double fveriretsum_min)
{
	this.fveriretsum_min = fveriretsum_min;
}
public Double getFveriretsum_max()
{
	return fveriretsum_max;
}
public void setFveriretsum_max(Double fveriretsum_max)
{
	this.fveriretsum_max = fveriretsum_max;
}
public Double getFlastsettleqty_min()
{
	return flastsettleqty_min;
}
public void setFlastsettleqty_min(Double flastsettleqty_min)
{
	this.flastsettleqty_min = flastsettleqty_min;
}
public Double getFlastsettleqty_max()
{
	return flastsettleqty_max;
}
public void setFlastsettleqty_max(Double flastsettleqty_max)
{
	this.flastsettleqty_max = flastsettleqty_max;
}
public Double getFlastsettlesum_min()
{
	return flastsettlesum_min;
}
public void setFlastsettlesum_min(Double flastsettlesum_min)
{
	this.flastsettlesum_min = flastsettlesum_min;
}
public Double getFlastsettlesum_max()
{
	return flastsettlesum_max;
}
public void setFlastsettlesum_max(Double flastsettlesum_max)
{
	this.flastsettlesum_max = flastsettlesum_max;
}
public Double getFretqtywkp_min()
{
	return fretqtywkp_min;
}
public void setFretqtywkp_min(Double fretqtywkp_min)
{
	this.fretqtywkp_min = fretqtywkp_min;
}
public Double getFretqtywkp_max()
{
	return fretqtywkp_max;
}
public void setFretqtywkp_max(Double fretqtywkp_max)
{
	this.fretqtywkp_max = fretqtywkp_max;
}
public Double getFretqtyykp_min()
{
	return fretqtyykp_min;
}
public void setFretqtyykp_min(Double fretqtyykp_min)
{
	this.fretqtyykp_min = fretqtyykp_min;
}
public Double getFretqtyykp_max()
{
	return fretqtyykp_max;
}
public void setFretqtyykp_max(Double fretqtyykp_max)
{
	this.fretqtyykp_max = fretqtyykp_max;
}
public Double getFrettbqtyykp_min()
{
	return frettbqtyykp_min;
}
public void setFrettbqtyykp_min(Double frettbqtyykp_min)
{
	this.frettbqtyykp_min = frettbqtyykp_min;
}
public Double getFrettbqtyykp_max()
{
	return frettbqtyykp_max;
}
public void setFrettbqtyykp_max(Double frettbqtyykp_max)
{
	this.frettbqtyykp_max = frettbqtyykp_max;
}
public Double getFretsumykp_min()
{
	return fretsumykp_min;
}
public void setFretsumykp_min(Double fretsumykp_min)
{
	this.fretsumykp_min = fretsumykp_min;
}
public Double getFretsumykp_max()
{
	return fretsumykp_max;
}
public void setFretsumykp_max(Double fretsumykp_max)
{
	this.fretsumykp_max = fretsumykp_max;
}
public Timestamp getDkeepdate_min()
{
	return dkeepdate_min;
}
public void setDkeepdate_min(Timestamp dkeepdate_min)
{
	this.dkeepdate_min = dkeepdate_min;
}
public Timestamp getDkeepdate_max()
{
	return dkeepdate_max;
}
public void setDkeepdate_max(Timestamp dkeepdate_max)
{
	this.dkeepdate_max = dkeepdate_max;
}
public Long getIsaleoutid_min()
{
	return isaleoutid_min;
}
public void setIsaleoutid_min(Long isaleoutid_min)
{
	this.isaleoutid_min = isaleoutid_min;
}
public Long getIsaleoutid_max()
{
	return isaleoutid_max;
}
public void setIsaleoutid_max(Long isaleoutid_max)
{
	this.isaleoutid_max = isaleoutid_max;
}
public Double getFxjquantity_min()
{
	return fxjquantity_min;
}
public void setFxjquantity_min(Double fxjquantity_min)
{
	this.fxjquantity_min = fxjquantity_min;
}
public Double getFxjquantity_max()
{
	return fxjquantity_max;
}
public void setFxjquantity_max(Double fxjquantity_max)
{
	this.fxjquantity_max = fxjquantity_max;
}
public Double getFxjnum_min()
{
	return fxjnum_min;
}
public void setFxjnum_min(Double fxjnum_min)
{
	this.fxjnum_min = fxjnum_min;
}
public Double getFxjnum_max()
{
	return fxjnum_max;
}
public void setFxjnum_max(Double fxjnum_max)
{
	this.fxjnum_max = fxjnum_max;
}
public Double getFchildqty_min()
{
	return fchildqty_min;
}
public void setFchildqty_min(Double fchildqty_min)
{
	this.fchildqty_min = fchildqty_min;
}
public Double getFchildqty_max()
{
	return fchildqty_max;
}
public void setFchildqty_max(Double fchildqty_max)
{
	this.fchildqty_max = fchildqty_max;
}
public Double getFchildrate_min()
{
	return fchildrate_min;
}
public void setFchildrate_min(Double fchildrate_min)
{
	this.fchildrate_min = fchildrate_min;
}
public Double getFchildrate_max()
{
	return fchildrate_max;
}
public void setFchildrate_max(Double fchildrate_max)
{
	this.fchildrate_max = fchildrate_max;
}
public Double getFappretwkpqty_min()
{
	return fappretwkpqty_min;
}
public void setFappretwkpqty_min(Double fappretwkpqty_min)
{
	this.fappretwkpqty_min = fappretwkpqty_min;
}
public Double getFappretwkpqty_max()
{
	return fappretwkpqty_max;
}
public void setFappretwkpqty_max(Double fappretwkpqty_max)
{
	this.fappretwkpqty_max = fappretwkpqty_max;
}
public Double getFappretwkpsum_min()
{
	return fappretwkpsum_min;
}
public void setFappretwkpsum_min(Double fappretwkpsum_min)
{
	this.fappretwkpsum_min = fappretwkpsum_min;
}
public Double getFappretwkpsum_max()
{
	return fappretwkpsum_max;
}
public void setFappretwkpsum_max(Double fappretwkpsum_max)
{
	this.fappretwkpsum_max = fappretwkpsum_max;
}
public Double getFappretykpqty_min()
{
	return fappretykpqty_min;
}
public void setFappretykpqty_min(Double fappretykpqty_min)
{
	this.fappretykpqty_min = fappretykpqty_min;
}
public Double getFappretykpqty_max()
{
	return fappretykpqty_max;
}
public void setFappretykpqty_max(Double fappretykpqty_max)
{
	this.fappretykpqty_max = fappretykpqty_max;
}
public Double getFappretykpsum_min()
{
	return fappretykpsum_min;
}
public void setFappretykpsum_min(Double fappretykpsum_min)
{
	this.fappretykpsum_min = fappretykpsum_min;
}
public Double getFappretykpsum_max()
{
	return fappretykpsum_max;
}
public void setFappretykpsum_max(Double fappretykpsum_max)
{
	this.fappretykpsum_max = fappretykpsum_max;
}
public Double getFappretwkptbqty_min()
{
	return fappretwkptbqty_min;
}
public void setFappretwkptbqty_min(Double fappretwkptbqty_min)
{
	this.fappretwkptbqty_min = fappretwkptbqty_min;
}
public Double getFappretwkptbqty_max()
{
	return fappretwkptbqty_max;
}
public void setFappretwkptbqty_max(Double fappretwkptbqty_max)
{
	this.fappretwkptbqty_max = fappretwkptbqty_max;
}
public Double getFappretykptbqty_min()
{
	return fappretykptbqty_min;
}
public void setFappretykptbqty_min(Double fappretykptbqty_min)
{
	this.fappretykptbqty_min = fappretykptbqty_min;
}
public Double getFappretykptbqty_max()
{
	return fappretykptbqty_max;
}
public void setFappretykptbqty_max(Double fappretykptbqty_max)
{
	this.fappretykptbqty_max = fappretykptbqty_max;
}
public Long getIrtnappid_min()
{
	return irtnappid_min;
}
public void setIrtnappid_min(Long irtnappid_min)
{
	this.irtnappid_min = irtnappid_min;
}
public Long getIrtnappid_max()
{
	return irtnappid_max;
}
public void setIrtnappid_max(Long irtnappid_max)
{
	this.irtnappid_max = irtnappid_max;
}

}