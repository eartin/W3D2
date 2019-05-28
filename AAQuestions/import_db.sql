PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(20) NOT NULL,
  lname VARCHAR(20) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(40) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL, 
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (parent_id) REFERENCES replies(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,

  question_id INTEGER NOT NULL, 
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  users(fname,lname)
VALUES
  ('Ned', 'Stark'),
  ('Eric', 'Jones');

INSERT INTO
  questions(title, body, author_id)
VALUES 
  ('What', 'What are you doing', 1),
  ('Where', 'Where are you going', 1),
  ('What', 'What time is it', 2),
  ('Who', 'Who is there', 2);

INSERT INTO 
  question_follows(user_id, question_id)
VALUES
  (1,1),
  (2,1),
  (3,2),
  (4,2);

INSERT INTO
  replies(question_id,user_id,body, parent_id)
VALUES
  (1, 2, 'I am coding!')
  (1, 2, 'I am still coding!', 1)
  (2, 1, 'I am going nowhere')
  (1, 2, 'I am going to disneyland', 1)
  (1, 1, 'I am still codingajskdaskd', 1)
  (3, 1, 'it times '),
  (4, 2, 'someone non ');


INSERT INTO
  question_likes(question_id, user_id)
VALUES
  (1,1),
  (1,2),
  (2,1),
  (2,2),
  (3,1),
  (4,2),
  (3,2);



