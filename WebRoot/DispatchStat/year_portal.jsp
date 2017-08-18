<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.licence.LicenceUtil"%>
<%@page import="com.wuyg.echarts.EchartsUtil"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.common.obj.PaginationObj"%>
<%@page import="com.u8.util.DispatchPortalUtil"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="java.util.Date"%>
<%@page import="com.bass.searchcondition.VDispatchCustInvStatSearchCondition"%>
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
			
			String startTimeYear = iyear+"-01-01 00:00:00";
			String endTimeYear = iyear+"-12-31 23:59:59";
			
			// 上月、下月
			int iPreYear = iyear-1;
			int iNextYear = iyear+1;
			
			// TOPN
			int topn = 10; // topn
			int recentMonths = 12; //近多少个月的统计
			int recentYears = 10; //近多少年的统计
	%>
	<body>
	<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/DispatchStat/year_portal.jsp"> 
		<table align="center" width="98%">
			<tr>
				<td align="center">
					<a href="<%=request.getContextPath()%>/DispatchStat/year_portal.jsp?iyear=<%=iPreYear%>"><input type="button" class="button button_left" title="上年" /></a> 
					&nbsp;<span style="color:#000000;font-size:16px;font-weight:bold"><%=iyear%>年 年度发货概览</span>&nbsp;
					<a href="<%=request.getContextPath()%>/DispatchStat/year_portal.jsp?iyear=<%=iNextYear%>"><input type="button" class="button button_right" title="下年" /></a>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/pie_chart.png" width="16" height="16" align="middle" />
					年度发货业绩概览
				</td>
			</tr>
		</table>
		<table id="overview_table" width="98%" align="center" class="table_goal">
			<tr onclick="custInvStat()">
				<td width="33%" height="100">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(distinct dl.dlid) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"'"), 0)%>
						</span>
					</p>
					<p>
						当年累计发货单数
					</p>
				</td>
				<td width="33%">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iQuantity),0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"'"), 0)%>
						</span>
					</p>
					<p>
						当年累计发货数量
					</p>
				</td>
				<td width="33%">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iNatSum)/10000,0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"'"), 2)%>
						</span>
					</p>
					<p>
						当年累计发货金额（万元）
					</p>
				</td>
			</tr>
			<tr>
				<td width="33%" height="100" onclick="invStat('')">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(distinct cinvcode) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"'"), 0)%>
						</span>
					</p>
					<p>
						当年累计发货产品种数
					</p>
				</td>
				<td width="33%" onclick="custStat('')">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(distinct ccuscode) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"'"), 0)%>
						</span>
					</p>
					<p>
						当年累计发货客户数
					</p>
				</td>
				<td width="33%" onclick="personStat('')">
					<p>
						<span class="lcd_blue_big">
						<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(distinct cpersoncode) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"'"), 0)%>
						</span>
					</p>
					<p>
						当年累计发货业务员数
					</p>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					年度发货排名
				</td>
			</tr>
		</table>
		<table id="year_topn_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(DispatchPortalUtil.getTopnInventorySql(startTimeYear,endTimeYear,topn), "value desc", "", "产品", "年度"+topn+"大产品（万元）", EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_PURPLE, 400, 400, "openTab('产品 '+params.data.name+' "+iyear+"年 发货情况','"+request.getContextPath()+"/DispatchStat/inv_stat_year.jsp?iyear="+iyear+"&invcode='+params.data.code)")%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(DispatchPortalUtil.getTopnCustomerSql(startTimeYear,endTimeYear,topn), "value desc", "", "客户", "年度"+topn+"大客户（万元）", EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_GREEN, 400, 400, "openTab('客户 '+params.data.name+' "+iyear+"年 发货情况','"+request.getContextPath()+"/DispatchStat/cust_stat_year.jsp?iyear="+iyear+"&custcode='+params.data.code)")%>
				</td>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(DispatchPortalUtil.getTopnPersonSql(startTimeYear,endTimeYear,topn), "value desc", "", "业务员", "年度"+topn+"大业务员（万元）", EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_CYAN, 400, 300, "openTab('业务员 '+params.data.name+' "+iyear+"年 发货情况','"+request.getContextPath()+"/DispatchStat/person_stat_year.jsp?iyear="+iyear+"&personcode='+params.data.code)")%>
				</td>
			</tr>
			<tr>
				<td style="font-size:12px;color:#999999;text-align:center;vertical-align:top" height="40px">
					<a href="#" onclick="invStat('')">更多…</a>
				</td>
				<td style="font-size:12px;color:#999999;text-align:center;vertical-align:top">
					<a href="#" onclick="custStat('')">更多…</a>
				</td>
				<td style="font-size:12px;color:#999999;text-align:center;vertical-align:top">
					<a href="#" onclick="personStat('')">更多…</a>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					<%=iyear%>年 月度发货趋势
				</td>
			</tr>
		</table>
		<table id="12month_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(DispatchPortalUtil.getRecentMonthSql4isum(iyear+"","12",recentMonths,null,null,null), "", "", new String[]{"发货金额","发货金额"}, new String[]{"发货金额（万元）","去年同期发货金额"}, EchartsUtil.BAR, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_BLUE, 300, 0, "openTab(params.data.name+' 发货概览','"+request.getContextPath()+"/DispatchStat/month_portal.jsp?iyear='+params.data.name.substr(0,4)+'&imonth='+params.data.name.substr(5,6))")%>
				</td>
			</tr>
		</table>
		
		<table align="center" width="98%" class="title_table">
			<tr>
				<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
					<img src="../images/svg/heavy/green/32/stats.png" width="16" height="16" align="middle" />
					近<%=recentYears%>年 年度发货趋势
				</td>
			</tr>
		</table>
		<table id="5year_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(DispatchPortalUtil.getRecentYearSql(iyear+"", recentYears, null,null,null), "", "", new String[]{"发货额"}, new String[]{"近"+recentYears+"年发货额（万元）"}, EchartsUtil.BAR, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_BLUE, 300, 0, "yearPortal(params.data.name)")%>
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
		
		function invStat(invcode)
		{
			openTab('<%=iyear+"年"%> 产品分布','<%=request.getContextPath() %>/DispatchStat/inv_cust_stat_year.jsp?info_type=inv&iyear=<%=iyear%>');
		}
		function custStat(custcode)
		{
			openTab('<%=iyear+"年"%> 客户分布','<%=request.getContextPath() %>/DispatchStat/inv_cust_stat_year.jsp?info_type=cust&iyear=<%=iyear%>');
		}
		function personStat(personcode)
		{
			openTab('<%=iyear+"年"%> 业务员分布','<%=request.getContextPath() %>/DispatchStat/inv_cust_stat_year.jsp?info_type=person&iyear=<%=iyear%>');
		}
		function custInvStat()
		{
			openTab('<%=iyear+"年"%> 发货分布','<%=request.getContextPath() %>/DispatchStat/inv_cust_stat_year.jsp?iyear=<%=iyear%>');
		}
		
		function yearPortal(iyear)
		{
			openTab(iyear+'年 年度发货概览','<%=request.getContextPath() %>/DispatchStat/year_portal.jsp?iyear='+iyear+'&imonth=12');
		}
	</script>
</html>

