<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	HcpDataSourceBaseInfoObj domainInstance = new HcpDataSourceBaseInfoObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (HcpDataSourceBaseInfoObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.findKeyValue() > 0; 
	// 唯一性检查用的字段 
	String keyCol = "base_info_name"; 
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<link href="../css/table.css" rel="stylesheet" type="text/css"> 
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
		if(!checkNull("base_info_name","<%=domainInstance.getPropertyCnName("base_info_name")%>")) return false; 
		if(!checkNull("base_info_type_code","<%=domainInstance.getPropertyCnName("base_info_type_code")%>")) return false; 
		if(!checkNull("ds_code","<%=domainInstance.getPropertyCnName("ds_code")%>")) return false; 
		if(!checkNull("db_table","<%=domainInstance.getPropertyCnName("db_table")%>")) return false; 
		if(!checkNull("db_code_column","<%=domainInstance.getPropertyCnName("db_code_column")%>")) return false; 
		if(!checkNull("db_name_column","<%=domainInstance.getPropertyCnName("db_name_column")%>")) return false; 
					 
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
						<%=domainInstance.getPropertyCnName("base_info_name") %>: 
					</td> 
					<td> 
						<input name="base_info_name" type="text" id="base_info_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBase_info_name(),"")%>" size="20"  <%=isModify?"readOnly":""%>> 
						<font color="red">*</font> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("base_info_type_code") %>: 
					</td> 
					<td> 
						<%if(isModify){ %>
							<%=DictionaryUtil.getInputHtmlReadOnly("基础档案类型字典", "base_info_type_code", StringUtil.getNotEmptyStr(domainInstance.getBase_info_type_code(), ""),20)%> 
						<%} else {%>
							<%=DictionaryUtil.getSelectHtml("基础档案类型字典", "base_info_type_code", StringUtil.getNotEmptyStr(domainInstance.getBase_info_type_code(), ""))%> 
						<%} %>
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_code") %>: 
					</td> 
					<td> 
					   <%if(isModify){ %>
						<%=DictionaryUtil.getInputHtmlReadOnly("数据源字典", "ds_code", StringUtil.getNotEmptyStr(domainInstance.getDs_code(), ""),20)%> 
					   <%} else {%>
					    <%=DictionaryUtil.getSelectHtml("数据源字典", "ds_code", StringUtil.getNotEmptyStr(domainInstance.getDs_code(), ""))%> 
						<%} %>
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("db_table") %>: 
					</td> 
					<td> 
						<input name="db_table" type="text" id="db_table" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDb_table(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("db_code_column") %>: 
					</td> 
					<td> 
						<input name="db_code_column" type="text" id="db_code_column" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDb_code_column(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("db_name_column") %>: 
					</td> 
					<td> 
						<input name="db_name_column" type="text" id="db_name_column" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDb_name_column(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("db_filter") %>: 
					</td> 
					<td> 
						<input name="db_filter" type="text" id="db_filter" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDb_filter(),"")%>" size="80"  > 
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
			setReadonly("base_info_name");
		}
		</script>
	</body> 
</html> 
