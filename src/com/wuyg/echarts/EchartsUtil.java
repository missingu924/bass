package com.wuyg.echarts;

import java.util.List;

import com.sun.jndi.url.ldaps.ldapsURLContextFactory;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.echarts.obj.InvObj;

public class EchartsUtil
{
	// 图表类型
	public static final String BAR = "bar";// 横柱图
	public static final String BAR_V = "bar_v";// 竖柱图
	public static final String PIE = "pie";
	public static final String LINE = "line";

	// 图表颜色
	public static final String COLOR_GREEN = "#2EC7C9";
	public static final String COLOR_GREEN_DARK = "#009966";
	public static final String COLOR_PURPLE = "#B6A2DE";
	public static final String COLOR_BLUE = "#0066cc";// "#5AB1EF";
	public static final String COLOR_ORANGE = "#FF6600";
	public static final String COLOR_RED = "#D87A80";
	public static final String COLOR_CYAN = "#99cc00";

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
	 * @throws Exception
	 */
	public static String createEchartByInv(InvObj knvObj, String echartType, String echartTheme, String color, int height, int width, String clickJs) throws Exception
	{
		IBaseDAO dao = new DefaultBaseDAO(knvObj, SystemConstant.U8_DB);

		// 把非空的基本条件设置上
		String where = " 1=1 ";
		try
		{
			where += MyBeanUtils.getWhereByBaseDbObj(knvObj, dao.getTableMetaData(), false);
		} catch (Exception e)
		{
		}

		List<BaseDbObj> list = dao.searchByClause(knvObj.getClass(), where, knvObj.findDefaultOrderBy(), 0, Integer.MAX_VALUE);

		return createEchartByDatalist(knvObj.getCnName(), list, new String[]
		{ "name", "name1" }, new String[]
		{ knvObj.getPropertyCnName("name"), knvObj.getPropertyCnName("name1") }, new String[]
		{ "value", "value1" }, new String[]
		{ knvObj.getPropertyCnName("value"), knvObj.getPropertyCnName("value1") }, echartType, echartTheme, color, width, height, clickJs);
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
	 * @throws Exception
	 */
	public static String createEchartByInvSql(String invSql, String orderBy, String title, String xAxisCnName, String seriesCnName, String echartType, String echartTheme, String color, int width, int height, String clickJs) throws Exception
	{
		InvObj knvObj = new InvObj(invSql, orderBy, title, xAxisCnName, seriesCnName);
		return createEchartByInv(knvObj, echartType, echartTheme, color, width, height, clickJs);
	}

	public static String createEchartByInvSql(String invSql, String orderBy, String title, String[] xAxisCnNames, String seriesCnNames[], String echartType, String echartTheme, String color, int width, int height, String clickJs) throws Exception
	{
		InvObj knvObj = new InvObj(invSql, orderBy, title, xAxisCnNames, seriesCnNames);
		return createEchartByInv(knvObj, echartType, echartTheme, color, width, height, clickJs);
	}

	public static String createEchartByInvSql(String invSql, String orderBy, String title, String xAxisCnName, String seriesCnName, String echartType, String echartTheme, String color, String clickJs) throws Exception
	{
		InvObj knvObj = new InvObj(invSql, orderBy, title, xAxisCnName, seriesCnName);
		return createEchartByInv(knvObj, echartType, echartTheme, color, 300, -1, clickJs);
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
	 * @throws Exception
	 */
	public static String createEchartByDatalist(String title, List<BaseDbObj> dataList, String xAxisProperty, String seriesProperty, String echartType, String echartTheme, String color, int width, int height, String clickJs) throws Exception
	{
		if (dataList == null || dataList.size() == 0)
		{
			return "";
		}

		BaseDbObj dbObj = dataList.get(0);

		return createEchartByDatalist(title, dataList, new String[]
		{ xAxisProperty }, new String[]
		{ dbObj.getPropertyCnName(xAxisProperty) }, new String[]
		{ seriesProperty }, new String[]
		{ dbObj.getPropertyCnName(seriesProperty) }, echartType, echartTheme, color, width, height, clickJs);
	}

	public static String createEchartByInvDatalist(List dataList, String echartType, String echartTheme, String color, int width, int height, String clickJs) throws Exception
	{
		return createEchartByDatalist("", dataList, "name", "value", echartType, echartTheme, color, width, height, clickJs);
	}

	public static String createTableByInvDatalist(List dataList, int width, int height, String clickJs)
	{
		if (dataList.size() == 0)
		{
			return "";
		}

		StringBuffer s = new StringBuffer();

		InvObj inv = (InvObj) dataList.get(0);

		// 输出表
		s.append("<div style='width: " + (width > 0 ? width : "") + "; height:" + (height > 0 ? height : "") + "px; overflow:auto'>\n");
		s.append("<table class='table table-bordered' style='margin:10px'>\n");
		s.append("	<thead>\n");
		s.append("		<tr>\n");
		s.append("			<th>序号</th>\n");
		s.append("			<th>编码</th>\n");
		s.append("			<th>" + inv.getPropertyCnName("name") + "</th>\n");
		s.append("			<th>" + inv.getPropertyCnName("value") + "</th>\n");
		s.append("			<th>占比</th>\n");
		s.append("		</tr>\n");
		s.append("	</thead>\n");

		// 合计
		double sum = 0;
		for (int i = 0; i < dataList.size(); i++)
		{
			inv = (InvObj) dataList.get(i);
			if (inv.getValue() != null)
			{
				sum += inv.getValue().doubleValue();
			}
		}

		for (int i = 0; i < dataList.size(); i++)
		{
			inv = (InvObj) dataList.get(i);
			s.append("	<tr>\n");
			s.append("		<td>" + (i + 1) + "</td>\n");
			s.append("		<td>" + inv.getCode() + "</td>\n");
			if (!StringUtil.isEmpty(clickJs))
			{
				s.append("		<td><a href='#' onclick='" + clickJs.replaceAll("params.data.code", "\"" + inv.getCode() + "\"").replaceAll("params.data.name", "\"" + inv.getName() + "\"").replaceAll("params.data.value", "\"" + inv.getValue() + "\"") + "'>" + inv.getName() + "</a></td>\n");
			} else
			{
				s.append("		<td>" + inv.getName() + "</td>\n");
			}

			s.append("		<td style='text-align:right'>" + StringUtil.formatDouble(inv.getValue(), 4) + "</td>\n");
			s.append("		<td style='text-align:right'>" + (inv.getValue() == null ? 0 : StringUtil.formatDouble((inv.getValue() / sum * 100), 2)) + "%</td>\n");
			s.append("	</tr>\n");
		}

		s.append("	<tr style='color:blue'>\n");
		s.append("		<td>合计</td>\n");
		s.append("		<td></td>\n");
		s.append("		<td></td>\n");
		s.append("		<td style='text-align:right'>" + StringUtil.formatDouble(sum, 4) + "</td>\n");
		s.append("		<td style='text-align:right'>100%</td>\n");
		s.append("	</tr>\n");

		s.append("</table>\n");
		s.append("</div>\n");

		return s.toString();
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
	 * @throws Exception
	 */
	public static String createEchartByDatalist(String title, List<BaseDbObj> dataList, String[] xAxisPropertys, String[] xAxisCnNames, String[] seriesPropertys, String[] seriesCnNames, String echartType, String echartTheme, String color, int width, int height, String clickJs) throws Exception
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
		s.append("    <div id=\"" + divId + "\" style=\"align:center;margin:0 auto;overflow:auto;" + (width > 0 ? "width:" + width + "px;" : "") + (height > 0 ? "height:" + height + "px;" : "") + "\"></div> \n");
		s.append("    <script type=\"text/javascript\"> \n");
		s.append("        var " + divId + " = echarts.init(document.getElementById('" + divId + "'),'" + echartTheme + "'); \n");
		s.append(" \n");
		s.append("        // 指定图表的配置项和数据 \n");
		s.append("        var " + divId + "_option = { \n");
		if (BAR.equalsIgnoreCase(echartType) || BAR_V.equalsIgnoreCase(echartType) || LINE.equalsIgnoreCase(echartType))
		{
			if (!StringUtil.isEmpty(color))
			{
				s.append(" color: ['" + color + "'], \n");
			}
		}
		s.append("            title: { \n");
		s.append("                text: '" + title + "', \n");
		s.append("            }, \n");
		s.append("            tooltip: {}, \n");
		s.append("            legend: { \n");
		s.append("                data:[ \n");
		for (int i = 0; i < seriesCnNames.length; i++)
		{
			s.append("'" + seriesCnNames[i] + "' \n");
			if (i < seriesCnNames.length - 1)
			{
				s.append(",");
			}
		}
		s.append("                ], \n");
		s.append("                top:'20', \n");
		s.append("            }, \n");
		s.append("            grid: {\n");
		s.append("            	 left: '3%',\n");
		s.append("           	 right: '3%',\n");
		s.append("            	 bottom: '3%',\n");
		s.append("             	 containLabel: true\n");
		s.append("             },\n");

		String xAxis = "", xAxis1 = "", xAxis2 = "", xAxis3 = "", xAxis4 = "";
		String series = "", series1 = "", series2 = "", series3 = "", series4 = "";
		String nameValues = "", nameValues1 = "", nameValues2 = "", nameValues3 = "", nameValues4 = "";

		for (int i = 0; i < dataList.size(); i++)
		{
			BaseDbObj o = dataList.get(i);
			xAxis += "\"" + o.getPropertyValue(xAxisPropertys[0]) + "\"";
			series += o.getPropertyValue(seriesPropertys[0]);
			nameValues += "{code:'" + o.getPropertyValue("code") + "',name:'" + o.getPropertyValue(xAxisPropertys[0]) + "',value:" + o.getPropertyValue(seriesPropertys[0]) + "}";
			if (i < dataList.size() - 1)
			{
				xAxis += ",";
				series += ",";
				nameValues += ",";
			}
		}
		if (seriesPropertys.length > 1 && !PIE.equalsIgnoreCase(echartType))
		{
			for (int i = 0; i < dataList.size(); i++)
			{
				BaseDbObj o = dataList.get(i);
				xAxis1 += "\"" + o.getPropertyValue(xAxisPropertys[1]) + "\"";
				series1 += o.getPropertyValue(seriesPropertys[1]);
				nameValues1 += "{name:'" + o.getPropertyValue(xAxisPropertys[1]) + "',value:" + o.getPropertyValue(seriesPropertys[1]) + "}";
				if (i < dataList.size() - 1)
				{
					xAxis1 += ",";
					series1 += ",";
					nameValues1 += ",";
				}
			}
		}

		if (BAR.equalsIgnoreCase(echartType) || LINE.equalsIgnoreCase(echartType))
		{
			s.append("            xAxis: { \n");
			s.append("                data: [" + xAxis + "], \n");
			s.append("            	  splitLine: {show: false}, \n");
			// s.append(" axisLabel: {interval:0}, \n");// rotate: -30 倾斜
			// s.append(" splitArea: {show: false}, \n");
			s.append("            }, \n");
			s.append("            yAxis: { \n");
			s.append("            	  splitLine: {show: false}, \n");
			s.append(" splitArea: {show: false}, \n");
			s.append("            }, \n");
		} else if (BAR_V.equalsIgnoreCase(echartType))
		{
			s.append("            xAxis: { \n");
			s.append("                type: 'value', \n");
			s.append("                position: 'top', \n");
			s.append("            	  splitLine: {show: false}, \n");
			s.append("            	  axisLabel: {interval:0}, \n");
			// s.append(" splitArea: {show: false}, \n");
			s.append("            }, \n");
			s.append("            yAxis: {  \n");
			s.append("                type: 'category', \n");
			s.append("                inverse: true, \n");
			s.append("            	  splitLine: {show: false}, \n");
			s.append("            	  axisLabel: {interval:0}, \n");
			// s.append(" splitArea: {show: false}, \n");
			// s.append(" position: 'right', \n");
			s.append("                data:[" + xAxis + "] \n");
			s.append("            }, \n");
		} else if (PIE.equalsIgnoreCase(echartType))
		{
			s.append("            tooltip : { \n");
			s.append("                    trigger: 'item', \n");
			s.append("                    formatter: \"{a} <br/>{b} : {c} ({d}%)\" \n");
			s.append("            },\n");
		}

		s.append("            series: [ \n");
		s.append("            	{ \n");
		s.append("                name: '" + seriesCnNames[0] + "', \n");
		s.append("                label: { normal: { show: true,position: '" + (echartType.equalsIgnoreCase(BAR) ? "top" : "right") + "'}}, \n");
		s.append("                type: '" + echartType.replaceAll("_v", "") + "', \n");
		s.append("                data: [" + nameValues + "] \n");
		s.append("            	} \n");
		if (seriesPropertys.length > 1 && !PIE.equalsIgnoreCase(echartType))
		{
			s.append("            	,{ \n");
			s.append("                name: '" + seriesCnNames[1] + "', \n");
			s.append("                label: { normal: { show: true,position: 'top'}}, \n");
			s.append("                type: '" + LINE + "', \n");
			s.append("                data: [" + nameValues1 + "] \n");
			s.append("            	} \n");
		}
		s.append("            ] \n");
		s.append("        }; \n");
		s.append(" \n");
		s.append("        " + divId + ".setOption(" + divId + "_option); \n");
		if (!StringUtil.isEmpty(clickJs))
		{
			s.append(" " + divId + ".on('click',function(params){" + clickJs + ";});");
		}
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
		InvObj inv = new InvObj(invSql, "", "", "", "");

		IBaseDAO dao = new DefaultBaseDAO(inv, SystemConstant.U8_DB);
		List<InvObj> list = dao.searchAll(inv.getClass());
		if (list.size() > 0)
		{
			inv = list.get(0);
		}

		return inv.getValue();
	}

	/**
	 * 根据sql查询inv数据list
	 * 
	 * @param invSql
	 * @param orderBy
	 * @return
	 */
	public static List getInvListByInvSql(String invSql, String orderBy, String cnName, String nameCnName, String valueCnName)
	{
		InvObj inv = new InvObj(invSql, orderBy, cnName, nameCnName, valueCnName);

		IBaseDAO dao = new DefaultBaseDAO(inv, SystemConstant.U8_DB);
		// List<InvObj> list = dao.searchPaginationByDomainInstance(inv, inv.findDefaultOrderBy(), 0, Integer.MAX_VALUE).getDataList();

		// 把非空的基本条件设置上
		String where = " 1=1 ";
		try
		{
			where += MyBeanUtils.getWhereByBaseDbObj(inv, dao.getTableMetaData(), false);
		} catch (Exception e)
		{
		}

		// 如果没有排序字段则使用domainInstance的默认排序字段
		if (StringUtil.isEmpty(orderBy))
		{
			orderBy = StringUtil.getNotEmptyStr(inv.findDefaultOrderBy());
		}

		List<InvObj> list = dao.searchByClause(inv.getClass(), where, orderBy, 0, Integer.MAX_VALUE);

		if (list.size() > 0)
		{
			inv = list.get(0);
			inv.getProperties().put("name", nameCnName);
			inv.getProperties().put("value", valueCnName);
		}

		return list;
	}

	public static void main(String[] args)
	{
		System.out.println(Math.round(Math.random() * 10 / 2));
	}
}
