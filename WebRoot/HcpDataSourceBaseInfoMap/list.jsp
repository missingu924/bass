<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapObj"%> 
<%@page import="com.hcp.searchcondition.HcpDataSourceBaseInfoMapSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapDetailObj"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	HcpDataSourceBaseInfoMapObj domainInstance = (HcpDataSourceBaseInfoMapObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	 com.hcp.searchcondition.HcpDataSourceBaseInfoMapSearchCondition domainSearchCondition = (com.hcp.searchcondition.HcpDataSourceBaseInfoMapSearchCondition) request.getAttribute("domainSearchCondition"); 
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
	
	HcpDataSourceBaseInfoMapDetailObj detail = new HcpDataSourceBaseInfoMapDetailObj();
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
				<tr> 
						<td><%=domainInstance.getPropertyCnName("src_ds_code") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("数据源字典", "src_ds_code", StringUtil.getNotEmptyStr(domainInstance.getSrc_ds_code(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("src_base_info_name") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("数据源-基础档案字典", "src_base_info_name", StringUtil.getNotEmptyStr(domainInstance.getSrc_base_info_name(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("src_base_info_type_code") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("基础档案类型字典", "src_base_info_type_code", StringUtil.getNotEmptyStr(domainInstance.getSrc_base_info_type_code(), ""),20)%> 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("dst_ds_code") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("数据源字典", "dst_ds_code", StringUtil.getNotEmptyStr(domainInstance.getDst_ds_code(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("dst_base_info_name") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("数据源-基础档案字典", "dst_base_info_name", StringUtil.getNotEmptyStr(domainInstance.getDst_base_info_name(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("dst_base_info_type_code") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("基础档案类型字典", "dst_base_info_type_code", StringUtil.getNotEmptyStr(domainInstance.getDst_base_info_type_code(), ""),20)%> 
						</td>
				</tr> 
			</table> 
 
			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th onClick="sortBy(this)" db_col="src_ds_code" class="<%=domainSearchCondition.getSortClassByDbColumn("src_ds_code")%>"><%=domainInstance.getPropertyCnName("src_ds_code") %></th> 
						<th onClick="sortBy(this)" db_col="src_base_info_name" class="<%=domainSearchCondition.getSortClassByDbColumn("src_base_info_name")%>"><%=domainInstance.getPropertyCnName("src_base_info_name") %></th> 
						<th onClick="sortBy(this)" db_col="src_base_info_type_code" class="<%=domainSearchCondition.getSortClassByDbColumn("src_base_info_type_code")%>"><%=domainInstance.getPropertyCnName("src_base_info_type_code") %></th> 
						<th onClick="sortBy(this)" db_col="dst_ds_code" class="<%=domainSearchCondition.getSortClassByDbColumn("dst_ds_code")%>"><%=domainInstance.getPropertyCnName("dst_ds_code") %></th> 
						<th onClick="sortBy(this)" db_col="dst_base_info_name" class="<%=domainSearchCondition.getSortClassByDbColumn("dst_base_info_name")%>"><%=domainInstance.getPropertyCnName("dst_base_info_name") %></th> 
						<th onClick="sortBy(this)" db_col="dst_base_info_type_code" class="<%=domainSearchCondition.getSortClassByDbColumn("dst_base_info_type_code")%>"><%=domainInstance.getPropertyCnName("dst_base_info_type_code") %></th> 
						<th onClick="sortBy(this)" db_col="relation_total_num" class="<%=domainSearchCondition.getSortClassByDbColumn("relation_total_num")%>"><%=domainInstance.getPropertyCnName("relation_total_num") %></th> 
						<th onClick="sortBy(this)" db_col="relation_ok_num" class="<%=domainSearchCondition.getSortClassByDbColumn("relation_ok_num")%>"><%=domainInstance.getPropertyCnName("relation_ok_num") %></th> 
						<th onClick="sortBy(this)" db_col="relation_not_ok_num" class="<%=domainSearchCondition.getSortClassByDbColumn("relation_not_ok_num")%>"><%=domainInstance.getPropertyCnName("relation_not_ok_num") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							HcpDataSourceBaseInfoMapObj o = (HcpDataSourceBaseInfoMapObj) list.get(i); 
				%> 
				<tr> 
					<td><%=DictionaryUtil.getDictValueByDictKey("数据源字典",o.getSrc_ds_code()+"")%></td>  
					<td><%=DictionaryUtil.getDictValueByDictKey("数据源-基础档案字典",o.getSrc_base_info_name()+"")%></td>  
					<td><%=DictionaryUtil.getDictValueByDictKey("基础档案类型字典",o.getSrc_base_info_type_code()+"")%></td>  
					<td><%=DictionaryUtil.getDictValueByDictKey("数据源字典",o.getDst_ds_code()+"")%></td>  
					<td><%=DictionaryUtil.getDictValueByDictKey("数据源-基础档案字典",o.getDst_base_info_name()+"")%></td>  
					<td><%=DictionaryUtil.getDictValueByDictKey("基础档案类型字典",o.getDst_base_info_type_code()+"")%></td>  
					<td style="text-align:right"><a href="javascript:winOpen('<%=contextPath%>/<%=detail.getBasePath()%>/Servlet?method=list4this&showSearchConditionTable=false&map_id=<%=o.findKeyValue()%>')"><%=o.getRelation_total_num()%></a></td>  
					<td style="text-align:right"><a href="javascript:winOpen('<%=contextPath%>/<%=detail.getBasePath()%>/Servlet?method=list4this&showSearchConditionTable=false&map_id=<%=o.findKeyValue()%>&dont_mapped=false')"><%=o.getRelation_ok_num()%></a></td>  
					<td style="text-align:right"><a href="javascript:winOpen('<%=contextPath%>/<%=detail.getBasePath()%>/Servlet?method=list4this&showSearchConditionTable=false&map_id=<%=o.findKeyValue()%>&dont_mapped=true')"><%=o.getRelation_not_ok_num()%></a></td>  
					<td width="100" style="text-align:center"> 
						<input type="button" class="button button_detail" title="维护" onClick="winOpen('<%=contextPath%>/<%=detail.getBasePath()%>/Servlet?method=list4this&showSearchConditionTable=false&map_id=<%=o.findKeyValue()%>')" /> 
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
