package com.wuyg.tree;

import java.util.List;

import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.tree.obj.ZTreeNode;
import com.wuyg.tree.service.TreeService;

public class TreeUtil
{
	public static String getInputHtml(String treeName, String inputName, String inputValue, int size) throws Exception
	{
		return getInputHtml(treeName, inputName, inputValue, null, size);
	}

	public static String getInputHtml(String treeName, String inputName, String inputValue, String filter, int size) throws Exception
	{
		StringBuffer sb = new StringBuffer();

		String inputName4show = inputName + "_4show";
		sb.append("<input type=\"text\" id=\"" + inputName4show + "\" name=\"" + inputName4show + "\" value=\"" + getValueByKey(treeName, inputValue) + "\" onclick=\"selectFromTree('" + treeName + "','" + inputName + "','" + inputName4show + "',"
				+ (!StringUtil.isEmpty(filter) ? ("'" + filter + "'") : "''") + ")\" readOnly size=\"" + size + "\"><input id=\"" + inputName + "_clear_btn\" type=\"button\" class=\"button button_clear\" title=\"重置\" onclick=\"$('#" + inputName + "').val('');$('#" + inputName4show
				+ "').val('');\"> \n");
		sb.append("<input type=\"hidden\" id=\"" + inputName + "\" name=\"" + inputName + "\" value=\"" + inputValue + "\"> \n");

		return sb.toString();
	}

	private static String getValueByKey(String treeName, String selectIds) throws Exception
	{
		TreeService service = new TreeService();
		ZTreeNode zTreeNode = service.getZtreeNode(treeName, SystemConstant.DEFAULT_DB, true, selectIds.replaceFirst("multi:", ""));

		String values = getValueByKey(zTreeNode);

		if (values.length() > 0)
		{
			values = values.substring(0, values.length() - 1);
		}

		return values;
	}

	private static String getValueByKey(ZTreeNode zTreeNode)
	{
		String values = "";

		if (zTreeNode.isChecked())
		{
			values += zTreeNode.getName() + ";";
		}

		List<ZTreeNode> children = zTreeNode.getChildren();
		for (int i = 0; i < children.size(); i++)
		{
			ZTreeNode child = children.get(i);
			values += getValueByKey(child);
		}

		return values;
	}
}
