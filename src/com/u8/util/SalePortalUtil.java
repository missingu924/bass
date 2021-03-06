package com.u8.util;

import java.util.Date;

import org.apache.log4j.Logger;

import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.TimeUtil;

public class SalePortalUtil
{
	private static Logger logger = Logger.getLogger(SalePortalUtil.class);

	public static final String VALUE_TYPE_ISUM = "VALUE_TYPE_ISUM";
	public static final String VALUE_TYPE_CUSTOMER_COUNT = "VALUE_TYPE_CUSTOMER_COUNT";
	public static final String VALUE_TYPE_INVENTORY_COUNT = "VALUE_TYPE_INVENTORY_COUNT";
	public static final String VALUE_TYPE_PERSON_COUNT = "VALUE_TYPE_PERSON_COUNT";

	public static String getRecentMonthSql4isum(String iYear, String iMonth, int recentMonths, String invcode, String custcode, String personcode)
	{
		return getRecentMonthSql(iYear, iMonth, recentMonths, invcode, custcode, personcode, VALUE_TYPE_ISUM);
	}

	public static String getRecentMonthSql4invcount(String iYear, String iMonth, int recentMonths, String invcode, String custcode, String personcode)
	{
		return getRecentMonthSql(iYear, iMonth, recentMonths, invcode, custcode, personcode, VALUE_TYPE_INVENTORY_COUNT);
	}

	public static String getRecentMonthSql4custcount(String iYear, String iMonth, int recentMonths, String invcode, String custcode, String personcode)
	{
		return getRecentMonthSql(iYear, iMonth, recentMonths, invcode, custcode, personcode, VALUE_TYPE_CUSTOMER_COUNT);
	}

	public static String getRecentMonthSql4personcount(String iYear, String iMonth, int recentMonths, String invcode, String custcode, String personcode)
	{
		return getRecentMonthSql(iYear, iMonth, recentMonths, invcode, custcode, personcode, VALUE_TYPE_PERSON_COUNT);
	}

