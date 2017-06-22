<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VCurrentStockObj"%> 
<%@page import="com.bass.searchcondition.VCurrentStockSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.system.util.SystemConfigUtil"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	VCurrentStockObj domainInstance = (VCurrentStockObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	VCurrentStockSearchCondition domainSearchCondition = (VCurrentStockSearchCondition) request.getAttribute("domainSearchCondition"); 
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
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=list4this"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="orderBy" name="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
			 
			<!-- 工具栏 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td><%=domainInstance.getCnName() %></td>  
					<td></td> 
					<td> 
						<input name="searchButton" type="button" class="button button_set" value="条件" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
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
						<td>存货分类</td> 
						<td>
						<%=DictionaryUtil.getInputHtml("U8存货类别字典", "cinvccode", StringUtil.getNotEmptyStr(domainInstance.getCinvccode(), ""), StringUtil.getInSql("cinvccode",SystemConfigUtil.getValueListByName("cs_inventory_class")).replaceAll("\'","\\\\'"), 20,true)%> 
						</td> 
						<td>存货</td> 
						<td>
						<%=DictionaryUtil.getInputHtml("U8存货字典", "cinvcode_min", StringUtil.getNotEmptyStr(domainSearchCondition.getCinvcode_min(), ""), StringUtil.getInSql("cinvccode",SystemConfigUtil.getValueListByName("cs_inventory_class")).replaceAll("\'","\\\\'"), 15, false)%>
						-
						<%=DictionaryUtil.getInputHtml("U8存货字典", "cinvcode_max", StringUtil.getNotEmptyStr(domainSearchCondition.getCinvcode_max(), ""), StringUtil.getInSql("cinvccode",SystemConfigUtil.getValueListByName("cs_inventory_class")).replaceAll("\'","\\\\'"), 15, false)%>  
						</td> 
				</tr>
				<tr>
						<td>仓库</td> 
						<td>
						<%=DictionaryUtil.getInputHtml("U8仓库字典", "cwhcode", StringUtil.getNotEmptyStr(domainInstance.getCwhcode(), ""), StringUtil.getInSql("cwhcode",SystemConfigUtil.getValueListByName("cs_warehourse")).replaceAll("\'","\\\\'"), 20,true)%> 
						</td> 
						<td>显示零库存</td> 
						<td>
						<%=DictionaryUtil.getCheckboxHtml("show0inv",StringUtil.getNotEmptyStr(domainSearchCondition.getShow0inv(), "否"),false)%> 
						</td> 
				</tr> 
			</table> 
 
			<!-- 数据信息 -->  
			<table id="export_table" class="table table-bordered" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th>序号</th>
						<th><%=domainInstance.getPropertyCnName("cwhcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cwhname") %></th> 
						<th onClick="sortBy(this)" db_col="cinvcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvcode")%>"><%=domainInstance.getPropertyCnName("cinvcode") %></th> 
						<th onClick="sortBy(this)" db_col="cinvname" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvname")%>"><%=domainInstance.getPropertyCnName("cinvname") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvstd") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvccode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvcname") %></th> 
						<th><%=domainInstance.getPropertyCnName("cbatch") %></th> 
						<th><%=domainInstance.getPropertyCnName("expirationDate") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccomunitname") %></th> 
						<th><%=domainInstance.getPropertyCnName("iquantity") %></th> 
					</tr> 
				</thead> 
				<% 
					int n=1;
					String ccqdjk = "产成品待检库";
				
					for (int i = 0; i < list.size(); i++) 
						{ 
							VCurrentStockObj o = (VCurrentStockObj) list.get(i);
							
							boolean isSubTotal = o.getAutoid()==null;
				%> 
				<tr style="background:<%=isSubTotal?"#ffffcc":"" %>"> 
					<td style="text-align:right"><%=isSubTotal?"":(n++) %></td>
					<%if(isSubTotal){ %>
					<td></td> 
					<td></td>
					<td></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%>小计</td> 
					<td></td> 
					<td></td> 
					<td></td> 
					<td></td> 
					<td></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcomunitname())%></td> 
					<%} else { %>
					<td><%=StringUtil.getNotEmptyStr(o.getCwhcode())%></td> 
					<td style="color:<%=ccqdjk.equalsIgnoreCase(o.getCwhname())?"red":"" %>"><%=StringUtil.getNotEmptyStr(o.getCwhname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvstd())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvccode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbatch())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getExpirationDate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcomunitname())%></td> 
					<%} %>
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getIquantity(),2)%></td> 
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
		<script type="text/javascript">  
			// 全选绑定
			bindCheckAllBox("checkAllBox","<%=domainInstance.findKeyColumnName()%>");  
			
			$("#show0inv_checkbox").click(function(){toPage(1);});
		</script>  
 
	</body> 
</html> 
