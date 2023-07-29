-- DotnetWebAPIsSchema.Auth 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CREATE TABLE [DotnetWebAPIsSchema].[Auth](
-- 	[Email] [nvarchar](50) NULL,
-- 	[PasswordHash] [varbinary](max) NULL,
-- 	[PasswordSalt] [varbinary](max) NULL
-- ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
-- GO

SELECT * FROM DotnetWebAPIsSchema.Auth
SELECT * FROM DotnetWebAPIsSchema.Users
SELECT * FROM DotnetWebAPIsSchema.UserJobInfo
SELECT * FROM DotnetWebAPIsSchema.Usersalary
SELECT * FROM DotnetWebAPIsSchema.Posts



-- DotnetWebAPIsSchema.Posts
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CREATE TABLE [DotnetWebAPIsSchema].[Posts](
-- 	[PostId] [int] IDENTITY(1,1) NOT NULL,
-- 	[UserId] [int] NULL,
-- 	[PostTitle] [nvarchar](255) NULL,
-- 	[PostContent] [nvarchar](max) NULL,
-- 	[PostCreated] [datetime] NULL,
-- 	[PostUpdated] [datetime] NULL
-- ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
-- GO
INSERT INTO [DotnetWebAPIsSchema].[Posts] 
([UserId], [PostTitle], [PostContent], [PostCreated], [PostUpdated])
VALUES
    -- (1000, 'First Post', 'This is the content of the first post.', '2023-07-29 12:00:00', NULL),
    -- (1002, 'Second Post', 'This is the content of the second post.', '2023-07-29 13:30:00', NULL),
    (1003, 'Third Second Post', 'This is the content of the third post first.', '2023-07-29 12:29:00', NUll);

SELECT * FROM DotnetWebAPIsSchema.Posts

-- DotnetWebAPIsSchema.UserJobInfo
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CREATE TABLE [DotnetWebAPIsSchema].[UserJobInfo](
-- 	[UserId] [int] NULL,
-- 	[JobTitle] [nvarchar](50) NULL,
-- 	[Department] [nvarchar](50) NULL
-- ) ON [PRIMARY]
-- GO

-- DotnetWebAPIsSchema.Users
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CREATE TABLE [DotnetWebAPIsSchema].[Users](
-- 	[UserId] [int] IDENTITY(1,1) NOT NULL,
-- 	[FirstName] [nvarchar](50) NULL,
-- 	[LastName] [nvarchar](50) NULL,
-- 	[Email] [nvarchar](50) NULL,
-- 	[Gender] [nvarchar](50) NULL,
-- 	[Active] [bit] NULL
-- ) ON [PRIMARY]
-- GO

-- DotnetWebAPIsSchema.UsersSalary
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CREATE TABLE [DotnetWebAPIsSchema].[Usersalary](
-- 	[UserId] [int] NULL,
-- 	[Salary] [nvarchar](50) NULL,
-- 	) ON [PRIMARY]
-- GO