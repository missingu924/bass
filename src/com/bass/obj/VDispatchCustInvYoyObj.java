package com.bass.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;
import com.bass.searchcondition.VDispatchCustInvMomSearchCondition;
import com.bass.searchcondition.VDispatchCustInvYoySearchCondition;

public class VDispatchCustInvYoyObj extends BaseDbObj
{
	private String iyear;
	private String cinvcode;
	private String cinvname;
	private String ccuscode;
	private String ccusname;
	private String cpersoncode;
	private String cpersonname;
	private Double year_00_inatsum;
	private Double year_01_inatsum;
	private Double year_02_inatsum;
	private Double year_03_inatsum;
	private Double year_04_inatsum;
	private Double year_05_inatsum;
	private Double year_06_inatsum;
	private Double year_07_inatsum;
	private Double year_08_inatsum;
	private Double year_09_inatsum;
	private Double year_10_inatsum;
	private Double year_11_inatsum;
	private Double year_inatsum;
	private Double year_00_inatsum_yoy;
	private Double year_01_inatsum_yoy;
	private Double year_02_inatsum_yoy;
	private Double year_03_inatsum_yoy;
	private Double year_04_inatsum_yoy;
	private Double year_05_inatsum_yoy;
	private Double year_06_inatsum_yoy;
	private Double year_07_inatsum_yoy;
	private Double year_08_inatsum_yoy;
	private Double year_09_inatsum_yoy;
	private Double year_10_inatsum_yoy;

	@Override
	public String findKeyColumnName()
	{
		return "iyear";
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
		return "v_dispatch_cust_inv_yoy";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "VDispatchCustInvYoy";
	}

	@Override
	public String getCnName()
	{
		return "年度发货同环比分析";
	}
	
	public String getCnName(String groupBy, String billType)
	{
		String str = "";
		if (VDispatchCustInvYoySearchCondition.GROUP_BY_CUST.equalsIgnoreCase(groupBy))
		{
			str = "客户";
		}
		if (VDispatchCustInvYoySearchCondition.GROUP_BY_INV.equalsIgnoreCase(groupBy))
		{
			str = "产品";
		}
		if (VDispatchCustInvYoySearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(groupBy))
		{
			str = "客户产品";
		}
		if (VDispatchCustInvYoySearchCondition.GROUP_BY_PERSON.equalsIgnoreCase(groupBy))
		{
			str = "业务员";
		}
		
		str += "年度";

		if (VDispatchCustInvYoySearchCondition.BILL_TYPE_SALE.equalsIgnoreCase(billType))
		{
			str += "订单";
		}
		if (VDispatchCustInvYoySearchCondition.BILL_TYPE_DISPATH.equalsIgnoreCase(billType))
		{
			str += "发货";
		}
		return str + "同环比（单位:万元）";
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
		pros.put("year_01_inatsum", "year_01_inatsum");
		pros.put("year_02_inatsum", "year_02_inatsum");
		pros.put("year_03_inatsum", "year_03_inatsum");
		pros.put("year_04_inatsum", "year_04_inatsum");
		pros.put("year_05_inatsum", "year_05_inatsum");
		pros.put("year_06_inatsum", "year_06_inatsum");
		pros.put("year_07_inatsum", "year_07_inatsum");
		pros.put("year_08_inatsum", "year_08_inatsum");
		pros.put("year_09_inatsum", "year_09_inatsum");
		pros.put("year_10_inatsum", "year_10_inatsum");
		pros.put("year_11_inatsum", "year_11_inatsum");
		pros.put("year_inatsum", "year_inatsum");
		pros.put("year_01_inatsum_yoy", "year_01_inatsum_yoy");
		pros.put("year_02_inatsum_yoy", "year_02_inatsum_yoy");
		pros.put("year_03_inatsum_yoy", "year_03_inatsum_yoy");
		pros.put("year_04_inatsum_yoy", "year_04_inatsum_yoy");
		pros.put("year_05_inatsum_yoy", "year_05_inatsum_yoy");
		pros.put("year_06_inatsum_yoy", "year_06_inatsum_yoy");
		pros.put("year_07_inatsum_yoy", "year_07_inatsum_yoy");
		pros.put("year_08_inatsum_yoy", "year_08_inatsum_yoy");
		pros.put("year_09_inatsum_yoy", "year_09_inatsum_yoy");
		pros.put("year_10_inatsum_yoy", "year_10_inatsum_yoy");
		return pros;
	}

	public String getIyear()
	{
		return iyear;
	}

	public void setIyear(String iyear)
	{
		this.iyear = iyear;
	}

	public String getCinvcode()
	{
		return cinvcode;
	}

	public void setCinvcode(String cinvcode)
	{
		this.cinvcode = cinvcode;
	}

	public Double getYear_01_inatsum()
	{
		return year_01_inatsum;
	}

	public void setYear_01_inatsum(Double year_01_inatsum)
	{
		this.year_01_inatsum = year_01_inatsum;
	}

	public Double getYear_02_inatsum()
	{
		return year_02_inatsum;
	}

	public void setYear_02_inatsum(Double year_02_inatsum)
	{
		this.year_02_inatsum = year_02_inatsum;
	}

	public Double getYear_03_inatsum()
	{
		return year_03_inatsum;
	}

	public void setYear_03_inatsum(Double year_03_inatsum)
	{
		this.year_03_inatsum = year_03_inatsum;
	}

