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
			int iyear = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("iyear"), TimeUtil.nowTime2str("yyyy")));

			String startTimeYear = iyear+"-01-01 00:00:00";
			String endTimeYear = iyear+"-12-31 23:59:59";

			// 上年、下年
			int iPreYear = iyear-1;
			int iNextYear = iyear+1;
			
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
			String invStatSql = "select round(isnull(sum(iNatSum)/10000,0),4) value ,inv.cInvName name, dls.cinvcode code from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID left join inventory inv on dls.cInvCode=inv.cInvCode where dDate>='"
			+ (startTimeYear) + "' and dDate<='" + (endTimeYear) + "' and dl.ccuscode='"+custcode+"' group by dls.cinvcode,inv.cInvName";
			List invList = EchartsUtil.getInvListByInvSql(invStatSql, "value desc", "各产品发货金额（万元）", "产品", "发货金额（万元）");
	%>
	<body>
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/DispatchStat/cust_stat_year.jsp">
		
			<table align="center" width="98%">
				<tr>
					<td align="center">
						<a href="<%=request.getContextPath()%>/DispatchStat/cust_stat_year.jsp?iyear=<%=iPreYear%>&custcode=<%=custcode%>"><input type="button" class="button button_left" title="上月" /> </a> &nbsp;
						<span style="color: #2281c8; font-size: 16px;"><%=cust.getCcusname()+" "+iyear+"年"%> 发货情况</span>&nbsp;
						<a href="<%=request.getContextPath()%>/DispatchStat/cust_stat_year.jsp?iyear=<%=iNextYear%>&custcode=<%=custcode%>"><input type="button" class="button button_right" title="下月" /> </a>
					</td>
				</tr>
				<tr>
					<td align="center" style="color:#666666;font-size:14px" height="40px">
						客户编码：<%=cust.getCcuscode()%>&nbsp;&nbsp;&nbsp;&nbsp;
						客户名称：<%=cust.getCcusname()%>
					</td>
				</tr>
			</table>
			
			<table align="center" width="98%" class="title_table">
				<tr>
					<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
						<%=iyear%>年发货业绩
					</td>
				</tr>
			</table>
			<table id="overview_table" width="98%" align="center" class="table_goal">
				<tr onclick="openTab('客户 <%=custname+" "+iyear+"年"%> 明细','<%=request.getContextPath()%>/Proxy/Servlet?servlet=VDispatchLists&method=list4this&ddate_min=<%=startTimeYear%>&ddate_max=<%=endTimeYear%>&ccuscode=<%=custcode%>')">
					<td width="33%" height="120">
						<p>
							<span class="lcd_blue_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(*) value from DispatchList dl where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"' and ccuscode='"+custcode+"'"), 0)%>
							</span>
						</p>
						<p>
							年度发货单数
						</p>
					</td>
					<td width="33%">
						<p>
							<span class="lcd_blue_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iQuantity),0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"' and ccuscode='"+custcode+"'"), 0)%>
							</span>
						</p>
						<p>
							年度发货数量
						</p>
					</td>
					<td width="33%">
						<p>
							<span class="lcd_blue_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iNatSum)/10000,0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeYear+"' and dDate<='"+endTimeYear+"' and ccuscode='"+custcode+"'"), 4)%>
							</span>
						</p>
						<p>
							年度发货金额（万元）
						</p>
					</td>
				</tr>
			</table>
			
			
			<table align="center" width="98%" class="title_table">
				<tr>
					<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
						该客户 <%=iyear%>年 产品分布
					</td>
				</tr>
			</table>
			<table align="center" width="98%">
				<tr>
					<td align="center" valign="middle">
						<%=EchartsUtil.createEchartByInvDatalist(invList, EchartsUtil.PIE, EchartsUtil.THEME_MACARONS, "", 500, 400, "dislist(params.data.code,params.data.name)")%>
					</td>
					<td align="center" valign="middle">
						<%=EchartsUtil.createTableByInvDatalist(invList, 0, 300,"dislist(params.data.code,params.data.name)")%>
					</td>
				</tr>
			</table>
			
			<table align="center" width="98%" class="title_table">
				<tr>
					<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
						该客户 <%=iyear%>年 月度发货趋势
					</td>
				</tr>
			</table>
			<table id="12month_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(DispatchPortalUtil.getRecentMonthSql4isum(iyear+"","12",12,null,custcode,null), "", "", new String[]{"发货金额","发货金额"}, new String[]{"月发货金额（万元）","去年同期发货金额（万元）"}, EchartsUtil.BAR, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_BLUE, 300, 0, "openTab('客户 "+custname+" '+params.data.name+' 发货情况','"+request.getContextPath()+"/DispatchStat/cust_stat.jsp?custcode="+custcode+"&iyear='+params.data.name.substr(0,4)+'&imonth='+params.data.name.substr(5,6))")%>
				</td>
			</tr>
			</table>
			
		</form>
		
		<script type="text/javascript">
			function dislist(invcode,invname)
			{
				openTab('客户 <%=custname+" "+iyear+" 年 " %>'+invname+' 发货明细','<%=request.getContextPath() %>/Proxy/Servlet?servlet=VDispatchLists&method=list4this&ddate_min=<%=startTimeYear %>&ddate_max=<%=endTimeYear %>&ccuscode=<%=custcode %>&cinvcode='+invcode);
			}
		</script>
	</body>
</html>