	private static String getRecentMonthSql(String iYear, String iMonth, int recentMonths, String invcode, String custcode, String personcode, String valueType)
	{
		logger.info("==========近" + recentMonths + "个月订单情况==========");

		StringBuffer sql = new StringBuffer();

		Date day = TimeUtil.getTheLastDayOfTheMonth(Integer.parseInt(iYear), Integer.parseInt(iMonth));

		String endTime = TimeUtil.date2str(day, "yyyy-MM-dd 23:59:59");

		sql.append(" select \n");
		sql.append(" top " + recentMonths + " \n");
		sql.append(" t1.id, \n");
		sql.append(" t1.iYear, \n");
		sql.append(" t1.iMonth, \n");
		sql.append(" t1.name, \n");
		sql.append(" t2.name name1, \n");
		if (VALUE_TYPE_ISUM.equalsIgnoreCase(valueType))
		{
			sql.append(" isnull(t1.iSum,0) value, \n");
			sql.append(" isnull(t2.iSum,0) value1 \n");
		}
		if (VALUE_TYPE_CUSTOMER_COUNT.equalsIgnoreCase(valueType))
		{
			sql.append(" isnull(t1.iCusCount,0) value, \n");
			sql.append(" isnull(t2.iCusCount,0) value1 \n");
		}
		if (VALUE_TYPE_INVENTORY_COUNT.equalsIgnoreCase(valueType))
		{
			sql.append(" isnull(t1.iInvCount,0) value, \n");
			sql.append(" isnull(t2.iInvCount,0) value1 \n");
		}
		if (VALUE_TYPE_PERSON_COUNT.equalsIgnoreCase(valueType))
		{
			sql.append(" isnull(t1.iSum,0) value, \n");
			sql.append(" isnull(t2.iSum,0) value1 \n");
		}
		sql.append(" from \n");
		sql.append(" ( \n");
		sql.append(" select  \n");
		sql.append(" iYear id,  \n");
		sql.append(" iYear, \n");
		sql.append(" iMonth, \n");
		sql.append(" cast(iYear as varchar)+'/'+cast(iMonth as varchar) name,  \n");
		sql.append(" isnull(round(sum(dl.iNatSum)/10000,1),0) iSum,  \n");
		sql.append(" isnull(count(distinct ccuscode),0) iCusCount,  \n");
		sql.append(" isnull(count(distinct cinvcode),0) iInvCount,  \n");
		sql.append(" isnull(count(distinct cpersoncode),0) iPersonCount  \n");
		sql.append(" from  \n");
		sql.append(" (  \n");
		sql.append(" 	select   \n");
		sql.append(" 	year(dl.dDate) iYear,  \n");
		sql.append(" 	datename(month,dl.dDate) iMonth,  \n");
		sql.append(" 	dls.iNatSum,cCusCode,cInvCode,cPersonCode  \n");
		sql.append(" 	from   \n");
		sql.append(" 	So_SoMain dl  \n");
		sql.append(" 	left join  \n");
		sql.append(" 	So_SoDetails dls  \n");
		sql.append(" 	on dl.cSoCode=dls.cSoCode  \n");
		sql.append(" 	where 1=1 \n");
		sql.append(" 	and dDate>=DATEADD(m,-" + recentMonths + ",'" + endTime + "') \n");
		sql.append(" 	and dDate<='" + endTime + "' \n");
		if (!StringUtil.isEmpty(invcode))
		{
			sql.append(" 	and cinvcode='" + invcode + "' \n");
		}
		if (!StringUtil.isEmpty(custcode))
		{
			sql.append(" 	and ccuscode='" + custcode + "' \n");
		}
		if (!StringUtil.isEmpty(personcode))
		{
			sql.append(" 	and cpersoncode='" + personcode + "' \n");
		}
		sql.append(" ) dl  \n");
		sql.append(" group by  \n");
		sql.append(" iYear,  \n");
		sql.append(" iMonth  \n");
		sql.append(" ) t1 \n");
		sql.append(" left join \n");
		sql.append(" ( \n");
		sql.append(" select  \n");
		sql.append(" iYear id,  \n");
		sql.append(" iYear, \n");
		sql.append(" iMonth, \n");
		sql.append(" cast(iYear as varchar)+'/'+cast(iMonth as varchar) name,  \n");
		sql.append(" isnull(round(sum(dl.iNatSum)/10000,1),0) iSum,  \n");
		sql.append(" isnull(count(distinct ccuscode),0) iCusCount,  \n");
		sql.append(" isnull(count(distinct cinvcode),0) iInvCount,  \n");
		sql.append(" isnull(count(distinct cpersoncode),0) iPersonCount  \n");
		sql.append(" from  \n");
		sql.append(" (  \n");
		sql.append(" 	select   \n");
		sql.append(" 	year(dl.dDate) iYear,  \n");
		sql.append(" 	datename(month,dl.dDate) iMonth,  \n");
		sql.append(" 	dls.iNatSum,cCusCode,cInvCode,cPersonCode  \n");
		sql.append(" 	from   \n");
		sql.append(" 	So_SoMain dl  \n");
		sql.append(" 	left join  \n");
		sql.append(" 	So_SoDetails dls  \n");
		sql.append(" 	on dl.cSoCode=dls.cSoCode  \n");
		sql.append(" 	where 1=1 \n");
		sql.append(" 	and dDate>=DATEADD(m,-2*" + recentMonths + ",'" + endTime + "') \n");
		sql.append(" 	and dDate<='" + endTime + "' \n");
		if (!StringUtil.isEmpty(invcode))
		{
			sql.append(" 	and cinvcode='" + invcode + "' \n");
		}
		if (!StringUtil.isEmpty(custcode))
		{
			sql.append(" 	and ccuscode='" + custcode + "' \n");
		}
		if (!StringUtil.isEmpty(personcode))
		{
			sql.append(" 	and cpersoncode='" + personcode + "' \n");
		}
		sql.append(" ) dl  \n");
		sql.append(" group by  \n");
		sql.append(" iYear,  \n");
		sql.append(" iMonth  \n");
		sql.append(" ) t2 \n");
		sql.append(" on t1.iYear=t2.iYear+1 and t1.iMonth=t2.iMonth \n");
		sql.append(" order by t1.iYear ,t1.iMonth  \n");

		return sql.toString();
	}

