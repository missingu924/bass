<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.licence.LicenceUtil"%>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<link href="css/global.css" rel="stylesheet" type="text/css">
<title>系统信息</title>
</head>
<body>
<table width="760" align="center" class="title_table"> 
			<tr> 
				<td>
					系统信息 
				</td> 
			</tr> 
</table> 
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" class="detail_table">
  <tr>
    <td>授权给:</td>
    <td><%=LicenceUtil.getLicencedMachine().getCustomerName() %> </td>
  </tr>
   <tr>
    <td>当前版本:</td>
    <td><%=LicenceUtil.getLicencedMachine().getSystemVersion() %></td>
  </tr>
  <tr>
    <td>开发语言:</td>
    <td>Java+HTML+JQuery+CSS3 </td>
  </tr>
  <tr>
    <td>数据库版本:</td>
    <td>SqlServer 2008 </td>
  </tr>
  <tr>
    <td>开发厂商:</td>
    <td><%=LicenceUtil.getLicencedMachine().getSupplier() %></td>
  </tr>
  <tr>
    <td>用友系统适用版本:</td>
    <td>11.1</td>
  </tr>
</table>
</body>
</html>

