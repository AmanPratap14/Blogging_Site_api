USE WebApiDataBase

CREATE TABLE DotnetWebAPIsSchema.Posts (
    PostId INT IDENTITY(1, 1),
    UserId INT,
    PostTitle NVARCHAR(255),
    PostContent NVARCHAR(MAX),
    PostCreated DATETIME,
    PostUpdated DATETIME
)

CREATE CLUSTERED INDEX cix_Posts_UserId_PostId ON DotnetWebAPIsSchema.Posts(UserId, PostId)

SELECT [PostId],
        [UserId],
        [PostTitle],
        [PostContent],
        [PostCreated],
        [PostUpdated] 
    FROM DotnetWebAPIsSchema.Posts

SELECT * FROM DotnetWebAPIsSchema.Posts 
WHERE PostTitle LIKE '%search%' OR PostContent LIKE '%search%'

INSERT INTO DotnetWebAPIsSchema.Posts([PostId],
        [UserId],
        [PostTitle],
        [PostContent],
        [PostCreated],
        [PostUpdated]) VALUES ()

UPDATE DotnetWebAPIsSchema.Posts 
    SET UserId= 1009
    WHERE PostId = 1

DELETE FROM DotnetWebAPIsSchema.Posts 
    WHERE PostId = 4
    AND UserId = 3