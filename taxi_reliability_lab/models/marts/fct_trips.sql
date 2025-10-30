select
  cast(format_timestamp('%Y-%m-%d', pickup_ts) as date) as trip_date,
  pickup_zone_id as zone_id,
  trip_id,
  fare_amount,
  tip_amount,
  total_amount
from {{ ref('stg_taxi__trips') }}