	public Double getYear_04_inatsum()
	{
		return year_04_inatsum;
	}

	public void setYear_04_inatsum(Double year_04_inatsum)
	{
		this.year_04_inatsum = year_04_inatsum;
	}

	public Double getYear_05_inatsum()
	{
		return year_05_inatsum;
	}

	public void setYear_05_inatsum(Double year_05_inatsum)
	{
		this.year_05_inatsum = year_05_inatsum;
	}

	public Double getYear_06_inatsum()
	{
		return year_06_inatsum;
	}

	public void setYear_06_inatsum(Double year_06_inatsum)
	{
		this.year_06_inatsum = year_06_inatsum;
	}

	public Double getYear_07_inatsum()
	{
		return year_07_inatsum;
	}

	public void setYear_07_inatsum(Double year_07_inatsum)
	{
		this.year_07_inatsum = year_07_inatsum;
	}

	public Double getYear_08_inatsum()
	{
		return year_08_inatsum;
	}

	public void setYear_08_inatsum(Double year_08_inatsum)
	{
		this.year_08_inatsum = year_08_inatsum;
	}

	public Double getYear_09_inatsum()
	{
		return year_09_inatsum;
	}

	public void setYear_09_inatsum(Double year_09_inatsum)
	{
		this.year_09_inatsum = year_09_inatsum;
	}

	public Double getYear_10_inatsum()
	{
		return year_10_inatsum;
	}

	public void setYear_10_inatsum(Double year_10_inatsum)
	{
		this.year_10_inatsum = year_10_inatsum;
	}

	public Double getYear_11_inatsum()
	{
		return year_11_inatsum;
	}

	public void setYear_11_inatsum(Double year_11_inatsum)
	{
		this.year_11_inatsum = year_11_inatsum;
	}

	public Double getYear_inatsum()
	{
		return year_inatsum;
	}

	public void setYear_inatsum(Double year_inatsum)
	{
		this.year_inatsum = year_inatsum;
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

	public Double getYear_01_inatsum_yoy()
	{
		return year_01_inatsum_yoy;
	}

	public void setYear_01_inatsum_yoy(Double year_01_inatsum_yoy)
	{
		this.year_01_inatsum_yoy = year_01_inatsum_yoy;
	}

	public Double getYear_02_inatsum_yoy()
	{
		return year_02_inatsum_yoy;
	}

	public void setYear_02_inatsum_yoy(Double year_02_inatsum_yoy)
	{
		this.year_02_inatsum_yoy = year_02_inatsum_yoy;
	}

	public Double getYear_03_inatsum_yoy()
	{
		return year_03_inatsum_yoy;
	}

	public void setYear_03_inatsum_yoy(Double year_03_inatsum_yoy)
	{
		this.year_03_inatsum_yoy = year_03_inatsum_yoy;
	}

	public Double getYear_04_inatsum_yoy()
	{
		return year_04_inatsum_yoy;
	}

	public void setYear_04_inatsum_yoy(Double year_04_inatsum_yoy)
	{
		this.year_04_inatsum_yoy = year_04_inatsum_yoy;
	}

	public Double getYear_05_inatsum_yoy()
	{
		return year_05_inatsum_yoy;
	}

	public void setYear_05_inatsum_yoy(Double year_05_inatsum_yoy)
	{
		this.year_05_inatsum_yoy = year_05_inatsum_yoy;
	}

	public Double getYear_06_inatsum_yoy()
	{
		return year_06_inatsum_yoy;
	}

	public void setYear_06_inatsum_yoy(Double year_06_inatsum_yoy)
	{
		this.year_06_inatsum_yoy = year_06_inatsum_yoy;
	}

	public Double getYear_07_inatsum_yoy()
	{
		return year_07_inatsum_yoy;
	}

	public void setYear_07_inatsum_yoy(Double year_07_inatsum_yoy)
	{
		this.year_07_inatsum_yoy = year_07_inatsum_yoy;
	}

	public Double getYear_08_inatsum_yoy()
	{
		return year_08_inatsum_yoy;
	}

	public void setYear_08_inatsum_yoy(Double year_08_inatsum_yoy)
	{
		this.year_08_inatsum_yoy = year_08_inatsum_yoy;
	}

	public Double getYear_09_inatsum_yoy()
	{
		return year_09_inatsum_yoy;
	}

	public void setYear_09_inatsum_yoy(Double year_09_inatsum_yoy)
	{
		this.year_09_inatsum_yoy = year_09_inatsum_yoy;
	}

	public Double getYear_10_inatsum_yoy()
	{
		return year_10_inatsum_yoy;
	}

	public void setYear_10_inatsum_yoy(Double year_10_inatsum_yoy)
	{
		this.year_10_inatsum_yoy = year_10_inatsum_yoy;
	}

	public Double getYear_00_inatsum()
	{
		return year_00_inatsum;
	}

	public void setYear_00_inatsum(Double year_00_inatsum)
	{
		this.year_00_inatsum = year_00_inatsum;
	}

	public Double getYear_00_inatsum_yoy()
	{
		return year_00_inatsum_yoy;
	}

	public void setYear_00_inatsum_yoy(Double year_00_inatsum_yoy)
	{
		this.year_00_inatsum_yoy = year_00_inatsum_yoy;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
