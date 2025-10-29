select
  t.trip_date,
  sum(t.trips) as trips,
  sum(t.gross_revenue) as gross_revenue,
  safe_divide(sum(t.gross_revenue), sum(t.trips)) as avg_revenue_per_trip,
  avg(t.tip_pct) as tip_pct,
  avg(w.prcp_mm) as prcp_mm,
  avg(w.tmax_c) as tmax_c
from {{ ref('fct_trips_daily') }} t
left join {{ ref('fct_weather_daily') }} w
  on w.trip_date = t.trip_date
group by t.trip_date