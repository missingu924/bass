package com.hcp.obj;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.util.MySqlUtil;
import com.wuyg.common.util.StringUtil;

public class HcpDataSourceBaseInfoObj extends BaseDbObj
{
	private Long id;
	private String base_info_name;
	private String base_info_type_code;
	private String ds_code;
	private String db_table;
	private String db_code_column;
	private String db_name_column;
	private String db_filter;
	private String record_account;
	private Timestamp record_time;
	private String connectStatus;

	@Override
	public String findKeyColumnName()
	{
		return "id";
	}

	@Override
	public String findParentKeyColumnName()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findTableName()
	{
		return "hcp_data_source_base_info";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "HcpDataSourceBaseInfo";
	}

	@Override
	public String getCnName()
	{
		return "基础档案模型";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "base_info_name" });
	}

	public String getDb_filter()
	{
		return db_filter;
	}

	public void setDb_filter(String db_filter)
	{
		this.db_filter = db_filter;
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("id", "编号");
		pros.put("base_info_name", "基础档案名称");
		pros.put("base_info_type_code", "基础档案类型");
		pros.put("ds_code", "数据源");
		pros.put("db_table", "对应数据库表");
		pros.put("db_code_column", "编号对应字段");
		pros.put("db_name_column", "名称对应字段");
		pros.put("db_filter", "过滤条件");
		pros.put("connectStatus", "数据检测情况");
		// pros.put("record_account", "record_account");
		// pros.put("record_time", "record_time");
		return pros;
	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getBase_info_name()
	{
		return base_info_name;
	}

	public void setBase_info_name(String base_info_name)
	{
		this.base_info_name = base_info_name;
	}

	public String getBase_info_type_code()
	{
		return base_info_type_code;
	}

	public void setBase_info_type_code(String base_info_type_code)
	{
		this.base_info_type_code = base_info_type_code;
	}

	public String getDs_code()
	{
		return ds_code;
	}

	public void setDs_code(String ds_code)
	{
		this.ds_code = ds_code;
	}

	public String getDb_table()
	{
		return db_table;
	}

	public void setDb_table(String db_table)
	{
		this.db_table = db_table;
	}

	public String getDb_code_column()
	{
		return db_code_column;
	}

	public void setDb_code_column(String db_code_column)
	{
		this.db_code_column = db_code_column;
	}

	public String getDb_name_column()
	{
		return db_name_column;
	}

	public void setDb_name_column(String db_name_column)
	{
		this.db_name_column = db_name_column;
	}

	public String getRecord_account()
	{
		return record_account;
	}

	public void setRecord_account(String record_account)
	{
		this.record_account = record_account;
	}

	public Timestamp getRecord_time()
	{
		return record_time;
	}

	public void setRecord_time(Timestamp record_time)
	{
		this.record_time = record_time;
	}

	public String getConnectStatus()
	{
		if (StringUtil.isEmpty(connectStatus))
		{
			Connection conn = null;
			try
			{
				IBaseDAO dao = new DefaultBaseDAO(HcpDataSourceObj.class);
				HcpDataSourceObj ds = new HcpDataSourceObj();
				ds.setDs_code(this.ds_code);
				ds = (HcpDataSourceObj) dao.searchByUniqueIndex(ds);

				conn = ds.findConnection();
				String sql = getSql();
				ResultSet rst = conn.createStatement().executeQuery(sql);
				if (rst.next())
				{
					rst.getString(this.db_code_column);
					rst.getString(this.db_name_column);
				}
				connectStatus = "正常";
			} catch (Exception e)
			{
				connectStatus = e.getMessage();
			} finally
			{
				MySqlUtil.closeConnection(conn);
			}
		}

		return connectStatus;
	}

	public String getSql()
	{
		String sql = "select * from " + this.db_table + (StringUtil.isEmpty(this.db_filter) ? "" : " where " + this.db_filter);
		return sql;
	}

	public void setConnectStatus(String connectStatus)
	{
		this.connectStatus = connectStatus;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}

	// 没有档案对照到该基础档案
	public boolean canDelete()
	{
		int num = baseInfoMapDao.countByClause("(src_base_info_name='" + this.base_info_name + "' or dst_base_info_name='" + this.base_info_name + "')");

		return num == 0;
	}

	// 注册的该数据源下的基础档案
	public List<HcpDataSourceBaseInfoMapObj> findHcpDataSourceBaseInfoMapList()
	{
		return baseInfoMapDao.searchByClause(HcpDataSourceBaseInfoMapObj.class, "src_base_info_name='" + this.base_info_name + "'", null, 0, Integer.MAX_VALUE);
	}

	private IBaseDAO baseInfoMapDao = new DefaultBaseDAO(HcpDataSourceBaseInfoMapObj.class);
}
