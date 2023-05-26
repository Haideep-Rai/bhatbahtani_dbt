with subcategory as (
    select id,category_id,subcategory_desc from test_db.dbt.subcategory
),
subcategory_tmp as (
    select ROW_NUMBER() OVER (ORDER BY id) AS s_key,id,category_id,subcategory_desc,case when subcategory_desc is not null then '1' else '0' end as flag,
    current_timestamp() as in_ts, current_timestamp() as up_ts from subcategory
)
select * from subcategory_tmp