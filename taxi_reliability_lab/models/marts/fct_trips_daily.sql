select
  trip_date,
  zone_id,
  count(*) as trips,
  sum(total_amount) as gross_revenue,
  safe_divide(sum(fare_amount), count(*)) as avg_fare,
  safe_divide(sum(tip_amount), nullif(sum(fare_amount),0)) as tip_pct
from {{ ref('fct_trips') }}
group by trip_date, zone_id
