<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.hcp.obj.HcpDataSourceObj"%> 
<%@page import="com.hcp.searchcondition.HcpDataSourceSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	HcpDataSourceObj domainInstance = (HcpDataSourceObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	 com.hcp.searchcondition.HcpDataSourceSearchCondition domainSearchCondition = (com.hcp.searchcondition.HcpDataSourceSearchCondition) request.getAttribute("domainSearchCondition"); 
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
			 
			 <input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			 <input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>">
			 <input type="hidden" name="orderBy" id="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
				
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td><%=domainInstance.getCnName() %></td> 
					<td></td> 
					<td> 
						<input name="searchButton" type="button" class="button button_search" value="查询数据" onClick="toPage(1)"> 
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this')"> 
						<input name="searchButton" type="button" class="button button_set" value="高级查询" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
						&nbsp;&nbsp;
						<input name="helpButton" type="button" class="button button_comment" title="提示" onClick="$('#help_info_table').toggle();$('#showHelpInfoTable').val(!$('#help_info_table').is(':hidden'));">
					</td>
				</tr>
			</table>
			<table id="help_info_table" class="help_info_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowHelpInfoTable() ? "" : "none"%>'>
				<tr>
					<td>
						<b>【提示】</b>
						<ul>
							<li><%=domainInstance.getCnName() %>管理</li>
						</ul>
					</td>
				</tr>
			</table>
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowSearchConditionTable() ? "" : "none"%>'> 
							<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("ds_name") %></td> 
						<td>
						<input name="ds_name" type="text" id="ds_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_name(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ds_db_type") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("数据库类型字典", "ds_db_type", StringUtil.getNotEmptyStr(domainInstance.getDs_db_type(), ""),20)%> 
						</td> 
					<td></td><td></td> 
					<td></td><td></td> 
				</tr> 
			</table> 
 
			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th onClick="sortBy(this)" db_col="ds_code" class="<%=domainSearchCondition.getSortClassByDbColumn("ds_code")%>"><%=domainInstance.getPropertyCnName("ds_code") %></th> 
						<th onClick="sortBy(this)" db_col="ds_name" class="<%=domainSearchCondition.getSortClassByDbColumn("ds_name")%>"><%=domainInstance.getPropertyCnName("ds_name") %></th> 
						<th onClick="sortBy(this)" db_col="ds_db_type" class="<%=domainSearchCondition.getSortClassByDbColumn("ds_db_type")%>"><%=domainInstance.getPropertyCnName("ds_db_type") %></th> 
						<th onClick="sortBy(this)" db_col="ds_db_ip" class="<%=domainSearchCondition.getSortClassByDbColumn("ds_db_ip")%>"><%=domainInstance.getPropertyCnName("ds_db_ip") %></th> 
						<th onClick="sortBy(this)" db_col="ds_db_port" class="<%=domainSearchCondition.getSortClassByDbColumn("ds_db_port")%>"><%=domainInstance.getPropertyCnName("ds_db_port") %></th> 
						<th onClick="sortBy(this)" db_col="ds_db_schema" class="<%=domainSearchCondition.getSortClassByDbColumn("ds_db_schema")%>"><%=domainInstance.getPropertyCnName("ds_db_schema") %></th> 
						<th onClick="sortBy(this)" db_col="ds_db_user" class="<%=domainSearchCondition.getSortClassByDbColumn("ds_db_user")%>"><%=domainInstance.getPropertyCnName("ds_db_user") %></th> 
						<th onClick="sortBy(this)" db_col="ds_enable" class="<%=domainSearchCondition.getSortClassByDbColumn("ds_enable")%>"><%=domainInstance.getPropertyCnName("ds_enable") %></th> 
						<th onClick="sortBy(this)" db_col="is_system" class="<%=domainSearchCondition.getSortClassByDbColumn("is_system")%>"><%=domainInstance.getPropertyCnName("is_system") %></th> 
						<th><%=domainInstance.getPropertyCnName("connectStatus") %></th>
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							HcpDataSourceObj o = (HcpDataSourceObj) list.get(i); 
							String status = StringUtil.getNotEmptyStr(o.getConnectStatus());
				%> 
				<tr> 
					<td><%=StringUtil.getNotEmptyStr(o.getDs_code())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDs_name())%></td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("数据库类型字典",o.getDs_db_type()+"")%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getDs_db_ip())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDs_db_port())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDs_db_schema())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDs_db_user())%></td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("是否字典",o.getDs_enable()+"")%></td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("是否字典",o.getIs_system()+"")%></td> 
					<td style="color:<%="正常".equals(status)?"green":"red" %>"><%=status%></td> 
					<td width="100" style="text-align:left"> 
						<input type="button" class="button button_detail" title="详情" onClick="winOpen('<%=contextPath%>/<%=basePath%>/Servlet?method=detail4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
						&nbsp; 
						<input type="button" class="button button_modify" title="修改" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
						<%if(o.canDelete()){ %>&nbsp; 
						<input type="button" class="button button_delete" title="删除" onClick="javascript:if(confirm('确定要删除吗?')){$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=delete4this&<%=o.findKeyColumnName()%>_4del=<%=o.findKeyValue()%>');$('#pageForm').submit();} " /> 
						<%} %>
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
