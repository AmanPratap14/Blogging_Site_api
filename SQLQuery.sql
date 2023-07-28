DROP TABLE IF EXISTS DotnetWebAPIsSchema.Users;

-- IF OBJECT_ID('DotnetWebAPIsSchema.Users') IS NOT NULL
--     DROP TABLE DotnetWebAPIsSchema.Users;

CREATE TABLE DotnetWebAPIsSchema.Users
(
    UserId INT IDENTITY(1, 1) PRIMARY KEY
    , FirstName NVARCHAR(50)
    , LastName NVARCHAR(50)
    , Email NVARCHAR(50)
    , Gender NVARCHAR(50)
    , Active BIT
);

DROP TABLE IF EXISTS DotnetWebAPIsSchema.Usersalary;

-- IF OBJECT_ID('DotnetWebAPIsSchema.Usersalary') IS NOT NULL
--     DROP TABLE DotnetWebAPIsSchema.Usersalary;

CREATE TABLE DotnetWebAPIsSchema.Usersalary
(
    UserId INT
    , Salary DECIMAL(18, 4)
);

DROP TABLE IF EXISTS DotnetWebAPIsSchema.UserJobInfo;

-- IF OBJECT_ID('DotnetWebAPIsSchema.UserJobInfo') IS NOT NULL
--     DROP TABLE DotnetWebAPIsSchema.UserJobInfo;

CREATE TABLE DotnetWebAPIsSchema.UserJobInfo
(
    UserId INT
    , JobTitle NVARCHAR(50)
    , Department NVARCHAR(50),
);

-- USE UserDataBase;
-- GO

-- SELECT  [UserId]
--         , [FirstName]
--         , [LastName]
--         , [Email]
--         , [Gender]
--         , [Active]
--   FROM  DotnetWebAPIsSchema.Users;

-- SELECT  [UserId]
--         , [Salary]
--   FROM  DotnetWebAPIsSchema.Usersalary;

-- SELECT  [UserId]
--         , [JobTitle]
--         , [Department]
--   FROM  DotnetWebAPIsSchema.UserJobInfo;