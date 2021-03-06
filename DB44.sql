USE [DB44]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/30/2019 10:18:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 4/30/2019 10:18:47 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 4/30/2019 10:18:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/30/2019 10:18:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/30/2019 10:18:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/30/2019 10:18:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/30/2019 10:18:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/30/2019 10:18:47 PM ******/
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
	[DOB] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
	[RegistrationDate] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CorrectAnswer]    Script Date: 4/30/2019 10:18:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorrectAnswer](
	[AnswerText] [text] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CorrectAnswer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/30/2019 10:18:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseInstructor]    Script Date: 4/30/2019 10:18:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstructor](
	[CourseId] [int] NOT NULL,
	[InstructorId] [nvarchar](128) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CourseInstructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FinalResult]    Script Date: 4/30/2019 10:18:47 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 4/30/2019 10:18:47 PM ******/
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
/****** Object:  Table [dbo].[StudentEnrollment]    Script Date: 4/30/2019 10:18:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEnrollment](
	[DateOfEnrollment] [date] NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentFee]    Script Date: 4/30/2019 10:18:47 PM ******/
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
SET IDENTITY_INSERT [dbo].[Announcement] ON 

INSERT [dbo].[Announcement] ([Id], [NewsText], [AnnoucementDate], [CourseId]) VALUES (1007, N'Tomorrow is oFF!', CAST(N'2019-04-29' AS Date), 1012)
INSERT [dbo].[Announcement] ([Id], [NewsText], [AnnoucementDate], [CourseId]) VALUES (1008, N'Tomorrow is oFF!', CAST(N'2019-04-04' AS Date), 1013)
SET IDENTITY_INSERT [dbo].[Announcement] OFF
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (1, N'kkkmk', 2)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (2, N'asd', 2)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (3, N'as', 2)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (4, N'kkkmk', 3)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (5, N'asd', 3)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (6, N'as', 3)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (7, N'pela option', 4)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (8, N'dosra option', 4)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (9, N'teesra', 4)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (10, N'pela option', 5)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (11, N'dosra option', 5)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (12, N'teesra', 5)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (13, N'pela option', 6)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (14, N'dosra option', 6)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (15, N'teesra', 6)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (16, N'pela option', 7)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (17, N'dosra option', 7)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (18, N'teesra', 7)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (19, N'pela option', 8)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (20, N'dosra option', 8)
INSERT [dbo].[Answer] ([Id], [AnswerText], [QuestionId]) VALUES (21, N'teesra', 8)
SET IDENTITY_INSERT [dbo].[Answer] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a354101e-fa27-4cbc-9896-263e4086220d', N'Instructor')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'd1f1f929-d9d6-43b4-a567-dfb00eb37bfd', N'Student')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'13060cbf-fecf-4e3f-ae15-b4b691d5a3e0', N'a354101e-fa27-4cbc-9896-263e4086220d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6c0b80a2-8439-4f18-ab18-d7bf74db607f', N'd1f1f929-d9d6-43b4-a567-dfb00eb37bfd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8a918a41-0c11-4590-88ae-a65602ca35e0', N'd1f1f929-d9d6-43b4-a567-dfb00eb37bfd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c229a97a-ad30-4c5b-9253-43af17e774d2', N'd1f1f929-d9d6-43b4-a567-dfb00eb37bfd')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Contact], [Cnic], [City], [DOB], [RegistrationDate]) VALUES (N'067c497f-0e14-4e3d-93ce-fb17604cc843', N'ahmed106ak@gmail.com', 0, N'AD1fNpmWa0/oPhPX3WE/pA4JOacbhSond8FHgjPAjf9/OvG+szRtPA/6Re8m65eECw==', N'2e7a482e-007d-4c70-b3a2-1cdd35ba2fe9', NULL, 0, 0, NULL, 1, 0, N'ahmed106ak@gmail.com', N'abc', N'abc', N'03018530780', N'3310037875365', N'fsd', CAST(N'2019-04-17 00:00:00.000' AS DateTime), CAST(N'2019-04-28 00:00:00.000' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Contact], [Cnic], [City], [DOB], [RegistrationDate]) VALUES (N'13060cbf-fecf-4e3f-ae15-b4b691d5a3e0', N'ahmed1026ak@gmail.co', 0, N'ABm3Cb+zhrd8BfRh9ucfCpWtYvbkz7Hqm4kwcvFmwbRiz0dYX+PnU68QRUYRJUx9CQ==', N'37ddf0bd-a8a9-4244-a973-a66b8b5a4e68', NULL, 0, 0, NULL, 1, 0, N'ahmed1026ak@gmail.co', N'abc', N'hmm', N'03018530780', N'3310037875365', N'fsd', CAST(N'2019-04-27 00:00:00.000' AS DateTime), CAST(N'2019-04-28 00:00:00.000' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Contact], [Cnic], [City], [DOB], [RegistrationDate]) VALUES (N'6c0b80a2-8439-4f18-ab18-d7bf74db607f', N'awais@gmail.com', 0, N'AEqPwqY+jyEI8W7HAYl2JAMFCmgizSc1DZtxpEt3vb+zVYbFHNUT7cjX5Qzu0BG5YQ==', N'c2e244b0-f8fb-410a-85b9-6bf202409945', NULL, 0, 0, NULL, 1, 0, N'awais@gmail.com', N'Muhammad', N'Awais', N'03214655990', N'35201759633787', N'Lahore', CAST(N'2019-02-09 00:00:00.000' AS DateTime), CAST(N'2019-04-28 00:00:00.000' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Contact], [Cnic], [City], [DOB], [RegistrationDate]) VALUES (N'8a918a41-0c11-4590-88ae-a65602ca35e0', N'ax@gmail.com', 0, N'ACryGEKR8M222REkPjARCD05ioqM161rGKbPgwgrOzRgqT66qDCRKU6emG1Hx1IbDw==', N'791d2111-d552-4aab-ac43-b9534529e840', NULL, 0, 0, NULL, 1, 0, N'ax@gmail.com', N'Ahmad', N'Abdul Khaliq', N'21', N'3310037875365', N'kjh', CAST(N'2019-04-17 00:00:00.000' AS DateTime), CAST(N'2019-04-30 00:00:00.000' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Contact], [Cnic], [City], [DOB], [RegistrationDate]) VALUES (N'c229a97a-ad30-4c5b-9253-43af17e774d2', N'ahmad106ak@gmail.com', 0, N'AE1wggg4W5qufUGKcefAkW8LeaYm4I4SSJ8saibNTYxhj6VXkjBuWEfpUL4BUDBmTg==', N'1473ec92-371f-475f-9aa7-c7e954b32d28', NULL, 0, 0, NULL, 1, 0, N'ahmad106ak@gmail.com', N'UserRoleStudent', N'hmm', N'03018530780', N'3310037875365', N'fsd', CAST(N'2019-04-10 00:00:00.000' AS DateTime), CAST(N'2019-04-28 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CorrectAnswer] ON 

