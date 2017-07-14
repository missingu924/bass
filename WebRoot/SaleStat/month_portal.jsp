<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.licence.LicenceUtil"%>
<%@page import="com.wuyg.echarts.EchartsUtil"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.common.obj.PaginationObj"%>
<%@page import="com.u8.util.PortalUtil"%>
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
		int iYear = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("iYear"), TimeUtil.nowTime2str("yyyy"))) ;
		int iMonth = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("iMonth"), TimeUtil.nowTime2str("MM"))) ;
		
		String startTimeYear = iYear+"-01-01 00:00:00";
		String endTimeYear = iYear+"-12-31 23:59:59";
		
		String startTimeMonth = TimeUtil.date2str(TimeUtil.getTheFirstDayOfTheMonth(iYear,iMonth), "yyyy-MM-dd 00:00:00");;
		String endTimeMonth = TimeUtil.date2str(TimeUtil.getTheLastDayOfTheMonth(iYear,iMonth), "yyyy-MM-dd 23:59:59");
		
		// 上月、下月
		int iPreYear = iYear;
		int iPreMonth = iMonth;
		int iNextYear = iYear;
		int iNextMonth = iMonth;
		
		if(iMonth==1)
		{
			iPreMonth = 12;
			iPreYear = iYear-1;
			iNextMonth = iMonth+1;
			iNextYear = iYear;
		}
		else if(iMonth==12)
		{
			iPreMonth = iMonth-1;
			iPreYear = iYear;
			iNextMonth = 1;
			iNextYear = iYear+1;
		}
		else
		{
			iPreMonth = iMonth-1;
			iPreYear = iYear;
			iNextMonth = iMonth+1;
			iNextYear = iYear;
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
					<a href="<%=request.getContextPath() %>/SaleStat/month_portal.jsp?iYear=<%=iPreYear %>&iMonth=<%=iPreMonth %>"><input type="button" class="button button_left" title="上月" /></a> 
					&nbsp;<span style="color:#000000;font-size:16px;font-weight:bold"><%=iYear%>年<%=iMonth%>月销售概览</span>&nbsp;
					<a href="<%=request.getContextPath() %>/SaleStat/month_portal.jsp?iYear=<%=iNextYear %>&iMonth=<%=iNextMonth %>"><input type="button" class="button button_right" title="下月" /></a>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/pie_chart.png" width="16" height="16" align="middle" />
					月度销售业绩概览
				</td>
			</tr>
		</table>
		<table id="overview_table" width="98%" align="center" class="table_goal">
			<tr onclick="openTab('<%=iYear+"年"+iMonth+"月销售统计" %>','<%=request.getContextPath() %>/SaleStat/inv_cust_stat.jsp?stat_type=month&iYear=<%=iYear %>&iMonth=<%=iMonth %>')">
				<td width="33%" height="120">
					<p>
						<span class="lcd_red_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(*) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						月度发货单数
					</p>
				</td>
				<td width="33%">
					<p>
						<span class="lcd_red_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iQuantity),0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						月度发货数量
					</p>
				</td>
				<td width="33%">
					<p>
						<span class="lcd_red_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iSum)/10000,0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"'"), 2)%>
						</span>
					</p>
					<p>
						月度发货金额（万元）
					</p>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					近<%=recentMonths %>个月销售情况（万元）
				</td>
			</tr>
		</table>
		<table id="12month_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getRecentMonthSql(iYear+"",iMonth+"",recentMonths,null,null), "", "", new String[]{"销售额","销售额"}, new String[]{"近"+recentMonths+"个月销售额","去年同期销售额"}, EchartsUtil.BAR, EchartsUtil.THEME_ROMA, EchartsUtil.COLOR_BLUE, 300, 0, "openTab(params.data.name.substr(0,4)+'年'+params.data.name.substr(5,6)+'月 销售情况','"+request.getContextPath()+"/SaleStat/inv_cust_stat.jsp?iYear='+params.data.name.substr(0,4)+'&iMonth='+params.data.name.substr(5,6))")%>
				</td>
			</tr>
		</table>

		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					月度销售排名（万元）
				</td>
			</tr>
		</table>
		<table id="month_topn_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnInventorySql(startTimeMonth,endTimeMonth,topn), "value desc", "", "产品", "月度"+topn+"大产品", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_PURPLE, 400, 400, "openTab(params.data.name+' "+iYear+"年"+iMonth+"月 销售情况','"+request.getContextPath()+"/SaleStat/inv_stat.jsp?iYear="+iYear+"&iMonth="+iMonth+"&invcode='+params.data.code)")%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnCustomerSql(startTimeMonth,endTimeMonth,topn), "value desc", "", "客户", "月度"+topn+"大客户", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_GREEN, 400, 400, "openTab(params.data.name+' "+iYear+"年"+iMonth+"月 销售情况','"+request.getContextPath()+"/SaleStat/cust_stat.jsp?iYear="+iYear+"&iMonth="+iMonth+"&custcode='+params.data.code)")%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnPersonSql(startTimeMonth,endTimeMonth,topn), "value desc", "", "业务员", "月度"+topn+"大业务员", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_CYAN, 400, 300, null)%>
				</td>
			</tr>
		</table>
		</form>
	</body>
	
	<script type="text/javascript">
		$("#iYear").change(function(){
			$("#pageForm").submit();
		});
		
		$("#iMonth").change(function(){
			$("#pageForm").submit();
		});
	</script>
</html>

