package com.wuyg.echarts;

import java.util.List;

import com.sun.jndi.url.ldaps.ldapsURLContextFactory;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.util.StringUtil;
import com.wuyg.echarts.obj.InvObj;

public class EchartsUtil
{
	// 图表类型
	public static final String BAR = "bar";
	public static final String PIE = "pie";
	public static final String LINE = "line";

	// 图表颜色
	public static final String COLOR_GREEN = "#2EC7C9";
	public static final String COLOR_PURPLE = "#B6A2DE";
	public static final String COLOR_BLUE = "#5AB1EF";
	public static final String COLOR_ORANGE = "#FFB980";
	public static final String COLOR_RED = "#D87A80";
	public static final String COLOR_CYAN = "#8D98B3";

	// 图表主题
	public static final String THEME_INFOGRAPHIC = "infographic";
	public static final String THEME_MACARONS = "macarons";
	public static final String THEME_ROMA = "roma";
	public static final String THEME_SHINE = "shine";

	/**
	 * 根据knvobj对象实例生成图表
	 * 
	 * @param knvObj
	 *            knv对象
	 * @param echartType
	 *            图表类型 line|bar|pie
	 * @param echartTheme
	 *            图表主题
	 * @param color
	 *            图表颜色
	 * @return
	 */
	public static String createEchartByInv(InvObj knvObj, String echartType, String echartTheme, String color, int height, int width)
	{
		IBaseDAO dao = new DefaultBaseDAO(knvObj);

		PaginationObj pagination = dao.searchPaginationByDomainInstance(knvObj, knvObj.findDefaultOrderBy(), 0, Integer.MAX_VALUE);

		return createEchartByDatalist(knvObj.getCnName(), pagination.getDataList(), "name", knvObj.getPropertyCnName("name"), "value", knvObj.getPropertyCnName("value"), echartType, echartTheme, color, width, height);
	}

	/**
	 * 根据sql生成图表
	 * 
	 * @param invSql
	 *            该sql直接用于进行数据查询，查询的列中必须包含id,name,value三个字段，其中name是x轴、value是数据
	 * @param orderBy
	 *            sql里面的排序语句
	 * @param title
	 *            图表标题
	 * @param xAxisCnName
	 *            x轴中文名
	 * @param seriesCnName
	 *            数据系列中文名
	 * @param echartType
	 *            图表类型 line|bar|pie
	 * @param echartTheme
	 *            图表主题
	 * @param color
	 *            图表颜色
	 * @return
	 */
	public static String createEchartByInvSql(String invSql, String orderBy, String title, String xAxisCnName, String seriesCnName, String echartType, String echartTheme, String color, int width, int height)
	{
		InvObj knvObj = new InvObj(invSql, orderBy, title, xAxisCnName, seriesCnName);
		return createEchartByInv(knvObj, echartType, echartTheme, color, width, height);
	}

	/**
	 * 根据查询出的基于BaseDbObj的数据列表形成图表
	 * 
	 * @param title
	 *            图表标题
	 * @param dataList
	 *            数据列表
	 * @param xAxisProperty
	 *            x轴对应的BaseDbObj属性
	 * @param seriesProperty
	 *            数据序列对应的BaseDbObj属性
	 * @param echartType
	 *            图表类型 line|bar|pie
	 * @param echartTheme
	 *            图表主题
	 * @param color
	 *            图表颜色
	 * @return
	 */
	public static String createEchartByDatalist(String title, List<BaseDbObj> dataList, String xAxisProperty, String seriesProperty, String echartType, String echartTheme, String color, int width, int height)
	{
		if (dataList == null || dataList.size() == 0)
		{
			return "";
		}
		BaseDbObj dbObj = dataList.get(0);
		return createEchartByDatalist(title, dataList, xAxisProperty, dbObj.getPropertyCnName(xAxisProperty), seriesProperty, dbObj.getPropertyCnName(seriesProperty), echartType, echartTheme, color, width, height);
	}

