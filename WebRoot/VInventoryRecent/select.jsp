<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VInventoryRecentObj"%> 
<%@page import="com.bass.searchcondition.VInventoryRecentSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	VInventoryRecentObj domainInstance = (VInventoryRecentObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	VInventoryRecentSearchCondition domainSearchCondition = (VInventoryRecentSearchCondition) request.getAttribute("domainSearchCondition"); 
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
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" /> 
		<title><%=domainInstance.getCnName() %>选择</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
		<script type="text/javascript" src="../js/jquery.freezeheader.js"></script> 
		<script type="text/javascript">$(document).ready(function () {$("#data_table").freezeHeader();})</script> 
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=list4this"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="orderBy" name="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
			 
			<!-- 工具栏 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td><%=domainInstance.getCnName() %></td>  
					<td></td> 
					<td> 
						<input name="searchButton" type="button" class="button button_set" value="条件" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
					</td> 
				</tr> 
			</table> 
			<!-- 查询条件 -->  
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowSearchConditionTable() ? "" : "none"%>'> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cinvcode") %></td> 
						<td>
						<input name="cinvcode" type="text" id="cinvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinvname") %></td> 
						<td>
						<input name="cinvname" type="text" id="cinvname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("drecentdate") %></td> 
						<td>
						<input name="drecentdate_min" type="text" id="drecentdate_min" value="<%=TimeUtil.date2str(domainSearchCondition.getDrecentdate_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="drecentdate_max" type="text" id="drecentdate_max" value="<%=TimeUtil.date2str(domainSearchCondition.getDrecentdate_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("idays") %></td> 
						<td>
						<input name="idays_min" type="text" id="idays_min" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getIdays_min(),"")%>" size="9" >- 
						<input name="idays_max" type="text" id="idays_max" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getIdays_max(),"")%>" size="9" > 
						</td> 
					<td></td><td></td> 
					<td></td><td></td> 
				</tr> 
			</table> 
 
			<!-- 数据信息 -->  
			<table id="data_table" class="table table-bordered" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th>序号</th> 
						<th onClick="sortBy(this)" db_col="cinvcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvcode")%>"><%=domainInstance.getPropertyCnName("cinvcode") %></th> 
						<th onClick="sortBy(this)" db_col="cinvname" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvname")%>"><%=domainInstance.getPropertyCnName("cinvname") %></th> 
						<th onClick="sortBy(this)" db_col="cinvstd" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvstd")%>"><%=domainInstance.getPropertyCnName("cinvstd") %></th> 
						<th onClick="sortBy(this)" db_col="ccomunitname" class="<%=domainSearchCondition.getSortClassByDbColumn("ccomunitname")%>"><%=domainInstance.getPropertyCnName("ccomunitname") %></th> 
						<th onClick="sortBy(this)" db_col="drecentdate" class="<%=domainSearchCondition.getSortClassByDbColumn("drecentdate")%>"><%=domainInstance.getPropertyCnName("drecentdate") %></th> 
						<th onClick="sortBy(this)" db_col="idays" class="<%=domainSearchCondition.getSortClassByDbColumn("idays")%>"><%=domainInstance.getPropertyCnName("idays") %></th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							VInventoryRecentObj o = (VInventoryRecentObj) list.get(i); 
				%> 
				<tr onclick='confirmSelect(this)' value='<%=o.toString() %>'> 
					<td style="width:30px;text-align:right"><%=i+1 %></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvstd())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcomunitname())%></td> 
					<td><%=TimeUtil.date2str(o.getDrecentdate(),"yyyy-MM-dd")%></td> 
					<td style="text-align:right"><%=StringUtil.getNotEmptyStr(o.getIdays())%></td> 
				</tr> 
				<% 
					} 
				%> 
			</table> 
 
			<!-- 翻页操作栏 --> 
			<jsp:include page="../ToolBar/pagination_toolbar.jsp"> 
				<jsp:param name="basePath" value="<%=basePath%>"/> 
			</jsp:include> 
 
		</form>  
		<script type="text/javascript">  
			// 双击选择  
			function confirmSelect(tr)  
			{  
			window.returnValue = $(tr).attr("value");  
			window.close();  
			}  
		</script>  
 
	</body> 
</html> 
