<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.StRepKctzMxObj"%> 
<%@page import="com.bass.searchcondition.StRepKctzMxSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	StRepKctzMxObj domainInstance = (StRepKctzMxObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	StRepKctzMxSearchCondition domainSearchCondition = (StRepKctzMxSearchCondition) request.getAttribute("domainSearchCondition"); 
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
						<td><%=domainInstance.getPropertyCnName("cwhcode") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("U8仓库字典", "cwhcode", StringUtil.getNotEmptyStr(domainInstance.getCwhcode(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinvcode") %></td> 
						<td>
						<input name="cinvcode" type="text" id="cinvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ddate") %></td> 
						<td>
						<input name="ddate_min" type="text" id="ddate_min" value="<%=TimeUtil.date2str(domainSearchCondition.getDdate_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="ddate_max" type="text" id="ddate_max" value="<%=TimeUtil.date2str(domainSearchCondition.getDdate_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cbuscode") %></td> 
						<td>
						<input name="cbuscode" type="text" id="cbuscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbuscode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ccode") %></td> 
						<td>
						<input name="ccode" type="text" id="ccode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdepname") %></td> 
						<td>
						<input name="cdepname" type="text" id="cdepname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdepname(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cpersonname") %></td> 
						<td>
						<input name="cpersonname" type="text" id="cpersonname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersonname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("chandler") %></td> 
						<td>
						<input name="chandler" type="text" id="chandler" value="<%=StringUtil.getNotEmptyStr(domainInstance.getChandler(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cmaker") %></td> 
						<td>
						<input name="cmaker" type="text" id="cmaker" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmaker(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cbatch") %></td> 
						<td>
						<input name="cbatch" type="text" id="cbatch" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatch(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("dvdate") %></td> 
						<td>
						<input name="dvdate" type="text" id="dvdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDvdate(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("iexpiratdatecalcu") %></td> 
						<td>
						<input name="iexpiratdatecalcu" type="text" id="iexpiratdatecalcu" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIexpiratdatecalcu(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cexpirationdate") %></td> 
						<td>
						<input name="cexpirationdate" type="text" id="cexpirationdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCexpirationdate(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cciqbookcode") %></td> 
						<td>
						<input name="cciqbookcode" type="text" id="cciqbookcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCciqbookcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ichangrate") %></td> 
						<td>
						<input name="ichangrate_min" type="text" id="ichangrate_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIchangrate_min(),2)%>" size="9" >- 
						<input name="ichangrate_max" type="text" id="ichangrate_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIchangrate_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("igrouptype") %></td> 
						<td>
						<input name="igrouptype" type="text" id="igrouptype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIgrouptype(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("iqcnum") %></td> 
						<td>
						<input name="iqcnum_min" type="text" id="iqcnum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIqcnum_min(),2)%>" size="9" >- 
						<input name="iqcnum_max" type="text" id="iqcnum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIqcnum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("iqcqty") %></td> 
						<td>
						<input name="iqcqty_min" type="text" id="iqcqty_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIqcqty_min(),2)%>" size="9" >- 
						<input name="iqcqty_max" type="text" id="iqcqty_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIqcqty_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("iinnum") %></td> 
						<td>
						<input name="iinnum_min" type="text" id="iinnum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIinnum_min(),2)%>" size="9" >- 
						<input name="iinnum_max" type="text" id="iinnum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIinnum_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("iinqtty") %></td> 
						<td>
						<input name="iinqtty_min" type="text" id="iinqtty_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIinqtty_min(),2)%>" size="9" >- 
						<input name="iinqtty_max" type="text" id="iinqtty_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIinqtty_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ioutnum") %></td> 
						<td>
						<input name="ioutnum_min" type="text" id="ioutnum_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIoutnum_min(),2)%>" size="9" >- 
						<input name="ioutnum_max" type="text" id="ioutnum_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIoutnum_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("ioutqtty") %></td> 
						<td>
						<input name="ioutqtty_min" type="text" id="ioutqtty_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getIoutqtty_min(),2)%>" size="9" >- 
						<input name="ioutqtty_max" type="text" id="ioutqtty_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getIoutqtty_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ccusabbname") %></td> 
						<td>
						<input name="ccusabbname" type="text" id="ccusabbname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcusabbname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cvenabbname") %></td> 
						<td>
						<input name="cvenabbname" type="text" id="cvenabbname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvenabbname(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("crdname") %></td> 
						<td>
						<input name="crdname" type="text" id="crdname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCrdname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cwhname") %></td> 
						<td>
						<input name="cwhname" type="text" id="cwhname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCwhname(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cmemo") %></td> 
						<td>
						<input name="cmemo" type="text" id="cmemo" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmemo(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine1") %></td> 
						<td>
						<input name="cdefine1" type="text" id="cdefine1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine1(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine2") %></td> 
						<td>
						<input name="cdefine2" type="text" id="cdefine2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine2(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine3") %></td> 
						<td>
						<input name="cdefine3" type="text" id="cdefine3" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine3(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine4") %></td> 
						<td>
						<input name="cdefine4_min" type="text" id="cdefine4_min" value="<%=TimeUtil.date2str(domainSearchCondition.getCdefine4_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="cdefine4_max" type="text" id="cdefine4_max" value="<%=TimeUtil.date2str(domainSearchCondition.getCdefine4_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine5") %></td> 
						<td>
						<input name="cdefine5_min" type="text" id="cdefine5_min" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getCdefine5_min(),"")%>" size="9" >- 
						<input name="cdefine5_max" type="text" id="cdefine5_max" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getCdefine5_max(),"")%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine6") %></td> 
						<td>
						<input name="cdefine6_min" type="text" id="cdefine6_min" value="<%=TimeUtil.date2str(domainSearchCondition.getCdefine6_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="cdefine6_max" type="text" id="cdefine6_max" value="<%=TimeUtil.date2str(domainSearchCondition.getCdefine6_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine7") %></td> 
						<td>
						<input name="cdefine7_min" type="text" id="cdefine7_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCdefine7_min(),2)%>" size="9" >- 
						<input name="cdefine7_max" type="text" id="cdefine7_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCdefine7_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine8") %></td> 
						<td>
						<input name="cdefine8" type="text" id="cdefine8" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine8(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine9") %></td> 
						<td>
						<input name="cdefine9" type="text" id="cdefine9" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine9(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine10") %></td> 
						<td>
						<input name="cdefine10" type="text" id="cdefine10" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine10(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine11") %></td> 
						<td>
						<input name="cdefine11" type="text" id="cdefine11" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine11(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine12") %></td> 
						<td>
						<input name="cdefine12" type="text" id="cdefine12" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine12(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine13") %></td> 
						<td>
						<input name="cdefine13" type="text" id="cdefine13" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine13(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine14") %></td> 
						<td>
						<input name="cdefine14" type="text" id="cdefine14" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine14(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine15") %></td> 
						<td>
						<input name="cdefine15_min" type="text" id="cdefine15_min" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getCdefine15_min(),"")%>" size="9" >- 
						<input name="cdefine15_max" type="text" id="cdefine15_max" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getCdefine15_max(),"")%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine16") %></td> 
						<td>
						<input name="cdefine16_min" type="text" id="cdefine16_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCdefine16_min(),2)%>" size="9" >- 
						<input name="cdefine16_max" type="text" id="cdefine16_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCdefine16_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine22") %></td> 
						<td>
						<input name="cdefine22" type="text" id="cdefine22" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine22(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine23") %></td> 
						<td>
						<input name="cdefine23" type="text" id="cdefine23" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine23(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine24") %></td> 
						<td>
						<input name="cdefine24" type="text" id="cdefine24" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine24(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine25") %></td> 
						<td>
						<input name="cdefine25" type="text" id="cdefine25" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine25(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine26") %></td> 
						<td>
						<input name="cdefine26_min" type="text" id="cdefine26_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCdefine26_min(),2)%>" size="9" >- 
						<input name="cdefine26_max" type="text" id="cdefine26_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCdefine26_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine27") %></td> 
						<td>
						<input name="cdefine27_min" type="text" id="cdefine27_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCdefine27_min(),2)%>" size="9" >- 
						<input name="cdefine27_max" type="text" id="cdefine27_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCdefine27_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine28") %></td> 
						<td>
						<input name="cdefine28" type="text" id="cdefine28" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine28(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine29") %></td> 
						<td>
						<input name="cdefine29" type="text" id="cdefine29" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine29(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine30") %></td> 
						<td>
						<input name="cdefine30" type="text" id="cdefine30" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine30(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine31") %></td> 
						<td>
						<input name="cdefine31" type="text" id="cdefine31" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine31(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine32") %></td> 
						<td>
						<input name="cdefine32" type="text" id="cdefine32" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine32(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine33") %></td> 
						<td>
						<input name="cdefine33" type="text" id="cdefine33" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine33(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine34") %></td> 
						<td>
						<input name="cdefine34_min" type="text" id="cdefine34_min" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getCdefine34_min(),"")%>" size="9" >- 
						<input name="cdefine34_max" type="text" id="cdefine34_max" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getCdefine34_max(),"")%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine35") %></td> 
						<td>
						<input name="cdefine35_min" type="text" id="cdefine35_min" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getCdefine35_min(),"")%>" size="9" >- 
						<input name="cdefine35_max" type="text" id="cdefine35_max" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getCdefine35_max(),"")%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cdefine36") %></td> 
						<td>
						<input name="cdefine36_min" type="text" id="cdefine36_min" value="<%=TimeUtil.date2str(domainSearchCondition.getCdefine36_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="cdefine36_max" type="text" id="cdefine36_max" value="<%=TimeUtil.date2str(domainSearchCondition.getCdefine36_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdefine37") %></td> 
						<td>
						<input name="cdefine37_min" type="text" id="cdefine37_min" value="<%=TimeUtil.date2str(domainSearchCondition.getCdefine37_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="cdefine37_max" type="text" id="cdefine37_max" value="<%=TimeUtil.date2str(domainSearchCondition.getCdefine37_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty1") %></td> 
						<td>
						<input name="cbatchproperty1_min" type="text" id="cbatchproperty1_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty1_min(),2)%>" size="9" >- 
						<input name="cbatchproperty1_max" type="text" id="cbatchproperty1_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty1_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty2") %></td> 
						<td>
						<input name="cbatchproperty2_min" type="text" id="cbatchproperty2_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty2_min(),2)%>" size="9" >- 
						<input name="cbatchproperty2_max" type="text" id="cbatchproperty2_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty2_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty3") %></td> 
						<td>
						<input name="cbatchproperty3_min" type="text" id="cbatchproperty3_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty3_min(),2)%>" size="9" >- 
						<input name="cbatchproperty3_max" type="text" id="cbatchproperty3_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty3_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty4") %></td> 
						<td>
						<input name="cbatchproperty4_min" type="text" id="cbatchproperty4_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty4_min(),2)%>" size="9" >- 
						<input name="cbatchproperty4_max" type="text" id="cbatchproperty4_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty4_max(),2)%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty5") %></td> 
						<td>
						<input name="cbatchproperty5_min" type="text" id="cbatchproperty5_min" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty5_min(),2)%>" size="9" >- 
						<input name="cbatchproperty5_max" type="text" id="cbatchproperty5_max" value="<%=StringUtil.formatDouble(domainSearchCondition.getCbatchproperty5_max(),2)%>" size="9" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty6") %></td> 
						<td>
						<input name="cbatchproperty6" type="text" id="cbatchproperty6" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty6(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty7") %></td> 
						<td>
						<input name="cbatchproperty7" type="text" id="cbatchproperty7" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty7(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty8") %></td> 
						<td>
						<input name="cbatchproperty8" type="text" id="cbatchproperty8" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty8(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty9") %></td> 
						<td>
						<input name="cbatchproperty9" type="text" id="cbatchproperty9" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty9(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cbatchproperty10") %></td> 
						<td>
						<input name="cbatchproperty10_min" type="text" id="cbatchproperty10_min" value="<%=TimeUtil.date2str(domainSearchCondition.getCbatchproperty10_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="cbatchproperty10_max" type="text" id="cbatchproperty10_max" value="<%=TimeUtil.date2str(domainSearchCondition.getCbatchproperty10_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cfree1") %></td> 
						<td>
						<input name="cfree1" type="text" id="cfree1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree1(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cfree2") %></td> 
						<td>
						<input name="cfree2" type="text" id="cfree2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree2(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cfree3") %></td> 
						<td>
						<input name="cfree3" type="text" id="cfree3" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree3(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cfree4") %></td> 
						<td>
						<input name="cfree4" type="text" id="cfree4" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree4(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cfree5") %></td> 
						<td>
						<input name="cfree5" type="text" id="cfree5" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree5(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cfree6") %></td> 
						<td>
						<input name="cfree6" type="text" id="cfree6" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree6(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cfree7") %></td> 
						<td>
						<input name="cfree7" type="text" id="cfree7" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree7(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cfree8") %></td> 
						<td>
						<input name="cfree8" type="text" id="cfree8" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree8(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cfree9") %></td> 
						<td>
						<input name="cfree9" type="text" id="cfree9" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree9(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cfree10") %></td> 
						<td>
						<input name="cfree10" type="text" id="cfree10" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree10(),"")%>" size="20" > 
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
						<td><%=domainInstance.getPropertyCnName("dcheckdate") %></td> 
						<td>
						<input name="dcheckdate_min" type="text" id="dcheckdate_min" value="<%=TimeUtil.date2str(domainSearchCondition.getDcheckdate_min(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">- 
						<input name="dcheckdate_max" type="text" id="dcheckdate_max" value="<%=TimeUtil.date2str(domainSearchCondition.getDcheckdate_max(),"yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ccheckcode") %></td> 
						<td>
						<input name="ccheckcode" type="text" id="ccheckcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcheckcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ccheckpersonname") %></td> 
						<td>
						<input name="ccheckpersonname" type="text" id="ccheckpersonname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcheckpersonname(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("crejectcode") %></td> 
						<td>
						<input name="crejectcode" type="text" id="crejectcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCrejectcode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("dvalidatedate") %></td> 
						<td>
						<input name="dvalidatedate" type="text" id="dvalidatedate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDvalidatedate(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cbmemo") %></td> 
						<td>
						<input name="cbmemo" type="text" id="cbmemo" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbmemo(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("isotype") %></td> 
						<td>
						<input name="isotype" type="text" id="isotype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIsotype(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("csocode") %></td> 
						<td>
						<input name="csocode" type="text" id="csocode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsocode(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("isoseq") %></td> 
						<td>
						<input name="isoseq_min" type="text" id="isoseq_min" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getIsoseq_min(),"")%>" size="9" >- 
						<input name="isoseq_max" type="text" id="isoseq_max" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getIsoseq_max(),"")%>" size="9" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("isodid") %></td> 
						<td>
						<input name="isodid" type="text" id="isodid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIsodid(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cdemandmemo") %></td> 
						<td>
						<input name="cdemandmemo" type="text" id="cdemandmemo" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdemandmemo(),"")%>" size="20" > 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cmolotcode") %></td> 
						<td>
						<input name="cmolotcode" type="text" id="cmolotcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmolotcode(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cshipaddress") %></td> 
						<td>
						<input name="cshipaddress" type="text" id="cshipaddress" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCshipaddress(),"")%>" size="20" > 
						</td> 
					<td></td><td></td> 
					<td></td><td></td> 
				</tr> 
			</table> 
 
			<!-- 数据信息 -->  
			<table id="data_table" class="table table-bordered" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th>序号</th> 
						<th><input type="checkbox" name="checkAllBox" id="checkAllBox"></th> 
						<th onClick="sortBy(this)" db_col="cvouchname" class="<%=domainSearchCondition.getSortClassByDbColumn("cvouchname")%>"><%=domainInstance.getPropertyCnName("cvouchname") %></th> 
						<th onClick="sortBy(this)" db_col="cwhcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cwhcode")%>"><%=domainInstance.getPropertyCnName("cwhcode") %></th> 
						<th onClick="sortBy(this)" db_col="cinvcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvcode")%>"><%=domainInstance.getPropertyCnName("cinvcode") %></th> 
						<th onClick="sortBy(this)" db_col="ddate" class="<%=domainSearchCondition.getSortClassByDbColumn("ddate")%>"><%=domainInstance.getPropertyCnName("ddate") %></th> 
						<th onClick="sortBy(this)" db_col="dveridate" class="<%=domainSearchCondition.getSortClassByDbColumn("dveridate")%>"><%=domainInstance.getPropertyCnName("dveridate") %></th> 
						<th onClick="sortBy(this)" db_col="cbustype" class="<%=domainSearchCondition.getSortClassByDbColumn("cbustype")%>"><%=domainInstance.getPropertyCnName("cbustype") %></th> 
						<th onClick="sortBy(this)" db_col="cbatch" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatch")%>"><%=domainInstance.getPropertyCnName("cbatch") %></th> 
						<th onClick="sortBy(this)" db_col="iqcqty" class="<%=domainSearchCondition.getSortClassByDbColumn("iqcqty")%>"><%=domainInstance.getPropertyCnName("iqcqty") %></th> 
						<th onClick="sortBy(this)" db_col="iinqtty" class="<%=domainSearchCondition.getSortClassByDbColumn("iinqtty")%>"><%=domainInstance.getPropertyCnName("iinqtty") %></th> 
						<th onClick="sortBy(this)" db_col="ioutqtty" class="<%=domainSearchCondition.getSortClassByDbColumn("ioutqtty")%>"><%=domainInstance.getPropertyCnName("ioutqtty") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine1" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine1")%>"><%=domainInstance.getPropertyCnName("cdefine1") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine2" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine2")%>"><%=domainInstance.getPropertyCnName("cdefine2") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine3" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine3")%>"><%=domainInstance.getPropertyCnName("cdefine3") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine4" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine4")%>"><%=domainInstance.getPropertyCnName("cdefine4") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine5" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine5")%>"><%=domainInstance.getPropertyCnName("cdefine5") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine6" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine6")%>"><%=domainInstance.getPropertyCnName("cdefine6") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine7" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine7")%>"><%=domainInstance.getPropertyCnName("cdefine7") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine8" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine8")%>"><%=domainInstance.getPropertyCnName("cdefine8") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine9" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine9")%>"><%=domainInstance.getPropertyCnName("cdefine9") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine10" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine10")%>"><%=domainInstance.getPropertyCnName("cdefine10") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine11" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine11")%>"><%=domainInstance.getPropertyCnName("cdefine11") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine12" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine12")%>"><%=domainInstance.getPropertyCnName("cdefine12") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine13" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine13")%>"><%=domainInstance.getPropertyCnName("cdefine13") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine14" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine14")%>"><%=domainInstance.getPropertyCnName("cdefine14") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine15" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine15")%>"><%=domainInstance.getPropertyCnName("cdefine15") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine16" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine16")%>"><%=domainInstance.getPropertyCnName("cdefine16") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine22" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine22")%>"><%=domainInstance.getPropertyCnName("cdefine22") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine23" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine23")%>"><%=domainInstance.getPropertyCnName("cdefine23") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine24" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine24")%>"><%=domainInstance.getPropertyCnName("cdefine24") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine25" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine25")%>"><%=domainInstance.getPropertyCnName("cdefine25") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine26" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine26")%>"><%=domainInstance.getPropertyCnName("cdefine26") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine27" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine27")%>"><%=domainInstance.getPropertyCnName("cdefine27") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine28" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine28")%>"><%=domainInstance.getPropertyCnName("cdefine28") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine29" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine29")%>"><%=domainInstance.getPropertyCnName("cdefine29") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine30" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine30")%>"><%=domainInstance.getPropertyCnName("cdefine30") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine31" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine31")%>"><%=domainInstance.getPropertyCnName("cdefine31") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine32" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine32")%>"><%=domainInstance.getPropertyCnName("cdefine32") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine33" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine33")%>"><%=domainInstance.getPropertyCnName("cdefine33") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine34" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine34")%>"><%=domainInstance.getPropertyCnName("cdefine34") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine35" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine35")%>"><%=domainInstance.getPropertyCnName("cdefine35") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine36" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine36")%>"><%=domainInstance.getPropertyCnName("cdefine36") %></th> 
						<th onClick="sortBy(this)" db_col="cdefine37" class="<%=domainSearchCondition.getSortClassByDbColumn("cdefine37")%>"><%=domainInstance.getPropertyCnName("cdefine37") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty1" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty1")%>"><%=domainInstance.getPropertyCnName("cbatchproperty1") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty2" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty2")%>"><%=domainInstance.getPropertyCnName("cbatchproperty2") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty3" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty3")%>"><%=domainInstance.getPropertyCnName("cbatchproperty3") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty4" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty4")%>"><%=domainInstance.getPropertyCnName("cbatchproperty4") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty5" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty5")%>"><%=domainInstance.getPropertyCnName("cbatchproperty5") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty6" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty6")%>"><%=domainInstance.getPropertyCnName("cbatchproperty6") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty7" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty7")%>"><%=domainInstance.getPropertyCnName("cbatchproperty7") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty8" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty8")%>"><%=domainInstance.getPropertyCnName("cbatchproperty8") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty9" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty9")%>"><%=domainInstance.getPropertyCnName("cbatchproperty9") %></th> 
						<th onClick="sortBy(this)" db_col="cbatchproperty10" class="<%=domainSearchCondition.getSortClassByDbColumn("cbatchproperty10")%>"><%=domainInstance.getPropertyCnName("cbatchproperty10") %></th> 
						<th onClick="sortBy(this)" db_col="cfree1" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree1")%>"><%=domainInstance.getPropertyCnName("cfree1") %></th> 
						<th onClick="sortBy(this)" db_col="cfree2" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree2")%>"><%=domainInstance.getPropertyCnName("cfree2") %></th> 
						<th onClick="sortBy(this)" db_col="cfree3" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree3")%>"><%=domainInstance.getPropertyCnName("cfree3") %></th> 
						<th onClick="sortBy(this)" db_col="cfree4" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree4")%>"><%=domainInstance.getPropertyCnName("cfree4") %></th> 
						<th onClick="sortBy(this)" db_col="cfree5" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree5")%>"><%=domainInstance.getPropertyCnName("cfree5") %></th> 
						<th onClick="sortBy(this)" db_col="cfree6" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree6")%>"><%=domainInstance.getPropertyCnName("cfree6") %></th> 
						<th onClick="sortBy(this)" db_col="cfree7" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree7")%>"><%=domainInstance.getPropertyCnName("cfree7") %></th> 
						<th onClick="sortBy(this)" db_col="cfree8" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree8")%>"><%=domainInstance.getPropertyCnName("cfree8") %></th> 
						<th onClick="sortBy(this)" db_col="cfree9" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree9")%>"><%=domainInstance.getPropertyCnName("cfree9") %></th> 
						<th onClick="sortBy(this)" db_col="cfree10" class="<%=domainSearchCondition.getSortClassByDbColumn("cfree10")%>"><%=domainInstance.getPropertyCnName("cfree10") %></th> 
						<th onClick="sortBy(this)" db_col="cvmivencode" class="<%=domainSearchCondition.getSortClassByDbColumn("cvmivencode")%>"><%=domainInstance.getPropertyCnName("cvmivencode") %></th> 
						<th onClick="sortBy(this)" db_col="cvmivenname" class="<%=domainSearchCondition.getSortClassByDbColumn("cvmivenname")%>"><%=domainInstance.getPropertyCnName("cvmivenname") %></th> 
						<th onClick="sortBy(this)" db_col="dcheckdate" class="<%=domainSearchCondition.getSortClassByDbColumn("dcheckdate")%>"><%=domainInstance.getPropertyCnName("dcheckdate") %></th> 
						<th onClick="sortBy(this)" db_col="ccheckcode" class="<%=domainSearchCondition.getSortClassByDbColumn("ccheckcode")%>"><%=domainInstance.getPropertyCnName("ccheckcode") %></th> 
						<th onClick="sortBy(this)" db_col="ccheckpersonname" class="<%=domainSearchCondition.getSortClassByDbColumn("ccheckpersonname")%>"><%=domainInstance.getPropertyCnName("ccheckpersonname") %></th> 
						<th onClick="sortBy(this)" db_col="crejectcode" class="<%=domainSearchCondition.getSortClassByDbColumn("crejectcode")%>"><%=domainInstance.getPropertyCnName("crejectcode") %></th> 
						<th onClick="sortBy(this)" db_col="dvalidatedate" class="<%=domainSearchCondition.getSortClassByDbColumn("dvalidatedate")%>"><%=domainInstance.getPropertyCnName("dvalidatedate") %></th> 
						<th onClick="sortBy(this)" db_col="cbmemo" class="<%=domainSearchCondition.getSortClassByDbColumn("cbmemo")%>"><%=domainInstance.getPropertyCnName("cbmemo") %></th> 
						<th onClick="sortBy(this)" db_col="isotype" class="<%=domainSearchCondition.getSortClassByDbColumn("isotype")%>"><%=domainInstance.getPropertyCnName("isotype") %></th> 
						<th onClick="sortBy(this)" db_col="csocode" class="<%=domainSearchCondition.getSortClassByDbColumn("csocode")%>"><%=domainInstance.getPropertyCnName("csocode") %></th> 
						<th onClick="sortBy(this)" db_col="isoseq" class="<%=domainSearchCondition.getSortClassByDbColumn("isoseq")%>"><%=domainInstance.getPropertyCnName("isoseq") %></th> 
						<th onClick="sortBy(this)" db_col="isodid" class="<%=domainSearchCondition.getSortClassByDbColumn("isodid")%>"><%=domainInstance.getPropertyCnName("isodid") %></th> 
						<th onClick="sortBy(this)" db_col="cdemandmemo" class="<%=domainSearchCondition.getSortClassByDbColumn("cdemandmemo")%>"><%=domainInstance.getPropertyCnName("cdemandmemo") %></th> 
						<th onClick="sortBy(this)" db_col="cmolotcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cmolotcode")%>"><%=domainInstance.getPropertyCnName("cmolotcode") %></th> 
						<th onClick="sortBy(this)" db_col="cshipaddress" class="<%=domainSearchCondition.getSortClassByDbColumn("cshipaddress")%>"><%=domainInstance.getPropertyCnName("cshipaddress") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							StRepKctzMxObj o = (StRepKctzMxObj) list.get(i); 
				%> 
				<tr> 
					<td style="width:16px;text-align:right"><%=i+1 %></td> 
					<td style="width:10px;text-align:center"><input type="checkbox" name="<%=o.findKeyColumnName() %>" id="<%=o.findKeyColumnName() %>" value="<%=o.findKeyValue() %>"></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCvouchname())%></td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("U8仓库字典",o.getCwhcode()+"",true)%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td> 
					<td><%=TimeUtil.date2str(o.getDdate(),"yyyy-MM-dd")%></td> 
					<td><%=TimeUtil.date2str(o.getDveridate(),"yyyy-MM-dd")%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbustype())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbatch())%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getIqcqty(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getIinqtty(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getIoutqtty(),2)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine1())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine2())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine3())%></td> 
					<td><%=TimeUtil.date2str(o.getCdefine4(),"yyyy-MM-dd")%></td> 
					<td style="text-align:right"><%=StringUtil.getNotEmptyStr(o.getCdefine5())%></td> 
					<td><%=TimeUtil.date2str(o.getCdefine6(),"yyyy-MM-dd")%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCdefine7(),2)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine8())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine9())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine10())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine11())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine12())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine13())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine14())%></td> 
					<td style="text-align:right"><%=StringUtil.getNotEmptyStr(o.getCdefine15())%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCdefine16(),2)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine22())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine23())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine24())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine25())%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCdefine26(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCdefine27(),2)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine28())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine29())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine30())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine31())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine32())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefine33())%></td> 
					<td style="text-align:right"><%=StringUtil.getNotEmptyStr(o.getCdefine34())%></td> 
					<td style="text-align:right"><%=StringUtil.getNotEmptyStr(o.getCdefine35())%></td> 
					<td><%=TimeUtil.date2str(o.getCdefine36(),"yyyy-MM-dd")%></td> 
					<td><%=TimeUtil.date2str(o.getCdefine37(),"yyyy-MM-dd")%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCbatchproperty1(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCbatchproperty2(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCbatchproperty3(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCbatchproperty4(),2)%></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(o.getCbatchproperty5(),2)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbatchproperty6())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbatchproperty7())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbatchproperty8())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbatchproperty9())%></td> 
					<td><%=TimeUtil.date2str(o.getCbatchproperty10(),"yyyy-MM-dd")%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree1())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree2())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree3())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree4())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree5())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree6())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree7())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree8())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree9())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfree10())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCvmivencode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCvmivenname())%></td> 
					<td><%=TimeUtil.date2str(o.getDcheckdate(),"yyyy-MM-dd")%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcheckcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcheckpersonname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCrejectcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDvalidatedate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbmemo())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getIsotype())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCsocode())%></td> 
					<td style="text-align:right"><%=StringUtil.getNotEmptyStr(o.getIsoseq())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getIsodid())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdemandmemo())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCmolotcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCshipaddress())%></td> 
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
