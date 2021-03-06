<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.common.obj.PaginationObj"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="com.u8.searchcondition.Rdrecord01SearchCondition"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.u8.obj.Rdrecord01Obj"%>
<!-- 基本信息 -->
<%
	// 当前上下文路径 
	String contextPath = request.getContextPath();

	// 该功能对象实例 
	Rdrecord01Obj domainInstance = (Rdrecord01Obj) request.getAttribute("domainInstance");
	// 该功能对象查询条件实例 
	Rdrecord01SearchCondition domainSearchCondition = (Rdrecord01SearchCondition) request.getAttribute("domainSearchCondition");
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
		<title><%=domainInstance.getCnName()%>列表</title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/jquery.freezeheader.js"></script>
		<script src="../layer/layer.js"></script>
		<script type="text/javascript">$(document).ready(function () {$("#data_table").freezeHeader();})</script>
	</head>
	<body>
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=list4this">

			<!-- 查询条件 -->
			<table class="search_table" align="center" width="98%">
				<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>">
				<input id="out_ds_code" name="out_ds_code" type="hidden" value="<%=domainSearchCondition.getOut_ds_code() %>">
				<tr>
					<td>采购入库单导入</td>
					<td></td>
					<td><%=domainInstance.getPropertyCnName("ddate")%></td>
					<td>
						<input name="ddate_min" type="text" id="ddate_min" value="<%=TimeUtil.date2str(domainSearchCondition.getDdate_min(), "yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">
						-
						<input name="ddate_max" type="text" id="ddate_max" value="<%=TimeUtil.date2str(domainSearchCondition.getDdate_max(), "yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">
						
						&nbsp;&nbsp;&nbsp;&nbsp;
						<%=domainInstance.getPropertyCnName("alreadysaved")%>
						<%=DictionaryUtil.getSelectHtml("是否字典", "alreadysaved", StringUtil.getNotEmptyStr(domainInstance.getAlreadysaved(), ""))%>
					</td>
					<td>
						
						<input name="searchButton" type="button" class="button button_search" value="数据预览" onClick="toPage(1)">
						<%
							if (list.size() > 0)
							{
						%>
						<input name="uploadButton" type="button" class="button button_upload" value="数据导入" onClick="dataImport2U8()">
						<%
							}
						%>
						
						<!-- 
						<input name="searchButton" type="button" class="button button_set" value="高级查询" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
						 -->
						&nbsp;&nbsp;
						<input name="helpButton" type="button" class="button button_comment" title="提示" onClick="$('#help_info_table').toggle();$('#showHelpInfoTable').val(!$('#help_info_table').is(':hidden'));">
						
					</td>
				</tr>
			</table>
			<table id="help_info_table" class="help_info_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowHelpInfoTable() ? "" : "none"%>'>
				<input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>">
				<tr>
					<td>
						<b>【提示】</b>
						<ul>
							<li>
								数据预览：查询预览HIS系统的数据
							</li>
							<br>
							<li>
								数据导入：
								<br>
								(1)将HIS系统数据导入用友系统，如果之前已经导入用友系统则不会重复导入
								<br>
								(2)数据是否已经导入用友系统通过'收发单据号'判断
								<br>
								(3)导入数据之前会将需要对照的编码进行对照，没有对照的会给出提示
							</li>
							<li>
								基础档案同步：
								<br>
								(1)将HIS系统中的"供应商、存货分类、存货、计量单位"基础档案导入用友系统，如果之前已经导入用友系统则不会重复导入
								<br>
								(2)自动建立对照关系
							</li>
						</ul>
					</td>
				</tr>
			</table>

			<table id="data_table" class="table table-bordered table-striped" align="center" width="98%">
				<thead>
					<input type="hidden" name="orderBy" id="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>">
					<tr>
						<th>
							<input type="checkbox" name="checkAllBox" id="checkAllBox" <%=list.size() > 0 ? "checked" : ""%>>
						</th>
						<th onClick="sortBy(this)" db_col="<%=domainInstance.findKeyColumnName() %>" class="<%=domainSearchCondition.getSortClassByDbColumn(domainInstance.findKeyColumnName())%>"><%=domainInstance.getPropertyCnName(domainInstance.findKeyColumnName())%></th>
						<th onClick="sortBy(this)" db_col="ddate" class="<%=domainSearchCondition.getSortClassByDbColumn("ddate")%>"><%=domainInstance.getPropertyCnName("ddate")%></th>
						<th onClick="sortBy(this)" db_col="ccode" class="<%=domainSearchCondition.getSortClassByDbColumn("ccode")%>"><%=domainInstance.getPropertyCnName("ccode")%></th>
						<th onClick="sortBy(this)" db_col="cwhcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cwhcode")%>"><%=domainInstance.getPropertyCnName("cwhcode")%></th>
						<th onClick="sortBy(this)" db_col="cdepcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cdepcode")%>"><%=domainInstance.getPropertyCnName("cdepcode")%></th>
						<th onClick="sortBy(this)" db_col="cvencode" class="<%=domainSearchCondition.getSortClassByDbColumn("cvencode")%>"><%=domainInstance.getPropertyCnName("cvencode")%></th>
						<th><%=domainInstance.getPropertyCnName("alreadysaved")%></th>
					</tr>
				</thead>
				<%
					for (int i = 0; i < list.size(); i++)
					{
						Rdrecord01Obj o = (Rdrecord01Obj) list.get(i);
				%>
				<tr>
					<td style="text-align: center">
						<%
							if ("否".equalsIgnoreCase(o.getAlreadysaved()))
								{
						%>
						<input type="checkbox" name="<%=domainInstance.findKeyColumnName() %>" id="<%=domainInstance.findKeyColumnName() %>" value="<%=o.findKeyValue()%>" checked>
						<%
							}
						%>
					</td>
					<td><%=StringUtil.getNotEmptyStr(o.findKeyValue())%></td>
					<td><%=TimeUtil.date2str(o.getDdate(), "yyyy-MM-dd")%></td>
					<td><%=StringUtil.getNotEmptyStr(o.getCcode())%></td>
					<td><%=StringUtil.getNotEmptyStr(o.getCwhcode())%></td>
					<td><%=StringUtil.getNotEmptyStr(o.getCdepcode())%></td>
					<td><%=StringUtil.getNotEmptyStr(o.getCvencode())%></td>
					<td><%=StringUtil.getNotEmptyStr(o.getAlreadysaved())%></td>
				</tr>
				<%
					}
				%>
			</table>
			<%if(list.size()==0){ %>
			<div align="center"><font color="#ff6600">没有查询到数据，请重新设置条件后再查询。</font></div>
			<%} %>

			<!-- 翻页操作栏 -->
			<jsp:include page="../ToolBar/pagination_toolbar.jsp">
				<jsp:param name="basePath" value="<%=basePath%>" />
			</jsp:include>
			
			

		</form>

		<script type="text/javascript">
		$("#checkAllBox").click(function(){
			if($(this).prop("checked")==true)
			{
				$("[name='<%=domainInstance.findKeyColumnName() %>']").prop("checked",true);//全选
			}
			else
			{
				$("[name='<%=domainInstance.findKeyColumnName() %>']").prop("checked",false);//取消全选
			}
		});
		
		function dataImport2U8()
		{
			var selectedSomeOne = false;
			$("[name='<%=domainInstance.findKeyColumnName() %>']").each(function(){
					if(selectedSomeOne == false){
						if($(this).prop("checked")==true){
							selectedSomeOne = true;
						}
					}
				}
			);
			
			if(selectedSomeOne == true){	
				ajaxPost('<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=dataImport2U8');
			}else{
				alert("没有选择需要导入的数据");
			}

		}
		
		function sync4this()
		{
				$.ajax({   
					type:"post",     
					url:'<%=contextPath%>/<%=basePath%>/Servlet?method=sync4this',   
					data:$('#pageForm').serialize(),
					beforeSend:function(){
						layerIndex=layer.load(
							2,
							{
								shade: [0.1,'#000'],
								offset:'50px'
							}
						);},
					success:function(html){     
						 alert("基础档案同步成功！");
						 layer.close(layerIndex);
					 },   
					error:function(){   
						 alert("出现了点小问题");   
						 layer.close(layerIndex);
					 }   
				}); 
		}
		</script>

	</body>
</html>
