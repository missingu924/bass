	// 退出系统
	function logout()
	{
		parent.location.href="AuthUser/Servlet?method=logout";
	}

	// 一级菜单选择
	function openMenu(td,menuTableId)
	{
	
		$(td).attr("class","top_menu_table_clicked");
		$(td).siblings().attr("class","");
		parent.leftFrame.showMenuTable(menuTableId);
	}
	
	function openPortal(td,portalUrl)
	{
	
		$(td).attr("class","top_menu_table_clicked");
		$(td).siblings().attr("class","");
		parent.leftFrame.openPortal(portalUrl);
	}