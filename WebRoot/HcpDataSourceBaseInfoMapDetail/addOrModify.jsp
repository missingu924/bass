<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.dictionary.DictionaryUtil"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapDetailObj"%>
<%@page import="com.wuyg.auth.obj.AuthUserObj"%>
<%@page import="com.wuyg.common.util.SystemConstant"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%>
<%@page import="com.hcp.util.HcpDataSourceBaseInfoUtil"%>
<%@page import="com.hcp.obj.HcpDataSourceBaseInfoMapObj"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	HcpDataSourceBaseInfoMapDetailObj domainInstance = new HcpDataSourceBaseInfoMapDetailObj();
	// 用户信息 
	AuthUserObj user = (AuthUserObj) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO);
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance");
	if (domainInstanceObj != null)
	{
		domainInstance = (HcpDataSourceBaseInfoMapDetailObj) domainInstanceObj;
	}

	// 是否是修改 
	boolean isModify = domainInstance.findKeyValue() > 0;
	// 唯一性检查用的字段 
	String keyCol = "id";
	
	// 父对象实例 
	HcpDataSourceBaseInfoMapObj baseInfoMap = (HcpDataSourceBaseInfoMapObj) request.getAttribute("baseInfoMap"); 
%>
<html>
	<head>
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<link href="../css/table.css" rel="stylesheet" type="text/css">
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
		if(!checkNull("map_id","<%=domainInstance.getPropertyCnName("map_id")%>")) return false; 
		if(!checkNull("src_code","<%=domainInstance.getPropertyCnName("src_code")%>")) return false; 
		if(!checkNull("src_name","<%=domainInstance.getPropertyCnName("src_name")%>")) return false; 
		if(!checkNull("dst_code","<%=domainInstance.getPropertyCnName("dst_code")%>")) return false; 
		if(!checkNull("dst_name","<%=domainInstance.getPropertyCnName("dst_name")%>")) return false; 
					 
			// 修改 
			if("true"=="<%=isModify%>") 
			{ 
				addOrModirySubmit(); 
			} 
			// 新增 
			else 
			{ 
				// 新增时检查唯一性 
				checkUniqueAndSave();
			} 
		} 
		 
		</script>
	</head>
	<body>
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=addOrModify4this" method="post">
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
				<input type="hidden" id="map_id" name="map_id" value="<%=domainInstance.getMap_id()%>">
				<tr>
					<td>
						<font color="#0066cc"><%=domainInstance.getPropertyCnName("src_code")%>:</font>
					</td>
					<td>
						<input name="src_code" type="text" id="src_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSrc_code(), "")%>" size="40" onfocus="openDictTable('src')" >
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						<font color="#0066cc"><%=domainInstance.getPropertyCnName("src_name")%>:</font>
					</td>
					<td>
						<input name="src_name" type="text" id="src_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSrc_name(), "")%>" size="40">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						<font color="#ff9900"><%=domainInstance.getPropertyCnName("dst_code")%>:</font>
					</td>
					<td>
						<input <%=isModify?"tabindex=\"1\"":"" %>  name="dst_code" type="text" id="dst_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDst_code(), "")%>" size="40" onfocus="openDictTable('dst')">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						<font color="#ff9900"><%=domainInstance.getPropertyCnName("dst_name")%>:</font>
					</td>
					<td>
						<input name="dst_name" type="text" id="dst_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDst_name(), "")%>" size="40">
						<font color="red">*</font>
					</td>
				</tr>
			</table>

			<!-- 工具栏 -->
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" />
		</form>

		<!-- 外部系统字典信息表 -->
		<table width="600" id="src_dict_table" style="display: none; background-color: #0066cc; width: 600px; margin-left: auto; margin-right: auto; padding: 4px;" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
					<input type="button" name="close_btn" class="button button_close" value="" onclick="closeDictTable()">
					<br>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h3>
						<font color="#ffffff">请从下表中选择编码和名称</font>
					</h3>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<table id="src_dict_table_list" width="100%" class="table table-bordered table-striped" align="center">
						<thead>
							<tr>
								<th>
									选择
								</th>
								<th>
									编码
								</th>
								<th>
									名称
								</th>
							</tr>
						</thead>
						<%
						try{
							List<DictItem> items = HcpDataSourceBaseInfoUtil.getDictItemsByName(baseInfoMap.getSrc_base_info_name()); 
							for (int i = 0; i < items.size(); i++)
							{
								DictItem item = items.get(i);
						%>
						<tr>
							<td>
								<input type="radio" name="src_radiao" value="<%=item.getK()%>" label="<%=item.getV()%>" onclick="confirmSelect('src',this);">
							</td>
							<td><%=item.getK()%></td>
							<td><%=item.getV()%></td>
						</tr>
						<%
						} } catch(Exception e){out.print(e.getMessage());}
						%>

					</table>
				</td>
			</tr>
		</table>
		
		<table width="600" id="dst_dict_table" style="display: none; background-color: #ff9900; width: 600px; margin-left: auto; margin-right: auto; padding: 4px;" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
					<input type="button" name="close_btn" class="button button_close" value="" onclick="closeDictTable()">
					<br>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h3>
						<font color="#ffffff">请从下表中选择对照到的编码和名称</font>
					</h3>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<table id="dst_dict_table_list" width="100%" class="table table-bordered table-striped" align="center">
						<thead>
							<tr>
								<th>
									选择
								</th>
								<th>
									编码
								</th>
								<th>
									名称
								</th>
							</tr>
						</thead>
						<%try{
							List<DictItem> items = HcpDataSourceBaseInfoUtil.getDictItemsByName(baseInfoMap.getDst_base_info_name()); 
							for (int i = 0; i < items.size(); i++)
							{
								DictItem item = items.get(i);
						%>
						<tr>
							<td>
								<input type="radio" name="dst_radiao" value="<%=item.getK()%>" label="<%=item.getV()%>" onclick="confirmSelect('dst',this);">
							</td>
							<td><%=item.getK()%></td>
							<td><%=item.getV()%></td>
						</tr>
						<%
							} } catch(Exception e){out.print(e.getMessage());}
						%>

					</table>
				</td>
			</tr>
		</table>
		<script>
	// 确认选择
	function confirmSelect(sourceOrDest,radioChecked)
	{		
		var check_radio = $(radioChecked);
		
		if(check_radio)
		{
			$('#'+sourceOrDest+'_code').val($(check_radio).val());
			$('#'+sourceOrDest+'_name').val($(check_radio).attr('label'));
		}
		
		closeDictTable(sourceOrDest);
	}
	
	// 打开字典
	function openDictTable(sourceOrDest)
	{	
		closeDictTable();
		$('#'+sourceOrDest+'_dict_table').show();
		//$('#'+sourceOrDest+'_dict_search_input').focus();
	}
	
	// 关闭字典
	function closeDictTable()
	{		
		$('#src_dict_table').hide();
		$('#dst_dict_table').hide();
	}
	
	
	// 字典检索
	$('#src_code').bind('input propertychange',function(){dictSearch('src');});
	
	$('#dst_code').bind('input propertychange',function(){dictSearch('dst');});
	
	function dictSearch(sourceOrDest){
		var search_value = $.trim($('#'+sourceOrDest+'_code').val());
		if(search_value!=""){
		
			$('#'+sourceOrDest+'_dict_table_list tr').each(function(){
			
				var tr = $(this);
				if($(tr).text().indexOf(search_value)>=0){
					$(tr).show();
				}
				else
				{
					$(tr).hide();
				}
				
			});
		}
		else
		{
			$('#'+sourceOrDest+'_dict_table_list tr').each(function(){
			
				$(this).show();
				
			});
		}
	}
	
	</script>
	</body>
	
	<!-- 设置修改时哪些字段不可修改 -->
		<script type="text/javascript">
		if(true==<%=isModify%>)
		{
			setReadonly("src_code");
			
			// 模拟点击目的编码字段
			$('#dst_code').focus();
		}
		
		</script>
</html>
