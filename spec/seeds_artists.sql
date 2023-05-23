-- spec/seeds_{table_name}.sql

-- spec/seeds_{table_name}.sql

-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Pop');
INSERT INTO artists (name, genre) VALUES ('Johannes Brahms', 'Classical');


-- psql -h 127.0.0.1 music_library_test < spec/seeds_albums.sql
-- psql -h 127.0.0.1 music_library_test < spec/seeds_artists.sql