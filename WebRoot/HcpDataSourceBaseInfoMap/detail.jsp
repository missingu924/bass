<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	HcpDataSourceBaseInfoMapObj domainInstance = (HcpDataSourceBaseInfoMapObj) request.getAttribute("domainInstance");  
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
					<%=domainInstance.getPropertyCnName("src_ds_code") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("数据源字典",domainInstance.getSrc_ds_code()+"")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("src_base_info_name") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("数据源-基础档案字典",domainInstance.getSrc_base_info_name()+"")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("src_base_info_type_code") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("基础档案类型字典",domainInstance.getSrc_base_info_type_code()+"")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dst_ds_code") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("数据源字典",domainInstance.getDst_ds_code()+"")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dst_base_info_name") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("数据源-基础档案字典",domainInstance.getDst_base_info_name()+"")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dst_base_info_type_code") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("基础档案类型字典",domainInstance.getDst_base_info_type_code()+"")%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
