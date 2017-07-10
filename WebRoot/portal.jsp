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
		<link href="css/global.css" rel="stylesheet" type="text/css">
		<title>footer</title>
		<script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
		<style type="text/css">
<!--

.lcd_red_big {
	color: #ff6600;
	font-family: lcd;
	font-size: 42px;
	cursor: pointer;
}

.lcd_organe_big {
	color: #FF9900;
	font-family: lcd;
	font-size: 42px;
	cursor: pointer;
}

.lcd_organe_small {
	color: #FF9900;
	font-family: lcd;
	font-size: 28px;
	cursor: pointer;
}

.lcd_green_big {
	color: #2EC7C9;
	font-family: lcd;
	font-size: 42px;
	cursor: pointer;
}

.lcd_green_small {
	color: #2EC7C9;
	font-family: lcd;
	font-size: 28px;
	cursor: pointer;
}

.lcd_blue_big {
	color: #3399cc;
	font-family: lcd;
	font-size: 42px;
	cursor: pointer;
}

.lcd_blue_small {
	color: #3399cc;
	font-family: lcd;
	font-size: 28px;
	cursor: pointer;
}

.lcd_purple_big {
	color: #9966cc;
	font-family: lcd;
	font-size: 42px;
	cursor: pointer;
}

.lcd_purple_small {
	color: #9966cc;
	font-family: lcd;
	font-size: 28px;
	cursor: pointer;
}

.lcd_gray_small {
	color: #cccccc;
	font-family: lcd;
	font-size: 28px;
}
-->
</style>
	</head>
	<%
		// 当年
		int year = Calendar.getInstance().get(Calendar.YEAR);

		// 当前用户
		AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO);

		// 是否需要增加权限条件
		boolean needLimit = !user.hasFunction("无限制查询");

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
	<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/portal.jsp"> 
		<table align="center" width="98%">
			<tr>
				<td align="center">
					<a href="<%=request.getContextPath() %>/portal.jsp?iYear=<%=iPreYear %>&iMonth=<%=iPreMonth %>"><input type="button" class="button button_left" title="上月" /></a> 
					&nbsp;<span style="color:#999999;font-size:16px;"><%=iYear%>年<%=iMonth%>月销售概览</span>&nbsp;
					<a href="<%=request.getContextPath() %>/portal.jsp?iYear=<%=iNextYear %>&iMonth=<%=iNextMonth %>"><input type="button" class="button button_right" title="下月" /></a>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="images/svg/heavy/green/32/pie_chart.png" width="16" height="16" align="middle" />
					月度销售业绩概览
				</td>
			</tr>
		</table>
		<table id="overview_table" width="98%" align="center" class="table_goal">
			<tr>
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
					<img src="images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					近<%=recentMonths %>个月销售情况（万元）
				</td>
			</tr>
		</table>
		<table id="12month_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getRecentMonthSql(iYear+"",iMonth+"",recentMonths), "", "", new String[]{"销售额","销售额"}, new String[]{"近"+recentMonths+"个月销售额","去年同期销售额"}, EchartsUtil.BAR, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_BLUE, 300, 0)%>
				</td>
			</tr>
		</table>

		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					月度销售排名（万元）
				</td>
			</tr>
		</table>
		<table id="month_topn_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnInventorySql(startTimeMonth,endTimeMonth,topn), "value asc", "", "产品", "月度"+topn+"大产品", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_PURPLE, 400, 400)%>
				</td>
				<td align="center">
					
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnCustomerSql(startTimeMonth,endTimeMonth,topn), "value asc", "", "客户", "月度"+topn+"大客户", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_ORANGE, 400, 400)%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnPersonSql(startTimeMonth,endTimeMonth,topn), "value asc", "", "业务员", "月度"+topn+"大业务员", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_CYAN, 400, 300)%>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="images/svg/heavy/green/32/pie_chart.png" width="16" height="16" align="middle" />
					年度销售业绩概览
				</td>
			</tr>
		</table>
		<table id="overview_table" width="98%" align="center" class="table_goal">
			<tr>
				<td width="33%" height="120">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(*) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						当年累计发货单数
					</p>
				</td>
				<td width="33%">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select sum(iQuantity) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeMonth+"'"), 0)%>
						</span>
					</p>
					<p>
						当年累计发货数量
					</p>
				</td>
				<td width="33%">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select sum(iSum)/10000 value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeMonth+"'"), 2)%>
						</span>
					</p>
					<p>
						当年累计发货金额（万元）
					</p>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					近<%=recentYears %>年销售情况（万元）
				</td>
			</tr>
		</table>
		<table id="5year_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getRecentYearSql(iYear+"", recentYears), "", "", new String[]{"销售额"}, new String[]{"近"+recentYears+"销售额"}, EchartsUtil.BAR, EchartsUtil.THEME_ROMA, EchartsUtil.COLOR_GREEN, 300, 0)%>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					年度销售排名（万元）
				</td>
			</tr>
		</table>
		<table id="year_topn_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnInventorySql(startTimeYear,endTimeYear,topn), "value asc", "", "产品", "年度"+topn+"大产品", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_PURPLE, 400, 400)%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnCustomerSql(startTimeYear,endTimeYear,topn), "value asc", "", "客户", "年度"+topn+"大客户", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_ORANGE, 400, 400)%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getTopnPersonSql(startTimeYear,endTimeYear,topn), "value asc", "", "业务员", "年度"+topn+"大业务员", EchartsUtil.BAR_V, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_CYAN, 400, 300)%>
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

