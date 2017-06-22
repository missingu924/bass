package com.wuyg.dbmodel.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;

import org.apache.log4j.Logger;

import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.util.MySqlUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.dbmodel.obj.DbmodelColumnObj;
import com.wuyg.dbmodel.obj.DbmodelTableObj;
import com.wuyg.dbmodel.obj.ReportColumnObj;
import com.wuyg.dbmodel.obj.ReportHeadObj;
import com.wuyg.dbmodel.obj.ReportMainObj;
import com.wuyg.dbmodel.obj.ReportRowObj;

public class ReportDao
{
	Logger logger = Logger.getLogger(getClass());

	IBaseDAO dbmodeltableDao = new DefaultBaseDAO(DbmodelTableObj.class);

	/**
	 * 根据reportId查询报表数据
	 * 
	 * @param reportId
	 * @return
	 */
	public ReportMainObj searchReportDataById(String reportId)
	{
		ReportMainObj reportMain = new ReportMainObj();

		// 1、查询报表配置信息
		DbmodelTableObj dbmodelTable = (DbmodelTableObj) dbmodeltableDao.searchByKey(DbmodelTableObj.class, reportId);
		List<DbmodelColumnObj> dbmodelColumns = dbmodelTable.findTableColumns();

		ReportHeadObj reportHead = new ReportHeadObj();
		reportHead.setHeads(dbmodelColumns);
		reportMain.setHead(reportHead);

		// 2、构造查询sql
		String sql = "select * from (select * from " + dbmodelTable.getTablename() + ") _t_";

		logger.info("sql:" + sql);

		// 3、执行数据查询
		Connection conn = null;
		try
		{
			conn = MySqlUtil.getConnection(SystemConstant.DEFAULT_DB);

			ResultSet rst = conn.createStatement().executeQuery(sql);

			// 4、构造返回对象
			while (rst.next())
			{
				ReportRowObj row = new ReportRowObj();
				for (int i = 0; i < dbmodelColumns.size(); i++)
				{
					String columnName = dbmodelColumns.get(i).getColumnname();
					ReportColumnObj column = new ReportColumnObj();
					column.setName(columnName);
					column.setValue(rst.getObject(columnName));
					row.addColumn(column);
				}
				reportMain.addRow(row);
			}

		} catch (Exception e)
		{
			logger.error(e.getMessage(), e);
		} finally
		{
			MySqlUtil.closeConnection(conn);
		}

		return reportMain;
	}

	public static void main(String[] args)
	{
		ReportDao dao = new ReportDao();
		ReportMainObj reportMain = dao.searchReportDataById("136");
		System.out.println(reportMain.toString());
	}
}
