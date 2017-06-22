<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.u8.obj.ApClosebillObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	ApClosebillObj domainInstance = (ApClosebillObj) request.getAttribute("domainInstance");  
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO); 
	// 该功能路径  
	String basePath = domainInstance.getBasePath();  
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
	</head> 
	<body> 
		<!-- 表格标题 --> 
		<table width="700" align="center" class="title_table"> 
			<tr> 
				<td> 
					<%=domainInstance.getCnName()%>信息 
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="700" align="center" class="detail_table detail_table-bordered"> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cvouchtype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvouchtype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cvouchid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvouchid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dvouchdate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDvouchdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iperiod") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIperiod())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdwcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdwcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdeptcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdeptcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cperson") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCperson())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("citem_class") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCitem_class())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("citemcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCitemcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csscode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsscode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cnoteno") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCnoteno())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccovouchtype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcovouchtype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccovouchid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcovouchid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdigest") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdigest())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbankaccount") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbankaccount())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cexch_name") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCexch_name())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iexchrate") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIexchrate(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iamount") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIamount(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iamount_f") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIamount_f(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iramount") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIramount(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iramount_f") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIramount_f(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("coperator") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCoperator())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccancelman") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcancelman())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("crpman") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCrpman())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bprepay") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBprepay())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bstartflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBstartflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("corderno") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCorderno())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cprecode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCprecode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ipayforother") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIpayforother())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csrcflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsrcflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpzid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpzid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bsend") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBsend())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("breceived") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBreceived())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csitemcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsitemcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccancelno") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcancelno())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbank") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbank())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cnatbank") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCnatbank())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cnatbankaccount") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCnatbankaccount())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bfrombank") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBfrombank())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("btobank") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBtobank())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bsure") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBsure())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("vt_id") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getVt_id())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccheckman") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcheckman())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine1") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine1())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine2") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine2())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine3") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine3())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine4") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getCdefine4(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine5") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine5())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine6") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getCdefine6(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine7") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCdefine7(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine8") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine8())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine9") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine9())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine10") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine10())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine11") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine11())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine12") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine12())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine13") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine13())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine14") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine14())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine15") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine15())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine16") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCdefine16(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ufts") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getUfts())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("citemname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCitemname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccontracttype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcontracttype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccontractid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcontractid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iamount_s") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIamount_s(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iswfcontrolled") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIswfcontrolled())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("isource") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIsource())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("sdlcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getSdlcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("registerflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getRegisterflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iverifystate") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIverifystate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ireturncount") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIreturncount())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dcreatesystime") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDcreatesystime(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dverifysystime") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDverifysystime(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dmodifysystime") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDmodifysystime(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cmodifier") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCmodifier())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dmoddate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDmoddate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dverifydate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDverifydate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ibg_overflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIbg_overflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_auditor") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_auditor())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_audittime") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_audittime())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("controlresult") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getControlresult())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_itemcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_itemcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_itemname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_itemname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkey1") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey1())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkeyname1") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname1())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkey2") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey2())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkeyname2") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname2())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkey3") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey3())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkeyname3") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname3())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibercode1") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode1())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibername1") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername1())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibercode2") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode2())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibername2") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername2())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibercode3") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode3())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibername3") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername3())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ibg_ctrl") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIbg_ctrl())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_auditopinion") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_auditopinion())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("capplycode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCapplycode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpznum") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpznum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("doutbilldate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDoutbilldate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkey4") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey4())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkeyname4") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname4())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkey5") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey5())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkeyname5") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname5())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkey6") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkey6())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_caliberkeyname6") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_caliberkeyname6())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibercode4") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode4())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibername4") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername4())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibercode5") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode5())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibername5") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername5())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibercode6") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibercode6())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbg_calibername6") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbg_calibername6())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iprintcount") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIprintcount())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("creservedeptcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCreservedeptcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bdealmode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBdealmode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ibustype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIbustype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ipaytype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIpaytype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cagentcuscode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCagentcuscode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csysbarcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsysbarcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccurrentauditor") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcurrentauditor())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("lacctid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getLacctid())%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"> 
			<jsp:param name="basePath" value="<%=domainInstance.getBasePath() %>"/> 
			<jsp:param name="keyColumnName" value="<%=domainInstance.findKeyColumnName() %>"/> 
			<jsp:param name="keyValue" value="<%=domainInstance.findKeyValue() %>"/> 
		</jsp:include> 
	</body> 
</html> 
