<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.u8.obj.Rdrecord01Obj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	Rdrecord01Obj domainInstance = (Rdrecord01Obj) request.getAttribute("domainInstance");  
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
					<%=domainInstance.getPropertyCnName("brdflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBrdflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cvouchtype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvouchtype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbustype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbustype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csource") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsource())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbuscode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbuscode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cwhcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCwhcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ddate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcode())%></td> 
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
					<%=domainInstance.getPropertyCnName("cptcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCptcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cstcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCstcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccuscode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcuscode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cvencode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvencode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cordercode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCordercode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("carvcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCarvcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbillcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbillcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdlcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdlcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cprobatch") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCprobatch())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("chandler") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getChandler())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cmemo") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCmemo())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("btransflag") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBtransflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("caccounter") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCaccounter())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cmaker") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCmaker())%></td> 
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
					<%=domainInstance.getPropertyCnName("dkeepdate") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDkeepdate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dveridate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDveridate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bpufirst") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBpufirst())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("biafirst") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBiafirst())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("imquantity") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getImquantity(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("darvdate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDarvdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cchkcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCchkcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dchkdate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDchkdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cchkperson") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCchkperson())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("vt_id") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getVt_id())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bisstqc") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBisstqc())%></td> 
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
					<%=domainInstance.getPropertyCnName("gspcheck") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getGspcheck())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ipurorderid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIpurorderid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ipurarriveid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIpurarriveid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iarriveid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIarriveid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("isalebillid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIsalebillid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ufts") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getUfts())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("itaxrate") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getItaxrate(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iexchrate") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIexchrate(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cexch_name") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCexch_name())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bomfirst") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBomfirst())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bfrompreyear") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBfrompreyear())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bislsquery") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBislsquery())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("biscomplement") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBiscomplement())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("idiscounttaxtype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIdiscounttaxtype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ireturncount") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIreturncount())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iverifystate") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIverifystate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iswfcontrolled") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIswfcontrolled())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cmodifyperson") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCmodifyperson())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dmodifydate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDmodifydate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dnmaketime") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDnmaketime(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dnmodifytime") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDnmodifytime(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dnverifytime") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDnverifytime(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bredvouch") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBredvouch())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cvenpuomprotocol") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvenpuomprotocol())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dcreditstart") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDcreditstart(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("icreditperiod") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIcreditperiod())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dgatheringdate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDgatheringdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bcredit") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getBcredit())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iflowid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIflowid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpzid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpzid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csourcels") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsourcels())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csourcecodels") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsourcecodels())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iprintcount") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIprintcount())%></td> 
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
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"> 
			<jsp:param name="basePath" value="<%=domainInstance.getBasePath() %>"/> 
			<jsp:param name="keyColumnName" value="<%=domainInstance.findKeyColumnName() %>"/> 
			<jsp:param name="keyValue" value="<%=domainInstance.findKeyValue() %>"/> 
		</jsp:include> 
	</body> 
</html> 
