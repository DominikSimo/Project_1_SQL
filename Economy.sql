CREATE TABLE t_dominik_simo_projekt_SQL_economy as 
SELECT  lt.country,
		coun.population,
		ROUND(coun.population_density,0) as population_density,
		gini.gini as "gini_coeficient",
		coun.median_age_2018,
		eco.mortaliy_under5 as "mortality_under_5_2019",
		ROUND((eco.GDP/eco.population),0) as "GDP_Per_Capita_2019"		
FROM (SELECT country, iso3 
	  FROM lookup_table lt
	  WHERE province is NULL) lt
LEFT JOIN ( SELECT country,population_density,median_age_2018,iso3,population 
			FROM  countries c ) coun  
ON lt.iso3 = coun.iso3
LEFT JOIN (	SELECT country,GDP,population, mortaliy_under5
			FROM economies e2 
			WHERE year = 2019) eco 			
ON coun.country = eco.country
LEFT JOIN ( SELECT gini,country 
			FROM economies e2 
			WHERE gini is not null
			GROUP BY country) gini
ON gini.country = eco.country
;