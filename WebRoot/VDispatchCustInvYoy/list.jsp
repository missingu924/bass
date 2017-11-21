<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VDispatchCustInvYoyObj"%> 
<%@page import="com.bass.searchcondition.VDispatchCustInvYoySearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	VDispatchCustInvYoyObj domainInstance = (VDispatchCustInvYoyObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	VDispatchCustInvYoySearchCondition domainSearchCondition = (VDispatchCustInvYoySearchCondition) request.getAttribute("domainSearchCondition"); 
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
					<td></td>
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
			<table id="export_table" class="table table-bordered table-nowrap" align="center" width="98%"> 
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
				
						<th colspan="2"><%=iyear-9%></th> 
						<th colspan="2"><%=iyear-8%></th> 
						<th colspan="2"><%=iyear-7%></th> 
						<th colspan="2"><%=iyear-6%></th> 
						<th colspan="2"><%=iyear-5%></th> 
						<th colspan="2"><%=iyear-4%></th> 
						<th colspan="2"><%=iyear-3%></th> 
						<th colspan="2"><%=iyear-2%></th> 
						<th colspan="2"><%=iyear-1%></th> 
						<th colspan="2"><%=iyear-0%></th> 
						<th>小计</th> 
					</tr> 
					<tr>      
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_09_inatsum")%>" onClick="sortBy(this)" db_col="year_09_inatsum">金额</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_09_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_09_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_08_inatsum")%>" onClick="sortBy(this)" db_col="year_08_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_08_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_08_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_07_inatsum")%>" onClick="sortBy(this)" db_col="year_07_inatsum">金额</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_07_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_07_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_06_inatsum")%>" onClick="sortBy(this)" db_col="year_06_inatsum">金额</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_06_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_06_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_05_inatsum")%>" onClick="sortBy(this)" db_col="year_05_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_05_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_05_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_04_inatsum")%>" onClick="sortBy(this)" db_col="year_04_inatsum">金额</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_04_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_04_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_03_inatsum")%>" onClick="sortBy(this)" db_col="year_03_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_03_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_03_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_02_inatsum")%>" onClick="sortBy(this)" db_col="year_02_inatsum">金额</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_02_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_02_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_01_inatsum")%>" onClick="sortBy(this)" db_col="year_01_inatsum">金额</th>  
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_01_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_01_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_00_inatsum")%>" onClick="sortBy(this)" db_col="year_00_inatsum">金额</th> 
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_00_inatsum_yoy")%>" onClick="sortBy(this)" db_col="year_00_inatsum_yoy">环比</th>
						<th class="<%=domainSearchCondition.getSortClassByDbColumn("year_inatsum")%>" onClick="sortBy(this)" db_col="year_inatsum">金额</th>
					</tr> 
				</thead> 
				<%
 					double 	
 							inatsum_00_total =0,
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
 							inatsum_year_total =0;
 							
 							for (int i = 0; i < list.size(); i++) 
 								{ 
 									VDispatchCustInvYoyObj o = (VDispatchCustInvYoyObj) list.get(i); 
 									
 									inatsum_00_total+=(o.getYear_00_inatsum()==null?0:o.getYear_00_inatsum());
 									inatsum_01_total+=(o.getYear_01_inatsum()==null?0:o.getYear_01_inatsum());
 									inatsum_02_total+=(o.getYear_02_inatsum()==null?0:o.getYear_02_inatsum());
 									inatsum_03_total+=(o.getYear_03_inatsum()==null?0:o.getYear_03_inatsum());
 									inatsum_04_total+=(o.getYear_04_inatsum()==null?0:o.getYear_04_inatsum());
 									inatsum_05_total+=(o.getYear_05_inatsum()==null?0:o.getYear_05_inatsum());
 									inatsum_06_total+=(o.getYear_06_inatsum()==null?0:o.getYear_06_inatsum());
 									inatsum_07_total+=(o.getYear_07_inatsum()==null?0:o.getYear_07_inatsum());
 									inatsum_08_total+=(o.getYear_08_inatsum()==null?0:o.getYear_08_inatsum());
 									inatsum_09_total+=(o.getYear_09_inatsum()==null?0:o.getYear_09_inatsum());
 									inatsum_10_total+=(o.getYear_10_inatsum()==null?0:o.getYear_10_inatsum());
 									inatsum_year_total+=(o.getYear_inatsum()==null?0:o.getYear_inatsum());
 				%> 
				<tr> 
					<td style="width:50px;text-align:right"><%=i+1 %></td> 
					<%if(domainSearchCondition.GROUP_BY_CUST.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td><%=StringUtil.getNotEmptyStr(o.getCcuscode())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCcusname())%></td> 
					
					<%} if(domainSearchCondition.GROUP_BY_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%></td> 
					
					<%} if(domainSearchCondition.GROUP_BY_PERSON.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td><%=StringUtil.getNotEmptyStr(o.getCpersoncode())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCpersonname())%></td> 
					<%} %>
					
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvYearStat('<%=iyear-9 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_09_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getYear_09_inatsum_yoy()!=null&&o.getYear_09_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getYear_09_inatsum_yoy(),0)%></td> 
					<td style="text-align:right"><a href="javascript:custInvYearStat('<%=iyear-8 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_08_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getYear_08_inatsum_yoy()!=null&&o.getYear_08_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getYear_08_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvYearStat('<%=iyear-7 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_07_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getYear_07_inatsum_yoy()!=null&&o.getYear_07_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getYear_07_inatsum_yoy(),0)%></td>
					<td style="text-align:right"><a href="javascript:custInvYearStat('<%=iyear-6 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_06_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getYear_06_inatsum_yoy()!=null&&o.getYear_06_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getYear_06_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvYearStat('<%=iyear-5 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_05_inatsum(),2)%></a></td>
					<td style="text-align:right;background-color:<%=o.getYear_05_inatsum_yoy()!=null&&o.getYear_05_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getYear_05_inatsum_yoy(),0)%></td> 
					<td style="text-align:right"><a href="javascript:custInvYearStat('<%=iyear-4 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_04_inatsum(),2)%></a></td>
					<td style="text-align:right;background-color:<%=o.getYear_04_inatsum_yoy()!=null&&o.getYear_04_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getYear_04_inatsum_yoy(),0)%></td> 
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvYearStat('<%=iyear-3 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_03_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getYear_03_inatsum_yoy()!=null&&o.getYear_03_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getYear_03_inatsum_yoy(),0)%></td>
					<td style="text-align:right"><a href="javascript:custInvYearStat('<%=iyear-2 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_02_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getYear_02_inatsum_yoy()!=null&&o.getYear_02_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getYear_02_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#f6f6f6"><a href="javascript:custInvYearStat('<%=iyear-1 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_01_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getYear_01_inatsum_yoy()!=null&&o.getYear_01_inatsum_yoy()<0?"#ffcc99":"#f6f6f6" %>"><%=StringUtil.formatDoublePercent(o.getYear_01_inatsum_yoy(),0)%></td>
					<td style="text-align:right"><a href="javascript:custInvYearStat('<%=iyear-0 %>','<%=domainSearchCondition.getGroupBy()%>','<%=o.getCinvcode() %>','<%=o.getCcuscode() %>','<%=o.getCpersoncode() %>')"><%=StringUtil.formatDouble(o.getYear_00_inatsum(),2)%></a></td> 
					<td style="text-align:right;background-color:<%=o.getYear_00_inatsum_yoy()!=null&&o.getYear_00_inatsum_yoy()<0?"#ffcc99":"" %>"><%=StringUtil.formatDoublePercent(o.getYear_00_inatsum_yoy(),0)%></td>
					<td style="text-align:right;background-color:#ffffcc"><%=StringUtil.formatDouble(o.getYear_inatsum(),2)%></td> 
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
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-9 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_09_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-8 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_08_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-7 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_07_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-6 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_06_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-5 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_05_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-4 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_04_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-3 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_03_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-2 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_02_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-1 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_01_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><a href="javascript:yearPortal('<%=iyear-0 %>','<%=domainSearchCondition.getGroupBy()%>')"><%=StringUtil.formatDouble(inatsum_00_total,2) %></a></td>
					<td></td>
					<td style="text-align:right"><%=StringUtil.formatDouble(inatsum_year_total,2) %></td>
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
		  	String billTypeName = VDispatchCustInvYoySearchCondition.BILL_TYPE_SALE.equalsIgnoreCase(domainSearchCondition.getBillType())?"订单":"发货";

			String servlet = VDispatchCustInvYoySearchCondition.BILL_TYPE_SALE.equalsIgnoreCase(domainSearchCondition.getBillType())?"SaleStat":"DispatchStat";
			%>
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
			
			function yearPortal(iyear,groupBy)
			{
				openTab('产品年度<%=billTypeName%>概览','<%=contextPath%>/<%=servlet%>/year_portal.jsp?iyear='+iyear+'&imonth=12');
			}
		</script>  
 
	</body> 
</html> 
