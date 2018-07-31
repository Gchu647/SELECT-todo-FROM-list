DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael ENCRYPTED PASSWORD '1234';

CREATE DATABASE todo_app;

\c todo_app;

CREATE SEQUENCE table_name_id_seq;

CREATE TABLE task (
  id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('table_name_id_seq'),
  title VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP,
  completed boolean NOT NULL DEFAULT FALSE
);

ALTER TABLE task
  DROP COLUMN completed,
  ADD COLUMN completed_at TIMESTAMP DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO task (title, description, created_at, updated_at, completed_at)
VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO task(title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

\c george;