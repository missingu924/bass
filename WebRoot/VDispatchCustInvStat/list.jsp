<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.VDispatchCustInvStatObj"%> 
<%@page import="com.bass.searchcondition.VDispatchCustInvStatSearchCondition"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.echarts.EchartsUtil"%>  
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	VDispatchCustInvStatObj domainInstance = (VDispatchCustInvStatObj) request.getAttribute("domainInstance"); 
	// 该功能对象查询条件实例 
	VDispatchCustInvStatSearchCondition domainSearchCondition = (VDispatchCustInvStatSearchCondition) request.getAttribute("domainSearchCondition"); 
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
	
	// 合计
	double iCountTotal=0,iQuantityTotal=0,iSumTotal=0;
	for (int i = 0; i < list.size(); i++) 
	{ 
		VDispatchCustInvStatObj o = (VDispatchCustInvStatObj) list.get(i);
		iCountTotal+=o.getIcount();
		iQuantityTotal+=o.getIquantity();
		iSumTotal+=o.getIsum();
	}
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" /> 
		<title><%=domainInstance.getCnName(domainSearchCondition.getGroupBy()) %>列表</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
		<script type="text/javascript" src="../js/jquery.freezeheader.js"></script> 
		<script type="text/javascript">$(document).ready(function () {$("#export_table").freezeHeader();})</script> 
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=list4this"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="orderBy" name="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>"> 
			<input type="hidden" id="groupBy" name="groupBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getGroupBy(), "")%>"> 
			<input type="hidden" id="showChart" name="showChart" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.isShowChart(), "")%>"> 
			 
			<!-- 工具栏 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td><%=domainInstance.getCnName(domainSearchCondition.getGroupBy()) %></td>  
					<td>
						日期
						<input name="ddate_min" type="text" id="ddate_min" value="<%=TimeUtil.date2str(domainSearchCondition.getDdate_min(), "yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">
						-
						<input name="ddate_max" type="text" id="ddate_max" value="<%=TimeUtil.date2str(domainSearchCondition.getDdate_max(), "yyyy-MM-dd")%>" size="9" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">
					</td> 
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
							<li><%=domainInstance.getCnName(domainSearchCondition.getGroupBy()) %></li> 
						</ul> 
					</td> 
				</tr> 
			</table> 
			<!-- 查询条件 -->  
			<table id="search_condition_table" class="search_condition_table" align="center" width="98%" style='display: <%=domainSearchCondition.isShowSearchConditionTable() ? "" : "none"%>'> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("ccuscode") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("U8客户字典", "ccuscode", StringUtil.getNotEmptyStr(domainInstance.getCcuscode(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("ccusname") %></td> 
						<td>
						<input name="ccusname" type="text" id="ccusname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcusname(),"")%>" size="20" > 
						</td> 
				</tr> 
				<tr> 
						<td><%=domainInstance.getPropertyCnName("cinvcode") %></td> 
						<td>
						<%=DictionaryUtil.getInputHtml("U8存货字典", "cinvcode", StringUtil.getNotEmptyStr(domainInstance.getCinvcode(), ""),20)%> 
						</td> 
						<td><%=domainInstance.getPropertyCnName("cinvname") %></td> 
						<td>
						<input name="cinvname" type="text" id="cinvname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvname(),"")%>" size="20" > 
						</td> 
				</tr> 
			</table> 
			
			<!-- 统计图表 -->  
			<%if(true==domainSearchCondition.isShowChart())
				{
					if(domainInstance.getCcuscode()!=null)
					{
						out.print(EchartsUtil.createEchartByDatalist("",list,"cinvname","isum",EchartsUtil.PIE,EchartsUtil.THEME_MACARONS,null,0,400));
					}
					else if(domainInstance.getCinvcode()!=null)
					{
						out.print(EchartsUtil.createEchartByDatalist("",list,"ccusname","isum",EchartsUtil.PIE,EchartsUtil.THEME_MACARONS,null,0,400));
					}
				}
			%>
			
			<!-- 数据信息 -->  
			<table id="export_table" class="table table-bordered" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th>序号</th> 
						<%if(domainSearchCondition.GROUP_BY_CUST.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
						<th onClick="sortBy(this)" db_col="ccuscode" class="<%=domainSearchCondition.getSortClassByDbColumn("ccuscode")%>"><%=domainInstance.getPropertyCnName("ccuscode") %></th> 
						<th onClick="sortBy(this)" db_col="ccusname" class="<%=domainSearchCondition.getSortClassByDbColumn("ccusname")%>"><%=domainInstance.getPropertyCnName("ccusname") %></th> 
						<%} if(domainSearchCondition.GROUP_BY_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
						<th onClick="sortBy(this)" db_col="cinvcode" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvcode")%>"><%=domainInstance.getPropertyCnName("cinvcode") %></th> 
						<th onClick="sortBy(this)" db_col="cinvname" class="<%=domainSearchCondition.getSortClassByDbColumn("cinvname")%>"><%=domainInstance.getPropertyCnName("cinvname") %></th> 
						<th onClick="sortBy(this)" db_col="ccomunitname" class="<%=domainSearchCondition.getSortClassByDbColumn("ccomunitname")%>"><%=domainInstance.getPropertyCnName("ccomunitname") %></th> 
						<%} %>
						<th onClick="sortBy(this)" db_col="icount" class="<%=domainSearchCondition.getSortClassByDbColumn("icount")%>"><%=domainInstance.getPropertyCnName("icount") %></th> 
						<th onClick="sortBy(this)" db_col="icount" class="<%=domainSearchCondition.getSortClassByDbColumn("icount")%>">占比</th> 
						<th onClick="sortBy(this)" db_col="iquantity" class="<%=domainSearchCondition.getSortClassByDbColumn("iquantity")%>"><%=domainInstance.getPropertyCnName("iquantity") %></th> 
						<th onClick="sortBy(this)" db_col="iquantity" class="<%=domainSearchCondition.getSortClassByDbColumn("iquantity")%>">占比</th> 
						<th onClick="sortBy(this)" db_col="isum" class="<%=domainSearchCondition.getSortClassByDbColumn("isum")%>"><%=domainInstance.getPropertyCnName("isum") %></th> 
						<th onClick="sortBy(this)" db_col="isum" class="<%=domainSearchCondition.getSortClassByDbColumn("isum")%>">占比</th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							VDispatchCustInvStatObj o = (VDispatchCustInvStatObj) list.get(i); 
				%> 
				<tr> 
					<td style="width:30px;text-align:right"><%=i+1 %></td> 
					<%if(domainSearchCondition.GROUP_BY_CUST.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td><%=StringUtil.getNotEmptyStr(o.getCcuscode())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCcusname())%></td> 
					<%} if(domainSearchCondition.GROUP_BY_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td><%=StringUtil.getNotEmptyStr(o.getCinvcode())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcomunitname())%></td> 
					<%} %>
					<td style="text-align:right;"><%=StringUtil.getNotEmptyStr(o.getIcount())%></td> 
					<td style="text-align:right;"><%=StringUtil.formatDouble(o.getIcount()/iCountTotal*100,2) %>%</td> 
					
					<td style="text-align:right;"><%=StringUtil.formatDouble(o.getIquantity(),2)%></td> 
					<td style="text-align:right;"><%=StringUtil.formatDouble(o.getIquantity()/iQuantityTotal*100,2) %>%</td> 
					
					<td style="text-align:right;"><%=StringUtil.formatDouble(o.getIsum(),2)%></td> 
					<td style="text-align:right;"><%=StringUtil.formatDouble(o.getIsum()/iSumTotal*100,2) %>%</td> 
					
					<td width="40" style="text-align:center"> 
					<%if(!domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
						<input type="button" class="button button_detail" title="详情" onClick="winOpen('<%=contextPath%>/Proxy/Servlet?servlet=<%=basePath%>&method=list4this&showChart=true&groupBy=<%=domainSearchCondition.GROUP_BY_CUST_INV %>&ccuscode=<%=o.getCcuscode() %>&cinvcode=<%=o.getCinvcode() %>&ddate_min=<%=TimeUtil.date2str(domainSearchCondition.getDdate_min(), "yyyy-MM-dd")%>&ddate_max=<%=TimeUtil.date2str(domainSearchCondition.getDdate_max(), "yyyy-MM-dd")%>')" /> 
					<%} else { %>
						<input type="button" class="button button_detail" title="发货明细" onClick="winOpen('<%=contextPath%>/Proxy/Servlet?servlet=VDispatchLists&method=list4this&ccuscode=<%=o.getCcuscode() %>&cinvcode=<%=o.getCinvcode() %>&ddate_min=<%=TimeUtil.date2str(domainSearchCondition.getDdate_min(), "yyyy-MM-dd")%>&ddate_max=<%=TimeUtil.date2str(domainSearchCondition.getDdate_max(), "yyyy-MM-dd")%>')" /> 
					<%} %>
					</td> 
				</tr> 
				<% 
					} 
				%> 
				<tr style="background-color:#ffffcc;color:blue">
					<td>合计</td>
					<%if(domainSearchCondition.GROUP_BY_CUST.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td></td>
					<td></td>
					<%} if(domainSearchCondition.GROUP_BY_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy()) || domainSearchCondition.GROUP_BY_CUST_INV.equalsIgnoreCase(domainSearchCondition.getGroupBy())){ %>
					<td></td>
					<td></td>
					<td></td>
					<%} %>
					<td style="text-align:right;"><%=StringUtil.formatDouble(iCountTotal,0) %></td>
					<td></td>
					<td style="text-align:right;"><%=StringUtil.formatDouble(iQuantityTotal,0) %></td>
					<td></td>
					<td style="text-align:right;"><%=StringUtil.formatDouble(iSumTotal,2) %></td>
					<td></td>
					<td></td>
				</tr>
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
