# [Santa's Delivery Time Analysis](https://adventofsql.com/challenges/16)

## Description
Inspired by DevOps principles from The Unicorn Project, Santa is applying modern efficiency techniques to his gift delivery system. Using an advanced GPS tracking system and a PostgreSQL database with PostGIS, the North Pole Command Center is analyzing Santa's Christmas Eve journey. The data includes precise coordinates, timestamps, and polygonal delivery zone boundaries for major cities.

By tracking dwell time, visit frequency, and delivery density patterns, the team aims to identify bottlenecks and inefficiencies in Santa's current delivery flow. The analysis will pinpoint zones where he spends the most time and suggest optimizations to streamline the process, ensuring a more efficient and magical gift delivery pipeline.

## Challenge
[Download Challenge data](https://github.com/thatlaconic/advent-of-sql-day-16/blob/main/advent_of_sql_day_16.sql)

+ In which timezone has Santa spent the most time?
+ Assume that each timestamp is when Santa entered the timezone.
+ Ignore the last timestamp when Santa is in Lapland.

## Dataset
This dataset contains 2 table. 
### Using PostgreSQL
**input**
```sql
SELECT *
FROM sleigh_locations ;
```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-16/blob/main/sleigh_loc16.PNG)

**input**
```sql
SELECT *
FROM areas ;
```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-16/blob/main/areas16.PNG)

### Solution
[Download Solution Code](https://github.com/thatlaconic/advent-of-sql-day-16/blob/main/sleigh_loc16.PNG)

**input**
```sql
WITH CTE AS (SELECT place_name, MAX(timestamp) OVER(PARTITION BY place_name) AS max_time,
			MIN(timestamp) OVER(PARTITION BY place_name) AS min_time
		FROM sleigh_locations
		JOIN areas ON ST_contains(ST_AsText(polygon)::geometry,ST_AsText(coordinate)::geometry))
SELECT place_name, ROUND((EXTRACT(EPOCH FROM (max_time - min_time)) / 3600),2) AS total_hrs_spent
FROM CTE
GROUP BY place_name, total_hrs_spent
ORDER BY total_hrs_spent DESC ;

```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-16/blob/main/d16.PNG)

