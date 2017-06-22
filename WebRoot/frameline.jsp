<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.licence.LicenceUtil"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
 function ShowHideLeft(objtd){
 if (parent.pageframe.cols=="160,16,*"){
    parent.pageframe.cols="0,16,*";
    objtd.innerHTML = '&gt;';
 }
 else{
    parent.pageframe.cols="160,16,*";
    objtd.innerHTML = '&lt;';
 }
 }
 </script>
<body>
 <table border="0" cellpadding="0" cellpadding="0" height="100%">
 <tr>
 <td valign="middle" title="显示隐藏左菜单" onMouseOver="" onClick="ShowHideLeft(this);">&lt;</td>
 </tr>
 </table>
</body>
</html>

