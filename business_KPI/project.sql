--Linking KPIs with views and stored_procs (Odina)
create table #storekpi (
store_id int,
store_name varchar(150),
totalorders int,
totalsales decimal(18,2),
uniquecustomers int
);

insert into #storekpi
exec sp_calculatestorekpi @storeid = 1;
insert into #storekpi
exec sp_calculatestorekpi @storeid = 2;

create table #customerprofile (
customer_id int,
fullname varchar(200),
totalorders int,
totalspent decimal(18,2),
mostboughtitem varchar(150)
);

declare @topcustomerid int = (
select top 1 customer_id 
from vw_topbuyingcustomers
order by total_spent desc
);

insert into #customerprofile
exec sp_getcustomerprofile @customerid = @topcustomerid;

select 
(select sum(revenue) from vw_storesalessummary) as total_revenue_view,
(select avg(aov_per_store) from vw_storesalessummary) as average_order_value_view,
(select sum(orders) from vw_storesalessummary) as total_orders_view,
(select count(*) from vw_inventorystatus) as low_stock_items_view,
(select top 1 store_id from vw_storesalessummary order by revenue desc) as top_store_by_revenue_view,
(select top 1 category_name from vw_salesbycategory order by total_revenue desc) as highest_revenue_category_view,
(select top 1 product_name from vw_topsellingproducts order by total_sale desc) as top_selling_product_view,
(select top 1 staff_name from vw_staffperformance order by total_revenue_handled desc) as top_staff_by_revenue_view,
(select top 1 city + ', ' + state from vw_regionaltrends order by total_revenue desc) as top_region_by_revenue_view,
(select top 1 first_name+' '+last_name from vw_topbuyingcustomers order by total_spent desc) as top_buying_customer_view,
--(from stored procs)
(select sum(totalsales) from #storekpi) as total_revenue_sp,
(select sum(totalorders) from #storekpi) as total_orders_sp,
(select top 1 store_name from #storekpi order by totalsales desc) as top_store_by_revenue_sp,
(select fullname from #customerprofile) as top_buying_customer_sp,
(select totalspent from #customerprofile) as top_customer_spent_sp;

