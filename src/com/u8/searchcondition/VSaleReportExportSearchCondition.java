package com.u8.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class VSaleReportExportSearchCondition extends BaseSearchCondition
{
private Double inum_min;
private Double inum_max;
private Double iactualnatmoney_min;
private Double iactualnatmoney_max;
public Double getInum_min()
{
	return inum_min;
}
public void setInum_min(Double inum_min)
{
	this.inum_min = inum_min;
}
public Double getInum_max()
{
	return inum_max;
}
public void setInum_max(Double inum_max)
{
	this.inum_max = inum_max;
}
public Double getIactualnatmoney_min()
{
	return iactualnatmoney_min;
}
public void setIactualnatmoney_min(Double iactualnatmoney_min)
{
	this.iactualnatmoney_min = iactualnatmoney_min;
}
public Double getIactualnatmoney_max()
{
	return iactualnatmoney_max;
}
public void setIactualnatmoney_max(Double iactualnatmoney_max)
{
	this.iactualnatmoney_max = iactualnatmoney_max;
}

}