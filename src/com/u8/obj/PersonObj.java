package com.u8.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class PersonObj extends BaseDbObj
{
	private String cpersoncode;
	private String cpersonname;
	private String cdepcode;
	private String cpersonprop;
	private Double fcreditquantity;
	private Long icredate;
	private String ccregrade;
	private Double ilowrate;
	private String coffergrade;
	private Double iofferrate;
	private String pubufts;
	private String cpersonemail;
	private String cpersonphone;
	private Timestamp dpvaliddate;
	private Timestamp dpinvaliddate;

	@Override
	public String findKeyColumnName()
	{
		return "cpersonname";
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
		return "person";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "Person";
	}

	@Override
	public String getCnName()
	{
		return "业务员";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{});
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("cpersoncode", "cpersoncode");
		pros.put("cpersonname", "cpersonname");
		pros.put("cdepcode", "cdepcode");
		pros.put("cpersonprop", "cpersonprop");
		pros.put("fcreditquantity", "fcreditquantity");
		pros.put("icredate", "icredate");
		pros.put("ccregrade", "ccregrade");
		pros.put("ilowrate", "ilowrate");
		pros.put("coffergrade", "coffergrade");
		pros.put("iofferrate", "iofferrate");
		pros.put("pubufts", "pubufts");
		pros.put("cpersonemail", "cpersonemail");
		pros.put("cpersonphone", "cpersonphone");
		pros.put("dpvaliddate", "dpvaliddate");
		pros.put("dpinvaliddate", "dpinvaliddate");
		return pros;
	}

	public String getCpersoncode()
	{
		return cpersoncode;
	}

	public void setCpersoncode(String cpersoncode)
	{
		this.cpersoncode = cpersoncode;
	}

	public String getCpersonname()
	{
		return cpersonname;
	}

	public void setCpersonname(String cpersonname)
	{
		this.cpersonname = cpersonname;
	}

	public String getCdepcode()
	{
		return cdepcode;
	}

	public void setCdepcode(String cdepcode)
	{
		this.cdepcode = cdepcode;
	}

	public String getCpersonprop()
	{
		return cpersonprop;
	}

	public void setCpersonprop(String cpersonprop)
	{
		this.cpersonprop = cpersonprop;
	}

	public Double getFcreditquantity()
	{
		return fcreditquantity;
	}

	public void setFcreditquantity(Double fcreditquantity)
	{
		this.fcreditquantity = fcreditquantity;
	}

	public Long getIcredate()
	{
		return icredate;
	}

	public void setIcredate(Long icredate)
	{
		this.icredate = icredate;
	}

	public String getCcregrade()
	{
		return ccregrade;
	}

	public void setCcregrade(String ccregrade)
	{
		this.ccregrade = ccregrade;
	}

	public Double getIlowrate()
	{
		return ilowrate;
	}

	public void setIlowrate(Double ilowrate)
	{
		this.ilowrate = ilowrate;
	}

	public String getCoffergrade()
	{
		return coffergrade;
	}

	public void setCoffergrade(String coffergrade)
	{
		this.coffergrade = coffergrade;
	}

	public Double getIofferrate()
	{
		return iofferrate;
	}

	public void setIofferrate(Double iofferrate)
	{
		this.iofferrate = iofferrate;
	}

	public String getPubufts()
	{
		return pubufts;
	}

	public void setPubufts(String pubufts)
	{
		this.pubufts = pubufts;
	}

	public String getCpersonemail()
	{
		return cpersonemail;
	}

	public void setCpersonemail(String cpersonemail)
	{
		this.cpersonemail = cpersonemail;
	}

	public String getCpersonphone()
	{
		return cpersonphone;
	}

	public void setCpersonphone(String cpersonphone)
	{
		this.cpersonphone = cpersonphone;
	}

	public Timestamp getDpvaliddate()
	{
		return dpvaliddate;
	}

	public void setDpvaliddate(Timestamp dpvaliddate)
	{
		this.dpvaliddate = dpvaliddate;
	}

	public Timestamp getDpinvaliddate()
	{
		return dpinvaliddate;
	}

	public void setDpinvaliddate(Timestamp dpinvaliddate)
	{
		this.dpinvaliddate = dpinvaliddate;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
