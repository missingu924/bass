<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.hcp.obj.HcpDataSourceObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.config.ConfigReader"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	HcpDataSourceObj domainInstance = new HcpDataSourceObj();
	domainInstance.setDs_db_type(ConfigReader.getProperties(SystemConstant.DEFAULT_DB + ".ds_db_type"));
	domainInstance.setDs_db_ip(ConfigReader.getProperties(SystemConstant.DEFAULT_DB + ".ds_db_ip"));
	domainInstance.setDs_db_port(ConfigReader.getProperties(SystemConstant.DEFAULT_DB + ".ds_db_port"));
	domainInstance.setDs_db_schema(ConfigReader.getProperties(SystemConstant.DEFAULT_DB + ".ds_db_schema"));
	domainInstance.setDs_db_user(ConfigReader.getProperties(SystemConstant.DEFAULT_DB + ".ds_db_user"));
	domainInstance.setDs_db_password(StringUtil.hex2str(ConfigReader.getProperties(SystemConstant.DEFAULT_DB + ".ds_db_password")));// 数据库密码转为16进制字符串
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		
		<title>设置数据库连接信息</title> 
		<link href="css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="js/utils.js"></script> 
	</head> 
	<body> 
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=set4sysdb" method="post"> 
			<!-- 表格标题 --> 
			<table width="700" align="center" class="title_table"> 
				<tr> 
					<td> 
						设置数据库连接信息
					</td> 
				</tr> 
			</table> 
 
			<!-- 详细信息 --> 
			<table width="700" align="center" class="detail_table detail_table-bordered"> 
				<input type="hidden" id="<%=domainInstance.findKeyColumnName()%>" name="<%=domainInstance.findKeyColumnName()%>" value="<%=domainInstance.findKeyValue()%>"> 
				<tr style="display:none"> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_code") %>: 
					</td> 
					<td> 
						<input name="ds_code" type="text" id="ds_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_code(),SystemConstant.DEFAULT_DB)%>" size="20" > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr style="display:none"> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_name") %>: 
					</td> 
					<td> 
						<input name="ds_name" type="text" id="ds_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_name(),"系统数据库")%>" size="20"> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr style="display:none"> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_type") %>: 
					</td> 
					<td> 
						<input name="ds_db_type" type="text" id="ds_db_type" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_type(),"SqlServer")%>" size="20"> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_ip") %>: 
					</td> 
					<td> 
						<input name="ds_db_ip" type="text" id="ds_db_ip" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_ip(),"127.0.0.1")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_port") %>: 
					</td> 
					<td> 
						<input name="ds_db_port" type="text" id="ds_db_port" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_port(),"1433")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_schema") %>: 
					</td> 
					<td> 
						<input name="ds_db_schema" type="text" id="ds_db_schema" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_schema(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_user") %>: 
					</td> 
					<td> 
						<input name="ds_db_user" type="text" id="ds_db_user" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_user(),"sa")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_password") %>: 
					</td> 
					<td> 
						<input name="ds_db_password" type="password" id="ds_db_password" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_password(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<table align="center" width="100%" class="toolbar_table">
				<tr>
					<td>
						<input id="saveButton" type="button" class="button button_save" value="设置" title="设置" onClick="set4sysdb()">
					</td>
				</tr>
			</table>
		</form> 
		
		<script type="text/javascript">

		
		function set4sysdb()
		{
			// 做必要的检查 
			if(!checkNull("ds_code","<%=domainInstance.getPropertyCnName("ds_code")%>")) return false;
			if(!checkNull("ds_name","<%=domainInstance.getPropertyCnName("ds_name")%>")) return false; 
			if(!checkNull("ds_db_type","<%=domainInstance.getPropertyCnName("ds_db_type")%>")) return false; 
			if(!checkNull("ds_db_ip","<%=domainInstance.getPropertyCnName("ds_db_ip")%>")) return false; 
			if(!checkNull("ds_db_port","<%=domainInstance.getPropertyCnName("ds_db_port")%>")) return false; 
			if(!checkNull("ds_db_schema","<%=domainInstance.getPropertyCnName("ds_db_schema")%>")) return false; 
			if(!checkNull("ds_db_user","<%=domainInstance.getPropertyCnName("ds_db_user")%>")) return false; 
			if(!checkNull("ds_db_password","<%=domainInstance.getPropertyCnName("ds_db_password")%>")) return false; 
		
			$.ajax({   
				type:"post",     
				url:'<%=contextPath%>/<%=basePath%>/Servlet?method=set4sysdb',   
				data:$('form').serialize(),
				success:function(result){     
					 alert(result);
					 if(result.indexOf('成功')>=0){
					 	window.location.href='<%=contextPath%>/login.jsp';
					 }
				 },   
				error:function(){   
					 alert("出现了点小问题");   
				 }   
			 }); 
		}
		</script>
	</body> 
</html> 
