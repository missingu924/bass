<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.wuyg.system.obj.SystemMenuObj"%> 
<%@page import="com.wuyg.system.searchcondition.SystemMenuSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	SystemMenuObj domainInstance = (SystemMenuObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	SystemMenuSearchCondition domainSearchCondition = (SystemMenuSearchCondition) request.getAttribute("domainSearchCondition"); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 查询结果 
	PaginationObj pagination = null; 
	List list = new ArrayList(); 
 
	Object paginationObj = request.getAttribute("domainPagination"); 
	if (paginationObj != null) 
	{ 
		pagination = (PaginationObj) paginationObj; 
		list = (List) pagination.getDataList(); 
	} 
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" /> 
		<title><%=domainInstance.getCnName() %>列表</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
		<script type="text/javascript" src="../js/jquery.freezeheader.js"></script> 
		<script type="text/javascript">$(document).ready(function () {$("#data_table").freezeHeader();})</script> 
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=list4this"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="orderBy" name="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
			<input type="hidden" id="treeId" name="treeId" value="<%=domainSearchCondition.getTreeId()%>"> 
			
			<!-- 工具栏 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td><%=domainInstance.getCnName() %></td>  
					<td></td> 
					<td> 
						<input name="searchButton" type="button" class="button button_search" value="查询数据" onClick="toPage(1)"> 
						<input name="searchButton" type="button" class="button button_set" value="高级查询" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&parent_code=<%=domainSearchCondition.getTreeId() %>')"> 
						<%if(list.size()>0){ %> 
						<input name="deleteAllButton" type="button" class="button button_delete" value="全删" onClick="if(confirm('您确认要删除本次查询出的 <%=pagination.getTotalCount() %> 条数据吗?')){$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=deleteAll4this').submit();}"> 
						<%} %> 
						&nbsp;&nbsp; 
						<input name="helpButton" type="button" class="button button_comment" title="提示" onClick="$('#help_info_table').toggle();$('#showHelpInfoTable').val(!$('#help_info_table').is(':hidden'));"> 
					</td> 
				</tr> 
			</table> 
			<!-- 提示信息 -->  
			<table id="help_info_table" class="help_info_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowHelpInfoTable() ? "" : "none"%>'> 
				<tr> 
					<td> 
						<b>【提示】</b> 
						<ul> 
							<li><%=domainInstance.getCnName() %></li> 
						</ul> 
					</td> 
				</tr> 
			</table> 
			<!-- 查询条件 -->  
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowSearchConditionTable() ? "" : "none"%>'> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("menu_code") %></td> 
						<td>
						<input name="menu_code" type="text" id="menu_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMenu_code(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("menu_name") %></td> 
						<td>
						<input name="menu_name" type="text" id="menu_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMenu_name(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("be_stop") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("是否字典", "be_stop", StringUtil.getNotEmptyStr(domainInstance.getBe_stop(), ""),20)%> 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("be_system") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("是否字典", "be_system", StringUtil.getNotEmptyStr(domainInstance.getBe_system(), ""),20)%> 
						</td> 
					<td></td><td></td> 
					<td></td><td></td> 
				</tr> 
			</table> 
 
			<!-- 数据信息 -->  
			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th onClick="sortBy(this)" db_col="menu_code" class="<%=domainSearchCondition.getSortClassByDbColumn("menu_code")%>"><%=domainInstance.getPropertyCnName("menu_code") %></th> 
						<th onClick="sortBy(this)" db_col="menu_name" class="<%=domainSearchCondition.getSortClassByDbColumn("menu_name")%>"><%=domainInstance.getPropertyCnName("menu_name") %></th> 
						<th onClick="sortBy(this)" db_col="parent_code" class="<%=domainSearchCondition.getSortClassByDbColumn("parent_code")%>"><%=domainInstance.getPropertyCnName("parent_code") %></th> 
						<th onClick="sortBy(this)" db_col="menu_url" class="<%=domainSearchCondition.getSortClassByDbColumn("menu_url")%>"><%=domainInstance.getPropertyCnName("menu_url") %></th> 
						<th onClick="sortBy(this)" db_col="menu_auth_func_code" class="<%=domainSearchCondition.getSortClassByDbColumn("menu_auth_func_code")%>"><%=domainInstance.getPropertyCnName("menu_auth_func_code") %></th> 
						<th onClick="sortBy(this)" db_col="be_stop" class="<%=domainSearchCondition.getSortClassByDbColumn("be_stop")%>"><%=domainInstance.getPropertyCnName("be_stop") %></th> 
						<th onClick="sortBy(this)" db_col="be_system" class="<%=domainSearchCondition.getSortClassByDbColumn("be_system")%>"><%=domainInstance.getPropertyCnName("be_system") %></th> 
						<th onClick="sortBy(this)" db_col="be_open" class="<%=domainSearchCondition.getSortClassByDbColumn("be_open")%>"><%=domainInstance.getPropertyCnName("be_open") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							SystemMenuObj o = (SystemMenuObj) list.get(i); 
				%> 
				<tr> 
					<td>
						<a href="<%=contextPath %>/<%=basePath %>/Servlet?method=list4this&treeId=<%=o.getMenu_code() %>">
						<%=StringUtil.getNotEmptyStr(o.getMenu_code())%>
						</a>
					</td> 
					<td nowrap="nowrap">
						<%for(int n=0;n<StringUtil.getNotEmptyStr(o.getParent_code()).length();n++){out.print("&nbsp;&nbsp;");} %>
						<%if(!StringUtil.isEmpty(o.getMenu_icon())){ %>
						<img src="<%=contextPath+"/"+o.getMenu_icon() %>" width="12" height="12" style="vertial-align:middle" />&nbsp;
						<%} %>
						<%=StringUtil.getNotEmptyStr(o.getMenu_name())%>
					</td> 
					<td>
						<a href="<%=contextPath %>/<%=basePath %>/Servlet?method=list4this&treeId=<%=o.getParent_code() %>">
						<%=StringUtil.getNotEmptyStr(o.getParent_code())%>
						</a>
					</td> 
					<td>
						<a href="#" onclick="winOpen('<%=contextPath%><%=o.getMenu_url() %>')"> 
							<%=StringUtil.getNotEmptyStr(o.getMenu_url())%>
						</a>
					</td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("权限项字典",o.getMenu_auth_func_code()+"",true)%></td>  
					<td><%=DictionaryUtil.getCheckboxHtml("是否字典",o.getBe_stop()+"",true)%></td>  
					<td><%=DictionaryUtil.getCheckboxHtml("是否字典",o.getBe_system()+"",true)%></td>
					<td><%=DictionaryUtil.getCheckboxHtml("是否字典",o.getBe_open()+"",true)%></td>  
					<td width="100" style="text-align:center"> 
						<input type="button" class="button button_modify" title="修改" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
						&nbsp; 
						<input type="button" class="button button_delete" title="级联删除" onClick="javascript:if(confirm('将会级联删除该菜单及其所有子菜单，确定要删除吗?')){$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=delete4this&menu_code=<%=o.getMenu_code()%>');$('#pageForm').submit();} " /> 
						&nbsp; 
						<input type="button" class="button button_add_square" title="增加下级菜单" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&parent_code=<%=o.getMenu_code() %>')" /> 
					</td> 
				</tr> 
				<% 
					} 
				%> 
			</table> 
 
			<!-- 翻页操作栏 --> 
			<jsp:include page="../ToolBar/pagination_toolbar.jsp"> 
				<jsp:param name="basePath" value="<%=basePath%>"/> 
			</jsp:include> 
 
		</form>  
		
 		<!-- 刷新左侧树图 -->
		<script type="text/javascript">
		function freshCurrentPage()
		{
			$("#pageForm").submit();
			parent.treeFrame.eval("freshMe()");
		}
		
		<%if("true".equalsIgnoreCase(request.getAttribute("needRefresh")+"")){%>
			$(document).ready(freshCurrentPage());
		<%}%>
		</script>
	</body> 
</html> 
