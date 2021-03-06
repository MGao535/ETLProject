# ETLProject
Columbia Bootcamp Project 2

This project was completed by Dylan, Michael and Shawn.

The program delivers a database with information about Major League Soccer game days and the weather. The goal of the dataset is to enable those using it to see how weather impacts the game (attendance, performance, etc.). 

The program takes 3 data sources and eventually creates a normalized database with 3 tables in PostgreSQL.

These are the steps that were taken:

1. The database schema was defined in quickdatabasediagrams.com as follows:

2. The tables were predefined for the database in PostgresSQL (see create_tables.sql)

3. Once the database is ready, the ETL process can run.


EXTRACT: First, the following 3 data sources are used to extract data in .csv format. The .csv files can be found in the Finished_Product folder

MLSAttendanceAllGames.xlsx - source: https://data.world/

read_html using pandas for MLS Stadiums - source: wikipedia

api call using pandas - source: http://api.worldweatheronline.com, additional query of /premium/v1/past-weather.ashx? to get weather from the past


TRANSFORM:

1. Stadium
- Deleted unwanted columns for the 3 tables wanted on the wiki page
- Added 'open' rooftype to the second table
- Changed column names to match between the tables
- Joined the 3 tables together
- Split the Location column to seperate City from State
- Cleaned the Capacity column to remove notes and reduced capacity values
- Exported dataframe to a .csv

2. Games
- Downloaded .csv file from Data World and deleted NaN rows 
- Removed unwanted columns 
- Renamed columns names for readability 
- Using the Date column, transformed date into UNIX time for API request 
- Limited the number of seasons to just 2018 due to restrictions of API request
- Cleaned the stadiums so they are uniform (i.e StubHub and Stubhub = StubHub)
- Cleaned the stadiums so that they are the same name to Dylans for ease 
- Added Stadium ID column to match Dylans 
- Exported dataframe to a .csv

3. Weather
- Imported the .csv file from Games with just games from 2018
- Found unique values for City column
- Individually tested unique values with API call to make sure each API call would return a valid data
- Renamed city values that did not return valid data to new unique and similar city name (i.e. NYCFC = NYC, HOU/SJ = Houston since there already was a San Jose City value)
- Exported dataframe made from the games .csv with corrected City values
- Called the API with the City name and Date of each game and stored the maximum temperature of the day in fahrenheit in a list
- Created new weather dataframe with City name, Date, and MaxTempF (Maximum Temperature Fahrenheit)
-Exported dataframe to a .csv

LOAD:

- Created the tables in Postgres.
- Loaded the data from the CSV files we made from the data we transformed. 
- Made Sample Queries for one to use to gather data by stadium_id or city. 

ER Diagram 
- This is what we used to base our SQL tables on. 
![ER Diagram](https://github.com/MGao535/ETLProject/blob/master/Pictures/Screen%20Shot%202020-05-09%20at%207.16.33%20PM.png)

Examples:


All games in the MLS 2018 Season and Weather
![MLS 2018 Weather](https://github.com/MGao535/ETLProject/blob/master/Pictures/All_games.png)

Search by city (i.e 'Toronto')
![Toronto Search Query](https://github.com/MGao535/ETLProject/blob/master/Pictures/Toronto.png)
