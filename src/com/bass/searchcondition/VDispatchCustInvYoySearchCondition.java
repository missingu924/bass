package com.bass.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VDispatchCustInvYoySearchCondition extends BaseSearchCondition
{
	public static final String GROUP_BY_CUST = "GROUP_BY_CUST";// 按客户统计
	public static final String GROUP_BY_INV = "GROUP_BY_INV";// 按产品统计
	public static final String GROUP_BY_CUST_INV = "GROUP_BY_CUST_INV";// 按客户+产品统计
	public static final String GROUP_BY_PERSON = "GROUP_BY_PERSON";// 按业务员

	private String groupBy;// 统计类型

	private Integer iyear;

	public String getGroupBy()
	{
		return groupBy;
	}

	public void setGroupBy(String groupBy)
	{
		this.groupBy = groupBy;
	}

	public Integer getIyear()
	{
		return iyear;
	}

	public void setIyear(Integer iyear)
	{
		this.iyear = iyear;
	}
}