package com.hcp.obj;

public class HcpDataSourceBaseInfoMapDetailObjExtended extends HcpDataSourceBaseInfoMapDetailObj
{
	@Override
	public String findTableName()
	{
		return "(select t.*,case when dst_code is null then 'true' else 'false' end as dont_mapped from hcp_data_source_base_info_map_detail t) t";
	}
}
