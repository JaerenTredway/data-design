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

UPDATE profile
SET profileEmail = "kimSuperNuke@gmail.com"
WHERE profileName = "kimJongIl";

DELETE FROM profile
WHERE profileName = "vMoss";

/*
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


    
    
    
    
    
    
    
    