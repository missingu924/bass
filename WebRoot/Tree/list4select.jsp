<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.tree.obj.TreeObj"%> 
<%@page import="com.wuyg.tree.searchcondition.TreeSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.tree.obj.ZTreeNode"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	TreeObj domainInstance = (TreeObj) request.getAttribute("domainInstance"); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 查询结果 
	ZTreeNode ztreeNode = new ZTreeNode(); 
 
	Object ztreeNodeObj = request.getAttribute("ztreeNode"); 
	if (ztreeNodeObj != null) 
	{ 
		ztreeNode = (ZTreeNode) ztreeNodeObj; 
	} 
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" /> 
		<title><%=domainInstance.getName() %></title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		
		<link rel="stylesheet" href="../zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="../zTree/js/jquery.ztree.core.min.js"></script>
		<script type="text/javascript" src="../zTree/js/jquery.ztree.excheck.js"></script>
		<script type="text/javascript">
			var setting = {
				check: {
					enable: true,
					chkboxType: { "Y": "ps", "N": "ps" }
				}
			};
	
			var zNodes=[<%=ztreeNode.toJson()%>];
			
	
			$(document).ready(function(){
				$.fn.zTree.init($("#treeDiv"), setting, zNodes);
			});
			
			function freshMe()
			{
				location.reload();
			}
			
			function getTreeIds()
			{
				var treeObj = $.fn.zTree.getZTreeObj("treeDiv");
				var nodes = treeObj.getCheckedNodes(true);
				
				var treeIds = "";
				var treeNames = "";
				for(i=0; i<nodes.length; i++)
				{
					treeIds+=nodes[i].id+",";
					treeNames+=nodes[i].name+",";
				}
				alert(treeNames);
			}
			
			// 多选：确认选择
			function confirmSelect()
			{		
				var selectValue = "";

				var treeObj = $.fn.zTree.getZTreeObj("treeDiv");
				var nodes = treeObj.getCheckedNodes(true);

				for(i=0; i<nodes.length; i++)
				{

					// 格式为：key1=value1;key2=value2
					selectValue+= nodes[i].id+"="+nodes[i].name+";";
				}
				
				if(selectValue.length>0)
				{
					selectValue = selectValue.substring(0,selectValue.length-1);
					window.returnValue = selectValue;
				}
				
				window.close();
			}
			
			// 监听窗口关闭事件
			$(window).unload(function(){confirmSelect();});
		</script>
	</head> 
	<body> 
		<!-- 查询条件 --> 
		<table class="search_table" align="center" width="90%"> 
			<tr> 
				<td>
					检索&nbsp;&nbsp;</td> 
				<td><input type="text" name="dict_search_input" id="dict_search_input" value=""  size="40"></td> 
				<td><input name="addButton" type="button" class="button button_confirm" value="确认" onClick="confirmSelect()"></td>
			</tr> 
		</table> 
		
		<table align="center" width="90%">
			<tr>
				<td>
					<div id="treeDiv"  class="ztree"></div>
				</td>
			</tr>
		</table>

	</body> 
</html> 
