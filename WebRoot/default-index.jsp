<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link href="css/global.css" rel="stylesheet" type="text/css" /> 
	<script src="js/jquery-2.0.3.min.js"></script> 
	<script src="js/utils.js"></script> 

	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.1/themes/metro/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.1/themes/metro/menu.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.1/themes/metro/tabs.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.1/themes/icon.css">
	
	<script type="text/javascript" src="jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
</head>
<body style="overflow-y:hidden"><!-- 隐藏竖滚动条 -->

	<!-- 右键菜单 -->
	<div id="mm" class="easyui-menu" style="width: 120px;">
        <div name="close">关闭当前</div>
        <div name="closeAll">关闭全部</div>
        <div name="closeOthers">关闭其他</div>
    </div>
    
	<!-- tabs -->
	<div id="tt" class="easyui-tabs" style="display:none;width:100%;" >
	</div>
	
	<!-- blank -->
	<div id="blank">
		<iframe scrolling="auto" frameborder="0"  src="blank.html" style="width:100%;" onload="javascript:this.height=$(window).height();"></iframe>
	</div>
	
	<!-- modal window -->
	<div id="win" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true" style="width:800px;height:600px;padding:10px;">
    </div>
	
</body>

<script>
		
	//根据title判断tab是否已经打开，如果该tab页已经打开，则首先关闭然后重新该tab页，否则直接打开新的tab页
	function addTab(title, url){
		// 显示div
		$('#tt').show();
		$('#blank').hide();
		
		// tabIndex
		var index = 9999;
		
		// 如果已经打开，则取得该tab的index，然后重新打开
		if ($('#tt').tabs('exists', title))
		{
			// 取tab
			var tab = $('#tt').tabs('getTab',title);
			// 取index
			index = $('#tt').tabs('getTabIndex',tab);
			// 关闭
			$('#tt').tabs('close', title);
		} 
		
		// 打开tab
		{
			// iframe高度设置为浏览器高度减去190px
			var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;" onload="javascript:this.height=$(window).height()-40;"></iframe>';
			$('#tt').tabs('add',{
				index:index,
				title:title,
				content:content,
				closable:true
			});
		}
	}
		
	//关闭Tabs
    function closeTab(menu, type) {
        var allTabs = $("#tt").tabs('tabs');
        var allTabtitle = [];
        $.each(allTabs, function (i, n) {
            var opt = $(n).panel('options');
            if (opt.closable)
                allTabtitle.push(opt.title);
        });
        var curTabTitle = $(menu).data("tabTitle");
        var curTabIndex = $("#tt").tabs("getTabIndex", $("#tt").tabs("getTab", curTabTitle));
        switch (type) {
            case 'close':
                $("#tt").tabs("close", curTabTitle);
                return false;
                break;
            case 'closeAll':
                for (var i = 0; i < allTabtitle.length; i++) {
                    $('#tt').tabs('close', allTabtitle[i]);
                }
                break;
            case 'closeOthers':
                for (var i = 0; i < allTabtitle.length; i++) {
                    if (curTabTitle != allTabtitle[i])
                        $('#tt').tabs('close', allTabtitle[i]);
                }
                $('#tt').tabs('select', curTabTitle);
                break;
            case 'closeRight':
                for (var i = curTabIndex; i < allTabtitle.length; i++) {
                    $('#tt').tabs('close', allTabtitle[i]);
                }
                $('#tt').tabs('select', curTabTitle);
                break;
            case 'closeLeft':
                for (var i = 0; i < curTabIndex-1; i++) {
                    $('#tt').tabs('close', allTabtitle[i]);
                }
                $('#tt').tabs('select', curTabTitle);
                break;
            case 'refresh':
                var panel = $("#tt").tabs("getTab", curTabTitle).panel("refresh");
                break;
        }
    }
    
    // resize tabs
    function resizeTabs(){
    	$("#tt").tabs("resize");
    }
    
    // 在window中打开
    function openWindow(title,url){
    	$('#win').window({title: title});
	   	$('#win').window('open');
	   	$('#win').window('refresh', url);
    }

    $(document).ready(function () {
        //监听右键事件，创建右键菜单
        $('#tt').tabs({
            onContextMenu: function (e, title, index) {
                e.preventDefault();
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                }).data("tabTitle", title);
            }
        });
        //右键菜单click
        $("#mm").menu({
            onClick: function (item) {
                closeTab(this, item.name);
            }
        });
    });
	</script>
</html>