package com.bass;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.bass.obj.StRepKctzSumObj;
import com.bass.searchcondition.StRepKctzMxSearchCondition;
import com.bass.searchcondition.StRepKctzSumSearchCondition;
import com.bass.service.StockDetailService;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;
import com.wuyg.dictionary.DictionaryUtil;
import com.wuyg.system.util.SystemConfigUtil;

public class StRepKctzSumServlet extends AbstractBaseServletTemplate
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
		return com.bass.obj.StRepKctzSumObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.bass.searchcondition.StRepKctzSumSearchCondition.class;
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

	// 批量删除
	public void batchDelete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.batchDelete(request, response);
	}

	// 删除 按前台条件查出的所有数据
	public void deleteAll4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.deleteAll(request, response);
	}

	// 导出
	public void export4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.exportFromHtml(request, response);
	}

	// 计算
	public void calc4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		StRepKctzSumSearchCondition condition = (StRepKctzSumSearchCondition) domainSearchCondition;
		StRepKctzSumObj instance = (StRepKctzSumObj) domainInstance;

		List sumList = new ArrayList();
		List mxList = new ArrayList();

		if ("true".equalsIgnoreCase(condition.getClear()))
		{
			request.getSession().setAttribute("sumList", sumList);
			request.getSession().setAttribute("mxList", mxList);
		} else
		{
			if ("true".equalsIgnoreCase(condition.getReCalc()))
			{
				if (condition.getDdate_min() == null)
				{
					Calendar cal = Calendar.getInstance();
					cal.set(cal.MONTH, 0);
					cal.set(cal.DAY_OF_MONTH, 1);
					condition.setDdate_min(new Timestamp(cal.getTimeInMillis()));
				}

				StockDetailService service = new StockDetailService();
				String[] dbNames = new String[]
				// { SystemConstant.U8_DB_01, SystemConstant.U8_DB_02 };
				{ SystemConstant.U8_DB };
				for (int i = 0; i < dbNames.length; i++)
				{
					String cinvcccodes = StringUtil.getNotEmptyStr(instance.getCinvccode(), SystemConfigUtil.getValueByName("cs_inventory_class"));// 默认用权限控制过的
					String cwhcodes = StringUtil.getNotEmptyStr(condition.getCwhcode(), SystemConfigUtil.getValueByName("cs_warehourse"));// 默认用权限控制过的

					service.calc(dbNames[i],
					//
							TimeUtil.date2str(condition.getDdate_min(), "yyyy-MM-dd"), TimeUtil.date2str(condition.getDdate_max(), "yyyy-MM-dd"),
							//
							StringUtil.getStringByList(DictionaryUtil.getKeyListFromMultiSelect(cinvcccodes), true),
							//
							condition.getCinvcode_min(), condition.getCinvcode_max(),
							//
							StringUtil.getStringByList(DictionaryUtil.getKeyListFromMultiSelect(cwhcodes), true),
							//
							sumList, mxList);
				}

				request.getSession().setAttribute("sumList", sumList);
				request.getSession().setAttribute("mxList", mxList);
			} else
			{
				Object temp = request.getSession().getAttribute("sumList");
				if (temp != null)
				{
					sumList = (List) temp;
				}
				temp = request.getSession().getAttribute("mxList");
				if (temp != null)
				{
					mxList = (List) temp;
				}
			}
		}

		PaginationObj pagination = new PaginationObj();
		pagination.setPageNo(condition.getPageNo());
		pagination.setPageCount(1);// 每页1行
		pagination.setTotalCount(sumList.size());
		request.setAttribute(DOMAIN_PAGINATION, pagination);

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_SEARCH_CONDITION, domainSearchCondition);

		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_DETAIL + "4this.jsp").forward(request, response);
	}

}
