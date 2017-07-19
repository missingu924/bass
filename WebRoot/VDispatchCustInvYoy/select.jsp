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
						<td><%=domainInstance.getPropertyCnName("year_01_inatsum") %></td> 
						<td>
						<input name="year_01_inatsum_min" type="text" id="year_01_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_01_inatsum_min(),2)%>" size="9" >- 
						<input name="year_01_inatsum_max" type="text" id="year_01_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_01_inatsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_02_inatsum") %></td> 
						<td>
						<input name="year_02_inatsum_min" type="text" id="year_02_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_02_inatsum_min(),2)%>" size="9" >- 
						<input name="year_02_inatsum_max" type="text" id="year_02_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_02_inatsum_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("year_03_inatsum") %></td> 
						<td>
						<input name="year_03_inatsum_min" type="text" id="year_03_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_03_inatsum_min(),2)%>" size="9" >- 
						<input name="year_03_inatsum_max" type="text" id="year_03_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_03_inatsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_04_inatsum") %></td> 
						<td>
						<input name="year_04_inatsum_min" type="text" id="year_04_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_04_inatsum_min(),2)%>" size="9" >- 
						<input name="year_04_inatsum_max" type="text" id="year_04_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_04_inatsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_05_inatsum") %></td> 
						<td>
						<input name="year_05_inatsum_min" type="text" id="year_05_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_05_inatsum_min(),2)%>" size="9" >- 
						<input name="year_05_inatsum_max" type="text" id="year_05_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_05_inatsum_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("year_06_inatsum") %></td> 
						<td>
						<input name="year_06_inatsum_min" type="text" id="year_06_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_06_inatsum_min(),2)%>" size="9" >- 
						<input name="year_06_inatsum_max" type="text" id="year_06_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_06_inatsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_07_inatsum") %></td> 
						<td>
						<input name="year_07_inatsum_min" type="text" id="year_07_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_07_inatsum_min(),2)%>" size="9" >- 
						<input name="year_07_inatsum_max" type="text" id="year_07_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_07_inatsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_08_inatsum") %></td> 
						<td>
						<input name="year_08_inatsum_min" type="text" id="year_08_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_08_inatsum_min(),2)%>" size="9" >- 
						<input name="year_08_inatsum_max" type="text" id="year_08_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_08_inatsum_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("year_09_inatsum") %></td> 
						<td>
						<input name="year_09_inatsum_min" type="text" id="year_09_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_09_inatsum_min(),2)%>" size="9" >- 
						<input name="year_09_inatsum_max" type="text" id="year_09_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_09_inatsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_10_inatsum") %></td> 
						<td>
						<input name="year_10_inatsum_min" type="text" id="year_10_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_10_inatsum_min(),2)%>" size="9" >- 
						<input name="year_10_inatsum_max" type="text" id="year_10_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_10_inatsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_11_inatsum") %></td> 
						<td>
						<input name="year_11_inatsum_min" type="text" id="year_11_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_11_inatsum_min(),2)%>" size="9" >- 
						<input name="year_11_inatsum_max" type="text" id="year_11_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_11_inatsum_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("year_inatsum") %></td> 
						<td>
						<input name="year_inatsum_min" type="text" id="year_inatsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_inatsum_min(),2)%>" size="9" >- 
						<input name="year_inatsum_max" type="text" id="year_inatsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_inatsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinvname") %></td> 
						<td>
						<input name="cinvname" type="text" id="cinvname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ccuscode") %></td> 
						<td>
						<input name="ccuscode" type="text" id="ccuscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcuscode(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("ccusname") %></td> 
						<td>
						<input name="ccusname" type="text" id="ccusname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcusname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cpersoncode") %></td> 
						<td>
						<input name="cpersoncode" type="text" id="cpersoncode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersoncode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cpersonname") %></td> 
						<td>
						<input name="cpersonname" type="text" id="cpersonname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersonname(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("year_01_inatsum_yoy") %></td> 
						<td>
						<input name="year_01_inatsum_yoy_min" type="text" id="year_01_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_01_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_01_inatsum_yoy_max" type="text" id="year_01_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_01_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_02_inatsum_yoy") %></td> 
						<td>
						<input name="year_02_inatsum_yoy_min" type="text" id="year_02_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_02_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_02_inatsum_yoy_max" type="text" id="year_02_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_02_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_03_inatsum_yoy") %></td> 
						<td>
						<input name="year_03_inatsum_yoy_min" type="text" id="year_03_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_03_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_03_inatsum_yoy_max" type="text" id="year_03_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_03_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("year_04_inatsum_yoy") %></td> 
						<td>
						<input name="year_04_inatsum_yoy_min" type="text" id="year_04_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_04_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_04_inatsum_yoy_max" type="text" id="year_04_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_04_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_05_inatsum_yoy") %></td> 
						<td>
						<input name="year_05_inatsum_yoy_min" type="text" id="year_05_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_05_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_05_inatsum_yoy_max" type="text" id="year_05_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_05_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_06_inatsum_yoy") %></td> 
						<td>
						<input name="year_06_inatsum_yoy_min" type="text" id="year_06_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_06_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_06_inatsum_yoy_max" type="text" id="year_06_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_06_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("year_07_inatsum_yoy") %></td> 
						<td>
						<input name="year_07_inatsum_yoy_min" type="text" id="year_07_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_07_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_07_inatsum_yoy_max" type="text" id="year_07_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_07_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_08_inatsum_yoy") %></td> 
						<td>
						<input name="year_08_inatsum_yoy_min" type="text" id="year_08_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_08_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_08_inatsum_yoy_max" type="text" id="year_08_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_08_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("year_09_inatsum_yoy") %></td> 
						<td>
						<input name="year_09_inatsum_yoy_min" type="text" id="year_09_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_09_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_09_inatsum_yoy_max" type="text" id="year_09_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_09_inatsum_yoy_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("year_10_inatsum_yoy") %></td> 
						<td>
						<input name="year_10_inatsum_yoy_min" type="text" id="year_10_inatsum_yoy_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_10_inatsum_yoy_min(),2)%>" size="9" >- 
						<input name="year_10_inatsum_yoy_max" type="text" id="year_10_inatsum_yoy_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getYear_10_inatsum_yoy_max(),2)%>" size="9" > 
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
						<th onClick="sortBy(this)" db_col="year_01_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_01_inatsum")%>"><%=domainInstance.getPropertyCnName("year_01_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_02_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_02_inatsum")%>"><%=domainInstance.getPropertyCnName("year_02_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_03_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_03_inatsum")%>"><%=domainInstance.getPropertyCnName("year_03_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_04_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_04_inatsum")%>"><%=domainInstance.getPropertyCnName("year_04_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_05_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_05_inatsum")%>"><%=domainInstance.getPropertyCnName("year_05_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_06_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_06_inatsum")%>"><%=domainInstance.getPropertyCnName("year_06_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_07_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_07_inatsum")%>"><%=domainInstance.getPropertyCnName("year_07_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_08_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_08_inatsum")%>"><%=domainInstance.getPropertyCnName("year_08_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_09_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_09_inatsum")%>"><%=domainInstance.getPropertyCnName("year_09_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_10_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_10_inatsum")%>"><%=domainInstance.getPropertyCnName("year_10_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_11_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_11_inatsum")%>"><%=domainInstance.getPropertyCnName("year_11_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="year_inatsum" class="<%=domainSearchCondition.getSortClassByDbColumn("year_inatsum")%>"><%=domainInstance.getPropertyCnName("year_inatsum") %></th> 
						<th onClick="sortBy(this)" db_col="cinvname" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvname")%>"><%=domainInstance.getPropertyCnName("cinvname") %></th> 
						<th onClick="sortBy(this)" db_col="ccuscode" class="<%=domainSearchCondition.getSortClassByDbColumn("ccuscode")%>"><%=domainInstance.getPropertyCnName("ccuscode") %></th> 
						<th onClick="sortBy(this)" db_col="ccusname" class="<%=domainSearchCondition.getSortClassByDbColumn("ccusname")%>"><%=domainInstance.getPropertyCnName("ccusname") %></th> 
						<th onClick="sortBy(this)" db_col="cpersoncode" class="<%=domainSearchCondition.getSortClassByDbColumn("cpersoncode")%>"><%=domainInstance.getPropertyCnName("cpersoncode") %></th> 
						<th onClick="sortBy(this)" db_col="cpersonname" class="<%=domainSearchCondition.getSortClassByDbColumn("cpersonname")%>"><%=domainInstance.getPropertyCnName("cpersonname") %></th> 
						<th onClick="sortBy(this)" db_col="year_01_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_01_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_01_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_02_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_02_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_02_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_03_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_03_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_03_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_04_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_04_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_04_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_05_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_05_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_05_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_06_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_06_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_06_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_07_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_07_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_07_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_08_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_08_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_08_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_09_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_09_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_09_inatsum_yoy") %></th> 
						<th onClick="sortBy(this)" db_col="year_10_inatsum_yoy" class="<%=domainSearchCondition.getSortClassByDbColumn("year_10_inatsum_yoy")%>"><%=domainInstance.getPropertyCnName("year_10_inatsum_yoy") %></th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							VDispatchCustInvYoyObj o = (VDispatchCustInvYoyObj) list.get(i); 
				%> 
				<tr onclick='confirmSelect(this)' value='<%=o.toString() %>'> 
					<td style="width:30px;text-align:right"><%=i+1 %></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_01_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_02_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_03_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_04_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_05_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_06_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_07_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_08_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_09_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_10_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_11_inatsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_inatsum(),2)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcuscode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcusname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpersoncode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpersonname())%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_01_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_02_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_03_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_04_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_05_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_06_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_07_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_08_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_09_inatsum_yoy(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getYear_10_inatsum_yoy(),2)%></td> 
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
