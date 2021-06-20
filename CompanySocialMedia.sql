CREATE database if NOT EXISTS CompanySocialMedia;

use CompanySocialMedia;

DROP TABLE if EXISTS comments;
DROP TABLE if EXISTS posts;
DROP TABLE if EXISTS users;

CREATE TABLE users(
	user_id int(11) NOT NULL auto_increment,
	user_name varchar(30) NOT NULL UNIQUE,
	email varchar(100),
	password varchar(60) NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(25) NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE posts(
	post_id int(11) NOT NULL auto_increment,
	user_id int(11) NOT NULL,
	date_created datetime DEFAULT CURRENT_TIMESTAMP,
	post TEXT,
	PRIMARY KEY (post_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE comments(
	comment_id int(11) NOT NULL auto_increment,
	user_id int(11) NOT NULL,
	post_id int(11) NOT NULL,
	date_created datetime DEFAULT CURRENT_TIMESTAMP,
	comment TEXT NOT NULL,
	PRIMARY KEY (comment_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (post_id) REFERENCES posts (post_id)
);