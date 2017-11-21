<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VDispatchCustInvMomObj"%> 
<%@page import="com.bass.searchcondition.VDispatchCustInvMomSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<%
 	// 当前上下文路径 
  	String contextPath = request.getContextPath(); 
   
  	// 该功能对象实例 
  	VDispatchCustInvMomObj domainInstance = (VDispatchCustInvMomObj) request.getAttribute("domainInstance"); 
  	// 该功能对象查询条件实例 
  	VDispatchCustInvMomSearchCondition domainSearchCondition = (VDispatchCustInvMomSearchCondition) request.getAttribute("domainSearchCondition"); 
  	// 用户信息 
  	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
  	// 该功能路径 
  	String basePath = domainInstance.getBasePath(); 
   
  	// 查询结果 
  	PaginationObj pagination = null; 
  	List list = new ArrayList(); 
   
  	Object paginationObj = request.getAttribute("domainPagination"); 
  	if (paginationObj != null) 
  	{ 
  		pagination = (PaginationObj) paginationObj; 
  		list = (List) pagination.getDataList(); 
  	} 
  	
  	// iyear
  	int iyear = domainSearchCondition.getIyear();
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" /> 
		<title><%=domainInstance.getCnName()%>列表</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
		<script type="text/javascript" src="../js/jquery.freezeheader.js"></script> 
		<script type="text/javascript">$(document).ready(function () {$("#export_table_no").freezeHeader();})</script> 
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=list4this"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="groupBy" name="groupBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getGroupBy(), "")%>">
			<input type="hidden" id="billType" name="billType" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getBillType(), "")%>"> 
			<input type="hidden" id="orderBy" name="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
			 
			<!-- 工具栏 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td style="width:220px"><%=domainInstance.getCnName(domainSearchCondition.getGroupBy(),domainSearchCondition.getBillType()) %></td>  
					<td>年份<%=DictionaryUtil.getSelectHtml("年字典","iyear",iyear+"",null,false)%></td>
					<td> 
						<input name="searchButton" type="button" class="button button_set" value="条件" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
						&nbsp;&nbsp; 
						<input name="helpButton" type="button" class="button button_comment" title="提示" onClick="$('#help_info_table').toggle();$('#showHelpInfoTable').val(!$('#help_info_table').is(':hidden'));"> 
					</td> 
				</tr> 
			</table> 
			<!-- 提示信息 -->  
			<table id="help_info_table" class="help_info_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowHelpInfoTable() ? "" : "none"%>'> 
				<tr> 
					<td> 
						<b>【提示】</b> 
						<ul> 
							<li><%=domainInstance.getCnName()%></li> 
						</ul> 
					</td> 
				</tr> 
			</table> 
			<!-- 查询条件 -->  
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowSearchConditionTable() ? "" : "none"%>'> 
				<%if(domainSearchCondition.GROUP_BY_CUST.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
				<tr> 
						<td><%=domainInstance.getPropertyCnName("ccuscode") %></td> 
						<td>
						<input name="ccuscode" type="text" id="ccuscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcuscode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ccusname") %></td> 
						<td>
						<input name="ccusname" type="text" id="ccusname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcusname(),"")%>" size="20" > 
						</td> 
				</tr> 
				
				<%} if(domainSearchCondition.GROUP_BY_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cinvcode") %></td> 
						<td>
						<input name="cinvcode" type="text" id="cinvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinvname") %></td> 
						<td>
						<input name="cinvname" type="text" id="cinvname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvname(),"")%>" size="20" > 
						</td> 
				</tr> 
				
				<%} if(domainSearchCondition.GROUP_BY_PERSON.equalsIgnoreCase(domainSearchCondition.getGroupBy())){%>
				<tr>
						<td><%=domainInstance.getPropertyCnName("cpersoncode") %></td> 
						<td>
						<input name="cpersoncode" type="text" id="cpersoncode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersoncode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cpersonname") %></td> 
						<td>
						<input name="cpersonname" type="text" id="cpersonname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersonname(),"")%>" size="20" > 
						</td> 
				</tr> 
				<%} %>
			</table> 
 
			<!-- 数据信息 -->  
			<table id="export_table" class="table table-bordered table-nowrap" align="center"> 
				<thead> 
					<tr> 
						<th rowspan="2">序号</th> 
						<%if(domainSearchCondition.GROUP_BY_CUST.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
						<th rowspan="2" onClick="sortBy(this)" db_col="ccuscode" class="<%=domainSearchCondition.getSortClassByDbColumn("ccuscode")%>"><%=domainInstance.getPropertyCnName("ccuscode") %></th> 
						<th rowspan="2" onClick="sortBy(this)" db_col="ccusname" class="<%=domainSearchCondition.getSortClassByDbColumn("ccusname")%>"><%=domainInstance.getPropertyCnName("ccusname") %></th> 
						
						<%} if(domainSearchCondition.GROUP_BY_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
						<th rowspan="2" onClick="sortBy(this)" db_col="cinvcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvcode")%>"><%=domainInstance.getPropertyCnName("cinvcode") %></th> 
						<th rowspan="2" onClick="sortBy(this)" db_col="cinvname" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvname")%>"><%=domainInstance.getPropertyCnName("cinvname") %></th> 
						
						<%} if(domainSearchCondition.GROUP_BY_PERSON.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
						<th rowspan="2" onClick="sortBy(this)" db_col="cpersoncode" class="<%=domainSearchCondition.getSortClassByDbColumn("cpersoncode")%>"><%=domainInstance.getPropertyCnName("cpersoncode") %></th> 
						<th rowspan="2" onClick="sortBy(this)" db_col="cpersonname" class="<%=domainSearchCondition.getSortClassByDbColumn("cpersonname")%>"><%=domainInstance.getPropertyCnName("cpersonname") %></th> 
						<%} %>
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_01_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_02_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_03_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_04_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_05_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_06_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_07_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_08_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_09_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_10_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_11_inatsum")%></th> 
						<th colspan="3"><%=domainInstance.getPropertyCnName("month_12_inatsum")%></th> 
						<th colspan="2">年度小计</th> 
					</tr> 
					<tr> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_01_inatsum")%>" onClick="sortBy(this)" db_col="month_01_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_01_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_01_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_01_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_01_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_02_inatsum")%>" onClick="sortBy(this)" db_col="month_02_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_02_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_02_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_02_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_02_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_03_inatsum")%>" onClick="sortBy(this)" db_col="month_03_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_03_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_03_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_03_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_03_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_04_inatsum")%>" onClick="sortBy(this)" db_col="month_04_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_04_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_04_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_04_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_04_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_05_inatsum")%>" onClick="sortBy(this)" db_col="month_05_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_05_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_05_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_05_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_05_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_06_inatsum")%>" onClick="sortBy(this)" db_col="month_06_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_06_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_06_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_06_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_06_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_07_inatsum")%>" onClick="sortBy(this)" db_col="month_07_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_07_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_07_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_07_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_07_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_08_inatsum")%>" onClick="sortBy(this)" db_col="month_08_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_08_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_08_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_08_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_08_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_09_inatsum")%>" onClick="sortBy(this)" db_col="month_09_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_09_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_09_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_09_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_09_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_10_inatsum")%>" onClick="sortBy(this)" db_col="month_10_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_10_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_10_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_10_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_10_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_11_inatsum")%>" onClick="sortBy(this)" db_col="month_11_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_11_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_11_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_11_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_11_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_12_inatsum")%>" onClick="sortBy(this)" db_col="month_12_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_12_inatsum_mom")%>" onClick="sortBy(this)" db_col="month_12_inatsum_mom">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("month_12_inatsum_yoy")%>" onClick="sortBy(this)" db_col="month_12_inatsum_yoy">同比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_inatsum")%>" onClick="sortBy(this)" db_col="year_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_inatsum_yoy">环比</th>
					</tr> 
				</thead> 
				<%
 					double 	
 							inatsum_01_total =0,
 							inatsum_02_total =0,
 							inatsum_03_total =0,
 							inatsum_04_total =0,
 							inatsum_05_total =0,
 							inatsum_06_total =0,
 							inatsum_07_total =0,
 							inatsum_08_total =0,
 							inatsum_09_total =0,
 							inatsum_10_total =0,
 							inatsum_11_total =0,
 							inatsum_12_total =0,
 							inatsum_year_total =0;
 							
 							for (int i = 0; i < list.size(); i++) 
 								{ 
 									VDispatchCustInvMomObj o = (VDispatchCustInvMomObj) list.get(i); 
 									
 									inatsum_01_total+=(o.getMonth_01_inatsum()==null?0:o.getMonth_01_inatsum());
 									inatsum_02_total+=(o.getMonth_02_inatsum()==null?0:o.getMonth_02_inatsum());
 									inatsum_03_total+=(o.getMonth_03_inatsum()==null?0:o.getMonth_03_inatsum());
 									inatsum_04_total+=(o.getMonth_04_inatsum()==null?0:o.getMonth_04_inatsum());
 									inatsum_05_total+=(o.getMonth_05_inatsum()==null?0:o.getMonth_05_inatsum());
 									inatsum_06_total+=(o.getMonth_06_inatsum()==null?0:o.getMonth_06_inatsum());
 									inatsum_07_total+=(o.getMonth_07_inatsum()==null?0:o.getMonth_07_inatsum());
 									inatsum_08_total+=(o.getMonth_08_inatsum()==null?0:o.getMonth_08_inatsum());
 									inatsum_09_total+=(o.getMonth_09_inatsum()==null?0:o.getMonth_09_inatsum());
 									inatsum_10_total+=(o.getMonth_10_inatsum()==null?0:o.getMonth_10_inatsum());
 									inatsum_11_total+=(o.getMonth_11_inatsum()==null?0:o.getMonth_11_inatsum());
 									inatsum_12_total+=(o.getMonth_12_inatsum()==null?0:o.getMonth_12_inatsum());
 									inatsum_year_total+=(o.getYear_inatsum()==null?0:o.getYear_inatsum());
 				%> 
				<tr> 
					<td style="width:50px;text-align:right"><%=i+1 %></td> 
					<%if(domainSearchCondition.GROUP_BY_CUST.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td><%=StringUtil.getNotEmptyStr(o.getCcuscode())%></td>  
					<td><a href="javascript:custInvYearStat('<%=iyear %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.getNotEmptyStr(o.getCcusname())%></a></td> 
					
					<%} if(domainSearchCondition.GROUP_BY_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td>  
					<td><a href="javascript:custInvYearStat('<%=iyear %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.getNotEmptyStr(o.getCinvname())%></a></td> 
					
					<%} if(domainSearchCondition.GROUP_BY_PERSON.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td><%=StringUtil.getNotEmptyStr(o.getCpersoncode())%></td>  
					<td><a href="javascript:custInvYearStat('<%=iyear %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.getNotEmptyStr(o.getCpersonname())%></a></td> 
					<%} %>
					
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvMonthStat('<%=iyear %>','1','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_01_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_01_inatsum_mom()!=null&&o.getMonth_01_inatsum_mom()<0?"#ffff66":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getMonth_01_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_01_inatsum_yoy()!=null&&o.getMonth_01_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getMonth_01_inatsum_yoy(),0)%></td> 
					<td style="text-align:right"><a href="javascript:custInvMonthStat('<%=iyear %>','2','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_02_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_02_inatsum_mom()!=null&&o.getMonth_02_inatsum_mom()<0?"#ffff66":"" %>""><%=StringUtil.formatDoublePercent(o.getMonth_02_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_02_inatsum_yoy()!=null&&o.getMonth_02_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getMonth_02_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvMonthStat('<%=iyear %>','3','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_03_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_03_inatsum_mom()!=null&&o.getMonth_03_inatsum_mom()<0?"#ffff66":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getMonth_03_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_03_inatsum_yoy()!=null&&o.getMonth_03_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getMonth_03_inatsum_yoy(),0)%></td>
					<td style="text-align:right"><a href="javascript:custInvMonthStat('<%=iyear %>','4','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_04_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_04_inatsum_mom()!=null&&o.getMonth_04_inatsum_mom()<0?"#ffff66":"" %>""><%=StringUtil.formatDoublePercent(o.getMonth_04_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_04_inatsum_yoy()!=null&&o.getMonth_04_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getMonth_04_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvMonthStat('<%=iyear %>','5','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_05_inatsum(),2)%></a></td>
					<td style="text-align:right;background-color:<%=o.getMonth_05_inatsum_mom()!=null&&o.getMonth_05_inatsum_mom()<0?"#ffff66":"#f6f6f6" %>""><%=StringUtil.formatDoublePercent(o.getMonth_05_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_05_inatsum_yoy()!=null&&o.getMonth_05_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getMonth_05_inatsum_yoy(),0)%></td> 
					<td style="text-align:right"><a href="javascript:custInvMonthStat('<%=iyear %>','6','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_06_inatsum(),2)%></a></td>
					<td style="text-align:right;background-color:<%=o.getMonth_06_inatsum_mom()!=null&&o.getMonth_06_inatsum_mom()<0?"#ffff66":"" %>""><%=StringUtil.formatDoublePercent(o.getMonth_06_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_06_inatsum_yoy()!=null&&o.getMonth_06_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getMonth_06_inatsum_yoy(),0)%></td> 
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvMonthStat('<%=iyear %>','7','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_07_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_07_inatsum_mom()!=null&&o.getMonth_07_inatsum_mom()<0?"#ffff66":"#f6f6f6" %>""><%=StringUtil.formatDoublePercent(o.getMonth_07_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_07_inatsum_yoy()!=null&&o.getMonth_07_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getMonth_07_inatsum_yoy(),0)%></td>
					<td style="text-align:right"><a href="javascript:custInvMonthStat('<%=iyear %>','8','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_08_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_08_inatsum_mom()!=null&&o.getMonth_08_inatsum_mom()<0?"#ffff66":"" %>""><%=StringUtil.formatDoublePercent(o.getMonth_08_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_08_inatsum_yoy()!=null&&o.getMonth_08_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getMonth_08_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvMonthStat('<%=iyear %>','9','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_09_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_09_inatsum_mom()!=null&&o.getMonth_09_inatsum_mom()<0?"#ffff66":"#f6f6f6" %>""><%=StringUtil.formatDoublePercent(o.getMonth_09_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_09_inatsum_yoy()!=null&&o.getMonth_09_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getMonth_09_inatsum_yoy(),0)%></td>
					<td style="text-align:right"><a href="javascript:custInvMonthStat('<%=iyear %>','10','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_10_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_10_inatsum_mom()!=null&&o.getMonth_10_inatsum_mom()<0?"#ffff66":"" %>""><%=StringUtil.formatDoublePercent(o.getMonth_10_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_10_inatsum_yoy()!=null&&o.getMonth_10_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getMonth_10_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvMonthStat('<%=iyear %>','11','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_11_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_11_inatsum_mom()!=null&&o.getMonth_11_inatsum_mom()<0?"#ffff66":"#f6f6f6" %>""><%=StringUtil.formatDoublePercent(o.getMonth_11_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_11_inatsum_yoy()!=null&&o.getMonth_11_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getMonth_11_inatsum_yoy(),0)%></td>
					<td style="text-align:right"><a href="javascript:custInvMonthStat('<%=iyear %>','12','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getMonth_12_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_12_inatsum_mom()!=null&&o.getMonth_12_inatsum_mom()<0?"#ffff66":"" %>""><%=StringUtil.formatDoublePercent(o.getMonth_12_inatsum_mom(),0)%></td> 
					<td style="text-align:right;background-color:<%=o.getMonth_12_inatsum_yoy()!=null&&o.getMonth_12_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getMonth_12_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#ffffcc"><a href="javascript:custInvYearStat('<%=iyear %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:#ffffcc"><%=StringUtil.formatDoublePercent(o.getYear_inatsum_yoy(),0)%></td>
				</tr> 
				<% 
					} 
				%> 
				<tr style="background-color:#ffffcc">
					<td>合计</td>
					<td></td>
					<td></td>
					<%if(domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td></td>
					<td></td>
					<%} %>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','1','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_01_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','2','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_02_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','3','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_03_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','4','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_04_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','5','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_05_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','6','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_06_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','7','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_07_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','8','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_08_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','9','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_09_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','10','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_10_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','11','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_11_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:monthPortal('<%=iyear %>','12','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_12_total,2) %></a></td>
					<td></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_year_total,2) %></a></td>
					<td></td>
				</tr>
		  </table> 
 
			<!-- 翻页操作栏 --> 
			<jsp:include page="../ToolBar/pagination_toolbar.jsp"> 
				<jsp:param name="basePath" value="<%=basePath%>"/> 
			</jsp:include> 
 
		</form>  
		<script type="text/javascript">  
		
			<%
		  	// billTypeName
		  	String billTypeName = VDispatchCustInvMomSearchCondition.BILL_TYPE_SALE.equalsIgnoreCase(domainSearchCondition.getBillType())?"订单":"发货";

			String servlet = VDispatchCustInvMomSearchCondition.BILL_TYPE_SALE.equalsIgnoreCase(domainSearchCondition.getBillType())?"SaleStat":"DispatchStat";
			%>
			
			function custInvMonthStat(iyear,imonth,groupBy,invcode,custcode,personcode)
			{
				openTab('月度<%=billTypeName%>概览','<%=contextPath%>/<%=servlet%>/'+getJspFile(groupBy)+'.jsp?iyear='+iyear+'&imonth='+imonth+'&invcode='+invcode+'&custcode='+custcode+'&personcode='+personcode);
			}
			
			function custInvYearStat(iyear,groupBy,invcode,custcode,personcode)
			{
				openTab('年度<%=billTypeName%>概览','<%=contextPath%>/<%=servlet%>/'+getJspFile(groupBy)+'_year.jsp?iyear='+iyear+'&invcode='+invcode+'&custcode='+custcode+'&personcode='+personcode);
			}
			
			function getJspFile(groupBy)
			{
				var jspfile = "inv_stat";
				if(groupBy=='<%=domainSearchCondition.GROUP_BY_INV%>')
				{
					jspfile = "inv_stat";
				}
				else if(groupBy=='<%=domainSearchCondition.GROUP_BY_CUST%>')
				{
					jspfile = "cust_stat";
				}
				else if(groupBy=='<%=domainSearchCondition.GROUP_BY_PERSON%>')
				{
					jspfile = "person_stat";
				}
				
				return jspfile;
			}
			
			function monthPortal(iyear,imonth,groupBy)
			{
				openTab('产品月度<%=billTypeName%>概览','<%=contextPath%>/<%=servlet%>/month_portal.jsp?iyear='+iyear+'&imonth='+imonth);
			}
			
			function yearPortal(iyear,groupBy)
			{
				openTab('产品年度<%=billTypeName%>概览','<%=contextPath%>/<%=servlet%>/year_portal.jsp?iyear='+iyear+'&imonth=12');
			}
		</script>  
 
	</body> 
</html> 
