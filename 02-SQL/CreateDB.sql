USE [master]
GO
/****** Object:  Database [Barber]    Script Date: 29.09.2015 23:13:11 ******/
CREATE DATABASE [Barber]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Barber', FILENAME = N'E:\MSSQLSERVER\MSSQL\Data\Barber.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Barber_log', FILENAME = N'E:\MSSQLSERVER\MSSQL\Data\Barber_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Barber] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Barber].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Barber] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Barber] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Barber] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Barber] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Barber] SET ARITHABORT OFF 
GO
ALTER DATABASE [Barber] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Barber] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Barber] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Barber] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Barber] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Barber] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Barber] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Barber] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Barber] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Barber] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Barber] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Barber] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Barber] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Barber] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Barber] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Barber] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Barber] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Barber] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Barber] SET RECOVERY FULL 
GO
ALTER DATABASE [Barber] SET  MULTI_USER 
GO
ALTER DATABASE [Barber] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Barber] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Barber] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Barber] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Barber', N'ON'
GO
USE [Barber]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[ClientID] [int] NOT NULL,
	[IsHidden] [bit] NOT NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[IsHidden] [bit] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuantityType]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuantityType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuantityType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CurrentResourceHistoryID] [int] NOT NULL,
	[QuantityForPrice] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TimesStamp] [timestamp] NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[QuantityTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource2Service]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource2Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[ResourceHistoryID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsHidden] [bit] NOT NULL,
 CONSTRAINT [PK_Resource2Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceHistory]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ResourceID] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ResourceHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VisitID] [int] NOT NULL,
	[ServiceTypeID] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[SpentTime] [time](7) NULL,
	[Description] [nvarchar](max) NULL,
	[IsHidden] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Visit]    Script Date: 29.09.2015 23:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ClientID] [int] NOT NULL,
	[IsHidden] [int] NOT NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Calendar]  WITH CHECK ADD  CONSTRAINT [FK_Calendar_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Calendar] CHECK CONSTRAINT [FK_Calendar_Client]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_Resource_QuantityType] FOREIGN KEY([QuantityTypeID])
REFERENCES [dbo].[QuantityType] ([ID])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_Resource_QuantityType]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_Resource_ResourceHistory] FOREIGN KEY([CurrentResourceHistoryID])
REFERENCES [dbo].[ResourceHistory] ([ID])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_Resource_ResourceHistory]
GO
ALTER TABLE [dbo].[Resource2Service]  WITH CHECK ADD  CONSTRAINT [FK_Resource2Service_ResourceHistory] FOREIGN KEY([ResourceHistoryID])
REFERENCES [dbo].[ResourceHistory] ([ID])
GO
ALTER TABLE [dbo].[Resource2Service] CHECK CONSTRAINT [FK_Resource2Service_ResourceHistory]
GO
ALTER TABLE [dbo].[Resource2Service]  WITH CHECK ADD  CONSTRAINT [FK_Resource2Service_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[Resource2Service] CHECK CONSTRAINT [FK_Resource2Service_Service]
GO
ALTER TABLE [dbo].[ResourceHistory]  WITH CHECK ADD  CONSTRAINT [FK_ResourceHistory_Resource] FOREIGN KEY([ResourceID])
REFERENCES [dbo].[Resource] ([ID])
GO
ALTER TABLE [dbo].[ResourceHistory] CHECK CONSTRAINT [FK_ResourceHistory_Resource]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Visit] FOREIGN KEY([VisitID])
REFERENCES [dbo].[Visit] ([ID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Visit]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_ServiceType_Service] FOREIGN KEY([ServiceTypeID])
REFERENCES [dbo].[ServiceType] ([ID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_ServiceType_Service]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Client]
GO
USE [master]
GO
ALTER DATABASE [Barber] SET  READ_WRITE 
GO
