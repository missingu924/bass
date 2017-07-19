package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;
import com.bass.searchcondition.VDispatchCustInvMomSearchCondition;

public class VDispatchCustInvMomObj extends BaseDbObj
{
	private String year;
	private String cinvcode;
	private String cinvname;
	private String ccuscode;
	private String ccusname;
	private String cpersoncode;
	private String cpersonname;
	private Double month_01_inatsum;
	private Double month_02_inatsum;
	private Double month_03_inatsum;
	private Double month_04_inatsum;
	private Double month_05_inatsum;
	private Double month_06_inatsum;
	private Double month_07_inatsum;
	private Double month_08_inatsum;
	private Double month_09_inatsum;
	private Double month_10_inatsum;
	private Double month_11_inatsum;
	private Double month_12_inatsum;
	private Double month_01_inatsum_yoy;
	private Double month_02_inatsum_yoy;
	private Double month_03_inatsum_yoy;
	private Double month_04_inatsum_yoy;
	private Double month_05_inatsum_yoy;
	private Double month_06_inatsum_yoy;
	private Double month_07_inatsum_yoy;
	private Double month_08_inatsum_yoy;
	private Double month_09_inatsum_yoy;
	private Double month_10_inatsum_yoy;
	private Double month_11_inatsum_yoy;
	private Double month_12_inatsum_yoy;
	private Double month_01_inatsum_mom;
	private Double month_02_inatsum_mom;
	private Double month_03_inatsum_mom;
	private Double month_04_inatsum_mom;
	private Double month_05_inatsum_mom;
	private Double month_06_inatsum_mom;
	private Double month_07_inatsum_mom;
	private Double month_08_inatsum_mom;
	private Double month_09_inatsum_mom;
	private Double month_10_inatsum_mom;
	private Double month_11_inatsum_mom;
	private Double month_12_inatsum_mom;
	private Double year_inatsum;
	private Double year_inatsum_yoy;

	@Override
	public String findKeyColumnName()
	{
		return null;
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
		return "v_disptch_cust_inv_mom";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "ccusname,cinvname,cpersonname";
	}

	@Override
	public String getBasePath()
	{
		return "VDispatchCustInvMom";
	}

	@Override
	public String getCnName()
	{
		return "同环比分析";
	}
	
	public String getCnName(String groupBy)
	{
		if (VDispatchCustInvMomSearchCondition.GROUP_BY_CUST.equalsIgnoreCase(groupBy))
		{
			return "客户月度发货同环比（单位:万元）";
		}
		if (VDispatchCustInvMomSearchCondition.GROUP_BY_INV.equalsIgnoreCase(groupBy))
		{
			return "产品月度发货同环比（单位:万元）";
		}
		if (VDispatchCustInvMomSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(groupBy))
		{
			return "客户月度产品发货同环比（单位:万元）";
		}
		if (VDispatchCustInvMomSearchCondition.GROUP_BY_PERSON.equalsIgnoreCase(groupBy))
		{
			return "业务员月度发货同环比（单位:万元）";
		}
		return "";
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

		pros.put("iyear", "年份");
		pros.put("cinvcode", "产品编码");
		pros.put("cinvname", "产品名称");
		pros.put("ccuscode", "客户编码");
		pros.put("ccusname", "客户名称");
		pros.put("cpersoncode", "业务员编码");
		pros.put("cpersonname", "业务员名称");
		pros.put("month_01_inatsum", "1月");
		pros.put("month_02_inatsum", "2月");
		pros.put("month_03_inatsum", "3月");
		pros.put("month_04_inatsum", "4月");
		pros.put("month_05_inatsum", "5月");
		pros.put("month_06_inatsum", "6月");
		pros.put("month_07_inatsum", "7月");
		pros.put("month_08_inatsum", "8月");
		pros.put("month_09_inatsum", "9月");
		pros.put("month_10_inatsum", "10月");
		pros.put("month_11_inatsum", "11月");
		pros.put("month_12_inatsum", "12月");
		pros.put("month_01_inatsum_yoy", "month_01_inatsum_yoy");
		pros.put("month_02_inatsum_yoy", "month_02_inatsum_yoy");
		pros.put("month_03_inatsum_yoy", "month_03_inatsum_yoy");
		pros.put("month_04_inatsum_yoy", "month_04_inatsum_yoy");
		pros.put("month_05_inatsum_yoy", "month_05_inatsum_yoy");
		pros.put("month_06_inatsum_yoy", "month_06_inatsum_yoy");
		pros.put("month_07_inatsum_yoy", "month_07_inatsum_yoy");
		pros.put("month_08_inatsum_yoy", "month_08_inatsum_yoy");
		pros.put("month_09_inatsum_yoy", "month_09_inatsum_yoy");
		pros.put("month_10_inatsum_yoy", "month_10_inatsum_yoy");
		pros.put("month_11_inatsum_yoy", "month_11_inatsum_yoy");
		pros.put("month_12_inatsum_yoy", "month_12_inatsum_yoy");
		pros.put("month_01_inatsum_mom", "month_01_inatsum_mom");
		pros.put("month_02_inatsum_mom", "month_02_inatsum_mom");
		pros.put("month_03_inatsum_mom", "month_03_inatsum_mom");
		pros.put("month_04_inatsum_mom", "month_04_inatsum_mom");
		pros.put("month_05_inatsum_mom", "month_05_inatsum_mom");
		pros.put("month_06_inatsum_mom", "month_06_inatsum_mom");
		pros.put("month_07_inatsum_mom", "month_07_inatsum_mom");
		pros.put("month_08_inatsum_mom", "month_08_inatsum_mom");
		pros.put("month_09_inatsum_mom", "month_09_inatsum_mom");
		pros.put("month_10_inatsum_mom", "month_10_inatsum_mom");
		pros.put("month_11_inatsum_mom", "month_11_inatsum_mom");
		pros.put("month_12_inatsum_mom", "month_12_inatsum_mom");
		return pros;
	}

