<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.auth.obj.AuthLogOperationObj"%> 
<%@page import="com.wuyg.auth.searchcondition.AuthLogOperationSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	AuthLogOperationObj domainInstance = (AuthLogOperationObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	 com.wuyg.auth.searchcondition.AuthLogOperationSearchCondition domainSearchCondition = (com.wuyg.auth.searchcondition.AuthLogOperationSearchCondition) request.getAttribute("domainSearchCondition"); 
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
		<title><%=domainInstance.getCnName() %>列表</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
		<script type="text/javascript" src="../js/jquery.freezeheader.js"></script> 
		<script type="text/javascript">$(document).ready(function () {$("#data_table").freezeHeader();})</script> 
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=list4this"> 
			 
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="98%"> 
				<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
				<tr> 
					<td><%=domainInstance.getCnName() %></td> 
					<td></td>
					<td> 
						<input name="searchButton" type="button" class="button button_search" value="查询数据" onClick="toPage(1)"> 
						<input name="searchButton" type="button" class="button button_set" value="高级查询" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
			
						&nbsp;&nbsp; 
						<input name="helpButton" type="button" class="button button_comment" title="提示" onClick="$('#help_info_table').toggle();$('#showHelpInfoTable').val(!$('#help_info_table').is(':hidden'));"> 
					</td> 
				</tr> 
			</table> 
			<table id="help_info_table" class="help_info_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowHelpInfoTable() ? "" : "none"%>'> 
			<input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>"> 
				<tr> 
					<td> 
						<b>【提示】</b> 
						<ul> 
							<li><%=domainInstance.getCnName() %></li> 
						</ul> 
					</td> 
				</tr> 
			</table> 
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowSearchConditionTable() ? "" : "none"%>'> 
							<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("useraccount") %></td> 
						<td>
						<input name="useraccount" type="text" id="useraccount" value="<%=StringUtil.getNotEmptyStr(domainInstance.getUseraccount(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("username") %></td> 
						<td>
						<input name="username" type="text" id="username" value="<%=StringUtil.getNotEmptyStr(domainInstance.getUsername(),"")%>" size="20" > 
						</td> 

				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("module_name") %></td> 
						<td>
						<input name="module_name" type="text" id="module_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getModule_name(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("module_method") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("操作名字典", "module_method", StringUtil.getNotEmptyStr(domainInstance.getModule_method(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("timestamp") %></td> 
						<td>
						<input name="timestamp_min" type="text" id="timestamp_min" value="<%=TimeUtil.date2str(domainSearchCondition.getTimestamp_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="timestamp_max" type="text" id="timestamp_max" value="<%=TimeUtil.date2str(domainSearchCondition.getTimestamp_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
				</tr> 
			</table> 
 
			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
				<input type="hidden" name="orderBy" id="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
					<tr> 
						<th onClick="sortBy(this)" db_col="id" class="<%=domainSearchCondition.getSortClassByDbColumn("id")%>"><%=domainInstance.getPropertyCnName("id") %></th> 
						<th onClick="sortBy(this)" db_col="useraccount" class="<%=domainSearchCondition.getSortClassByDbColumn("useraccount")%>"><%=domainInstance.getPropertyCnName("useraccount") %></th> 
						<th onClick="sortBy(this)" db_col="username" class="<%=domainSearchCondition.getSortClassByDbColumn("username")%>"><%=domainInstance.getPropertyCnName("username") %></th> 
						<th onClick="sortBy(this)" db_col="module_name" class="<%=domainSearchCondition.getSortClassByDbColumn("module_name")%>"><%=domainInstance.getPropertyCnName("module_name") %></th> 
						<th onClick="sortBy(this)" db_col="module_method" class="<%=domainSearchCondition.getSortClassByDbColumn("module_method")%>"><%=domainInstance.getPropertyCnName("module_method") %></th> 
						<th onClick="sortBy(this)" db_col="timestamp" class="<%=domainSearchCondition.getSortClassByDbColumn("timestamp")%>"><%=domainInstance.getPropertyCnName("timestamp") %></th> 
						<th>操作</th>
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							AuthLogOperationObj o = (AuthLogOperationObj) list.get(i); 
				%> 
				<tr> 
					<td><%=StringUtil.getNotEmptyStr(o.getId())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getUseraccount())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getUsername())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getModule_name())%></td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("操作名字典",o.getModule_method()+"")%></td>  
					<td><%=TimeUtil.date2str(o.getTimestamp())%></td> 
					<td style="text-align:center"> 
						<input type="button" class="button button_detail" title="详情" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=detail4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
					</td> 
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
 
	</body> 
</html> 
