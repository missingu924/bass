package com.wuyg.common.dao;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;

import com.sun.xml.internal.bind.v2.model.core.ID;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;

/**
 * 
 * 
 * @author wuyugang
 * 
 */
public abstract class BaseDbObj
{
	private Logger logger = Logger.getLogger(getClass());

	// 子对象列表
	private List<BaseDbObj> children = null;

	// 父对象
	private BaseDbObj parent = null;

	/**
	 * 获取该对象对应的表名
	 * 
	 * @return
	 */
	public abstract String findTableName();

	/**
	 * 获取该对象对应表的主键字段名
	 * 
	 * @return
	 */
	public abstract String findKeyColumnName();

	/**
	 * 获取父对象的主键在该表中对应的字段名
	 * 
	 * @return
	 */
	public abstract String findParentKeyColumnName();

	/**
	 * 获取父对象的主键在该表中对应的字段名
	 * 
	 * @return
	 */
	public String findDefaultOrderBy()
	{
		List<String> uniqueColumnNames = findUniqueIndexProperties();
		if (uniqueColumnNames.size() > 0)
		{
			return StringUtil.getStringByList(uniqueColumnNames, false);
		} else
		{
			return StringUtil.getNotEmptyStr(findKeyColumnName() + " desc");
		}
	}

	/**
	 * 获取目录名
	 * 
	 * @return
	 */
	public abstract String getBasePath();

	/**
	 * 获取该类的中文名
	 * 
	 * @return
	 */
	public abstract String getCnName();

	/**
	 * 获取导出excel是的列明及其字段对应关系
	 * 
	 * @return
	 */
	public abstract LinkedHashMap<String, String> findProperties();

	/**
	 * 根据表的主键获取实例对象的主键值
	 * 
	 * @return
	 * @throws Exception
	 */
	public long findKeyValue() throws Exception
	{
		if (StringUtil.isEmpty(findKeyColumnName()))
		{
			return Integer.MAX_VALUE;
		} else
		{
			return Long.parseLong(StringUtil.getNotEmptyStr(BeanUtils.getProperty(this, findKeyColumnName()), "-1"));
		}
	}

	/**
	 * 根据表的主键设置实例对象的主键值
	 * 
	 * @return
	 * @throws Exception
	 */
	public void setKeyValue(Long value) throws Exception
	{
		BeanUtils.setProperty(this, findKeyColumnName(), value);
	}

	/**
	 * 获取主键中文名
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getKeyCnName() throws Exception
	{
		return findProperties().get(findKeyColumnName());
	}

	/**
	 * 根据对象属性的英文名获取中文名
	 * 
	 * @param key
	 * @return
	 */
	public String getPropertyCnName(String cnName)
	{
		return StringUtil.getNotEmptyStr(findProperties().get(cnName));
	}

	/**
	 * 获取该类用于进行唯一索引检查的字段，默认不做唯一性检查
	 * 
	 * @return
	 */
	public List<String> findUniqueIndexProperties()
	{
		List<String> uniqueIndexProperties = new ArrayList<String>();
		uniqueIndexProperties.add(findKeyColumnName());// 默认用主键
		return uniqueIndexProperties;
	}

	/**
	 * 获取根据唯一所以查询时构造的查询条件，即 (a='1' and b='2') 这样的样式
	 * 
	 * @return
	 * @throws Exception
	 */
	public String findUniqueIndexClause() throws Exception
	{
		String clause = "";

		List<String> uniqueIndexProperties = findUniqueIndexProperties();

		for (int i = 0; i < uniqueIndexProperties.size(); i++)
		{
			String property = uniqueIndexProperties.get(i);
			String value = BeanUtils.getProperty(this, property);

			if (i > 0)
			{
				clause += " and ";
			}

			clause += " " + property + "='" + value + "' ";
		}

		return "(" + clause + ")";
	}

	/**
	 * 判断该对象的唯一索引字段是否有空值
	 * 
	 * @return
	 * @throws Exception
	 */
	public boolean uniqueIndexValueIsEmpty() throws Exception
	{
		List<String> uniqueIndexProperties = findUniqueIndexProperties();

		for (int i = 0; i < uniqueIndexProperties.size(); i++)
		{
			String property = uniqueIndexProperties.get(i);
			String value = BeanUtils.getProperty(this, property);

			if (StringUtil.isEmpty(value))
			{
				logger.info(this.getClass() + "的唯一索引字段" + property + "值为空");
				return true;
			}
		}

		return false;
	}

	@Override
	public boolean equals(Object other)
	{
		boolean isEquals = true;
		try
		{
			List<String> uniqueIndexProperties = findUniqueIndexProperties();

			for (int i = 0; i < uniqueIndexProperties.size(); i++)
			{
				String property = uniqueIndexProperties.get(i);
				String thisPropertyValue = BeanUtils.getProperty(this, property);
				String otherPropertyValue = BeanUtils.getProperty(other, property);

				if (thisPropertyValue == null && otherPropertyValue == null)
				{
					// 均为空
					isEquals &= true;
				} else if (thisPropertyValue != null && thisPropertyValue.equals(otherPropertyValue))
				{
					// 相等
					isEquals &= true;
				} else
				{
					// 不相等
					isEquals &= false;
				}

				if (!isEquals)
				{
					break;
				}
			}

			return isEquals;

		} catch (Exception e)
		{
			logger.error(e.getMessage(), e);
		}

		return false;
	}

