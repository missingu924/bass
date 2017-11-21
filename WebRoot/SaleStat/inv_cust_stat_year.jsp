<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.licence.LicenceUtil"%>
<%@page import="com.wuyg.echarts.EchartsUtil"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.common.obj.PaginationObj"%>
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
		String info_type = request.getParameter("info_type");// inv、cust、person

		// 开始时间、结束时间
		int iyear = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("iyear"), TimeUtil.nowTime2str("yyyy")));

		String startTimeYear = iyear + "-01-01 00:00:00";
		String endTimeYear = iyear + "-12-31 23:59:59";
		
		// 上月、下月
		int iPreYear = iyear-1;
		int iNextYear = iyear+1;

		// 按产品统计
		String invStatSql = "select dls.cinvcode code,round(isnull(sum(iNatSum)/10000,0),4) value ,inv.cInvName name from So_SoMain dl left join So_SoDetails dls on dl.cSoCode=dls.cSoCode left join inventory inv on dls.cInvCode=inv.cInvCode where dDate>='"
				+ (startTimeYear) + "' and dDate<='" + (endTimeYear) + "' group by dls.cinvcode,inv.cInvName";
		List invList = EchartsUtil.getInvListByInvSql(invStatSql, "value desc", "各产品订单金额（万元）", "产品", "产品订单金额（万元）");
		
		
		// 按客户统计
		String custStatSql = "select dl.cCusCode code,round(isnull(sum(iNatSum)/10000,0),4) value ,cust.cCusName name from So_SoMain dl left join So_SoDetails dls on dl.cSoCode=dls.cSoCode left join customer cust on dl.cCusCode=cust.cCusCode where dDate>='"
				+ (startTimeYear) + "' and dDate<='" + (endTimeYear) + "' group by dl.cCusCode,cust.cCusName";
		List custList = EchartsUtil.getInvListByInvSql(custStatSql, "value desc", "各客户订单金额（万元）", "客户", "客户订单金额（万元）");
		
		// 按业务员统计
		String personStatSql = "select dl.cPersonCode code,round(isnull(sum(iNatSum)/10000,0),4) value ,isnull(per.cPersonName,'其他') name from So_SoMain dl left join So_SoDetails dls on dl.cSoCode=dls.cSoCode left join person per on dl.cPersonCode=per.cPersonCode where dDate>='"
				+ (startTimeYear) + "' and dDate<='" + (endTimeYear) + "' group by dl.cPersonCode,per.cPersonName";
		List personList = EchartsUtil.getInvListByInvSql(personStatSql, "value desc", "各业务员订单金额（万元）", "业务员", "业务员订单金额（万元）");
		

		// 显示图表
		boolean showEchart = invList.size() <= 500 && custList.size() <= 500; //数据太多呈现图表会很乱
		
		boolean showInv = StringUtil.isEmpty(info_type)||"inv".equalsIgnoreCase(info_type);
		boolean showCust = StringUtil.isEmpty(info_type)||"cust".equalsIgnoreCase(info_type);
		boolean showPerson = StringUtil.isEmpty(info_type)||"person".equalsIgnoreCase(info_type);
	%>
	<body>
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/SaleStat/inv_cust_stat_year.jsp?info_type=<%=info_type %>">
			<table align="center" width="98%">
				<tr>
					<td align="center">
						<a href="<%=request.getContextPath()%>/SaleStat/inv_cust_stat_year.jsp?info_type=<%=info_type %>&iyear=<%=iPreYear%>"><input type="button" class="button button_left" title="上年" /> </a> &nbsp;
						<span style="color: #2281c8; font-size: 16px;"><%=iyear%>年订单分布</span>&nbsp;
						<a href="<%=request.getContextPath()%>/SaleStat/inv_cust_stat_year.jsp?info_type=<%=info_type %>&iyear=<%=iNextYear%>"><input type="button" class="button button_right" title="下年" /> </a>
					</td>
				</tr>
			</table>

			<table align="center" width="98%">
			<%if(showEchart){ %>
				<tr>
					<%if(showInv){%>
					<td align="center" valign="top" width="50%">
						<%=EchartsUtil.createEchartByInvDatalist(invList, EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_PURPLE, showInv&showCust&showPerson?300:800, Math.max(invList.size()*28, 200), "invStat(params.data.code,params.data.name)")%>
					</td>
					<%}if(showCust){%>
					<td align="center" valign="top">
						<%=EchartsUtil.createEchartByInvDatalist(custList, EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_GREEN, showInv&showCust&showPerson?400:800, Math.max(custList.size()*28,200), "custStat(params.data.code,params.data.name)")%>
					</td>
					<%}if(showPerson){%>
					<td align="center" valign="top">
						<%=EchartsUtil.createEchartByInvDatalist(personList, EchartsUtil.BAR_V, EchartsUtil.THEME_SHINE, EchartsUtil.COLOR_CYAN, showInv&showCust&showPerson?300:800, Math.max(personList.size()*28,200), "personStat(params.data.code,params.data.name)")%>
					</td>
					<%} %>
				</tr>
			<%} %>
				<tr style="background-color:#f0f8ff">
					<%if(showInv){%>
					<td align="center" valign="top" width="50%">
						<%=EchartsUtil.createTableByInvDatalist(invList, 0, 0, "invStat(params.data.code,params.data.name)")%>
					</td>
					<%}if(showCust){%>
					<td align="center" valign="top">
						<%=EchartsUtil.createTableByInvDatalist(custList, 0, 0, "custStat(params.data.code,params.data.name)")%>
					</td>
					<%}if(showPerson){%>
					<td align="center" valign="top">
						<%=EchartsUtil.createTableByInvDatalist(personList, 0, 0, "personStat(params.data.code,params.data.name)")%>
					</td>
					<%} %>
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
		
		function invStat(invcode,invname)
		{
			openTab(invname+' <%=iyear%>年 订单情况','<%=request.getContextPath()+"/SaleStat/inv_stat_year.jsp?iyear="+iyear+"&invcode="%>'+invcode);
		}
		
		function custStat(custcode,custname)
		{
			openTab(custname+' <%=iyear%>年 订单情况','<%=request.getContextPath()+"/SaleStat/cust_stat_year.jsp?iyear="+iyear+"&custcode="%>'+custcode);
		}
		
		function personStat(personcode,personname)
		{
			openTab(personname+' <%=iyear%>年 订单情况','<%=request.getContextPath()+"/SaleStat/person_stat_year.jsp?iyear="+iyear+"&personcode="%>'+personcode);
		}
		
	</script>
</html>

