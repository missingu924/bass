<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.StRepKctzMxObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	StRepKctzMxObj domainInstance = new StRepKctzMxObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (StRepKctzMxObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.findKeyValue() > 0; 
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
		<script type="text/javascript" src="../js/autosize.min.js"></script> 
		<script type="text/javascript">$(document).ready(function () {autosize($('textarea'));})</script> 
		<script> 
		//  新增或修改 
		function addOrModify() 
		{	 
			// 做必要的检查 
					 
			// 修改 
			if("true"=="<%=isModify%>") 
			{ 
				addOrModirySubmit(); 
			} 
			// 新增 
			else 
			{ 
				// 新增时检查唯一性 
				checkUniqueAndSave('<%=basePath%>');
			} 
		} 
		 
		</script> 
	</head> 
	<body> 
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/Proxy/Servlet?servlet=<%=basePath%>&method=addOrModify4this" method="post"> 
			<!-- 表格标题 --> 
			<table width="700" align="center" class="title_table"> 
				<tr> 
					<td> 
						<%=isModify ? "修改" : "增加"%><%=domainInstance.getCnName()%> 
					</td> 
				</tr> 
			</table> 
 
			<!-- 详细信息 --> 
			<table width="700" align="center" class="detail_table detail_table-bordered"> 
				<input type="hidden" id="<%=domainInstance.findKeyColumnName()%>" name="<%=domainInstance.findKeyColumnName()%>" value="<%=domainInstance.findKeyValue()%>"> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cvouchname") %>: 
					</td> 
					<td> 
						<input name="cvouchname" type="text" id="cvouchname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvouchname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cwhcode") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml("U8仓库字典", "cwhcode", StringUtil.getNotEmptyStr(domainInstance.getCwhcode(), ""))%> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cinvcode") %>: 
					</td> 
					<td> 
						<input name="cinvcode" type="text" id="cinvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ddate") %>: 
					</td> 
					<td> 
						<input name="ddate" type="text" id="ddate" value="<%=TimeUtil.date2str(domainInstance.getDdate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dveridate") %>: 
					</td> 
					<td> 
						<input name="dveridate" type="text" id="dveridate" value="<%=TimeUtil.date2str(domainInstance.getDveridate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbustype") %>: 
					</td> 
					<td> 
						<input name="cbustype" type="text" id="cbustype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbustype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatch") %>: 
					</td> 
					<td> 
						<input name="cbatch" type="text" id="cbatch" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatch(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iqcqty") %>: 
					</td> 
					<td> 
						<input name="iqcqty" type="text" id="iqcqty" value="<%=StringUtil.formatDouble(domainInstance.getIqcqty(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iinqtty") %>: 
					</td> 
					<td> 
						<input name="iinqtty" type="text" id="iinqtty" value="<%=StringUtil.formatDouble(domainInstance.getIinqtty(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ioutqtty") %>: 
					</td> 
					<td> 
						<input name="ioutqtty" type="text" id="ioutqtty" value="<%=StringUtil.formatDouble(domainInstance.getIoutqtty(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine1") %>: 
					</td> 
					<td> 
						<input name="cdefine1" type="text" id="cdefine1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine1(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine2") %>: 
					</td> 
					<td> 
						<input name="cdefine2" type="text" id="cdefine2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine2(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine3") %>: 
					</td> 
					<td> 
						<input name="cdefine3" type="text" id="cdefine3" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine3(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine4") %>: 
					</td> 
					<td> 
						<input name="cdefine4" type="text" id="cdefine4" value="<%=TimeUtil.date2str(domainInstance.getCdefine4(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine5") %>: 
					</td> 
					<td> 
						<input name="cdefine5" type="text" id="cdefine5" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine5(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine6") %>: 
					</td> 
					<td> 
						<input name="cdefine6" type="text" id="cdefine6" value="<%=TimeUtil.date2str(domainInstance.getCdefine6(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine7") %>: 
					</td> 
					<td> 
						<input name="cdefine7" type="text" id="cdefine7" value="<%=StringUtil.formatDouble(domainInstance.getCdefine7(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine8") %>: 
					</td> 
					<td> 
						<input name="cdefine8" type="text" id="cdefine8" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine8(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine9") %>: 
					</td> 
					<td> 
						<input name="cdefine9" type="text" id="cdefine9" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine9(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine10") %>: 
					</td> 
					<td> 
						<input name="cdefine10" type="text" id="cdefine10" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine10(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine11") %>: 
					</td> 
					<td> 
						<input name="cdefine11" type="text" id="cdefine11" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine11(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine12") %>: 
					</td> 
					<td> 
						<input name="cdefine12" type="text" id="cdefine12" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine12(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine13") %>: 
					</td> 
					<td> 
						<input name="cdefine13" type="text" id="cdefine13" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine13(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine14") %>: 
					</td> 
					<td> 
						<input name="cdefine14" type="text" id="cdefine14" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine14(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine15") %>: 
					</td> 
					<td> 
						<input name="cdefine15" type="text" id="cdefine15" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine15(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine16") %>: 
					</td> 
					<td> 
						<input name="cdefine16" type="text" id="cdefine16" value="<%=StringUtil.formatDouble(domainInstance.getCdefine16(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine22") %>: 
					</td> 
					<td> 
						<input name="cdefine22" type="text" id="cdefine22" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine22(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine23") %>: 
					</td> 
					<td> 
						<input name="cdefine23" type="text" id="cdefine23" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine23(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine24") %>: 
					</td> 
					<td> 
						<input name="cdefine24" type="text" id="cdefine24" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine24(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine25") %>: 
					</td> 
					<td> 
						<input name="cdefine25" type="text" id="cdefine25" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine25(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine26") %>: 
					</td> 
					<td> 
						<input name="cdefine26" type="text" id="cdefine26" value="<%=StringUtil.formatDouble(domainInstance.getCdefine26(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine27") %>: 
					</td> 
					<td> 
						<input name="cdefine27" type="text" id="cdefine27" value="<%=StringUtil.formatDouble(domainInstance.getCdefine27(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine28") %>: 
					</td> 
					<td> 
						<input name="cdefine28" type="text" id="cdefine28" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine28(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine29") %>: 
					</td> 
					<td> 
						<input name="cdefine29" type="text" id="cdefine29" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine29(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine30") %>: 
					</td> 
					<td> 
						<input name="cdefine30" type="text" id="cdefine30" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine30(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine31") %>: 
					</td> 
					<td> 
						<input name="cdefine31" type="text" id="cdefine31" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine31(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine32") %>: 
					</td> 
					<td> 
						<input name="cdefine32" type="text" id="cdefine32" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine32(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine33") %>: 
					</td> 
					<td> 
						<input name="cdefine33" type="text" id="cdefine33" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine33(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine34") %>: 
					</td> 
					<td> 
						<input name="cdefine34" type="text" id="cdefine34" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine34(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine35") %>: 
					</td> 
					<td> 
						<input name="cdefine35" type="text" id="cdefine35" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefine35(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine36") %>: 
					</td> 
					<td> 
						<input name="cdefine36" type="text" id="cdefine36" value="<%=TimeUtil.date2str(domainInstance.getCdefine36(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefine37") %>: 
					</td> 
					<td> 
						<input name="cdefine37" type="text" id="cdefine37" value="<%=TimeUtil.date2str(domainInstance.getCdefine37(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty1") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty1" type="text" id="cbatchproperty1" value="<%=StringUtil.formatDouble(domainInstance.getCbatchproperty1(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty2") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty2" type="text" id="cbatchproperty2" value="<%=StringUtil.formatDouble(domainInstance.getCbatchproperty2(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty3") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty3" type="text" id="cbatchproperty3" value="<%=StringUtil.formatDouble(domainInstance.getCbatchproperty3(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty4") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty4" type="text" id="cbatchproperty4" value="<%=StringUtil.formatDouble(domainInstance.getCbatchproperty4(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty5") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty5" type="text" id="cbatchproperty5" value="<%=StringUtil.formatDouble(domainInstance.getCbatchproperty5(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty6") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty6" type="text" id="cbatchproperty6" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty6(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty7") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty7" type="text" id="cbatchproperty7" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty7(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty8") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty8" type="text" id="cbatchproperty8" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty8(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty9") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty9" type="text" id="cbatchproperty9" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty9(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbatchproperty10") %>: 
					</td> 
					<td> 
						<input name="cbatchproperty10" type="text" id="cbatchproperty10" value="<%=TimeUtil.date2str(domainInstance.getCbatchproperty10(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree1") %>: 
					</td> 
					<td> 
						<input name="cfree1" type="text" id="cfree1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree1(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree2") %>: 
					</td> 
					<td> 
						<input name="cfree2" type="text" id="cfree2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree2(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree3") %>: 
					</td> 
					<td> 
						<input name="cfree3" type="text" id="cfree3" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree3(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree4") %>: 
					</td> 
					<td> 
						<input name="cfree4" type="text" id="cfree4" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree4(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree5") %>: 
					</td> 
					<td> 
						<input name="cfree5" type="text" id="cfree5" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree5(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree6") %>: 
					</td> 
					<td> 
						<input name="cfree6" type="text" id="cfree6" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree6(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree7") %>: 
					</td> 
					<td> 
						<input name="cfree7" type="text" id="cfree7" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree7(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree8") %>: 
					</td> 
					<td> 
						<input name="cfree8" type="text" id="cfree8" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree8(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree9") %>: 
					</td> 
					<td> 
						<input name="cfree9" type="text" id="cfree9" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree9(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfree10") %>: 
					</td> 
					<td> 
						<input name="cfree10" type="text" id="cfree10" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfree10(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cvmivencode") %>: 
					</td> 
					<td> 
						<input name="cvmivencode" type="text" id="cvmivencode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvmivencode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cvmivenname") %>: 
					</td> 
					<td> 
						<input name="cvmivenname" type="text" id="cvmivenname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvmivenname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dcheckdate") %>: 
					</td> 
					<td> 
						<input name="dcheckdate" type="text" id="dcheckdate" value="<%=TimeUtil.date2str(domainInstance.getDcheckdate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccheckcode") %>: 
					</td> 
					<td> 
						<input name="ccheckcode" type="text" id="ccheckcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcheckcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccheckpersonname") %>: 
					</td> 
					<td> 
						<input name="ccheckpersonname" type="text" id="ccheckpersonname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcheckpersonname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("crejectcode") %>: 
					</td> 
					<td> 
						<input name="crejectcode" type="text" id="crejectcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCrejectcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dvalidatedate") %>: 
					</td> 
					<td> 
						<input name="dvalidatedate" type="text" id="dvalidatedate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDvalidatedate(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbmemo") %>: 
					</td> 
					<td> 
						<input name="cbmemo" type="text" id="cbmemo" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbmemo(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("isotype") %>: 
					</td> 
					<td> 
						<input name="isotype" type="text" id="isotype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIsotype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csocode") %>: 
					</td> 
					<td> 
						<input name="csocode" type="text" id="csocode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsocode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("isoseq") %>: 
					</td> 
					<td> 
						<input name="isoseq" type="text" id="isoseq" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIsoseq(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("isodid") %>: 
					</td> 
					<td> 
						<input name="isodid" type="text" id="isodid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIsodid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdemandmemo") %>: 
					</td> 
					<td> 
						<input name="cdemandmemo" type="text" id="cdemandmemo" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdemandmemo(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cmolotcode") %>: 
					</td> 
					<td> 
						<input name="cmolotcode" type="text" id="cmolotcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmolotcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cshipaddress") %>: 
					</td> 
					<td> 
						<input name="cshipaddress" type="text" id="cshipaddress" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCshipaddress(),"")%>" size="20"  > 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
		
		<!-- 设置修改时哪些字段不可修改 --> 
		<script type="text/javascript"> 
		if(true==<%=isModify%>) 
		{ 
		} 
		</script> 
	</body> 
</html> 
