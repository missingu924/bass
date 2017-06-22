<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.system.obj.SystemMenuObj"%>
<%@page import="com.wuyg.tree.obj.ZTreeNode"%>
<%@page import="com.wuyg.tree.service.TreeService"%>
<%@page import="com.wuyg.system.util.SystemMenuUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>系统菜单</title>
	</head>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery-2.0.3.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/css-1.7.0.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>

	<!-- 基本信息 -->
	<%
		// 当前上下文路径 
		String contextPath = request.getContextPath();
	
		AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO);

		// 该功能对象实例 
		SystemMenuObj domainInstance = new SystemMenuObj();

		ZTreeNode zTreeNode = new TreeService().getZtreeNode("可用系统菜单", SystemConstant.DEFAULT_DB, false, true, null);
	%>
	<body class="menu_bg">
		<div style="text-align: right; height:20px">
			<img id="toggleButton" src="images/menu_hide.png" title="隐藏侧边栏" width="12" height="12" align="absmiddle" onclick="toggleLeftFrame()" style="cursor: pointer" />
		</div>

		<%=SystemMenuUtil.buildMenuHtml(zTreeNode,contextPath,user)%>

		<!-- 引入左菜单相关js -->
		<script type="text/javascript" src="js/menu.js"></script>
		<script type="text/javascript">
			// 模拟点击上菜单的第一个顶级菜单 
			$(top.topFrame.document).find("#top_menu_table td:first").click();
		</script>
	</body>