package com.bass.service;

import java.beans.PropertyDescriptor;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.bass.obj.StRepKctzMxObj;
import com.bass.obj.StRepKctzSumObj;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.org.apache.bcel.internal.generic.DALOAD;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.MySqlUtil;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public class StockDetailService
{
	private Logger logger = Logger.getLogger(getClass());

	public void calc(String dbName, String dDate_min, String dDate_max, String cInvCCodes, String cInvCode_min, String cInvCode_max, String cWhCodes, List sumList, List mxList)
	{
		Connection conn = null;

		try
		{
			conn = MySqlUtil.getConnection(dbName);

			Statement stmt = conn.createStatement();

			StringBuffer sql = new StringBuffer();

			try
			{
				sql = new StringBuffer();
				sql.append("  drop table #id \n");
				logger.info(sql.toString() + "\n");
				stmt.execute(sql.toString());

				sql = new StringBuffer();
				sql.append("  drop table #STRepKCTZMX \n");
				logger.info(sql.toString() + "\n");
				stmt.execute(sql.toString());

				sql = new StringBuffer();
				sql.append("  drop table #STRepKCTZMX2 \n");
				logger.info(sql.toString() + "\n");
				stmt.execute(sql.toString());

				sql = new StringBuffer();
				sql.append("  drop table #STRepKCTZSUM \n");
				logger.info(sql.toString() + "\n");
				stmt.execute(sql.toString());
			} catch (Exception e)
			{
			}

			String dDate_min_new = dDate_min.substring(0, 7) + "-01";// 开始时间设置为当月第1天
			String qcDate = dDate_min.substring(0, 4) + "-01-01";// 期初设置为当年第一天

			ResultSet rst = stmt.executeQuery("select top 1 ddate from rdrecord34");
			if (rst.next())
			{
				Timestamp qcDateBefore = rst.getTimestamp("ddate");
				qcDate = TimeUtil.date2str(qcDateBefore.getTime() + 24 * 3600 * 1000, "yyyy-MM-dd");// 加1天
			}

			sql = new StringBuffer();
			sql.append(" select  \n");
			sql.append(" r.id,autoid  into #id  \n");
			sql.append(" from rdrecord01 R  inner join rdrecords01 Rs on r.id =rs.id  \n");
			sql.append(" where   \n");
			sql.append(" ( \n");
			sql.append(" 	( \n");
			sql.append(" 		R.dDate < '" + qcDate + "'  \n");
			sql.append(" 		And IsNull(R.bIsSTQc,0) = 1 \n");
			sql.append(" 	) \n");
			sql.append(" 	 Or  \n");
			sql.append(" 	( \n");
			sql.append(" 		R.dDate >= '" + qcDate + "'  \n");
			sql.append(" 		And IsNull(R.bPUFirst,0) = 0  \n");
			sql.append(" 		And IsNull(R.bIAFirst,0) = 0  \n");
			sql.append(" 		And IsNull(R.bOMFirst,0) = 0  \n");
			sql.append(" 		And (not (R.cBusType = '假退料' and R.cVouchType = 11)) \n");
			sql.append(" 	) \n");
			sql.append(" ) \n");
			if (!StringUtil.isEmpty(dDate_min_new))
			{
				sql.append(" AND  R.ddate >= '" + dDate_min_new + "' \n");
			}
			if (!StringUtil.isEmpty(dDate_max))
			{
				sql.append(" AND  R.ddate <= '" + dDate_max + "' \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  select  \n");
			sql.append("  identity(bigint,1,1) as tmpid,    \n");
			sql.append("  r.id, \n");
			sql.append("  rs.autoid, \n");
			sql.append("  r.cbustype, \n");
			sql.append("  bisstqc, \n");
			sql.append("  r.cvouchtype, \n");
			sql.append("  r.cwhcode, \n");
			sql.append("  rs.cinvcode, \n");
			sql.append("  ddate, \n");
			sql.append("  case when bisstqc=1 then ddate else dVeriDate end as dVeriDate, \n");
			sql.append("  r.brdflag, \n");
			sql.append("  IsNull(R.cBusCode,N'')as cbuscode,   \n");
			sql.append("  Rs.cciqbookcode, \n");
			sql.append("  R.cCode, \n");
			sql.append("  r.cdepcode,  \n");
			sql.append("  r.cpersoncode,  \n");
			sql.append("  R.cHandler,  \n");
			sql.append("  R.cMaker,  \n");
			sql.append("  Rs.cBatch,  \n");
			sql.append("  CONVERT(VARCHAR(10), Rs.dVDate, 102) as dVDate,  \n");
			sql.append("  rs.iExpiratDateCalcu, \n");
			sql.append("  rs.cExpirationDate, \n");
			sql.append("  iquantity, \n");
			sql.append("  inum,  \n");
			sql.append("  r.ccuscode, \n");
			sql.append("  r.cvencode ,   \n");
			sql.append("  r.crdcode,  \n");
			sql.append("  R.cMemo,   \n");
			sql
					.append("  R.cDefine1,R.cDefine2, R.cDefine3, R.cDefine4, R.cDefine5, R.cDefine6, R.cDefine7, R.cDefine8,  R.cDefine9, R.cDefine10, R.cDefine11, R.cDefine12, R.cDefine13, R.cDefine14, R.cDefine15, R.cDefine16, Rs.cDefine22, Rs.cDefine23, Rs.cDefine24, Rs.cDefine25, Rs.cDefine26, Rs.cDefine27,Rs.cDefine28,  Rs.cDefine29, Rs.cDefine30, Rs.cDefine31, Rs.cDefine32, Rs.cDefine33, Rs.cDefine34, Rs.cDefine35, Rs.cDefine36,  Rs.cDefine37,  \n");
			sql.append("  Rs.cBatchProperty1,Rs.cBatchProperty2,Rs.cBatchProperty3,Rs.cBatchProperty4,Rs.cBatchProperty5,Rs.cBatchProperty6,Rs.cBatchProperty7,Rs.cBatchProperty8,Rs.cBatchProperty9,Rs.cBatchProperty10,  \n");
			sql
					.append("  isnull(rs.cfree1,'') as cfree1,  isnull(rs.cfree2,'') as cfree2,  isnull(rs.cfree3,'') as cfree3,  isnull(rs.cfree4,'') as cfree4,  isnull(rs.cfree5,'') as cfree5,  isnull(rs.cfree6,'') as cfree6,  isnull(rs.cfree7,'') as cfree7,  isnull(rs.cfree8,'') as cfree8,  isnull(rs.cfree9,'') as cfree9,  isnull(rs.cfree10,'') as cfree10,   \n");
			sql.append("  rs.cvmivencode,  \n");
			sql.append("  Rs.dCheckDate ,  \n");
			sql.append("  Rs.cCheckCode,  \n");
			sql.append("  rs.cCheckPersonCode ,  \n");
			sql.append("  Rs.cRejectCode,  \n");
			sql.append("  CASE WHEN isnull(RS.dMadeDate,'')='' and RS.iMassDate is null THEN convert(nvarchar(7),RS.dVDate,121) ELSE convert(nvarchar(7),dateadd(month,-1,RS.dVDate),121) end as dValidateDate,  \n");
			sql.append("  Rs.cbmemo, \n");
			sql.append("  rs.isotype, \n");
			sql.append("  rs.csocode, \n");
			sql.append("  rs.isoseq, \n");
			sql.append("  rs.isodid ,  \n");
			sql.append("  convert(nvarchar(100),'') as cMoLotCode, \n");
			sql.append("  convert(nvarchar(200),N'') as cshipaddress  \n");
			sql.append("  into  #STRepKCTZMX2  \n");
			sql.append("  FROM #id ids  \n");
			sql.append("  inner join rdrecord01 R   \n");
			sql.append("  on ids.id =r.id   \n");
			sql.append("  inner join rdrecords01 rs  \n");
			sql.append("  on ids.autoid =rs.autoid    \n");
			sql.append("  WHERE 1=1   \n");
			if (!StringUtil.isEmpty(cInvCCodes))
			{
				sql.append("  AND rs.cinvcode in (select cinvcode from inventory where cInvCCode in (" + cInvCCodes + ")) \n");
			}
			if (!StringUtil.isEmpty(cInvCode_min))
			{
				sql.append("  AND rs.cinvcode>='" + cInvCode_min + "' \n");
			}
			if (!StringUtil.isEmpty(cInvCode_max))
			{
				sql.append("  AND rs.cinvcode<='" + cInvCode_max + "' \n");
			}
			if (!StringUtil.isEmpty(cWhCodes))
			{
				sql.append("  AND r.cwhcode in (" + cWhCodes + ") \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  drop table #id \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  select  \n");
			sql.append("  r.id,autoid   \n");
			sql.append("  into #id  \n");
			sql.append("  from rdrecord08 R inner join rdrecords08 Rs on r.id =rs.id  \n");
			sql.append("  where   \n");
			sql.append("  ( \n");
			sql.append(" 	( \n");
			sql.append(" 		R.dDate < '" + qcDate + "'  \n");
			sql.append(" 		And IsNull(R.bIsSTQc,0) = 1 \n");
			sql.append(" 	) \n");
			sql.append(" 	Or  \n");
			sql.append(" 	(	R.dDate >= '" + qcDate + "' \n");
			sql.append(" 		And IsNull(R.bPUFirst,0) = 0 \n");
			sql.append(" 		And IsNull(R.bIAFirst,0) = 0 \n");
			sql.append(" 		And IsNull(R.bOMFirst,0) = 0 \n");
			sql.append(" 		And (not (R.cBusType = '假退料' and R.cVouchType = 11)) \n");
			sql.append(" 	) \n");
			sql.append(" )  \n");
			sql.append(" and (isnull(R.cBusType,'') not in (N'预留入库',N'预留出库') or bisstqc =1) \n");
			if (!StringUtil.isEmpty(dDate_min_new))
			{
				sql.append(" AND  R.ddate >= '" + dDate_min_new + "' \n");
			}
			if (!StringUtil.isEmpty(dDate_max))
			{
				sql.append(" AND  R.ddate <= '" + dDate_max + "' \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  insert  \n");
			sql.append("  into #STRepKCTZMX2  \n");
			sql.append("  select   \n");
			sql.append("  r.id,rs.autoid,r.cbustype,bisstqc,r.cvouchtype,r.cwhcode,rs.cinvcode,ddate, \n");
			sql.append("  case when bisstqc=1 then ddate else dVeriDate end as dVeriDate, \n");
			sql.append("  r.brdflag, \n");
			sql.append("  IsNull(R.cBusCode,N'')as cbuscode,  Rs.cciqbookcode, \n");
			sql.append("  R.cCode,r.cdepcode, r.cpersoncode, R.cHandler, R.cMaker, Rs.cBatch, CONVERT(VARCHAR(10), Rs.dVDate, 102) as dVDate,  \n");
			sql
					.append("  rs.iExpiratDateCalcu,rs.cExpirationDate,iquantity,inum, r.ccuscode,r.cvencode ,  r.crdcode, R.cMemo,  R.cDefine1,R.cDefine2, R.cDefine3, R.cDefine4, R.cDefine5, R.cDefine6, R.cDefine7, R.cDefine8,  R.cDefine9, R.cDefine10, R.cDefine11, R.cDefine12, R.cDefine13, R.cDefine14, R.cDefine15, R.cDefine16, Rs.cDefine22, Rs.cDefine23, Rs.cDefine24, Rs.cDefine25, Rs.cDefine26, Rs.cDefine27,Rs.cDefine28,  Rs.cDefine29, Rs.cDefine30, Rs.cDefine31, Rs.cDefine32, Rs.cDefine33, Rs.cDefine34, Rs.cDefine35, Rs.cDefine36,  Rs.cDefine37, Rs.cBatchProperty1,Rs.cBatchProperty2,Rs.cBatchProperty3,Rs.cBatchProperty4,Rs.cBatchProperty5,Rs.cBatchProperty6,Rs.cBatchProperty7,Rs.cBatchProperty8,Rs.cBatchProperty9,Rs.cBatchProperty10, isnull(rs.cfree1,'') as cfree1,  isnull(rs.cfree2,'') as cfree2,  isnull(rs.cfree3,'') as cfree3,  isnull(rs.cfree4,'') as cfree4,  isnull(rs.cfree5,'') as cfree5,  isnull(rs.cfree6,'') as cfree6,  isnull(rs.cfree7,'') as cfree7,  isnull(rs.cfree8,'') as cfree8,  isnull(rs.cfree9,'') as cfree9,  isnull(rs.cfree10,'') as cfree10,  rs.cvmivencode, Rs.dCheckDate , Rs.cCheckCode, rs.cCheckPersonCode , Rs.cRejectCode, CASE WHEN isnull(RS.dMadeDate,'')='' and RS.iMassDate is null THEN convert(nvarchar(7),RS.dVDate,121) ELSE convert(nvarchar(7),dateadd(month,-1,RS.dVDate),121) end as dValidateDate, Rs.cbmemo,rs.isotype,rs.csocode,rs.isoseq,rs.isodid , convert(nvarchar(100),'') as cMoLotCode,convert(nvarchar(200),N'') as cshipaddress  \n");
			sql.append("  FROM  \n");
			sql.append("  #id ids  \n");
			sql.append("  inner join rdrecord08 R   \n");
			sql.append("  on ids.id =r.id   \n");
			sql.append("  inner join rdrecords08 rs on ids.autoid =rs.autoid    \n");
			sql.append("  WHERE 1=1   \n");
			if (!StringUtil.isEmpty(cInvCCodes))
			{
				sql.append("  AND rs.cinvcode in (select cinvcode from inventory where cInvCCode in (" + cInvCCodes + ")) \n");
			}
			if (!StringUtil.isEmpty(cInvCode_min))
			{
				sql.append("  AND rs.cinvcode>='" + cInvCode_min + "' \n");
			}
			if (!StringUtil.isEmpty(cInvCode_max))
			{
				sql.append("  AND rs.cinvcode<='" + cInvCode_max + "' \n");
			}
			if (!StringUtil.isEmpty(cWhCodes))
			{
				sql.append("  AND r.cwhcode in (" + cWhCodes + ") \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  drop table #id \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  select  \n");
			sql.append("  r.id,autoid   \n");
			sql.append("  into #id  \n");
			sql.append("  from  \n");
			sql.append("  rdrecord09 R    \n");
			sql.append("  inner join rdrecords09 Rs  \n");
			sql.append("  on r.id =rs.id  \n");
			sql.append("  where   \n");
			sql.append("  ( \n");
			sql.append(" 	( \n");
			sql.append(" 		R.dDate < '" + qcDate + "'  \n");
			sql.append(" 		And IsNull(R.bIsSTQc,0) = 1 \n");
			sql.append(" 	) \n");
			sql.append(" 	Or  \n");
			sql.append(" 	( \n");
			sql.append(" 		R.dDate >= '" + qcDate + "' \n");
			sql.append(" 		 And IsNull(R.bPUFirst,0) = 0 \n");
			sql.append(" 		And IsNull(R.bIAFirst,0) = 0 \n");
			sql.append(" 		And IsNull(R.bOMFirst,0) = 0 \n");
			sql.append(" 		And (not (R.cBusType = '假退料'and R.cVouchType = 11) \n");
			sql.append(" 	) \n");
			sql.append(" ) \n");
			sql.append(" ) and (isnull(R.cBusType,'') not in (N'预留入库',N'预留出库') or bisstqc =1) \n");
			if (!StringUtil.isEmpty(dDate_min_new))
			{
				sql.append(" AND  R.ddate >= '" + dDate_min_new + "' \n");
			}
			if (!StringUtil.isEmpty(dDate_max))
			{
				sql.append(" AND  R.ddate <= '" + dDate_max + "' \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  insert into #STRepKCTZMX2  \n");
			sql.append("  select  r.id,rs.autoid,r.cbustype,bisstqc,r.cvouchtype,r.cwhcode,rs.cinvcode,ddate, \n");
			sql.append("  case when bisstqc=1 then ddate else dVeriDate end as dVeriDate, \n");
			sql.append("  r.brdflag, \n");
			sql.append("   IsNull(R.cBusCode,N'')as cbuscode,  Rs.cciqbookcode, \n");
			sql.append("  R.cCode,r.cdepcode, r.cpersoncode, R.cHandler, R.cMaker, Rs.cBatch, CONVERT(VARCHAR(10), Rs.dVDate, 102) as dVDate,  \n");
			sql
					.append("  rs.iExpiratDateCalcu,rs.cExpirationDate,iquantity,inum, r.ccuscode,r.cvencode ,  r.crdcode, R.cMemo,  R.cDefine1,R.cDefine2, R.cDefine3, R.cDefine4, R.cDefine5, R.cDefine6, R.cDefine7, R.cDefine8,  R.cDefine9, R.cDefine10, R.cDefine11, R.cDefine12, R.cDefine13, R.cDefine14, R.cDefine15, R.cDefine16, Rs.cDefine22, Rs.cDefine23, Rs.cDefine24, Rs.cDefine25, Rs.cDefine26, Rs.cDefine27,Rs.cDefine28,  Rs.cDefine29, Rs.cDefine30, Rs.cDefine31, Rs.cDefine32, Rs.cDefine33, Rs.cDefine34, Rs.cDefine35, Rs.cDefine36,  Rs.cDefine37, Rs.cBatchProperty1,Rs.cBatchProperty2,Rs.cBatchProperty3,Rs.cBatchProperty4,Rs.cBatchProperty5,Rs.cBatchProperty6,Rs.cBatchProperty7,Rs.cBatchProperty8,Rs.cBatchProperty9,Rs.cBatchProperty10, isnull(rs.cfree1,'') as cfree1,  isnull(rs.cfree2,'') as cfree2,  isnull(rs.cfree3,'') as cfree3,  isnull(rs.cfree4,'') as cfree4,  isnull(rs.cfree5,'') as cfree5,  isnull(rs.cfree6,'') as cfree6,  isnull(rs.cfree7,'') as cfree7,  isnull(rs.cfree8,'') as cfree8,  isnull(rs.cfree9,'') as cfree9,  isnull(rs.cfree10,'') as cfree10,  rs.cvmivencode, Rs.dCheckDate , Rs.cCheckCode, rs.cCheckPersonCode , Rs.cRejectCode, CASE WHEN isnull(RS.dMadeDate,'')='' and RS.iMassDate is null THEN convert(nvarchar(7),RS.dVDate,121) ELSE convert(nvarchar(7),dateadd(month,-1,RS.dVDate),121) end as dValidateDate, Rs.cbmemo,rs.isotype,rs.csocode,rs.isoseq,rs.isodid , convert(nvarchar(100),'') as cMoLotCode,R.cshipaddress  \n");
			sql.append("  FROM  \n");
			sql.append("  #id ids  \n");
			sql.append("  inner join rdrecord09 R   \n");
			sql.append("  on ids.id =r.id   \n");
			sql.append("  inner join rdrecords09 rs  \n");
			sql.append("  on ids.autoid =rs.autoid    \n");
			sql.append("  WHERE 1=1   \n");
			if (!StringUtil.isEmpty(cInvCCodes))
			{
				sql.append("  AND rs.cinvcode in (select cinvcode from inventory where cInvCCode in (" + cInvCCodes + ")) \n");
			}
			if (!StringUtil.isEmpty(cInvCode_min))
			{
				sql.append("  AND rs.cinvcode>='" + cInvCode_min + "' \n");
			}
			if (!StringUtil.isEmpty(cInvCode_max))
			{
				sql.append("  AND rs.cinvcode<='" + cInvCode_max + "' \n");
			}
			if (!StringUtil.isEmpty(cWhCodes))
			{
				sql.append("  AND r.cwhcode in (" + cWhCodes + ") \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append(" drop table #id \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append(" select  \n");
			sql.append(" r.id,autoid   \n");
			sql.append(" into #id  \n");
			sql.append(" from rdrecord10 R    \n");
			sql.append(" inner join rdrecords10 Rs on r.id =rs.id  \n");
			sql.append(" where   \n");
			sql.append(" ( \n");
			sql.append(" 	( \n");
			sql.append(" 		R.dDate < '" + qcDate + "'  \n");
			sql.append(" 		And IsNull(R.bIsSTQc,0) = 1 \n");
			sql.append(" 	) \n");
			sql.append(" 	Or  \n");
			sql.append(" 	( \n");
			sql.append(" 		R.dDate >= '" + qcDate + "' \n");
			sql.append(" 		And IsNull(R.bPUFirst,0) = 0 \n");
			sql.append(" 		And IsNull(R.bIAFirst,0) = 0 \n");
			sql.append(" 		And IsNull(R.bOMFirst,0) = 0 \n");
			sql.append(" 		And (not (R.cBusType = '假退料'and R.cVouchType = 11)) \n");
			sql.append(" 	) \n");
			sql.append(" ) \n");
			if (!StringUtil.isEmpty(dDate_min_new))
			{
				sql.append(" AND  R.ddate >= '" + dDate_min_new + "' \n");
			}
			if (!StringUtil.isEmpty(dDate_max))
			{
				sql.append(" AND  R.ddate <= '" + dDate_max + "' \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  insert into #STRepKCTZMX2  \n");
			sql.append("  select  r.id,rs.autoid,r.cbustype,bisstqc,r.cvouchtype,r.cwhcode,rs.cinvcode,ddate, \n");
			sql.append("  case when bisstqc=1 then ddate else dVeriDate end as dVeriDate, \n");
			sql.append("  r.brdflag, \n");
			sql.append("   IsNull(R.cBusCode,N'')as cbuscode,  Rs.cciqbookcode, \n");
			sql.append("  R.cCode,r.cdepcode, r.cpersoncode, R.cHandler, R.cMaker, Rs.cBatch, CONVERT(VARCHAR(10), Rs.dVDate, 102) as dVDate,  \n");
			sql
					.append("  rs.iExpiratDateCalcu,rs.cExpirationDate,iquantity,inum, r.ccuscode,r.cvencode ,  r.crdcode, R.cMemo,  R.cDefine1,R.cDefine2, R.cDefine3, R.cDefine4, R.cDefine5, R.cDefine6, R.cDefine7, R.cDefine8,  R.cDefine9, R.cDefine10, R.cDefine11, R.cDefine12, R.cDefine13, R.cDefine14, R.cDefine15, R.cDefine16, Rs.cDefine22, Rs.cDefine23, Rs.cDefine24, Rs.cDefine25, Rs.cDefine26, Rs.cDefine27,Rs.cDefine28,  Rs.cDefine29, Rs.cDefine30, Rs.cDefine31, Rs.cDefine32, Rs.cDefine33, Rs.cDefine34, Rs.cDefine35, Rs.cDefine36,  Rs.cDefine37, Rs.cBatchProperty1,Rs.cBatchProperty2,Rs.cBatchProperty3,Rs.cBatchProperty4,Rs.cBatchProperty5,Rs.cBatchProperty6,Rs.cBatchProperty7,Rs.cBatchProperty8,Rs.cBatchProperty9,Rs.cBatchProperty10, isnull(rs.cfree1,'') as cfree1,  isnull(rs.cfree2,'') as cfree2,  isnull(rs.cfree3,'') as cfree3,  isnull(rs.cfree4,'') as cfree4,  isnull(rs.cfree5,'') as cfree5,  isnull(rs.cfree6,'') as cfree6,  isnull(rs.cfree7,'') as cfree7,  isnull(rs.cfree8,'') as cfree8,  isnull(rs.cfree9,'') as cfree9,  isnull(rs.cfree10,'') as cfree10,  rs.cvmivencode, Rs.dCheckDate , Rs.cCheckCode, rs.cCheckPersonCode , Rs.cRejectCode, CASE WHEN isnull(RS.dMadeDate,'')='' and RS.iMassDate is null THEN convert(nvarchar(7),RS.dVDate,121) ELSE convert(nvarchar(7),dateadd(month,-1,RS.dVDate),121) end as dValidateDate, Rs.cbmemo,rs.isotype,rs.csocode,rs.isoseq,rs.isodid , rs.cMoLotCode,convert(nvarchar(200),N'') as cshipaddress  \n");
			sql.append("  FROM #id ids  \n");
			sql.append("  inner join rdrecord10 R  on ids.id =r.id   \n");
			sql.append("  inner join rdrecords10 rs on ids.autoid =rs.autoid    \n");
			sql.append("  WHERE 1=1   \n");
			if (!StringUtil.isEmpty(cInvCCodes))
			{
				sql.append("  AND rs.cinvcode in (select cinvcode from inventory where cInvCCode in (" + cInvCCodes + ")) \n");
			}
			if (!StringUtil.isEmpty(cInvCode_min))
			{
				sql.append("  AND rs.cinvcode>='" + cInvCode_min + "' \n");
			}
			if (!StringUtil.isEmpty(cInvCode_max))
			{
				sql.append("  AND rs.cinvcode<='" + cInvCode_max + "' \n");
			}
			if (!StringUtil.isEmpty(cWhCodes))
			{
				sql.append("  AND r.cwhcode in (" + cWhCodes + ") \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  drop table #id \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  select r.id,autoid   \n");
			sql.append("  into #id  \n");
			sql.append("  from rdrecord11 R    \n");
			sql.append("  inner join rdrecords11 Rs on r.id =rs.id  \n");
			sql.append("  where   \n");
			sql.append("  ( \n");
			sql.append(" 	 ( \n");
			sql.append(" 		R.dDate < '" + qcDate + "'  \n");
			sql.append(" 		And IsNull(R.bIsSTQc,0) = 1 \n");
			sql.append(" 	 ) \n");
			sql.append(" 	 Or  \n");
			sql.append(" 	 ( \n");
			sql.append(" 		 R.dDate >= '" + qcDate + "' \n");
			sql.append(" 		 And IsNull(R.bPUFirst,0) = 0 \n");
			sql.append(" 		 And IsNull(R.bIAFirst,0) = 0 \n");
			sql.append(" 		 And IsNull(R.bOMFirst,0) = 0 \n");
			sql.append(" 		 And (not (R.cBusType = '假退料'and R.cVouchType = 11)) \n");
			sql.append(" 	 ) \n");
			sql.append("  ) \n");
			if (!StringUtil.isEmpty(dDate_min_new))
			{
				sql.append(" AND  R.ddate >= '" + dDate_min_new + "' \n");
			}
			if (!StringUtil.isEmpty(dDate_max))
			{
				sql.append(" AND  R.ddate <= '" + dDate_max + "' \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  insert into #STRepKCTZMX2  \n");
			sql.append("  select  r.id,rs.autoid,r.cbustype,bisstqc,r.cvouchtype,r.cwhcode,rs.cinvcode,ddate, \n");
			sql.append("  case when bisstqc=1 then ddate else dVeriDate end as dVeriDate, \n");
			sql.append("  r.brdflag, \n");
			sql.append("   IsNull(R.cBusCode,N'')as cbuscode,  Rs.cciqbookcode, \n");
			sql.append("  R.cCode,r.cdepcode, r.cpersoncode, R.cHandler, R.cMaker, Rs.cBatch, CONVERT(VARCHAR(10), Rs.dVDate, 102) as dVDate,  \n");
			sql
					.append("  rs.iExpiratDateCalcu,rs.cExpirationDate,iquantity,inum, r.ccuscode,r.cvencode ,  r.crdcode, R.cMemo,  R.cDefine1,R.cDefine2, R.cDefine3, R.cDefine4, R.cDefine5, R.cDefine6, R.cDefine7, R.cDefine8,  R.cDefine9, R.cDefine10, R.cDefine11, R.cDefine12, R.cDefine13, R.cDefine14, R.cDefine15, R.cDefine16, Rs.cDefine22, Rs.cDefine23, Rs.cDefine24, Rs.cDefine25, Rs.cDefine26, Rs.cDefine27,Rs.cDefine28,  Rs.cDefine29, Rs.cDefine30, Rs.cDefine31, Rs.cDefine32, Rs.cDefine33, Rs.cDefine34, Rs.cDefine35, Rs.cDefine36,  Rs.cDefine37, Rs.cBatchProperty1,Rs.cBatchProperty2,Rs.cBatchProperty3,Rs.cBatchProperty4,Rs.cBatchProperty5,Rs.cBatchProperty6,Rs.cBatchProperty7,Rs.cBatchProperty8,Rs.cBatchProperty9,Rs.cBatchProperty10, isnull(rs.cfree1,'') as cfree1,  isnull(rs.cfree2,'') as cfree2,  isnull(rs.cfree3,'') as cfree3,  isnull(rs.cfree4,'') as cfree4,  isnull(rs.cfree5,'') as cfree5,  isnull(rs.cfree6,'') as cfree6,  isnull(rs.cfree7,'') as cfree7,  isnull(rs.cfree8,'') as cfree8,  isnull(rs.cfree9,'') as cfree9,  isnull(rs.cfree10,'') as cfree10,  rs.cvmivencode, Rs.dCheckDate , Rs.cCheckCode, rs.cCheckPersonCode , Rs.cRejectCode, CASE WHEN isnull(RS.dMadeDate,'')='' and RS.iMassDate is null THEN convert(nvarchar(7),RS.dVDate,121) ELSE convert(nvarchar(7),dateadd(month,-1,RS.dVDate),121) end as dValidateDate, Rs.cbmemo,rs.isotype,rs.csocode,rs.isoseq,rs.isodid , rs.cMoLotCode,convert(nvarchar(200),N'') as cshipaddress  \n");
			sql.append("  FROM #id ids  \n");
			sql.append("  inner join rdrecord11 R  on ids.id =r.id   \n");
			sql.append("  inner join rdrecords11 rs on ids.autoid =rs.autoid    \n");
			sql.append("  WHERE 1=1   \n");
			if (!StringUtil.isEmpty(cInvCCodes))
			{
				sql.append("  AND rs.cinvcode in (select cinvcode from inventory where cInvCCode in (" + cInvCCodes + ")) \n");
			}
			if (!StringUtil.isEmpty(cInvCode_min))
			{
				sql.append("  AND rs.cinvcode>='" + cInvCode_min + "' \n");
			}
			if (!StringUtil.isEmpty(cInvCode_max))
			{
				sql.append("  AND rs.cinvcode<='" + cInvCode_max + "' \n");
			}
			if (!StringUtil.isEmpty(cWhCodes))
			{
				sql.append("  AND r.cwhcode in (" + cWhCodes + ") \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  drop table #id \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  select  \n");
			sql.append("  r.id,autoid   \n");
			sql.append("  into #id  \n");
			sql.append("  from rdrecord32 R   inner join rdrecords32 Rs on r.id =rs.id where   \n");
			sql.append("  ( \n");
			sql.append(" 	( \n");
			sql.append(" 		 R.dDate < '" + qcDate + "'  \n");
			sql.append(" 		 And IsNull(R.bIsSTQc,0) = 1 \n");
			sql.append(" 	) \n");
			sql.append(" 	Or  \n");
			sql.append(" 	( \n");
			sql.append(" 		R.dDate >= '" + qcDate + "' \n");
			sql.append(" 		And IsNull(R.bPUFirst,0) = 0 \n");
			sql.append(" 		And IsNull(R.bIAFirst,0) = 0 \n");
			sql.append(" 		And IsNull(R.bOMFirst,0) = 0 \n");
			sql.append(" 		And (not (R.cBusType = '假退料'and R.cVouchType = 11)) \n");
			sql.append(" 	) \n");
			sql.append(" ) \n");
			if (!StringUtil.isEmpty(dDate_min_new))
			{
				sql.append(" AND  R.ddate >= '" + dDate_min_new + "' \n");
			}
			if (!StringUtil.isEmpty(dDate_max))
			{
				sql.append(" AND  R.ddate <= '" + dDate_max + "' \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  insert into #STRepKCTZMX2  \n");
			sql.append("  select  \n");
			sql.append("  r.id, \n");
			sql.append("  rs.autoid, \n");
			sql.append("  r.cbustype, \n");
			sql.append("  bisstqc, \n");
			sql.append("  r.cvouchtype, \n");
			sql.append("  r.cwhcode, \n");
			sql.append("  rs.cinvcode, \n");
			sql.append("  ddate, \n");
			sql.append("  case when bisstqc=1 then ddate else dVeriDate end as dVeriDate, \n");
			sql.append("  r.brdflag, \n");
			sql.append("  (case when R.cvouchtype =N'32' and (isnull(R.csource,N'') =N'发货单' or isnull(R.csource,N'') =N'委托代销')  then isnull(Rs.cbdlcode,'') else IsNull(R.cBusCode,N'') end) as cbuscode ,  \n");
			sql.append("  Rs.cciqbookcode, \n");
			sql.append("  R.cCode,r.cdepcode,  \n");
			sql.append("  r.cpersoncode,  \n");
			sql.append("  R.cHandler,  \n");
			sql.append("  R.cMaker,  \n");
			sql.append("  Rs.cBatch,  \n");
			sql.append("  CONVERT(VARCHAR(10), Rs.dVDate, 102) as dVDate,  \n");
			sql.append("  rs.iExpiratDateCalcu, \n");
			sql.append("  rs.cExpirationDate, \n");
			sql.append("  iquantity, \n");
			sql.append("  inum,  \n");
			sql
					.append("  r.ccuscode,r.cvencode ,  r.crdcode, R.cMemo,  R.cDefine1,R.cDefine2, R.cDefine3, R.cDefine4, R.cDefine5, R.cDefine6, R.cDefine7, R.cDefine8,  R.cDefine9, R.cDefine10, R.cDefine11, R.cDefine12, R.cDefine13, R.cDefine14, R.cDefine15, R.cDefine16, Rs.cDefine22, Rs.cDefine23, Rs.cDefine24, Rs.cDefine25, Rs.cDefine26, Rs.cDefine27,Rs.cDefine28,  Rs.cDefine29, Rs.cDefine30, Rs.cDefine31, Rs.cDefine32, Rs.cDefine33, Rs.cDefine34, Rs.cDefine35, Rs.cDefine36,  Rs.cDefine37, Rs.cBatchProperty1,Rs.cBatchProperty2,Rs.cBatchProperty3,Rs.cBatchProperty4,Rs.cBatchProperty5,Rs.cBatchProperty6,Rs.cBatchProperty7,Rs.cBatchProperty8,Rs.cBatchProperty9,Rs.cBatchProperty10, isnull(rs.cfree1,'') as cfree1,  isnull(rs.cfree2,'') as cfree2,  isnull(rs.cfree3,'') as cfree3,  isnull(rs.cfree4,'') as cfree4,  isnull(rs.cfree5,'') as cfree5,  isnull(rs.cfree6,'') as cfree6,  isnull(rs.cfree7,'') as cfree7,  isnull(rs.cfree8,'') as cfree8,  isnull(rs.cfree9,'') as cfree9,  isnull(rs.cfree10,'') as cfree10,  rs.cvmivencode, Rs.dCheckDate , Rs.cCheckCode, rs.cCheckPersonCode , Rs.cRejectCode, CASE WHEN isnull(RS.dMadeDate,'')='' and RS.iMassDate is null THEN convert(nvarchar(7),RS.dVDate,121) ELSE convert(nvarchar(7),dateadd(month,-1,RS.dVDate),121) end as dValidateDate, Rs.cbmemo,rs.isotype,rs.csocode,rs.isoseq,rs.isodid , convert(nvarchar(100),'') as cMoLotCode,R.cshipaddress  \n");
			sql.append("  FROM #id ids  \n");
			sql.append("  inner join rdrecord32 R  on ids.id =r.id   \n");
			sql.append("  inner join rdrecords32 rs on ids.autoid =rs.autoid    \n");
			sql.append("  WHERE 1=1   \n");
			if (!StringUtil.isEmpty(cInvCCodes))
			{
				sql.append("  AND rs.cinvcode in (select cinvcode from inventory where cInvCCode in (" + cInvCCodes + ")) \n");
			}
			if (!StringUtil.isEmpty(cInvCode_min))
			{
				sql.append("  AND rs.cinvcode>='" + cInvCode_min + "' \n");
			}
			if (!StringUtil.isEmpty(cInvCode_max))
			{
				sql.append("  AND rs.cinvcode<='" + cInvCode_max + "' \n");
			}
			if (!StringUtil.isEmpty(cWhCodes))
			{
				sql.append("  AND r.cwhcode in (" + cWhCodes + ") \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  drop table #id \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  select  \n");
			sql.append("  r.id,autoid  into #id  \n");
			sql.append("  from rdrecord34 R   inner join rdrecords34 Rs on r.id =rs.id where  ((R.dDate < '" + qcDate + "' And IsNull(R.bIsSTQc,0) = 1) \n");
			sql.append("  Or (R.dDate >= '" + qcDate + "' \n");
			sql.append("  And IsNull(R.bPUFirst,0) = 0 \n");
			sql.append("  And IsNull(R.bIAFirst,0) = 0 \n");
			sql.append("  And IsNull(R.bOMFirst,0) = 0 \n");
			sql.append("  And (not (R.cBusType = '假退料'and R.cVouchType = 11)) \n");
			sql.append(" ) \n");
			sql.append(" ) and (isnull(R.cBusType,'') not in (N'预留入库',N'预留出库') or bisstqc =1) \n");
			if (!StringUtil.isEmpty(dDate_min_new))
			{
				sql.append(" AND  R.ddate >= '" + dDate_min_new + "' \n");
			}
			if (!StringUtil.isEmpty(dDate_max))
			{
				sql.append(" AND  R.ddate <= '" + dDate_max + "' \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  insert into #STRepKCTZMX2 select  r.id,rs.autoid,r.cbustype,bisstqc,r.cvouchtype,r.cwhcode,rs.cinvcode,ddate, \n");
			sql.append("  case when bisstqc=1 then ddate else dVeriDate end as dVeriDate, \n");
			sql.append("  r.brdflag, \n");
			sql.append("   IsNull(R.cBusCode,N'')as cbuscode,  Rs.cciqbookcode, \n");
			sql.append("  R.cCode,r.cdepcode, r.cpersoncode, R.cHandler, R.cMaker, Rs.cBatch, CONVERT(VARCHAR(10), Rs.dVDate, 102) as dVDate,  \n");
			sql
					.append("  rs.iExpiratDateCalcu,rs.cExpirationDate,iquantity,inum, r.ccuscode,r.cvencode ,  r.crdcode, R.cMemo,  R.cDefine1,R.cDefine2, R.cDefine3, R.cDefine4, R.cDefine5, R.cDefine6, R.cDefine7, R.cDefine8,  R.cDefine9, R.cDefine10, R.cDefine11, R.cDefine12, R.cDefine13, R.cDefine14, R.cDefine15, R.cDefine16, Rs.cDefine22, Rs.cDefine23, Rs.cDefine24, Rs.cDefine25, Rs.cDefine26, Rs.cDefine27,Rs.cDefine28,  Rs.cDefine29, Rs.cDefine30, Rs.cDefine31, Rs.cDefine32, Rs.cDefine33, Rs.cDefine34, Rs.cDefine35, Rs.cDefine36,  Rs.cDefine37, Rs.cBatchProperty1,Rs.cBatchProperty2,Rs.cBatchProperty3,Rs.cBatchProperty4,Rs.cBatchProperty5,Rs.cBatchProperty6,Rs.cBatchProperty7,Rs.cBatchProperty8,Rs.cBatchProperty9,Rs.cBatchProperty10, isnull(rs.cfree1,'') as cfree1,  isnull(rs.cfree2,'') as cfree2,  isnull(rs.cfree3,'') as cfree3,  isnull(rs.cfree4,'') as cfree4,  isnull(rs.cfree5,'') as cfree5,  isnull(rs.cfree6,'') as cfree6,  isnull(rs.cfree7,'') as cfree7,  isnull(rs.cfree8,'') as cfree8,  isnull(rs.cfree9,'') as cfree9,  isnull(rs.cfree10,'') as cfree10,  rs.cvmivencode, Rs.dCheckDate , Rs.cCheckCode, rs.cCheckPersonCode , Rs.cRejectCode, CASE WHEN isnull(RS.dMadeDate,'')='' and RS.iMassDate is null THEN convert(nvarchar(7),RS.dVDate,121) ELSE convert(nvarchar(7),dateadd(month,-1,RS.dVDate),121) end as dValidateDate, Rs.cbmemo,rs.isotype,rs.csocode,rs.isoseq,rs.isodid , convert(nvarchar(100),'') as cMoLotCode,convert(nvarchar(200),N'') as cshipaddress  \n");
			sql.append("  FROM #id ids inner join rdrecord34 R  on ids.id =r.id  inner join rdrecords34 rs on ids.autoid =rs.autoid    \n");
			sql.append("  WHERE 1=1   \n");
			if (!StringUtil.isEmpty(cInvCCodes))
			{
				sql.append("  AND rs.cinvcode in (select cinvcode from inventory where cInvCCode in (" + cInvCCodes + ")) \n");
			}
			if (!StringUtil.isEmpty(cInvCode_min))
			{
				sql.append("  AND rs.cinvcode>='" + cInvCode_min + "' \n");
			}
			if (!StringUtil.isEmpty(cInvCode_max))
			{
				sql.append("  AND rs.cinvcode<='" + cInvCode_max + "' \n");
			}
			if (!StringUtil.isEmpty(cWhCodes))
			{
				sql.append("  AND r.cwhcode in (" + cWhCodes + ") \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql
					.append("  SELECT CONVERT(BIGINT,TMPID) AS TMPID,RS.CINVCODE,RS.CVMIVENCODE, ROUND((CASE WHEN I.IGROUPTYPE =0 THEN NULL WHEN I.IGROUPTYPE = 2 THEN (CASE WHEN RS.IQUANTITY = 0.0 OR RS.INUM = 0.0 THEN NULL ELSE RS.IQUANTITY/RS.INUM END) WHEN I.IGROUPTYPE = 1 THEN CU_G.ICHANGRATE END),2) AS ICHANGRATE, CASE WHEN   RS.DDATE>='"
							+ dDate_min
							+ "' AND ISNULL(BISSTQC,0) =0  THEN 0 ELSE 1 END AS BQC , CASE WHEN RS.BRDFLAG =1 THEN 1 ELSE -1 END *  CASE WHEN   RS.DDATE>='"
							+ dDate_min
							+ "' AND ISNULL(BISSTQC,0) =0  THEN 0 ELSE 1 END * CONVERT(DECIMAL (38, 2), (CASE WHEN I.IGROUPTYPE = 0 THEN 0 WHEN I.IGROUPTYPE = 2 THEN ISNULL(RS.INUM,0)  WHEN I.IGROUPTYPE = 1 THEN RS.IQUANTITY/CU_G.ICHANGRATE END)  ) AS IQCNUM, CASE WHEN RS.BRDFLAG =1 THEN 1 ELSE -1 END *  CASE WHEN   RS.DDATE>='"
							+ dDate_min
							+ "' AND ISNULL(BISSTQC,0) =0  THEN 0 ELSE 1 END * CONVERT(DECIMAL (38, 2),IQUANTITY) AS IQCQTY , CASE WHEN RS.BRDFLAG=1 THEN 1 ELSE 0 END *   CASE WHEN   RS.DDATE>='"
							+ dDate_min
							+ "' AND ISNULL(BISSTQC,0) =0  THEN 1 ELSE 0 END * CONVERT(DECIMAL (38, 2), (CASE WHEN I.IGROUPTYPE = 0 THEN 0 WHEN I.IGROUPTYPE = 2 THEN ISNULL(RS.INUM,0)  WHEN I.IGROUPTYPE = 1 THEN RS.IQUANTITY/CU_G.ICHANGRATE END)  ) AS IINNUM, CASE WHEN RS.BRDFLAG =1 THEN 1 ELSE 0 END *  CASE WHEN   RS.DDATE>='"
							+ dDate_min
							+ "' AND ISNULL(BISSTQC,0) =0  THEN 1 ELSE 0 END * CONVERT(DECIMAL (38, 2),IQUANTITY) AS IINQTTY , CASE WHEN RS.BRDFLAG=1 THEN 0 ELSE 1 END *   CASE WHEN   RS.DDATE>='"
							+ dDate_min
							+ "' AND ISNULL(BISSTQC,0) =0  THEN 1 ELSE 0 END * CONVERT(DECIMAL (38, 2), (CASE WHEN I.IGROUPTYPE = 0 THEN 0 WHEN I.IGROUPTYPE = 2 THEN ISNULL(RS.INUM,0)  WHEN I.IGROUPTYPE = 1 THEN RS.IQUANTITY/CU_G.ICHANGRATE END)  ) AS IOUTNUM, CASE WHEN RS.BRDFLAG =1 THEN 0 ELSE 1 END *  CASE WHEN   RS.DDATE>='"
							+ dDate_min + "' AND ISNULL(BISSTQC,0) =0  THEN 1 ELSE 0 END * CONVERT(DECIMAL (38, 2),IQUANTITY) AS IOUTQTTY ,CSHIPADDRESS  \n");
			sql.append("  INTO #STREPKCTZMX  \n");
			sql.append("  FROM #STREPKCTZMX2 RS   \n");
			sql.append("  INNER JOIN INVENTORY I ON I.CINVCODE =RS.CINVCODE   \n");
			sql.append("  LEFT OUTER JOIN DBO.COMPUTATIONUNIT CU_G ON  I.CSTCOMUNITCODE =CU_G.CCOMUNITCODE  \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  INSERT INTO #STREPKCTZMX (CINVCODE,CVMIVENCODE,ICHANGRATE,BQC,IQCNUM,IQCQTY,IINNUM,IINQTTY,IOUTNUM,IOUTQTTY)  \n");
			sql
					.append("  SELECT A.CINVCODE,A.CVMIVENCODE,ROUND((CASE WHEN I.IGROUPTYPE =0 THEN NULL WHEN I.IGROUPTYPE = 2 THEN (CASE WHEN A.IQUANTITY = 0.0 OR A.INUM = 0.0 THEN NULL ELSE A.IQUANTITY/A.INUM END) WHEN I.IGROUPTYPE = 1 THEN CU_G.ICHANGRATE END),2) AS ICHANGRATE,1 BQC,(CASE WHEN I.IGROUPTYPE = 0 THEN 0 WHEN I.IGROUPTYPE = 2 THEN ISNULL(A.INUM,0)  WHEN I.IGROUPTYPE = 1 THEN A.IQUANTITY/CU_G.ICHANGRATE END)   IQCNUM,IQUANTITY IQCQTY, 0 IINNUM,0 IINQTTY,0 IOUTNUM,0 IOUTQTTY   \n");
			sql.append("  from ST_MonthAccount  a  \n");
			sql.append("  inner  join inventory i on a.cinvcode =i.cinvcode   \n");
			sql.append("  left join vendor v on a.cvmivencode =v.cvencode  \n");
			sql.append("  left join warehouse w on a.cwhcode =w.cwhcode   \n");
			sql.append("  LEFT OUTER JOIN dbo.ComputationUnit CU_G ON  I.cSTComUnitCode =CU_G.cComUnitCode     \n");

			// 单据开始日期的上月
			Date date = TimeUtil.str2date(dDate_min_new, "yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(cal.MONTH, -1);
			sql.append("  where iYear=" + cal.get(cal.YEAR) + " and iMonth=" + (cal.get(cal.MONTH) + 1) + "   \n");

			if (!StringUtil.isEmpty(cInvCCodes))
			{
				sql.append("  AND a.cinvcode in (select cinvcode from inventory where cInvCCode in (" + cInvCCodes + ")) \n");
			}
			if (!StringUtil.isEmpty(cInvCode_min))
			{
				sql.append("  AND a.cinvcode>='" + cInvCode_min + "' \n");
			}
			if (!StringUtil.isEmpty(cInvCode_max))
			{
				sql.append("  AND a.cinvcode<='" + cInvCode_max + "' \n");
			}
			if (!StringUtil.isEmpty(cWhCodes))
			{
				sql.append("  AND a.cwhcode in (" + cWhCodes + ") \n");
			}
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  create index ix_kctzmx12 on #STRepKCTZMX (bqc,cinvcode) \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append("  create index ix_kctzmx1 on #STRepKCTZMX (cinvcode ,tmpid ) \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql
					.append("  select cinvcode,  convert(nvarchar(10), '')  as cvmivencode, convert(nvarchar(10), '')  as cvmivenname, sum(iqcqty) as iBeginQtty,sum(iqcnum) as iBeginNum ,sum(iqcqty)+sum(iInQtty)-sum(iOutQtty) as ijcqty,  sum(iqcnum)+sum(iInnum)-sum(iOutnum) as ijcnum,   sum(case when isnull(iInQtty,0)<>0 or isnull(iInnum,0) <>0  then 1 else 0 end  ) as iActIn,  sum(case when isnull(iOutQtty,0)<>0 or isnull(iOutnum,0) <>0  then 1 else 0 end  ) as iActout  \n");
			sql.append("  into #STRepKCTZSUM   \n");
			sql.append("  from #STRepKCTZMX rs   \n");
			sql.append("  GROUP BY rs.cInvCode \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql.append(" update a set iBeginNum = 0.00   \n");
			sql.append(" from #STRepKCTZSUM a left join inventory i on a.cinvcode = i.cinvcode  \n");
			sql.append(" where   convert(decimal(38,2), isnull(a.iBeginQtty,0)) = 0 and i.igrouptype = 1  \n");
			logger.info(sql.toString() + "\n");
			stmt.execute(sql.toString());

			sql = new StringBuffer();
			sql
					.append(" select i.cinvcode, cvmivencode,cvmivenname,i.cInvName,i.cInvAddCode,i.cInvStd,CU_M.cComUnitName AS cInvM_Unit, CASE WHEN I.iGroupType = 0 THEN NULL  WHEN I.iGrouptype = 2 THEN CU_A.cComUnitName  WHEN I.iGrouptype = 1 THEN CU_G.cComUnitName END  as cInvA_Unit, ic.cInvCCode,IC.cInvCName,I.iSafeNum,I.iTopSum,I.iLowSum,rs.iBeginQtty,rs.iBeginNum    \n");
			sql.append(" from  \n");
			sql.append(" #STRepKCTZSUM rs  \n");
			sql.append(" inner join inventory i on rs.cinvcode =i.cinvcode   \n");
			sql.append(" left join InventoryClass IC ON I.cInvCCode = IC.cInvCCode   \n");
			sql.append(" LEFT OUTER JOIN dbo.ComputationUnit CU_G ON  I.cSTComUnitCode =CU_G.cComUnitCode   \n");
			sql.append(" LEFT OUTER JOIN dbo.ComputationUnit CU_M ON I.cComUnitCode = CU_M.cComunitCode   \n");
			sql.append(" LEFT OUTER JOIN dbo.ComputationUnit CU_A ON I.cAssComUnitCode = CU_A.cComunitCode   \n");
			sql.append(" where 1 = 1 AND  (iActIn>0 or iActout>0)  order by i.cinvname  \n");
			logger.info(sql.toString() + "\n");
			rst = stmt.executeQuery(sql.toString());

			List<PropertyDescriptor> propertyDescriptors = null;
			while (rst.next())
			{
				if (propertyDescriptors == null)
				{
					propertyDescriptors = MyBeanUtils.getPropertyDescriptors(StRepKctzSumObj.class.newInstance(), getSearchMetaData(rst.getMetaData()));
				}

				Object instance = getDomainObjFromResultSet(StRepKctzSumObj.class, rst, propertyDescriptors);

				sumList.add(instance);
			}
			rst.close();

			logger.info(" searched " + sumList.size() + " rows");

			// for (int i = 0; i < sumList.size(); i++)
			// {
			// StRepKctzSumObj o = (StRepKctzSumObj) sumList.get(i);
			// System.out.println(o.getCinvcode() + "\t" + o.getCinvname() + "\t" + o.getIbeginqtty());
			// }

			sql = new StringBuffer();
			String cddh = SystemConstant.U8_DB_01.equalsIgnoreCase(dbName) ? "rs.cdefine13" : "rs.cdefine3";// 出口产品生产订单号，001账套用自定义项13,004账套用自定义项3
			sql
					.append(" SELECT "
							+ (cddh)
							+ "  as cddh, RS.ID,RS.AUTOID,VT.CVOUCHTYPE, MYVOUCH.ENUMNAME AS CVOUCHNAME, RS.CWHCODE, RS.CINVCODE,  DDATE,DVERIDATE, RS.BRDFLAG AS YL,  MYCBUS.ENUMNAME AS CBUSTYPE,  ISNULL(RS.CBUSCODE,N'')AS CBUSCODE , RS.CCODE, DP.CDEPNAME, P1.CPERSONNAME, RS.CHANDLER, RS.CMAKER, RS.CBATCH, CONVERT(VARCHAR(10), RS.DVDATE, 102) AS DVDATE,  VVE2.ENUMNAME AS IEXPIRATDATECALCU,RS.CEXPIRATIONDATE,RS.CCIQBOOKCODE,AA.ICHANGRATE,I.IGROUPTYPE,   IQCNUM,IQCQTY , CASE WHEN RS.BRDFLAG =1 THEN IINNUM ELSE NULL END AS IINNUM, CASE WHEN RS.BRDFLAG =1 THEN IINQTTY ELSE NULL END AS IINQTTY , CASE WHEN RS.BRDFLAG =0 THEN IOUTNUM ELSE NULL END AS IOUTNUM, CASE WHEN RS.BRDFLAG =0 THEN IOUTQTTY ELSE NULL END AS IOUTQTTY , C.CCUSABBNAME, V.CVENABBNAME,  RD.CRDNAME, W.CWHNAME, RS.CMEMO,  RS.CDEFINE1,RS.CDEFINE2, RS.CDEFINE3, RS.CDEFINE4, RS.CDEFINE5, RS.CDEFINE6, RS.CDEFINE7, RS.CDEFINE8,  RS.CDEFINE9, RS.CDEFINE10, RS.CDEFINE11, RS.CDEFINE12, RS.CDEFINE13, RS.CDEFINE14, RS.CDEFINE15, RS.CDEFINE16,RS.CDEFINE22, RS.CDEFINE23, RS.CDEFINE24, RS.CDEFINE25, RS.CDEFINE26, RS.CDEFINE27,RS.CDEFINE28, RS.CDEFINE29, RS.CDEFINE30, RS.CDEFINE31, RS.CDEFINE32, RS.CDEFINE33, RS.CDEFINE34, RS.CDEFINE35, RS.CDEFINE36, RS.CDEFINE37, RS.CBATCHPROPERTY1,RS.CBATCHPROPERTY2,RS.CBATCHPROPERTY3,RS.CBATCHPROPERTY4,RS.CBATCHPROPERTY5,RS.CBATCHPROPERTY6,RS.CBATCHPROPERTY7,RS.CBATCHPROPERTY8,RS.CBATCHPROPERTY9,RS.CBATCHPROPERTY10, RS.CFREE1, RS.CFREE2, RS.CFREE3, RS.CFREE4, RS.CFREE5, RS.CFREE6 , RS.CFREE7, RS.CFREE8, RS.CFREE9, RS.CFREE10,RS.CVMIVENCODE,V1.CVENABBNAME AS CVMIVENNAME,  RS.DCHECKDATE , RS.CCHECKCODE, CHECKPERSON.CPERSONNAME AS CCHECKPERSONNAME, RS.CREJECTCODE,  DVALIDATEDATE,RS.CBMEMO,VVE3.ENUMNAME AS ISOTYPE,RS.CSOCODE,RS.ISOSEQ,RS.ISODID,AA_REQUIREMENTCLASS.CRCLASSNAME AS CDEMANDMEMO , RS.CMOLOTCODE,RS.CSHIPADDRESS   \n");
			sql.append(" FROM   \n");
			sql.append(" ( \n");
			sql.append(" 	select tmpid,bqc,IQCNUM,IQCQTY,iInNum,iInQtty,IOUTNUM,iOutQtty,iChangRate  \n");
			sql.append(" 	from #STRepKCTZMX   \n");
			sql.append(" 	where  \n");
			sql.append(" 	bqc=0  \n");
			sql.append(" ) AA  \n");
			sql.append(" inner join   \n");
			sql.append(" #STRepKCTZMX2 RS   \n");
			sql.append(" on aa.tmpid=rs.tmpid  \n");
			sql.append(" inner join Inventory I on i.cinvcode =rs.cinvcode   \n");
			sql.append(" LEFT OUTER JOIN dbo.ComputationUnit CU_G ON  I.cSTComUnitCode =CU_G.cComUnitCode   \n");
			sql.append(" left OUTER JOIN dbo.Vendor V  ON V.cVenCode = rs.cVenCode   \n");
			sql.append(" left join  dbo.Person P1 ON rs.cPersonCode = P1.cPersonCode   \n");
			sql.append(" left  JOIN dbo.Customer C ON C.cCusCode = rs.cCusCode  \n");
			sql.append(" left join  Department DP ON rs.cDepCode = DP.cDepCode  \n");
			sql.append(" LEFT OUTER JOIN dbo.Warehouse W ON rs.cWhCode = W.cWhCode   \n");
			sql.append(" LEFT OUTER JOIN dbo.VouchType VT ON rs.cVouchType = VT.cVouchType  \n");
			sql.append(" LEFT OUTER JOIN dbo.Rd_Style Rd ON rs.cRdCode = Rd.cRdCode     \n");
			sql.append(" left OUTER join vendor v1 on v1.cvencode = rs.cvmivencode  \n");
			sql.append(" left outer join Person CheckPerson on CheckPerson.cPersonCode = Rs.cCheckPersonCode  \n");
			sql.append(" left join v_aa_enum Myvouch on (Myvouch.enumcode=rs.cVouchType and Myvouch.enumtype=N'ST.VouchType')  \n");
			sql.append(" left join v_aa_enum Mycbus on (Mycbus.enumcode=rs.cbusType and Mycbus.enumtype=N'ST.BusType')  \n");
			sql.append(" left join v_aa_enum vve2 on (Rs.iExpiratDateCalcu = vve2.enumcode and vve2.enumtype=N'SCM.ExpiratDateCalcu')   \n");
			sql.append(" left join v_aa_enum vve3 on (Rs.isotype = vve3.enumcode and vve3.enumtype=N'ST.Sotype')   \n");
			sql.append(" left join AA_RequirementClass on  AA_RequirementClass.cRClassCode =Rs.isodid and isnull(Rs.isotype,0)=4  \n");
			sql.append(" order by bqc desc,ddate,rs.autoid  \n");

			logger.info(sql.toString() + "\n");
			rst = stmt.executeQuery(sql.toString());

			propertyDescriptors = null;
			while (rst.next())
			{
				if (propertyDescriptors == null)
				{
					propertyDescriptors = MyBeanUtils.getPropertyDescriptors(StRepKctzMxObj.class.newInstance(), getSearchMetaData(rst.getMetaData()));
				}

				Object instance = getDomainObjFromResultSet(StRepKctzMxObj.class, rst, propertyDescriptors);

				mxList.add(instance);
			}

			logger.info(" searched " + mxList.size() + " rows");

			// double ijc = 0d;
			// for (int i = 0; i < mxList.size(); i++)
			// {
			// StRepKctzMxObj o = (StRepKctzMxObj) mxList.get(i);
			// ijc += (o.getIqcqty() == null ? 0 : o.getIqcqty()) + (o.getIinqtty() == null ? 0 : o.getIinqtty()) - (o.getIoutqtty() == null ? 0 : o.getIoutqtty());
			// System.out.println(TimeUtil.date2str(o.getDdate(), "yyyy-MM-dd") + "\t" + TimeUtil.date2str(o.getDveridate(), "yyyy-MM-dd") + "\t" + o.getCwhname() + "\t" + o.getCbustype() + "\t" +
			// o.getCbatch() + "\t" + o.getIinqtty() + "\t" + o.getIoutqtty() + "\t" + o.getIqcqty() + "\t" + ijc);
			// }

		} catch (Exception e)
		{
			logger.error(e.getMessage(), e);
		} finally
		{
			MySqlUtil.closeConnection(conn);
		}
	}

	private List<String> getSearchMetaData(ResultSetMetaData metaData) throws SQLException
	{
		List<String> columnList = new ArrayList<String>();
		for (int i = 1; i < metaData.getColumnCount() + 1; i++)
		{
			columnList.add(metaData.getColumnName(i));
		}
		return columnList;
	}

	private Object getDomainObjFromResultSet(Class clz, ResultSet rst, List<PropertyDescriptor> propertyDescriptors) throws Exception
	{
		Object instance = clz.newInstance();

		for (int i = 0; i < propertyDescriptors.size(); i++)
		{
			PropertyDescriptor p = propertyDescriptors.get(i);
			Class propertyType = p.getPropertyType();
			String pName = p.getName();
			Object pValue = rst.getObject(pName);
			if (pValue != null)
			{
				if (propertyType.equals(Integer.class))
				{
					pValue = rst.getInt(pName);
				} else if (propertyType.equals(Long.class))
				{
					pValue = rst.getLong(pName);
				} else if (propertyType.equals(Float.class))
				{
					pValue = rst.getFloat(pName);
				} else if (propertyType.equals(Double.class))
				{
					pValue = rst.getDouble(pName);
				} else if (propertyType.equals(Boolean.class))
				{
					pValue = rst.getBoolean(pName);
				} else if (propertyType.equals(Timestamp.class))
				{
					pValue = rst.getTimestamp(pName);
				} else if (propertyType.equals(Date.class))
				{
					pValue = rst.getDate(pName);
				}

				logger.debug("set property :" + p.getName() + "=" + pValue);

				logger.debug("value class = " + pValue.getClass());

				BeanUtils.setProperty(instance, p.getName(), pValue);
			}
		}
		return instance;
	}

	public static void main(String[] args)
	{
		StockDetailService service = new StockDetailService();

		// service.calc("", "", "", "", new ArrayList(), new ArrayList());
	}
}
