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
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 查询结果 
	List<SystemConfigObj> list = new ArrayList(); 
 
	Object listObj = request.getAttribute("list"); 
	if (listObj != null) 
	{ 
		list = (List<SystemConfigObj>) listObj; 
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
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=list4set"> 

			<!-- 表格标题 -->
			<table width="700" align="center" class="title_table">
				<tr>
					<td>
						<%=domainInstance.getCnName()%>信息
					</td>
				</tr>
			</table>
			
 			<!-- 详细信息 -->
			<table width="700" align="center" class="config_table">
				<%for(int i=0; i<list.size(); i++){ 
					SystemConfigObj o = list.get(i);
					String value = StringUtil.getNotEmptyStr(o.getValue(), "");
				%>
				<tr>
					<td>
						<%=o.getCn_name()%>:
					</td>
					<td><%=o.getValue4show() %>
					</td>
				</tr>
				<%} %>
			</table>
			<div align="center"><input type="submit" class="button button_modify" value="修改"></div>
		</form>  
 
	</body> 
</html> 
