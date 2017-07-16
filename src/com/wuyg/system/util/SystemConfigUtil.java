package com.wuyg.system.util;

import java.util.List;

import org.apache.log4j.Logger;

import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.util.StringUtil;
import com.wuyg.system.extend.ISystemConfigAfter;
import com.wuyg.system.obj.SystemConfigObj;

public class SystemConfigUtil
{
	private static IBaseDAO dao = new DefaultBaseDAO(SystemConfigObj.class);
	private static Logger logger = Logger.getLogger(SystemConfigUtil.class);

	/**
	 * 根据 配置项名称 获取 配置的值
	 * 
	 * @param name
	 * @return
	 */
	public static String getValueByName(String name)
	{
		SystemConfigObj config = null;
		config = getSystemConfigByName(name);

		if (config != null)
		{
			logger.info("==取系统配置项数据:" + config.toString() + "==");

			return config.getValue();
		} else
		{
			logger.info("==取系统配置项数据:没有该配置项，" + name);
		}

		return "";
	}
	
	/**
	 * 根据 配置项名称 获取 配置的值，并且将配置项的值进行拆分，适用于多选内容
	 * 
	 * @param name
	 * @return
	 */
	public static List<String> getValueListByName(String name)
	{
		return StringUtil.getStringListByString(StringUtil.getNotEmptyStr(getValueByName(name)).replaceAll("multi:", ""));
	}

	/**
	 * 根据 配置项名称 获取 配置项信息
	 * 
	 * @param name
	 * @param config
	 * @return
	 */
	public static SystemConfigObj getSystemConfigByName(String name)
	{
		SystemConfigObj config = null;
		List<SystemConfigObj> list = dao.searchByClause(SystemConfigObj.class, "name='" + name + "'", null, 0, 1);
		if (list.size() > 0)
		{
			config = list.get(0);
		}
		return config;
	}

	/**
	 * 更新配置项的值
	 * 
	 * @param name
	 * @param value
	 */
	public static void updateValueByName(String name, String value)
	{
		SystemConfigObj systemConfig = new SystemConfigObj();
		systemConfig.setName(name);
		systemConfig.setValue(value);
		systemConfig.update();
	}

	/**
	 * 从数据库中取出某配置项的值，然后执行值修改后需要完成的动作
	 */
	public static void doAfter(String name)
	{
		SystemConfigObj systemConfig = new SystemConfigObj();
		systemConfig.setName(name);
		Object obj = systemConfig.searchByInstance();
		if (obj != null)
		{
			systemConfig = (SystemConfigObj) obj;

			// 如果有需要后续执行的动作，则执行
			if (!StringUtil.isEmpty(systemConfig.getAfter_class()))
			{
				try
				{
					ISystemConfigAfter after = (ISystemConfigAfter) Class.forName(systemConfig.getAfter_class()).newInstance();
					after.doAfter(systemConfig);
				} catch (Exception e)
				{
					logger.error(e.getMessage(), e);
				}

			}
		}
	}
}