	/**
	 * 根据查询出的基于BaseDbObj的数据列表形成图表
	 * 
	 * @param title
	 *            图表标题
	 * @param dataList
	 *            数据列表
	 * @param xAxisProperty
	 *            x轴对应的BaseDbObj属性
	 * @param xAxisProperty
	 *            x轴中文名
	 * @param seriesProperty
	 *            数据序列对应的BaseDbObj属性
	 * @param seriesCnName
	 *            数据序列中文名
	 * @param echartType
	 *            图表类型 line|bar|pie
	 * @param echartTheme
	 *            图表主题
	 * @param color
	 *            图表颜色
	 * @return
	 */
	public static String createEchartByDatalist(String title, List<BaseDbObj> dataList, String xAxisProperty, String xAxisCnName, String seriesProperty, String seriesCnName, String echartType, String echartTheme, String color, int width, int height)
	{
		if (dataList == null || dataList.size() == 0)
		{
			return "";
		}

		StringBuffer s = new StringBuffer();
		try
		{
			Thread.sleep(1l);// 防止div_id重复
		} catch (Exception e)
		{
		}

		String divId = "echart_div_" + System.currentTimeMillis();

		s.append("    <script src=\"../echarts/echarts.common.min.js\"></script> \n");
		s.append("    <script src=\"../echarts/theme/" + echartTheme + ".js\"></script> \n");
		s.append("    <script src=\"echarts/echarts.common.min.js\"></script> \n");
		s.append("    <script src=\"echarts/theme/" + echartTheme + ".js\"></script> \n");
		s.append("    <!-- 为ECharts准备一个具备大小（宽高）的Dom --> \n");
		s.append("    <div id=\"" + divId + "\" style=\"align:center;width:" + width + "px;height:" + height + "px;\"></div> \n");
		s.append("    <script type=\"text/javascript\"> \n");
		s.append("        var " + divId + " = echarts.init(document.getElementById('" + divId + "'),'" + echartTheme + "'); \n");
		s.append(" \n");
		s.append("        // 指定图表的配置项和数据 \n");
		s.append("        var " + divId + "_option = { \n");
		if (BAR.equalsIgnoreCase(echartType) || LINE.equalsIgnoreCase(echartType))
		{
			if (!StringUtil.isEmpty(color))
			{
				s.append(" color: ['" + color + "'], \n");
			}
		}
		s.append("            title: { \n");
		s.append("                text: '" + title + "' \n");
		s.append("            }, \n");
		s.append("            tooltip: {}, \n");
		s.append("            legend: { \n");
		s.append("                data:['" + seriesCnName + "'] \n");
		s.append("            }, \n");

		String xAxis = "";
		String series = "";
		String nameValues = "";
		for (int i = 0; i < dataList.size(); i++)
		{
			BaseDbObj o = dataList.get(i);
			xAxis += "\"" + o.getPropertyValue(xAxisProperty) + "\"";
			series += o.getPropertyValue(seriesProperty);
			nameValues += "{name:'" + o.getPropertyValue(xAxisProperty) + "',value:" + o.getPropertyValue(seriesProperty) + "}";
			if (i < dataList.size() - 1)
			{
				xAxis += ",";
				series += ",";
				nameValues += ",";
			}
		}
		if (BAR.equalsIgnoreCase(echartType) || LINE.equalsIgnoreCase(echartType))
		{
			s.append("            xAxis: { \n");
			s.append("                data: [" + xAxis + "] \n");
			s.append("            }, \n");
			s.append("            yAxis: {}, \n");
		}
		if (PIE.equalsIgnoreCase(echartType))
		{
			s.append("            tooltip : { \n");
			s.append("                    trigger: 'item', \n");
			s.append("                    formatter: \"{a} <br/>{b} : {c} ({d}%)\" \n");
			s.append("            },\n");
		}
		s.append("            series: [{ \n");
		s.append("                name: '" + seriesCnName + "', \n");
		s.append("                type: '" + echartType + "', \n");
		s.append("                data: [" + nameValues + "] \n");
		s.append("            }] \n");
		s.append("        }; \n");
		s.append(" \n");
		s.append("        " + divId + ".setOption(" + divId + "_option); \n");
		s.append("    </script> \n");

		return s.toString();
	}

	/**
	 * 根据inv sql获取值
	 * 
	 * @param invSql
	 *            inv sql,即包含id、name、value三列的sql
	 * @return
	 */
	public static Double getValueByInvSql(String invSql)
	{
		InvObj inv = new InvObj(invSql, null, null, null, null);

		IBaseDAO dao = new DefaultBaseDAO(inv);
		List<InvObj> list = dao.searchAll(inv.getClass());
		if (list.size() > 0)
		{
			inv = list.get(0);
		}

		return inv.getValue();
	}

	public static void main(String[] args)
	{
		System.out.println(Math.round(Math.random() * 10 / 2));
	}
}
