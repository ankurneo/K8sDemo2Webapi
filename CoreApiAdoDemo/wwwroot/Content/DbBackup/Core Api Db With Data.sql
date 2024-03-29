USE [master]
GO
/****** Object:  Database [RaviDb]    Script Date: 08-06-2018 16:33:25 ******/
CREATE DATABASE [RaviDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RaviDb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RaviDb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RaviDb_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RaviDb_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RaviDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RaviDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RaviDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RaviDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RaviDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RaviDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RaviDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RaviDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RaviDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RaviDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RaviDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RaviDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RaviDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RaviDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RaviDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RaviDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RaviDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RaviDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RaviDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RaviDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RaviDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RaviDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RaviDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RaviDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RaviDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RaviDb] SET  MULTI_USER 
GO
ALTER DATABASE [RaviDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RaviDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RaviDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RaviDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RaviDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RaviDb]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08-06-2018 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[EmailId] [nvarchar](500) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Address] [nvarchar](max) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [Mobile], [Address], [IsActive]) VALUES (1, N'Ravi', N'ravi@gmail.com', N'1234567890', N'Dwarka sector 1', 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [Mobile], [Address], [IsActive]) VALUES (9, N'Oliver', N'oliver@isarrow.com', N'139768176', N'Star City', 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [Mobile], [Address], [IsActive]) VALUES (7, N'Barry', N'Barry@isflash.com', N'1783983', N'Central City', 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [EmailId], [Mobile], [Address], [IsActive]) VALUES (5, N'Bruce', N'bruce@isbatman.com', N'4388298', N'Gotham city', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Area] [decimal] NULL,
	[Continent] [nvarchar](20) NULL,
	[Leader] [nvarchar](150) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY] 

GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

GO
INSERT [dbo].[Countries] ([Id], [Name], [Area], [Continent], [Leader], [IsActive]) VALUES (1, N'India', 700, N'Asia', N'Narendra Modi', 1)
GO
INSERT [dbo].[Countries] ([Id], [Name], [Area], [Continent], [Leader], [IsActive]) VALUES (2, N'Russia', 1700, N'Asia', N'Putin', 1)
GO
INSERT [dbo].[Countries] ([Id], [Name], [Area], [Continent], [Leader], [IsActive]) VALUES (3, N'Canada', 9984670, N'Asia', N'Central City', 1)
GO
INSERT [dbo].[Countries] ([Id], [Name], [Area], [Continent], [Leader], [IsActive]) VALUES (4, N'China', 9706961, N'Asia', N'xin Ping', 1)
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO

/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 08-06-2018 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser]
(
@Id INT,
@ReturnCode NVARCHAR(20) OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET @ReturnCode = 'C200'
	IF NOT EXISTS (SELECT 1 FROM Users WHERE Id = @Id)
	BEGIN
		SET @ReturnCode ='C203'
		RETURN
	END
	ELSE
	BEGIN
		DELETE FROM Users WHERE Id = @Id
		SET @ReturnCode = 'C200'
		RETURN
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 08-06-2018 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC GetUsers
-- =============================================
CREATE PROCEDURE [dbo].[GetUsers]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Users(NOLOCK) ORDER BY Id ASC
END

GO
/****** Object:  StoredProcedure [dbo].[SaveUser]    Script Date: 08-06-2018 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveUser]
(
@Id INT,
@Name NVARCHAR(MAX),
@EmailId NVARCHAR(MAX),
@Mobile NVARCHAR(20),
@Address NVARCHAR(MAX),
@ReturnCode NVARCHAR(20) OUTPUT
)
AS
BEGIN
	SET @ReturnCode = 'C200'
	IF(@Id <> 0)
	BEGIN
		IF EXISTS (SELECT 1 FROM Users WHERE EmailId = @EmailId AND Id <> @Id)
		BEGIN
			SET @ReturnCode = 'C201'
			RETURN
		END
		IF EXISTS (SELECT 1 FROM Users WHERE Mobile = @Mobile AND Id <> @Id)
		BEGIN
			SET @ReturnCode = 'C202'
			RETURN
		END

		UPDATE Users SET
		Name = @Name,
		EmailId = @EmailId,
		Mobile = @Mobile,
		Address = @Address,
		IsActive = 1
		WHERE Id = @Id

		SET @ReturnCode = 'C200'
	END
	ELSE
	BEGIN
		IF EXISTS (SELECT 1 FROM Users WHERE EmailId = @EmailId)
		BEGIN
			SET @ReturnCode = 'C201'
			RETURN
		END
		IF EXISTS (SELECT 1 FROM Users WHERE Mobile = @Mobile)
		BEGIN
			SET @ReturnCode = 'C202'
			RETURN
		END

		INSERT INTO Users (Name,EmailId,Mobile,Address,IsActive)
		VALUES (@Name,@EmailId,@Mobile,@Address,1)

		SET @ReturnCode = 'C200'
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetCountries]    Script Date: 08-06-2018 16:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC GetUsers
-- =============================================
CREATE PROCEDURE [dbo].[GetCountries]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Countries(NOLOCK) ORDER BY Id ASC
END

GO
USE [master]
GO
ALTER DATABASE [RaviDb] SET  READ_WRITE 
GO
