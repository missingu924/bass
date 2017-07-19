drop view v_dispatch_cust_inv_mom

create view v_dispatch_cust_inv_mom as
select
t.*,
'' cInvName,
'' cCusCode,
'' cCusName,
'' cPersonCode,
'' cPersonName,
(t.month_01_inatsum/l.month_01_inatsum-1)*100 month_01_inatsum_yoy,
(t.month_02_inatsum/l.month_02_inatsum-1)*100 month_02_inatsum_yoy,
(t.month_03_inatsum/l.month_03_inatsum-1)*100 month_03_inatsum_yoy,
(t.month_04_inatsum/l.month_04_inatsum-1)*100 month_04_inatsum_yoy,
(t.month_05_inatsum/l.month_05_inatsum-1)*100 month_05_inatsum_yoy,
(t.month_06_inatsum/l.month_06_inatsum-1)*100 month_06_inatsum_yoy,
(t.month_07_inatsum/l.month_07_inatsum-1)*100 month_07_inatsum_yoy,
(t.month_08_inatsum/l.month_08_inatsum-1)*100 month_08_inatsum_yoy,
(t.month_09_inatsum/l.month_09_inatsum-1)*100 month_09_inatsum_yoy,
(t.month_10_inatsum/l.month_10_inatsum-1)*100 month_10_inatsum_yoy,
(t.month_11_inatsum/l.month_11_inatsum-1)*100 month_11_inatsum_yoy,
(t.month_12_inatsum/l.month_12_inatsum-1)*100 month_12_inatsum_yoy,
(t.month_01_inatsum/l.month_12_inatsum-1)*100 month_01_inatsum_mom,
(t.month_02_inatsum/t.month_01_inatsum-1)*100 month_02_inatsum_mom,
(t.month_03_inatsum/t.month_02_inatsum-1)*100 month_03_inatsum_mom,
(t.month_04_inatsum/t.month_03_inatsum-1)*100 month_04_inatsum_mom,
(t.month_05_inatsum/t.month_04_inatsum-1)*100 month_05_inatsum_mom,
(t.month_06_inatsum/t.month_05_inatsum-1)*100 month_06_inatsum_mom,
(t.month_07_inatsum/t.month_06_inatsum-1)*100 month_07_inatsum_mom,
(t.month_08_inatsum/t.month_07_inatsum-1)*100 month_08_inatsum_mom,
(t.month_09_inatsum/t.month_08_inatsum-1)*100 month_09_inatsum_mom,
(t.month_10_inatsum/t.month_09_inatsum-1)*100 month_10_inatsum_mom,
(t.month_11_inatsum/t.month_10_inatsum-1)*100 month_11_inatsum_mom,
(t.month_12_inatsum/t.month_11_inatsum-1)*100 month_12_inatsum_mom,
(t.year_inatsum/(case when l.year_inatsum=0 then 1 else l.year_inatsum end)-1)*100 year_inatsum_yoy
from
(	
	select
	iyear,
	cInvCode,
	SUM(case when imonth='01' then iNatSum else null end) as month_01_inatsum,
	SUM(case when imonth='02' then iNatSum else null end) as month_02_inatsum,
	SUM(case when imonth='03' then iNatSum else null end) as month_03_inatsum,
	SUM(case when imonth='04' then iNatSum else null end) as month_04_inatsum,
	SUM(case when imonth='05' then iNatSum else null end) as month_05_inatsum,
	SUM(case when imonth='06' then iNatSum else null end) as month_06_inatsum,
	SUM(case when imonth='07' then iNatSum else null end) as month_07_inatsum,
	SUM(case when imonth='08' then iNatSum else null end) as month_08_inatsum,
	SUM(case when imonth='09' then iNatSum else null end) as month_09_inatsum,
	SUM(case when imonth='10' then iNatSum else null end) as month_10_inatsum,
	SUM(case when imonth='11' then iNatSum else null end) as month_11_inatsum,
	SUM(case when imonth='12' then iNatSum else null end) as month_12_inatsum,
	SUM(iNatSum) year_inatsum
	from
	(
		select DATENAME(year,dDate) iyear,DATENAME(month,dDate) imonth,cCusCode,cInvCode,cPersonCode,iQuantity,iNatSum/10000 iNatSum from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where iNatSum<>0
	) t
	where 
	iyear='2017'
	group by
	iyear,
	cInvCode
) t
left join
(
	select
	iyear,
	cInvCode,
	SUM(case when imonth='01' then iNatSum else null end) as month_01_inatsum,
	SUM(case when imonth='02' then iNatSum else null end) as month_02_inatsum,
	SUM(case when imonth='03' then iNatSum else null end) as month_03_inatsum,
	SUM(case when imonth='04' then iNatSum else null end) as month_04_inatsum,
	SUM(case when imonth='05' then iNatSum else null end) as month_05_inatsum,
	SUM(case when imonth='06' then iNatSum else null end) as month_06_inatsum,
	SUM(case when imonth='07' then iNatSum else null end) as month_07_inatsum,
	SUM(case when imonth='08' then iNatSum else null end) as month_08_inatsum,
	SUM(case when imonth='09' then iNatSum else null end) as month_09_inatsum,
	SUM(case when imonth='10' then iNatSum else null end) as month_10_inatsum,
	SUM(case when imonth='11' then iNatSum else null end) as month_11_inatsum,
	SUM(case when imonth='12' then iNatSum else null end) as month_12_inatsum,
	SUM(iNatSum) year_inatsum
	from
	(
		select DATENAME(year,dDate) iyear,DATENAME(month,dDate) imonth,cCusCode,cInvCode,cPersonCode,iQuantity,iNatSum/10000 iNatSum from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where iNatSum<>0
	) t
	where 
	iyear='2016'
	group by
	iyear,
	cInvCode
) l
on t.cInvCode=l.cInvCode

