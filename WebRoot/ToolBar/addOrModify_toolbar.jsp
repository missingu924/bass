<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<table align="center" width="100%" class="toolbar_table">
	<tr>
		<td>
			<input id="saveButton" type="button" class="button button_save" value="保存" title="保存" onClick="addOrModify()">
			&nbsp;&nbsp;
			<input id="cancleButton" type="button" class="button button_cancel" style="display:none" value="取消" onClick="back4this()">
			&nbsp;&nbsp;
			<input id="closeButton" type="button" class="button button_close" style="display:none" value="关闭" onClick="close4this()">
		</td>
	</tr>
</table>
<!-- JS函数 -->
<script>

		// 是否需要 取消 按钮
		if(history.length>1)
		{
			$("#cancleButton").show();
		}
		
		// 是否需要 关闭 按钮
		if(window.opener||window.dialogArguments)
		{
			$("#closeButton").show();
		}
		
		// 取消
		function back4this()
		{
			if(history.length>1){
				history.back();
			}
			else{
				close4this();
			}
		}

		// 关闭
		function close4this()
		{
			var layer = parent.layer; 
			// 如果是用Layer打开的则关闭Layer
			if(layer){
				var index = layer.getFrameIndex(window.name)
				// 关闭层
				parent.layer.close(index);
			}
			else
			{
				// 如果使用window打开的则关闭window
				window.close();
			}
		}	
</script>
