package com.wuyg.system.extend;

import com.wuyg.system.obj.SystemConfigObj;

public interface ISystemConfigAfter
{
	/**
	 * 设置某个配置项之后执行的动作
	 * 
	 * @param systemConfig
	 * @throws Exception
	 */
	public void doAfter(SystemConfigObj systemConfig) throws Exception;
}
