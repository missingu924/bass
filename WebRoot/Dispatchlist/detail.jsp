<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.u8.obj.DispatchlistObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	DispatchlistObj domainInstance = (DispatchlistObj) request.getAttribute("domainInstance");  
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
					<%=domainInstance.getPropertyCnName("cdlcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdlcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cvouchtype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvouchtype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cstcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCstcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ddate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("crdcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCrdcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdepcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdepcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpersoncode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpersoncode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("sbvid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getSbvid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csbvcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsbvcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csocode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsocode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccuscode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcuscode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpaycode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpaycode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csccode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsccode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cshipaddress") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCshipaddress())%></td> 
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
					<%=domainInstance.getPropertyCnName("itaxrate") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getItaxrate(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bfirst") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBfirst())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("breturnflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBreturnflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bsettleall") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBsettleall())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cmemo") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCmemo())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csaleout") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsaleout())%></td> 
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
					<%=domainInstance.getPropertyCnName("cverifier") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCverifier())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cmaker") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCmaker())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("inetlock") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getInetlock(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("isale") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIsale())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccusname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcusname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ivtid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIvtid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ufts") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getUfts())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbustype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbustype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccloser") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcloser())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("caccounter") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCaccounter())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccrechpname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcrechpname())%></td> 
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
					<%=domainInstance.getPropertyCnName("biafirst") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBiafirst())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ioutgolden") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIoutgolden())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cgatheringplan") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCgatheringplan())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dcreditstart") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDcreditstart(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dgatheringdate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDgatheringdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("icreditdays") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIcreditdays())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bcredit") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBcredit())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("caddcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCaddcode())%></td> 
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
					<%=domainInstance.getPropertyCnName("iswfcontrolled") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIswfcontrolled())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("icreditstate") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIcreditstate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("barfirst") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBarfirst())%></td> 
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
					<%=domainInstance.getPropertyCnName("ccusperson") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcusperson())%></td> 
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
					<%=domainInstance.getPropertyCnName("csvouchtype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsvouchtype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iflowid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIflowid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bsigncreate") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBsigncreate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bcashsale") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBcashsale())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cgathingcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCgathingcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cchanger") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCchanger())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cchangememo") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCchangememo())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("outid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getOutid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bmustbook") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBmustbook())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbookdepcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbookdepcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbooktype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbooktype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bsaused") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBsaused())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bneedbill") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBneedbill())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("baccswitchflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBaccswitchflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iprintcount") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIprintcount())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccuspersoncode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcuspersoncode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csourcecode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsourcecode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bsaleoutcreatebill") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBsaleoutcreatebill())%></td> 
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
					<%=domainInstance.getPropertyCnName("csscode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsscode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cinvoicecompany") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCinvoicecompany())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("febweight") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getFebweight(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cebweightunit") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCebweightunit())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cebexpresscode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCebexpresscode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iebexpresscoid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIebexpresscoid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("separateid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getSeparateid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bnottogoldtax") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBnottogoldtax())%></td> 
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