	/**
	 * 根据property名字获取property值
	 * 
	 * @param propertyName
	 * @return
	 */
	public String getPropertyValue(String propertyName)
	{
		try
		{
			return BeanUtils.getProperty(this, propertyName);
		} catch (Exception e)
		{
			logger.error(propertyName + " " + e.getMessage());
		}

		return null;
	}

	/**
	 * 设置父对象ID
	 * 
	 * @param parentId
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	public void setParentKeyValue(Long parentKeyValue) throws Exception
	{
		String parentKeyColumnName = findParentKeyColumnName();
		if (!StringUtil.isEmpty(parentKeyColumnName))
		{
			BeanUtils.setProperty(this, parentKeyColumnName, parentKeyValue);
		}
	}

	/**
	 * 保存或更新
	 * 
	 * @return
	 */
	public boolean saveOrUpdate()
	{
		return new DefaultBaseDAO(this.getClass()).saveOrUpdate(this);
	}

	/**
	 * 保存
	 * 
	 * @return
	 */
	public boolean save()
	{
		return save(SystemConstant.DEFAULT_DB);
	}

	public boolean save(String dbName)
	{
		return new DefaultBaseDAO(this.getClass(), dbName).save(this);
	}

	/**
	 * 更新
	 * 
	 * @return
	 */
	public boolean update()
	{
		return update(SystemConstant.DEFAULT_DB);
	}

	public boolean update(String dbName)
	{
		return new DefaultBaseDAO(this.getClass(), dbName).update(this);
	}

	/**
	 * 更新
	 * 
	 * @return
	 */
	public boolean updateIncludeNullProperties()
	{
		return updateIncludeNullProperties(SystemConstant.DEFAULT_DB);
	}

	public boolean updateIncludeNullProperties(String dbName)
	{
		return new DefaultBaseDAO(this.getClass(), dbName).updateIncludeNullProperties(this);
	}

	/**
	 * 刪除
	 * 
	 * @return
	 */
	public int delete() throws Exception
	{
		return delete(SystemConstant.DEFAULT_DB);
	}

	public int delete(String dbName) throws Exception
	{
		return new DefaultBaseDAO(this.getClass(), dbName).deleteByKey(this.findKeyValue() + "");
	}

	/**
	 * 查询
	 * 
	 * @return
	 */
	public Object searchBykey(String keyValue)
	{
		return searchBykey(keyValue, SystemConstant.DEFAULT_DB);
	}

	public Object searchBykey(String keyValue, String dbName)
	{
		return new DefaultBaseDAO(this.getClass(), dbName).searchByKey(this.getClass(), keyValue);
	}

	/**
	 * 查询,精确查询
	 * 
	 * @return
	 */
	public BaseDbObj searchByInstance()
	{
		return searchByInstance(SystemConstant.DEFAULT_DB);
	}

	public BaseDbObj searchByInstance(String dbName)
	{
		IBaseDAO dao = new DefaultBaseDAO(this.getClass(), dbName);
		List list = dao.searchPaginationByDomainInstance(this, false, null, 0, 1).getDataList();
		if (list.size() > 0)
		{
			return (BaseDbObj) list.get(0);
		}
		return null;
	}

	/**
	 * 获取父对象
	 * 
	 * @return
	 */
	public BaseDbObj findParent()
	{
		return findParent(SystemConstant.DEFAULT_DB);
	}

	public BaseDbObj findParent(String dbName)
	{
		Class parentClz = findParentClz();
		if (parentClz != null)
		{
			try
			{
				IBaseDAO dao = new DefaultBaseDAO(parentClz, dbName);
				Object parent;

				parent = dao.searchByKey(parentClz, BeanUtils.getProperty(this, this.findParentKeyColumnName()));
				return (BaseDbObj) parent;
			} catch (Exception e)
			{
				logger.error(e.getMessage(), e);
			}
		}
		return null;
	}

	/**
	 * 获取父对象类，需要在具体实现类中重写该方法
	 * 
	 * @return
	 */
	public Class findParentClz()
	{
		return null;
	}

	/**
	 * 设置子对象列表，一般用于设置从前台填写的数据
	 * 
	 * @param children
	 */
	public void putChildren(List<BaseDbObj> children)
	{
		this.children = children;
	}

	/**
	 * 获取子对象列表
	 * 
	 * @return
	 */
	public List<BaseDbObj> findChildren()
	{
		// 只有chidren为空的时候才会去数据库中查询，也就是说如果前台传递过来了子对象数据，则不会再到数据库中查询
		if (children == null)
		{
			children = findChildren(SystemConstant.DEFAULT_DB);
		}
		return children;
	}

	public List<BaseDbObj> findChildren(String dbName)
	{
		Class childClz = findChildClz();
		try
		{
			if (childClz != null)
			{
				IBaseDAO dao = new DefaultBaseDAO(childClz, dbName);
				return dao.searchByParentKey(childClz, this.findKeyValue() + "", ((BaseDbObj) childClz.newInstance()).findKeyColumnName() + " asc");
			}
		} catch (Exception e)
		{
			logger.error(e.getMessage(), e);
		}

		return new ArrayList<BaseDbObj>();
	}

	/**
	 * 获取子对象类，需要在具体实现类中重写该方法
	 * 
	 * @return
	 */
	public Class findChildClz()
	{
		return null;
	}
}
