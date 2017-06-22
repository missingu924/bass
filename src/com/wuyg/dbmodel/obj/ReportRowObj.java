package com.wuyg.dbmodel.obj;

import java.util.ArrayList;
import java.util.List;

public class ReportRowObj
{
	private List<ReportColumnObj> columns = new ArrayList<ReportColumnObj>();

	public List<ReportColumnObj> getColumns()
	{
		return columns;
	}

	public void setColumns(List<ReportColumnObj> columns)
	{
		this.columns = columns;
	}

	public void addColumn(ReportColumnObj column)
	{
		this.columns.add(column);
	}

	@Override
	public String toString()
	{
		StringBuffer s = new StringBuffer();
		for (int i = 0; i < columns.size(); i++)
		{
			s.append(columns.get(i).getValue() + "\t");
		}
		return s.toString();
	}
}
