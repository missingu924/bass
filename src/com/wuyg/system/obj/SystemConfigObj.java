package com.wuyg.system.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.util.StringUtil;
import com.wuyg.dictionary.DictionaryUtil;

import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class SystemConfigObj extends BaseDbObj
{
	private Long id;
	private String name;
	private String cn_name;
	private String value;
	private String type;
	private String dict_name;
	private String be_stop;
	private String sort_code;
	private String default_value;
	private String select_type;
	private String after_class;// 配置项修改后执行的动作

	@Override
	public String findKeyColumnName()
	{
		return "id";
	}

	@Override
	public String findParentKeyColumnName()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findTableName()
	{
		return "system_config";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "sort_code";
	}

	@Override
	public String getBasePath()
	{
		return "SystemConfig";
	}

	@Override
	public String getCnName()
	{
		return "系统配置项";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{ "name" });
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("id", "id");
		pros.put("name", "英文名");
		pros.put("cn_name", "中文名");
		pros.put("value", "设置值");
		pros.put("default_value", "默认值");
		pros.put("type", "数据类型");
		pros.put("dict_name", "对应字典");
		pros.put("select_type", "选择类型");
		pros.put("after_class", "值修改后执行的类");
		pros.put("sort_code", "排序编码");
		pros.put("be_stop", "停用");
		return pros;
	}

	public String getAfter_class()
	{
		return after_class;
	}

	public void setAfter_class(String after_class)
	{
		this.after_class = after_class;
	}

	public String getSelect_type()
	{
		return select_type;
	}

	public void setSelect_type(String select_type)
	{
		this.select_type = select_type;
	}

	public String getDefault_value()
	{
		return default_value;
	}

	public void setDefault_value(String default_value)
	{
		this.default_value = default_value;
	}

	public String getSort_code()
	{
		return sort_code;
	}

	public void setSort_code(String sort_code)
	{
		this.sort_code = sort_code;
	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getCn_name()
	{
		return cn_name;
	}

	public void setCn_name(String cn_name)
	{
		this.cn_name = cn_name;
	}

	public String getValue()
	{
		return value;
	}

	public String getValue4show()
	{
		if (StringUtil.isEmpty(dict_name))
		{
			return value;
		} else
		{
			return DictionaryUtil.getDictValueByDictKey(dict_name, value, true);
		}
	}

	public void setValue(String value)
	{
		this.value = value;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public String getDict_name()
	{
		return dict_name;
	}

	public void setDict_name(String dict_name)
	{
		this.dict_name = dict_name;
	}

	public String getBe_stop()
	{
		return be_stop;
	}

	public void setBe_stop(String be_stop)
	{
		this.be_stop = be_stop;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
