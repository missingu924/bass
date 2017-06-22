package com.u8.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;

public abstract class AbstractDataSyncSearchCondition extends BaseSearchCondition
{
	private String out_ds_code;// 外部数据源编码

	public String getOut_ds_code()
	{
		return out_ds_code;
	}

	public void setOut_ds_code(String out_ds_code)
	{
		this.out_ds_code = out_ds_code;
	}
}
