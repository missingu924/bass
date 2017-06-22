package com.wuyg.schedule;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

import org.apache.log4j.Logger;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerKey;
import org.quartz.impl.StdSchedulerFactory;

import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.TimeUtil;
import com.wuyg.system.obj.SystemConfigObj;

/**
 * 定时任务工具类
 * 
 * @author Wu Yugang
 * 
 */
public class SchedulerUtil
{
	private static Logger logger = Logger.getLogger(SchedulerUtil.class);

	/**
	 * 删除定时任务
	 * 
	 * @param groupName
	 * @param jobName
	 * @throws SchedulerException
	 */
	public static void deleteJob(String groupName, String jobName) throws SchedulerException
	{
		SchedulerFactory sf = new StdSchedulerFactory();
		Scheduler sched = sf.getScheduler();

		sched.deleteJob(new JobKey(jobName, groupName));

		logger.info("定时任务删除成功:[groupName=" + groupName + ",jobName=" + jobName + "]");
	}

	/**
	 * 启动或修改定时任务
	 * 
	 * @param groupName
	 * @param jobName
	 * @param jobClass
	 * @param cronExpression
	 * @throws SchedulerException
	 */
	public static void addOrModifyCronJob(String groupName, String jobName, Class jobClass, String cronExpression) throws SchedulerException
	{
		SchedulerFactory sf = new StdSchedulerFactory();
		Scheduler sched = sf.getScheduler();

		// 先删除
		sched.deleteJob(new JobKey(jobName, groupName));

		// 再增加
		JobDetail job = newJob(jobClass).withIdentity(jobName, groupName).build();

		Trigger trigger = newTrigger().withIdentity(jobName + "Trigger", groupName).withSchedule(cronSchedule(cronExpression)).build();

		sched.scheduleJob(job, trigger);

		logger.info("定时任务修改成功[groupName=" + groupName + ",jobName=" + jobName + ",corn=" + cronExpression + "]下次执行时间：" + TimeUtil.date2str(trigger.getNextFireTime()));
	}

	/**
	 * 获取自动运行任务下次执行时间
	 * 
	 * @param groupName
	 * @param jobName
	 * @return
	 */
	public static String getNextFireTime(String groupName, String jobName)
	{
		String nextFireTime = null;
		try
		{
			SchedulerFactory sf = new StdSchedulerFactory();
			Scheduler sched = sf.getScheduler();
			Trigger trigger = sched.getTrigger(new TriggerKey(jobName, groupName));
			nextFireTime = TimeUtil.date2str(trigger.getNextFireTime());
			logger.info("定时任务[groupName=" + groupName + ",jobName=" + jobName + "]下次执行时间：" + nextFireTime);
		} catch (Exception e)
		{
			logger.error(e.getMessage(), e);
		}

		return nextFireTime;
	}

	/**
	 * 根据常用的cron名字返回cron表达式
	 * 
	 * @param systemConfig
	 * @return
	 */
	public static String getCronExpressionByName(String cronName)
	{
		String cronExpression = null;

		if ("15分钟".equals(cronName))
		{
			cronExpression = "0 0/15 * * * ?";
		} else if ("半小时".equals(cronName))
		{
			cronExpression = "0 0/30 * * * ?";
		}
		if ("一小时".equals(cronName))
		{
			cronExpression = "0 0 * * * ?";
		}
		if ("半天".equals(cronName))
		{
			cronExpression = "0 0 0/12 * * ?";
		}
		if ("一天".equals(cronName))
		{
			cronExpression = "0 0 0 * * ?";
		}

		if (StringUtil.isEmpty(cronExpression))
		{
			logger.warn("不支持的cron名称:" + cronName);
		}

		return cronExpression;
	}
}
