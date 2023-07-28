USE WebApiDataBase
GO

-- SELECT [Email],
-- [PasswordHash],
-- [PasswordSalt] FROM DotnetWebAPIsSchema.Auth

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spRegistration_Upsert
    @Email NVARCHAR(50),
    @PasswordHash VARBINARY(MAX),
    @PasswordSalt VARBINARY(MAX)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM DotnetWebAPIsSchema.Auth 
        WHERE Email = @Email)
        BEGIN
            INSERT INTO DotnetWebAPIsSchema.Auth(
                [Email],
                [PasswordHash],
                [PasswordSalt]
            )VALUES (
                @Email,
                @PasswordHash,
                @PasswordSalt
            )
        END
    ELSE 
        BEGIN
            UPDATE DotnetWebAPIsSchema.Auth
            SET PasswordSalt= @PasswordSalt,
                PasswordHash= @PasswordHash
            WHERE Email = @Email           
        END
END

GO

CREATE OR ALTER PROCEDURE DotnetWebAPIsSchema.spLoginConfrimation_Get
    @Email NVARCHAR(50)
AS
BEGIN
    SELECT [Auth].[PasswordHash],
            [Auth].[PasswordSalt]
    FROM DotnetWebAPIsSchema.Auth as Auth
        WHERE Auth.Email = @Email
END