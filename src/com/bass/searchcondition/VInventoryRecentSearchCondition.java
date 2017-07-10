package com.bass.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VInventoryRecentSearchCondition extends BaseSearchCondition
{
private Timestamp drecentdate_min;
private Timestamp drecentdate_max;
private Long idays_min;
private Long idays_max;
public Timestamp getDrecentdate_min()
{
	return drecentdate_min;
}
public void setDrecentdate_min(Timestamp drecentdate_min)
{
	this.drecentdate_min = drecentdate_min;
}
public Timestamp getDrecentdate_max()
{
	return drecentdate_max;
}
public void setDrecentdate_max(Timestamp drecentdate_max)
{
	this.drecentdate_max = drecentdate_max;
}
public Long getIdays_min()
{
	return idays_min;
}
public void setIdays_min(Long idays_min)
{
	this.idays_min = idays_min;
}
public Long getIdays_max()
{
	return idays_max;
}
public void setIdays_max(Long idays_max)
{
	this.idays_max = idays_max;
}

}