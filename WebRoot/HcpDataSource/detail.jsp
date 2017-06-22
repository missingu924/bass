<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.hcp.obj.HcpDataSourceObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoObj"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	HcpDataSourceObj domainInstance = (HcpDataSourceObj) request.getAttribute("domainInstance");  
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
		<link href="../css/table.css" rel="stylesheet" type="text/css" /> 
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
					<%=domainInstance.getPropertyCnName("ds_code") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDs_code())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ds_name") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDs_name())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ds_db_type") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("数据库类型字典",domainInstance.getDs_db_type()+"")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ds_db_ip") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_ip())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ds_db_port") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_port())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ds_db_schema") %>:
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_schema())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ds_db_user") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_user())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ds_db_password") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_password()).replaceAll(".","*")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("connectStatus") %>: 
				</td> 
				<td style="color:<%="正常".equals(domainInstance.getConnectStatus())?"green":"red" %>"><%=domainInstance.getConnectStatus()%></td> 
			</tr> 
		</table> 
		 
		<div align="center"><input type="button" class="button button_modify" value="修改" onclick="document.location='<%=contextPath %>/<%=basePath %>/Servlet?method=preModify4this&id=<%=domainInstance.getId() %>'"></div>
		
	</body> 
</html> 
