package com.hcp.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class HcpDataSourceSearchCondition extends BaseSearchCondition
{
private Timestamp record_time_min;
private Timestamp record_time_max;
public Timestamp getRecord_time_min()
{
	return record_time_min;
}
public void setRecord_time_min(Timestamp record_time_min)
{
	this.record_time_min = record_time_min;
}
public Timestamp getRecord_time_max()
{
	return record_time_max;
}
public void setRecord_time_max(Timestamp record_time_max)
{
	this.record_time_max = record_time_max;
}

}