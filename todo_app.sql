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

SELECT *
FROM task
WHERE completed_at IS NULL;

UPDATE task
SET completed_at=now()
WHERE title='Study SQL';

SELECT title, description
FROM task
WHERE completed_at IS NULL;

SELECT *
FROM task
ORDER BY created_at DESC;

INSERT INTO task (title, description)
VALUES ('mistake1', 'a test entry');

INSERT INTO task (title, description)
VALUES ('mistake2', 'another test entry');

INSERT INTO task (title, description)
VALUES ('mistake3', 'another test entry');

SELECT title
FROM task
WHERE title LIKE '%mistake%';

DELETE FROM task
WHERE title LIKE '%mistake 1%';

SELECT title, description
FROM task
WHERE title LIKE '%mistake%';

DELETE FROM task
WHERE title LIKE '%mistake%';

SELECT *
FROM task
ORDER BY title ASC;

\c george;