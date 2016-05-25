USE [master]
GO
/****** Object:  Database [DB_Pens]    Script Date: 25.05.2016 14:06:38 ******/
CREATE DATABASE [DB_Pens]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Pens', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DB_Pens.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_Pens_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DB_Pens_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_Pens] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Pens].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Pens] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Pens] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Pens] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Pens] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Pens] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Pens] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Pens] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Pens] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Pens] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Pens] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Pens] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Pens] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Pens] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Pens] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Pens] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Pens] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Pens] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Pens] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Pens] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Pens] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Pens] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Pens] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Pens] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Pens] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Pens] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Pens] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Pens] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Pens] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Pens] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DB_Pens]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.05.2016 14:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 25.05.2016 14:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[department_id] [int] NULL,
	[role_id] [int] NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Role] ([id], [name]) VALUES (0, N'Admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'User')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (0, N'sa', N'sa', N'123qwe', N'', NULL, 0, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (1, N'user1', N'saUser', N'123qwe', N'0', NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (2, N'sa11', N'sa11', N'123qwe', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (3, N'bbb', N'bbb', N'123qwe', N'', NULL, 2, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [login], [password], [position], [department_id], [role_id], [firstname], [lastname]) VALUES (4, N'user', N'user', N'123qwe', N'', NULL, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [DB_Pens] SET  READ_WRITE 
GO
