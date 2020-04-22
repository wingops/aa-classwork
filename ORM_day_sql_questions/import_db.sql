PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE
    users(
    id INTEGER PRIMARY KEY,
    fname VARCHAR (255) NOT NULL,
    lname VARCHAR (255) NOT NULL
    );

CREATE TABLE
    questions(
        id INTEGER PRIMARY KEY,
        title VARCHAR (255) NOT NULL,
        body TEXT NOT NULL,
        author_id integer NOT NULL,
        
        FOREIGN KEY (author_id) REFERENCES users(id)
    );

CREATE TABLE
    question_follows(
        id INTEGER PRIMARY KEY,
        question_id integer NOT NULL,
        follower_id integer NOT NULL,
        
        FOREIGN KEY (question_id) REFERENCES questions(id),
        FOREIGN KEY (follower_id) REFERENCES users(id)
    );

CREATE TABLE
    replies(
        id INTEGER PRIMARY KEY,
        question_id integer NOT NULL,
        parent_reply_id integer,
        author_id integer NOT NULL,
        body TEXT NOT NULL,
        
        FOREIGN KEY (question_id) REFERENCES questions(id),
        FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
        FOREIGN KEY (author_id) REFERENCES users(id)
    );

CREATE TABLE
    likes(
        id INTEGER PRIMARY KEY,
        user_id integer NOT NULL,
        question_id integer NOT NULL,
        
        FOREIGN KEY (user_id) REFERENCES users(id),
        FOREIGN KEY (question_id) REFERENCES questions(id)
    );

INSERT INTO 
    users (fname, lname)
VALUES
    ('Jim', 'Beam'),
    ('Mark', 'Snopes'),
    ('Carol', 'Marton'),
    ('Walter', 'DeAngelo'),
    ('Alton', 'McKinley'),
    ('Daniel', 'Ng'),
    ('Janice', 'Cray'),
    ('Kelly', 'Objeroist');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ("Caribou", "What is the habitat of  these majestic anivals?", 1),
    ("Connecting Tables", "Where do I use 'join', 'on' and 'reference'?", 2),
    ("Winterizing Your Cabin", "How can I make my cabin retain heat in the winter?", 1),
    ("Rotating Tires", "How frequently should tires be rotated?", 3);

INSERT INTO
    question_follows (question_id, follower_id)
VALUES
    (1,2),
    (1,3),
    (2,1),
    (3,1),
    (4,2),
    (4,1);

INSERT INTO 
    replies (question_id, parent_reply_id, author_id, body)
VALUES
    (1,NULL,2, "Not really an interesting question"),
    (1,1,3,"Quite the opinion statement"),
    (1,2,3,"Hey, lets keep it civil!"),
    (2,NULL,3,"I've been struggling with the same thing.  Particularly where it connects with the foreign key concept.");

INSERT INTO 
    likes (user_id,  question_id)
VALUES
    (1,2),
    (1,3),
    (4,1),
    (4,3),
    (2,2);

