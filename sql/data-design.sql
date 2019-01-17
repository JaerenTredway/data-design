-- The statement below sets the collation of the database to utf8
ALTER DATABASE "data-design.sql" CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS vote;

-- the CREATE TABLE function is a function that takes tons of arguments to layout the table's schema
CREATE TABLE user (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	userId BINARY(16) NOT NULL,
	userActivationToken CHAR(32),
	userName VARCHAR(32) NOT NULL,
	userEmail VARCHAR(128) NOT NULL,
  -- use userHash instead of: userPassword VARCHAR(32) NOT NULL 
	-- to make something optional, exclude the not null
	userHash CHAR(97) NOT NULL,
	-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(userName),
	UNIQUE(userEmail),
	-- this officiates the primary key for the entity
	PRIMARY KEY(userId)
);

-- create the question entity
CREATE TABLE question (
	-- this is for yet another primary key...
	questionId BINARY(16) NOT NULL,
	-- this is for a foreign key
	questionUserId BINARY(16) NOT NULL,
	questionContent VARCHAR(140) NOT NULL,
	questionDate DATETIME(6) NOT NULL,
	-- this creates an index before making a foreign key
	INDEX(questionUserId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(questionUserId) REFERENCES user(userId),
	-- and finally create the primary key
	PRIMARY KEY(questionId)
);

-- create the answer entity
CREATE TABLE answer (
	-- this is for yet another primary key...
	answerId BINARY(16) NOT NULL,
	-- this is for a foreign key
	answerUserId BINARY(16) NOT NULL,
  answerQuestionId BINARY(16) NOT NULL,
	answerContent VARCHAR(140) NOT NULL,
	answerDate DATETIME(6) NOT NULL,
	-- this creates an index before making a foreign key
	INDEX(answerUserId),
  INDEX(questionUserId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(answerUserId) REFERENCES user(userId),
  FOREIGN KEY(questionUserId) REFERENCES user(userId),
	-- and finally create the primary key
	PRIMARY KEY(answerId)
);

-- create the like entity (a weak entity from an m-to-n for user --> answer)
CREATE TABLE vote (
	-- these are still foreign keys
	voteUserId BINARY(16) NOT NULL,
	voteAnswerId BINARY(16) NOT NULL,
	voteDate DATETIME(6) NOT NULL,
	-- index the foreign keys
	INDEX(voteUserId),
	INDEX(voteAnswerId),
	-- create the foreign key relations
	FOREIGN KEY(voteUserId) REFERENCES user(userId),
	FOREIGN KEY(voteAnswerId) REFERENCES answer(answerId),
	-- finally, create a composite foreign key with the two foreign keys
	PRIMARY KEY(voteUserId, voteAnswerId)
);


