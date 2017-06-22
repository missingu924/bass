<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.common.obj.PaginationObj"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapDetailObj"%>
<%@page import="com.hcp.searchcondition.HcpDataSourceBaseInfoMapDetailSearchCondition"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapObj"%>
<!-- 基本信息 -->
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	HcpDataSourceBaseInfoMapDetailObj domainInstance = (HcpDataSourceBaseInfoMapDetailObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	 com.hcp.searchcondition.HcpDataSourceBaseInfoMapDetailSearchCondition domainSearchCondition = (com.hcp.searchcondition.HcpDataSourceBaseInfoMapDetailSearchCondition) request.getAttribute("domainSearchCondition"); 
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
	
	// 父对象实例 
	HcpDataSourceBaseInfoMapObj baseInfoMap = (HcpDataSourceBaseInfoMapObj) request.getAttribute("baseInfoMap"); 
	
	String src_code=baseInfoMap.getSrc_base_info_name()+"编码";
	String src_name=baseInfoMap.getSrc_base_info_name()+"名称";
	String dst_code=baseInfoMap.getDst_base_info_name()+"编码";
	String dst_name=baseInfoMap.getDst_base_info_name()+"名称";
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
					<td><input name="dont_mapped" value="true" type="checkbox" <%="true".equalsIgnoreCase(domainInstance.getDont_mapped())?"checked":"" %>>只查还未对照的</td>
					<td>
						<input name="searchButton" type="button" class="button button_search" value="查询数据" onClick="toPage(1)">
						<input name="searchButton" type="button" class="button button_set" value="高级查询" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
					
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&map_id=<%=baseInfoMap.getId() %>')">
						<%if(list.size()>0){ %>
						<input name="deleteAllButton" type="button" class="button button_delete" value="全删"
							onClick="if(confirm('您确认要删除本次查询出的 <%=pagination.getTotalCount() %> 条数据吗?')){$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=deleteAll4this').submit();}">
						<%} %>
						
						<input name="downloadButton" type="button" class="button button_download" value="下载【<%=baseInfoMap.getSrc_base_info_name() %>】数据" onClick="$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=syncData').submit();">
						<input name="mapButton" type="button" class="button button_sync" value="按名称自动对照到【<%=baseInfoMap.getDst_base_info_name() %>】" onClick="$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=autoMap&map_type=name').submit();">
						<input name="mapButton" type="button" class="button button_sync" value="按编号自动对照到【<%=baseInfoMap.getDst_base_info_name() %>】" onClick="$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=autoMap&map_type=code').submit();">
					</td>
				</tr>
			</table>
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%= domainSearchCondition . isShowSearchConditionTable() ?   "" :   "none" %>'>
				<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>">
				<input type="hidden" id="map_id" name="map_id" value="<%=domainInstance.getMap_id()%>">
				<input type="hidden" id="src_base_info_name" name="src_base_info_name" value="<%=baseInfoMap.getSrc_base_info_name()%>">
				<input type="hidden" id="dst_base_info_name" name="dst_base_info_name" value="<%=baseInfoMap.getDst_base_info_name()%>">
				<tr>
					<td style="width:200px"><%=src_code %></td>
					<td>
						<input name="src_code" type="text" id="src_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSrc_code(),"")%>" size="20">
					</td>
					<td style="width:200px"><%=src_name %></td>
					<td>
						<input name="src_name" type="text" id="src_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSrc_name(),"")%>" size="20">
					</td>
				</tr>
				<tr>
					<td><%=dst_code %></td>
					<td>
						<input name="dst_code" type="text" id="dst_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDst_code(),"")%>" size="20">
					</td>
					<td><%=dst_name %></td>
					<td>
						<input name="dst_name" type="text" id="dst_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDst_name(),"")%>" size="20">
					</td>
				</tr>
			</table>
			
			<!-- 同步结果 -->
			<%
				Object message = request.getAttribute("message");
				if(message!=null)
				{
			%>
			<table id="sync_result_table" class="help_info_table" align="center" width="98%">
				<tr>
					<td style="text-align:center;color:blue">
						<b><%=message %></b>
					</td>
				</tr>
			</table>
			<%	} %>
			
			<!-- 基本信息 -->
			<table class="title_table" align="center" width="98%">
				<tr>
					<td style="text-align: center">
						<b> <%=DictionaryUtil.getDictValueByDictKey("数据源字典",baseInfoMap.getSrc_ds_code()+"")%> / <%=DictionaryUtil.getDictValueByDictKey("数据源-基础档案字典",baseInfoMap.getSrc_base_info_name()+"")%> &nbsp;&nbsp;<font color="red">对照到</font>&nbsp;&nbsp; <%=DictionaryUtil.getDictValueByDictKey("数据源字典",baseInfoMap.getDst_ds_code()+"")%>
							/ <%=DictionaryUtil.getDictValueByDictKey("数据源-基础档案字典",baseInfoMap.getDst_base_info_name()+"")%> </b>
					</td>
				</tr>
			</table>

			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%">
				<thead>
					<input type="hidden" name="orderBy" id="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>">
					<tr>
						<th onClick="sortBy(this)" db_col="src_code" class="<%=domainSearchCondition.getSortClassByDbColumn("src_code")%>"><%=src_code %></th>
						<th onClick="sortBy(this)" db_col="src_name" class="<%=domainSearchCondition.getSortClassByDbColumn("src_name")%>"><%=src_name %></th>
						<th onClick="sortBy(this)" db_col="dst_code" class="<%=domainSearchCondition.getSortClassByDbColumn("dst_code")%>"><%=dst_code %></th>
						<th onClick="sortBy(this)" db_col="dst_name" class="<%=domainSearchCondition.getSortClassByDbColumn("dst_name")%>"><%=dst_name %></th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							HcpDataSourceBaseInfoMapDetailObj o = (HcpDataSourceBaseInfoMapDetailObj) list.get(i); 
				%>
				<tr>
					<td><%=StringUtil.getNotEmptyStr(o.getSrc_code())%></td>
					<td><%=StringUtil.getNotEmptyStr(o.getSrc_name())%></td>
					<td><%=StringUtil.getNotEmptyStr(o.getDst_code())%></td>
					<td><%=StringUtil.getNotEmptyStr(o.getDst_name())%></td>
					<td width="100" style="text-align: center">
						<input type="button" class="button button_modify" title="修改" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>&map_id=<%=o.getMap_id() %>')" />
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
				<jsp:param name="basePath" value="<%=basePath%>" />
			</jsp:include>

		</form>
		<script>
					// 绑定关闭事件
					
					// 父窗口刷新，适用于window.open()打开的窗口
					if(window.opener){
						window.opener.eval("freshCurrentPage()");
					}
		
					// 父窗口刷新，适用于showModaldialog()打开的窗口
					if(window.dialogArguments){ 
						window.dialogArguments.eval("freshCurrentPage()");
						window.dialogArguments.eval("freshMe()"); 
					}
		</script>
	</body>
</html>
