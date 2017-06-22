package com.u8;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.u8.obj.AbstractDataSyncObj;
import com.u8.searchcondition.AbstractDataSyncSearchCondition;
import com.u8.service.DataSyncService;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.common.util.TimeUtil;

public abstract class AbstractDataSyncServlet extends AbstractBaseServletTemplate
{
	private Logger logger = Logger.getLogger(getClass());

	// 查询
	public void list4sync(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		AbstractDataSyncSearchCondition condition = (AbstractDataSyncSearchCondition) domainSearchCondition;
		AbstractDataSyncObj instance = (AbstractDataSyncObj) domainInstance;

		// 外部系统数据
		long startTime = System.currentTimeMillis();
		PaginationObj domainPaginationOut = PaginationObj.NULL_PAGE;
		domainPaginationOut.setPageCount(domainSearchCondition.getPageCount());
		String out_ds_code = condition.getOut_ds_code();
		if (!StringUtil.isEmpty(out_ds_code))
		{
			domainPaginationOut = new DefaultBaseDAO(getDomainInstanceClz(), out_ds_code).searchPaginationByCondition(domainSearchCondition);
		}
		List outList = domainPaginationOut.getDataList();
		logger.info("====================数据预览：从外部数据源" + out_ds_code + "中查询数据，共" + outList.size() + "条，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime));

		// 用友系统数据
		startTime = System.currentTimeMillis();
		PaginationObj domainPaginationU8 = PaginationObj.NULL_PAGE;
		if (domainPaginationOut.getDataList().size() > 0)
		{
			domainPaginationU8 = new DefaultBaseDAO(getDomainInstanceClz(), SystemConstant.U8_DB).searchPaginationByCondition(domainSearchCondition);
		}
		List u8List = domainPaginationU8.getDataList();
		logger.info("====================数据预览：从用友数据源" + SystemConstant.U8_DB + "中查询数据，共" + u8List.size() + "条，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime));

		// 数据对比判断是否已导入
		startTime = System.currentTimeMillis();
		for (int i = 0; i < outList.size(); i++)
		{
			AbstractDataSyncObj outRd = (AbstractDataSyncObj) outList.get(i);
			outRd.setAlreadysaved("否");// 默认未导入
			for (int j = 0; j < u8List.size(); j++)
			{
				AbstractDataSyncObj u8Rd = (AbstractDataSyncObj) u8List.get(j);
				if (outRd.findUniqueIndexClause().equalsIgnoreCase(u8Rd.findUniqueIndexClause()))
				{
					// 唯一索引相同
					outRd.setAlreadysaved("是");
					// 已匹配的去掉，提升后续匹配效率
					u8List.remove(j);
					break;
				}
			}
		}
		logger.info("====================数据预览：数据对比，耗时" + TimeUtil.timeInerval2str(System.currentTimeMillis() - startTime));

		// 筛选 是否 已导入
		String alreadysaved = instance.getAlreadysaved();

		if (!StringUtil.isEmpty(alreadysaved))
		{
			List list = new ArrayList();
			for (int i = 0; i < outList.size(); i++)
			{
				AbstractDataSyncObj outRd = (AbstractDataSyncObj) outList.get(i);
				if (alreadysaved.equalsIgnoreCase(outRd.getAlreadysaved()))
				{
					list.add(outRd);
				}
			}

			domainPaginationOut.setDataList(list);
			domainPaginationOut.setTotalCount(list.size());
		}

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_SEARCH_CONDITION, domainSearchCondition);
		request.setAttribute(DOMAIN_PAGINATION, domainPaginationOut);

		// 转向
		request.getRequestDispatcher("/" + getBasePath() + "/sync.jsp").forward(request, response);
	}

	// 同步数据
	public void dataImport2U8(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DataSyncService service = new DataSyncService();
		AbstractDataSyncSearchCondition condition = (AbstractDataSyncSearchCondition) domainSearchCondition;
		service.syncDataFromOutDs(request, response, condition);
	}
}
