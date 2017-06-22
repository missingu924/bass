package com.wuyg.common.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.wuyg.common.util.ClassUtil;
import com.wuyg.common.util.StringUtil;

public class ProxyServlet extends HttpServlet
{
	private Logger logger = Logger.getLogger(getClass());

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			String servletName = request.getParameter("servlet");
			if (!StringUtil.isEmpty(servletName))
			{
				servletName += "Servlet";// 输入的参数不需要带后面的'Servlet'这几个字母，这里会自动加上
				List<String> classes = ClassUtil.getClasses("com", servletName, false);
				if (classes.size() == 1)
				{
					Object servlet = Class.forName(classes.get(0)).newInstance();

					MethodUtils.invokeMethod(servlet, "doPost", new Object[]
					{ request, response });
				} else if (classes.size() == 0)
				{
					logger.error("++++++++++代理Servlet没有找到类名为 " + servletName + " 的Servlet，无法代理，请检查++++++++++");
				} else if (classes.size() > 1)
				{
					logger.error("++++++++++代理Servlet找到了多个类名为 " + servletName + " 的Servlet，共" + classes.size() + "个，无法代理，请检查++++++++++");
				}
			} else
			{
				logger.error("++++++++++代理Servlet没有接收到servlet参数，无法代理，请检查++++++++++");
			}

		} catch (Exception e)
		{
			logger.error(e.getMessage(), e);
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}
}
