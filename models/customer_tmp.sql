with customer as (
    select id,customer_first_name,customer_middle_name,customer_last_name,customer_address from test_db.dbt.customer
),
customer_tmp as (
    select ROW_NUMBER() OVER (ORDER BY id) AS s_key,id,customer_first_name,customer_middle_name,customer_last_name,customer_address,case when customer_first_name || customer_last_name is not null then '1' else '0' end as flag,
    current_timestamp() as in_ts, current_timestamp() as up_ts from customer
)
select * from customer_tmp