drop view v_dispatch_cust_inv_yoy

create view v_dispatch_cust_inv_yoy as
select
t.*,
'' cInvName,
'' cCusCode,
'' cCusName,
'' cPersonCode,
'' cPersonName,
(t.year_00_inatsum/t.year_01_inatsum-1)*100 year_00_inatsum_yoy,
(t.year_01_inatsum/t.year_02_inatsum-1)*100 year_01_inatsum_yoy,
(t.year_02_inatsum/t.year_03_inatsum-1)*100 year_02_inatsum_yoy,
(t.year_03_inatsum/t.year_04_inatsum-1)*100 year_03_inatsum_yoy,
(t.year_04_inatsum/t.year_05_inatsum-1)*100 year_04_inatsum_yoy,
(t.year_05_inatsum/t.year_06_inatsum-1)*100 year_05_inatsum_yoy,
(t.year_06_inatsum/t.year_07_inatsum-1)*100 year_06_inatsum_yoy,
(t.year_07_inatsum/t.year_08_inatsum-1)*100 year_07_inatsum_yoy,
(t.year_08_inatsum/t.year_09_inatsum-1)*100 year_08_inatsum_yoy,
(t.year_09_inatsum/t.year_10_inatsum-1)*100 year_09_inatsum_yoy,
(t.year_10_inatsum/t.year_11_inatsum-1)*100 year_10_inatsum_yoy,
SUM(year_inatsum) year_inatsum_yoy
from
(
	select
	iyear,
	cInvCode,
	SUM(case when year_interval=0 then iNatSum else null end) as year_00_inatsum,
	SUM(case when year_interval=1 then iNatSum else null end) as year_01_inatsum,
	SUM(case when year_interval=2 then iNatSum else null end) as year_02_inatsum,
	SUM(case when year_interval=3 then iNatSum else null end) as year_03_inatsum,
	SUM(case when year_interval=4 then iNatSum else null end) as year_04_inatsum,
	SUM(case when year_interval=5 then iNatSum else null end) as year_05_inatsum,
	SUM(case when year_interval=6 then iNatSum else null end) as year_06_inatsum,
	SUM(case when year_interval=7 then iNatSum else null end) as year_07_inatsum,
	SUM(case when year_interval=8 then iNatSum else null end) as year_08_inatsum,
	SUM(case when year_interval=9 then iNatSum else null end) as year_09_inatsum,
	SUM(case when year_interval=10 then iNatSum else null end) as year_10_inatsum,
	SUM(case when year_interval=11 then iNatSum else null end) as year_11_inatsum,
	SUM(iNatSum) year_inatsum
	from
	(
		select 2017-YEAR(dDate) year_interval, DATENAME(year,dDate) iyear,DATENAME(month,dDate) imonth,cCusCode,cInvCode,cPersonCode,iQuantity,iNatSum/10000 iNatSum from DispatchList dl left join DispatchLists dls on dl.DLID=dls.DLID where iNatSum<>0
	) t
	where 
	iyear>=2012 and iyear<=2017
	group by
	iyear,
	cInvCode
) t