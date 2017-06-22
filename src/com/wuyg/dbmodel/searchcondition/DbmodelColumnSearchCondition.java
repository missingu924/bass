package com.wuyg.dbmodel.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class DbmodelColumnSearchCondition extends BaseSearchCondition
{
private Long tableid_min;
private Long tableid_max;
private Long columnscale_min;
private Long columnscale_max;
public Long getTableid_min()
{
	return tableid_min;
}
public void setTableid_min(Long tableid_min)
{
	this.tableid_min = tableid_min;
}
public Long getTableid_max()
{
	return tableid_max;
}
public void setTableid_max(Long tableid_max)
{
	this.tableid_max = tableid_max;
}
public Long getColumnscale_min()
{
	return columnscale_min;
}
public void setColumnscale_min(Long columnscale_min)
{
	this.columnscale_min = columnscale_min;
}
public Long getColumnscale_max()
{
	return columnscale_max;
}
public void setColumnscale_max(Long columnscale_max)
{
	this.columnscale_max = columnscale_max;
}

}