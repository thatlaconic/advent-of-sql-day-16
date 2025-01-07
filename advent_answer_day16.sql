
WITH CTE AS (SELECT place_name, MAX(timestamp) OVER(PARTITION BY place_name) AS max_time,
			MIN(timestamp) OVER(PARTITION BY place_name) AS min_time
		FROM sleigh_locations
		JOIN areas ON ST_contains(ST_AsText(polygon)::geometry,ST_AsText(coordinate)::geometry))
SELECT place_name, ROUND((EXTRACT(EPOCH FROM (max_time - min_time)) / 3600),2) AS total_hrs_spent
FROM CTE
GROUP BY place_name, total_hrs_spent
ORDER BY total_hrs_spent DESC ;


