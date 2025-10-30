with raw as (
  select
    unique_key as trip_id,
    timestamp(pickup_datetime) as pickup_ts,
    timestamp(dropoff_datetime) as dropoff_ts,
    pu_location_id as pickup_zone_id,
    do_location_id as dropoff_zone_id,
    passenger_count,
    trip_distance,
    fare_amount,
    tip_amount,
    total_amount,
    payment_type,
    rate_code
  from {{ ref('trips') }}
  where pickup_datetime is not null
)
select * from raw
