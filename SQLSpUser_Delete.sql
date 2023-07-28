USE WebApiDataBase
GO

CREATE PROCEDURE DotnetWebAPIsSchema.spUser_Delete
    @UserId INT
AS
BEGIN
    DELETE From DotnetWebAPIsSchema.Users
        WHERE UserId = @UserId

    DELETE From DotnetWebAPIsSchema.UserSalary
        WHERE UserId = @UserId

    DELETE From DotnetWebAPIsSchema.UserJobInfo
        WHERE UserId = @UserId
END