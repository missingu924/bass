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
<%@page import="com.u8.obj.InventoryObj"%>
<%@page import="com.wuyg.common.dao.BaseDbObj"%>
<%@page import="com.u8.obj.CustomerObj"%>
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
		
		// 产品编码或名称
		String custname = request.getParameter("custname");
		String custcode = request.getParameter("custcode");
		
		CustomerObj cust = new CustomerObj();
		if(custname!=null)
		{
			cust.setCcusname(custname);
		}
		if(custcode!=null)
		{
			cust.setCcuscode(custcode);
		}
		BaseDbObj dbObj = cust.searchByInstance(SystemConstant.U8_DB);
		if(dbObj!=null)
		{
			cust = (CustomerObj) dbObj;
			
			custcode = cust.getCcuscode();
			custname = cust.getCcusname();
		}
		
		// 按产品统计
		String invStatSql = "select dls.cinvcode code,round(isnull(sum(iSum)/10000,0),1) value ,inv.cInvName name from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID left join inventory inv on dls.cInvCode=inv.cInvCode where dDate>='"
				+ ("year".equalsIgnoreCase(stat_type) ? startTimeYear : startTimeMonth) + "' and dDate<='" + ("year".equalsIgnoreCase(stat_type) ? endTimeYear : endTimeMonth) + "' and dl.ccuscode='"+custcode+"' group by dls.cinvcode,inv.cInvName";
		List invList = EchartsUtil.getInvListByInvSql(invStatSql, "value desc", "各产品销售额（万元）", "产品", "各产品销售额（万元）");
	%>
	<body>
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/SaleStat/cust_stat.jsp">
		
			<table align="center" width="98%">
				<tr>
					<td align="center">
						<a href="<%=request.getContextPath()%>/SaleStat/cust_stat.jsp?iYear=<%=iPreYear%>&iMonth=<%=iPreMonth%>&custcode=<%=custcode %>"><input type="button" class="button button_left" title="上月" /> </a> &nbsp;
						<span style="color: #2281c8; font-size: 16px;"><%=cust.getCcusname() %> <%=iYear%>年<%=iMonth%>月 销售情况</span>&nbsp;
						<a href="<%=request.getContextPath()%>/SaleStat/cust_stat.jsp?iYear=<%=iNextYear%>&iMonth=<%=iNextMonth%>&custcode=<%=custcode %>"><input type="button" class="button button_right" title="下月" /> </a>
					</td>
				</tr>
				<tr>
					<td align="center" style="color:#999999;font-size:12px" height="40px">
						编码：<%=cust.getCcuscode() %>&nbsp;&nbsp;&nbsp;&nbsp;
						名称：<%=cust.getCcusname() %>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			
			<table align="center" width="98%" class="title_table">
				<tr>
					<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
						<%=iMonth %>月份销售业绩
					</td>
				</tr>
			</table>
			<table id="overview_table" width="98%" align="center" class="table_goal">
				<tr>
					<td width="33%" height="120">
						<p>
							<span class="lcd_green_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(*) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"' and ccuscode='"+custcode+"'"), 0)%>
							</span>
						</p>
						<p>
							月度发货单数
						</p>
					</td>
					<td width="33%">
						<p>
							<span class="lcd_green_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iQuantity),0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"' and ccuscode='"+custcode+"'"), 0)%>
							</span>
						</p>
						<p>
							月度发货数量
						</p>
					</td>
					<td width="33%">
						<p>
							<span class="lcd_green_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iSum)/10000,0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"' and ccuscode='"+custcode+"'"), 2)%>
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
						<%=iMonth %>月份该客户产品分布
					</td>
				</tr>
			</table>
			<table align="center" width="98%">
				<tr>
					<td align="center" valign="middle">
						<%=EchartsUtil.createEchartByInvDatalist(invList, EchartsUtil.PIE, EchartsUtil.THEME_SHINE, "", 500, 400, null)%>
					</td>
					<td align="center" valign="middle">
						<%=EchartsUtil.createTableByInvDatalist(invList, 0, 300)%>
					</td>
				</tr>
			</table>
			
			<table align="center" width="98%" class="title_table">
				<tr>
					<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
						该客户近12个月销售情况
					</td>
				</tr>
			</table>
			<table id="12month_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(PortalUtil.getRecentMonthSql(iYear+"",iMonth+"",12,null,custcode), "", "", new String[]{"销售额","销售额"}, new String[]{"近12个月销售额（万元）","去年同期销售额（万元）"}, EchartsUtil.BAR, EchartsUtil.THEME_ROMA, EchartsUtil.COLOR_BLUE, 300, 0, null)%>
				</td>
			</tr>
			</table>
			
		</form>
	</body>
</html>

