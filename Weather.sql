CREATE TABLE t_dominik_simo_projekt_SQL_weather as 
WITH rain as
(select *,
	CASE WHEN rain !=0 THEN 3 ELSE 0 END AS rain_hours
from weather w )
SELECT 	a3.date,a1.country,a2.capital_city,a3.average_daily_temp,a4.max_wind,a5.total_rain_hours
FROM  ( SELECT country, iso3,province 
		FROM lookup_table lt
		WHERE province is NULL) a1
LEFT JOIN (	SELECT country,capital_city,iso3
			FROM countries c) a2
ON a1.iso3 = a2.iso3
LEFT JOIN ( SELECT *,
			ROUND(SUM(temp)/3,0) AS average_daily_temp
			FROM weather w
			WHERE `hour` in (6,15,21)
			GROUP BY date,city) a3
ON a2.capital_city = a3.city	
LEFT JOIN (	SELECT city,date,MAX(wind) as max_wind
			FROM weather w2
			GROUP by date,city) a4
ON a3.city = a4.city
AND a3.date = a4.date
LEFT JOIN (	SELECT city, date, rain_hours, SUM (rain_hours) AS total_rain_hours
			FROM rain
			GROUP BY date,city) a5
ON a4.city = a5.city
AND a4.date = a5.date
;