	public String getYear()
	{
		return year;
	}

	public void setYear(String year)
	{
		this.year = year;
	}

	public String getCinvcode()
	{
		return cinvcode;
	}

	public void setCinvcode(String cinvcode)
	{
		this.cinvcode = cinvcode;
	}

	public String getCinvname()
	{
		return cinvname;
	}

	public void setCinvname(String cinvname)
	{
		this.cinvname = cinvname;
	}

	public String getCcuscode()
	{
		return ccuscode;
	}

	public void setCcuscode(String ccuscode)
	{
		this.ccuscode = ccuscode;
	}

	public String getCcusname()
	{
		return ccusname;
	}

	public void setCcusname(String ccusname)
	{
		this.ccusname = ccusname;
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

	public Double getMonth_01_inatsum()
	{
		return month_01_inatsum;
	}

	public void setMonth_01_inatsum(Double month_01_inatsum)
	{
		this.month_01_inatsum = month_01_inatsum;
	}

	public Double getMonth_02_inatsum()
	{
		return month_02_inatsum;
	}

	public void setMonth_02_inatsum(Double month_02_inatsum)
	{
		this.month_02_inatsum = month_02_inatsum;
	}

	public Double getMonth_03_inatsum()
	{
		return month_03_inatsum;
	}

	public void setMonth_03_inatsum(Double month_03_inatsum)
	{
		this.month_03_inatsum = month_03_inatsum;
	}

	public Double getMonth_04_inatsum()
	{
		return month_04_inatsum;
	}

	public void setMonth_04_inatsum(Double month_04_inatsum)
	{
		this.month_04_inatsum = month_04_inatsum;
	}

	public Double getMonth_05_inatsum()
	{
		return month_05_inatsum;
	}

	public void setMonth_05_inatsum(Double month_05_inatsum)
	{
		this.month_05_inatsum = month_05_inatsum;
	}

	public Double getMonth_06_inatsum()
	{
		return month_06_inatsum;
	}

	public void setMonth_06_inatsum(Double month_06_inatsum)
	{
		this.month_06_inatsum = month_06_inatsum;
	}

	public Double getMonth_07_inatsum()
	{
		return month_07_inatsum;
	}

	public void setMonth_07_inatsum(Double month_07_inatsum)
	{
		this.month_07_inatsum = month_07_inatsum;
	}

	public Double getMonth_08_inatsum()
	{
		return month_08_inatsum;
	}

	public void setMonth_08_inatsum(Double month_08_inatsum)
	{
		this.month_08_inatsum = month_08_inatsum;
	}

	public Double getMonth_09_inatsum()
	{
		return month_09_inatsum;
	}

	public void setMonth_09_inatsum(Double month_09_inatsum)
	{
		this.month_09_inatsum = month_09_inatsum;
	}

	public Double getMonth_10_inatsum()
	{
		return month_10_inatsum;
	}

	public void setMonth_10_inatsum(Double month_10_inatsum)
	{
		this.month_10_inatsum = month_10_inatsum;
	}

	public Double getMonth_11_inatsum()
	{
		return month_11_inatsum;
	}

	public void setMonth_11_inatsum(Double month_11_inatsum)
	{
		this.month_11_inatsum = month_11_inatsum;
	}

	public Double getMonth_12_inatsum()
	{
		return month_12_inatsum;
	}

	public void setMonth_12_inatsum(Double month_12_inatsum)
	{
		this.month_12_inatsum = month_12_inatsum;
	}

	public Double getMonth_01_inatsum_yoy()
	{
		return month_01_inatsum_yoy;
	}

	public void setMonth_01_inatsum_yoy(Double month_01_inatsum_yoy)
	{
		this.month_01_inatsum_yoy = month_01_inatsum_yoy;
	}

	public Double getMonth_02_inatsum_yoy()
	{
		return month_02_inatsum_yoy;
	}

	public void setMonth_02_inatsum_yoy(Double month_02_inatsum_yoy)
	{
		this.month_02_inatsum_yoy = month_02_inatsum_yoy;
	}

	public Double getMonth_03_inatsum_yoy()
	{
		return month_03_inatsum_yoy;
	}

	public void setMonth_03_inatsum_yoy(Double month_03_inatsum_yoy)
	{
		this.month_03_inatsum_yoy = month_03_inatsum_yoy;
	}

	public Double getMonth_04_inatsum_yoy()
	{
		return month_04_inatsum_yoy;
	}

	public void setMonth_04_inatsum_yoy(Double month_04_inatsum_yoy)
	{
		this.month_04_inatsum_yoy = month_04_inatsum_yoy;
	}

	public Double getMonth_05_inatsum_yoy()
	{
		return month_05_inatsum_yoy;
	}

	public void setMonth_05_inatsum_yoy(Double month_05_inatsum_yoy)
	{
		this.month_05_inatsum_yoy = month_05_inatsum_yoy;
	}

	public Double getMonth_06_inatsum_yoy()
	{
		return month_06_inatsum_yoy;
	}

	public void setMonth_06_inatsum_yoy(Double month_06_inatsum_yoy)
	{
		this.month_06_inatsum_yoy = month_06_inatsum_yoy;
	}

	public Double getMonth_07_inatsum_yoy()
	{
		return month_07_inatsum_yoy;
	}

	public void setMonth_07_inatsum_yoy(Double month_07_inatsum_yoy)
	{
		this.month_07_inatsum_yoy = month_07_inatsum_yoy;
	}

	public Double getMonth_08_inatsum_yoy()
	{
		return month_08_inatsum_yoy;
	}

	public void setMonth_08_inatsum_yoy(Double month_08_inatsum_yoy)
	{
		this.month_08_inatsum_yoy = month_08_inatsum_yoy;
	}

	public Double getMonth_09_inatsum_yoy()
	{
		return month_09_inatsum_yoy;
	}

	public void setMonth_09_inatsum_yoy(Double month_09_inatsum_yoy)
	{
		this.month_09_inatsum_yoy = month_09_inatsum_yoy;
	}

	public Double getMonth_10_inatsum_yoy()
	{
		return month_10_inatsum_yoy;
	}

	public void setMonth_10_inatsum_yoy(Double month_10_inatsum_yoy)
	{
		this.month_10_inatsum_yoy = month_10_inatsum_yoy;
	}

	public Double getMonth_11_inatsum_yoy()
	{
		return month_11_inatsum_yoy;
	}

	public void setMonth_11_inatsum_yoy(Double month_11_inatsum_yoy)
	{
		this.month_11_inatsum_yoy = month_11_inatsum_yoy;
	}

	public Double getMonth_12_inatsum_yoy()
	{
		return month_12_inatsum_yoy;
	}

	public void setMonth_12_inatsum_yoy(Double month_12_inatsum_yoy)
	{
		this.month_12_inatsum_yoy = month_12_inatsum_yoy;
	}

	public Double getMonth_01_inatsum_mom()
	{
		return month_01_inatsum_mom;
	}

	public void setMonth_01_inatsum_mom(Double month_01_inatsum_mom)
	{
		this.month_01_inatsum_mom = month_01_inatsum_mom;
	}

	public Double getMonth_02_inatsum_mom()
	{
		return month_02_inatsum_mom;
	}

	public void setMonth_02_inatsum_mom(Double month_02_inatsum_mom)
	{
		this.month_02_inatsum_mom = month_02_inatsum_mom;
	}

	public Double getMonth_03_inatsum_mom()
	{
		return month_03_inatsum_mom;
	}

	public void setMonth_03_inatsum_mom(Double month_03_inatsum_mom)
	{
		this.month_03_inatsum_mom = month_03_inatsum_mom;
	}

	public Double getMonth_04_inatsum_mom()
	{
		return month_04_inatsum_mom;
	}

	public void setMonth_04_inatsum_mom(Double month_04_inatsum_mom)
	{
		this.month_04_inatsum_mom = month_04_inatsum_mom;
	}

	public Double getMonth_05_inatsum_mom()
	{
		return month_05_inatsum_mom;
	}

	public void setMonth_05_inatsum_mom(Double month_05_inatsum_mom)
	{
		this.month_05_inatsum_mom = month_05_inatsum_mom;
	}

	public Double getMonth_06_inatsum_mom()
	{
		return month_06_inatsum_mom;
	}

	public void setMonth_06_inatsum_mom(Double month_06_inatsum_mom)
	{
		this.month_06_inatsum_mom = month_06_inatsum_mom;
	}

	public Double getMonth_07_inatsum_mom()
	{
		return month_07_inatsum_mom;
	}

	public void setMonth_07_inatsum_mom(Double month_07_inatsum_mom)
	{
		this.month_07_inatsum_mom = month_07_inatsum_mom;
	}

	public Double getMonth_08_inatsum_mom()
	{
		return month_08_inatsum_mom;
	}

	public void setMonth_08_inatsum_mom(Double month_08_inatsum_mom)
	{
		this.month_08_inatsum_mom = month_08_inatsum_mom;
	}

	public Double getMonth_09_inatsum_mom()
	{
		return month_09_inatsum_mom;
	}

	public void setMonth_09_inatsum_mom(Double month_09_inatsum_mom)
	{
		this.month_09_inatsum_mom = month_09_inatsum_mom;
	}

	public Double getMonth_10_inatsum_mom()
	{
		return month_10_inatsum_mom;
	}

	public void setMonth_10_inatsum_mom(Double month_10_inatsum_mom)
	{
		this.month_10_inatsum_mom = month_10_inatsum_mom;
	}

	public Double getMonth_11_inatsum_mom()
	{
		return month_11_inatsum_mom;
	}

	public void setMonth_11_inatsum_mom(Double month_11_inatsum_mom)
	{
		this.month_11_inatsum_mom = month_11_inatsum_mom;
	}

	public Double getMonth_12_inatsum_mom()
	{
		return month_12_inatsum_mom;
	}

	public void setMonth_12_inatsum_mom(Double month_12_inatsum_mom)
	{
		this.month_12_inatsum_mom = month_12_inatsum_mom;
	}

	public Double getYear_inatsum()
	{
		return year_inatsum;
	}

	public void setYear_inatsum(Double year_inatsum)
	{
		this.year_inatsum = year_inatsum;
	}

	public Double getYear_inatsum_yoy()
	{
		return year_inatsum_yoy;
	}

	public void setYear_inatsum_yoy(Double year_inatsum_yoy)
	{
		this.year_inatsum_yoy = year_inatsum_yoy;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
