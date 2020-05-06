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
    "Home Team" VARCHAR(45)   NOT NULL,
    "Home Goals" INT   NOT NULL,
    "Visitor Team" VARCHAR(45)   NOT NULL, 
    "Visitor Goals" INT   NOT NULL, 
    "Attendance" INT   NOT NULL, 
    "Stadium" VARCHAR(45)   NOT NULL,
    "Percentage Filled" VARCHAR(45)   NOT NULL, 
    "Unix" INT   NOT NULL, 
    "Stadium" VARCHAR(45)   NOT NULL, 
    "stadium_id" INT   NOT NULL,
    CONSTRAINT "pk_game_results" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "weather" (
    "city" VARCHAR(45)   NOT NULL,
    "date" DATE   NOT NULL,
    "maxtempf" INT NOT NULL,
);


ALTER TABLE "game_results" ADD CONSTRAINT "fk_game_results_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "stadiums" ("stadium_id");