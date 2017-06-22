package com.u8.obj;

import java.util.LinkedHashMap;
import java.util.Map;

import com.wuyg.common.dao.BaseDbObj;

public abstract class AbstractDataSyncObj extends BaseDbObj
{
	private String alreadysaved; // 是否已同步

	public String getAlreadysaved()
	{
		return alreadysaved;
	}

	public void setAlreadysaved(String alreadysaved)
	{
		this.alreadysaved = alreadysaved;
	}

	/**
	 * 获取主表需要对照的列及其档案名称
	 * 
	 * @return
	 */
	public abstract Map<String, String> findMainObjColumnMap();

	/**
	 * 获取子表需要对照的列及其档案名称
	 * 
	 * @return
	 */
	public abstract Map<String, String> findChildObjColumnMap();

}