	public static String getRecentMonthAvgPriceSql(String iYear, String iMonth, int recentMonths, String invcode)
	{
		logger.info("==========近" + recentMonths + "个月平均订单单价==========");

		StringBuffer sql = new StringBuffer();

		Date day = TimeUtil.getTheLastDayOfTheMonth(Integer.parseInt(iYear), Integer.parseInt(iMonth));

		String endTime = TimeUtil.date2str(day, "yyyy-MM-dd 23:59:59");

		sql.append(" select \n");
		sql.append(" top " + recentMonths + " \n");
		sql.append(" t1.id, \n");
		sql.append(" t1.iYear, \n");
		sql.append(" t1.iMonth, \n");
		sql.append(" t1.name, \n");
		sql.append(" isnull(t1.value,0) value, \n");
		sql.append(" t2.name name10, \n");
		sql.append(" isnull(t2.value,0) value10 \n");
		sql.append(" from \n");
		sql.append(" ( \n");
		sql.append(" select  \n");
		sql.append(" iYear id,  \n");
		sql.append(" iYear, \n");
		sql.append(" iMonth, \n");
		sql.append(" cast(iYear as varchar)+'/'+cast(iMonth as varchar) name,  \n");
		sql.append(" isnull(round(sum(dl.iNatSum)/sum(dl.iQuantity),1),0) value  \n");
		sql.append(" from  \n");
		sql.append(" (  \n");
		sql.append(" 	select   \n");
		sql.append(" 	year(dl.dDate) iYear,  \n");
		sql.append(" 	datename(month,dl.dDate) iMonth,  \n");
		sql.append(" 	dls.iNatSum, dls.iquantity  \n");
		sql.append(" 	from   \n");
		sql.append(" 	So_SoMain dl  \n");
		sql.append(" 	left join  \n");
		sql.append(" 	So_SoDetails dls  \n");
		sql.append(" 	on dl.cSoCode=dls.cSoCode  \n");
		sql.append(" 	where 1=1 \n");
		sql.append(" 	and dDate>=DATEADD(m,-" + recentMonths + ",'" + endTime + "') \n");
		sql.append(" 	and dDate<='" + endTime + "' \n");
		sql.append(" 	and cinvcode='" + invcode + "' \n");
		sql.append(" ) dl  \n");
		sql.append(" group by  \n");
		sql.append(" iYear,  \n");
		sql.append(" iMonth  \n");
		sql.append(" ) t1 \n");
		sql.append(" left join \n");
		sql.append(" ( \n");
		sql.append(" select  \n");
		sql.append(" iYear id,  \n");
		sql.append(" iYear, \n");
		sql.append(" iMonth, \n");
		sql.append(" cast(iYear as varchar)+'/'+cast(iMonth as varchar) name,  \n");
		sql.append(" isnull(round(sum(dl.iNatSum)/sum(dl.iQuantity),1),0) value  \n");
		sql.append(" from  \n");
		sql.append(" (  \n");
		sql.append(" 	select   \n");
		sql.append(" 	year(dl.dDate) iYear,  \n");
		sql.append(" 	datename(month,dl.dDate) iMonth,  \n");
		sql.append(" 	dls.iNatSum, dls.iquantity  \n");
		sql.append(" 	from   \n");
		sql.append(" 	So_SoMain dl  \n");
		sql.append(" 	left join  \n");
		sql.append(" 	So_SoDetails dls  \n");
		sql.append(" 	on dl.cSoCode=dls.cSoCode  \n");
		sql.append(" 	where 1=1 \n");
		sql.append(" 	and dDate>=DATEADD(m,-2*" + recentMonths + ",'" + endTime + "') \n");
		sql.append(" 	and dDate<='" + endTime + "' \n");
		sql.append(" 	and cinvcode='" + invcode + "' \n");
		sql.append(" ) dl  \n");
		sql.append(" group by  \n");
		sql.append(" iYear,  \n");
		sql.append(" iMonth  \n");
		sql.append(" ) t2 \n");
		sql.append(" on t1.iYear=t2.iYear+1 and t1.iMonth=t2.iMonth \n");
		sql.append(" order by t1.iYear ,t1.iMonth  \n");

		return sql.toString();
	}

