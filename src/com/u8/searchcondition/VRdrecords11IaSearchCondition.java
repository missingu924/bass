package com.u8.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VRdrecords11IaSearchCondition extends BaseSearchCondition
{
	private Timestamp ddate_min;
	private Timestamp ddate_max;
	private Double iquantity_min;
	private Double iquantity_max;
	private Double iunitcost_min;
	private Double iunitcost_max;
	private Double iprice_min;
	private Double iprice_max;

	private String citem_now;// 现行项目，原有项目|修改的项目
	public String getCitem_now()
	{
		return citem_now;
	}

	public void setCitem_now(String citem_now)
	{
		this.citem_now = citem_now;
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

}