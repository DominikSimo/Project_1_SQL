CREATE TABLE t_dominik_simo_projekt_SQL_religions as 
WITH nabozenstvo as 
(SELECT r.country, r. religion, 
    CASE WHEN r.religion = "Christianity" and r2.total_population_2020 != 0 THEN round( r.population / r2.total_population_2020 * 100, 2 ) END AS Christianity_share,
    CASE WHEN r.religion = "Islam" and r2.total_population_2020 != 0 THEN round( r.population / r2.total_population_2020 * 100, 2 ) END AS Islam_share,
    CASE WHEN r.religion = "Judaism" and r2.total_population_2020 != 0 THEN round( r.population / r2.total_population_2020 * 100, 2 ) END AS Judaism_share,
    CASE WHEN r.religion = "Hinduism" and r2.total_population_2020 != 0 THEN round( r.population / r2.total_population_2020 * 100, 2 ) END AS Hinduism_share,
    CASE WHEN r.religion = "Buddhism" and r2.total_population_2020 != 0 THEN round( r.population / r2.total_population_2020 * 100, 2 ) END AS Buddhism_share,
    CASE WHEN r.religion = "Folk Religions" and r2.total_population_2020 != 0 THEN round( r.population / r2.total_population_2020 * 100, 2 ) END AS Folk_Religions_share,
    CASE WHEN r.religion = "Other Religions" and r2.total_population_2020 != 0 THEN round( r.population / r2.total_population_2020 * 100, 2 ) END AS Other_Religions_share,
    CASE WHEN r.religion = "Unaffiliated Religions" and r2.total_population_2020 != 0 THEN round( r.population / r2.total_population_2020 * 100, 2 ) END AS Unaffiliated_Religions_share
FROM religions r 
JOIN (
        SELECT r.country , r.year,  sum(r.population) as total_population_2020
        FROM religions r 
        WHERE r.year = 2020 and r.country != 'All Countries'
        GROUP BY r.country
    ) r2
    ON r.country = r2.country
    AND r.year = r2.year
    )
SELECT	lt.country,	
		SUM(Christianity_share) as Christianity,
		SUM(Islam_share) as Islam, 
		SUM(Judaism_share) as Judaism, 
		SUM(Hinduism_share)as Hinduism, 
		SUM(Buddhism_share)as Buddhism, 
		SUM(Folk_Religions_share) as Folk_Religions,
		SUM(Other_Religions_share) as Other_Religions,
		SUM(Unaffiliated_Religions_share) as Unaffiliated_Religions
FROM (	SELECT country, iso3
		FROM lookup_table
		WHERE province is NULL) lt
LEFT JOIN (	SELECT country, iso3  
			FROM countries c ) c2
ON lt.iso3 = c2.iso3
LEFT JOIN nabozenstvo
ON c2.country = nabozenstvo.country
GROUP BY lt.country;