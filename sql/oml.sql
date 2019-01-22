/**
*@noinspection SqlResolve
*/
INSERT INTO profile
 (profileId, profileActivationToken, profileName, profileEmail, profileHash)
VALUES 
 (UNHEX(REPLACE(UUID(),'-','')),
  "nananananananananananananananana",
  "jTredway",
  "jwilliamtredway@gmail.com",
  "nananananananananananananananananananananananananananananananananananananananananananananananana"),
 (UNHEX(REPLACE(UUID(),'-','')),
  "nananananananananananananananana",
  "vMoss",
  "vMoss@gmail.com",
  "nananananananananananananananananananananananananananananananananananananananananananananananana"),
 (UNHEX(REPLACE(UUID(),'-','')),
  "nananananananananananananananana",
  "kimJongIl",
  "kimTheBigDog@gmail.com",
  "nananananananananananananananananananananananananananananananananananananananananananananananana");

/**
*@noinspection SqlResolve
*/
UPDATE profile
SET profileEmail = "kimSuperNuke@gmail.com"
WHERE profileName = "kimJongIl";

/**
*@noinspection SqlResolve
*/
DELETE FROM profile
WHERE profileName = "vMoss";

/**
*@noinspection SqlResolve
*/
INSERT INTO question
(questionId, questionProfileId, questionContent, questionDate)
VALUES
  (UNHEX(REPLACE(UUID(),'-','')),
  0x6EAFEA891CEC11E9A01314FEB5D6B71F,
  "This is some question content.",
  NOW()
  );

/**
*@noinspection SqlResolve
*/
UPDATE question
SET questionContent = "This is some updated question content."
WHERE questionId = 0x58C3E2B51CF611E9A01314FEB5D6B71F;

SELECT questionContent
FROM question
WHERE questionId = 0x58C3E2B51CF611E9A01314FEB5D6B71F;

/**
*@noinspection SqlResolve
*/
SELECT profile.profileEmail, question.questionContent
FROM profile
   JOIN question
ON profile.profileId = question.questionProfileId
WHERE question.questionContent = NOT NULL
;

/**
*@noinspection SqlResolve
*/
SELECT profileName
FROM profile
		JOIN question
ON profile.profileId = question.questionProfileId
WHERE question.questionContent LIKE "%updated%"
;

/**
*@noinspection SqlResolve
*/
SELECT COUNT(*) FROM vote
WHERE voteProfileId = 0x6EAFEA891CEC11E9A01314FEB5D6B71F;



/*
SELECT price,
COUNT(*)
FROM menu
WHERE orders > 50
GROUP BY price;
HAVING ...

INSERT INTO user (userId, userActivationToken, userName, userEmail, userHash) VALUES (
    UNHEX("UUID()"), 
    "nananananananananananananananana", 
    "jTredway", 
    "jwilliamtredway@gmail.com",
 "nananananananananananananananananananananananananananananananananananananananananananananananana"
    );

INSERT INTO tweet(tweetId, tweetProfileId, tweetContent, tweetDate) VALUES (UNHEX("2435f00e555d455d92fdf34f1dd255e2"),
    UNHEX("4d7342ff55c0483097a0da7b2b6a9d9d"), 
    "I hate dates because I never get them", 
    NOW());

UPDATE table SET colunm1 = newValue1, column2 = newValue2, WHERE primaryKey = uuid;

UPDATE tweet SET 
    tweetProfileId = UNHEX("4d7342ff55c0483097a0da7b2b6a9d9d"),
    tweetContent = "I get dates now",
    tweetDate = NOW(),
WHERE tweetId = UNHEX("2435f00e555d455d92fdf34f1dd255e2");

DELETE FROM table WHERE primayKey = uuid;
DELETE FROM tweet WHERE tweetId = UNHEX("2435f00e555d455d92fdf34f1dd255e2");
*/


    
    
    
    
    
    
    
    