-- Create the database
-- CREATE DATABASE WebApiDataBase;
-- GO

-- Use the database
-- USE WebApiDataBase;
-- GO

-- Create the schema
-- CREATE SCHEMA DotnetWebAPIsSchema;
-- GO

-- Table: Users
-- CREATE TABLE DotnetWebAPIsSchema.Users (
--     [UserId] INT PRIMARY KEY,
--     [FirstName] NVARCHAR(50),
--     [LastName] NVARCHAR(50),
--     [Email] NVARCHAR(50),
--     [Gender] NVARCHAR(50),
--     [Active] BIT
-- );
-- GO

-- Table: UserJobInfo
-- CREATE TABLE DotnetWebAPIsSchema.UserJobInfo (
--     [UserId] INT PRIMARY KEY,
--     [JobTitle] NVARCHAR(50),
--     [Department] NVARCHAR(50)
-- );
-- GO

-- Table: UserSalary
-- CREATE TABLE DotnetWebAPIsSchema.UserSalary (
--     [UserId] INT PRIMARY KEY,
--     [Salary] DECIMAL(10, 2)
-- );
-- GO

-- SELECT records from Users where Gender is not 'Male', 'Female', or 'Transgender'
-- SELECT * FROM DotnetWebAPIsSchema.Users
-- WHERE Gender NOT IN ('Male', 'Female', 'Transgender');

-- SELECT all records from UserJobInfo
-- SELECT * FROM DotnetWebAPIsSchema.UserJobInfo;

-- SELECT all records from UserSalary
-- SELECT * FROM DotnetWebAPIsSchema.UserSalary;

-- SELECT specific columns with FullName concatenation from Users table with a filter on UserId
SELECT [UserId],
    [FirstName],
    [LastName],
    [Email],
    [Gender],
    [Active]
FROM DotnetWebAPIsSchema.Users ORDER BY UserId DESC

SELECT COUNT(*) FROM DotnetWebAPIsSchema.Users

-- INSERT a new record into Users table
INSERT INTO DotnetWebAPIsSchema.Users (
    [UserId],
    [FirstName],
    [LastName],
    [Email],
    [Gender],
    [Active]
) VALUES (
    [FirstName],
    [LastName],
    [Email],
    [Gender],
    [Active]
);

-- UPDATE a record in Users table with UserId = 25
UPDATE DotnetWebAPIsSchema.Users 
SET [FirstName]= 'Robin',
    [LastName]= 'Singh',
    [Email]= 'robinsingh@godaddy.com',
    [Gender]= 'Female',
    [Active]= 1
WHERE UserId = 19

        UPDATE DotnetWebAPIsSchema.Users 
            SET [FirstName]= 'Farica', 
                [LastName]= 'Wynn', 
                [Email]= 'fwynn2@redcross.org', 
                [Gender]= 'Female', 
                [Active]= 'False' 
            WHERE UserId =3

-- SELECT records from Users, UserJobInfo, and UserSalary with INNER JOIN and LEFT JOIN
-- SELECT [Users].[UserId],
--     [Users].[FirstName] + ' ' + [Users].[LastName] AS FullName,
--     [UserJobInfo].[JobTitle],
--     [UserJobInfo].[Department],
--     [UserSalary].[Salary],
--     [Users].[Email],
--     [Users].[Gender],
--     [Users].[Active]
-- FROM DotnetWebAPIsSchema.Users AS Users
-- LEFT JOIN DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo
--     ON UserJobInfo.UserId = Users.UserId
-- INNER JOIN DotnetWebAPIsSchema.UserSalary AS UserSalary
--     ON UserSalary.UserId = Users.UserId
-- WHERE Users.Active = 1
-- ORDER BY Users.UserId DESC;

-- DELETE records from UserSalary where UserId is between 250 and 750
-- DELETE FROM DotnetWebAPIsSchema.UserSalary WHERE UserId BETWEEN 250 AND 750;

-- SELECT records from UserSalary where the corresponding UserId exists in UserJobInfo and UserId is not 7
-- SELECT [UserId],
--     [Salary]
-- FROM DotnetWebAPIsSchema.UserSalary AS UserSalary
-- WHERE EXISTS (
--     SELECT * FROM DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo
--     WHERE UserJobInfo.UserId = UserSalary.UserId
-- )
-- AND UserId <> 7;

-- SELECT UserId and Salary from UserSalary and UNION with the same table
-- SELECT [UserId],
--     [Salary] FROM DotnetWebAPIsSchema.UserSalary
-- UNION
-- SELECT [UserId],
--     [Salary] FROM DotnetWebAPIsSchema.UserSalary;
