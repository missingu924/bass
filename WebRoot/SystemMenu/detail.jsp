<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.system.obj.SystemMenuObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	SystemMenuObj domainInstance = (SystemMenuObj) request.getAttribute("domainInstance");  
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能路径  
	String basePath = domainInstance.getBasePath();  
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=domainInstance.getCnName()%>详情</title> 
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
					<%=domainInstance.getPropertyCnName("menu_code") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getMenu_code())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("menu_name") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getMenu_name())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("parent_code") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getParent_code())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("menu_url") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getMenu_url())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("menu_auth_func_code") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("权限项字典",domainInstance.getMenu_auth_func_code()+"",true)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("menu_icon") %>: 
				</td> 
					<td>
					<%if(!StringUtil.isEmpty(domainInstance.getMenu_icon())){ %>
						<img src="<%=contextPath+"/"+domainInstance.getMenu_icon() %>" width="16" height="16" align="middle" />
					<%} %>
					</td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("be_stop") %>: 
				</td> 
				<td><%=DictionaryUtil.getCheckboxHtml("be_stop",StringUtil.getNotEmptyStr(domainInstance.getBe_stop(),"否"),true)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("be_system") %>: 
				</td> 
				<td><%=DictionaryUtil.getCheckboxHtml("be_system",StringUtil.getNotEmptyStr(domainInstance.getBe_system(),"否"),true)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("be_open") %>: 
				</td> 
				<td><%=DictionaryUtil.getCheckboxHtml("be_open",StringUtil.getNotEmptyStr(domainInstance.getBe_open(),"否"),true)%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
