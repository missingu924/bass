package com.u8.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;
public class ExchObj extends BaseDbObj
{
private Long i_id;
private String cexch_name;
private String iperiod;
private String itype;
private String cdate;
private Double nflat;
private String pubufts;
private Long iyear;
@Override
public String findKeyColumnName()
{
	return "i_id";
}
@Override
public String findParentKeyColumnName()
{
	// TODO Auto-generated method stub
	return null;
}
@Override
public String findTableName()
{
	return "exch";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "Exch";
}
@Override
public String getCnName()
{
	return "汇率";
}
@Override
public List<String> findUniqueIndexProperties()
{
	return Arrays.asList(new String[]
	{ 	});
}
public LinkedHashMap<String, String> findProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("i_id", "i_id");
		pros.put("cexch_name", "cexch_name");
		pros.put("iperiod", "iperiod");
		pros.put("itype", "itype");
		pros.put("cdate", "cdate");
		pros.put("nflat", "nflat");
		pros.put("pubufts", "pubufts");
		pros.put("iyear", "iyear");
		return pros;
}
public Long getI_id()
{
	return i_id;
}
public void setI_id(Long i_id)
{
	this.i_id = i_id;
}
public String getCexch_name()
{
	return cexch_name;
}
public void setCexch_name(String cexch_name)
{
	this.cexch_name = cexch_name;
}
public String getIperiod()
{
	return iperiod;
}
public void setIperiod(String iperiod)
{
	this.iperiod = iperiod;
}
public String getItype()
{
	return itype;
}
public void setItype(String itype)
{
	this.itype = itype;
}
public String getCdate()
{
	return cdate;
}
public void setCdate(String cdate)
{
	this.cdate = cdate;
}
public Double getNflat()
{
	return nflat;
}
public void setNflat(Double nflat)
{
	this.nflat = nflat;
}
public String getPubufts()
{
	return pubufts;
}
public void setPubufts(String pubufts)
{
	this.pubufts = pubufts;
}
public Long getIyear()
{
	return iyear;
}
public void setIyear(Long iyear)
{
	this.iyear = iyear;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

