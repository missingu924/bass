package com.wuyg.dbmodel.obj;

import java.util.ArrayList;
import java.util.List;

public class ReportHeadObj
{
	private List<DbmodelColumnObj> heads = new ArrayList<DbmodelColumnObj>();

	public List<DbmodelColumnObj> getHeads()
	{
		return heads;
	}

	public void setHeads(List<DbmodelColumnObj> heads)
	{
		this.heads = heads;
	}

	public void addHead(DbmodelColumnObj headColumn)
	{
		this.heads.add(headColumn);
	}

	@Override
	public String toString()
	{
		StringBuffer s = new StringBuffer();

		for (int i = 0; i < heads.size(); i++)
		{
			s.append(heads.get(i).getColumncnname() + "\t");
		}
		return s.toString();
	}
}
