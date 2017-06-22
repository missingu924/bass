<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.system.obj.SystemMenuObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	SystemMenuObj domainInstance = new SystemMenuObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (SystemMenuObj) domainInstanceObj; 
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
			if(!checkNull("menu_code","<%=domainInstance.getPropertyCnName("menu_code")%>")) return false; 
			if(!checkNull("menu_name","<%=domainInstance.getPropertyCnName("menu_name")%>")) return false; 
			
			// 检查 菜单编码
			var menu_code = $("#menu_code").val();
			var parent_code = $("#parent_code").val();
			var regstr="^("+parent_code+")[a-zA-Z0-9]{2}$";
			var reg = new RegExp(regstr); 
			if (!reg.test(menu_code)) {
				alert("菜单编码不符合格式要求");
				$("#menu_code").focus();
				return false;
			}
					 
			// 修改 
			if($("#pre_menu_code").val()==$("#menu_code").val()) 
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
		
		// 选中菜单图标
		function selectImage4this()
		{
			var imageSrc = openBigModalDialog('<%=contextPath%>/<%=basePath%>/listImages.jsp?');
		
			$("#menu_icon").val(imageSrc);
			
			$("#menu_icon_image").attr("src","<%=contextPath%>/"+imageSrc);
			if(imageSrc==undefined)
			{
				$("#menu_icon_image").hide();
			}
			else
			{
				$("#menu_icon_image").show();
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
				<input type="hidden" name="pre_menu_code" id="pre_menu_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMenu_code(),"")%>">
				
				<tr> 
					<td> 
						 
					</td> 
					<td> 
						上级编码：<%=StringUtil.getNotEmptyStr(domainInstance.getParent_code(),"")%>
						<br>
						上级名称：<%=DictionaryUtil.getDictValueByDictKey("菜单字典", StringUtil.getNotEmptyStr(domainInstance.getParent_code(), ""))%> 
						<br>
						同级最后编码：<%=StringUtil.getNotEmptyStr(request.getAttribute("last_code"),"") %>
						<input type="hidden" name="parent_code" id="parent_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getParent_code(),"")%>" size="20" readonly > 
					</td> 
				</tr> 
				<tr> 
					<td style="vertical-align:top"> 
						<%=domainInstance.getPropertyCnName("menu_code") %>: 
					</td> 
					<td> 
						<input name="menu_code" type="text" id="menu_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMenu_code(),StringUtil.getNotEmptyStr(domainInstance.getParent_code(),""))%>" size="20"  <%=isModify?"":""%>> 
						<font color="red">*</font> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
						<br><br>
						<font color="blue">编码规则：** ** ** **&nbsp;&nbsp;(可使用大小写字母及数字编码)</font>
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("menu_name") %>: 
					</td> 
					<td> 
						<input name="menu_name" type="text" id="menu_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMenu_name(),"")%>" size="80"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("menu_url") %>: 
					</td> 
					<td> 
						<input name="menu_url" type="text" id="menu_url" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMenu_url(),"")%>" size="80"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("menu_auth_func_code") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml("权限项字典", "menu_auth_func_code", StringUtil.getNotEmptyStr(domainInstance.getMenu_auth_func_code(), ""))%> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("menu_icon") %>: 
					</td> 
					<td> 
						
						<img id="menu_icon_image" src="<%=contextPath+"/"+domainInstance.getMenu_icon()%>" width="16" height="16" style="display:<%=StringUtil.isEmpty(domainInstance.getMenu_icon())?"none":"" %>">
						
						<input name="menu_icon" type="hidden" id="menu_icon" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMenu_icon(),"")%>" size="20"  > 
						<input type="button" class="button button_dot" onClick="selectImage4this()" />
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("be_stop") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getCheckboxHtml("be_stop",StringUtil.getNotEmptyStr(domainInstance.getBe_stop(),"否"),false)%>
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("be_system") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getCheckboxHtml("be_system",StringUtil.getNotEmptyStr(domainInstance.getBe_system(),"否"),false)%>
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("be_open") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getCheckboxHtml("be_open",StringUtil.getNotEmptyStr(domainInstance.getBe_open(),"否"),false)%>
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
			//setReadonly("menu_code"); 
			setReadonly("parent_code"); 
		} 
		</script> 
	</body> 
</html> 
