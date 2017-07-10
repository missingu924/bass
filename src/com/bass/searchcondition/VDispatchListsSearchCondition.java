package com.bass.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VDispatchListsSearchCondition extends BaseSearchCondition
{
private Timestamp ddate_min;
private Timestamp ddate_max;
private Long dlid_min;
private Long dlid_max;
private Double iquantity_min;
private Double iquantity_max;
private Double isum_min;
private Double isum_max;
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

}