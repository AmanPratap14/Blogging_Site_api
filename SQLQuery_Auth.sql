USE WebApiDataBase

SELECT * FROM DotnetWebAPIsSchema.Users

SELECT [UserId],
[JobTitle],
[Department] FROM DotnetWebAPIsSchema.UserJobInfo

CREATE TABLE DotnetWebAPIsSchema.Auth (
    Email NVARCHAR(50),
    PasswordHash VARBINARY(MAX),
    PasswordSalt VARBINARY(MAX)
)

SELECT * FROM DotnetWebAPIsSchema.Auth WHERE Email =''

INSERT INTO DotnetWebAPIsSchema.Auth ([Email],
[PasswordHash],
[PasswordSalt]) VALUE ()