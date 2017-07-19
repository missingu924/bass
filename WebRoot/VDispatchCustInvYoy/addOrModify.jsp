<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VDispatchCustInvYoyObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	VDispatchCustInvYoyObj domainInstance = new VDispatchCustInvYoyObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (VDispatchCustInvYoyObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.findKeyValue() > 0; 
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title> 
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
					 
			// 修改 
			if("true"=="<%=isModify%>") 
			{ 
				addOrModirySubmit(); 
			} 
			// 新增 
			else 
			{ 
				// 新增时检查唯一性 
				checkUniqueAndSave('<%=basePath%>');
			} 
		} 
		 
		</script> 
	</head> 
	<body> 
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/Proxy/Servlet?servlet=<%=basePath%>&method=addOrModify4this" method="post"> 
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
						<%=domainInstance.getPropertyCnName("cinvcode") %>: 
					</td> 
					<td> 
						<input name="cinvcode" type="text" id="cinvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_01_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_01_inatsum" type="text" id="year_01_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_01_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_02_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_02_inatsum" type="text" id="year_02_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_02_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_03_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_03_inatsum" type="text" id="year_03_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_03_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_04_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_04_inatsum" type="text" id="year_04_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_04_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_05_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_05_inatsum" type="text" id="year_05_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_05_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_06_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_06_inatsum" type="text" id="year_06_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_06_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_07_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_07_inatsum" type="text" id="year_07_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_07_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_08_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_08_inatsum" type="text" id="year_08_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_08_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_09_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_09_inatsum" type="text" id="year_09_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_09_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_10_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_10_inatsum" type="text" id="year_10_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_10_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_11_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_11_inatsum" type="text" id="year_11_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_11_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_inatsum") %>: 
					</td> 
					<td> 
						<input name="year_inatsum" type="text" id="year_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getYear_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cinvname") %>: 
					</td> 
					<td> 
						<input name="cinvname" type="text" id="cinvname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccuscode") %>: 
					</td> 
					<td> 
						<input name="ccuscode" type="text" id="ccuscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcuscode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccusname") %>: 
					</td> 
					<td> 
						<input name="ccusname" type="text" id="ccusname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcusname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpersoncode") %>: 
					</td> 
					<td> 
						<input name="cpersoncode" type="text" id="cpersoncode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersoncode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpersonname") %>: 
					</td> 
					<td> 
						<input name="cpersonname" type="text" id="cpersonname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersonname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_01_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_01_inatsum_yoy" type="text" id="year_01_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_01_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_02_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_02_inatsum_yoy" type="text" id="year_02_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_02_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_03_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_03_inatsum_yoy" type="text" id="year_03_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_03_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_04_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_04_inatsum_yoy" type="text" id="year_04_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_04_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_05_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_05_inatsum_yoy" type="text" id="year_05_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_05_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_06_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_06_inatsum_yoy" type="text" id="year_06_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_06_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_07_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_07_inatsum_yoy" type="text" id="year_07_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_07_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_08_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_08_inatsum_yoy" type="text" id="year_08_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_08_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_09_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_09_inatsum_yoy" type="text" id="year_09_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_09_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("year_10_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="year_10_inatsum_yoy" type="text" id="year_10_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getYear_10_inatsum_yoy(),2)%>" size="20"  > 
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
		} 
		</script> 
	</body> 
</html> 
