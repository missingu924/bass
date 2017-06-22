<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.StRepKctzSumObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bass.obj.StRepKctzMxObj"%>
<%@page import="com.bass.searchcondition.StRepKctzSumSearchCondition"%>
<%@page import="com.wuyg.system.util.SystemConfigUtil"%>
<%@page import="com.wuyg.common.obj.PaginationObj"%>
<%@page import="java.util.HashMap"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	StRepKctzSumObj domainInstance = (StRepKctzSumObj) request.getAttribute("domainInstance");  
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能路径  
	String basePath = domainInstance.getBasePath();  
	// 该功能对象查询条件实例 
	StRepKctzSumSearchCondition domainSearchCondition = (StRepKctzSumSearchCondition) request.getAttribute("domainSearchCondition"); 
	
	PaginationObj pagination = (PaginationObj)request.getAttribute("domainPagination");
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%=domainInstance.getCnName()%>详情</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css" /> 
		<script src="../js/jquery-2.0.3.min.js"></script> 
		<script src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
	</head> 
	<body> 
	
	<script type="text/javascript">
	
	function calc()
	{
		$("#searchButton").val("查询中……");
		$("#reCalc").val("true");
		toPage(1);
	}
	
	</script>
	
	<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=calc4this"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="showHelpInfoTable" name="showHelpInfoTable" value="<%=domainSearchCondition.isShowHelpInfoTable()%>"> 
			<input type="hidden" id="showSearchConditionTable" name="showSearchConditionTable" value="<%=domainSearchCondition.isShowSearchConditionTable()%>"> 
			<input type="hidden" id="orderBy" name="orderBy" value="<%=StringUtil.getNotEmptyStr(domainSearchCondition.getOrderBy(), "")%>">
			<input type="hidden" id="reCalc" name="reCalc" value=""> 
			 
			<!-- 工具栏 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td style="width:0px"></td>  
					<td style="font-weight:normal">
						<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td align="center">
									<input name="pageNo" type="hidden" id="pageNo" value="<%=pagination.getPageNo()%>" size="3" />
									<input name="pageCount" type="hidden" value="<%=pagination.getPageCount()%>" size="3" />
									<%
										if (pagination.isPrevious())
										{
									%>
									<img src="../images/pagination_icons_first.png" title="第一页" align="absmiddle" onClick="toPage(1);" class="image_button" />
									&nbsp;&nbsp;
									<img src="../images/pagination_icons_pre.png" title="上一页" align="absmiddle" onclick="toPage(<%=pagination.getPageNo() - 1%>);" class="image_button" />
									&nbsp;&nbsp;
									<%
										} else
										{
									%>
									<img src="../images/pagination_icons_first_gray.png" align="absmiddle" />
									&nbsp;&nbsp;
									<img src="../images/pagination_icons_pre_gray.png" align="absmiddle" />
									&nbsp;&nbsp;
									<%
										}
									%>
									<%
										if (pagination.isNext())
										{
									%>
									<img src="../images/pagination_icons_next.png" title="下一页" align="absmiddle" onclick="toPage(<%=pagination.getPageNo() + 1%>);" class="image_button" />
									&nbsp;&nbsp;
									<img src="../images/pagination_icons_last.png" title="最后页" align="absmiddle" onclick="toPage(<%=pagination.getTotalPage()%>);" class="image_button" />
									&nbsp;&nbsp;
									<%
										} else
										{
									%>
									<img src="../images/pagination_icons_next_gray.png" align="absmiddle" />
									&nbsp;&nbsp;
									<img src="../images/pagination_icons_last_gray.png" align="absmiddle" />
									&nbsp;&nbsp;
									<%
										}
									%>
									
									<font color="#666666">共<%=pagination.getTotalCount()%>个存货&nbsp;&nbsp;,&nbsp;&nbsp;当前是第<%=pagination.getTotalCount()==0?0:pagination.getPageNo()%>个</font>
								</td>
							</tr>
						</table>
					</td> 
					<td> 
						<input id="conditionButton" type="button" class="button button_set" value="条件" onClick="$('#search_condition_table').toggle();$('#showSearchConditionTable').val(!$('#search_condition_table').is(':hidden'));">
						<input id="searchButton" type="button" class="button button_search" value="查询" onClick="calc()"> 
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
						-&nbsp;&nbsp;&nbsp;&nbsp;
						<%=DictionaryUtil.getInputHtml("U8存货字典", "cinvcode_max", StringUtil.getNotEmptyStr(domainSearchCondition.getCinvcode_max(), ""), StringUtil.getInSql("cinvccode",SystemConfigUtil.getValueListByName("cs_inventory_class")).replaceAll("\'","\\\\'"), 15, false)%>  
						</td> 
				</tr>
				<tr>
						<td>仓库</td> 
						<td>
						<%=DictionaryUtil.getInputHtml("U8仓库字典", "cwhcode", StringUtil.getNotEmptyStr(domainSearchCondition.getCwhcode(), ""), StringUtil.getInSql("cwhcode",SystemConfigUtil.getValueListByName("cs_warehourse")).replaceAll("\'","\\\\'"), 20,true)%> 
						</td> 
						<td>单据日期</td>
						<td>
						<input name="ddate_min" type="text" id="ddate_min" value="<%=TimeUtil.date2str(domainSearchCondition.getDdate_min(),"yyyy-MM-dd")%>" size="15" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="ddate_max" type="text" id="ddate_max" value="<%=TimeUtil.date2str(domainSearchCondition.getDdate_max(),"yyyy-MM-dd")%>" size="15" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})"> 
						</td> 
				</tr>
			</table>

			
		<%
			List sumList = (ArrayList<StRepKctzSumObj>)request.getSession().getAttribute("sumList");
			List mxList = (ArrayList<StRepKctzMxObj>)request.getSession().getAttribute("mxList");
			
			if(sumList.size()>pagination.getPageNo()-1)
			{
				// 取出本次需要展示的数据
				StRepKctzSumObj sumInstance = (StRepKctzSumObj)sumList.get(pagination.getPageNo()-1);
				List subMxList = new ArrayList();
				for(int i=0;i<mxList.size();i++)
				{
					StRepKctzMxObj o = (StRepKctzMxObj) mxList.get(i); 
					
					if(o.getCinvcode().equalsIgnoreCase(sumInstance.getCinvcode()))
					{
						subMxList.add(o);
					}
				}
		%>
		

		<div id="export_table"  width="100%">
		<!-- 表格标题 --> 
		<table width="98%" align="center" class="title_table"> 
			<tr> 
				<td> 
					<%=domainInstance.getCnName()%>
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="98%" align="center" class="detail_table detail_table-bordered"> 
			<tr> 
				<td> 
					<%=sumInstance.getPropertyCnName("cinvcname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(sumInstance.getCinvcname())%></td> 
				<td> 
					<%=sumInstance.getPropertyCnName("cinvcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(sumInstance.getCinvcode())%></td> 
				<td> 
					<%=sumInstance.getPropertyCnName("cinvname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(sumInstance.getCinvname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=sumInstance.getPropertyCnName("cinvstd") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(sumInstance.getCinvstd())%></td> 
				<td> 
					<%=sumInstance.getPropertyCnName("cinvm_unit") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(sumInstance.getCinvm_unit())%></td> 
				<td></td> 
				<td></td> 
			</tr>
		</table> 
		
		<!-- 数据信息 -->  
		<%
			StRepKctzMxObj mxInstance =  new StRepKctzMxObj();
		
			double iJc = sumInstance.getIbeginqtty();// 结存数量
			
			double iInSum4month=0,iInSum4year=0,iInSum=0,iOutSum4month=0,iOutSum4year=0,iOutSum=0;
			
			double iJcSum4month=iJc,iJcSum4year=iJc,iJcSum=iJc;
			
			int iYear=0,iYearPre=0,iMonth=0,iMonthPre=0;
			
			boolean isYearChange=false,isMonthChange=false;
			
			String ccqdjk = "产成品待检库";
			
		%>
			<table id="data_table" class="table table-bordered" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th><%=mxInstance.getPropertyCnName("ddate") %></th> 
						<th><%=mxInstance.getPropertyCnName("dveridate") %></th> 
						<th><%=mxInstance.getPropertyCnName("cwhname") %></th> 
						<th><%=mxInstance.getPropertyCnName("cvouchname") %></th> 
						<th><%=mxInstance.getPropertyCnName("cbatch") %></th> 
						<th><%=mxInstance.getPropertyCnName("cddh") %></th>
						<th><%=mxInstance.getPropertyCnName("iinqtty") %></th> 
						<th><%=mxInstance.getPropertyCnName("ioutqtty") %></th> 
						<th>结存数量</th> 
					</tr> 
				</thead> 
				<tr> 
					<td></td> 
					<td></td> 
					<td>期初结存</td> 
					<td></td>  
					<td></td> 
					<td></td> 
					<td></td> 
					<td></td> 
					<td style="text-align:right"><%=StringUtil.formatDouble(iJc,2)%></td> 
				</tr> 
				<% 
					for (int i = 0; i < subMxList.size(); i++) 
					{ 
							StRepKctzMxObj o = (StRepKctzMxObj) subMxList.get(i); 
							
							iJc += (o.getIqcqty() == null ? 0 : o.getIqcqty()) + (o.getIinqtty() == null ? 0 : o.getIinqtty()) - (o.getIoutqtty() == null ? 0 : o.getIoutqtty());
							
							// 处理 年份 和 月份 变化
							iYearPre = iYear;
							iMonthPre = iMonth;
							
							iYear = o.getDdate().getYear();
							iMonth = o.getDdate().getMonth()+1; // 从0开始
							
							if(iYearPre!=0 && iYear!=iYearPre)
							{
								// 年份变化
								isYearChange = true;
							}
							
							if((iMonthPre!=0 && iMonth!=iMonthPre) || isYearChange)
							{
								// 月份变化
								isMonthChange = true;
							}
							
							if(!isMonthChange)
							{
				%>
									<!-- 明细行 -->
									<tr> 
										<td><%=TimeUtil.date2str(o.getDdate(),"yyyy-MM-dd")%></td> 
										<td><%=TimeUtil.date2str(o.getDveridate(),"yyyy-MM-dd")%></td>  
										<td style="color:<%=ccqdjk.equalsIgnoreCase(o.getCwhname())?"red":"" %>"><%=StringUtil.getNotEmptyStr(o.getCwhname())%></td>  
										<td><%=StringUtil.getNotEmptyStr(o.getCvouchname())%></td>
										<td><%=StringUtil.getNotEmptyStr(o.getCbatch())%></td> 
										<td><%=StringUtil.getNotEmptyStr(o.getCddh())%></td>
										<td style="text-align:right"><%=StringUtil.formatDouble(o.getIinqtty(),2)%></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(o.getIoutqtty(),2)%></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(iJc,2)%></td> 
									</tr> 
				<%
							}							
							else if(isMonthChange)
							{
				%>
									<tr style="background: #ffffcc"> 
										<td></td> 
										<td></td> 
										<td>本月合计</td> 
										<td></td>  
										<td></td> 
										<td></td>  
										<td style="text-align:right"><%=StringUtil.formatDouble(iInSum4month,2)%></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(iOutSum4month,2)%></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(iJcSum4month,2)%></td> 
									</tr> 
									<%if(isYearChange){ %>
									<tr style="background: #ffffcc"> 
										<td></td> 
										<td></td> 
										<td>本年合计</td> 
										<td></td>  
										<td></td>  
										<td></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(iInSum4year,2)%></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(iOutSum4year,2)%></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(iJcSum4year,2)%></td> 
									</tr> 
									<%} %>
									<tr> 
										<td><%=TimeUtil.date2str(o.getDdate(),"yyyy-MM-dd")%></td> 
										<td><%=TimeUtil.date2str(o.getDveridate(),"yyyy-MM-dd")%></td> 
										<td style="color:<%=ccqdjk.equalsIgnoreCase(o.getCwhname())?"red":"" %>"><%=StringUtil.getNotEmptyStr(o.getCwhname())%></td>  
										<td><%=StringUtil.getNotEmptyStr(o.getCvouchname())%></td> 
										<td><%=StringUtil.getNotEmptyStr(o.getCbatch())%></td> 
										<td><%=StringUtil.getNotEmptyStr(o.getCddh())%></td>
										<td style="text-align:right"><%=StringUtil.formatDouble(o.getIinqtty(),2)%></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(o.getIoutqtty(),2)%></td> 
										<td style="text-align:right"><%=StringUtil.formatDouble(iJc,2)%></td> 
									</tr> 
				<%			
								// 清空月度合计
								iInSum4month = 0; iOutSum4month = 0; 
								isMonthChange = false;
								
								// 清空年度合计
								if(isYearChange)
								{
									iInSum4year = 0; iOutSum4year = 0; 
									isYearChange = false;
								}
							}
							
							
							// 计算各类合计	
							iInSum += (o.getIinqtty()==null?0:o.getIinqtty());
							iOutSum += (o.getIoutqtty()==null?0:o.getIoutqtty());
							iJcSum += (o.getIqcqty() == null ? 0 : o.getIqcqty()) + (o.getIinqtty() == null ? 0 : o.getIinqtty()) - (o.getIoutqtty() == null ? 0 : o.getIoutqtty());;
							
							iInSum4month += (o.getIinqtty()==null?0:o.getIinqtty());
							iOutSum4month += (o.getIoutqtty()==null?0:o.getIoutqtty());
							iJcSum4month += (o.getIqcqty() == null ? 0 : o.getIqcqty()) + (o.getIinqtty() == null ? 0 : o.getIinqtty()) - (o.getIoutqtty() == null ? 0 : o.getIoutqtty());;
							
							iInSum4year += (o.getIinqtty()==null?0:o.getIinqtty());
							iOutSum4year += (o.getIoutqtty()==null?0:o.getIoutqtty());
							iJcSum4year += (o.getIqcqty() == null ? 0 : o.getIqcqty()) + (o.getIinqtty() == null ? 0 : o.getIinqtty()) - (o.getIoutqtty() == null ? 0 : o.getIoutqtty());;
					}
				%> 
				<!-- 末尾 -->
				<%if(!isMonthChange){ %>
					<tr style="background: #ffffcc"> 
						<td></td> 
						<td></td> 
						<td>本月合计</td> 
						<td></td>  
						<td></td> 
						<td></td>  
						<td style="text-align:right"><%=StringUtil.formatDouble(iInSum4month,2)%></td> 
						<td style="text-align:right"><%=StringUtil.formatDouble(iOutSum4month,2)%></td> 
						<td style="text-align:right"><%=StringUtil.formatDouble(iJcSum4month,2)%></td> 
					</tr> 
					<tr style="background: #ffffcc"> 
						<td></td> 
						<td></td> 
						<td>本年合计</td> 
						<td></td>  
						<td></td> 
						<td></td>  
						<td style="text-align:right"><%=StringUtil.formatDouble(iInSum4year,2)%></td> 
						<td style="text-align:right"><%=StringUtil.formatDouble(iOutSum4year,2)%></td> 
						<td style="text-align:right"><%=StringUtil.formatDouble(iJcSum4year,2)%></td> 
					</tr> 
					<%} %>
					<tr style="background: #ffffcc"> 
						<td></td> 
						<td></td> 
						<td>合计</td> 
						<td></td>  
						<td></td> 
						<td></td>  
						<td style="text-align:right"><%=StringUtil.formatDouble(iInSum,2)%></td> 
						<td style="text-align:right"><%=StringUtil.formatDouble(iOutSum,2)%></td> 
						<td style="text-align:right"><%=StringUtil.formatDouble(iJcSum,2)%></td> 
					</tr> 
			</table> 
			<div width="90%" align="center">
				<img src="../images/pagination_icons_save.png" title="导出全部数据" class="image_button" align="absmiddle" onClick="exportData('<%=pagination.getTotalCount()%>','<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=export4this')" />
				导出
				<!-- 从HTML页面导出excel使用 -->
				<input type="hidden" name="table_html" id="table_html" value="">
			</div>
			<%} else { %>
			<!-- <div align="center"><font color="#ff6600">没有查询到数据，请重新设置条件后再查询。</font></div> -->
			<%} %>
			
	</div>


	
			</form>
	</body> 
</html> 
