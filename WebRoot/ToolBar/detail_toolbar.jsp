<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%
	String basePath = request.getParameter("basePath");
	String keyColumnName = request.getParameter("keyColumnName");
	String keyValue = request.getParameter("keyValue");
%>
<form name="toolForm" id="toolForm" action="<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath%>&method=addOrModify4this" method="post"> 
	<table align="center" width="100%" class="toolbar_table">
		<tr>
			<td>
				<!-- 增、删、改按钮 -->
				<%
					if(!StringUtil.isEmpty(basePath)){
				%>
				<input name="addButton" type="button" class="button button_add" value="增加" onClick="$('#toolForm').attr('action','<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath %>&method=preModify4this').submit();">
				&nbsp;&nbsp;
					<%
						if(!StringUtil.isEmpty(keyColumnName)&&!StringUtil.isEmpty(keyValue)){
					%>
				<input name="addButton" type="button" class="button button_modify" value="修改" onClick="$('#toolForm').attr('action','<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath %>&method=preModify4this&<%=keyColumnName %>=<%=keyValue %>').submit();"> 
				&nbsp;&nbsp;
				<input name="addButton" type="button" class="button button_delete" value="删除" onClick="deleteIt('<%=request.getContextPath()%>/Proxy/Servlet?servlet=<%=basePath %>&method=delete4this&<%=keyColumnName %>=<%=keyValue %>')">   
				&nbsp;&nbsp;
				<%
						} 
					}
				%>
				<input name="closeButton" type="button" class="button button_close" value="关闭" title="关闭" onClick="close4this();" />
			</td>
		</tr>
	</table>
</form>

<script>
		// 关闭
		function close4this()
		{
			var layer = parent.layer; 
			// 如果是用Layer打开的则关闭Layer
			if(layer){
				var index = layer.getFrameIndex(window.name)
				// 关闭层
				parent.layer.close(index); 
				// 刷新父窗口
				<%if("true".equalsIgnoreCase(request.getAttribute("needRefresh")+"")){%>
					parent.eval("freshCurrentPage()");
					parent.eval("freshMe()");
				<%}%>
			}
			else
			{
				// 如果使用window打开的则关闭window
				window.close();
			}
		}	

		
		// 根据需要刷新父页面
		<%if("true".equalsIgnoreCase(request.getAttribute("needRefresh")+"")){%>
			// 绑定关闭事件
			
			// 父窗口刷新，适用于window.open()打开的窗口
			if(window.opener){
				window.opener.eval("freshCurrentPage()");
			}

			// 父窗口刷新，适用于showModaldialog()打开的窗口
			if(window.dialogArguments){ 
				window.dialogArguments.eval("freshCurrentPage()");
				window.dialogArguments.eval("freshMe()"); 
			}
		<%}%>
</script>
