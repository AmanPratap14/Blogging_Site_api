-- -- Create the database
-- CREATE DATABASE WebApiDataBase;
-- GO
        -- DROP TABLE IF EXISTS DotnetWebAPIsSchema.Users;

        -- -- IF OBJECT_ID('DotnetWebAPIsSchema.Users') IS NOT NULL
        -- --     DROP TABLE DotnetWebAPIsSchema.Users;

-- -- Use the database
-- USE WebApiDataBase;
-- GO
 
-- -- Create the schema
-- CREATE SCHEMA DotnetWebAPIsSchema;
-- GO 

--------------------------------------------------------------

            -- DotnetWebAPIsSchema.Users
            -- SET ANSI_NULLS ON
            -- GO
            -- SET QUOTED_IDENTIFIER ON
            -- GO
CREATE TABLE DotnetWebAPIsSchema.Users
(
    UserId INT IDENTITY(1, 1) PRIMARY KEY
    , FirstName NVARCHAR(50)
    , LastName NVARCHAR(50)
    , Email NVARCHAR(50)
    , Gender NVARCHAR(50)
    , Active BIT
);
GO

-----------------------------------------------------------------
-- DROP TABLE IF EXISTS DotnetWebAPIsSchema.Usersalary;

-- IF OBJECT_ID('DotnetWebAPIsSchema.Usersalary') IS NOT NULL
--     DROP TABLE DotnetWebAPIsSchema.Usersalary;

            -- DotnetWebAPIsSchema.UsersSalary
            -- SET ANSI_NULLS ON
            -- GO
            -- SET QUOTED_IDENTIFIER ON
            -- GO
CREATE TABLE [DotnetWebAPIsSchema].[Usersalary](
	[UserId] [int] NULL,
	[Salary] [nvarchar](50) NULL,
	) ON [PRIMARY]
GO

-----------------------------------------------------------------

DROP TABLE IF EXISTS DotnetWebAPIsSchema.UserJobInfo;

-- IF OBJECT_ID('DotnetWebAPIsSchema.UserJobInfo') IS NOT NULL
--     DROP TABLE DotnetWebAPIsSchema.UserJobInfo;

            -- DotnetWebAPIsSchema.UserJobInfo
            -- SET ANSI_NULLS ON
            -- GO
            -- SET QUOTED_IDENTIFIER ON
            -- GO

CREATE TABLE DotnetWebAPIsSchema.UserJobInfo
(
    UserId INT
    , JobTitle NVARCHAR(50)
    , Department NVARCHAR(50),
);
GO
--------------------------------------------------------------------
            -- DotnetWebAPIsSchema.Auth 
            -- -- SET ANSI_NULLS ON
            -- -- GO
            -- -- SET QUOTED_IDENTIFIER ON
            -- GO

CREATE TABLE DotnetWebAPIsSchema.Auth  (
    Email NVARCHAR(50),
    PasswordHash VARBINARY(MAX),
    PasswordSalt VARBINARY(MAX)
)


        -- SELECT * FROM DotnetWebAPIsSchema.Users 
            -- OR
        -- SELECT [UserId],
        -- [JobTitle],
        -- [Department] FROM DotnetWebAPIsSchema.UserJobInfo

-------------------------------------------------------------------

        -- DotnetWebAPIsSchema.Posts
        -- SET ANSI_NULLS ON
        -- GO
        -- SET QUOTED_IDENTIFIER ON
        -- GO
CREATE TABLE [DotnetWebAPIsSchema].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PostTitle] [nvarchar](255) NULL,
	[PostContent] [nvarchar](max) NULL,
	[PostCreated] [datetime] NULL,
	[PostUpdated] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE CLUSTERED INDEX cix_Posts_UserId_PostId ON DotnetWebAPIsSchema.Posts(UserId, PostId)
GO
-- INSERT INTO [DotnetWebAPIsSchema].[Posts] 
-- ([UserId], [PostTitle], [PostContent], [PostCreated], [PostUpdated])
-- VALUES
--     -- (1000, 'First Post', 'This is the content of the first post.', '2023-07-29 12:00:00', NULL),
--     -- (1002, 'Second Post', 'This is the content of the second post.', '2023-07-29 13:30:00', NULL),
--     (1003, 'Third Second Post', 'This is the content of the third post first.', '2023-07-29 12:29:00', NUll);

--------------------------------------------------------------------------------------------

                --INNER JOIN  , LEFT JOIN 
SELECT records from Users, UserJobInfo, and UserSalary with INNER JOIN and LEFT JOIN
SELECT [Users].[UserId],
    [Users].[FirstName] + ' ' + [Users].[LastName] AS FullName,
    [UserJobInfo].[JobTitle],
    [UserJobInfo].[Department],
    [UserSalary].[Salary],
    [Users].[Email],
    [Users].[Gender],
    [Users].[Active]
FROM DotnetWebAPIsSchema.Users AS Users
LEFT JOIN DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo
    ON UserJobInfo.UserId = Users.UserId
INNER JOIN DotnetWebAPIsSchema.UserSalary AS UserSalary
    ON UserSalary.UserId = Users.UserId
WHERE Users.Active = 1
ORDER BY Users.UserId DESC;

------------------------------------------------------------------------------

            -- DELETE Command to DELETE btw range
-- DELETE records from UserSalary where UserId is between 250 and 750
-- DELETE FROM DotnetWebAPIsSchema.UserSalary WHERE UserId BETWEEN 250 AND 750;

----------------------------------------------------------------------------------------

        -- SELECT records from UserSalary where the corresponding 
        --         UserId exists in UserJobInfo and UserId is not 7


-- SELECT [UserId],
--     [Salary]
-- FROM DotnetWebAPIsSchema.UserSalary AS UserSalary
-- WHERE EXISTS (
--     SELECT * FROM DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo
--     WHERE UserJobInfo.UserId = UserSalary.UserId
-- )
-- AND UserId <> 7;

--------------------------------------------------------------------------------------------

--                UNION of tables 
-- SELECT UserId and Salary from UserSalary and UNION with the same table
-- SELECT [UserId],
--     [Salary] FROM DotnetWebAPIsSchema.UserSalary
-- UNION
-- SELECT [UserId],
--     [Salary] FROM DotnetWebAPIsSchema.UserSalary;



-- SELECT * FROM DotnetWebAPIsSchema.Auth
-- SELECT * FROM DotnetWebAPIsSchema.Users
-- SELECT * FROM DotnetWebAPIsSchema.UserJobInfo
-- SELECT * FROM DotnetWebAPIsSchema.Usersalary
-- SELECT * FROM DotnetWebAPIsSchema.Posts