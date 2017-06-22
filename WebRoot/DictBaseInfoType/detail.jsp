<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.hcp.obj.DictBaseInfoTypeObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoObj"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	DictBaseInfoTypeObj domainInstance = (DictBaseInfoTypeObj) request.getAttribute("domainInstance");  
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能路径  
	String basePath = domainInstance.getBasePath();  
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=domainInstance.getCnName()%>详情</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css" /> 
		<link href="../css/table.css" rel="stylesheet" type="text/css" /> 
		<script src="../js/jquery-2.0.3.min.js"></script> 
		<script src="../js/utils.js"></script> 
	</head> 
	<body> 
		<!-- 表格标题 --> 
		<table width="900" align="center" class="title_table"> 
			<tr> 
				<td> 
					<%=domainInstance.getCnName()%>信息 
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="900" align="center" class="detail_table detail_table-bordered"> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("base_info_type_code") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBase_info_type_code())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("base_info_type_name") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBase_info_type_name())%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
		
		<!-- 标题 --> 
		<%
			HcpDataSourceBaseInfoObj hcpDataSourceBaseInfo = new HcpDataSourceBaseInfoObj();
		%>
		<table width="900" align="center" class="title_table"> 
			<tr> 
				<td> 
					该类型包含的基础档案模型
				</td> 
			</tr> 
		</table> 
		
		<table id="data_table" class="table table-bordered table-striped" align="center" width="900"> 
		<thead> 
			<tr> 
				<th>序号</th>
				<th><%=hcpDataSourceBaseInfo.getPropertyCnName("base_info_name") %></th> 
				<th><%=hcpDataSourceBaseInfo.getPropertyCnName("base_info_type_code") %></th> 
				<th><%=hcpDataSourceBaseInfo.getPropertyCnName("db_table") %></th> 
				<th><%=hcpDataSourceBaseInfo.getPropertyCnName("db_code_column") %></th> 
				<th><%=hcpDataSourceBaseInfo.getPropertyCnName("db_name_column") %></th> 
				<th><%=hcpDataSourceBaseInfo.getPropertyCnName("db_filter") %></th> 
				<th>操作</th> 
			</tr> 
		</thead> 
		<% 
			List<HcpDataSourceBaseInfoObj> list = domainInstance.findHcpDataSourceBaseInfoList();
			for (int i = 0; i < list.size(); i++) 
				{ 
					HcpDataSourceBaseInfoObj o = (HcpDataSourceBaseInfoObj) list.get(i); 
		%> 
		<tr> 
			<td><%=i+1 %></td>
			<td><%=StringUtil.getNotEmptyStr(o.getBase_info_name())%></td> 
			<td><%=DictionaryUtil.getDictValueByDictKey("基础档案类型字典",o.getBase_info_type_code()+"")%></td>  
			<td><%=StringUtil.getNotEmptyStr(o.getDb_table())%></td> 
			<td><%=StringUtil.getNotEmptyStr(o.getDb_code_column())%></td> 
			<td><%=StringUtil.getNotEmptyStr(o.getDb_name_column())%></td> 
			<td><%=StringUtil.getNotEmptyStr(o.getDb_filter())%></td>  
			<td width="50" style="text-align:center"> 
				<input type="button" class="button button_detail" title="详情" onClick="openBigModalDialog('<%=contextPath%>/HcpDataSourceBaseInfo/Servlet?method=detail4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
			</td> 
		</tr> 
		<% 
			} 
		%> 
	</table> 
	</body> 
</html> 
