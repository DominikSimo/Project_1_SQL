CREATE TABLE t_dominik_simo_projekt_SQL_covid_time as
SELECT  covid.date, covid.country, covid.confirmed, test.tests_performed,
		CASE WHEN WEEKDAY(covid.date) IN (5, 6) THEN 1 ELSE 0 END AS weekend,
		CASE WHEN (c3.north + c3.south)/2 > 0
			THEN 
				CASE WHEN covid.date BETWEEN "2020-01-01" AND "2020-03-19"
					 THEN 0
					 WHEN covid.date BETWEEN "2020-03-20" AND "2020-06-19"
					 THEN 1
					 WHEN covid.date BETWEEN "2020-06-20" AND "2020-09-21"
					 THEN 2
					 WHEN covid.date BETWEEN "2020-09-22" AND "2020-12-20"
					 THEN 3
					 WHEN covid.date BETWEEN "2020-12-21" AND "2021-03-19"
					 THEN 0
				END 
			ELSE 
				CASE WHEN covid.date BETWEEN "2020-01-01" AND "2020-03-19"
					 THEN 2
					 WHEN covid.date BETWEEN "2020-03-20" AND "2020-06-19"
					 THEN 3
					 WHEN covid.date BETWEEN "2020-06-20" AND "2020-09-21"
					 THEN 0
					 WHEN covid.date BETWEEN "2020-09-22" AND "2020-12-20"
					 THEN 1
					 WHEN covid.date BETWEEN "2020-12-21" AND "2021-03-19"
					 THEN 2
				END 
		END AS "Season"				
FROM ( 	SELECT date,country,confirmed
	  	FROM covid19_basic_differences cbd) covid
LEFT JOIN (	SELECT country, iso3 
			FROM lookup_table lt 
			WHERE province is NULL) lt
ON covid.country = lt.country
LEFT JOIN ( SELECT country,north,south,iso3 
			FROM countries c3) c3
ON lt.iso3 = c3.iso3
LEFT JOIN ( SELECT date,country,tests_performed
			FROM covid19_tests ct) test 			
ON c3.country = test.country	
AND covid.date = test.date
ORDER BY country 
;