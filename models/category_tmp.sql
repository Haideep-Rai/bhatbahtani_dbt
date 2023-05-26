with category as (
    select id,category_desc from test_db.dbt.category
),
category_tmp as (
    select ROW_NUMBER() OVER (ORDER BY id) AS s_key,id,category_desc,case when category_desc is not null then '1' else '0' end as flag,
    current_timestamp() as in_ts, current_timestamp() as up_ts from category
)
select * from category_tmp