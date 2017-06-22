package com.wuyg.dbmodel.obj;

import java.util.ArrayList;
import java.util.List;

public class ReportMainObj
{
	private ReportSearchConditionObj searchCondition;
	private ReportHeadObj head;
	private List<ReportRowObj> rows = new ArrayList<ReportRowObj>();

	public ReportSearchConditionObj getSearchCondition()
	{
		return searchCondition;
	}

	public void setSearchCondition(ReportSearchConditionObj searchCondition)
	{
		this.searchCondition = searchCondition;
	}

	public ReportHeadObj getHead()
	{
		return head;
	}

	public void setHead(ReportHeadObj head)
	{
		this.head = head;
	}

	public List<ReportRowObj> getRows()
	{
		return rows;
	}

	public void setRows(List<ReportRowObj> rows)
	{
		this.rows = rows;
	}

	public void addRow(ReportRowObj row)
	{
		this.rows.add(row);
	}

	@Override
	public String toString()
	{
		StringBuffer s = new StringBuffer();
		s.append(head.toString() + "\n");
		for (int i = 0; i < rows.size(); i++)
		{
			s.append(rows.get(i).toString() + "\n");
		}

		return s.toString();
	}
}
