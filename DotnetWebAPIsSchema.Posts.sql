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
