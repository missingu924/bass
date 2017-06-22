<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.u8.obj.ApClosebillObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	ApClosebillObj domainInstance = new ApClosebillObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (ApClosebillObj) domainInstanceObj; 
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
						<%=domainInstance.getPropertyCnName("cvouchtype") %>: 
					</td> 
					<td> 
						<input name="cvouchtype" type="text" id="cvouchtype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvouchtype(),"")%>" size="20"  <%=isModify?"readOnly":""%>> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cvouchid") %>: 
					</td> 
					<td> 
						<input name="cvouchid" type="text" id="cvouchid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvouchid(),"")%>" size="20"  <%=isModify?"readOnly":""%>> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dvouchdate") %>: 
					</td> 
					<td> 
						<input name="dvouchdate" type="text" id="dvouchdate" value="<%=TimeUtil.date2str(domainInstance.getDvouchdate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iperiod") %>: 
					</td> 
					<td> 
						<input name="iperiod" type="text" id="iperiod" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIperiod(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdwcode") %>: 
					</td> 
					<td> 
						<input name="cdwcode" type="text" id="cdwcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdwcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdeptcode") %>: 
					</td> 
					<td> 
						<input name="cdeptcode" type="text" id="cdeptcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdeptcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cperson") %>: 
					</td> 
					<td> 
						<input name="cperson" type="text" id="cperson" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCperson(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("citem_class") %>: 
					</td> 
					<td> 
						<input name="citem_class" type="text" id="citem_class" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCitem_class(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("citemcode") %>: 
					</td> 
					<td> 
						<input name="citemcode" type="text" id="citemcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCitemcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csscode") %>: 
					</td> 
					<td> 
						<input name="csscode" type="text" id="csscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsscode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cnoteno") %>: 
					</td> 
					<td> 
						<input name="cnoteno" type="text" id="cnoteno" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCnoteno(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccovouchtype") %>: 
					</td> 
					<td> 
						<input name="ccovouchtype" type="text" id="ccovouchtype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcovouchtype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccovouchid") %>: 
					</td> 
					<td> 
						<input name="ccovouchid" type="text" id="ccovouchid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcovouchid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdigest") %>: 
					</td> 
					<td> 
						<input name="cdigest" type="text" id="cdigest" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdigest(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbankaccount") %>: 
					</td> 
					<td> 
						<input name="cbankaccount" type="text" id="cbankaccount" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbankaccount(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cexch_name") %>: 
					</td> 
					<td> 
						<input name="cexch_name" type="text" id="cexch_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCexch_name(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iexchrate") %>: 
					</td> 
					<td> 
						<input name="iexchrate" type="text" id="iexchrate" value="<%=StringUtil.formatDouble(domainInstance.getIexchrate(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iamount") %>: 
					</td> 
					<td> 
						<input name="iamount" type="text" id="iamount" value="<%=StringUtil.formatDouble(domainInstance.getIamount(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iamount_f") %>: 
					</td> 
					<td> 
						<input name="iamount_f" type="text" id="iamount_f" value="<%=StringUtil.formatDouble(domainInstance.getIamount_f(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iramount") %>: 
					</td> 
					<td> 
						<input name="iramount" type="text" id="iramount" value="<%=StringUtil.formatDouble(domainInstance.getIramount(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iramount_f") %>: 
					</td> 
					<td> 
						<input name="iramount_f" type="text" id="iramount_f" value="<%=StringUtil.formatDouble(domainInstance.getIramount_f(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("coperator") %>: 
					</td> 
					<td> 
						<input name="coperator" type="text" id="coperator" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCoperator(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccancelman") %>: 
					</td> 
					<td> 
						<input name="ccancelman" type="text" id="ccancelman" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcancelman(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("crpman") %>: 
					</td> 
					<td> 
						<input name="crpman" type="text" id="crpman" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCrpman(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bprepay") %>: 
					</td> 
					<td> 
						<input name="bprepay" type="text" id="bprepay" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBprepay(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bstartflag") %>: 
					</td> 
					<td> 
						<input name="bstartflag" type="text" id="bstartflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBstartflag(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("corderno") %>: 
					</td> 
					<td> 
						<input name="corderno" type="text" id="corderno" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCorderno(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccode") %>: 
					</td> 
					<td> 
						<input name="ccode" type="text" id="ccode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cprecode") %>: 
					</td> 
					<td> 
						<input name="cprecode" type="text" id="cprecode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCprecode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ipayforother") %>: 
					</td> 
					<td> 
						<input name="ipayforother" type="text" id="ipayforother" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIpayforother(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csrcflag") %>: 
					</td> 
					<td> 
						<input name="csrcflag" type="text" id="csrcflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsrcflag(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpzid") %>: 
					</td> 
					<td> 
						<input name="cpzid" type="text" id="cpzid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpzid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cflag") %>: 
					</td> 
					<td> 
						<input name="cflag" type="text" id="cflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCflag(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bsend") %>: 
					</td> 
					<td> 
						<input name="bsend" type="text" id="bsend" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBsend(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("breceived") %>: 
					</td> 
					<td> 
						<input name="breceived" type="text" id="breceived" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBreceived(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csitemcode") %>: 
					</td> 
					<td> 
						<input name="csitemcode" type="text" id="csitemcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsitemcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccancelno") %>: 
					</td> 
					<td> 
						<input name="ccancelno" type="text" id="ccancelno" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcancelno(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbank") %>: 
					</td> 
					<td> 
						<input name="cbank" type="text" id="cbank" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbank(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cnatbank") %>: 
					</td> 
					<td> 
						<input name="cnatbank" type="text" id="cnatbank" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCnatbank(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cnatbankaccount") %>: 
					</td> 
					<td> 
						<input name="cnatbankaccount" type="text" id="cnatbankaccount" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCnatbankaccount(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bfrombank") %>: 
					</td> 
					<td> 
						<input name="bfrombank" type="text" id="bfrombank" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBfrombank(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("btobank") %>: 
					</td> 
					<td> 
						<input name="btobank" type="text" id="btobank" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBtobank(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bsure") %>: 
					</td> 
					<td> 
						<input name="bsure" type="text" id="bsure" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBsure(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("vt_id") %>: 
					</td> 
					<td> 
						<input name="vt_id" type="text" id="vt_id" value="<%=StringUtil.getNotEmptyStr(domainInstance.getVt_id(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccheckman") %>: 
					</td> 
					<td> 
						<input name="ccheckman" type="text" id="ccheckman" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcheckman(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("ufts") %>: 
					</td> 
					<td> 
						<input name="ufts" type="text" id="ufts" value="<%=StringUtil.getNotEmptyStr(domainInstance.getUfts(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("citemname") %>: 
					</td> 
					<td> 
						<input name="citemname" type="text" id="citemname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCitemname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccontracttype") %>: 
					</td> 
					<td> 
						<input name="ccontracttype" type="text" id="ccontracttype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcontracttype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccontractid") %>: 
					</td> 
					<td> 
						<input name="ccontractid" type="text" id="ccontractid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcontractid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iamount_s") %>: 
					</td> 
					<td> 
						<input name="iamount_s" type="text" id="iamount_s" value="<%=StringUtil.formatDouble(domainInstance.getIamount_s(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iswfcontrolled") %>: 
					</td> 
					<td> 
						<input name="iswfcontrolled" type="text" id="iswfcontrolled" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIswfcontrolled(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("isource") %>: 
					</td> 
					<td> 
						<input name="isource" type="text" id="isource" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIsource(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("sdlcode") %>: 
					</td> 
					<td> 
						<input name="sdlcode" type="text" id="sdlcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSdlcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("registerflag") %>: 
					</td> 
					<td> 
						<input name="registerflag" type="text" id="registerflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRegisterflag(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iverifystate") %>: 
					</td> 
					<td> 
						<input name="iverifystate" type="text" id="iverifystate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIverifystate(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ireturncount") %>: 
					</td> 
					<td> 
						<input name="ireturncount" type="text" id="ireturncount" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIreturncount(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dcreatesystime") %>: 
					</td> 
					<td> 
						<input name="dcreatesystime" type="text" id="dcreatesystime" value="<%=TimeUtil.date2str(domainInstance.getDcreatesystime(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dverifysystime") %>: 
					</td> 
					<td> 
						<input name="dverifysystime" type="text" id="dverifysystime" value="<%=TimeUtil.date2str(domainInstance.getDverifysystime(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dmodifysystime") %>: 
					</td> 
					<td> 
						<input name="dmodifysystime" type="text" id="dmodifysystime" value="<%=TimeUtil.date2str(domainInstance.getDmodifysystime(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cmodifier") %>: 
					</td> 
					<td> 
						<input name="cmodifier" type="text" id="cmodifier" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmodifier(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dmoddate") %>: 
					</td> 
					<td> 
						<input name="dmoddate" type="text" id="dmoddate" value="<%=TimeUtil.date2str(domainInstance.getDmoddate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dverifydate") %>: 
					</td> 
					<td> 
						<input name="dverifydate" type="text" id="dverifydate" value="<%=TimeUtil.date2str(domainInstance.getDverifydate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ibg_overflag") %>: 
					</td> 
					<td> 
						<input name="ibg_overflag" type="text" id="ibg_overflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIbg_overflag(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_auditor") %>: 
					</td> 
					<td> 
						<input name="cbg_auditor" type="text" id="cbg_auditor" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_auditor(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_audittime") %>: 
					</td> 
					<td> 
						<input name="cbg_audittime" type="text" id="cbg_audittime" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_audittime(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("controlresult") %>: 
					</td> 
					<td> 
						<input name="controlresult" type="text" id="controlresult" value="<%=StringUtil.getNotEmptyStr(domainInstance.getControlresult(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_itemcode") %>: 
					</td> 
					<td> 
						<input name="cbg_itemcode" type="text" id="cbg_itemcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_itemcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_itemname") %>: 
					</td> 
					<td> 
						<input name="cbg_itemname" type="text" id="cbg_itemname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_itemname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkey1") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkey1" type="text" id="cbg_caliberkey1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey1(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkeyname1") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkeyname1" type="text" id="cbg_caliberkeyname1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname1(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkey2") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkey2" type="text" id="cbg_caliberkey2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey2(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkeyname2") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkeyname2" type="text" id="cbg_caliberkeyname2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname2(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkey3") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkey3" type="text" id="cbg_caliberkey3" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey3(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkeyname3") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkeyname3" type="text" id="cbg_caliberkeyname3" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname3(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibercode1") %>: 
					</td> 
					<td> 
						<input name="cbg_calibercode1" type="text" id="cbg_calibercode1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode1(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibername1") %>: 
					</td> 
					<td> 
						<input name="cbg_calibername1" type="text" id="cbg_calibername1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername1(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibercode2") %>: 
					</td> 
					<td> 
						<input name="cbg_calibercode2" type="text" id="cbg_calibercode2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode2(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibername2") %>: 
					</td> 
					<td> 
						<input name="cbg_calibername2" type="text" id="cbg_calibername2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername2(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibercode3") %>: 
					</td> 
					<td> 
						<input name="cbg_calibercode3" type="text" id="cbg_calibercode3" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode3(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibername3") %>: 
					</td> 
					<td> 
						<input name="cbg_calibername3" type="text" id="cbg_calibername3" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername3(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ibg_ctrl") %>: 
					</td> 
					<td> 
						<input name="ibg_ctrl" type="text" id="ibg_ctrl" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIbg_ctrl(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_auditopinion") %>: 
					</td> 
					<td> 
						<input name="cbg_auditopinion" type="text" id="cbg_auditopinion" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_auditopinion(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("capplycode") %>: 
					</td> 
					<td> 
						<input name="capplycode" type="text" id="capplycode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCapplycode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpznum") %>: 
					</td> 
					<td> 
						<input name="cpznum" type="text" id="cpznum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpznum(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("doutbilldate") %>: 
					</td> 
					<td> 
						<input name="doutbilldate" type="text" id="doutbilldate" value="<%=TimeUtil.date2str(domainInstance.getDoutbilldate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkey4") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkey4" type="text" id="cbg_caliberkey4" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey4(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkeyname4") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkeyname4" type="text" id="cbg_caliberkeyname4" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname4(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkey5") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkey5" type="text" id="cbg_caliberkey5" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey5(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkeyname5") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkeyname5" type="text" id="cbg_caliberkeyname5" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname5(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkey6") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkey6" type="text" id="cbg_caliberkey6" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey6(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_caliberkeyname6") %>: 
					</td> 
					<td> 
						<input name="cbg_caliberkeyname6" type="text" id="cbg_caliberkeyname6" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname6(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibercode4") %>: 
					</td> 
					<td> 
						<input name="cbg_calibercode4" type="text" id="cbg_calibercode4" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode4(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibername4") %>: 
					</td> 
					<td> 
						<input name="cbg_calibername4" type="text" id="cbg_calibername4" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername4(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibercode5") %>: 
					</td> 
					<td> 
						<input name="cbg_calibercode5" type="text" id="cbg_calibercode5" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode5(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibername5") %>: 
					</td> 
					<td> 
						<input name="cbg_calibername5" type="text" id="cbg_calibername5" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername5(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibercode6") %>: 
					</td> 
					<td> 
						<input name="cbg_calibercode6" type="text" id="cbg_calibercode6" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode6(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbg_calibername6") %>: 
					</td> 
					<td> 
						<input name="cbg_calibername6" type="text" id="cbg_calibername6" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername6(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iprintcount") %>: 
					</td> 
					<td> 
						<input name="iprintcount" type="text" id="iprintcount" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIprintcount(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("creservedeptcode") %>: 
					</td> 
					<td> 
						<input name="creservedeptcode" type="text" id="creservedeptcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCreservedeptcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bdealmode") %>: 
					</td> 
					<td> 
						<input name="bdealmode" type="text" id="bdealmode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBdealmode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ibustype") %>: 
					</td> 
					<td> 
						<input name="ibustype" type="text" id="ibustype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIbustype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ipaytype") %>: 
					</td> 
					<td> 
						<input name="ipaytype" type="text" id="ipaytype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIpaytype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cagentcuscode") %>: 
					</td> 
					<td> 
						<input name="cagentcuscode" type="text" id="cagentcuscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCagentcuscode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csysbarcode") %>: 
					</td> 
					<td> 
						<input name="csysbarcode" type="text" id="csysbarcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsysbarcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccurrentauditor") %>: 
					</td> 
					<td> 
						<input name="ccurrentauditor" type="text" id="ccurrentauditor" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcurrentauditor(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("lacctid") %>: 
					</td> 
					<td> 
						<input name="lacctid" type="text" id="lacctid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getLacctid(),"")%>" size="20"  > 
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
			setReadonly("cvouchtype"); 
			setReadonly("cvouchid"); 
		} 
		</script> 
	</body> 
</html> 
