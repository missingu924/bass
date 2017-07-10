<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VDispatchListsObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	VDispatchListsObj domainInstance = (VDispatchListsObj) request.getAttribute("domainInstance");  
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能路径  
	String basePath = domainInstance.getBasePath();  
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%=domainInstance.getCnName()%>详情</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css" /> 
		<script src="../js/jquery-2.0.3.min.js"></script> 
		<script src="../js/utils.js"></script> 
	</head> 
	<body> 
		<!-- 表格标题 --> 
		<table width="700" align="center" class="title_table"> 
			<tr> 
				<td> 
					<%=domainInstance.getCnName()%>信息 
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="700" align="center" class="detail_table detail_table-bordered"> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ddate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdlcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdlcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccuscode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcuscode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccusname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcusname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cinvcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cinvname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCinvname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cinvstd") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCinvstd())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccomunitcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcomunitcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccomunitname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcomunitname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iquantity") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIquantity(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("isum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIsum(),2)%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"> 
			<jsp:param name="basePath" value="<%=domainInstance.getBasePath() %>"/> 
			<jsp:param name="keyColumnName" value="<%=domainInstance.findKeyColumnName() %>"/> 
			<jsp:param name="keyValue" value="<%=domainInstance.findKeyValue() %>"/> 
		</jsp:include> 
	</body> 
</html> 
