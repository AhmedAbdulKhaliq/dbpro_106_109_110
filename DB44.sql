USE [DB44]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 26-Apr-19 6:02:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsText] [text] NOT NULL,
	[AnnoucementDate] [date] NOT NULL,
	[CourseId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 26-Apr-19 6:02:56 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Contact] [nvarchar](max) NULL,
	[Cnic] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[DOB] [datetime] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CorrectAnswer]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorrectAnswer](
	[QuestionId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Fee] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[ImagePath] [varchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseInstructor]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstructor](
	[CourseId] [int] NOT NULL,
	[InstructorId] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinalResult]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinalResult](
	[CourseId] [int] NOT NULL,
	[StudentId] [nvarchar](128) NOT NULL,
	[Marks] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 26-Apr-19 6:02:56 AM ******/
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
/****** Object:  Table [dbo].[StudentEnrollment]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEnrollment](
	[DateOfEnrollment] [date] NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentFee]    Script Date: 26-Apr-19 6:02:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsPaid] [int] NOT NULL,
	[PaymentDate] [date] NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__StudentF__3214EC07A018653B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [DOB]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK__Announcem__Cours__20C1E124] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Announcement] CHECK CONSTRAINT [FK__Announcem__Cours__20C1E124]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK__Answer__Question__21B6055D] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK__Answer__Question__21B6055D]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CorrectAnswer]  WITH CHECK ADD  CONSTRAINT [FK__CorrectAn__Answe__22AA2996] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CorrectAnswer] CHECK CONSTRAINT [FK__CorrectAn__Answe__22AA2996]
GO
ALTER TABLE [dbo].[CorrectAnswer]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK__CourseIns__Cours__24927208] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK__CourseIns__Cours__24927208]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK__CourseIns__Instr__25869641] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK__CourseIns__Instr__25869641]
GO
ALTER TABLE [dbo].[FinalResult]  WITH CHECK ADD  CONSTRAINT [FK__FinalResu__Cours__267ABA7A] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FinalResult] CHECK CONSTRAINT [FK__FinalResu__Cours__267ABA7A]
GO
ALTER TABLE [dbo].[FinalResult]  WITH CHECK ADD  CONSTRAINT [FK__FinalResu__Stude__276EDEB3] FOREIGN KEY([StudentId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FinalResult] CHECK CONSTRAINT [FK__FinalResu__Stude__276EDEB3]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK__StudentEn__Cours__29572725] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentEnrollment] CHECK CONSTRAINT [FK__StudentEn__Cours__29572725]
GO
ALTER TABLE [dbo].[StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK__StudentEn__Stude__5165187F] FOREIGN KEY([StudentId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollment] CHECK CONSTRAINT [FK__StudentEn__Stude__5165187F]
GO
ALTER TABLE [dbo].[StudentFee]  WITH CHECK ADD  CONSTRAINT [FK__StudentFe__Cours__2B3F6F97] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentFee] CHECK CONSTRAINT [FK__StudentFe__Cours__2B3F6F97]
GO
ALTER TABLE [dbo].[StudentFee]  WITH CHECK ADD  CONSTRAINT [FK__StudentFe__Stude__534D60F1] FOREIGN KEY([StudentId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[StudentFee] CHECK CONSTRAINT [FK__StudentFe__Stude__534D60F1]
GO
