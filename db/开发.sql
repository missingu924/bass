
--����ɹ�����
drop view v_recent_unit_price_rd

create view v_recent_unit_price_rd01 as
select 
invc.cInvCCode,
invc.cInvCName,
inv.cInvCode,
inv.cInvName,
inv.cInvStd,
inv.cComUnitCode,
cu.cComUnitName,
iunitcost,
ddate 
from 
rdrecord01 
inner join rdrecords01 
on rdrecord01.id=rdrecords01.ID
inner join 
(
	select cInvCode,MAX(autoid) as autoid  from rdrecord01 inner join rdrecords01 on rdrecord01.id=rdrecords01.ID
	group by cInvCode 
)
t on rdrecords01.AutoID =t.autoid 
inner join inventory inv
on inv.cInvCode=t.cInvCode
left join InventoryClass invc
on inv.cInvCCode=invc.cInvCCode
left join ComputationUnit cu
on inv.cComUnitCode=cu.cComunitCode

--ĳ�����ⵥ��
select
rd.dDate,
rds.cInvCode,
rds.iUnitCost
from 
rdrecord01 rd
left join 
rdrecords01 rds
on rds.ID=rd.ID
where rds.cInvCode='01019002065'

--��������

select * from SO_SOMain

select * from SO_SODetails

--5��	���������¶ȷ�����

select 
so.*,
isnull(sbv.iSaleBillVouchTotal,0) iSaleBillVouchTotal,
isnull(apb.iAmountTotal,0)iAmountTotal
from
(
	--��������
	select
	iYear,
	iMonth,
	COUNT(1) iSaleCount,
	SUM(iSum) iSaleTotal
	from
	(
		select
		year(m.dDate) iYear,
		month(m.dDate) iMonth,
		d.iSum
		from SO_SOMain m
		left join SO_SODetails d
		on m.ID=d.ID
	) t
	group by 
	iYear,
	iMonth
) so
left join
(
	--������Ʊ
	select
	iYear,
	iMonth,
	SUM(iSum) iSaleBillVouchTotal
	from
	(
		select
		YEAR(sbv.ddate) iYear,
		MONTH(sbv.ddate) iMonth,
		sbvs.iSum
		from
		salebillvouch sbv
		left join
		salebillvouchs sbvs
		on sbv.SBVID=sbvs.SBVID
	) t
	group by 
	iYear,
	iMonth
) sbv
on so.iYear=sbv.iYear and so.iMonth=sbv.iMonth
left join
(
	--�����ؿ�
	select
	iYear,
	iMonth,
	SUM(iAmount) iAmountTotal
	from
	(
		select
		YEAR(dvouchdate) iYear,
		MONTH(dvouchdate) iMonth,
		iAmount 
		from
		ap_closebill apb
		where
		cVouchType='48'
	) t
	group by 
	iYear,
	iMonth
) apb
on so.iYear=apb.iYear and so.iMonth=apb.iMonth

--6��	��Ʒ����ͳ�Ʊ�
--��Ʒ������������ռ�ȡ�����������ռ�ȡ�������ռ�ȣ�����ȡ�� ĳ��Ʒ�ֿͻ���ͳ�ƣ�����������������ռ�ȣ�

select
invc.cInvCCode,
invc.cInvCName,
inv.cInvCode,
inv.cInvName,
inv.cInvStd,
inv.cComUnitCode,
cu.cComUnitName,
iCount,
iQuantity,
iSum
from
(
	select 
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
	dls.cInvCode is not null
	and 
	dDate>='2010' and dDate<='2018'
	group by
	dls.cInvCode
) dl
left join inventory inv
on inv.cInvCode=dl.cInvCode
left join InventoryClass invc
on inv.cInvCCode=invc.cInvCCode
left join ComputationUnit cu
on inv.cComUnitCode=cu.cComunitCode


--7��	�ͻ�����ͳ�Ʊ�
--�ͻ�������������ռ�ȡ�����������ռ�ȡ�������ռ�ȣ�����ȡ�� ĳ�ͻ��ֲ�Ʒ��ͳ�ƣ�����������������ռ�ȣ�

select
cust.cCusCode,
cust.cCusName,
cust.cCusAbbName,
dl.iCount,
dl.iQuantity,
dl.iSum
from
(
	select 
	dl.cCusCode,
	COUNT(*) iCount,
	sum(dls.iQuantity) iQuantity,
	sum(dls.iSum) iSum
	from 
	DispatchList dl
	left join
	DispatchLists dls
	on dl.DLID=dls.DLID
	where
	dls.cInvCode is not null
	and 
	dDate>='2010' and dDate<='2018'
	group by
	dl.cCusCode
) dl
left join
Customer cust
on dl.cCusCode=cust.cCusCode

--�ͻ�+��Ʒͳ��
drop view v_dispatch_cust_inv_stat

