package com.u8.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VDispBillStatSearchCondition extends BaseSearchCondition
{
	private Timestamp ddate_min;
	private Timestamp ddate_max;
	private Long dlsautoid_min;
	private Long dlsautoid_max;
	private Double iquantity_min;
	private Double iquantity_max;
	private Double inum_min;
	private Double inum_max;
	private Double ibillunitprice_min;
	private Double ibillunitprice_max;
	private Double idispunitprice_min;
	private Double idispunitprice_max;
	private Double iactualunitprice_min;
	private Double iactualunitprice_max;
	private Double ibillmoney_min;
	private Double ibillmoney_max;
	private Double idispmoney_min;
	private Double idispmoney_max;
	private Double iactualmoney_min;
	private Double iactualmoney_max;
	private Double ibillnatunitprice_min;
	private Double ibillnatunitprice_max;
	private Double idispnatunitprice_min;
	private Double idispnatunitprice_max;
	private Double iactualnatunitprice_min;
	private Double iactualnatunitprice_max;
	private Double ibillnatmoney_min;
	private Double ibillnatmoney_max;
	private Double idispnatmoney_min;
	private Double idispnatmoney_max;
	private Double iactualnatmoney_min;
	private Double iactualnatmoney_max;

	private Boolean breturnflag;
	
	private String basedbobj_class; // excel对应的数据库基础类

	public String getBasedbobj_class()
	{
		return basedbobj_class;
	}

	public void setBasedbobj_class(String basedbobj_class)
	{
		this.basedbobj_class = basedbobj_class;
	}

	public Boolean getBreturnflag()
	{
		return breturnflag;
	}

	public void setBreturnflag(Boolean breturnflag)
	{
		this.breturnflag = breturnflag;
	}

	public Timestamp getDdate_min()
	{
		return ddate_min;
	}

	public void setDdate_min(Timestamp ddate_min)
	{
		this.ddate_min = ddate_min;
	}

	public Timestamp getDdate_max()
	{
		return ddate_max;
	}

	public void setDdate_max(Timestamp ddate_max)
	{
		this.ddate_max = ddate_max;
	}

	public Long getDlsautoid_min()
	{
		return dlsautoid_min;
	}

	public void setDlsautoid_min(Long dlsautoid_min)
	{
		this.dlsautoid_min = dlsautoid_min;
	}

	public Long getDlsautoid_max()
	{
		return dlsautoid_max;
	}

	public void setDlsautoid_max(Long dlsautoid_max)
	{
		this.dlsautoid_max = dlsautoid_max;
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

	public Double getIbillunitprice_min()
	{
		return ibillunitprice_min;
	}

	public void setIbillunitprice_min(Double ibillunitprice_min)
	{
		this.ibillunitprice_min = ibillunitprice_min;
	}

	public Double getIbillunitprice_max()
	{
		return ibillunitprice_max;
	}

	public void setIbillunitprice_max(Double ibillunitprice_max)
	{
		this.ibillunitprice_max = ibillunitprice_max;
	}

	public Double getIdispunitprice_min()
	{
		return idispunitprice_min;
	}

	public void setIdispunitprice_min(Double idispunitprice_min)
	{
		this.idispunitprice_min = idispunitprice_min;
	}

	public Double getIdispunitprice_max()
	{
		return idispunitprice_max;
	}

	public void setIdispunitprice_max(Double idispunitprice_max)
	{
		this.idispunitprice_max = idispunitprice_max;
	}

	public Double getIactualunitprice_min()
	{
		return iactualunitprice_min;
	}

	public void setIactualunitprice_min(Double iactualunitprice_min)
	{
		this.iactualunitprice_min = iactualunitprice_min;
	}

	public Double getIactualunitprice_max()
	{
		return iactualunitprice_max;
	}

	public void setIactualunitprice_max(Double iactualunitprice_max)
	{
		this.iactualunitprice_max = iactualunitprice_max;
	}

	public Double getIbillmoney_min()
	{
		return ibillmoney_min;
	}

	public void setIbillmoney_min(Double ibillmoney_min)
	{
		this.ibillmoney_min = ibillmoney_min;
	}

	public Double getIbillmoney_max()
	{
		return ibillmoney_max;
	}

	public void setIbillmoney_max(Double ibillmoney_max)
	{
		this.ibillmoney_max = ibillmoney_max;
	}

	public Double getIdispmoney_min()
	{
		return idispmoney_min;
	}

	public void setIdispmoney_min(Double idispmoney_min)
	{
		this.idispmoney_min = idispmoney_min;
	}

	public Double getIdispmoney_max()
	{
		return idispmoney_max;
	}

	public void setIdispmoney_max(Double idispmoney_max)
	{
		this.idispmoney_max = idispmoney_max;
	}

	public Double getIactualmoney_min()
	{
		return iactualmoney_min;
	}

	public void setIactualmoney_min(Double iactualmoney_min)
	{
		this.iactualmoney_min = iactualmoney_min;
	}

	public Double getIactualmoney_max()
	{
		return iactualmoney_max;
	}

	public void setIactualmoney_max(Double iactualmoney_max)
	{
		this.iactualmoney_max = iactualmoney_max;
	}

	public Double getIbillnatunitprice_min()
	{
		return ibillnatunitprice_min;
	}

	public void setIbillnatunitprice_min(Double ibillnatunitprice_min)
	{
		this.ibillnatunitprice_min = ibillnatunitprice_min;
	}

	public Double getIbillnatunitprice_max()
	{
		return ibillnatunitprice_max;
	}

	public void setIbillnatunitprice_max(Double ibillnatunitprice_max)
	{
		this.ibillnatunitprice_max = ibillnatunitprice_max;
	}

	public Double getIdispnatunitprice_min()
	{
		return idispnatunitprice_min;
	}

	public void setIdispnatunitprice_min(Double idispnatunitprice_min)
	{
		this.idispnatunitprice_min = idispnatunitprice_min;
	}

	public Double getIdispnatunitprice_max()
	{
		return idispnatunitprice_max;
	}

	public void setIdispnatunitprice_max(Double idispnatunitprice_max)
	{
		this.idispnatunitprice_max = idispnatunitprice_max;
	}

	public Double getIactualnatunitprice_min()
	{
		return iactualnatunitprice_min;
	}

	public void setIactualnatunitprice_min(Double iactualnatunitprice_min)
	{
		this.iactualnatunitprice_min = iactualnatunitprice_min;
	}

	public Double getIactualnatunitprice_max()
	{
		return iactualnatunitprice_max;
	}

	public void setIactualnatunitprice_max(Double iactualnatunitprice_max)
	{
		this.iactualnatunitprice_max = iactualnatunitprice_max;
	}

	public Double getIbillnatmoney_min()
	{
		return ibillnatmoney_min;
	}

	public void setIbillnatmoney_min(Double ibillnatmoney_min)
	{
		this.ibillnatmoney_min = ibillnatmoney_min;
	}

	public Double getIbillnatmoney_max()
	{
		return ibillnatmoney_max;
	}

	public void setIbillnatmoney_max(Double ibillnatmoney_max)
	{
		this.ibillnatmoney_max = ibillnatmoney_max;
	}

	public Double getIdispnatmoney_min()
	{
		return idispnatmoney_min;
	}

	public void setIdispnatmoney_min(Double idispnatmoney_min)
	{
		this.idispnatmoney_min = idispnatmoney_min;
	}

	public Double getIdispnatmoney_max()
	{
		return idispnatmoney_max;
	}

	public void setIdispnatmoney_max(Double idispnatmoney_max)
	{
		this.idispnatmoney_max = idispnatmoney_max;
	}

	public Double getIactualnatmoney_min()
	{
		return iactualnatmoney_min;
	}

	public void setIactualnatmoney_min(Double iactualnatmoney_min)
	{
		this.iactualnatmoney_min = iactualnatmoney_min;
	}

	public Double getIactualnatmoney_max()
	{
		return iactualnatmoney_max;
	}

	public void setIactualnatmoney_max(Double iactualnatmoney_max)
	{
		this.iactualnatmoney_max = iactualnatmoney_max;
	}

}