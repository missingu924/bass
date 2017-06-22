<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.dbmodel.obj.DbmodelTableObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	DbmodelTableObj domainInstance = new DbmodelTableObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (DbmodelTableObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.findKeyValue() > 0; 
	// 唯一性检查用的字段 
	String keyCol = "null"; 
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
		if(!checkNull("tablename","<%=domainInstance.getPropertyCnName("tablename")%>")) return false; 
		if(!checkNull("javapackage","<%=domainInstance.getPropertyCnName("javapackage")%>")) return false; 
		if(!checkNull("javasrcdir","<%=domainInstance.getPropertyCnName("javasrcdir")%>")) return false; 
		if(!checkNull("cnname","<%=domainInstance.getPropertyCnName("cnname")%>")) return false; 
		if(!checkNull("iconpath","<%=domainInstance.getPropertyCnName("iconpath")%>")) return false; 
		if(!checkNull("fordetail","<%=domainInstance.getPropertyCnName("fordetail")%>")) return false; 
		if(!checkNull("containsoperationcol","<%=domainInstance.getPropertyCnName("containsoperationcol")%>")) return false; 
		if(!checkNull("keycolumn","<%=domainInstance.getPropertyCnName("keycolumn")%>")) return false; 
		if(!checkNull("uniquecolumn","<%=domainInstance.getPropertyCnName("uniquecolumn")%>")) return false; 
					 
			// 修改 
			if("true"=="<%=isModify%>") 
			{ 
				submit(); 
			} 
			// 新增 
			else 
			{ 
					// 新增时检查唯一性 
					$.post( 
					encodeURI("Servlet?method=checkId4this&isFromUrl=true&id=0&<%=keyCol%>="+$("#<%=keyCol%>").val()),  
					{Action:"post"},  
					function (data, textStatus){ 
						this; 
						if(data=="true")  
						{ 
							alert("该<%=domainInstance.getPropertyCnName(keyCol)%>已录入系统");  
							return false; 
						} 
						else 
						{ 
							submit(); 
						} 
					}); 
				}; 
		} 
		 
		// 提交保存或修改 
		function submit() 
		{ 
					$("#addOrModifyForm").submit(); 
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
						<%=domainInstance.getPropertyCnName("tablename") %>: 
					</td> 
					<td> 
						<input name="tablename" type="text" id="tablename" value="<%=StringUtil.getNotEmptyStr(domainInstance.getTablename(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("javapackage") %>: 
					</td> 
					<td> 
						<input name="javapackage" type="text" id="javapackage" value="<%=StringUtil.getNotEmptyStr(domainInstance.getJavapackage(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("javasrcdir") %>: 
					</td> 
					<td> 
						<input name="javasrcdir" type="text" id="javasrcdir" value="<%=StringUtil.getNotEmptyStr(domainInstance.getJavasrcdir(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cnname") %>: 
					</td> 
					<td> 
						<input name="cnname" type="text" id="cnname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCnname(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iconpath") %>: 
					</td> 
					<td> 
						<input name="iconpath" type="text" id="iconpath" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIconpath(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("fordetail") %>: 
					</td> 
					<td> 
						<input name="fordetail" type="text" id="fordetail" value="<%=StringUtil.getNotEmptyStr(domainInstance.getFordetail(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("containsoperationcol") %>: 
					</td> 
					<td> 
						<input name="containsoperationcol" type="text" id="containsoperationcol" value="<%=StringUtil.getNotEmptyStr(domainInstance.getContainsoperationcol(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("keycolumn") %>: 
					</td> 
					<td> 
						<input name="keycolumn" type="text" id="keycolumn" value="<%=StringUtil.getNotEmptyStr(domainInstance.getKeycolumn(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("uniquecolumn") %>: 
					</td> 
					<td> 
						<input name="uniquecolumn" type="text" id="uniquecolumn" value="<%=StringUtil.getNotEmptyStr(domainInstance.getUniquecolumn(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
	</body> 
</html> 
