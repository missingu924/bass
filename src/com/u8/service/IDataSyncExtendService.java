package com.u8.service;

import java.util.List;

import com.wuyg.common.dao.BaseDbObj;

public interface IDataSyncExtendService
{
	public boolean process(List<BaseDbObj> mainObjList) throws Exception;
}
