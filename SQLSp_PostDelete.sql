USE WebApiDataBase
GO

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spPost_Delete
    @UserId INT,
    @PostId INT = NULL
AS
BEGIN
    DELETE DotnetWebAPIsSchema.Posts
        WHERE PostId = @PostId
            AND UserId = @UserId
END