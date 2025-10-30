-- NYC stations subset; use TMAX/TMIN/PRCP where available
with daily as (
  select
    date as date,
    station,
    any_value(if(element='PRCP', value/10.0, null)) as prcp_mm,
    any_value(if(element='TMAX', value/10.0, null)) as tmax_c,
    any_value(if(element='TMIN', value/10.0, null)) as tmin_c
  from {{ ref('ghcn_d') }}
  where station like 'USW%'
  group by date, station
),
nyc as (
  select date,
         avg(prcp_mm) as prcp_mm,
         avg(tmax_c) as tmax_c,
         avg(tmin_c) as tmin_c
  from daily
  group by date
)
select * from nyc