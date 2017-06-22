package com.hcp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.hcp.obj.HcpDataSourceBaseInfoMapDetailObj;
import com.hcp.obj.HcpDataSourceBaseInfoMapDetailObjExtended;
import com.hcp.obj.HcpDataSourceBaseInfoMapObj;
import com.hcp.obj.HcpDataSourceBaseInfoMapObjExtended;
import com.hcp.obj.HcpDataSourceBaseInfoObj;
import com.hcp.searchcondition.HcpDataSourceBaseInfoMapDetailSearchCondition;
import com.hcp.util.HcpDataSourceBaseInfoUtil;
import com.inspur.common.dictionary.pojo.DictItem;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.dao.SaveOrUpdateResult;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.StringUtil;
import com.wuyg.dictionary.DictionaryUtil;

public class HcpDataSourceBaseInfoMapDetailServlet extends AbstractBaseServletTemplate
{
	private Logger logger = Logger.getLogger(getClass());

	private IBaseDAO baseInfoMapDao = new DefaultBaseDAO(HcpDataSourceBaseInfoMapObjExtended.class);
	private IBaseDAO baseInfoDao = new DefaultBaseDAO(HcpDataSourceBaseInfoObj.class);

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
		return com.hcp.obj.HcpDataSourceBaseInfoMapDetailObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.hcp.searchcondition.HcpDataSourceBaseInfoMapDetailSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 查询对照关系主表
		searchBaseInfoMap(request);

		// 查询对照关系子表
		// super.list(request, response);

