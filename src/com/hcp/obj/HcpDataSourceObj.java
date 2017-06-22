package com.hcp.obj;

import java.sql.Connection;
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

public class HcpDataSourceObj extends BaseDbObj
{
	private Long id;
	private String ds_code;
	private String ds_name;
	private String ds_db_type;
	private String ds_db_ip;
	private String ds_db_port;
	private String ds_db_schema;
	private String ds_db_user;
	private String ds_db_password;
	private String ds_enable;
	private String is_system;
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
		return "hcp_data_source";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "is_system desc,ds_code";
	}

	@Override
	public String getBasePath()
	{
		return "HcpDataSource";
	}

	@Override
	public String getCnName()
	{
		return "数据源";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "ds_code" });
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("id", "编号");
		pros.put("ds_code", "数据源编码");
		pros.put("ds_name", "数据源名称");
		pros.put("ds_db_type", "数据库类型");
		pros.put("ds_db_ip", "IP");
		pros.put("ds_db_port", "端口");
		pros.put("ds_db_schema", "数据库");
		pros.put("ds_db_user", "账号");
		pros.put("ds_db_password", "密码");
		pros.put("ds_enable", "是否启用");
		pros.put("is_system", "是否系统预置");
		pros.put("connectStatus", "数据源检测");
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

	public String getDs_name()
	{
		return ds_name;
	}

	public void setDs_name(String ds_name)
	{
		this.ds_name = ds_name;
	}

	public String getDs_db_type()
	{
		return ds_db_type;
	}

	public void setDs_db_type(String ds_db_type)
	{
		this.ds_db_type = ds_db_type;
	}

	public String getDs_db_ip()
	{
		return ds_db_ip;
	}

	public void setDs_db_ip(String ds_db_ip)
	{
		this.ds_db_ip = ds_db_ip;
	}

	public String getDs_db_port()
	{
		return ds_db_port;
	}

	public void setDs_db_port(String ds_db_port)
	{
		this.ds_db_port = ds_db_port;
	}

	public String getDs_db_schema()
	{
		return ds_db_schema;
	}

	public void setDs_db_schema(String ds_db_schema)
	{
		this.ds_db_schema = ds_db_schema;
	}

	public String getDs_db_user()
	{
		return ds_db_user;
	}

	public void setDs_db_user(String ds_db_user)
	{
		this.ds_db_user = ds_db_user;
	}

	public String getDs_db_password()
	{
		return ds_db_password;
	}

	public void setDs_db_password(String ds_db_password)
	{
		this.ds_db_password = ds_db_password;
	}

	public String getDs_enable()
	{
		return ds_enable;
	}

	public void setDs_enable(String ds_enable)
	{
		this.ds_enable = ds_enable;
	}

	public String getDs_code()
	{
		return ds_code;
	}

	public void setDs_code(String ds_code)
	{
		this.ds_code = ds_code;
	}

	public String getIs_system()
	{
		return is_system;
	}

	public void setIs_system(String is_system)
	{
		this.is_system = is_system;
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
			try
			{
				findConnection().close();
				connectStatus = "正常";
			} catch (Exception e)
			{
				connectStatus = e.getMessage();
			}
		}

		return connectStatus;
	}

	public Connection findConnection() throws Exception
	{
		return MySqlUtil.getConnection(this.ds_db_type, this.ds_db_ip, this.ds_db_port, this.ds_db_schema, this.ds_db_user, this.ds_db_password);
	}

	public void setConnectStatus(String connectStatus)
	{
		this.connectStatus = connectStatus;
	}

	// 不是系统预置的 且 没有注册基础档案模型
	public boolean canDelete()
	{
		IBaseDAO baseInfoDao = new DefaultBaseDAO(HcpDataSourceBaseInfoObj.class);
		
		int num = baseInfoDao.countByClause("ds_code='" + this.ds_code + "'");

		return num == 0 && "否".equalsIgnoreCase(this.is_system);
	}

	// 注册的该数据源下的基础档案
	public List<HcpDataSourceBaseInfoObj> findHcpDataSourceBaseInfoList()
	{
		IBaseDAO baseInfoDao = new DefaultBaseDAO(HcpDataSourceBaseInfoObj.class);
		
		return baseInfoDao.searchByClause(HcpDataSourceBaseInfoObj.class, "ds_code='" + this.ds_code + "'", null, 0, Integer.MAX_VALUE);
	}

}
