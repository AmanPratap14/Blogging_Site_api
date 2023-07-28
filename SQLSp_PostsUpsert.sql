USE WebApiDataBase
GO

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spPosts_Upsert
    @UserId INT,
    @PostTitle NVARCHAR(255),
    @PostContent NVARCHAR(MAX),
    @PostId INT = NULL
AS
BEGIN
    IF EXISTS (SELECT * FROM DotnetWebAPIsSchema.Posts
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
                PostUpdated= GETDATE()
            WHERE PostId = @PostId
    END


END