create view v_dispatch_cust_inv_stat
as
select
1 as id,
custclass.cCCCode,
custclass.cCCName,
cust.cCusCode,
cust.cCusName,
cust.cCusAbbName,
invc.cInvCCode,
invc.cInvCName,
inv.cInvCode,
inv.cInvName,
inv.cInvStd,
inv.cComUnitCode,
cu.cComUnitName,
dl.iCount,
dl.iQuantity,
dl.iSum
from
(
	select 
	dl.cCusCode,
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
	dls.cInvCode is not null
	and dDate>='2010' and dDate<='2018'
	--and cCusCode=''
	group by
	dl.cCusCode,
	dls.cInvCode
) dl
left join
Customer cust
on dl.cCusCode=cust.cCusCode
left join CustomerClass custclass
on cust.cCCCode=custclass.cCCCode
left join inventory inv
on inv.cInvCode=dl.cInvCode
left join InventoryClass invc
on inv.cInvCCode=invc.cInvCCode
left join ComputationUnit cu
on inv.cComUnitCode=cu.cComunitCode

order by dl.cCusCode,dl.cInvCode,dl.iSum

--������������ϸ
create view v_dispatch_lists
as
select 
dls.AutoID,
dl.dDate,
dl.DLID,
dl.cDLCode,
custclass.cCCCode,
custclass.cCCName,
cust.cCusCode,
cust.cCusName,
cust.cCusAbbName,
invc.cInvCCode,
invc.cInvCName,
inv.cInvCode,
inv.cInvName,
inv.cInvStd,
inv.cComUnitCode,
cu.cComUnitName,
dls.iQuantity,
dls.iSum  
from 
DispatchList dl
left join
DispatchLists dls
on dl.DLID=dls.DLID
left join
Customer cust
on dl.cCusCode=cust.cCusCode
left join CustomerClass custclass
on cust.cCCCode=custclass.cCCCode
left join inventory inv
on inv.cInvCode=dls.cInvCode
left join InventoryClass invc
on inv.cInvCCode=invc.cInvCCode
left join ComputationUnit cu
on inv.cComUnitCode=cu.cComunitCode


select * from DispatchList

--��Ʒ�������ʱ��
select
invc.cInvCCode,
invc.cInvCName,
inv.cInvCode,
inv.cInvName,
inv.cInvStd,
inv.cComUnitCode,
cu.cComUnitName,
dls.dRecentDate,
dls.iDays
from
(
	select 
	cInvCode,
	MAX(dDate) dRecentDate,
	DATEDIFF(day,max(dDate),getdate()) iDays
	from 
	DispatchList dl
	left join
	DispatchLists dls
	on dl.DLID=dls.DLID
	group by
	cInvCode
) dls
left join inventory inv
on inv.cInvCode=dls.cInvCode
left join InventoryClass invc
on inv.cInvCCode=invc.cInvCCode
left join ComputationUnit cu
on inv.cComUnitCode=cu.cComunitCode
order by dls.iDays

--�ͻ��������ʱ��
select
custclass.cCCCode,
custclass.cCCName,
cust.cCusCode,
cust.cCusName,
cust.cCusAbbName,
dl.dRecentDate,
dl.iDays
from
(
	select 
	cCusCode,
	MAX(dDate) dRecentDate,
	DATEDIFF(day,max(dDate),getdate()) iDays
	from 
	DispatchList dl
	group by
	cCusCode
) dl
left join
Customer cust
on dl.cCusCode=cust.cCusCode
left join CustomerClass custclass
on cust.cCCCode=custclass.cCCCode
order by dl.iDays

--���ĩ�ζ�������
select 
inventory.cinvccode as ��Ʒ�������,
InventoryClass.cinvcname as ��Ʒ��������,
ck.cInvCode as ��Ʒ����,
inventory.cinvname as ��Ʒ����,
inventory.cinvstd as ���,
ck.iQuantity as �ִ���,
xs.ddate as �����������,
DATEDIFF(day,isnull(xs.ddate,0),CONVERT(varchar(100),GETDATE(), 23)) as ����û�ж�������
from 
(
	select cinvcode,sum(isnull(iquantity,0)) as iquantity from currentstock group by cinvcode
)ck
left join
(
	select cInvCode,max(ddate) as ddate from salebillvouchs ss inner join salebillvouch sh on ss.SBVID=sh.SBVID group by cInvCode
)as xs
on ck.cInvCode=xs.cInvCode
inner join inventory on ck.cinvcode=inventory.cinvcode 
inner join InventoryClass on inventory.cinvccode=InventoryClass.cinvccode
where
ck.iQuantity<>0 
order by ck.iquantity desc


--���������ͻ�
 select cCusCode from salebillvouch  
 where 
 dDate>='2017-06-01' 
 and
 cCusCode
 not in (select cCusCode from salebillvouch where dDate<'2017-06-01')