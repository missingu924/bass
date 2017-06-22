package com.bass.searchcondition;

import com.wuyg.common.obj.BaseSearchCondition;
import java.sql.Timestamp;

public class StRepKctzSumSearchCondition extends BaseSearchCondition
{
	private Double isafenum_min;
	private Double isafenum_max;
	private Double itopsum_min;
	private Double itopsum_max;
	private Double ilowsum_min;
	private Double ilowsum_max;
	private Double ibeginqtty_min;
	private Double ibeginqtty_max;
	private Double ibeginnum_min;
	private Double ibeginnum_max;

	private Timestamp ddate_min;
	private Timestamp ddate_max;
	private String cinvcode_min;
	private String cinvcode_max;
	private String cwhcode;
	private String reCalc;// 是否重新计算
	private String clear;// 清空上次计算结果

	public Double getIsafenum_min()
	{
		return isafenum_min;
	}

	public void setIsafenum_min(Double isafenum_min)
	{
		this.isafenum_min = isafenum_min;
	}

	public Double getIsafenum_max()
	{
		return isafenum_max;
	}

	public void setIsafenum_max(Double isafenum_max)
	{
		this.isafenum_max = isafenum_max;
	}

	public Double getItopsum_min()
	{
		return itopsum_min;
	}

	public void setItopsum_min(Double itopsum_min)
	{
		this.itopsum_min = itopsum_min;
	}

	public Double getItopsum_max()
	{
		return itopsum_max;
	}

	public void setItopsum_max(Double itopsum_max)
	{
		this.itopsum_max = itopsum_max;
	}

	public Double getIlowsum_min()
	{
		return ilowsum_min;
	}

	public void setIlowsum_min(Double ilowsum_min)
	{
		this.ilowsum_min = ilowsum_min;
	}

	public Double getIlowsum_max()
	{
		return ilowsum_max;
	}

	public void setIlowsum_max(Double ilowsum_max)
	{
		this.ilowsum_max = ilowsum_max;
	}

	public Double getIbeginqtty_min()
	{
		return ibeginqtty_min;
	}

	public void setIbeginqtty_min(Double ibeginqtty_min)
	{
		this.ibeginqtty_min = ibeginqtty_min;
	}

	public Double getIbeginqtty_max()
	{
		return ibeginqtty_max;
	}

	public void setIbeginqtty_max(Double ibeginqtty_max)
	{
		this.ibeginqtty_max = ibeginqtty_max;
	}

	public Double getIbeginnum_min()
	{
		return ibeginnum_min;
	}

	public void setIbeginnum_min(Double ibeginnum_min)
	{
		this.ibeginnum_min = ibeginnum_min;
	}

	public Double getIbeginnum_max()
	{
		return ibeginnum_max;
	}

	public void setIbeginnum_max(Double ibeginnum_max)
	{
		this.ibeginnum_max = ibeginnum_max;
	}

	public Timestamp getDdate_min()
	{
		return ddate_min;
	}

	public void setDdate_min(Timestamp ddate_min)
	{
		this.ddate_min = ddate_min;
	}

	public Timestamp getDdate_max()
	{
		return ddate_max;
	}

	public void setDdate_max(Timestamp ddate_max)
	{
		this.ddate_max = ddate_max;
	}

	public String getCwhcode()
	{
		return cwhcode;
	}

	public void setCwhcode(String cwhcode)
	{
		this.cwhcode = cwhcode;
	}

	public String getReCalc()
	{
		return reCalc;
	}

	public void setReCalc(String reCalc)
	{
		this.reCalc = reCalc;
	}

	public String getClear()
	{
		return clear;
	}

	public void setClear(String clear)
	{
		this.clear = clear;
	}

	public String getCinvcode_min()
	{
		return cinvcode_min;
	}

	public void setCinvcode_min(String cinvcode_min)
	{
		this.cinvcode_min = cinvcode_min;
	}

	public String getCinvcode_max()
	{
		return cinvcode_max;
	}

	public void setCinvcode_max(String cinvcode_max)
	{
		this.cinvcode_max = cinvcode_max;
	}

}