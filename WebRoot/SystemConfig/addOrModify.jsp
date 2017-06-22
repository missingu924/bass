<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="com.wuyg.system.obj.SystemConfigObj"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	SystemConfigObj domainInstance = new SystemConfigObj();
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO);
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance");
	if (domainInstanceObj != null)
	{
		domainInstance = (SystemConfigObj) domainInstanceObj;
	}

	// 是否是修改 
	boolean isModify = domainInstance.findKeyValue() > 0;
%>
<html>
	<head>
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/autosize.min.js"></script>
		<script type="text/javascript">$(document).ready(function () {autosize($('textarea'));})</script>
		<script> 
		//  新增或修改 
		function addOrModify() 
		{	 
			// 做必要的检查 
			if(!checkNull("name","<%=domainInstance.getPropertyCnName("name")%>")) return false; 
			if(!checkNull("cn_name","<%=domainInstance.getPropertyCnName("cn_name")%>")) return false; 
			if(!checkNull("type","<%=domainInstance.getPropertyCnName("type")%>")) return false; 
					 
			// 修改 
			if("true"=="<%=isModify%>") 
			{ 
				addOrModirySubmit(); 
			} 
			// 新增 
			else 
			{ 
				// 新增时检查唯一性 
				checkUniqueAndSave();
			} 
		} 
		 
		</script>
	</head>
	<body>
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=addOrModify4this" method="post">
			<!-- 表格标题 -->
			<table width="700" align="center" class="title_table">
				<tr>
					<td>
						<%=isModify ? "修改" : "增加"%><%=domainInstance.getCnName()%>
					</td>
				</tr>
			</table>

			<!-- 详细信息 -->
			<table width="700" align="center" class="detail_table detail_table-bordered">
				<input type="hidden" id="<%=domainInstance.findKeyColumnName()%>" name="<%=domainInstance.findKeyColumnName()%>" value="<%=domainInstance.findKeyValue()%>">
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("name")%>:
					</td>
					<td>
						<input name="name" type="text" id="name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getName(), "")%>" size="60" <%=isModify ? "readOnly" : ""%>>
						<font color="red">*<%=isModify ? "(不可修改)" : "(不能重复)"%></font>
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("cn_name")%>:
					</td>
					<td>
						<input name="cn_name" type="text" id="cn_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCn_name(), "")%>" size="60">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("type")%>:
					</td>
					<td>
						<%=DictionaryUtil.getSelectHtml("数据类型字典", "type", StringUtil.getNotEmptyStr(domainInstance.getType(), ""))%>
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("dict_name")%>:
					</td>
					<td>
						<%=DictionaryUtil.getSelectHtml("DICT_SELF", "dict_name", StringUtil.getNotEmptyStr(domainInstance.getDict_name(), ""))%>
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("select_type")%>:
					</td>
					<td>
						<%=DictionaryUtil.getSelectHtml("选择类型字典", "select_type", StringUtil.getNotEmptyStr(domainInstance.getSelect_type(), ""))%>
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("after_class")%>:
					</td>
					<td>
						<input name="after_class" type="text" id="after_class" value="<%=StringUtil.getNotEmptyStr(domainInstance.getAfter_class(), "")%>" size="60">
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("value")%>:
					</td>
					<td>
						<input name="value" type="text" id="value" value="<%=StringUtil.getNotEmptyStr(domainInstance.getValue4show(), "")%>" size="60">
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("default_value")%>:
					</td>
					<td>
						<input name="default_value" type="text" id="default_value" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDefault_value(), "")%>" size="60">
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("sort_code")%>:
					</td>
					<td>
						<input name="sort_code" type="text" id="sort_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSort_code(), "")%>" size="60">
					</td>
				</tr>
				<tr>
					<td>
						<%=domainInstance.getPropertyCnName("be_stop")%>:
					</td>
					<td>
						<%=DictionaryUtil.getCheckboxHtml("be_stop", StringUtil.getNotEmptyStr(domainInstance.getBe_stop(), "否"), false)%>
					</td>
				</tr>
			</table>

			<!-- 工具栏 -->
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" />
		</form>

		<!-- 设置修改时哪些字段不可修改 -->
		<script type="text/javascript"> 
		if(true==<%=isModify%>) 
		{ 
			setReadonly("name"); 
		} 
		</script>
	</body>
</html>
