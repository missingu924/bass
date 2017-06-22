<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%>
<%@page import="com.hcp.util.HcpDataSourceBaseInfoUtil"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	HcpDataSourceBaseInfoObj domainInstance = (HcpDataSourceBaseInfoObj) request.getAttribute("domainInstance");  
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
		<table width="700" align="center" class="title_table"> 
			<tr> 
				<td> 
					<%=domainInstance.getCnName()%>信息 
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="700" align="center" class="detail_table detail_table-bordered"> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("base_info_name") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBase_info_name())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("base_info_type_code") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("基础档案类型字典",domainInstance.getBase_info_type_code()+"")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ds_code") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("数据源字典",domainInstance.getDs_code()+"")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("db_table") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDb_table())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("db_code_column") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDb_code_column())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("db_name_column") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDb_name_column())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("db_filter") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDb_filter())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("connectStatus") %>: 
				</td> 
				<td style="color:<%="正常".equals(domainInstance.getConnectStatus())?"green":"red" %>"><%=domainInstance.getConnectStatus()%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
		
		<!-- 标题 --> 
		<table width="700" align="center" class="title_table"> 
			<tr> 
				<td> 
					<%=domainInstance.getBase_info_name()%>-数据
				</td> 
			</tr> 
		</table> 
		<table width="700" id="data_table" class="table table-bordered table-striped" align="center"> 
				<thead> 
					<tr> 
					<th>序号</th>
					<th>编码</th>
					<th>名称</th>
					</tr> 
				</thead> 
				<% try{
					List<DictItem> items = HcpDataSourceBaseInfoUtil.getDictItemsByName(domainInstance.getBase_info_name());
					for(int i=0;i<items.size();i++){
						DictItem o = items.get(i);
				%> 
				<tr> 
					<td><%=i+1 %></td> 
					<td><%=o.getK() %></td> 
					<td><%=o.getV() %></td>
				</tr>
				<%} } catch(Exception e){out.print(e.getMessage());}%>
		</table>
	</body> 
</html> 
