<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.dbmodel.obj.DbmodelColumnObj"%> 
<%@page import="com.wuyg.dbmodel.searchcondition.DbmodelColumnSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	DbmodelColumnObj domainInstance = (DbmodelColumnObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	 com.wuyg.dbmodel.searchcondition.DbmodelColumnSearchCondition domainSearchCondition = (com.wuyg.dbmodel.searchcondition.DbmodelColumnSearchCondition) request.getAttribute("domainSearchCondition"); 
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
					<td style="width:0"></td> 
					<td></td> 
					<td> 
						<input name="searchButton" type="button" class="button button_search" value="查询数据" onClick="toPage(1)"> 
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this')"> 
						<input name="uploadButton" type="button" class="button button_upload" value="导入" onClick="openBigModalDialog('<%=contextPath%>/ExcelParser/uploadFile.jsp?basedbobj_class=<%=domainInstance.getClass().getCanonicalName()%>')">
						<%if(list.size()>0){ %> 
						<input name="deleteAllButton" type="button" class="button button_delete" value="全删" onClick="if(confirm('您确认要删除本次查询出的 <%=pagination.getTotalCount() %> 条数据吗?')){$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=deleteAll4this').submit();}"> 
						<%} %> 
						<input name="searchButton" type="button" class="button button_set" value="高级查询" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
					</td> 
				</tr> 
			</table> 
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowSearchConditionTable() ? "" : "none"%>'> 
							<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("tableid") %></td> 
						<td>
						<input name="tableid_min" type="text" id="tableid_min" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getTableid_min(),"")%>" size="9" >- 
						<input name="tableid_max" type="text" id="tableid_max" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getTableid_max(),"")%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("columnname") %></td> 
						<td>
						<input name="columnname" type="text" id="columnname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getColumnname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("columncnname") %></td> 
						<td>
						<input name="columncnname" type="text" id="columncnname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getColumncnname(),"")%>" size="20" > 
						</td> 
					<td></td><td></td> 
				</tr> 
			</table> 
 
			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
				<input type="hidden" name="orderBy" id="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
					<tr> 
						<th onClick="sortBy(this)" db_col="tableid" class="<%=domainSearchCondition.getSortClassByDbColumn("tableid")%>"><%=domainInstance.getPropertyCnName("tableid") %></th> 
						<th onClick="sortBy(this)" db_col="columnname" class="<%=domainSearchCondition.getSortClassByDbColumn("columnname")%>"><%=domainInstance.getPropertyCnName("columnname") %></th> 
						<th onClick="sortBy(this)" db_col="columntype" class="<%=domainSearchCondition.getSortClassByDbColumn("columntype")%>"><%=domainInstance.getPropertyCnName("columntype") %></th> 
						<th onClick="sortBy(this)" db_col="columnscale" class="<%=domainSearchCondition.getSortClassByDbColumn("columnscale")%>"><%=domainInstance.getPropertyCnName("columnscale") %></th> 
						<th onClick="sortBy(this)" db_col="columncnname" class="<%=domainSearchCondition.getSortClassByDbColumn("columncnname")%>"><%=domainInstance.getPropertyCnName("columncnname") %></th> 
						<th onClick="sortBy(this)" db_col="dictname" class="<%=domainSearchCondition.getSortClassByDbColumn("dictname")%>"><%=domainInstance.getPropertyCnName("dictname") %></th> 
						<th onClick="sortBy(this)" db_col="columnshow" class="<%=domainSearchCondition.getSortClassByDbColumn("columnshow")%>"><%=domainInstance.getPropertyCnName("columnshow") %></th> 
						<th onClick="sortBy(this)" db_col="columnforsearch" class="<%=domainSearchCondition.getSortClassByDbColumn("columnforsearch")%>"><%=domainInstance.getPropertyCnName("columnforsearch") %></th> 
						<th onClick="sortBy(this)" db_col="iskeycolumn" class="<%=domainSearchCondition.getSortClassByDbColumn("iskeycolumn")%>"><%=domainInstance.getPropertyCnName("iskeycolumn") %></th> 
						<th onClick="sortBy(this)" db_col="notnull" class="<%=domainSearchCondition.getSortClassByDbColumn("notnull")%>"><%=domainInstance.getPropertyCnName("notnull") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							DbmodelColumnObj o = (DbmodelColumnObj) list.get(i); 
				%> 
				<tr> 
					<td style="text-align:right"><%=StringUtil.getNotEmptyStr(o.getTableid())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getColumnname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getColumntype())%></td> 
					<td style="text-align:right"><%=StringUtil.getNotEmptyStr(o.getColumnscale())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getColumncnname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDictname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getColumnshow())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getColumnforsearch())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getIskeycolumn())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getNotnull())%></td> 
					<td width="100" style="text-align:center"> 
						<input type="button" class="button button_detail" title="详情" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=detail4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
						&nbsp; 
						<input type="button" class="button button_modify" title="修改" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
						&nbsp;  
						<input type="button" class="button button_delete" title="删除" onClick="javascript:if(confirm('确定要删除吗?')){$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=delete4this&<%=o.findKeyColumnName()%>_4del=<%=o.findKeyValue()%>');$('#pageForm').submit();} " /> 
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
