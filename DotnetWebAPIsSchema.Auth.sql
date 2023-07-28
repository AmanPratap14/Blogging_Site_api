-- DotnetWebAPIsSchema.Auth
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DotnetWebAPIsSchema].[Auth](
	[Email] [nvarchar](50) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- DotnetWebAPIsSchema.Posts
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DotnetWebAPIsSchema].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PostTitle] [nvarchar](255) NULL,
	[PostContent] [nvarchar](max) NULL,
	[PostCreated] [datetime] NULL,
	[PostUpdated] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- DotnetWebAPIsSchema.UserJobInfo
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DotnetWebAPIsSchema].[UserJobInfo](
	[UserId] [int] NULL,
	[JobTitle] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL
) ON [PRIMARY]
GO

-- DotnetWebAPIsSchema.Users
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DotnetWebAPIsSchema].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Active] [bit] NULL
) ON [PRIMARY]
GO

-- DotnetWebAPIsSchema.UsersSalary
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DotnetWebAPIsSchema].[Usersalary](
	[UserId] [int] NULL,
	[Salary] [nvarchar](50) NULL,
	) ON [PRIMARY]
GO



