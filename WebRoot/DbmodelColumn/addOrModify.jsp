<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.dbmodel.obj.DbmodelColumnObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	DbmodelColumnObj domainInstance = new DbmodelColumnObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (DbmodelColumnObj) domainInstanceObj; 
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
		if(!checkNull("tableid","<%=domainInstance.getPropertyCnName("tableid")%>")) return false; 
		if(!checkNull("columnname","<%=domainInstance.getPropertyCnName("columnname")%>")) return false; 
		if(!checkNull("columntype","<%=domainInstance.getPropertyCnName("columntype")%>")) return false; 
		if(!checkNull("columnscale","<%=domainInstance.getPropertyCnName("columnscale")%>")) return false; 
		if(!checkNull("columncnname","<%=domainInstance.getPropertyCnName("columncnname")%>")) return false; 
		if(!checkNull("dictname","<%=domainInstance.getPropertyCnName("dictname")%>")) return false; 
		if(!checkNull("columnshow","<%=domainInstance.getPropertyCnName("columnshow")%>")) return false; 
		if(!checkNull("columnforsearch","<%=domainInstance.getPropertyCnName("columnforsearch")%>")) return false; 
		if(!checkNull("iskeycolumn","<%=domainInstance.getPropertyCnName("iskeycolumn")%>")) return false; 
		if(!checkNull("notnull","<%=domainInstance.getPropertyCnName("notnull")%>")) return false; 
					 
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
						<%=domainInstance.getPropertyCnName("tableid") %>: 
					</td> 
					<td> 
						<input name="tableid" type="text" id="tableid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getTableid(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("columnname") %>: 
					</td> 
					<td> 
						<input name="columnname" type="text" id="columnname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getColumnname(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("columntype") %>: 
					</td> 
					<td> 
						<input name="columntype" type="text" id="columntype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getColumntype(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("columnscale") %>: 
					</td> 
					<td> 
						<input name="columnscale" type="text" id="columnscale" value="<%=StringUtil.getNotEmptyStr(domainInstance.getColumnscale(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("columncnname") %>: 
					</td> 
					<td> 
						<input name="columncnname" type="text" id="columncnname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getColumncnname(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dictname") %>: 
					</td> 
					<td> 
						<input name="dictname" type="text" id="dictname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDictname(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("columnshow") %>: 
					</td> 
					<td> 
						<input name="columnshow" type="text" id="columnshow" value="<%=StringUtil.getNotEmptyStr(domainInstance.getColumnshow(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("columnforsearch") %>: 
					</td> 
					<td> 
						<input name="columnforsearch" type="text" id="columnforsearch" value="<%=StringUtil.getNotEmptyStr(domainInstance.getColumnforsearch(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iskeycolumn") %>: 
					</td> 
					<td> 
						<input name="iskeycolumn" type="text" id="iskeycolumn" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIskeycolumn(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("notnull") %>: 
					</td> 
					<td> 
						<input name="notnull" type="text" id="notnull" value="<%=StringUtil.getNotEmptyStr(domainInstance.getNotnull(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
	</body> 
</html> 