	public static String getRecentYearSql(String iYear, int recentYears)
	{
		logger.info("==========近" + recentYears + "年订单情况==========");

		StringBuffer sql = new StringBuffer();

		Date day = TimeUtil.getTheLastDayOfTheMonth(Integer.parseInt(iYear), 12);

		String endTime = TimeUtil.date2str(day, "yyyy-MM-dd 23:59:59");

		sql.append(" select \n");
		sql.append(" top " + recentYears + " \n");
		sql.append(" iYear id,  \n");
		sql.append(" iYear, \n");
		sql.append(" iYear name, \n");
		sql.append(" round(sum(dl.iNatSum)/10000,1) value  \n");
		sql.append(" from  \n");
		sql.append(" (  \n");
		sql.append(" 	select   \n");
		sql.append(" 	year(dl.dDate) iYear,  \n");
		sql.append(" 	dls.iNatSum  \n");
		sql.append(" 	from   \n");
		sql.append(" 	So_SoMain dl  \n");
		sql.append(" 	left join  \n");
		sql.append(" 	So_SoDetails dls  \n");
		sql.append(" 	on dl.cSoCode=dls.cSoCode  \n");
		sql.append(" 	where 1=1 \n");
		sql.append(" 	and dDate>=DATEADD(yyyy,-" + recentYears + ",'" + endTime + "') \n");
		sql.append(" 	and dDate<='" + endTime + "' \n");
		sql.append(" ) dl  \n");
		sql.append(" group by  \n");
		sql.append(" iYear  \n");
		sql.append(" order by iYear  \n");

		return sql.toString();
	}
	
	public static String getRecentYearSql(String iYear, int recentYears,String invcode, String custcode, String personcode)
	{
		logger.info("==========近" + recentYears + "年发货情况==========");

		StringBuffer sql = new StringBuffer();

		Date day = TimeUtil.getTheLastDayOfTheMonth(Integer.parseInt(iYear), 12);

		String endTime = TimeUtil.date2str(day, "yyyy-MM-dd 23:59:59");

		sql.append(" select \n");
		sql.append(" top " + recentYears + " \n");
		sql.append(" iYear id,  \n");
		sql.append(" iYear, \n");
		sql.append(" iYear name, \n");
		sql.append(" round(sum(dl.iNatSum)/10000,1) value  \n");
		sql.append(" from  \n");
		sql.append(" (  \n");
		sql.append(" 	select   \n");
		sql.append(" 	year(dl.dDate) iYear,  \n");
		sql.append(" 	dls.iNatSum  \n");
		sql.append(" 	from   \n");
		sql.append(" 	So_SoMain dl \n");
		sql.append(" 	left join \n");
		sql.append(" 	So_SoDetails dls \n");
		sql.append(" 	on dl.cSoCode=dls.cSoCode \n");
		sql.append(" 	where 1=1 \n");
		sql.append(" 	and dDate>=DATEADD(yyyy,-" + recentYears + ",'" + endTime + "') \n");
		sql.append(" 	and dDate<='" + endTime + "' \n");
		if (!StringUtil.isEmpty(invcode))
		{
			sql.append(" 	and cinvcode='" + invcode + "' \n");
		}
		if (!StringUtil.isEmpty(custcode))
		{
			sql.append(" 	and ccuscode='" + custcode + "' \n");
		}
		if (!StringUtil.isEmpty(personcode))
		{
			sql.append(" 	and cpersoncode='" + personcode + "' \n");
		}
		sql.append(" ) dl  \n");
		sql.append(" group by  \n");
		sql.append(" iYear  \n");
		sql.append(" order by iYear  \n");

		return sql.toString();
	}


