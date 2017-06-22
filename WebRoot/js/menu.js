// 在主窗口中打开连接
var loadingDiv;// 打开主页面时的加载提示
function openInMainFrame(td,url)
{	
	//$(".menu_selected").attr("class","menu_not_selected");
	//$(td).attr("class","menu_selected");
	if(url.indexOf("?")<0){url+="?";};
	
	// 主页面加载前开启加载提示
	/**
	loadingDiv = layer.load(
		0, 
		{
			shade: false,
			offset:'t'
		}
	); 
	*/
	
	// 加载主页面
	//parent.mainFrame.location = encodeURI(url+"&isFromUrl=true");
	parent.mainFrame.eval("addTab('"+$.trim($(td).text())+"','"+encodeURI(url+"&isFromUrl=true")+"')");
}

// 主页面加载完毕后关闭加载提示
function mainFrameLoaded()
{
	if(loadingDiv)
	{
		layer.close(loadingDiv);
	}
}

// 左侧边栏显隐
var pageframeCols = top.pageFrame.cols;
var isLeftFrameShow = true;
function toggleLeftFrame()
{
	if(isLeftFrameShow==false){
	   parent.pageFrame.cols=pageframeCols;
	   $("#"+currentMenuTableId).show();
	   $("#toggleButton").attr('src','images/menu_hide.png');
	   $("#toggleButton").attr('title','隐藏侧边栏');
	   isLeftFrameShow=true;
	   top.mainFrame.eval('resizeTabs()');
	}
	else{
	   pageframeCols = parent.pageFrame.cols;
	   parent.pageFrame.cols="12,*";
	   $(".menu_table").hide();
	   $("#toggleButton").attr('src','images/menu_show.png');
	   $("#toggleButton").attr('title','显示侧边栏');
	   isLeftFrameShow=false;
	    top.mainFrame.eval('resizeTabs()');
	}
}

// 展开/折叠带单组
function toggleMenuGroup(tr)
{
	$(tr).next().toggle();
	var td = $(tr).find("td");
	var img = $(td).find("img");
	if($(td).attr("class")=="menu_header_not_expand")
	{
		$(td).attr("class","menu_header_expand");
		$(img).attr("src","images/menu_down.png");
	}
	else
	{
		$(td).attr("class","menu_header_not_expand");
		$(img).attr("src","images/menu_right.png");
	}
}

// 显示菜单表格
var currentMenuTableId="";
function showMenuTable(menuTableId)
{	
	currentMenuTableId=menuTableId;
	
	$(".menu_table").hide();
	
	$("#"+currentMenuTableId).show();
	
	if($("#"+currentMenuTableId).find("td:first").attr("class")=="menu_header_not_expand")
	{
		$("#"+currentMenuTableId).find("tr:first").click();
	}
	
	$(".menu_selected").attr("class","menu_not_selected");
	
	//parent.mainFrame.location = "blank.html";
	
	if(isLeftFrameShow==false){
		toggleLeftFrame();
	}
}
function openPortal(portalUrl)
{
	showMenuTable('noMenuTable');
	if(isLeftFrameShow==true){
		toggleLeftFrame();
	}
	parent.mainFrame.location = encodeURI(portalUrl);
}

// 隐藏左边栏
//toggleLeftFrame();
	