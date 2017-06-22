<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<%@page import="com.wuyg.system.obj.SystemMenuObj"%>  

<% 
	String contextPath = request.getContextPath(); 
	SystemMenuObj domainInstance = new SystemMenuObj();  
	String basePath = domainInstance.getBasePath(); 
%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>

<frameset cols="260,*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=request.getContextPath()%>/<%=basePath%>/tree.jsp" name="treeFrame" id="treeFrame" title="treeFrame" />
  <frame src="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=list4this" name="listFrame" id="listFrame" title="listFrame" />
</frameset>
<noframes>
<body>
</body>
</html>
