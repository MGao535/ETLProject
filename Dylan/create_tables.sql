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
    "game_id" SERIAL   NOT NULL,
    "date" DATE   NOT NULL,
    "City" VARCHAR(45)   NOT NULL,
    "home_team" VARCHAR(45)   NOT NULL,
    "home_goals" FLOAT   NOT NULL,
    "visitor_team" VARCHAR(45)   NOT NULL, 
    "visitor_goals" FLOAT   NOT NULL, 
    "attendance" VARCHAR(45)   NOT NULL, 
    "stadium" VARCHAR(45)   NOT NULL,
    "percentage_filled" VARCHAR(45)   NOT NULL, 
    "unix" FLOAT   NOT NULL, 
    "stadium_id" FLOAT   NOT NULL,
    CONSTRAINT "pk_game_results" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "weather" (
    "city" VARCHAR(45)   NOT NULL,
    "date" DATE   NOT NULL,
    "maxtempf" INT NOT NULL
);


ALTER TABLE "game_results" ADD CONSTRAINT "fk_game_results_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "stadiums" ("stadium_id");

ALTER TABLE "weather" ADD CONSTRAINT "fk_weather_city" FOREIGN KEY("city")
REFERENCES "stadiums" ("city");

ALTER TABLE "weather" ADD CONSTRAINT "fk_weather_date" FOREIGN KEY("date")
REFERENCES "game_results" ("date");