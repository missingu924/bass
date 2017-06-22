package com.wuyg.system.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import com.wuyg.common.util.StringUtil;

import java.sql.Timestamp;

public class SystemMenuSearchCondition extends BaseSearchCondition
{
	private String treeId;

	@Override
	public String getOtherWhere()
	{
		if (!StringUtil.isEmpty(treeId))
		{
			return "(menu_code='" + treeId + "' or parent_code like '" + treeId + "%')";
		}
		return null;
	}

	public String getTreeId()
	{
		return treeId;
	}

	public void setTreeId(String treeId)
	{
		this.treeId = treeId;
	}

}