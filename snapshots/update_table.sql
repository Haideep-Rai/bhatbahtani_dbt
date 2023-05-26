{% snapshot orders_snapshot %}

{{
    config(
      target_database='test_db',
      target_schema='yomari',
      unique_key='id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from test_db.dbt.x

{% endsnapshot %}