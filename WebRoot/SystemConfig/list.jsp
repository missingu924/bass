<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.system.obj.SystemConfigObj"%> 
<%@page import="com.wuyg.system.searchcondition.SystemConfigSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	SystemConfigObj domainInstance = (SystemConfigObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	SystemConfigSearchCondition domainSearchCondition = (SystemConfigSearchCondition) request.getAttribute("domainSearchCondition"); 
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
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="orderBy" name="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
			 
			<!-- 工具栏 --> 
			<table class="search_table" align="center" width="98%"> 
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
			<!-- 提示信息 -->  
			<table id="help_info_table" class="help_info_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowHelpInfoTable() ? "" : "none"%>'> 
				<tr> 
					<td> 
						<b>【提示】</b> 
						<ul> 
							<li><%=domainInstance.getCnName() %></li> 
						</ul> 
					</td> 
				</tr> 
			</table> 
			<!-- 查询条件 -->  
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowSearchConditionTable() ? "" : "none"%>'> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("name") %></td> 
						<td>
						<input name="name" type="text" id="name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getName(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cn_name") %></td> 
						<td>
						<input name="cn_name" type="text" id="cn_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCn_name(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("type") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("数据类型字典", "type", StringUtil.getNotEmptyStr(domainInstance.getType(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("be_stop") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("是否字典", "be_stop", StringUtil.getNotEmptyStr(domainInstance.getBe_stop(), ""),20)%> 
						</td> 
			</table> 
 
			<!-- 数据信息 -->  
			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th onClick="sortBy(this)" db_col="name" class="<%=domainSearchCondition.getSortClassByDbColumn("name")%>"><%=domainInstance.getPropertyCnName("name") %></th> 
						<th onClick="sortBy(this)" db_col="cn_name" class="<%=domainSearchCondition.getSortClassByDbColumn("cn_name")%>"><%=domainInstance.getPropertyCnName("cn_name") %></th> 
						<th onClick="sortBy(this)" db_col="type" class="<%=domainSearchCondition.getSortClassByDbColumn("type")%>"><%=domainInstance.getPropertyCnName("type") %></th> 
						<th onClick="sortBy(this)" db_col="dict_name" class="<%=domainSearchCondition.getSortClassByDbColumn("dict_name")%>"><%=domainInstance.getPropertyCnName("dict_name") %></th> 
						<th onClick="sortBy(this)" db_col="select_type" class="<%=domainSearchCondition.getSortClassByDbColumn("select_type")%>"><%=domainInstance.getPropertyCnName("select_type") %></th> 
						<th onClick="sortBy(this)" db_col="after_class" class="<%=domainSearchCondition.getSortClassByDbColumn("after_class")%>"><%=domainInstance.getPropertyCnName("after_class") %></th> 
						<th onClick="sortBy(this)" db_col="value" class="<%=domainSearchCondition.getSortClassByDbColumn("value")%>"><%=domainInstance.getPropertyCnName("value") %></th> 
						<th onClick="sortBy(this)" db_col="default_value" class="<%=domainSearchCondition.getSortClassByDbColumn("default_value")%>"><%=domainInstance.getPropertyCnName("default_value") %></th> 
						<th onClick="sortBy(this)" db_col="sort_code" class="<%=domainSearchCondition.getSortClassByDbColumn("sort_code")%>"><%=domainInstance.getPropertyCnName("sort_code") %></th> 
						<th onClick="sortBy(this)" db_col="be_stop" class="<%=domainSearchCondition.getSortClassByDbColumn("be_stop")%>"><%=domainInstance.getPropertyCnName("be_stop") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							SystemConfigObj o = (SystemConfigObj) list.get(i); 
				%> 
				<tr> 
					<td><%=StringUtil.getNotEmptyStr(o.getName())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCn_name())%></td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("数据类型字典",o.getType()+"",false)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDict_name())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getSelect_type())%></td> 
					<td title="<%=StringUtil.getNotEmptyStr(o.getAfter_class()) %>"><%=StringUtil.getNotEmptyStr(o.getAfter_class(),10)%></td> 
					<td title="<%=StringUtil.getNotEmptyStr(o.getValue4show()) %>"><%=StringUtil.getNotEmptyStr(o.getValue4show(),10)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDefault_value())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getSort_code())%></td> 
					<td><%=DictionaryUtil.getCheckboxHtml("是否字典",o.getBe_stop()+"",true)%></td>  
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
