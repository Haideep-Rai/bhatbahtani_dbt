{{
    config(
        materialized='incremental',
        pre_hook="alter test_db.dbt.update_column add column country varchar",
           )
}}

select
    id, age,email,country

from test_db.dbt.x


{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where id > (select max(id) from {{ this }})
{% endif %}