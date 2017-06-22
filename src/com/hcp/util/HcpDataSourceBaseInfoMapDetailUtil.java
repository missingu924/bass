package com.hcp.util;

import java.util.Map;

import org.apache.log4j.Logger;

import com.hcp.obj.HcpDataSourceBaseInfoMapDetailObj;
import com.hcp.obj.HcpDataSourceBaseInfoMapObj;
import com.hcp.obj.HcpDataSourceBaseInfoObj;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.dictionary.DictionaryUtil;

public class HcpDataSourceBaseInfoMapDetailUtil
{
	private static Logger logger = Logger.getLogger(HcpDataSourceBaseInfoMapDetailUtil.class);

	/**
	 * 根据外部数据源编码、对照到的数据源编码、基础档案类型、外部数据编码来获取对照到用友系统的相关编码，如果该对照关系不存在，则在对照关系表中直接添加该条记录，但是对照到的编码需要手工维护
	 * 
	 * @param src_ds_code
	 * @param dst_ds_code
	 * @param base_info_type_code
	 * @param src_code
	 * @param needCompleteMap
	 * @return
	 * @throws Exception 
	 */
	public static String getDstcode(String src_ds_code, String dst_ds_code, String base_info_type_code, String src_code, Map<String, Integer> needCompleteMap) throws Exception
	{
		String dictName = "数据源-基础档案对照字典-明细";
		String full_src_code = "src_ds_code=" + src_ds_code + "&base_info_type_code=" + base_info_type_code + "&src_code=" + src_code;

		if (StringUtil.isEmpty(src_code))
		{
			logger.debug("----" + full_src_code + ",src_code为空，无法做对照，需要检查对端数据质量----");
			return null;
		}

		String dst_code = DictionaryUtil.getDictValueByDictKey(dictName, full_src_code);

		boolean dontMapped = full_src_code.equalsIgnoreCase(dst_code);

		if (dontMapped)
		{
			// 需要补充对照关系

			// 1、检查对照关系基本信息表是否有记录
			HcpDataSourceBaseInfoObj srcBaseInfo = new HcpDataSourceBaseInfoObj();
			srcBaseInfo.setDs_code(src_ds_code);
			srcBaseInfo.setBase_info_type_code(base_info_type_code);
			Object tempObj = srcBaseInfo.searchByInstance();
			if (tempObj != null)
			{
				srcBaseInfo = (HcpDataSourceBaseInfoObj) tempObj;
			} else
			{
				logger.info("----系统中没有配置外部数据源" + src_ds_code + "的'" + base_info_type_code + "'类基础档案，请先做此配置----");
			}

			HcpDataSourceBaseInfoObj dstBaseInfo = new HcpDataSourceBaseInfoObj();
			dstBaseInfo.setDs_code(dst_ds_code);
			dstBaseInfo.setBase_info_type_code(base_info_type_code);
			tempObj = dstBaseInfo.searchByInstance();
			if (tempObj != null)
			{
				dstBaseInfo = (HcpDataSourceBaseInfoObj) tempObj;
			} else
			{
				logger.info("----系统中没有配置用友系统的'" + base_info_type_code + "'类基础档案，请先增加该基础档案----");
			}

			HcpDataSourceBaseInfoMapObj baseInfoMap = new HcpDataSourceBaseInfoMapObj();

			if (!StringUtil.isEmpty(srcBaseInfo.getBase_info_name()) && !StringUtil.isEmpty(dstBaseInfo.getBase_info_name()))
			{
				baseInfoMap.setSrc_base_info_name(srcBaseInfo.getBase_info_name());
				baseInfoMap.setDst_base_info_name(dstBaseInfo.getBase_info_name());
				tempObj = baseInfoMap.searchByInstance();
				if (tempObj != null)
				{
					// 数据库中已经存在
					baseInfoMap = (HcpDataSourceBaseInfoMapObj) tempObj;
				} else
				{
					// 保存入库
					baseInfoMap.save();
				}

				// 2、保存明细入库
				HcpDataSourceBaseInfoMapDetailObj detail = new HcpDataSourceBaseInfoMapDetailObj();
				detail.setMap_id(baseInfoMap.getId());
				detail.setSrc_code(src_code);
				detail.setSrc_name(HcpDataSourceBaseInfoUtil.getNameByCode(baseInfoMap.getSrc_base_info_name(), src_code));// 这地方的名字没有来源，只能用编码代替
				detail.save();

				// 3、清空字典缓存
				DictionaryUtil.clearCache(dictName);
			}

			logger.debug("----" + full_src_code + "缺少对照关系，已自动填写入库，需完善----");
		} else if ("需完善对照关系".equalsIgnoreCase(dst_code))
		{
			// 需要完善对照关系
			dst_code = null;
			dontMapped = true;
			logger.debug("----" + full_src_code + "需完善对照关系----");
		}

		// 填写提示信息
		if (dontMapped)
		{
			Integer num = needCompleteMap.get(base_info_type_code);
			if (num == null)
			{
				needCompleteMap.put(base_info_type_code, 1);
			} else
			{
				needCompleteMap.put(base_info_type_code, num.intValue() + 1);
			}
		} else
		{
			logger.debug("----【" + full_src_code + "】 对照到 【" + dst_code + "】----");
		}

		return dst_code;
	}
}
