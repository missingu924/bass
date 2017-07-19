--首页

--1、订单统计

--1.1、本月订单额

--1.2、本年度订单额



--订单排名

select
top 10
1 id,
p.cPersonName name,
dl.iSum value
from
(
	select 
	dl.cPersonCode,
	COUNT(*) iCount,
	sum(dls.iQuantity) iQuantity,
	sum(dls.iSum) iSum
	from 
	DispatchList dl
	left join
	DispatchLists dls
	on dl.DLID=dls.DLID
	where
	dl.cPersonCode is not null
	and 
	dDate>='2010' and dDate<='2018'
	group by
	dl.cPersonCode
) dl
left join
Person p
on dl.cPersonCode=p.cPersonCode
order by iSum desc

select *
from
(
	select 
	year(dl.dDate) iYear,
	month(dl.dDate) iMonth,
	dls.cInvCode,
	COUNT(*) iCount,
	sum(dls.iQuantity) iQuantity,
	sum(dls.iSum) iSum
	from 
	DispatchList dl
	left join
	DispatchLists dls
	on dl.DLID=dls.DLID
	where
	1=1 -- and dls.cInvCode=''
	and 
	dDate>='2010' and dDate<='2018'
	group by
	year(dl.dDate),
	month(dl.dDate),
	dls.cInvCode
) t 
order by 
cInvCode,
iYear,
iMonth