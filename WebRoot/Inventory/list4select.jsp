<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.u8.obj.InventoryObj"%>
<%@page import="com.alibaba.fastjson.JSON"%> 
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	InventoryObj domainInstance = (InventoryObj) request.getAttribute("domainInstance"); 
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
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" /> 
		<title><%=domainInstance.getCnName() %>选择</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script>
		// 双击选择
		function confirmSelect(tr)
		{
			window.returnValue = $(tr).attr("value");
			window.close();
		}
		</script>
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=list4select"> 
			 
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="95%"> 
				<tr> 
					<td style="width:0px"></td>
					<td align="left"> 
						<%=domainInstance.getPropertyCnName("cinvname") %> 
						<input name="cinvname" type="text" id="cinvname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvname())%>" size="20" > 
						&nbsp;
						<%=domainInstance.getPropertyCnName("cinvcode") %> 
						<input name="cinvcode" type="text" id="cinvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode())%>" size="20" > 
						&nbsp;    
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
					</td>
				</tr> 
			</table> 
 
			<table class="table table-bordered table-striped" align="center" width="95%"> 
				<thead> 
					<tr> 
						<th><%=domainInstance.getPropertyCnName("cinvccode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvcode") %></th>
						<th><%=domainInstance.getPropertyCnName("cinvname") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvstd") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccomunitcode") %></th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							InventoryObj o = (InventoryObj) list.get(i); 
				%> 
				<tr onclick='confirmSelect(this)' value='<%=o.toString() %>'> 
					<td><%=DictionaryUtil.getDictValueByDictKey("U8存货类别字典",o.getCinvccode())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvstd())%></td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("U8计量单位字典",o.getCcomunitcode())%></td>
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
