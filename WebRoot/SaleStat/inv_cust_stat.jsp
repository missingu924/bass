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
<%@page import="java.util.List"%>
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

		// 统计方式
		String stat_type = request.getParameter("stat_type");// year、month

		// 开始时间、结束时间
		int iYear = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("iYear"), TimeUtil.nowTime2str("yyyy")));
		int iMonth = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("iMonth"), TimeUtil.nowTime2str("MM")));

		String startTimeYear = iYear + "-01-01 00:00:00";
		String endTimeYear = iYear + "-12-31 23:59:59";

		String startTimeMonth = TimeUtil.date2str(TimeUtil.getTheFirstDayOfTheMonth(iYear, iMonth), "yyyy-MM-dd 00:00:00");
		;
		String endTimeMonth = TimeUtil.date2str(TimeUtil.getTheLastDayOfTheMonth(iYear, iMonth), "yyyy-MM-dd 23:59:59");

		// 上月、下月
		int iPreYear = iYear;
		int iPreMonth = iMonth;
		int iNextYear = iYear;
		int iNextMonth = iMonth;

		if (iMonth == 1)
		{
			iPreMonth = 12;
			iPreYear = iYear - 1;
			iNextMonth = iMonth + 1;
			iNextYear = iYear;
		} else if (iMonth == 12)
		{
			iPreMonth = iMonth - 1;
			iPreYear = iYear;
			iNextMonth = 1;
			iNextYear = iYear + 1;
		} else
		{
			iPreMonth = iMonth - 1;
			iPreYear = iYear;
			iNextMonth = iMonth + 1;
			iNextYear = iYear;
		}

		// 按产品统计
		String invStatSql = "select dls.cinvcode code,round(isnull(sum(iSum)/10000,0),1) value ,inv.cInvName name from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID left join inventory inv on dls.cInvCode=inv.cInvCode where dDate>='"
				+ ("year".equalsIgnoreCase(stat_type) ? startTimeYear : startTimeMonth) + "' and dDate<='" + ("year".equalsIgnoreCase(stat_type) ? endTimeYear : endTimeMonth) + "' group by dls.cinvcode,inv.cInvName";
		List invList = EchartsUtil.getInvListByInvSql(invStatSql, "value desc", "各产品销售额（万元）", "产品", "产品分布（万元）");

		// 按客户统计
		String custStatSql = "select dl.cCusCode code,round(isnull(sum(iSum)/10000,0),1) value ,cust.cCusName name from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID left join customer cust on dl.cCusCode=cust.cCusCode where dDate>='"
				+ ("year".equalsIgnoreCase(stat_type) ? startTimeYear : startTimeMonth) + "' and dDate<='" + ("year".equalsIgnoreCase(stat_type) ? endTimeYear : endTimeMonth) + "' group by dl.cCusCode,cust.cCusName";
		List custList = EchartsUtil.getInvListByInvSql(custStatSql, "value desc", "各客户销售额（万元）", "客户", "客户分布（万元）");
		
		// 按业务员统计
		String personStatSql = "select dl.cPersonCode code,round(isnull(sum(iSum)/10000,0),1) value ,isnull(per.cPersonName,'其他') name from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID left join person per on dl.cPersonCode=per.cPersonCode where dDate>='"
				+ ("year".equalsIgnoreCase(stat_type) ? startTimeYear : startTimeMonth) + "' and dDate<='" + ("year".equalsIgnoreCase(stat_type) ? endTimeYear : endTimeMonth) + "' group by dl.cPersonCode,per.cPersonName";
		List personList = EchartsUtil.getInvListByInvSql(personStatSql, "value desc", "各业务员销售额（万元）", "业务员", "业务员分布（万元）");

		// 显示图表
		boolean showEchart = invList.size() <= 500 && custList.size() <= 500; //数据太多呈现图表会很乱
	%>
	<body>
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/SaleStat/inv_cust_stat.jsp">
			<table align="center" width="98%">
				<tr>
					<td align="center">
						<a href="<%=request.getContextPath()%>/SaleStat/inv_cust_stat.jsp?iYear=<%=iPreYear%>&iMonth=<%=iPreMonth%>"><input type="button" class="button button_left" title="上月" /> </a> &nbsp;
						<span style="color: #2281c8; font-size: 16px;"><%=iYear%>年<%=iMonth%>月销售分布</span>&nbsp;
						<a href="<%=request.getContextPath()%>/SaleStat/inv_cust_stat.jsp?iYear=<%=iNextYear%>&iMonth=<%=iNextMonth%>"><input type="button" class="button button_right" title="下月" /> </a>
					</td>
				</tr>
			</table>

			<table align="center" width="98%">
			<%if(showEchart){ %>
				<tr>
					<td align="center" valign="top" width="50%">
						<%=EchartsUtil.createEchartByInvDatalist(invList, EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_PURPLE, 400, invList.size()*28, "openTab(params.data.name+' "+iYear+"年"+iMonth+"月 销售情况','"+request.getContextPath()+"/SaleStat/inv_stat.jsp?iYear="+iYear+"&iMonth="+iMonth+"&invcode='+params.data.code)")%>
					</td>
					<td align="center" valign="top">
						<%=EchartsUtil.createEchartByInvDatalist(custList, EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_GREEN, 400, custList.size()*28, "openTab(params.data.name+' "+iYear+"年"+iMonth+"月 销售情况','"+request.getContextPath()+"/SaleStat/cust_stat.jsp?iYear="+iYear+"&iMonth="+iMonth+"&custcode='+params.data.code)")%>
					</td>
					<td align="center" valign="top">
						<%=EchartsUtil.createEchartByInvDatalist(personList, EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_CYAN, 300, custList.size()*28, "openTab(params.data.name+' "+iYear+"年"+iMonth+"月 销售情况','"+request.getContextPath()+"/SaleStat/person_stat.jsp?iYear="+iYear+"&iMonth="+iMonth+"&custcode='+params.data.code)")%>
					</td>
				</tr>
			<%} %>
				<tr style="background-color:#f0f8ff">
					<td align="center" valign="top" width="50%">
						<%=EchartsUtil.createTableByInvDatalist(invList, 0, 0)%>
					</td>
					<td align="center" valign="top">
						<%=EchartsUtil.createTableByInvDatalist(custList, 0, 0)%>
					</td>
					<td align="center" valign="top">
						<%=EchartsUtil.createTableByInvDatalist(personList, 0, 0)%>
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

