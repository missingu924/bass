<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.util.TimeUtil"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.bass.obj.StRepKctzMxObj"%> 
<%@page import="com.wuyg.auth.obj.AuthUserObj"%> 
<%@page import="com.wuyg.common.util.SystemConstant"%>  
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	StRepKctzMxObj domainInstance = (StRepKctzMxObj) request.getAttribute("domainInstance");  
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
					<%=domainInstance.getPropertyCnName("cvouchname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvouchname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cwhcode") %>: 
				</td> 
				<td><%=DictionaryUtil.getDictValueByDictKey("U8仓库字典",domainInstance.getCwhcode()+"",true)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cinvcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ddate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dveridate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDveridate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbustype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbustype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatch") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbatch())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iqcqty") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIqcqty(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iinqtty") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIinqtty(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ioutqtty") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getIoutqtty(),2)%></td> 
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
					<%=domainInstance.getPropertyCnName("cdefine22") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine22())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine23") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine23())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine24") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine24())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine25") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine25())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine26") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCdefine26(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine27") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCdefine27(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine28") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine28())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine29") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine29())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine30") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine30())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine31") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine31())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine32") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine32())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine33") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine33())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine34") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine34())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine35") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefine35())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine36") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getCdefine36(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefine37") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getCdefine37(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty1") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCbatchproperty1(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty2") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCbatchproperty2(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty3") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCbatchproperty3(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty4") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCbatchproperty4(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty5") %>: 
				</td> 
					<td><%=StringUtil.formatDouble(domainInstance.getCbatchproperty5(),2)%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty6") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty6())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty7") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty7())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty8") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty8())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty9") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbatchproperty9())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbatchproperty10") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getCbatchproperty10(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree1") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree1())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree2") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree2())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree3") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree3())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree4") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree4())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree5") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree5())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree6") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree6())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree7") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree7())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree8") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree8())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree9") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree9())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfree10") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfree10())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cvmivencode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvmivencode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cvmivenname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCvmivenname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dcheckdate") %>: 
				</td> 
					<td><%=TimeUtil.date2str(domainInstance.getDcheckdate(),"yyyy-MM-dd")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccheckcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcheckcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccheckpersonname") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcheckpersonname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("crejectcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCrejectcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dvalidatedate") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getDvalidatedate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbmemo") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbmemo())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("isotype") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIsotype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csocode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsocode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("isoseq") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIsoseq())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("isodid") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getIsodid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdemandmemo") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdemandmemo())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cmolotcode") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCmolotcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cshipaddress") %>: 
				</td> 
					<td><%=StringUtil.getNotEmptyStr(domainInstance.getCshipaddress())%></td> 
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
