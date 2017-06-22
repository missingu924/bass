package com.hcp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.hcp.obj.HcpDataSourceObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.config.ConfigReader;
import com.wuyg.config.XMLProperties;

public class HcpDataSourceServlet extends AbstractBaseServletTemplate
{
	private Logger logger = Logger.getLogger(getClass());

	@Override
	public String getBasePath()
	{
		return domainInstance.getBasePath();
	}

	@Override
	public IBaseDAO getDomainDao()
	{
		return new DefaultBaseDAO(getDomainInstanceClz());
	}

	@Override
	public Class getDomainInstanceClz()
	{
		return com.hcp.obj.HcpDataSourceObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.hcp.searchcondition.HcpDataSourceSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.list(request, response);
	}

	// 检查ID是否已录入系统
	public void checkId4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.checkId(request, response);
	}

	// 增加 or 修改
	public void addOrModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.addOrModify(request, response);
	}

	// 修改前查询领域对象信息
	public void preModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.preModify(request, response);
	}

	// 详情
	public void detail4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.detail(request, response);
	}

	// 删除
	public void delete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.delete(request, response);
	}

	// 删除 按前台条件查出的所有数据
	public void deleteAll4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.deleteAll(request, response);
	}

	// 导出
	public void export4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.export(request, response);
	}

	// 设置系统数据库连接信息
	public void set4sysdb(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HcpDataSourceObj ds = (HcpDataSourceObj) domainInstance;

		String message = ds.getConnectStatus();

		if ("正常".equalsIgnoreCase(message))
		{
			message = "数据库连接设置成功！";
		} else
		{
			message = "数据库连接设置失败，" + message;
		}
		
		ConfigReader.setProperties(SystemConstant.DEFAULT_DB+".ds_db_type", ds.getDs_db_type());
		ConfigReader.setProperties(SystemConstant.DEFAULT_DB+".ds_db_ip", ds.getDs_db_ip());
		ConfigReader.setProperties(SystemConstant.DEFAULT_DB+".ds_db_port", ds.getDs_db_port());
		ConfigReader.setProperties(SystemConstant.DEFAULT_DB+".ds_db_schema", ds.getDs_db_schema());
		ConfigReader.setProperties(SystemConstant.DEFAULT_DB+".ds_db_user", ds.getDs_db_user());
		ConfigReader.setProperties(SystemConstant.DEFAULT_DB+".ds_db_password", StringUtil.str2hex(ds.getDs_db_password()));//数据库密码转为16进制字符串
		

		response.getWriter().println(message);
	}
}
