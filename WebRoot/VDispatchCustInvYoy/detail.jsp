<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VDispatchCustInvYoyObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	VDispatchCustInvYoyObj domainInstance = (VDispatchCustInvYoyObj) request.getAttribute("domainInstance");  
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
					<%=domainInstance.getPropertyCnName("cinvcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_01_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_01_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_02_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_02_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_03_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_03_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_04_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_04_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_05_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_05_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_06_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_06_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_07_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_07_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_08_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_08_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_09_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_09_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_10_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_10_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_11_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_11_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_inatsum") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_inatsum(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cinvname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCinvname())%></td> 
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
					<%=domainInstance.getPropertyCnName("cpersoncode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpersoncode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpersonname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpersonname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_01_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_01_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_02_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_02_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_03_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_03_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_04_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_04_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_05_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_05_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_06_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_06_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_07_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_07_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_08_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_08_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_09_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_09_inatsum_yoy(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("year_10_inatsum_yoy") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getYear_10_inatsum_yoy(),2)%></td> 
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
