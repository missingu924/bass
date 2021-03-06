<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.licence.LicenceUtil"%>
<%@page import="com.wuyg.echarts.EchartsUtil"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.common.obj.PaginationObj"%>
<%@page import="com.u8.util.SalePortalUtil"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="java.util.Date"%>
<html>
	<head>
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<title>portal</title>
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
	</head>
	<%
		// 当前用户
			AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO);

			// 开始时间、结束时间
			int iyear = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("iyear"), TimeUtil.nowTime2str("yyyy"))) ;
			int imonth = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("imonth"), TimeUtil.nowTime2str("MM"))) ;
			
			String startTimeMonth = TimeUtil.date2str(TimeUtil.getTheFirstDayOfTheMonth(iyear,imonth), "yyyy-MM-dd 00:00:00");;
			String endTimeMonth = TimeUtil.date2str(TimeUtil.getTheLastDayOfTheMonth(iyear,imonth), "yyyy-MM-dd 23:59:59");
			
			// 上月、下月
			int iPreYear = iyear;
			int iPreMonth = imonth;
			int iNextYear = iyear;
			int iNextMonth = imonth;
			
			if(imonth==1)
			{
		iPreMonth = 12;
		iPreYear = iyear-1;
		iNextMonth = imonth+1;
		iNextYear = iyear;
			}
			else if(imonth==12)
			{
		iPreMonth = imonth-1;
		iPreYear = iyear;
		iNextMonth = 1;
		iNextYear = iyear+1;
			}
			else
			{
		iPreMonth = imonth-1;
		iPreYear = iyear;
		iNextMonth = imonth+1;
		iNextYear = iyear;
			}
			
			// TOPN
			int topn = 10; // topn
			int recentMonths = 12; //近多少个月的统计
			int recentYears = 5; //近多少年的统计
	%>
	<body>
	<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/SaleStat/month_portal.jsp"> 
		<table align="center" width="98%">
			<tr>
				<td align="center">
					<a href="<%=request.getContextPath()%>/SaleStat/month_portal.jsp?iyear=<%=iPreYear%>&imonth=<%=iPreMonth%>"><input type="button" class="button button_left" title="上月" /></a> 
					&nbsp;<span style="color:#000000;font-size:16px;font-weight:bold"><%=iyear%>年<%=imonth%>月订单概览</span>&nbsp;
					<a href="<%=request.getContextPath()%>/SaleStat/month_portal.jsp?iyear=<%=iNextYear%>&imonth=<%=iNextMonth%>"><input type="button" class="button button_right" title="下月" /></a>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/pie_chart.png" width="16" height="16" align="middle" />
					月度订单业绩
				</td>
			</tr>
		</table>
		<table id="overview_table" width="98%" align="center" class="table_goal">
			<tr onclick="openTab('<%=iyear+"/"+imonth+" 订单分布"%>','<%=request.getContextPath()%>/SaleStat/inv_cust_stat.jsp?stat_type=month&iyear=<%=iyear%>&imonth=<%=imonth%>')">
				<td width="33%" height="100">
					<p>
						<span class="lcd_greendark_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(*) value from So_SoMain dl where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						月度订单单数
					</p>
				</td>
				<td width="33%">
					<p>
						<span class="lcd_greendark_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iQuantity),0) value from So_SoMain dl left join So_SoDetails dls on dl.cSoCode=dls.cSoCode where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						月度订单数量
					</p>
				</td>
				<td width="33%">
					<p>
						<span class="lcd_greendark_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iNatSum)/10000,0) value from So_SoMain dl left join So_SoDetails dls on dl.cSoCode=dls.cSoCode where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 4)%>
						</span>
					</p>
					<p>
						月度订单金额（万元）
					</p>
				</td>
			</tr>
			<tr>
				<td width="33%" onclick="invStat()"  height="100" >
					<p>
						<span class="lcd_greendark_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(distinct cinvcode) value from So_SoMain dl left join So_SoDetails dls on dl.cSoCode=dls.cSoCode where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						月度订单产品种数
					</p>
				</td>
				<td width="33%" onclick="custStat()">
					<p>
						<span class="lcd_greendark_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(distinct ccuscode) value from So_SoMain dl left join So_SoDetails dls on dl.cSoCode=dls.cSoCode where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						月度订单客户数
					</p>
				</td>
				<td width="33%" onclick="personStat()">
					<p>
						<span class="lcd_greendark_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(distinct cpersoncode) value from So_SoMain dl left join So_SoDetails dls on dl.cSoCode=dls.cSoCode where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						月度订单业务员数
					</p>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					月度订单排名
				</td>
			</tr>
		</table>
		<table id="month_topn_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(SalePortalUtil.getTopnInventorySql(startTimeMonth,endTimeMonth,topn), "value desc", "", "产品", "月度"+topn+"大产品（万元）", EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_PURPLE, 400, 300, "openTab('产品 '+params.data.name+' "+iyear+"/"+imonth+" 订单情况','"+request.getContextPath()+"/SaleStat/inv_stat.jsp?iyear="+iyear+"&imonth="+imonth+"&invcode='+params.data.code)")%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(SalePortalUtil.getTopnCustomerSql(startTimeMonth,endTimeMonth,topn), "value desc", "", "客户", "月度"+topn+"大客户（万元）", EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_GREEN, 400, 400, "openTab('客户 '+params.data.name+' "+iyear+"/"+imonth+" 订单情况','"+request.getContextPath()+"/SaleStat/cust_stat.jsp?iyear="+iyear+"&imonth="+imonth+"&custcode='+params.data.code)")%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(SalePortalUtil.getTopnPersonSql(startTimeMonth,endTimeMonth,topn), "value desc", "", "业务员", "月度"+topn+"大业务员（万元）", EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_CYAN, 400, 300, "openTab('业务员 '+params.data.name+' "+iyear+"/"+imonth+" 订单情况','"+request.getContextPath()+"/SaleStat/person_stat.jsp?iyear="+iyear+"&imonth="+imonth+"&personcode='+params.data.code)")%>
				</td>
			</tr>
			<tr>
				<td style="font-size:12px;color:#999999;text-align:center;vertical-align:top" height="40px">
					<a href="javascript:invStat()">更多…</a>
				</td>
				<td style="font-size:12px;color:#999999;text-align:center;vertical-align:top">
					<a href="javascript:custStat()">更多…</a>
				</td>
				<td style="font-size:12px;color:#999999;text-align:center;vertical-align:top">
					<a href="javascript:personStat()">更多…</a>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					近<%=recentMonths%>个月订单趋势
				</td>
			</tr>
		</table>
		<table id="12month_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(SalePortalUtil.getRecentMonthSql4isum(iyear+"",imonth+"",recentMonths,null,null,null), "", "", new String[]{"订单金额","订单金额"}, new String[]{"订单金额（万元）","去年同期订单金额"}, EchartsUtil.BAR, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_GREEN_DARK, 300, 0, "openTab(params.data.name+' 订单概览','"+request.getContextPath()+"/SaleStat/month_portal.jsp?iyear='+params.data.name.substr(0,4)+'&imonth='+params.data.name.substr(5,6))")%>
				</td>
			</tr>
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(SalePortalUtil.getRecentMonthSql4invcount(iyear+"",imonth+"",recentMonths,null,null,null), "", "", new String[]{"订单产品种数","订单产品种数"}, new String[]{"订单产品种数","去年同期产品种数"}, EchartsUtil.LINE, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_GREEN_DARK, 200, 0, "openTab(params.data.name+' 产品订单统计','"+request.getContextPath()+"/SaleStat/inv_cust_stat.jsp?info_type=inv&iyear='+params.data.name.substr(0,4)+'&imonth='+params.data.name.substr(5,6))")%>
				</td>
			</tr>
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(SalePortalUtil.getRecentMonthSql4custcount(iyear+"",imonth+"",recentMonths,null,null,null), "", "", new String[]{"订单客户数","订单客户数"}, new String[]{"订单客户数","去年同期客户数"}, EchartsUtil.LINE, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_GREEN_DARK, 200, 0, "openTab(params.data.name+' 客户订单统计','"+request.getContextPath()+"/SaleStat/inv_cust_stat.jsp?info_type=cust&iyear='+params.data.name.substr(0,4)+'&imonth='+params.data.name.substr(5,6))")%>
				</td>
			</tr>
		</table>

		</form>
	</body>
	
	<script type="text/javascript">
		$("#iyear").change(function(){
			$("#pageForm").submit();
		});
		
		$("#imonth").change(function(){
			$("#pageForm").submit();
		});
		
		function invStat()
		{
			openTab('<%=iyear+"/"+imonth+""%> 产品分布','<%=request.getContextPath() %>/SaleStat/inv_cust_stat.jsp?info_type=inv&iyear=<%=iyear%>&imonth=<%=imonth%>');
		}
		function custStat()
		{
			openTab('<%=iyear+"/"+imonth+""%> 客户分布','<%=request.getContextPath() %>/SaleStat/inv_cust_stat.jsp?info_type=cust&iyear=<%=iyear%>&imonth=<%=imonth%>');
		}
		function personStat()
		{
			openTab('<%=iyear+"/"+imonth+""%> 业务员分布','<%=request.getContextPath() %>/SaleStat/inv_cust_stat.jsp?info_type=person&iyear=<%=iyear%>&imonth=<%=imonth%>');
		}
	</script>
</html>

