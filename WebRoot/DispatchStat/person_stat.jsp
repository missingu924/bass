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
<%@page import="com.u8.obj.PersonObj"%>
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
			int imonth = StringUtil.parseInt(StringUtil.getNotEmptyStr(request.getParameter("imonth"), TimeUtil.nowTime2str("MM")));

			String startTimeMonth = TimeUtil.date2str(TimeUtil.getTheFirstDayOfTheMonth(iyear, imonth), "yyyy-MM-dd 00:00:00");
			String endTimeMonth = TimeUtil.date2str(TimeUtil.getTheLastDayOfTheMonth(iyear, imonth), "yyyy-MM-dd 23:59:59");

			// 上月、下月
			int iPreYear = iyear;
			int iPreMonth = imonth;
			int iNextYear = iyear;
			int iNextMonth = imonth;

			if (imonth == 1)
			{
				iPreMonth = 12;
				iPreYear = iyear - 1;
				iNextMonth = imonth + 1;
				iNextYear = iyear;
			} else if (imonth == 12)
			{
				iPreMonth = imonth - 1;
				iPreYear = iyear;
				iNextMonth = 1;
				iNextYear = iyear + 1;
			} else
			{
				iPreMonth = imonth - 1;
				iPreYear = iyear;
				iNextMonth = imonth + 1;
				iNextYear = iyear;
			}
			
			// 产品编码或名称
			String personname = request.getParameter("personname");
			String personcode = request.getParameter("personcode");
			
			PersonObj person = new PersonObj();
			if(personname!=null)
			{
				person.setCpersonname(personname);
			}
			if(personcode!=null)
			{
				person.setCpersoncode(personcode);
			}
			BaseDbObj dbObj = person.searchByInstance(SystemConstant.U8_DB);
			if(dbObj!=null)
			{
				person = (PersonObj) dbObj;
		
				personcode = person.getCpersoncode();
				personname = person.getCpersonname();
			}
			
			int recentYears = 10; //近多少年的统计
			
			// 按产品统计
			String invStatSql = "select round(isnull(sum(iNatSum)/10000,0),4) value ,inv.cInvName name, dls.cinvcode code from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID left join inventory inv on dls.cInvCode=inv.cInvCode where dDate>='"
			+ (startTimeMonth) + "' and dDate<='" + (endTimeMonth) + "' and dl.cpersoncode='"+personcode+"' group by dls.cinvcode,inv.cInvName";
			List invList = EchartsUtil.getInvListByInvSql(invStatSql, "value desc", "各产品发货金额（万元）", "产品", "发货金额（万元）");
			
			// 按客户统计
			String custStatSql = "select round(isnull(sum(iNatSum)/10000,0),4) value ,cust.cCusName name,dl.cCusCode code from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID left join customer cust on dl.cCusCode=cust.cCusCode left join inventory inv on dls.cinvcode=inv.cinvcode where dDate>='"
			+ (startTimeMonth) + "' and dDate<='" + (endTimeMonth) + "' and dl.cpersoncode='"+personcode+"' group by dl.cCusCode,cust.cCusName";
			List custList = EchartsUtil.getInvListByInvSql(custStatSql, "value desc", "各客户发货金额（万元）", "客户", "发货金额（万元）");
	%>
	<body>
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/DispatchStat/person_stat.jsp">
		
			<table align="center" width="98%">
				<tr>
					<td align="center">
						<a href="<%=request.getContextPath()%>/DispatchStat/person_stat.jsp?iyear=<%=iPreYear%>&imonth=<%=iPreMonth%>&personcode=<%=personcode%>"><input type="button" class="button button_left" title="上月" /> </a> &nbsp;
						<span style="color: #2281c8; font-size: 16px;"><%=person.getCpersonname()+" "+iyear+"年"+imonth+"月"%> 发货情况</span>&nbsp;
						<a href="<%=request.getContextPath()%>/DispatchStat/person_stat.jsp?iyear=<%=iNextYear%>&imonth=<%=iNextMonth%>&personcode=<%=personcode%>"><input type="button" class="button button_right" title="下月" /> </a>
					</td>
				</tr>
				<tr>
					<td align="center" style="color:#666666;font-size:14px" height="40px">
						业务员编码：<%=person.getCpersoncode()%>&nbsp;&nbsp;&nbsp;&nbsp;
						业务员名称：<%=person.getCpersonname()%>
					</td>
				</tr>
			</table>
			
			<table align="center" width="98%" class="title_table">
				<tr>
					<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
						<%=imonth%>月份 发货业绩
					</td>
				</tr>
			</table>
			<table id="overview_table" width="98%" align="center" class="table_goal">
				<tr onclick="openTab('业务员 <%=personname+" "+iyear+"年"+imonth+"月"%> 明细','<%=request.getContextPath()%>/Proxy/Servlet?servlet=VDispatchLists&method=list4this&ddate_min=<%=startTimeMonth%>&ddate_max=<%=endTimeMonth%>&cpersoncode=<%=personcode%>')">
					<td width="33%" height="120">
						<p>
							<span class="lcd_blue_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select count(*) value from DispatchList dl where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"' and cpersoncode='"+personcode+"'"), 0)%>
							</span>
						</p>
						<p>
							月度发货单数
						</p>
					</td>
					<td width="33%">
						<p>
							<span class="lcd_blue_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iQuantity),0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"' and cpersoncode='"+personcode+"'"), 0)%>
							</span>
						</p>
						<p>
							月度发货数量
						</p>
					</td>
					<td width="33%">
						<p>
							<span class="lcd_blue_big">
							<%=StringUtil.formatDouble(EchartsUtil.getValueByInvSql("select isnull(sum(iNatSum)/10000,0) value from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where dDate>='"+startTimeMonth+"' and dDate<='"+endTimeMonth+"' and cpersoncode='"+personcode+"'"), 4)%>
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
						该业务员 <%=imonth%>月份 产品发货分布
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
						该业务员 <%=imonth%>月份 客户发货分布
					</td>
				</tr>
			</table>
			<table align="center" width="98%">
				<tr>
					<td align="center" valign="middle">
						<%=EchartsUtil.createEchartByInvDatalist(custList, EchartsUtil.PIE, EchartsUtil.THEME_MACARONS, "", 500, 400, "dislist4cust(params.data.code,params.data.name)")%>
					</td>
					<td align="center" valign="middle">
						<%=EchartsUtil.createTableByInvDatalist(custList, 0, 300, "dislist4cust(params.data.code,params.data.name)")%>
					</td>
				</tr>
			</table>
			
			<table align="center" width="98%" class="title_table">
				<tr>
					<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
						该业务员 近12个月 月度发货趋势
					</td>
				</tr>
			</table>
			<table id="12month_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(DispatchPortalUtil.getRecentMonthSql4personcount(iyear+"",imonth+"",12,null,null,personcode), "", "", new String[]{"发货金额","发货金额"}, new String[]{"近12个月发货金额（万元）","去年同期发货金额（万元）"}, EchartsUtil.BAR, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_BLUE, 300, 0, "openTab('业务员 "+personname+" '+params.data.name+' 发货情况','"+request.getContextPath()+"/DispatchStat/person_stat.jsp?personcode="+personcode+"&iyear='+params.data.name.substr(0,4)+'&imonth='+params.data.name.substr(5,6))")%>
				</td>
			</tr>
			</table>
			
			<table align="center" width="98%" class="title_table">
				<tr>
					<td style="text-align: left; color: #0055a8; border-bottom: 1px solid #dddddd;">
						该业务员 近<%=recentYears%>年 年度发货趋势
					</td>
				</tr>
			</table>
			<table id="12month_table" align="center" width="98%">
			<tr>
				<td align="center">
					<%=EchartsUtil.createEchartByInvSql(DispatchPortalUtil.getRecentYearSql(iyear+"",recentYears,null,null,personcode), "", "", new String[]{"发货金额"}, new String[]{"发货金额（万元）"}, EchartsUtil.BAR, EchartsUtil.THEME_MACARONS, EchartsUtil.COLOR_BLUE, 300, 0, "openTab('业务员 "+personname+" '+params.data.name+' 发货情况','"+request.getContextPath()+"/DispatchStat/person_stat_year.jsp?personcode="+personcode+"&iyear='+params.data.name.substr(0,4)+'&imonth='+params.data.name.substr(5,6))")%>
				</td>
			</tr>
			</table>
			
		</form>
		
		<script type="text/javascript">
			function dislist(invcode,invname)
			{
				openTab('业务员 <%=personname+" "+iyear+"/"+imonth+" " %>'+invname+' 发货明细','<%=request.getContextPath() %>/Proxy/Servlet?servlet=VDispatchLists&method=list4this&ddate_min=<%=startTimeMonth %>&ddate_max=<%=endTimeMonth %>&cpersoncode=<%=personcode %>&cinvcode='+invcode);
			}
			
			function dislist4cust(custcode,custname)
			{
				openTab('业务员 <%=personname+" "+iyear+"/"+imonth+" " %>'+custname+' 发货明细','<%=request.getContextPath() %>/Proxy/Servlet?servlet=VDispatchLists&method=list4this&ddate_min=<%=startTimeMonth %>&ddate_max=<%=endTimeMonth %>&cpersoncode=<%=personcode %>&ccuscode='+custcode);
			}
		</script>
	</body>
</html>