		PaginationObj domainPagination = new DefaultBaseDAO(HcpDataSourceBaseInfoMapDetailObjExtended.class).searchPaginationByCondition(domainSearchCondition);// 使用like构造条件

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_SEARCH_CONDITION, domainSearchCondition);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		// 转向
		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + ".jsp").forward(request, response);
	}

	private void searchBaseInfoMap(HttpServletRequest request)
	{
		HcpDataSourceBaseInfoMapDetailObj instance = (HcpDataSourceBaseInfoMapDetailObj) domainInstance;
		HcpDataSourceBaseInfoMapObj baseInfoMap = (HcpDataSourceBaseInfoMapObj) baseInfoMapDao.searchByKey(HcpDataSourceBaseInfoMapObj.class, instance.getMap_id() + "");
		request.setAttribute("baseInfoMap", baseInfoMap);
	}

	// 检查ID是否已录入系统
	public void checkId4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.checkId(request, response);
	}

	// 增加 or 修改
	public void addOrModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		searchBaseInfoMap(request);

		clearDictionaryCache();

		super.addOrModify(request, response);
	}

	// 修改前查询领域对象信息
	public void preModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 查询主表
		searchBaseInfoMap(request);

		super.preModify(request, response);
	}

	// 详情
	public void detail4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		searchBaseInfoMap(request);

		super.detail(request, response);
	}

	// 删除
	public void delete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		clearDictionaryCache();

		int successCount = getDomainDao().deleteByKey(domainInstanceKeyValue);

		// 传递needRefresh
		request.setAttribute("needRefresh", true);

		// 转向
		if (successCount > 0)
		{
			list4this(request, response);
		} else
		{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	// 删除 按前台条件查出的所有数据
	public void deleteAll4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 清空字典表
		clearDictionaryCache();

		// 删除数据
		HcpDataSourceBaseInfoMapDetailObj detail = (HcpDataSourceBaseInfoMapDetailObj) domainInstance;
		String where = " 1=1 " + MyBeanUtils.getWhereByBaseDbObj(detail, getDomainDao().getTableMetaData(), false);

		if ("true".equalsIgnoreCase(detail.getDont_mapped()))
		{
			where += " and (dst_code is null or dst_code='')";
		}

		int successCount = getDomainDao().deleteByClause(where);

		// 转向
		if (successCount > 0)
		{
			list4this(request, response);
		} else
		{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	private void clearDictionaryCache()
	{
		// 清空字典缓存
		DictionaryUtil.clearCache("数据源-基础档案对照字典-明细");
	}

	// 导出
	public void export4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.export(request, response);
	}

	// 同步src基础档案数据
	public void syncData(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		clearDictionaryCache();

		String src_base_info_name = request.getParameter("src_base_info_name");
		Long map_id = StringUtil.parseLong(request.getParameter("map_id"));

		// 获取src基础档案数据
		List<DictItem> items = HcpDataSourceBaseInfoUtil.getDictItemsByName(src_base_info_name);
		List<BaseDbObj> detailList = new ArrayList<BaseDbObj>();

		for (int i = 0; i < items.size(); i++)
		{
			DictItem item = items.get(i);
			HcpDataSourceBaseInfoMapDetailObj detail = new HcpDataSourceBaseInfoMapDetailObj();
			detail.setMap_id(map_id);
			detail.setSrc_code(item.getK());
			detail.setSrc_name(item.getV());
			detailList.add(detail);
		}

		// 保存或更新，根据map_id+src_code做唯一索引
		// SaveOrUpdateResult syncResult = getDomainDao().saveNewInstanceOnly(detailList);

		List inDbList = getDomainDao().searchByParentKey(HcpDataSourceBaseInfoMapDetailObj.class, map_id + "", null);
		List<BaseDbObj> insertList = new ArrayList<BaseDbObj>();
		List<BaseDbObj> updateList = new ArrayList<BaseDbObj>();

		// 找出不在数据库中的对象
		for (int i = 0; i < detailList.size(); i++)
		{
			BaseDbObj instance = detailList.get(i);

			if (inDbList.contains(instance))
			{
				updateList.add(instance);
			} else
			{
				insertList.add(instance);
			}
		}

		boolean rst = getDomainDao().save(insertList);

		// logger.info(syncResult.toString());

		// request.setAttribute("message", "本次数据下载" + syncResult.toString());

		request.setAttribute("message", "本次数据下载新增" + insertList.size() + "条数据");

		list4this(request, response);
	}

	// 基础档案自动对照
	public void autoMap(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		clearDictionaryCache();

		// 查询该map_id所有记录
		String dst_base_info_name = request.getParameter("dst_base_info_name");
		String map_id = request.getParameter("map_id");
		String map_type = request.getParameter("map_type");
		int pageCount = domainSearchCondition.getPageCount();
		domainSearchCondition.setPageCount(Integer.MAX_VALUE);
		domainSearchCondition.setPageNo(0);
		List<HcpDataSourceBaseInfoMapDetailObj> detaiList = getDomainDao().searchPaginationByCondition(domainSearchCondition).getDataList();
		domainSearchCondition.setPageCount(pageCount);

		// 查询dst_base_info_name对应的所有数据项
		List<DictItem> items = HcpDataSourceBaseInfoUtil.getDictItemsByName(dst_base_info_name);

		// 逐个进行匹配
		int needMapNum = 0;
		int dontMappedNum = 0;
		int mappedSuccNum = 0;
		List mappedList=new ArrayList<HcpDataSourceBaseInfoMapDetailObj>();
		for (int i = 0; i < detaiList.size(); i++)
		{
			HcpDataSourceBaseInfoMapDetailObj detail = detaiList.get(i);

			// 尚未未对照的才处理
			if (StringUtil.isEmpty(detail.getDst_code()))
			{
				needMapNum++;

				for (int j = 0; j < items.size(); j++)
				{
					DictItem item = items.get(j);
					if (("name".equalsIgnoreCase(map_type) && StringUtil.getNotEmptyStr(detail.getSrc_name()).equalsIgnoreCase(item.getV())) || ("code".equalsIgnoreCase(map_type) && StringUtil.getNotEmptyStr(detail.getSrc_code()).equalsIgnoreCase(item.getK())))
					{
						detail.setDst_code(item.getK());
						detail.setDst_name(item.getV());

						// 对照成功，更新入库
//						detail.update();
						mappedList.add(detail);
						
						items.remove(j);

						mappedSuccNum++;
						break;
					}
				}

				// 未对照成功
				if (StringUtil.isEmpty(detail.getDst_code()))
				{
					dontMappedNum++;
				}
			}
		}
		
		boolean rst = getDomainDao().update(mappedList); //对照成功，更新入库

		String message = "共" + detaiList.size() + "条数据，其中需要对照的" + needMapNum + "条，自动对照成功" + mappedSuccNum + "条，还有" + dontMappedNum + "条未对照。";
		request.setAttribute("message", message);

		logger.info("map_id=" + map_id + "，" + message);

		list4this(request, response);
	}

}
