-- CASE 1
SELECT mov_title 
FROM movie
WHERE mov_title LIKE 'The%'

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