USE WebApiDataBase;
GO

-- To get All Users

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spUsers_Get
/*EXEC DotnetWebAPIsSchema.spUsers_Get @UserId=3*/
    @UserId INT = NULL
    , @Active BIT = NULL
AS
BEGIN
-- IF OBJECT_ID('tempdb..#AverageDeptSalary','U') IS NOT NULL
--     BEGIN
--         DROP TABLE #AverageDeptSalary
--     END

    DROP TABLE IF EXISTS #AverageDeptSalary

    SELECT UserJobInfo.Department
        , AVG(UserSalary.Salary) AvgSalary
        INTO #AverageDeptSalary
    FROM DotnetWebAPIsSchema.Users AS Users 
        LEFT JOIN DotnetWebAPIsSchema.UserSalary AS UserSalary
            ON UserSalary.UserId = Users.UserId
        LEFT JOIN DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo
            ON UserJobInfo.UserId = Users.UserId
    GROUP BY UserJobInfo.Department

    CREATE CLUSTERED INDEX cix_AverageDeptSalary_Department ON #AverageDeptSalary(Department)

    SELECT [Users].[UserId],
        [Users].[FirstName],
        [Users].[LastName],
        [Users].[Email],
        [Users].[Gender],
        [Users].[Active],
        UserSalary.Salary,
        UserJobInfo.Department,
        UserJobInfo.JobTitle,
        AvgSalary.AvgSalary
    FROM DotnetWebAPIsSchema.Users AS Users 
        LEFT JOIN DotnetWebAPIsSchema.UserSalary AS UserSalary
            ON UserSalary.UserId = Users.UserId
        LEFT JOIN DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo
            ON UserJobInfo.UserId = Users.UserId
        LEFT JOIN #AverageDeptSalary AS AvgSalary
            ON AvgSalary.Department = UserJobInfo.Department
        WHERE Users.UserId = ISNULL(@UserId, Users.UserId)
            AND ISNULL(Users.Active, 0) = COALESCE(@Active, Users.Active, 0)

        -- OUTER APPLY
        -- ( SELECT UserJobInfo2.Department
        --     , AVG(UserSalary2.Salary) AvgSalary
        --     FROM DotnetWebAPIsSchema.Users AS Users
        --         LEFt JOIN DotnetWebAPIsSchema.UserSalary AS UserSalary2
        --                 ON UserSalary2.UserId = Users.UserId
                
        --         LEFt JOIN DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo2
        --                 ON UserJobInfo2.UserId = Users.UserId
        --         WHERE UserJobInfo2.Department = UserJobInfo.Department
        --     GROUP BY UserJobInfo2.Department 
        -- )AS AvgSalary
END
GO

-- To Update user Info 

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spUser_Upsert
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@Email NVARCHAR(50),
	@Gender NVARCHAR(50),
	@JobTitle NVARCHAR(50),
	@Department NVARCHAR(50),
    @Salary DECIMAL(18, 4),
	@Active BIT = 1,
	@UserId INT = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM DotnetWebAPIsSchema.Users WHERE UserId = @UserId)
        BEGIN
        IF NOT EXISTS (SELECT * FROM DotnetWebAPIsSchema.Users WHERE Email = @Email)
            BEGIN
                DECLARE @OutputUserId INT

                INSERT INTO DotnetWebAPIsSchema.Users(
                    [FirstName],
                    [LastName],
                    [Email],
                    [Gender],
                    [Active]
                ) VALUES (
                    @FirstName,
                    @LastName,
                    @Email,
                    @Gender,
                    @Active
                )

                SET @OutputUserId = @@IDENTITY

                INSERT INTO DotnetWebAPIsSchema.UserSalary(
                    UserId,
                    Salary
                ) VALUES (
                    @OutputUserId,
                    @Salary
                )

                INSERT INTO DotnetWebAPIsSchema.UserJobInfo(
                    UserId,
                    Department,
                    JobTitle
                ) VALUES (
                    @OutputUserId,
                    @Department,
                    @JobTitle
                )
            END
        END
    ELSE 
        BEGIN
            UPDATE DotnetWebAPIsSchema.Users 
                SET FirstName = @FirstName,
                    LastName = @LastName,
                    Email = @Email,
                    Gender = @Gender,
                    Active = @Active
                WHERE UserId = @UserId

            UPDATE DotnetWebAPIsSchema.UserSalary
                SET Salary = @Salary
                WHERE UserId = @UserId

            UPDATE DotnetWebAPIsSchema.UserJobInfo
                SET Department = @Department,
                    JobTitle = @JobTitle
                WHERE UserId = @UserId
        END
