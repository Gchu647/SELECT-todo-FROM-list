DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael ENCRYPTED PASSWORD '1234';

CREATE DATABASE todo_app;

CREATE TABLE task (
  id integer PRIMARY KEY
);

ALTER TABLE task
  ADD COLUMN completed_at TYPE timestamp with timezone
  DROP COLUMN IF EXISTS completed;