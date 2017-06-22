package com.wuyg.dbmodel.obj;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;

public class DbmodelTableObj extends BaseDbObj
{
	private Long id;
	private String tablename;
	private String javapackage;
	private String javasrcdir;
	private String cnname;
	private String iconpath;
	private Boolean fordetail;
	private Boolean containsoperationcol;
	private String keycolumn;
	private String uniquecolumn;

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
		return "dbmodel_table";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "DbmodelTable";
	}

	@Override
	public String getCnName()
	{
		return "数据表";
	}

	@Override
	public List<String> findUniqueIndexProperties()
	{
		return Arrays.asList(new String[]
		{});
	}

	public LinkedHashMap<String, String> findProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "id");
		pros.put("tablename", "表/视图名");
		pros.put("javapackage", "源码Package全名");
		pros.put("javasrcdir", "源码存放路径");
		pros.put("cnname", "中文名");
		pros.put("iconpath", "图标路径");
		pros.put("fordetail", "生成详情及增改页面");
		pros.put("containsoperationcol", "列表中包含操作列");
		pros.put("keycolumn", "主键列名");
		pros.put("uniquecolumn", "唯一索引列名");
		return pros;
	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getTablename()
	{
		return tablename;
	}

	public void setTablename(String tablename)
	{
		this.tablename = tablename;
	}

	public String getJavapackage()
	{
		return javapackage;
	}

	public void setJavapackage(String javapackage)
	{
		this.javapackage = javapackage;
	}

	public String getJavasrcdir()
	{
		return javasrcdir;
	}

	public void setJavasrcdir(String javasrcdir)
	{
		this.javasrcdir = javasrcdir;
	}

	public String getCnname()
	{
		return cnname;
	}

	public void setCnname(String cnname)
	{
		this.cnname = cnname;
	}

	public String getIconpath()
	{
		return iconpath;
	}

	public void setIconpath(String iconpath)
	{
		this.iconpath = iconpath;
	}

	public Boolean getFordetail()
	{
		return fordetail;
	}

	public void setFordetail(Boolean fordetail)
	{
		this.fordetail = fordetail;
	}

	public Boolean getContainsoperationcol()
	{
		return containsoperationcol;
	}

	public void setContainsoperationcol(Boolean containsoperationcol)
	{
		this.containsoperationcol = containsoperationcol;
	}

	public String getKeycolumn()
	{
		return keycolumn;
	}

	public void setKeycolumn(String keycolumn)
	{
		this.keycolumn = keycolumn;
	}

	public String getUniquecolumn()
	{
		return uniquecolumn;
	}

	public void setUniquecolumn(String uniquecolumn)
	{
		this.uniquecolumn = uniquecolumn;
	}

	public List<DbmodelColumnObj> findTableColumns()
	{
		IBaseDAO dao = new DefaultBaseDAO(DbmodelColumnObj.class);

		return dao.searchByParentKey(DbmodelColumnObj.class, this.id + "", "id");
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
