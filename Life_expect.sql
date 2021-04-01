CREATE TABLE t_dominik_simo_projekt_SQL_life_expectancy as 
select 	lt.country,
		round(le.life_expectancy,1) as life_expect_2015 ,
		round(le2.life_expectancy,1) as life_expect_1965, 
		round(le.life_expectancy - le2.life_expectancy,1) as life_exp_diff_2015_1965
FROM ( 	SELECT country, iso3 
		FROM lookup_table
		WHERE province is Null) lt		
LEFT JOIN (	SELECT country,iso3
			FROM countries ) c2
ON c2.iso3 = lt.iso3
LEFT JOIN life_expectancy le 
ON c2.country = le.country
LEFT JOIN life_expectancy le2 
ON le.country = le2.country
WHERE le.year = 2015 and le2.year = 1965
;
