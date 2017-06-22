<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="java.io.File"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title>图标列表</title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript">
		function imageClick4this(imageSrc)
		{
			window.returnValue = imageSrc;
			window.close();
		}
		</script>
	</head>
	<body>

		<table width="90%" align="center">
			<tr>
				<td height="60px">
					<img src="../images/clear.png" width="16" height="16" style="cursor: pointer" onclick="imageClick4this()" />
					<font color="red">不设置图标</font>
				</td>
			</tr>
			<tr>
				<td>
					<%
						// 当前上下文路径 
						String contextPath = request.getContextPath();

						String imageDirPath = "images/svg/heavy/green/16";

						File imageDir = new File(request.getRealPath(imageDirPath));

						String[] images = imageDir.list();

						if (images != null)
						{
							for (int i = 0; i < images.length; i++)
							{
					%>
					<%
						if ((i > 0) && (i % 15 == 0))
								{
									out.print("<br><br>");
								}
					%>
					<img src="<%="../" + imageDirPath + "/" + images[i]%>" width="16" height="16" style="cursor: pointer" onclick="imageClick4this('<%=imageDirPath + "/" + images[i] %>')" />
					&nbsp;&nbsp;&nbsp;&nbsp;

					<%
						}
						}
					%>
				</td>
			</tr>
		</table>
	</body>
</html>
