USE WebApiDataBase
GO
CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spUser_Upsert
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@Email NVARCHAR(50),
	@Gender NVARCHAR(50),
    @JobTitle NVARCHAR(50),
	@Department NVARCHAR(50),
    @Salary DECIMAL(18, 4),
	@Active BIT =1,
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
                SET @OutputUserId= @@IDENTITY

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