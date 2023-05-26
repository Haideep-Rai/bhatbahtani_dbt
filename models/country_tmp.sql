with country as(
    select id, country_desc from test_db.dbt.country
),
country_tmp as (
    select ROW_NUMBER() OVER (ORDER BY id) AS s_key,id, country_desc, case when country_desc is not null then '1' else '0' end as flag,current_timestamp() as in_ts,current_timestamp() as up_ts from country
)
select s_key, id,country_desc,flag,in_ts,up_ts from country_tmp