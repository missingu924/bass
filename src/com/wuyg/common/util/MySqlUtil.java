package com.wuyg.common.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;

import com.hcp.obj.HcpDataSourceObj;
import com.sun.javafx.css.Rule;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.config.ConfigReader;

public class MySqlUtil
{
	private static Logger logger = Logger.getLogger(MySqlUtil.class);
	private static Map<String, BasicDataSource> dsMap = new HashMap<String, BasicDataSource>();

	public static final String DB_SQLSERVER = "SqlServer";
	public static final String DB_ORACLE = "Oracle";

	// public static Connection getConnection() throws SQLException
	// {
	// return getConnection(SystemConstant.DEFAULT_DB);
	// }

	public static synchronized Connection getConnection(String dbName) throws Exception
	{

		Connection conn = getDataSource(dbName).getConnection();

		// orcle数据库预先执行语句
		if (isOracle(dbName))
		{
			conn.createStatement().execute("alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss'");
			conn.createStatement().execute("alter session set nls_timestamp_format='yyyy-mm-dd hh24:mi:ss'");
			conn.createStatement().execute("alter SESSION set NLS_SORT = SCHINESE_PINYIN_M");// 按拼音排序
		}

		return conn;
	}

	public static synchronized DataSource getDataSource(String dbName) throws Exception
	{
		BasicDataSource ds = dsMap.get(dbName);

		// 先从配置文件中读取，如果没有再从数据库中读取
		// String driverClassName = ConfigReader.getProperties(dbName + ".dbDriverClassName");
		// String url = ConfigReader.getProperties(dbName + ".dbUrl");
		// String user = ConfigReader.getProperties(dbName + ".dbUser");
		// String password = ConfigReader.getProperties(dbName + ".dbPassword");

		HcpDataSourceObj hcpDs = new HcpDataSourceObj();

		if (SystemConstant.DEFAULT_DB.equalsIgnoreCase(dbName))
		{
			hcpDs.setDs_db_type(ConfigReader.getProperties(dbName + ".ds_db_type"));
			hcpDs.setDs_db_ip(ConfigReader.getProperties(dbName + ".ds_db_ip"));
			hcpDs.setDs_db_port(ConfigReader.getProperties(dbName + ".ds_db_port"));
			hcpDs.setDs_db_schema(ConfigReader.getProperties(dbName + ".ds_db_schema"));
			hcpDs.setDs_db_user(ConfigReader.getProperties(dbName + ".ds_db_user"));
			hcpDs.setDs_db_password(StringUtil.hex2str(ConfigReader.getProperties(dbName + ".ds_db_password")));// 数据库密码转为16进制字符串
		} else
		{
			IBaseDAO dsDao = new DefaultBaseDAO(HcpDataSourceObj.class);

			hcpDs.setDs_code(dbName);
			hcpDs = (HcpDataSourceObj) dsDao.searchByUniqueIndex(hcpDs);
		}

		String driverClassName = getDriverClassByDbType(hcpDs.getDs_db_type());
		String url = getUrlByDbType(hcpDs.getDs_db_type(), hcpDs.getDs_db_ip(), hcpDs.getDs_db_port(), hcpDs.getDs_db_schema());
		String user = hcpDs.getDs_db_user();
		String password = hcpDs.getDs_db_password();

		if ((ds == null) || (ds != null && (!driverClassName.equals(ds.getDriverClassName()) || !url.equals(ds.getUrl()) || !user.equals(ds.getUsername()) || !password.equals(ds.getPassword()))))
		{
			logger.info("Datasouce连接到" + dbName);
			ds = new BasicDataSource();
			ds.setDriverClassName(driverClassName);
			ds.setUrl(url);
			ds.setUsername(user);
			ds.setPassword(password);
			ds.setInitialSize(10);
			ds.setMaxActive(100);
			ds.setMaxIdle(5);
			ds.setMaxWait(5);

			dsMap.put(dbName, ds);
		}

		return ds;
	}

	public static Connection getConnection(String dbType, String ip, String port, String dbName, String user, String password) throws Exception
	{
		String driverClass = getDriverClassByDbType(dbType);
		String url = getUrlByDbType(dbType, ip, port, dbName);

		Class.forName(driverClass);
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}

	private static String getDriverClassByDbType(String dbType)
	{
		if (SystemConstant.DB_SQLSERVER.equalsIgnoreCase(dbType))
		{
			return "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		} else if (SystemConstant.DB_ORACLE.equalsIgnoreCase(dbType))
		{
			return "oracle.jdbc.driver.OracleDriver";
		}

		return null;
	}

	private static String getUrlByDbType(String dbType, String ip, String port, String dbName)
	{
		if (SystemConstant.DB_SQLSERVER.equalsIgnoreCase(dbType))
		{
			return "jdbc:sqlserver://" + ip + ":" + port + ";DatabaseName=" + dbName;
		} else if (SystemConstant.DB_ORACLE.equalsIgnoreCase(dbType))
		{
			return "jdbc:oracle:thin:@" + ip + ":" + port + ":" + dbName;
		}

		return null;
	}

	public static void closeConnection(Connection conn)
	{
		if (conn != null)
		{
			try
			{
				conn.close();
			} catch (SQLException ex)
			{
				ex.printStackTrace();
			}
		}
	}

	public static boolean isOracle(String dbName)
	{
		return isSomeDb(dbName, SystemConstant.DB_ORACLE);
	}

	public static boolean isMySql(String dbName)
	{
		return isSomeDb(dbName, SystemConstant.DB_MYSQL);
	}

	public static boolean isSqlServer(String dbName)
	{
//		return isSomeDb(dbName, SystemConstant.DB_SQLSERVER);
		return true;
	}

	public static boolean isSomeDb(String dbName, String dbType)
	{
		String driverClassName = StringUtil.getNotEmptyStr(ConfigReader.getProperties(dbName + ".dbDriverClassName"));
		return driverClassName.toUpperCase().contains(dbType.toUpperCase());
	}

	public static String getLikeClause(String colName, String value)
	{
		if (StringUtil.isEmpty(colName) || StringUtil.isEmpty(value))
		{
			return " 1=1 ";
		} else
		{
			return " (" + colName + " like '%" + value + "%' or " + colName + " like '%" + value + "' or " + colName + " like '" + value + "%' or " + colName + " = '" + value + "') ";
		}
	}

	public static String getCurrentTimeFunction(String dbName)
	{
		dbName = StringUtil.getNotEmptyStr(dbName, SystemConstant.DEFAULT_DB);

		if (isOracle(dbName))
		{
			return "sysdate";
		} else if (isSqlServer(dbName))
		{
			return "getdate()";
		} else if (isMySql(dbName))
		{
			return "now()";
		}

		return null;
	}

	public static String getIsNullFunction(String dbName)
	{
		dbName = StringUtil.getNotEmptyStr(dbName, SystemConstant.DEFAULT_DB);

		if (isOracle(dbName))
		{
			return "nvl";
		} else if (isSqlServer(dbName))
		{
			return "isnull";
		} else if (isMySql(dbName))
		{
			return "ifnull";
		}

		return null;
	}

	public static void main(String[] args)
	{
		try
		{
			getConnection("db");
		} catch (Exception e)
		{
			e.printStackTrace();
		}

	}
}
