-- Mark build freshness vs 06:10 CT SLO
select
  current_timestamp() as last_build_ts,
  case
    when extract(hour from current_timestamp() at time zone "America/Chicago") < 6
      or (extract(hour from current_timestamp() at time zone "America/Chicago") = 6
          and extract(minute from current_timestamp() at time zone "America/Chicago") <= 10)
    then 'OK'
    else 'BREACH'
  end as status