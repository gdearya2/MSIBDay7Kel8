-- CASE 1
SELECT mov_title 
FROM movie
WHERE mov_title LIKE 'The%'

-- CASE 2
SELECT CONCAT (director.dir_fname, ' ', director.dir_lname) AS director_name, movie.mov_title
FROM movie
JOIN movie_direction ON movie.mov_id = movie_direction.mov_id
JOIN director ON movie_direction.dir_id = director.dir_id
WHERE director.dir_fname = 'James' AND director.dir_lname = 'Cameron';

-- CASE 3
select distinct(a.act_fname, d.dir_fname) fname_act_dan_director
	from actor a		
	inner join 	movie_cast mc	
	on mc.act_id = a.act_id
	inner join movie_direction md
	on md.mov_id = mc.mov_id
	inner join director d
	on d.dir_id = md.dir_id
	order by fname_act_dan_director asc;

-- CASE 4
SELECT g.gen_title,COUNT(g.gen_title) AS Jumlah_Movies
FROM movie m
JOIN movie_genres mg ON mg.mov_id = m.mov_id
JOIN genres g ON g.gen_id = mg.gen_id
GROUP BY g.gen_title

-- CASE 5
SELECT
    CASE
        WHEN mov_time < 100 THEN 'Short Movie'
        WHEN mov_time > 130 THEN 'Long Movie'
        ELSE 'Normal Movie'
    END AS label_duration,
    COUNT(*) AS number_of_movies
FROM movie
GROUP BY label_duration;
