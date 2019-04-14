USE [master]
GO
/****** Object:  Database [DB44]    Script Date: 14-Apr-19 2:54:37 PM ******/
CREATE DATABASE [DB44]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB44', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DB44.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB44_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DB44_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB44] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB44].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB44] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB44] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB44] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB44] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB44] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB44] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB44] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB44] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB44] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB44] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB44] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB44] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB44] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB44] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB44] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB44] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB44] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB44] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB44] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB44] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB44] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB44] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB44] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB44] SET  MULTI_USER 
GO
ALTER DATABASE [DB44] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB44] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB44] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB44] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB44] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB44] SET QUERY_STORE = OFF
GO
USE [DB44]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[Id] [int] NOT NULL,
	[NewsText] [text] NOT NULL,
	[AnnoucementDate] [date] NOT NULL,
	[CourseId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnswerText] [text] NOT NULL,
	[QuestionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CorrectAnswer]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorrectAnswer](
	[QuestionId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Fee] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseInstructor]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstructor](
	[CourseId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinalResult]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinalResult](
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Marks] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Id] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contact] [varchar](50) NOT NULL,
	[Cnic] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [text] NOT NULL,
	[CourseId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 14-Apr-19 2:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contact] [varchar](50) NOT NULL,
	[Cnic] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentEnrollment]    Script Date: 14-Apr-19 2:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEnrollment](
	[DateOfEnrollment] [date] NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentFee]    Script Date: 14-Apr-19 2:54:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFee](
	[Id] [int] NOT NULL,
	[IsPaid] [int] NOT NULL,
	[PaymentDate] [date] NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[CorrectAnswer]  WITH CHECK ADD FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([Id])
GO
ALTER TABLE [dbo].[CorrectAnswer]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructor] ([Id])
GO
ALTER TABLE [dbo].[FinalResult]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[FinalResult]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollment]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollment]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentFee]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentFee]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
USE [master]
GO
ALTER DATABASE [DB44] SET  READ_WRITE 
GO
