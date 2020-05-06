# ETLProject
Columbia Bootcamp Project 2

This project was completed by Dylan, Michael and Shawn.

The program delivers a database with information about MLS game days and the weather. The goal of the dataset is to enable those using it to see how weather impacts the game (attendance, performance, etc.). 

The program takes 3 datasources and eventually creates a normalized database with 3 tables in PostgreSQL.

These are the steps that were taken:

1. The database schema was defined in quickdatabasediagrams.com as follows:



2. The tables were predefined for the database in PostgresSQL (see create_tables.sql)

3. Once the database is ready, the ETL process can run.


EXTRACT: First the following 4 data sources are loaded. Csv files can be found in the Resources folder

MLSAttendanceAllGames.xlsx - source: https://data.world/
read_html using pandas for MLS Stadiums - source: wikipedia
api call using pandas - source: http://api.worldweatheronline.com


TRANSFORM:

1. Stadium
- delete unwanted columns for the 3 tables wanted on the wiki page
- add 'open' rooftype to the second table
- change column names to match between the tables
- join the 3 tables together
- split the Location column to seperate City from State
- clean the Capacity column to remove notes and reduced capacity values
- export dataframe to a .csv

2. Weather


3. Games
