USE WebApiDataBase
GO

ALTER PROCEDURE DotnetWebAPIsSchema.spUsers_Get
    /* EXEC DotnetWebAPIsSchema.spUsers_Get @UserId = 2; */
    @UserId INT =NULL,
    @Active BIT = NULL
AS
BEGIN 

    -- IF OBJECT_ID('tempdb..#AverageDeptSalary','U') IS NOT NULL
    --     BEGIN
    --         DROP TABLE #AverageDeptSalary
    --     END

    -- DROP TABLE IF EXISTS #AverageDeptSalary

    SELECT UserJobInfo.Department
        , AVG(UserSalary.Salary) AvgSalary
        INTO #AverageDeptSalary 
    FROM DotnetWebAPIsSchema.Users AS Users
        LEFt JOIN DotnetWebAPIsSchema.UserSalary AS UserSalary
            ON UserSalary.UserId = Users.UserId
                
        LEFt JOIN DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo
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
        LEFt JOIN DotnetWebAPIsSchema.UserSalary AS UserSalary
                ON UserSalary.UserId = Users.UserId
                
        LEFt JOIN DotnetWebAPIsSchema.UserJobInfo AS UserJobInfo
                ON UserJobInfo.UserId = Users.UserId

        LEFT JOIN #AvgrageDeptSalary AS AvgSalary
            ON AvgSalary.Department = UserJobInfo.Department        
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
        WHERE Users.UserId = ISNULL(@UserId, Users.UserId)
            AND ISNULL(Users.Active, 0) = COALESCE(@Active, Users.Active, 0)

END

-- SELECT CASE WHEN NULL = NULL THEN 1 ELSE 0 END,
--     CASE WHEN NULL <> NULL THEN 1 ELSE 0 END