DROP TABLE IF EXISTS "stadiums";
DROP TABLE IF EXISTS "game_results";
DROP TABLE IF EXISTS "weather";

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
    "City" VARCHAR(45)   NOT NULL,
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
    "city" VARCHAR(45)   NOT NULL,
    "date" DATE   NOT NULL,
    "maxtempf" INT NOT NULL
);


ALTER TABLE "game_results" ADD CONSTRAINT "fk_game_results_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "stadiums" ("stadium_id");

COPY game_results FROM '/Applications/PostgreSQL 12/temp-data/mls_2018.csv' DELIMITER ',' CSV HEADER;
COPY stadiums FROM '/Applications/PostgreSQL 12/temp-data/stadium_data.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM game_results;
SELECT * FROM stadiums;

SELECT * FROM game_results JOIN stadiums ON stadiums.stadium_id = game_results.stadium_id WHERE game_results.stadium_id = 2;