	public static String getTopnCustomerSql(String startTime, String endTime, int topn)
	{
		logger.info("==========TopN客户订单情况==========");

		StringBuffer sql = new StringBuffer();
		sql.append(" select \n");
		sql.append(" top " + topn + " \n");
		sql.append(" 1 id, \n");
		sql.append(" cust.ccuscode code, \n");
		sql.append(" cust.cCusName name, \n");
		sql.append(" round(dl.iNatSum/10000,4) value \n");
		sql.append(" from \n");
		sql.append(" ( \n");
		sql.append(" 	select  \n");
		sql.append(" 	dl.cCusCode, \n");
		sql.append(" 	COUNT(*) iCount, \n");
		sql.append(" 	sum(dls.iQuantity) iQuantity, \n");
		sql.append(" 	sum(dls.iNatSum) iNatSum \n");
		sql.append(" 	from  \n");
		sql.append(" 	So_SoMain dl \n");
		sql.append(" 	left join \n");
		sql.append(" 	So_SoDetails dls \n");
		sql.append(" 	on dl.cSoCode=dls.cSoCode \n");
		sql.append(" 	where \n");
		sql.append(" 	dl.cCusCode is not null \n");
		sql.append(" 	and  \n");
		sql.append(" 	dDate>='" + startTime + "' and dDate<='" + endTime + "' \n");
		sql.append(" 	group by \n");
		sql.append(" 	dl.cCusCode \n");
		sql.append(" ) dl \n");
		sql.append(" left join \n");
		sql.append(" Customer cust \n");
		sql.append(" on dl.cCusCode=cust.cCusCode \n");
		sql.append(" order by iNatSum desc \n");

		return sql.toString();
	}

	public static String getTopnInventorySql(String startTime, String endTime, int topn)
	{
		logger.info("==========TopN产品订单情况==========");

		StringBuffer sql = new StringBuffer();
		sql.append(" select \n");
		sql.append(" top " + topn + " \n");
		sql.append(" 0 id, \n");
		sql.append(" inv.cinvcode code, \n");
		sql.append(" inv.cInvName name, \n");
		sql.append(" round(dl.iNatSum/10000,4) value \n");
		sql.append(" from \n");
		sql.append(" ( \n");
		sql.append(" 	select  \n");
		sql.append(" 	dls.cInvCode, \n");
		sql.append(" 	COUNT(*) iCount, \n");
		sql.append(" 	sum(dls.iQuantity) iQuantity, \n");
		sql.append(" 	sum(dls.iNatSum) iNatSum \n");
		sql.append(" 	from  \n");
		sql.append(" 	So_SoMain dl \n");
		sql.append(" 	left join \n");
		sql.append(" 	So_SoDetails dls \n");
		sql.append(" 	on dl.cSoCode=dls.cSoCode \n");
		sql.append(" 	where \n");
		sql.append(" 	dls.cInvCode is not null \n");
		sql.append(" 	and  \n");
		sql.append(" 	dDate>='" + startTime + "' and dDate<='" + endTime + "' \n");
		sql.append(" 	group by \n");
		sql.append(" 	dls.cInvCode \n");
		sql.append(" ) dl \n");
		sql.append(" left join \n");
		sql.append(" inventory inv \n");
		sql.append(" on dl.cInvCode=inv.cInvCode \n");
		sql.append(" order by iNatSum desc \n");

		return sql.toString();
	}

	public static String getTopnPersonSql(String startTime, String endTime, int topn)
	{
		logger.info("==========TopN业务员订单情况==========");

		StringBuffer sql = new StringBuffer();
		sql.append("select \n");
		sql.append("top 10 \n");
		sql.append("1 id, \n");
		sql.append("dl.cpersoncode code, \n");
		sql.append("isnull(p.cPersonName,'其他') name, \n");
		sql.append("round(dl.iNatSum/10000,4) value \n");
		sql.append("from \n");
		sql.append("( \n");
		sql.append("		select  \n");
		sql.append("		dl.cPersonCode, \n");
		sql.append("		COUNT(*) iCount, \n");
		sql.append("		sum(dls.iQuantity) iQuantity, \n");
		sql.append("		sum(dls.iNatSum) iNatSum \n");
		sql.append("		from  \n");
		sql.append("		So_SoMain dl \n");
		sql.append("		left join \n");
		sql.append("		So_SoDetails dls \n");
		sql.append("		on dl.cSoCode=dls.cSoCode \n");
		sql.append("		where \n");
		sql.append("		1=1 -- and dl.cPersonCode is not null \n");
		sql.append("		and  \n");
		sql.append(" 	dDate>='" + startTime + "' and dDate<='" + endTime + "' \n");
		sql.append("	group by \n");
		sql.append("	dl.cPersonCode \n");
		sql.append(") dl \n");
		sql.append("left join \n");
		sql.append("Person p \n");
		sql.append("on dl.cPersonCode=p.cPersonCode \n");
		sql.append("order by iNatSum desc \n");

		return sql.toString();
	}
}
