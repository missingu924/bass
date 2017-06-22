<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapObj"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	HcpDataSourceBaseInfoMapObj domainInstance = new HcpDataSourceBaseInfoMapObj();
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO);
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance");
	if (domainInstanceObj != null)
	{
		domainInstance = (HcpDataSourceBaseInfoMapObj) domainInstanceObj;
	}

	// 是否是修改 
	boolean isModify = domainInstance.findKeyValue() > 0;
	// 唯一性检查用的字段 
	String keyCol = "src_ds_code";
%>
<html>
	<head>
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title>
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
		if(!checkNull("src_base_info_name","<%=domainInstance.getPropertyCnName("src_base_info_name")%>")) return false;
		if(!checkNull("dst_base_info_name","<%=domainInstance.getPropertyCnName("dst_base_info_name")%>")) return false; 
		
		if($("#src_base_info_name").val()==$("#dst_base_info_name").val())
		{
			alert("不能自己和自己做对照");
			return false;
		}
					 
			// 修改 
			if("true"=="<%=isModify%>") 
			{ 
				addOrModirySubmit(); 
			} 
			// 新增 
			else 
			{ 
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
						<%=domainInstance.getPropertyCnName("src_base_info_name")%>:
					</td>
					<td>
						<%=DictionaryUtil.getSelectHtml("数据源-基础档案字典", "src_base_info_name", StringUtil.getNotEmptyStr(domainInstance.getSrc_base_info_name(), ""))%>
						<font color="red">*</font>
					</td>
					<td>
						<%=domainInstance.getPropertyCnName("dst_base_info_name")%>:
					</td>
					<td>
						<%=DictionaryUtil.getSelectHtml("数据源-基础档案字典", "dst_base_info_name", StringUtil.getNotEmptyStr(domainInstance.getDst_base_info_name(), ""))%>
						<font color="red">*</font>
					</td>
				</tr>
			</table>

			<!-- 工具栏 -->
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" />
		</form>
	</body>
</html>
