-- The statement below sets the collation of the database to utf8
ALTER DATABASE jtredway CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!
DROP TABLE IF EXISTS vote;
DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS profile;
 
-- the CREATE TABLE function is a function that takes tons of arguments to layout the table's schema
CREATE TABLE profile (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	profileId 					BINARY(16),
	profileActivationToken 	CHAR(32),
	profileName 				VARCHAR(32) 	NOT NULL,
	profileEmail 				VARCHAR(128) 	NOT NULL,
  -- use profileHash instead of: userPassword VARCHAR(32) NOT NULL 
	-- to make something optional, exclude the not null
	profileHash 				CHAR(97) 		NOT NULL,
	-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(profileName),
	UNIQUE(profileEmail),
	-- this officiates the primary key for the entity
	PRIMARY KEY(profileId)
);

-- create the question entity
CREATE TABLE question (
	-- this is for yet another primary key...
	questionId				BINARY(16) 		NOT NULL,
	-- this is for a foreign key
	questionProfileId 	BINARY(16) 			NOT NULL,
	questionContent 		VARCHAR(140) 	NOT NULL,
	questionDate 			DATETIME(6) 	NOT NULL,
	-- this creates an index before making a foreign key
	INDEX(questionProfileId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(questionProfileId) REFERENCES profile(profileId),
	-- and finally create the primary key
	PRIMARY KEY(questionId)
);

-- create the answer entity
CREATE TABLE answer (
	-- this is for yet another primary key...
	answerId 			BINARY(16) 		NOT NULL,
	-- this is for a foreign key
	answerProfileId 	BINARY(16) 		NOT NULL,
   answerQuestionId 	BINARY(16) 		NOT NULL,
	answerContent 		VARCHAR(140) 	NOT NULL,
	answerDate 			DATETIME(6) 	NOT NULL,
	-- this creates an index before making a foreign key
	INDEX(answerProfileId),
   INDEX(answerQuestionId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(answerProfileId) 	REFERENCES profile(profileId),
   FOREIGN KEY(answerQuestionId) 	REFERENCES question(questionId),
	-- and finally create the primary key
	PRIMARY KEY(answerId)
);

-- create the like entity (a weak entity from an m-to-n for user --> answer)
CREATE TABLE vote (
	-- these are still foreign keys
	voteProfileId 	BINARY(16) 		NOT NULL,
	voteAnswerId 	BINARY(16) 		NOT NULL,
	voteDate 		DATETIME(6) 	NOT NULL,
	-- index the foreign keys
	INDEX(voteProfileId),
	INDEX(voteAnswerId),
	-- create the foreign key relations
	FOREIGN KEY(voteProfileId) 	REFERENCES profile(profileId),
	FOREIGN KEY(voteAnswerId) 	REFERENCES answer(answerId),
	-- finally, create a composite foreign key with the two foreign keys
	PRIMARY KEY(voteProfileId, voteAnswerId)
);













