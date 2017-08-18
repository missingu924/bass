<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.common.licence.LicenceUtil"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=LicenceUtil.getLicencedMachine().getName() %></title>
	</head>
<%
	String systemEnName=StringUtil.getNotEmptyStr(LicenceUtil.getLicencedMachine().getEnName(),"default");
%>
<frameset rows="45,*,20" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=systemEnName%>-header.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="210,*" frameborder="no" border="0" framespacing="2" id="pageFrame" name="pageFrame">
    <frame src="<%=systemEnName%>-menu.jsp" name="leftFrame" scrolling="yes" id="leftFrame" title="leftFrame" border="0" framespacing="0"/>
    <frame src="<%=systemEnName%>-index.jsp" name="mainFrame" id="mainFrame" title="mainFrame"  border="0" framespacing="0" onload="top.leftFrame.eval('mainFrameLoaded()');"/>
  </frameset>
  <frame src="<%=systemEnName%>-footer.jsp" id='copyrightFrame' name="copyrightFrame" scrolling="no" noresize  border="0" framespacing="0"/>
</frameset>
<noframes><body>
</body>
</noframes></html>