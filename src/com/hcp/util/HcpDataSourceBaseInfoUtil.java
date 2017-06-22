package com.hcp.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hcp.obj.HcpDataSourceBaseInfoObj;
import com.hcp.obj.HcpDataSourceObj;
import com.inspur.common.dictionary.pojo.DictItem;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.util.MySqlUtil;

public class HcpDataSourceBaseInfoUtil
{
	/**
	 * 根据基础档案数据库信息获取其编号和名字的列表
	 * 
	 * @param baseInfoId
	 * @return
	 * @throws Exception
	 */
	public static List<DictItem> getDictItemsByName(String baseInfoName) throws Exception
	{
		List<DictItem> items = new ArrayList<DictItem>();

		IBaseDAO baseInfoDao = new DefaultBaseDAO(HcpDataSourceBaseInfoObj.class);
		IBaseDAO dataSourceDao = new DefaultBaseDAO(HcpDataSourceObj.class);

		List<HcpDataSourceBaseInfoObj> baseInfoList = baseInfoDao.searchByClause(HcpDataSourceBaseInfoObj.class, "base_info_name='" + baseInfoName + "'", null, 0, 1);
		if (baseInfoList.size() > 0)
		{
			HcpDataSourceBaseInfoObj baseInfo = baseInfoList.get(0);

			List<HcpDataSourceObj> dsList = dataSourceDao.searchByClause(HcpDataSourceObj.class, " ds_code='" + baseInfo.getDs_code() + "'", null, 0, 1);

			if (dsList.size() > 0)
			{
				HcpDataSourceObj ds = dsList.get(0);
				Connection conn = null;
				try
				{
					conn = MySqlUtil.getConnection(ds.getDs_db_type(), ds.getDs_db_ip(), ds.getDs_db_port(), ds.getDs_db_schema(), ds.getDs_db_user(), ds.getDs_db_password());
					ResultSet rst = conn.createStatement().executeQuery(baseInfo.getSql());
					while (rst.next())
					{
						String code = rst.getString(baseInfo.getDb_code_column());
						String name = rst.getString(baseInfo.getDb_name_column());

						DictItem item = new DictItem();
						item.setK(code);
						item.setV(name);

						items.add(item);
					}
				} catch (Exception e)
				{
					throw e;
				} finally
				{
					MySqlUtil.closeConnection(conn);
				}

			}
		}

		return items;
	}

	/**
	 * 根据基础档案数据库信息及其编号获取对应的名称
	 * 
	 * @param baseInfoName
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public static String getNameByCode(String baseInfoName, String code) throws Exception
	{
		List<DictItem> items = getDictItemsByName(baseInfoName);

		for (int i = 0; i < items.size(); i++)
		{
			if (code.equalsIgnoreCase(items.get(i).getK()))
			{
				return items.get(i).getV();
			}
		}

		return code;
	}
}
