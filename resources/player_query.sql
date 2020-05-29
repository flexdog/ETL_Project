CREATE TABLE players_data (
    index INT PRIMARY KEY,
	"Player" VARCHAR(100),
	year_start INT,
	year_end INT,
	player_position VARCHAR(10),
	college VARCHAR(100)

);

CREATE TABLE seasons_stats (
	index INT PRIMARY KEY,
	"Player" VARCHAR(100),
	player_position VARCHAR(10),
 	"Team" VARCHAR(50),
 	num_of_games INT,
 	"GS" INT,
 	"Season" INT,
	"PER" real,
 	"AST" INT,
 	"TRB" INT,
 	"PTS" INT
);

--  veify data output 
SELECT * FROM players_data
SELECT * FROM seasons_stats

-- Final data --
SELECT subquery1."Player", subquery1."Points", subquery1."Assist", subquery1."Rebounds", subquery1."Seasons"
FROM (SELECT players_data."Player", SUM(seasons_stats."PTS") AS "Points", SUM(seasons_stats."TRB") AS "Rebounds", 
	  SUM(seasons_stats."AST") AS "Assist", COUNT(seasons_stats."Season") AS "Seasons"
FROM seasons_stats
JOIN players_data
ON seasons_stats."Player" = players_data."Player"
GROUP BY players_data."Player") as subquery1
WHERE subquery1."Seasons" >= 10;

