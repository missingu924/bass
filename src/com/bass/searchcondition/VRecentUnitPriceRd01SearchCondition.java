package com.bass.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VRecentUnitPriceRd01SearchCondition extends BaseSearchCondition
{
private Double iunitcost_min;
private Double iunitcost_max;
private Timestamp ddate_min;
private Timestamp ddate_max;
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

}