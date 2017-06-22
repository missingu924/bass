<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.tree.obj.TreeObj"%> 
<%@page import="com.wuyg.tree.searchcondition.TreeSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	TreeObj domainInstance = (TreeObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	 com.wuyg.tree.searchcondition.TreeSearchCondition domainSearchCondition = (com.wuyg.tree.searchcondition.TreeSearchCondition) request.getAttribute("domainSearchCondition"); 
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
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this')"> 
						<input name="uploadButton" type="button" class="button button_upload" value="导入" onClick="openBigModalDialog('<%=contextPath%>/ExcelParser/uploadFile.jsp?basedbobj_class=<%=domainInstance.getClass().getCanonicalName()%>')">
						<%if(list.size()>0){ %> 
						<input name="deleteAllButton" type="button" class="button button_delete" value="全删" onClick="if(confirm('您确认要删除本次查询出的 <%=pagination.getTotalCount() %> 条数据吗?')){$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=deleteAll4this').submit();}"> 
						<%} %> 
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
						<td><%=domainInstance.getPropertyCnName("data_soure") %></td> 
						<td>
						<input name="data_soure" type="text" id="data_soure" value="<%=StringUtil.getNotEmptyStr(domainInstance.getData_soure(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("open") %></td> 
						<td>
						<input name="open" type="text" id="open" value="<%=StringUtil.getNotEmptyStr(domainInstance.getOpen(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("select_ids") %></td> 
						<td>
						<input name="select_ids" type="text" id="select_ids" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSelect_ids(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("fiter") %></td> 
						<td>
						<input name="fiter" type="text" id="fiter" value="<%=StringUtil.getNotEmptyStr(domainInstance.getFiter(),"")%>" size="20" > 
						</td> 
					<td></td><td></td> 
					<td></td><td></td> 
				</tr> 
			</table> 
 
			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
				<input type="hidden" name="orderBy" id="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
					<tr> 
						<th onClick="sortBy(this)" db_col="data_soure" class="<%=domainSearchCondition.getSortClassByDbColumn("data_soure")%>"><%=domainInstance.getPropertyCnName("data_soure") %></th> 
						<th onClick="sortBy(this)" db_col="open" class="<%=domainSearchCondition.getSortClassByDbColumn("open")%>"><%=domainInstance.getPropertyCnName("open") %></th> 
						<th onClick="sortBy(this)" db_col="select_ids" class="<%=domainSearchCondition.getSortClassByDbColumn("select_ids")%>"><%=domainInstance.getPropertyCnName("select_ids") %></th> 
						<th onClick="sortBy(this)" db_col="fiter" class="<%=domainSearchCondition.getSortClassByDbColumn("fiter")%>"><%=domainInstance.getPropertyCnName("fiter") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							TreeObj o = (TreeObj) list.get(i); 
				%> 
				<tr> 
					<td><%=StringUtil.getNotEmptyStr(o.getData_soure())%></td> 
					<td><%="true".equalsIgnoreCase(o.getOpen()+"")?"是":"否"%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getSelect_ids())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getFiter())%></td> 
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
