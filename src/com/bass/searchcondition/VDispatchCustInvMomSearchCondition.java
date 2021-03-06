package com.bass.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VDispatchCustInvMomSearchCondition extends BaseSearchCondition
{
	public static final String GROUP_BY_CUST = "GROUP_BY_CUST";// 按客户统计
	public static final String GROUP_BY_INV = "GROUP_BY_INV";// 按产品统计
	public static final String GROUP_BY_CUST_INV = "GROUP_BY_CUST_INV";// 按客户+产品统计
	public static final String GROUP_BY_PERSON = "GROUP_BY_PERSON";// 按业务员
	
	public static final String BILL_TYPE_SALE = "SALE";// 订单
	public static final String BILL_TYPE_DISPATH = "DISPATCH";// 发货单

	private String groupBy;// 统计类型
	
	private String billType; // SALE，DISPATCH

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

	public String getBillType()
	{
		return billType;
	}

	public void setBillType(String billType)
	{
		this.billType = billType;
	}
}