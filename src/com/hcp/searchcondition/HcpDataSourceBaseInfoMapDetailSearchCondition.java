package com.hcp.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class HcpDataSourceBaseInfoMapDetailSearchCondition extends BaseSearchCondition
{
	private Long map_id_min;
	private Long map_id_max;

	public Long getMap_id_min()
	{
		return map_id_min;
	}

	public void setMap_id_min(Long map_id_min)
	{
		this.map_id_min = map_id_min;
	}

	public Long getMap_id_max()
	{
		return map_id_max;
	}

	public void setMap_id_max(Long map_id_max)
	{
		this.map_id_max = map_id_max;
	}

}