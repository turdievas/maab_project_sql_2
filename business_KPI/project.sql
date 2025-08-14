--Linking KPIs with views and stored_procs (Odina)
select 
    -- 1. total revenue (company-wide)
    (select sum(revenue) from vw_storesalessummary) as total_revenue,

    -- 2. average order value (aov)
    (select avg(aov_per_store) from vw_storesalessummary) as average_order_value,

    -- 3. total orders
    (select sum(orders) from vw_storesalessummary) as total_orders,

    -- 5. revenue by store (highest revenue store)
    (select top 1 store_id 
     from vw_storesalessummary 
     order by revenue desc) as top_store_by_revenue,

    -- 6. gross profit by category (using sales as revenue proxy)
    (select top 1 category_name 
     from vw_salesbycategory 
     order by total_revenue desc) as highest_revenue_category,

    -- 7. sales by brand (using topsellingproducts view)
    (select top 1 product_name 
     from vw_topsellingproducts 
     order by total_sale desc) as top_selling_product,

    -- 8. staff revenue contribution (top performing staff)
    (select top 1 staff_name 
     from vw_staffperformance 
     order by total_revenue_handled desc) as top_staff_by_revenue,

    -- 9. inventory turnover indicator (low-stock count)
    (select count(*) from vw_inventorystatus) as low_stock_items,

    -- 10. regional trends (highest revenue region)
    (select top 1 city + ', ' + state 
     from vw_regionaltrends 
     order by total_revenue desc) as top_region_by_revenue;
	 --11. top buying customer
	 (select first_name+' '+last_name, total_spent from vw_TopBuyingCustomers)
