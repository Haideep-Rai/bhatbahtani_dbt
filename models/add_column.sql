{{
    config(
        materialized='table',
        post_hook=["alter table {{this}} add column emial varchar"]
    )
}}
select id, first_name, last_name from test_db.dbt.customers