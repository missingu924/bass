<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.dictionary.service.DictionaryService"%>
<%@page import="com.wuyg.dictionary.service.IDictionaryService"%>
<%@page import="com.excelparser.obj.ExcelParserObj"%>
<%@page import="com.wuyg.common.dao.BaseDbObj"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	ExcelParserObj domainInstance = new ExcelParserObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 解析器名称 或 basedbobj 类全名
	String parser_name = StringUtil.getNotEmptyStr(request.getParameter("parser_name"));
	String basedbobj_class = StringUtil.getNotEmptyStr(request.getParameter("basedbobj_class"));

	BaseDbObj basedbobj = (BaseDbObj) Thread.currentThread().getContextClassLoader().loadClass(basedbobj_class).newInstance();
	if (StringUtil.isEmpty(parser_name))
	{
		parser_name = basedbobj.getCnName();
	}

	// 数据源
	String src_ds_code = request.getParameter("src_ds_code");
%>
<html>
	<head>
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%=domainInstance.getCnName()%></title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<link href="../css/table.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
		function preview4this()
		{
			if(!checkNull("src_ds_code","数据来源")) return false; 
			
			var data_source_type=$("input[name='data_source_type']:checked").val(); 
			if(data_source_type=='excel')
			{
				if(!checkNull("file_upload","数据文件")) return false;
				$("#addOrModifyForm").attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=uploadFile');
			} 
			else if(data_source_type=='db')
			{
				$("#addOrModifyForm").attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=previewFromDb');
			}
			
			$("#addOrModifyForm").submit();
		}
		</script>
	</head>
	<body>
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=uploadFile" enctype="multipart/form-data" method="post">

			<!-- 表格标题 -->
			<table width="700" align="center" class="title_table">
				<tr>
					<td>
						<img src="../images/excel.png" width="18" height="18" align="absmiddle">
						&nbsp;&nbsp;<%=parser_name%>
						- 数据导入
					</td>
				</tr>
			</table>

			<!-- 详细信息 -->
			<table width="700" align="center" class="detail_table detail_table-bordered">
				<input type="hidden" id="parser_name" name="parser_name" value="<%=parser_name%>">
				<input type="hidden" id="basedbobj_class" name="basedbobj_class" value="<%=basedbobj_class%>">
				<!-- 继承来自上一个请求的参数 -->
				<%
					Enumeration parameters = request.getParameterNames();
					while (parameters.hasMoreElements())
					{
						String paramName = parameters.nextElement() + "";
						String paramValue = request.getParameter(paramName);
						
						String paramCnName = basedbobj.getPropertyCnName(paramName);
						if(!StringUtil.isEmpty(paramCnName))
						{
							out.println("<tr><td>"+paramCnName+":</td><td>"+paramValue+"</td></tr>");
						}
						
						out.println("<input type='hidden' id='" + paramName + "' name='" + paramName + "' value='" + paramValue + "'>");
					}
				%>
				<tr>
					<td style="width: 200px;">
						请选择取数方式:
					</td>
					<td>
						<input type="radio" name="data_source_type" id="data_source_type" value="excel" onclick="data_source_type_click()">通过Excel文件导入
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="data_source_type" id="data_source_type" value="db" onclick="data_source_type_click()">通过中间库取数
					</td>
				</tr>
				<tr id="ds_tr" style="display:none">
					<td>
						请选择数据来源:
					</td>
					<td>
						<!-- 字典中排除 HCP_DB -->
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictNameExcludeKey("数据源字典",false,"HCP_DB"), "src_ds_code", StringUtil.getNotEmptyStr(src_ds_code, ""),false)%>
					</td>
				</tr>
				<tr id="excel_file_tr" style="display:none">
					<td>
						请选择要导入的Excel文件:
						<br>
						(支持Office2007及以下版本)
					</td>
					<td>
						<input id="file_upload" name="file_upload" type="file" size="50" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:exportData('0','<%=request.getContextPath()%>/<%=basedbobj.getBasePath()%>/Servlet?method=export4this&otherWhere=1>2')">
						下载模板
						</a>
					</td>
				</tr>
				<tr id="db_tr" style="display:none">
					<td>
						对应数据源的表:
					</td>
					<td>
						<%=basedbobj.findTableName() %>
					</td>
				</tr>				
			</table>

			<div align="center" id="preview_div" style="display:none">
				<input type="button" class="button button_search" value="预览数据" onclick="preview4this()" />
			</div>
		</form>
		
		<script type="text/javascript">
		
			function data_source_type_click(){
				var data_source_type=$("input[name='data_source_type']:checked").val(); 
				
				if(data_source_type=='excel')
				{
					$('#ds_tr').show();
					$('#preview_div').show();
					
					$('#excel_file_tr').show();
					$('#db_tr').hide();
				} 
				else if(data_source_type=='db')
				{
					$('#ds_tr').show();
					$('#preview_div').show();
					
					$('#excel_file_tr').hide();
					$('#db_tr').show();
				}
			}
			
			// 执行
			data_source_type_click();
			
		</script>
	</body>
</html>