END
GO

-- To DELETE User 

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spUser_Delete
    @UserId INT
AS
BEGIN
    DECLARE @Email NVARCHAR(50);

    SELECT  @Email = Users.Email
      FROM  DotnetWebAPIsSchema.Users
    WHERE  Users.UserId = @UserId;

    DELETE  FROM DotnetWebAPIsSchema.UserSalary
    WHERE  UserSalary.UserId = @UserId;

    DELETE  FROM DotnetWebAPIsSchema.UserJobInfo
    WHERE  UserJobInfo.UserId = @UserId;

    DELETE  FROM DotnetWebAPIsSchema.Users
    WHERE  Users.UserId = @UserId;

    DELETE  FROM DotnetWebAPIsSchema.Auth
    WHERE  Auth.Email = @Email;
END;
GO

-- To get Post all, By SearchValue, PostId, UserId

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spPosts_Get
-- getallpost
/* EXEC DotnetWebAPIsSchema.spPosts_Get */
-- get all post by userId and searchValue
/* EXEC DotnetWebAPIsSchema.spPosts_Get @UserId= 1009, @SearchValue='afdhaod' */
/* EXEC DotnetWebAPIsSchema.spPosts_Get @SearchValue='afdhaod' */
-- get post by postId
/* EXEC DotnetWebAPIsSchema.spPosts_Get @PostID= 6 */
    @UserId INT = NULL
    , @SearchValue NVARCHAR(MAX) = NULL
    , @PostId INT = NULL
AS
BEGIN
    SELECT [Posts].[PostId],
        [Posts].[UserId],
        [Posts].[PostTitle],
        [Posts].[PostContent],
        [Posts].[PostCreated],
        [Posts].[PostUpdated] 
    FROM DotnetWebAPIsSchema.Posts AS Posts
        WHERE Posts.UserId = ISNULL(@UserId, Posts.UserId)
            AND Posts.PostId = ISNULL(@PostId, Posts.PostId)
            AND (@SearchValue IS NULL
                OR Posts.PostContent LIKE '%' + @SearchValue + '%'
                OR Posts.PostTitle LIKE '%' + @SearchValue + '%')
END
GO

-- To Update Post by UserId, PostId, PostContent, PostTitle

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spPosts_Upsert
    @UserId INT
    , @PostTitle NVARCHAR(255)
    , @PostContent NVARCHAR(MAX)
    , @PostId INT = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM DotnetWebAPIsSchema.Posts
    WHERE PostId = @PostId)
        BEGIN
            INSERT INTO DotnetWebAPIsSchema.Posts(
                [UserId],
                [PostTitle],
                [PostContent],
                [PostCreated],
                [PostUpdated]
            ) VALUES (
                @UserId,
                @PostTitle,
                @PostContent,
                GETDATE(),
                GETDATE()
            )
        END
    ELSE
        BEGIN
            UPDATE DotnetWebAPIsSchema.Posts 
                SET PostTitle = @PostTitle,
                    PostContent = @PostContent,
                    PostUpdated = GETDATE()
                WHERE PostId = @PostId
        END
END
GO

-- To DELETE Post by UserId orPostId

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spPost_Delete
    @PostId INT
    , @UserId INT 
AS
BEGIN
    DELETE FROM DotnetWebAPIsSchema.Posts 
        WHERE PostId = @PostId
            AND UserId = @UserId
END
GO

--This SP is for to update register new login/email-Passwords and check login credentials

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spLoginConfirmation_Get
    @Email NVARCHAR(50)
AS
BEGIN
    SELECT [Auth].[PasswordHash],
        [Auth].[PasswordSalt] 
    FROM DotnetWebAPIsSchema.Auth AS Auth 
        WHERE Auth.Email = @Email
END;
GO

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spRegistration_Upsert
    @Email NVARCHAR(50),
    @PasswordHash VARBINARY(MAX),
    @PasswordSalt VARBINARY(MAX)
AS 
BEGIN
    IF NOT EXISTS (SELECT * FROM DotnetWebAPIsSchema.Auth 
        WHERE Email = @Email)
        BEGIN
            INSERT INTO DotnetWebAPIsSchema.Auth(
                [Email],
                [PasswordHash],
                [PasswordSalt]
            ) VALUES (
                @Email,
                @PasswordHash,
                @PasswordSalt
            )
        END
    ELSE
        BEGIN
            UPDATE DotnetWebAPIsSchema.Auth 
                SET PasswordHash = @PasswordHash,
                    PasswordSalt = @PasswordSalt
                WHERE Email = @Email
        END
END
GO