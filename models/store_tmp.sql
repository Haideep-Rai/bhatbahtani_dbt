with store as (
    select id,region_id,store_desc from test_db.dbt.store
),
store_tmp as (
    select ROW_NUMBER() OVER (ORDER BY id) AS s_key,id,region_id,store_desc,case when store_desc is not null then '1' else '0' end as flag,
    current_timestamp() as in_ts, current_timestamp() as up_ts from store
)
select * from store_tmp