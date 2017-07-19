<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VDispatchCustInvMomObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<%
  	// 上下文路径 
  	String contextPath = request.getContextPath(); 
  	 
  	// 对象实例 
  	VDispatchCustInvMomObj domainInstance = new VDispatchCustInvMomObj(); 
  	// 用户信息 
  	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
  	// 该功能基本路径 
  	String basePath = domainInstance.getBasePath(); 
   
  	// 如果是修改，则获取对象信息 
  	Object domainInstanceObj = request.getAttribute("domainInstance"); 
  	if (domainInstanceObj != null) 
  	{ 
  		domainInstance = (VDispatchCustInvMomObj) domainInstanceObj; 
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
						<%=domainInstance.getPropertyCnName("month_01_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_01_inatsum" type="text" id="month_01_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_01_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_02_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_02_inatsum" type="text" id="month_02_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_02_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_03_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_03_inatsum" type="text" id="month_03_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_03_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_04_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_04_inatsum" type="text" id="month_04_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_04_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_05_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_05_inatsum" type="text" id="month_05_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_05_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_06_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_06_inatsum" type="text" id="month_06_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_06_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_07_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_07_inatsum" type="text" id="month_07_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_07_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_08_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_08_inatsum" type="text" id="month_08_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_08_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_09_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_09_inatsum" type="text" id="month_09_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_09_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_10_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_10_inatsum" type="text" id="month_10_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_10_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_11_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_11_inatsum" type="text" id="month_11_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_11_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_12_inatsum") %>: 
					</td> 
					<td> 
						<input name="month_12_inatsum" type="text" id="month_12_inatsum" value="<%=StringUtil.formatDouble(domainInstance.getMonth_12_inatsum(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_01_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_01_inatsum_yoy" type="text" id="month_01_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_01_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_02_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_02_inatsum_yoy" type="text" id="month_02_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_02_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_03_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_03_inatsum_yoy" type="text" id="month_03_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_03_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_04_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_04_inatsum_yoy" type="text" id="month_04_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_04_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_05_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_05_inatsum_yoy" type="text" id="month_05_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_05_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_06_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_06_inatsum_yoy" type="text" id="month_06_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_06_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_07_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_07_inatsum_yoy" type="text" id="month_07_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_07_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_08_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_08_inatsum_yoy" type="text" id="month_08_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_08_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_09_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_09_inatsum_yoy" type="text" id="month_09_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_09_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_10_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_10_inatsum_yoy" type="text" id="month_10_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_10_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_11_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_11_inatsum_yoy" type="text" id="month_11_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_11_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_12_inatsum_yoy") %>: 
					</td> 
					<td> 
						<input name="month_12_inatsum_yoy" type="text" id="month_12_inatsum_yoy" value="<%=StringUtil.formatDouble(domainInstance.getMonth_12_inatsum_yoy(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_01_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_01_inatsum_mom" type="text" id="month_01_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_01_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_02_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_02_inatsum_mom" type="text" id="month_02_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_02_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_03_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_03_inatsum_mom" type="text" id="month_03_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_03_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_04_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_04_inatsum_mom" type="text" id="month_04_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_04_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_05_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_05_inatsum_mom" type="text" id="month_05_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_05_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_06_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_06_inatsum_mom" type="text" id="month_06_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_06_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_07_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_07_inatsum_mom" type="text" id="month_07_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_07_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_08_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_08_inatsum_mom" type="text" id="month_08_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_08_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_09_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_09_inatsum_mom" type="text" id="month_09_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_09_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_10_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_10_inatsum_mom" type="text" id="month_10_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_10_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_11_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_11_inatsum_mom" type="text" id="month_11_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_11_inatsum_mom(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("month_12_inatsum_mom") %>: 
					</td> 
					<td> 
						<input name="month_12_inatsum_mom" type="text" id="month_12_inatsum_mom" value="<%=StringUtil.formatDouble(domainInstance.getMonth_12_inatsum_mom(),2)%>" size="20"  > 
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
