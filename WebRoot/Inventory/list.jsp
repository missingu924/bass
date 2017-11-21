<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.wuyg.dictionary.DictionaryUtil"%> 
<%@page import="com.u8.obj.InventoryObj"%> 
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	InventoryObj domainInstance = (InventoryObj) request.getAttribute("domainInstance"); 
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
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" /> 
		<title><%=domainInstance.getCnName() %>列表</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=list4this"> 
			 
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td align="left"> 
						<%=domainInstance.getPropertyCnName("cinvcode") %> 
						<input name="cinvcode" type="text" id="cinvcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvcode())%>" size="20" > 
						&nbsp;  
						<%=domainInstance.getPropertyCnName("cinvccode") %> 
						<%=DictionaryUtil.getInputHtml("U8存货类别字典", "cinvccode", StringUtil.getNotEmptyStr(domainInstance.getCinvccode(), ""))%> 
						&nbsp;  
						<%=domainInstance.getPropertyCnName("cinvname") %> 
						<input name="cinvname" type="text" id="cinvname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinvname())%>" size="20" > 
						&nbsp;  
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
					</td> 
					<td align="right"> 
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this')"> 
						<input name="uploadButton" type="button" class="button button_upload" value="导入" onClick="openBigModalDialog('<%=contextPath%>/ExcelParser/uploadFile.jsp?basedbobj_class=<%=domainInstance.getClass().getCanonicalName()%>')">
						<%if(list.size()>0){ %> 
						<input name="deleteAllButton" type="button" class="button button_delete" value="全删" onClick="if(confirm('您确认要删除本次查询出的 <%=list.size() %> 条数据吗?')){$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=deleteAll4this').submit();}"> 
						<%} %> 
					</td> 
				</tr> 
			</table> 
 
			<table class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th><%=domainInstance.getPropertyCnName("cinvcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvccode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvname") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvstd") %></th> 
						<th><%=domainInstance.getPropertyCnName("cvencode") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccomunitcode") %></th> 
						<!-- 
						<th><%=domainInstance.getPropertyCnName("cinvaddcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("creplaceitem") %></th> 
						<th><%=domainInstance.getPropertyCnName("cposition") %></th> 
						<th><%=domainInstance.getPropertyCnName("bsale") %></th> 
						<th><%=domainInstance.getPropertyCnName("bpurchase") %></th> 
						<th><%=domainInstance.getPropertyCnName("bself") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcomsume") %></th> 
						<th><%=domainInstance.getPropertyCnName("bproducing") %></th> 
						<th><%=domainInstance.getPropertyCnName("bservice") %></th> 
						<th><%=domainInstance.getPropertyCnName("baccessary") %></th> 
						<th><%=domainInstance.getPropertyCnName("itaxrate") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvweight") %></th> 
						<th><%=domainInstance.getPropertyCnName("ivolume") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvrcost") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvsprice") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvscost") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvlscost") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvncost") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvadvance") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvbatch") %></th> 
						<th><%=domainInstance.getPropertyCnName("isafenum") %></th> 
						<th><%=domainInstance.getPropertyCnName("itopsum") %></th> 
						<th><%=domainInstance.getPropertyCnName("ilowsum") %></th> 
						<th><%=domainInstance.getPropertyCnName("ioverstock") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvabc") %></th> 
						<th><%=domainInstance.getPropertyCnName("binvquality") %></th> 
						<th><%=domainInstance.getPropertyCnName("binvbatch") %></th> 
						<th><%=domainInstance.getPropertyCnName("binventrust") %></th> 
						<th><%=domainInstance.getPropertyCnName("binvoverstock") %></th> 
						<th><%=domainInstance.getPropertyCnName("dsdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("dedate") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree1") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree2") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine1") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine2") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine3") %></th> 
						<th><%=domainInstance.getPropertyCnName("i_id") %></th> 
						<th><%=domainInstance.getPropertyCnName("binvtype") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvmpcost") %></th> 
						<th><%=domainInstance.getPropertyCnName("cquality") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvsalecost") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvscost1") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvscost2") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvscost3") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree3") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree4") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree5") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree6") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree7") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree8") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree9") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfree10") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccreateperson") %></th> 
						<th><%=domainInstance.getPropertyCnName("cmodifyperson") %></th> 
						<th><%=domainInstance.getPropertyCnName("dmodifydate") %></th> 
						<th><%=domainInstance.getPropertyCnName("fsubscribepoint") %></th> 
						<th><%=domainInstance.getPropertyCnName("fvagquantity") %></th> 
						<th><%=domainInstance.getPropertyCnName("cvaluetype") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfixexch") %></th> 
						<th><%=domainInstance.getPropertyCnName("foutexcess") %></th> 
						<th><%=domainInstance.getPropertyCnName("finexcess") %></th> 
						<th><%=domainInstance.getPropertyCnName("imassdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("iwarndays") %></th> 
						<th><%=domainInstance.getPropertyCnName("fexpensesexch") %></th> 
						<th><%=domainInstance.getPropertyCnName("btrack") %></th> 
						<th><%=domainInstance.getPropertyCnName("bserial") %></th> 
						<th><%=domainInstance.getPropertyCnName("bbarcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("iid") %></th> 
						<th><%=domainInstance.getPropertyCnName("cbarcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine4") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine5") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine6") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine7") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine8") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine9") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine10") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine11") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine12") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine13") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine14") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine15") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdefine16") %></th> 
						<th><%=domainInstance.getPropertyCnName("igrouptype") %></th> 
						<th><%=domainInstance.getPropertyCnName("cgroupcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("casscomunitcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("csacomunitcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpucomunitcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cstcomunitcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccacomunitcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cfrequency") %></th> 
						<th><%=domainInstance.getPropertyCnName("ifrequency") %></th> 
						<th><%=domainInstance.getPropertyCnName("idays") %></th> 
						<th><%=domainInstance.getPropertyCnName("dlastdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("iwastage") %></th> 
						<th><%=domainInstance.getPropertyCnName("bsolitude") %></th> 
						<th><%=domainInstance.getPropertyCnName("centerprise") %></th> 
						<th><%=domainInstance.getPropertyCnName("caddress") %></th> 
						<th><%=domainInstance.getPropertyCnName("cfile") %></th> 
						<th><%=domainInstance.getPropertyCnName("clabel") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccheckout") %></th> 
						<th><%=domainInstance.getPropertyCnName("clicence") %></th> 
						<th><%=domainInstance.getPropertyCnName("bspecialties") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdefwarehouse") %></th> 
						<th><%=domainInstance.getPropertyCnName("ihighprice") %></th> 
						<th><%=domainInstance.getPropertyCnName("iexpsalerate") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpricegroup") %></th> 
						<th><%=domainInstance.getPropertyCnName("coffergrade") %></th> 
						<th><%=domainInstance.getPropertyCnName("iofferrate") %></th> 
						<th><%=domainInstance.getPropertyCnName("cmonth") %></th> 
						<th><%=domainInstance.getPropertyCnName("iadvancedate") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccurrencyname") %></th> 
						<th><%=domainInstance.getPropertyCnName("cproduceaddress") %></th> 
						<th><%=domainInstance.getPropertyCnName("cproducenation") %></th> 
						<th><%=domainInstance.getPropertyCnName("cregisterno") %></th> 
						<th><%=domainInstance.getPropertyCnName("centerno") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpackingtype") %></th> 
						<th><%=domainInstance.getPropertyCnName("cenglishname") %></th> 
						<th><%=domainInstance.getPropertyCnName("bpropertycheck") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpreparationtype") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccommodity") %></th> 
						<th><%=domainInstance.getPropertyCnName("irecipebatch") %></th> 
						<th><%=domainInstance.getPropertyCnName("cnotpatentname") %></th> 
						<th><%=domainInstance.getPropertyCnName("pubufts") %></th> 
						<th><%=domainInstance.getPropertyCnName("bpromotsales") %></th> 
						<th><%=domainInstance.getPropertyCnName("iplanpolicy") %></th> 
						<th><%=domainInstance.getPropertyCnName("iropmethod") %></th> 
						<th><%=domainInstance.getPropertyCnName("ibatchrule") %></th> 
						<th><%=domainInstance.getPropertyCnName("fbatchincrement") %></th> 
						<th><%=domainInstance.getPropertyCnName("iassureprovidedays") %></th> 
						<th><%=domainInstance.getPropertyCnName("iteststyle") %></th> 
						<th><%=domainInstance.getPropertyCnName("idtmethod") %></th> 
						<th><%=domainInstance.getPropertyCnName("fdtrate") %></th> 
						<th><%=domainInstance.getPropertyCnName("fdtnum") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdtunit") %></th> 
						<th><%=domainInstance.getPropertyCnName("idtstyle") %></th> 
						<th><%=domainInstance.getPropertyCnName("iqtmethod") %></th> 
						<th><%=domainInstance.getPropertyCnName("pictureguid") %></th> 
						<th><%=domainInstance.getPropertyCnName("bplaninv") %></th> 
						<th><%=domainInstance.getPropertyCnName("bproxyforeign") %></th> 
						<th><%=domainInstance.getPropertyCnName("batomodel") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckitem") %></th> 
						<th><%=domainInstance.getPropertyCnName("bptomodel") %></th> 
						<th><%=domainInstance.getPropertyCnName("bequipment") %></th> 
						<th><%=domainInstance.getPropertyCnName("cproductunit") %></th> 
						<th><%=domainInstance.getPropertyCnName("forderuplimit") %></th> 
						<th><%=domainInstance.getPropertyCnName("cmassunit") %></th> 
						<th><%=domainInstance.getPropertyCnName("fretailprice") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvdepcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("ialteradvance") %></th> 
						<th><%=domainInstance.getPropertyCnName("falterbasenum") %></th> 
						<th><%=domainInstance.getPropertyCnName("cplanmethod") %></th> 
						<th><%=domainInstance.getPropertyCnName("bmps") %></th> 
						<th><%=domainInstance.getPropertyCnName("brop") %></th> 
						<th><%=domainInstance.getPropertyCnName("breplan") %></th> 
						<th><%=domainInstance.getPropertyCnName("csrpolicy") %></th> 
						<th><%=domainInstance.getPropertyCnName("bbillunite") %></th> 
						<th><%=domainInstance.getPropertyCnName("isupplyday") %></th> 
						<th><%=domainInstance.getPropertyCnName("fsupplymulti") %></th> 
						<th><%=domainInstance.getPropertyCnName("fminsupply") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcutmantissa") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvpersoncode") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvtfid") %></th> 
						<th><%=domainInstance.getPropertyCnName("cengineerfigno") %></th> 
						<th><%=domainInstance.getPropertyCnName("bintotalcost") %></th> 
						<th><%=domainInstance.getPropertyCnName("isupplytype") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree1") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree2") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree3") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree4") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree5") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree6") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree7") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree8") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree9") %></th> 
						<th><%=domainInstance.getPropertyCnName("bconfigfree10") %></th> 
						<th><%=domainInstance.getPropertyCnName("idtlevel") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdtaql") %></th> 
						<th><%=domainInstance.getPropertyCnName("bperioddt") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdtperiod") %></th> 
						<th><%=domainInstance.getPropertyCnName("ibigmonth") %></th> 
						<th><%=domainInstance.getPropertyCnName("ibigday") %></th> 
						<th><%=domainInstance.getPropertyCnName("ismallmonth") %></th> 
						<th><%=domainInstance.getPropertyCnName("ismallday") %></th> 
						<th><%=domainInstance.getPropertyCnName("boutinvdt") %></th> 
						<th><%=domainInstance.getPropertyCnName("bbackinvdt") %></th> 
						<th><%=domainInstance.getPropertyCnName("ienddtstyle") %></th> 
						<th><%=domainInstance.getPropertyCnName("bdtwarninv") %></th> 
						<th><%=domainInstance.getPropertyCnName("fbacktaxrate") %></th> 
						<th><%=domainInstance.getPropertyCnName("cciqcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cwgroupcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cwunit") %></th> 
						<th><%=domainInstance.getPropertyCnName("fgrossw") %></th> 
						<th><%=domainInstance.getPropertyCnName("cvgroupcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cvunit") %></th> 
						<th><%=domainInstance.getPropertyCnName("flength") %></th> 
						<th><%=domainInstance.getPropertyCnName("fwidth") %></th> 
						<th><%=domainInstance.getPropertyCnName("fheight") %></th> 
						<th><%=domainInstance.getPropertyCnName("idtucounter") %></th> 
						<th><%=domainInstance.getPropertyCnName("idtdcounter") %></th> 
						<th><%=domainInstance.getPropertyCnName("ibatchcounter") %></th> 
						<th><%=domainInstance.getPropertyCnName("cshopunit") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpurpersoncode") %></th> 
						<th><%=domainInstance.getPropertyCnName("bimportmedicine") %></th> 
						<th><%=domainInstance.getPropertyCnName("bfirstbusimedicine") %></th> 
						<th><%=domainInstance.getPropertyCnName("bforeexpland") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvplancode") %></th> 
						<th><%=domainInstance.getPropertyCnName("fconvertrate") %></th> 
						<th><%=domainInstance.getPropertyCnName("dreplacedate") %></th> 
						<th><%=domainInstance.getPropertyCnName("binvmodel") %></th> 
						<th><%=domainInstance.getPropertyCnName("bkccutmantissa") %></th> 
						<th><%=domainInstance.getPropertyCnName("breceiptbydt") %></th> 
						<th><%=domainInstance.getPropertyCnName("iimptaxrate") %></th> 
						<th><%=domainInstance.getPropertyCnName("iexptaxrate") %></th> 
						<th><%=domainInstance.getPropertyCnName("bexpsale") %></th> 
						<th><%=domainInstance.getPropertyCnName("idrawbatch") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckbsatp") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvprojectcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("itestrule") %></th> 
						<th><%=domainInstance.getPropertyCnName("crulecode") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree1") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree2") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree3") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree4") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree5") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree6") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree7") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree8") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree9") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckfree10") %></th> 
						<th><%=domainInstance.getPropertyCnName("bbommain") %></th> 
						<th><%=domainInstance.getPropertyCnName("bbomsub") %></th> 
						<th><%=domainInstance.getPropertyCnName("bproductbill") %></th> 
						<th><%=domainInstance.getPropertyCnName("icheckatp") %></th> 
						<th><%=domainInstance.getPropertyCnName("iinvatpid") %></th> 
						<th><%=domainInstance.getPropertyCnName("iplantfday") %></th> 
						<th><%=domainInstance.getPropertyCnName("ioverlapday") %></th> 
						<th><%=domainInstance.getPropertyCnName("bpiece") %></th> 
						<th><%=domainInstance.getPropertyCnName("bsrvitem") %></th> 
						<th><%=domainInstance.getPropertyCnName("bsrvfittings") %></th> 
						<th><%=domainInstance.getPropertyCnName("fmaxsupply") %></th> 
						<th><%=domainInstance.getPropertyCnName("fminsplit") %></th> 
						<th><%=domainInstance.getPropertyCnName("bspecialorder") %></th> 
						<th><%=domainInstance.getPropertyCnName("btracksalebill") %></th> 
						<th><%=domainInstance.getPropertyCnName("cinvmnemcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("iplandefault") %></th> 
						<th><%=domainInstance.getPropertyCnName("ipfbatchqty") %></th> 
						<th><%=domainInstance.getPropertyCnName("iallocateprintdgt") %></th> 
						<th><%=domainInstance.getPropertyCnName("bcheckbatch") %></th> 
						<th><%=domainInstance.getPropertyCnName("bmngoldpart") %></th> 
						<th><%=domainInstance.getPropertyCnName("ioldpartmngrule") %></th> 
						 -->
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							InventoryObj o = (InventoryObj) list.get(i); 
				%> 
				<tr> 
					<td> 
						<a href="javascript:openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=detail4this&cinvcode=<%=o.getCinvccode()%>')"> <%=StringUtil.getNotEmptyStr(o.getCinvcode())%> </a> 
					</td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("U8存货类别字典",o.getCinvccode())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getCinvname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCinvstd())%></td> 
					<td><%=DictionaryUtil.getDictValueByDictKey("U8供应商字典",o.getCvencode())%></td>  
					<td><%=DictionaryUtil.getDictValueByDictKey("U8计量单位字典",o.getCcomunitcode())%></td>
				</tr> 
				<% 
					} 
				%> 
			</table> 
 
			<!-- 翻页操作栏 --> 
			<jsp:include page="../ToolBar/pagination_toolbar.jsp"> 
				<jsp:param name="basePath" value="<%=basePath%>"/> 
			</jsp:include> 
 
		</form>  
 
	</body> 
</html> 
