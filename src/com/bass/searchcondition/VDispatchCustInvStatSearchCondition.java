package com.bass.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VDispatchCustInvStatSearchCondition extends BaseSearchCondition
{
	public static final String GROUP_BY_CUST = "GROUP_BY_CUST";// 按客户统计
	public static final String GROUP_BY_INV = "GROUP_BY_INV";// 按产品统计
	public static final String GROUP_BY_CUST_INV = "GROUP_BY_CUST_INV";// 按客户+产品统计

	private String groupBy;// 统计类型
	private Timestamp ddate_min;
	private Timestamp ddate_max;

	public String getGroupBy()
	{
		return groupBy;
	}

	public void setGroupBy(String groupBy)
	{
		this.groupBy = groupBy;
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