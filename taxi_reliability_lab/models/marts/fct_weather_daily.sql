select
  date as trip_date,
  prcp_mm,
  tmax_c,
  tmin_c
from {{ ref('stg_weather__daily') }}