with sales as (
    select id,store_id,product_id,customer_id,transaction_time,quantity,amount,discount 
    from test_db.dbt.sales
),
sales_tmp as (
    select ROW_NUMBER() OVER (ORDER BY id) AS s_key,id,store_id,product_id,customer_id,transaction_time,
    quantity,amount,discount,  current_timestamp() as in_ts, current_timestamp() as up_ts 
    from sales
)
select * from sales_tmp