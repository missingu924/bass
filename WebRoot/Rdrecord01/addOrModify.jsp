<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.u8.obj.Rdrecord01Obj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	Rdrecord01Obj domainInstance = new Rdrecord01Obj(); 
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (Rdrecord01Obj) domainInstanceObj; 
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
						<%=domainInstance.getPropertyCnName("brdflag") %>: 
					</td> 
					<td> 
						<input name="brdflag" type="text" id="brdflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBrdflag(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("cbustype") %>: 
					</td> 
					<td> 
						<input name="cbustype" type="text" id="cbustype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbustype(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csource") %>: 
					</td> 
					<td> 
						<input name="csource" type="text" id="csource" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsource(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbuscode") %>: 
					</td> 
					<td> 
						<input name="cbuscode" type="text" id="cbuscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbuscode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cwhcode") %>: 
					</td> 
					<td> 
						<input name="cwhcode" type="text" id="cwhcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCwhcode(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("ccode") %>: 
					</td> 
					<td> 
						<input name="ccode" type="text" id="ccode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcode(),"")%>" size="20"  <%=isModify?"readOnly":""%>> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
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
						<%=domainInstance.getPropertyCnName("cptcode") %>: 
					</td> 
					<td> 
						<input name="cptcode" type="text" id="cptcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCptcode(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("ccuscode") %>: 
					</td> 
					<td> 
						<input name="ccuscode" type="text" id="ccuscode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcuscode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cvencode") %>: 
					</td> 
					<td> 
						<input name="cvencode" type="text" id="cvencode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvencode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cordercode") %>: 
					</td> 
					<td> 
						<input name="cordercode" type="text" id="cordercode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCordercode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("carvcode") %>: 
					</td> 
					<td> 
						<input name="carvcode" type="text" id="carvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCarvcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbillcode") %>: 
					</td> 
					<td> 
						<input name="cbillcode" type="text" id="cbillcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbillcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdlcode") %>: 
					</td> 
					<td> 
						<input name="cdlcode" type="text" id="cdlcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdlcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cprobatch") %>: 
					</td> 
					<td> 
						<input name="cprobatch" type="text" id="cprobatch" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCprobatch(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("chandler") %>: 
					</td> 
					<td> 
						<input name="chandler" type="text" id="chandler" value="<%=StringUtil.getNotEmptyStr(domainInstance.getChandler(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("btransflag") %>: 
					</td> 
					<td> 
						<input name="btransflag" type="text" id="btransflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBtransflag(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("cmaker") %>: 
					</td> 
					<td> 
						<input name="cmaker" type="text" id="cmaker" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmaker(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("dkeepdate") %>: 
					</td> 
					<td> 
						<input name="dkeepdate" type="text" id="dkeepdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDkeepdate(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("bpufirst") %>: 
					</td> 
					<td> 
						<input name="bpufirst" type="text" id="bpufirst" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBpufirst(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("imquantity") %>: 
					</td> 
					<td> 
						<input name="imquantity" type="text" id="imquantity" value="<%=StringUtil.formatDouble(domainInstance.getImquantity(),2)%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("darvdate") %>: 
					</td> 
					<td> 
						<input name="darvdate" type="text" id="darvdate" value="<%=TimeUtil.date2str(domainInstance.getDarvdate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cchkcode") %>: 
					</td> 
					<td> 
						<input name="cchkcode" type="text" id="cchkcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCchkcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dchkdate") %>: 
					</td> 
					<td> 
						<input name="dchkdate" type="text" id="dchkdate" value="<%=TimeUtil.date2str(domainInstance.getDchkdate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cchkperson") %>: 
					</td> 
					<td> 
						<input name="cchkperson" type="text" id="cchkperson" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCchkperson(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("bisstqc") %>: 
					</td> 
					<td> 
						<input name="bisstqc" type="text" id="bisstqc" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBisstqc(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("gspcheck") %>: 
					</td> 
					<td> 
						<input name="gspcheck" type="text" id="gspcheck" value="<%=StringUtil.getNotEmptyStr(domainInstance.getGspcheck(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ipurorderid") %>: 
					</td> 
					<td> 
						<input name="ipurorderid" type="text" id="ipurorderid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIpurorderid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ipurarriveid") %>: 
					</td> 
					<td> 
						<input name="ipurarriveid" type="text" id="ipurarriveid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIpurarriveid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iarriveid") %>: 
					</td> 
					<td> 
						<input name="iarriveid" type="text" id="iarriveid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIarriveid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("isalebillid") %>: 
					</td> 
					<td> 
						<input name="isalebillid" type="text" id="isalebillid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIsalebillid(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("itaxrate") %>: 
					</td> 
					<td> 
						<input name="itaxrate" type="text" id="itaxrate" value="<%=StringUtil.formatDouble(domainInstance.getItaxrate(),2)%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("cexch_name") %>: 
					</td> 
					<td> 
						<input name="cexch_name" type="text" id="cexch_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCexch_name(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bomfirst") %>: 
					</td> 
					<td> 
						<input name="bomfirst" type="text" id="bomfirst" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBomfirst(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bfrompreyear") %>: 
					</td> 
					<td> 
						<input name="bfrompreyear" type="text" id="bfrompreyear" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBfrompreyear(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bislsquery") %>: 
					</td> 
					<td> 
						<input name="bislsquery" type="text" id="bislsquery" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBislsquery(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("biscomplement") %>: 
					</td> 
					<td> 
						<input name="biscomplement" type="text" id="biscomplement" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBiscomplement(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("idiscounttaxtype") %>: 
					</td> 
					<td> 
						<input name="idiscounttaxtype" type="text" id="idiscounttaxtype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIdiscounttaxtype(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("iverifystate") %>: 
					</td> 
					<td> 
						<input name="iverifystate" type="text" id="iverifystate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIverifystate(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("cmodifyperson") %>: 
					</td> 
					<td> 
						<input name="cmodifyperson" type="text" id="cmodifyperson" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmodifyperson(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dmodifydate") %>: 
					</td> 
					<td> 
						<input name="dmodifydate" type="text" id="dmodifydate" value="<%=TimeUtil.date2str(domainInstance.getDmodifydate(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dnmaketime") %>: 
					</td> 
					<td> 
						<input name="dnmaketime" type="text" id="dnmaketime" value="<%=TimeUtil.date2str(domainInstance.getDnmaketime(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dnmodifytime") %>: 
					</td> 
					<td> 
						<input name="dnmodifytime" type="text" id="dnmodifytime" value="<%=TimeUtil.date2str(domainInstance.getDnmodifytime(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dnverifytime") %>: 
					</td> 
					<td> 
						<input name="dnverifytime" type="text" id="dnverifytime" value="<%=TimeUtil.date2str(domainInstance.getDnverifytime(),"yyyy-MM-dd")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bredvouch") %>: 
					</td> 
					<td> 
						<input name="bredvouch" type="text" id="bredvouch" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBredvouch(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cvenpuomprotocol") %>: 
					</td> 
					<td> 
						<input name="cvenpuomprotocol" type="text" id="cvenpuomprotocol" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCvenpuomprotocol(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("icreditperiod") %>: 
					</td> 
					<td> 
						<input name="icreditperiod" type="text" id="icreditperiod" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIcreditperiod(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("bcredit") %>: 
					</td> 
					<td> 
						<input name="bcredit" type="text" id="bcredit" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBcredit(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("cpzid") %>: 
					</td> 
					<td> 
						<input name="cpzid" type="text" id="cpzid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpzid(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csourcels") %>: 
					</td> 
					<td> 
						<input name="csourcels" type="text" id="csourcels" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsourcels(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csourcecodels") %>: 
					</td> 
					<td> 
						<input name="csourcecodels" type="text" id="csourcecodels" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsourcecodels(),"")%>" size="20"  > 
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
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
		
		<!-- 设置修改时哪些字段不可修改 --> 
		<script type="text/javascript"> 
		if(true==<%=isModify%>) 
		{ 
			setReadonly("ccode"); 
		} 
		</script> 
	</body> 
</html> 
