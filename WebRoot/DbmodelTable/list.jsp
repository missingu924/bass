<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.dbmodel.obj.DbmodelTableObj"%> 
<%@page import="com.wuyg.dbmodel.searchcondition.DbmodelTableSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	DbmodelTableObj domainInstance = (DbmodelTableObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	 com.wuyg.dbmodel.searchcondition.DbmodelTableSearchCondition domainSearchCondition = (com.wuyg.dbmodel.searchcondition.DbmodelTableSearchCondition) request.getAttribute("domainSearchCondition"); 
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
						<td><%=domainInstance.getPropertyCnName("tablename") %></td> 
						<td>
						<input name="tablename" type="text" id="tablename" value="<%=StringUtil.getNotEmptyStr(domainInstance.getTablename(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cnname") %></td> 
						<td>
						<input name="cnname" type="text" id="cnname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCnname(),"")%>" size="20" > 
						</td> 
					<td></td><td></td> 
					<td></td><td></td> 
				</tr> 
			</table> 
 
			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
				<input type="hidden" name="orderBy" id="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
					<tr> 
						<th onClick="sortBy(this)" db_col="tablename" class="<%=domainSearchCondition.getSortClassByDbColumn("tablename")%>"><%=domainInstance.getPropertyCnName("tablename") %></th> 
						<th onClick="sortBy(this)" db_col="javapackage" class="<%=domainSearchCondition.getSortClassByDbColumn("javapackage")%>"><%=domainInstance.getPropertyCnName("javapackage") %></th> 
						<th onClick="sortBy(this)" db_col="javasrcdir" class="<%=domainSearchCondition.getSortClassByDbColumn("javasrcdir")%>"><%=domainInstance.getPropertyCnName("javasrcdir") %></th> 
						<th onClick="sortBy(this)" db_col="cnname" class="<%=domainSearchCondition.getSortClassByDbColumn("cnname")%>"><%=domainInstance.getPropertyCnName("cnname") %></th> 
						<th onClick="sortBy(this)" db_col="iconpath" class="<%=domainSearchCondition.getSortClassByDbColumn("iconpath")%>"><%=domainInstance.getPropertyCnName("iconpath") %></th> 
						<th onClick="sortBy(this)" db_col="fordetail" class="<%=domainSearchCondition.getSortClassByDbColumn("fordetail")%>"><%=domainInstance.getPropertyCnName("fordetail") %></th> 
						<th onClick="sortBy(this)" db_col="containsoperationcol" class="<%=domainSearchCondition.getSortClassByDbColumn("containsoperationcol")%>"><%=domainInstance.getPropertyCnName("containsoperationcol") %></th> 
						<th onClick="sortBy(this)" db_col="keycolumn" class="<%=domainSearchCondition.getSortClassByDbColumn("keycolumn")%>"><%=domainInstance.getPropertyCnName("keycolumn") %></th> 
						<th onClick="sortBy(this)" db_col="uniquecolumn" class="<%=domainSearchCondition.getSortClassByDbColumn("uniquecolumn")%>"><%=domainInstance.getPropertyCnName("uniquecolumn") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							DbmodelTableObj o = (DbmodelTableObj) list.get(i); 
				%> 
				<tr> 
					<td><%=StringUtil.getNotEmptyStr(o.getTablename())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getJavapackage())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getJavasrcdir())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCnname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getIconpath())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getFordetail())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getContainsoperationcol())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getKeycolumn())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getUniquecolumn())%></td> 
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
