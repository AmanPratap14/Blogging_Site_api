USE WebApiDataBase
GO

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spPosts_Get
-- getallpost
/* EXEC DotnetWebAPIsSchema.spPosts_Get */
-- get all post by userId and searchValue
/* EXEC DotnetWebAPIsSchema.spPosts_Get @UserId= 1009, @SearchValue='afdhaod' */
/* EXEC DotnetWebAPIsSchema.spPosts_Get @SearchValue='afdhaod' */
-- get post by postId
/* EXEC DotnetWebAPIsSchema.spPosts_Get @PostID= 6 */

    @UserID INT = NULL,
    @SearchValue NVARCHAR(MAX) = NULL,
    @PostId INT = NULL

AS 
BEGIN
    SELECT [Posts].[PostId],
        [Posts].[UserId],
        [Posts].[PostTitle],
        [Posts].[PostContent],
        [Posts].[PostCreated],
        [Posts].[PostUpdated] 
    FROM DotnetWebAPIsSchema.Posts AS Posts
        WHERE Posts.UserId = ISNULL(@UserID, Posts.UserId)
            AND Posts.PostId = ISNULL(@PostId, PostId)
            AND (@SearchValue IS NULL 
                    OR Posts.PostContent LIKE '%' + @SearchValue + '%'
                    OR Posts.PostTitle LIKE '%' + @SearchValue + '%')
END