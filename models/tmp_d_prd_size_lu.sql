{{
    config(
        materialized="table"
    )
}}
select 
ROW_NUMBER() OVER (ORDER BY id) AS size_key,
id  as size_id,
size_desc as size_desc,
null as industry_cde,
null as industry_subgrp,
CURRENT_TIMESTAMP() AS RCD_INS_TS,
  CURRENT_TIMESTAMP() AS RCD_UPD_TS,
  case when size_desc is not null 
  then '1' else '0' 
  end  AS RCD_CLOSE_FLG,
  case when RCD_CLOSE_FLG='1' then '2099-9-9' 
  else CURRENT_TIMESTAMP() 
  end  AS RCD_CLOSE_DT
  from {{source('dbt','product_size')}}