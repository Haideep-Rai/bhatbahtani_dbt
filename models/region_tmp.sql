with region as (
    select id,country_id,region_desc from test_db.dbt.region
),
region_tmp as (
    select ROW_NUMBER() OVER (ORDER BY id) AS s_key,id,country_id,region_desc,case when region_desc is not null then '1' else '0' end as flag,
    current_timestamp() as in_ts, current_timestamp() as up_ts from region
)
select * from region_tmp