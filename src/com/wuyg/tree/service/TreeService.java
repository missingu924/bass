package com.wuyg.tree.service;

import javax.sql.DataSource;

import com.inspur.common.tree.Node;
import com.inspur.common.tree.TreeBuilder;
import com.wuyg.common.util.MySqlUtil;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.tree.obj.ZTreeNode;

public class TreeService
{
	/**
	 * 根据treename获取该树的json数据
	 * 
	 * @param treeName
	 * @param dataSourceName
	 * @param open
	 * @param selectIds
	 * @return
	 * @throws Exception
	 */
	public String getZtreeJson(String treeName, String dataSourceName, boolean open, String selectIds) throws Exception
	{
		ZTreeNode zTreeNode = getZtreeNode(treeName, dataSourceName, open, selectIds);
		String treeJson = zTreeNode.toJson();
		return treeJson;
	}

	/**
	 * 根据treename获取该树的ztreenode
	 * 
	 * @param treeName
	 * @param dataSourceName
	 * @param open
	 * @param selectIds
	 * @return
	 * @throws Exception
	 */
	public ZTreeNode getZtreeNode(String treeName, String dataSourceName, boolean open, String selectIds) throws Exception
	{
		DataSource dataSource = MySqlUtil.getDataSource(dataSourceName);
		Node treeNode = TreeBuilder.getInstance().buildTreeNotUseCache(treeName, dataSource);
		ZTreeNode zTreeNode = cloneFromTreeNode(treeNode, true, open, selectIds);
		return zTreeNode;
	}

	public ZTreeNode getZtreeNode(String treeName, String dataSourceName, boolean showId, boolean open, String selectIds) throws Exception
	{
		DataSource dataSource = MySqlUtil.getDataSource(dataSourceName);
		Node treeNode = TreeBuilder.getInstance().buildTreeNotUseCache(treeName, dataSource);
		ZTreeNode zTreeNode = cloneFromTreeNode(treeNode, showId, open, selectIds);
		return zTreeNode;
	}

	/**
	 * 根据treename获取该树的json数据
	 * 
	 * @param treeName
	 * @return
	 * @throws Exception
	 */
	public String getZtreeJson(String treeName, boolean open, String selectIds) throws Exception
	{
		return getZtreeJson(treeName, SystemConstant.DEFAULT_DB, open, selectIds);
	}

	/**
	 * 用后台构造的树生成Ztree所需的树节点
	 * 
	 * @param treeNode
	 * @return
	 */
	public ZTreeNode cloneFromTreeNode(Node treeNode, boolean showId, boolean open, String selectIds)
	{
		ZTreeNode zTreeNode = new ZTreeNode();

		// id
		zTreeNode.setId(treeNode.getK());

		// name
		if (showId)
		{
			zTreeNode.setName(StringUtil.isEmpty(treeNode.getK()) ? treeNode.getV() : treeNode.getK() + " - " + treeNode.getV());
		} else
		{
			zTreeNode.setName(treeNode.getV());
		}

		// level
		if (treeNode.getL() == 0)
		{
			zTreeNode.setOpen(true);// 第一级 总是展开
		} else
		{
			zTreeNode.setOpen(open);
		}

		// checked
		zTreeNode.setChecked(StringUtil.getStringListByString(selectIds).contains(treeNode.getK()));

		// icon
		zTreeNode.setIcon(treeNode.getI());

		// url
		zTreeNode.setUrl(treeNode.getU());

		for (int i = 0; i < treeNode.getCh().size(); i++)
		{
			ZTreeNode child = cloneFromTreeNode(treeNode.getCh().get(i), showId, open, selectIds);
			zTreeNode.addChild(child);
		}

		return zTreeNode;
	}
}
