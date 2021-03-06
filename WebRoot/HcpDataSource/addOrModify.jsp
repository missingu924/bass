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
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	HcpDataSourceObj domainInstance = new HcpDataSourceObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (HcpDataSourceObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.findKeyValue() > 0; 
	// 唯一性检查用的字段 
	String keyCol = "ds_name"; 
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
		if(!checkNull("ds_code","<%=domainInstance.getPropertyCnName("ds_code")%>")) return false;
		if(!checkNull("ds_name","<%=domainInstance.getPropertyCnName("ds_name")%>")) return false; 
		if(!checkNull("ds_db_type","<%=domainInstance.getPropertyCnName("ds_db_type")%>")) return false; 
		if(!checkNull("ds_db_ip","<%=domainInstance.getPropertyCnName("ds_db_ip")%>")) return false; 
		if(!checkNull("ds_db_port","<%=domainInstance.getPropertyCnName("ds_db_port")%>")) return false; 
		if(!checkNull("ds_db_schema","<%=domainInstance.getPropertyCnName("ds_db_schema")%>")) return false; 
		if(!checkNull("ds_db_user","<%=domainInstance.getPropertyCnName("ds_db_user")%>")) return false; 
		if(!checkNull("ds_db_password","<%=domainInstance.getPropertyCnName("ds_db_password")%>")) return false; 
					 
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
						<%=domainInstance.getPropertyCnName("ds_code") %>: 
					</td> 
					<td> 
						<input name="ds_code" type="text" id="ds_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_code(),"")%>" size="20"  <%=isModify?"readOnly":""%>> 
						<font color="red">*</font> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_name") %>: 
					</td> 
					<td> 
						<input name="ds_name" type="text" id="ds_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_name(),"")%>" size="20"> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_type") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml("数据库类型字典", "ds_db_type", StringUtil.getNotEmptyStr(domainInstance.getDs_db_type(), ""))%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_ip") %>: 
					</td> 
					<td> 
						<input name="ds_db_ip" type="text" id="ds_db_ip" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_ip(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ds_db_port") %>: 
					</td> 
					<td> 
						<input name="ds_db_port" type="text" id="ds_db_port" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_port(),"")%>" size="20"  > 
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
						<input name="ds_db_user" type="text" id="ds_db_user" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDs_db_user(),"")%>" size="20"  > 
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
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
		
		<!-- 设置修改时哪些字段不可修改 -->
		<script type="text/javascript">
		if(true==<%=isModify%>)
		{
			setReadonly("ds_code");
		}
		</script>
	</body> 
</html> 
