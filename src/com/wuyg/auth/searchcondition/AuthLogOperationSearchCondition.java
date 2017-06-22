package com.wuyg.auth.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class AuthLogOperationSearchCondition extends BaseSearchCondition
{
private Timestamp timestamp_min;
private Timestamp timestamp_max;
public Timestamp getTimestamp_min()
{
	return timestamp_min;
}
public void setTimestamp_min(Timestamp timestamp_min)
{
	this.timestamp_min = timestamp_min;
}
public Timestamp getTimestamp_max()
{
	return timestamp_max;
}
public void setTimestamp_max(Timestamp timestamp_max)
{
	this.timestamp_max = timestamp_max;
}

}