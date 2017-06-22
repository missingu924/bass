<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="com.wuyg.system.obj.SystemConfigObj"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%
	// 当前上下文路径  
	String contextPath = request.getContextPath();

	// 该功能对象实例  
	SystemConfigObj domainInstance = (SystemConfigObj) request.getAttribute("domainInstance");
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
					<%=domainInstance.getPropertyCnName("name")%>:
				</td>
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getName())%></td>
			</tr>
			<tr>
				<td>
					<%=domainInstance.getPropertyCnName("cn_name")%>:
				</td>
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCn_name())%></td>
			</tr>
			<tr>
				<td>
					<%=domainInstance.getPropertyCnName("type")%>:
				</td>
				<td><%=DictionaryUtil.getDictValueByDictKey("数据类型字典", domainInstance.getType() + "", true)%></td>
			</tr>
			<tr>
				<td>
					<%=domainInstance.getPropertyCnName("dict_name")%>:
				</td>
				<td>
					<%=DictionaryUtil.getDictValueByDictKey("DICT_SELF", "dict_name", StringUtil.getNotEmptyStr(domainInstance.getDict_name(), ""))%>
				</td>
			</tr>
			<tr>
					<td>
						<%=domainInstance.getPropertyCnName("select_type")%>:
					</td>
					<td>
						<%=DictionaryUtil.getDictValueByDictKey("选择类型字典", StringUtil.getNotEmptyStr(domainInstance.getSelect_type(), ""))%>
					</td>
			</tr>
			<tr>
					<td>
						<%=domainInstance.getPropertyCnName("after_class")%>:
					</td>
					<td>
						<%=StringUtil.getNotEmptyStr(domainInstance.getAfter_class(), "")%>
					</td>
			</tr>
			<tr>
					<td>
						<%=domainInstance.getPropertyCnName("value")%>:
					</td>
					<td>
						<%=StringUtil.getNotEmptyStr(domainInstance.getValue4show(), "")%>
					</td>
				</tr>
			<tr>
				<td>
					<%=domainInstance.getPropertyCnName("default_value")%>:
				</td>
				<td>
					<%=StringUtil.getNotEmptyStr(domainInstance.getDefault_value(), "")%>
				</td>
			</tr>
			<tr>
				<td>
					<%=domainInstance.getPropertyCnName("sort_code")%>:
				</td>
				<td>
					<%=StringUtil.getNotEmptyStr(domainInstance.getSort_code(), "")%>
				</td>
			</tr>
			<tr>
				<td>
					<%=domainInstance.getPropertyCnName("be_stop")%>:
				</td>
				<td><%=DictionaryUtil.getCheckboxHtml("be_stop", StringUtil.getNotEmptyStr(domainInstance.getBe_stop(), "否"), true)%></td>
			</tr>
		</table>

		<!-- 工具栏 -->
		<jsp:include page="../ToolBar/detail_toolbar.jsp" />
	</body>
</html>
