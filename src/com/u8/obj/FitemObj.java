package com.u8.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;
public class FitemObj extends BaseDbObj
{
private Long i_id;
private String citem_class;
private String citem_name;
private String citem_text;
private String crule;
private String ctable;
private String cclasstable;
private String pubufts;
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
	return "fitem";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "Fitem";
}
@Override
public String getCnName()
{
	return "总账项目大类";
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
		pros.put("citem_class", "citem_class");
		pros.put("citem_name", "citem_name");
		pros.put("citem_text", "citem_text");
		pros.put("crule", "crule");
		pros.put("ctable", "ctable");
		pros.put("cclasstable", "cclasstable");
		pros.put("pubufts", "pubufts");
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
public String getCitem_class()
{
	return citem_class;
}
public void setCitem_class(String citem_class)
{
	this.citem_class = citem_class;
}
public String getCitem_name()
{
	return citem_name;
}
public void setCitem_name(String citem_name)
{
	this.citem_name = citem_name;
}
public String getCitem_text()
{
	return citem_text;
}
public void setCitem_text(String citem_text)
{
	this.citem_text = citem_text;
}
public String getCrule()
{
	return crule;
}
public void setCrule(String crule)
{
	this.crule = crule;
}
public String getCtable()
{
	return ctable;
}
public void setCtable(String ctable)
{
	this.ctable = ctable;
}
public String getCclasstable()
{
	return cclasstable;
}
public void setCclasstable(String cclasstable)
{
	this.cclasstable = cclasstable;
}
public String getPubufts()
{
	return pubufts;
}
public void setPubufts(String pubufts)
{
	this.pubufts = pubufts;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

