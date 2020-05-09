-- Drop the tables 
DROP TABLE IF EXISTS "stadiums";
DROP TABLE IF EXISTS "game_results";
DROP TABLE IF EXISTS "weather";

-- Create all the tables 
CREATE TABLE "stadiums" (
    "stadium_id" SERIAL   NOT NULL,
    "stadium" VARCHAR(45)   NOT NULL,
    "franchise" VARCHAR(45)    NOT NULL,
    "capacity" INT,
    "surface" VARCHAR(45),
    "roof" VARCHAR(45)    NOT NULL,
    "city" VARCHAR(45),
    "state" VARCHAR(45),
    CONSTRAINT "pk_stadiums" PRIMARY KEY (
        "stadium_id"
     )
);

CREATE TABLE "game_results" (
	"index" INT NOT NULL,
    "date" DATE   NOT NULL,
    "city" VARCHAR(45)   NOT NULL,
    "home_team" VARCHAR(45)   NOT NULL,
    "home_goals" FLOAT   NOT NULL,
    "visitor_team" VARCHAR(45)   NOT NULL, 
    "visitor_goals" FLOAT   NOT NULL, 
    "attendance" VARCHAR(45) NOT NULL, 
    "stadium" VARCHAR(45)   NOT NULL,
    "percentage_filled" VARCHAR(45)   NOT NULL, 
    "unix" FLOAT   NOT NULL, 
    "stadium_id" FLOAT   NOT NULL
);

CREATE TABLE "weather" (
	"index" INT NOT NULL,
    "city" VARCHAR(45)   NOT NULL,
    "date" DATE   NOT NULL,
    "maxtempf" INT NOT NULL
);

-- Add FK 
ALTER TABLE "game_results" ADD CONSTRAINT "fk_game_results_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "stadiums" ("stadium_id");

-- Copy the data from the csv files 
COPY game_results FROM '/Applications/PostgreSQL 12/temp-data/mls_sql_2018.csv' DELIMITER ',' CSV HEADER;
COPY stadiums FROM '/Applications/PostgreSQL 12/temp-data/stadium_data.csv' DELIMITER ',' CSV HEADER;
COPY weather FROM '/Applications/PostgreSQL 12/temp-data/weather.csv' DELIMITER ',' CSV HEADER;

-- Check to make sure tables are filled. 
SELECT * FROM game_results;
SELECT * FROM stadiums;
SELECT * FROM weather;

-- Some test queries. 
SELECT * FROM game_results JOIN stadiums ON stadiums.stadium_id = game_results.stadium_id WHERE game_results.stadium_id = 2;

-- Query to get all the information for every game in the 2018 season. 
SELECT game_results.date, game_results.home_team, stadiums.city, game_results.attendance, stadiums.capacity,
game_results.percentage_filled, stadiums.stadium, stadiums.roof, weather.maxtempf
FROM game_results 
JOIN stadiums ON stadiums.stadium_id = game_results.stadium_id 
JOIN weather ON weather.date = game_results.date AND weather.city = game_results.city

-- Query to get all the information for all of toronto's games in the 2018 season. 
-- Can change 'Toronto' to any city
SELECT game_results.date, game_results.home_team, stadiums.city, game_results.attendance, stadiums.capacity,
game_results.percentage_filled, stadiums.stadium, stadiums.roof, weather.maxtempf
FROM game_results 
JOIN stadiums ON stadiums.stadium_id = game_results.stadium_id 
JOIN weather ON weather.date = game_results.date AND weather.city = game_results.city
WHERE game_results.city = 'Toronto' ;

-- Query to get all the information for all of Los Angeles games in the 2018 season. 
-- Can change 2 to any stadium if you know the id for the specfic stadium. See the stadium.csv file for reference. 
SELECT game_results.date, game_results.home_team, stadiums.city, game_results.attendance, stadiums.capacity, 
game_results.percentage_filled, stadiums.stadium, stadiums.roof, weather.maxtempf
FROM game_results 
JOIN stadiums ON stadiums.stadium_id = game_results.stadium_id 
JOIN weather ON weather.date = game_results.date AND  weather.city = game_results.city
WHERE game_results.stadium_id = 2;



