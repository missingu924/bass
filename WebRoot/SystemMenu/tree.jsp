<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="javax.sql.DataSource"%>
<%@page import="com.inspur.common.tree.Node"%>
<%@page import="com.wuyg.common.util.MySqlUtil"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.inspur.common.tree.TreeBuilder"%>
<%@page import="com.wuyg.tree.obj.ZTreeNode"%>
<%@page import="com.wuyg.tree.service.TreeService"%>
<%@page import="com.wuyg.system.obj.SystemMenuObj"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	SystemMenuObj domainInstance = new SystemMenuObj(); 
	
	String treeJson = new TreeService().getZtreeJson("系统菜单",false,null).replaceAll("url","nourl");
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" /> 
		<title><%=domainInstance.getCnName() %>列表</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<link rel="stylesheet" href="../zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">

		<script type="text/javascript" src="../zTree/js/jquery.ztree.core.min.js"></script>
		<script type="text/javascript" src="../zTree/js/jquery.ztree.excheck.js"></script>
		<script type="text/javascript">
			var setting = {
				callback: {
					onClick: function(event, treeId, treeNode, clickFlag){
						parent.listFrame.location = encodeURI('<%=contextPath%>/<%=domainInstance.getBasePath()%>/Servlet?method=list4this&isFromUrl=true&treeId='+treeNode.id);
					}
				}
			};
	
			var zNodes=[<%=treeJson%>];
			
	
			$(document).ready(function(){
				$.fn.zTree.init($("#treeDiv"), setting, zNodes);
			});
			
			function freshMe()
			{
				location.reload();
			}
		</script>
	</head> 
	<body> 
		<div id="treeDiv"  class="ztree"></div>
	</body> 
</html> 
