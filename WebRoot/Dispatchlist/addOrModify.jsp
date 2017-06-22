<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.u8.obj.DispatchlistObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	DispatchlistObj domainInstance = new DispatchlistObj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (DispatchlistObj) domainInstanceObj; 
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
						<%=domainInstance.getPropertyCnName("cdlcode") %>: 
					</td> 
					<td> 
						<input name="cdlcode" type="text" id="cdlcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdlcode(),"")%>" size="20"  <%=isModify?"readOnly":""%>> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cvouchtype") %>: 
					</td> 
					<td> 
						<input name="cvouchtype" type="text" id="cvouchtype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvouchtype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cstcode") %>: 
					</td> 
					<td> 
						<input name="cstcode" type="text" id="cstcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCstcode(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("crdcode") %>: 
					</td> 
					<td> 
						<input name="crdcode" type="text" id="crdcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCrdcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdepcode") %>: 
					</td> 
					<td> 
						<input name="cdepcode" type="text" id="cdepcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdepcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpersoncode") %>: 
					</td> 
					<td> 
						<input name="cpersoncode" type="text" id="cpersoncode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersoncode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("sbvid") %>: 
					</td> 
					<td> 
						<input name="sbvid" type="text" id="sbvid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSbvid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csbvcode") %>: 
					</td> 
					<td> 
						<input name="csbvcode" type="text" id="csbvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsbvcode(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("ccuscode") %>: 
					</td> 
					<td> 
						<input name="ccuscode" type="text" id="ccuscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcuscode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpaycode") %>: 
					</td> 
					<td> 
						<input name="cpaycode" type="text" id="cpaycode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpaycode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csccode") %>: 
					</td> 
					<td> 
						<input name="csccode" type="text" id="csccode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsccode(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("itaxrate") %>: 
					</td> 
					<td> 
						<input name="itaxrate" type="text" id="itaxrate" value="<%=StringUtil.formatDouble(domainInstance.getItaxrate(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bfirst") %>: 
					</td> 
					<td> 
						<input name="bfirst" type="text" id="bfirst" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBfirst(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("breturnflag") %>: 
					</td> 
					<td> 
						<input name="breturnflag" type="text" id="breturnflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBreturnflag(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bsettleall") %>: 
					</td> 
					<td> 
						<input name="bsettleall" type="text" id="bsettleall" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBsettleall(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cmemo") %>: 
					</td> 
					<td> 
						<input name="cmemo" type="text" id="cmemo" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmemo(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csaleout") %>: 
					</td> 
					<td> 
						<input name="csaleout" type="text" id="csaleout" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsaleout(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("cverifier") %>: 
					</td> 
					<td> 
						<input name="cverifier" type="text" id="cverifier" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCverifier(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cmaker") %>: 
					</td> 
					<td> 
						<input name="cmaker" type="text" id="cmaker" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmaker(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("inetlock") %>: 
					</td> 
					<td> 
						<input name="inetlock" type="text" id="inetlock" value="<%=StringUtil.formatDouble(domainInstance.getInetlock(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("isale") %>: 
					</td> 
					<td> 
						<input name="isale" type="text" id="isale" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIsale(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccusname") %>: 
					</td> 
					<td> 
						<input name="ccusname" type="text" id="ccusname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcusname(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ivtid") %>: 
					</td> 
					<td> 
						<input name="ivtid" type="text" id="ivtid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIvtid(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("cbustype") %>: 
					</td> 
					<td> 
						<input name="cbustype" type="text" id="cbustype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbustype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccloser") %>: 
					</td> 
					<td> 
						<input name="ccloser" type="text" id="ccloser" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcloser(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("caccounter") %>: 
					</td> 
					<td> 
						<input name="caccounter" type="text" id="caccounter" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCaccounter(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccrechpname") %>: 
					</td> 
					<td> 
						<input name="ccrechpname" type="text" id="ccrechpname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcrechpname(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("biafirst") %>: 
					</td> 
					<td> 
						<input name="biafirst" type="text" id="biafirst" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBiafirst(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ioutgolden") %>: 
					</td> 
					<td> 
						<input name="ioutgolden" type="text" id="ioutgolden" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIoutgolden(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cgatheringplan") %>: 
					</td> 
					<td> 
						<input name="cgatheringplan" type="text" id="cgatheringplan" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCgatheringplan(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dcreditstart") %>: 
					</td> 
					<td> 
						<input name="dcreditstart" type="text" id="dcreditstart" value="<%=TimeUtil.date2str(domainInstance.getDcreditstart(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dgatheringdate") %>: 
					</td> 
					<td> 
						<input name="dgatheringdate" type="text" id="dgatheringdate" value="<%=TimeUtil.date2str(domainInstance.getDgatheringdate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("icreditdays") %>: 
					</td> 
					<td> 
						<input name="icreditdays" type="text" id="icreditdays" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIcreditdays(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bcredit") %>: 
					</td> 
					<td> 
						<input name="bcredit" type="text" id="bcredit" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBcredit(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("caddcode") %>: 
					</td> 
					<td> 
						<input name="caddcode" type="text" id="caddcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCaddcode(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("iswfcontrolled") %>: 
					</td> 
					<td> 
						<input name="iswfcontrolled" type="text" id="iswfcontrolled" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIswfcontrolled(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("icreditstate") %>: 
					</td> 
					<td> 
						<input name="icreditstate" type="text" id="icreditstate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIcreditstate(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("barfirst") %>: 
					</td> 
					<td> 
						<input name="barfirst" type="text" id="barfirst" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBarfirst(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("ccusperson") %>: 
					</td> 
					<td> 
						<input name="ccusperson" type="text" id="ccusperson" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcusperson(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("csvouchtype") %>: 
					</td> 
					<td> 
						<input name="csvouchtype" type="text" id="csvouchtype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsvouchtype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iflowid") %>: 
					</td> 
					<td> 
						<input name="iflowid" type="text" id="iflowid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIflowid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bsigncreate") %>: 
					</td> 
					<td> 
						<input name="bsigncreate" type="text" id="bsigncreate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBsigncreate(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bcashsale") %>: 
					</td> 
					<td> 
						<input name="bcashsale" type="text" id="bcashsale" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBcashsale(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cgathingcode") %>: 
					</td> 
					<td> 
						<input name="cgathingcode" type="text" id="cgathingcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCgathingcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cchanger") %>: 
					</td> 
					<td> 
						<input name="cchanger" type="text" id="cchanger" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCchanger(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cchangememo") %>: 
					</td> 
					<td> 
						<input name="cchangememo" type="text" id="cchangememo" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCchangememo(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("outid") %>: 
					</td> 
					<td> 
						<input name="outid" type="text" id="outid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getOutid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bmustbook") %>: 
					</td> 
					<td> 
						<input name="bmustbook" type="text" id="bmustbook" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBmustbook(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbookdepcode") %>: 
					</td> 
					<td> 
						<input name="cbookdepcode" type="text" id="cbookdepcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbookdepcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbooktype") %>: 
					</td> 
					<td> 
						<input name="cbooktype" type="text" id="cbooktype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbooktype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bsaused") %>: 
					</td> 
					<td> 
						<input name="bsaused" type="text" id="bsaused" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBsaused(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bneedbill") %>: 
					</td> 
					<td> 
						<input name="bneedbill" type="text" id="bneedbill" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBneedbill(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("baccswitchflag") %>: 
					</td> 
					<td> 
						<input name="baccswitchflag" type="text" id="baccswitchflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBaccswitchflag(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("ccuspersoncode") %>: 
					</td> 
					<td> 
						<input name="ccuspersoncode" type="text" id="ccuspersoncode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcuspersoncode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csourcecode") %>: 
					</td> 
					<td> 
						<input name="csourcecode" type="text" id="csourcecode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsourcecode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bsaleoutcreatebill") %>: 
					</td> 
					<td> 
						<input name="bsaleoutcreatebill" type="text" id="bsaleoutcreatebill" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBsaleoutcreatebill(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("csscode") %>: 
					</td> 
					<td> 
						<input name="csscode" type="text" id="csscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsscode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cinvoicecompany") %>: 
					</td> 
					<td> 
						<input name="cinvoicecompany" type="text" id="cinvoicecompany" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvoicecompany(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("febweight") %>: 
					</td> 
					<td> 
						<input name="febweight" type="text" id="febweight" value="<%=StringUtil.formatDouble(domainInstance.getFebweight(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cebweightunit") %>: 
					</td> 
					<td> 
						<input name="cebweightunit" type="text" id="cebweightunit" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCebweightunit(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cebexpresscode") %>: 
					</td> 
					<td> 
						<input name="cebexpresscode" type="text" id="cebexpresscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCebexpresscode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iebexpresscoid") %>: 
					</td> 
					<td> 
						<input name="iebexpresscoid" type="text" id="iebexpresscoid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIebexpresscoid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("separateid") %>: 
					</td> 
					<td> 
						<input name="separateid" type="text" id="separateid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSeparateid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bnottogoldtax") %>: 
					</td> 
					<td> 
						<input name="bnottogoldtax" type="text" id="bnottogoldtax" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBnottogoldtax(),"")%>" size="20"  > 
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
			setReadonly("cdlcode"); 
		} 
		</script> 
	</body> 
</html> 
