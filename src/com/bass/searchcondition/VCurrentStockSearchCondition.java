package com.bass.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import com.wuyg.common.util.StringUtil;

import java.sql.Timestamp;

public class VCurrentStockSearchCondition extends BaseSearchCondition
{
	private Double iquantity_min;
	private Double iquantity_max;

	private String cinvcode_min;
	private String cinvcode_max;

	private String show0inv = "否";

	@Override
	public String getOtherWhere()
	{
		if ("否".equalsIgnoreCase(show0inv))
		{
			return (!StringUtil.isEmpty(super.getOtherWhere()) ? (super.getOtherWhere() + " and ") : "") + "iquantity>0 ";
		} else
		{
			return super.getOtherWhere();
		}

	}

	public String getShow0inv()
	{
		return show0inv;
	}

	public void setShow0inv(String show0inv)
	{
		this.show0inv = show0inv;
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

	public String getCinvcode_min()
	{
		return cinvcode_min;
	}

	public void setCinvcode_min(String cinvcode_min)
	{
		this.cinvcode_min = cinvcode_min;
	}

	public String getCinvcode_max()
	{
		return cinvcode_max;
	}

	public void setCinvcode_max(String cinvcode_max)
	{
		this.cinvcode_max = cinvcode_max;
	}

}