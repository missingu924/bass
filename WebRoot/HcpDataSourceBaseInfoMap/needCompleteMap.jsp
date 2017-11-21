<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%>
<%@page import="com.wuyg.common.dao.BaseDbObj"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.u8.obj.RdrecordObj"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.wuyg.common.dao.IBaseDAO"%>
<%@page import="com.wuyg.common.dao.DefaultBaseDAO"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapObj"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapObjExtended"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	RdrecordObj domainInstance = new RdrecordObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 哪个外部接口
	String src_ds_code = (String) request.getAttribute("src_ds_code");
	
	// 对照到哪个接口
	String dst_ds_code = (String) request.getAttribute("dst_ds_code");

	// 需要补充完善的对照关系
	Map<String, Integer> needCompleteMap = (LinkedHashMap<String, Integer>) request.getAttribute("needCompleteMap");
%>
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%=domainInstance.getCnName()%></title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<link href="../css/table.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<!-- 表格标题 -->
		<table width="98%" align="center" class="title_table">
			<tr>
				<td>
					<img src="../images/excel.png" width="18" height="18" align="absmiddle">
					&nbsp;&nbsp;<%=src_ds_code%>
					- 数据导入，发现有以下对照关系需要补充，请补充完善后再重新导入
				</td>
			</tr>
		</table>

		<!-- 表格标题 -->
		<%
			IBaseDAO baseInfoMapDao = new DefaultBaseDAO(HcpDataSourceBaseInfoMapObj.class);

			Iterator<String> iter = needCompleteMap.keySet().iterator();
			while (iter.hasNext())
			{
				String base_info_type = iter.next();
				Integer num = needCompleteMap.get(base_info_type);

				HcpDataSourceBaseInfoMapObjExtended baseInfoMap = new HcpDataSourceBaseInfoMapObjExtended();
				baseInfoMap.setSrc_ds_code(src_ds_code);
				baseInfoMap.setSrc_base_info_type_code(base_info_type);
				baseInfoMap.setDst_ds_code(dst_ds_code);
				baseInfoMap.setSrc_base_info_type_code(base_info_type);
				Object obj = baseInfoMap.searchByInstance();
				if (obj != null)
				{
					baseInfoMap = (HcpDataSourceBaseInfoMapObjExtended) obj;
				}
		%>
		<table width="98%" align="center" class="alert_table">
			<tr>
				<td>
					<img src="../images/svg/light/orange/32/alert.png" width="18" height="18" align="absmiddle">
					&nbsp;&nbsp;
					<span style="font-size: 24px; font-weight: bold"><%=num%></span>条数据因【<%=base_info_type%>】没有对照关系无法导入，请
					<a href="javascript:winOpen('<%=contextPath%>/HcpDataSourceBaseInfoMapDetail/Servlet?method=list4this&showSearchConditionTable=false&isFromUrl=true&dont_mapped=true&map_id=<%=baseInfoMap.getId()%>')">点击这里</a>补充
				</td>
			</tr>
		</table>
		<%
			}
		%>
		<!-- 返回操作栏 -->
		<jsp:include page="../ToolBar/back_toolbar.jsp"/>
	</body>
</html>
