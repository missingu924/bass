<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.StRepKctzSumObj"%> 
<%@page import="com.bass.searchcondition.StRepKctzSumSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	StRepKctzSumObj domainInstance = (StRepKctzSumObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	StRepKctzSumSearchCondition domainSearchCondition = (StRepKctzSumSearchCondition) request.getAttribute("domainSearchCondition"); 
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
						<input name="searchButton" type="button" class="button button_search" value="查询数据" onClick="toPage(1)"> 
						<input name="searchButton" type="button" class="button button_set" value="高级查询" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="winOpen('<%=contextPath%>/Proxy/Servlet?servlet=<%=basePath%>&method=preModify4this')"> 
						<input name="uploadButton" type="button" class="button button_upload" value="导入" onClick="openBigModalDialog('<%=contextPath%>/ExcelParser/uploadFile.jsp?basedbobj_class=<%=domainInstance.getClass().getCanonicalName()%>')">
						<%if(list.size()>0){ %> 
						<input name="deleteAllButton" type="button" class="button button_delete" value="批量删除" onClick="batchDelete('<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=batchDelete4this','<%=domainInstance.findKeyColumnName()%>')"> 
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
						<td><%=domainInstance.getPropertyCnName("cinvcode") %></td> 
						<td>
						<input name="cinvcode" type="text" id="cinvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cvmivencode") %></td> 
						<td>
						<input name="cvmivencode" type="text" id="cvmivencode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvmivencode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cvmivenname") %></td> 
						<td>
						<input name="cvmivenname" type="text" id="cvmivenname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvmivenname(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cinvname") %></td> 
						<td>
						<input name="cinvname" type="text" id="cinvname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinvaddcode") %></td> 
						<td>
						<input name="cinvaddcode" type="text" id="cinvaddcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvaddcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinvstd") %></td> 
						<td>
						<input name="cinvstd" type="text" id="cinvstd" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvstd(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cinvm_unit") %></td> 
						<td>
						<input name="cinvm_unit" type="text" id="cinvm_unit" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvm_unit(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinva_unit") %></td> 
						<td>
						<input name="cinva_unit" type="text" id="cinva_unit" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinva_unit(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinvccode") %></td> 
						<td>
						<input name="cinvccode" type="text" id="cinvccode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvccode(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cinvcname") %></td> 
						<td>
						<input name="cinvcname" type="text" id="cinvcname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("isafenum") %></td> 
						<td>
						<input name="isafenum_min" type="text" id="isafenum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIsafenum_min(),2)%>" size="9" >- 
						<input name="isafenum_max" type="text" id="isafenum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIsafenum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("itopsum") %></td> 
						<td>
						<input name="itopsum_min" type="text" id="itopsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getItopsum_min(),2)%>" size="9" >- 
						<input name="itopsum_max" type="text" id="itopsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getItopsum_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("ilowsum") %></td> 
						<td>
						<input name="ilowsum_min" type="text" id="ilowsum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIlowsum_min(),2)%>" size="9" >- 
						<input name="ilowsum_max" type="text" id="ilowsum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIlowsum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ibeginqtty") %></td> 
						<td>
						<input name="ibeginqtty_min" type="text" id="ibeginqtty_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIbeginqtty_min(),2)%>" size="9" >- 
						<input name="ibeginqtty_max" type="text" id="ibeginqtty_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIbeginqtty_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ibeginnum") %></td> 
						<td>
						<input name="ibeginnum_min" type="text" id="ibeginnum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIbeginnum_min(),2)%>" size="9" >- 
						<input name="ibeginnum_max" type="text" id="ibeginnum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIbeginnum_max(),2)%>" size="9" > 
						</td> 
				</tr> 
			</table> 
 
			<!-- 数据信息 -->  
			<table id="data_table" class="table table-bordered" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th>序号</th> 
						<th><input type="checkbox" name="checkAllBox" id="checkAllBox"></th> 
						<th onClick="sortBy(this)" db_col="cinvcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvcode")%>"><%=domainInstance.getPropertyCnName("cinvcode") %></th> 
						<th onClick="sortBy(this)" db_col="cvmivencode" class="<%=domainSearchCondition.getSortClassByDbColumn("cvmivencode")%>"><%=domainInstance.getPropertyCnName("cvmivencode") %></th> 
						<th onClick="sortBy(this)" db_col="cvmivenname" class="<%=domainSearchCondition.getSortClassByDbColumn("cvmivenname")%>"><%=domainInstance.getPropertyCnName("cvmivenname") %></th> 
						<th onClick="sortBy(this)" db_col="cinvname" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvname")%>"><%=domainInstance.getPropertyCnName("cinvname") %></th> 
						<th onClick="sortBy(this)" db_col="cinvaddcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvaddcode")%>"><%=domainInstance.getPropertyCnName("cinvaddcode") %></th> 
						<th onClick="sortBy(this)" db_col="cinvstd" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvstd")%>"><%=domainInstance.getPropertyCnName("cinvstd") %></th> 
						<th onClick="sortBy(this)" db_col="cinvm_unit" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvm_unit")%>"><%=domainInstance.getPropertyCnName("cinvm_unit") %></th> 
						<th onClick="sortBy(this)" db_col="cinva_unit" class="<%=domainSearchCondition.getSortClassByDbColumn("cinva_unit")%>"><%=domainInstance.getPropertyCnName("cinva_unit") %></th> 
						<th onClick="sortBy(this)" db_col="cinvccode" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvccode")%>"><%=domainInstance.getPropertyCnName("cinvccode") %></th> 
						<th onClick="sortBy(this)" db_col="cinvcname" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvcname")%>"><%=domainInstance.getPropertyCnName("cinvcname") %></th> 
						<th onClick="sortBy(this)" db_col="isafenum" class="<%=domainSearchCondition.getSortClassByDbColumn("isafenum")%>"><%=domainInstance.getPropertyCnName("isafenum") %></th> 
						<th onClick="sortBy(this)" db_col="itopsum" class="<%=domainSearchCondition.getSortClassByDbColumn("itopsum")%>"><%=domainInstance.getPropertyCnName("itopsum") %></th> 
						<th onClick="sortBy(this)" db_col="ilowsum" class="<%=domainSearchCondition.getSortClassByDbColumn("ilowsum")%>"><%=domainInstance.getPropertyCnName("ilowsum") %></th> 
						<th onClick="sortBy(this)" db_col="ibeginqtty" class="<%=domainSearchCondition.getSortClassByDbColumn("ibeginqtty")%>"><%=domainInstance.getPropertyCnName("ibeginqtty") %></th> 
						<th onClick="sortBy(this)" db_col="ibeginnum" class="<%=domainSearchCondition.getSortClassByDbColumn("ibeginnum")%>"><%=domainInstance.getPropertyCnName("ibeginnum") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							StRepKctzSumObj o = (StRepKctzSumObj) list.get(i); 
				%> 
				<tr> 
					<td style="width:16px;text-align:right"><%=i+1 %></td> 
					<td style="width:10px;text-align:center"><input type="checkbox" name="<%=o.findKeyColumnName() %>" id="<%=o.findKeyColumnName() %>" value="<%=o.findKeyValue() %>"></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCvmivencode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCvmivenname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvaddcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvstd())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvm_unit())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinva_unit())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvccode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcname())%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getIsafenum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getItopsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getIlowsum(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getIbeginqtty(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getIbeginnum(),2)%></td> 
					<td width="90" style="text-align:center"> 
						<input type="button" class="button button_detail" title="详情" onClick="winOpen('<%=contextPath%>/Proxy/Servlet?servlet=<%=basePath%>&method=detail4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
						&nbsp; 
						<input type="button" class="button button_modify" title="修改" onClick="winOpen('<%=contextPath%>/Proxy/Servlet?servlet=<%=basePath%>&method=preModify4this&<%=o.findKeyColumnName()%>=<%=o.findKeyValue()%>')" /> 
						&nbsp; 
						<input type="button" class="button button_delete" title="删除" onClick="javascript:if(confirm('确定要删除吗?')){$('#pageForm').attr('action','<%=contextPath%>/Proxy/Servlet?servlet=<%=basePath%>&method=delete4this&<%=o.findKeyColumnName()%>_4del=<%=o.findKeyValue()%>');$('#pageForm').submit();} " /> 
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
		<script type="text/javascript">  
			// 全选绑定
			bindCheckAllBox("checkAllBox","<%=domainInstance.findKeyColumnName()%>");  
		</script>  
 
	</body> 
</html> 
