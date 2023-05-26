with product as (
    select id,subcategory_id,product_desc from test_db.dbt.product
),
product_tmp as (
    select ROW_NUMBER() OVER (ORDER BY id) AS s_key,id,subcategory_id,product_desc,
    case when product_desc is not null then '1' else '0' end as flag,
    current_timestamp() as in_ts, current_timestamp() as up_ts 
    from product
)
select * from product_tmp