INSERT [dbo].[CorrectAnswer] ([AnswerText], [QuestionId], [Id]) VALUES (N'oh yeah', 2, 1)
INSERT [dbo].[CorrectAnswer] ([AnswerText], [QuestionId], [Id]) VALUES (N'oh yeah', 3, 2)
INSERT [dbo].[CorrectAnswer] ([AnswerText], [QuestionId], [Id]) VALUES (N'sahi jawab', 4, 3)
INSERT [dbo].[CorrectAnswer] ([AnswerText], [QuestionId], [Id]) VALUES (N'sahi jawab', 5, 4)
INSERT [dbo].[CorrectAnswer] ([AnswerText], [QuestionId], [Id]) VALUES (N'sahi jawab', 6, 5)
INSERT [dbo].[CorrectAnswer] ([AnswerText], [QuestionId], [Id]) VALUES (N'sahi jawab', 7, 6)
INSERT [dbo].[CorrectAnswer] ([AnswerText], [QuestionId], [Id]) VALUES (N'sahi jawab', 8, 7)
SET IDENTITY_INSERT [dbo].[CorrectAnswer] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Name], [Type], [Fee], [StartDate], [EndDate], [ImagePath]) VALUES (1012, N'PF', 0, 10000, CAST(N'2019-04-06' AS Date), CAST(N'2019-04-26' AS Date), N'/Content/img/636920529436553736.jpg')
INSERT [dbo].[Course] ([Id], [Name], [Type], [Fee], [StartDate], [EndDate], [ImagePath]) VALUES (1013, N'DBMS', 0, 20000, CAST(N'2019-04-05' AS Date), CAST(N'2019-04-26' AS Date), N'/Content/img/636920549345368747.jpg')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [QuestionText], [CourseId]) VALUES (2, N'helloe', 1012)
INSERT [dbo].[Question] ([Id], [QuestionText], [CourseId]) VALUES (3, N'helloe', 1012)
INSERT [dbo].[Question] ([Id], [QuestionText], [CourseId]) VALUES (4, N'dosra sawal', 1012)
INSERT [dbo].[Question] ([Id], [QuestionText], [CourseId]) VALUES (5, N'dosra sawal', 1012)
INSERT [dbo].[Question] ([Id], [QuestionText], [CourseId]) VALUES (6, N'dosra sawal', 1012)
INSERT [dbo].[Question] ([Id], [QuestionText], [CourseId]) VALUES (7, N'dosra sawal', 1012)
INSERT [dbo].[Question] ([Id], [QuestionText], [CourseId]) VALUES (8, N'dosra sawal', 1012)
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[StudentEnrollment] ([DateOfEnrollment], [CourseId], [StudentId]) VALUES (CAST(N'2019-04-30' AS Date), 1012, N'8a918a41-0c11-4590-88ae-a65602ca35e0')
INSERT [dbo].[StudentEnrollment] ([DateOfEnrollment], [CourseId], [StudentId]) VALUES (CAST(N'2019-04-30' AS Date), 1013, N'8a918a41-0c11-4590-88ae-a65602ca35e0')
/****** Object:  Index [IX_CorrectAnswer]    Script Date: 4/30/2019 10:18:47 PM ******/
ALTER TABLE [dbo].[CorrectAnswer] ADD  CONSTRAINT [IX_CorrectAnswer] UNIQUE NONCLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[CorrectAnswer]  WITH CHECK ADD  CONSTRAINT [FK__CorrectAn__Quest__300424B4] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[CorrectAnswer] CHECK CONSTRAINT [FK__CorrectAn__Quest__300424B4]
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
