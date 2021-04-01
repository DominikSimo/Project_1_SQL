# celková tabulka
CREATE TABLE t_dominik_simo_projekt_SQL_final as 
SELECT 	t1.*,
		t2.population,t2.population_density,t2.gini_coeficient,t2.median_age_2018,t2.mortality_under_5_2019,t2.GDP_Per_Capita_2019,
		t3.Christianity,t3.Islam,t3.Judaism,t3.Hinduism,t3.Buddhism,t3.Folk_Religions,t3.Other_Religions,t3.Unaffiliated_Religions,
		t4.life_exp_diff_2015_1965,
		t5.average_daily_temp,t5.max_wind,t5.total_rain_hours
FROM ( 	SELECT *
		FROM t_dominik_simo_projekt_SQL_covid_time) t1 
LEFT JOIN 
	(	SELECT *
		FROM t_dominik_simo_projekt_SQL_economy) t2 
ON t1.country = t2.country
LEFT JOIN 
	(	SELECT * 
		FROM t_dominik_simo_projekt_SQL_religions) t3 
ON t2.country = t3.country
LEFT JOIN 
	(	SELECT * 
		FROM t_dominik_simo_projekt_SQL_life_expectancy ) t4 
ON t3.country = t4.country
LEFT JOIN 
	(	SELECT * 
		FROM t_dominik_simo_projekt_SQL_weather ) t5
ON t5.country = t4.country
AND t5.date = t1.date
ORDER BY t1.country;

