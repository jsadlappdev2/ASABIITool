USE [master]
GO
/****** Object:  Database [ASABIITool]    Script Date: 07/25/2015 23:06:46 ******/
CREATE DATABASE [ASABIITool] ON  PRIMARY 
( NAME = N'OnLineExam_Data', FILENAME = N'C:\ASPnet\ASABIITool\DB\ASABIITool.MDF' , SIZE = 2432KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'OnLineExam_Log', FILENAME = N'C:\ASPnet\ASABIITool\DB\ASABIITool_log.LDF' , SIZE = 504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [ASABIITool] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASABIITool].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [ASABIITool] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ASABIITool] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ASABIITool] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ASABIITool] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ASABIITool] SET ARITHABORT OFF
GO
ALTER DATABASE [ASABIITool] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ASABIITool] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ASABIITool] SET AUTO_SHRINK ON
GO
ALTER DATABASE [ASABIITool] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ASABIITool] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ASABIITool] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ASABIITool] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ASABIITool] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ASABIITool] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ASABIITool] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ASABIITool] SET  DISABLE_BROKER
GO
ALTER DATABASE [ASABIITool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ASABIITool] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ASABIITool] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ASABIITool] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ASABIITool] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ASABIITool] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ASABIITool] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ASABIITool] SET  READ_WRITE
GO
ALTER DATABASE [ASABIITool] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ASABIITool] SET  MULTI_USER
GO
ALTER DATABASE [ASABIITool] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [ASABIITool] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASABIITool', N'ON'
GO
USE [ASABIITool]
GO
/****** Object:  Table [dbo].[Paper]    Script Date: 07/25/2015 23:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paper](
	[PaperID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[PaperName] [varchar](200) NOT NULL,
	[PaperState] [bit] NOT NULL,
 CONSTRAINT [PK_Paper] PRIMARY KEY CLUSTERED 
(
	[PaperID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科目编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paper', @level2type=N'COLUMN',@level2name=N'CourseID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试卷名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paper', @level2type=N'COLUMN',@level2name=N'PaperName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试卷状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paper', @level2type=N'COLUMN',@level2name=N'PaperState'
GO
/****** Object:  Table [dbo].[MultiProblem]    Script Date: 07/25/2015 23:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MultiProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [varchar](500) NOT NULL,
	[AnswerA] [varchar](500) NOT NULL,
	[AnswerB] [varchar](500) NOT NULL,
	[AnswerC] [varchar](500) NOT NULL,
	[AnswerD] [varchar](500) NOT NULL,
	[Answer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MultiProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JudgeProblem]    Script Date: 07/25/2015 23:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JudgeProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[Answer] [bit] NOT NULL,
 CONSTRAINT [PK_JudgeProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FillBlankProblem]    Script Date: 07/25/2015 23:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FillBlankProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[FrontTitle] [varchar](500) NOT NULL,
	[BackTitle] [varchar](500) NOT NULL,
	[Answer] [varchar](200) NOT NULL,
 CONSTRAINT [PK_FillBlankProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目前描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FillBlankProblem', @level2type=N'COLUMN',@level2name=N'FrontTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题目后描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FillBlankProblem', @level2type=N'COLUMN',@level2name=N'BackTitle'
GO
/****** Object:  Table [dbo].[Department]    Script Date: 07/25/2015 23:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 07/25/2015 23:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Proc_DepartmentDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_DepartmentDelete]
	(@DepartmentId 	[int])
AS DELETE [OnLineExam].[dbo].[Department] 
WHERE 
	( [DepartmentId]	 = @DepartmentId)
GO
/****** Object:  StoredProcedure [dbo].[Proc_DepartmentAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_DepartmentAdd]
	(@DepartmentId 	[int],
               @DepartmentName       [varchar](50))

AS INSERT INTO [OnLineExam].[dbo].[Department] 
	 ([DepartmentId],
              [DepartmentName]) 
 
VALUES 
	( @DepartmentId,
              @DepartmentName)
GO
/****** Object:  StoredProcedure [dbo].[Proc_CourseModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_CourseModify] 
   (@ID [int],
    @Name [varchar](200))
AS UPDATE [OnLineExam].[dbo].[Course]
   SET [Name] = @Name
   WHERE ( [ID] = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_CourseList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_CourseList]		
AS SELECT 	*
FROM 		[OnLineExam].[dbo].[Course]
GO
/****** Object:  StoredProcedure [dbo].[Proc_CourseDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_CourseDelete]
	(@ID		[int])
AS DELETE [OnLineExam].[dbo].[Course] 
WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_CourseAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_CourseAdd]
	(@Name 		[varchar](200))

AS INSERT INTO [OnLineExam].[dbo].[Course]  ([Name]) 
 
VALUES  (@Name)
GO
/****** Object:  StoredProcedure [dbo].[Proc_FillBlankProblemDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_FillBlankProblemDelete]
	(@ID		[int])
AS DELETE [OnLineExam].[dbo].[FillBlankProblem] 
WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_FillBlankProblemAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_FillBlankProblemAdd]
	(@CourseID		[int],
	 @FrontTitle 	[varchar](500),
	 @BackTitle 	[varchar](500),	 
	 @Answer		[varchar](200))

AS INSERT INTO [OnLineExam].[dbo].[FillBlankProblem] 
	 ([CourseID],
	  [FrontTitle],
	  [BackTitle],	 
	  [Answer]) 
 
VALUES 
	(@CourseID,
	 @FrontTitle,
	 @BackTitle,	 
	 @Answer)
GO
/****** Object:  StoredProcedure [dbo].[Proc_DepartmentModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_DepartmentModify]
	(@DepartmentId 	[int],
              @DepartmentName        [varchar](50))
AS UPDATE [OnLineExam].[dbo].[Department] 

SET       [DepartmentId]	      = @DepartmentId,
              [DepartmentName]  = @DepartmentName
WHERE 
	( [DepartmentId]	 = @DepartmentId)
GO
/****** Object:  StoredProcedure [dbo].[Proc_FillBlankProblemModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_FillBlankProblemModify]
	(@ID			[int],
	 @CourseID		[int],
	 @FrontTitle 	[varchar](500),
	 @BackTitle		[varchar](500),	 
	 @Answer		[varchar](200))

AS UPDATE [OnLineExam].[dbo].[FillBlankProblem] 

SET  [CourseID]		= @CourseID,
	 [FrontTitle]	= @FrontTitle,
	 [BackTitle]	= @BackTitle,	 
	 [Answer]		= @Answer 

WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_FillBlankProblemList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_FillBlankProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[FillBlankProblem].[ID], 
		[dbo].[FillBlankProblem].[FrontTitle],
		[dbo].[FillBlankProblem].[BackTitle]
FROM 		[OnLineExam].[dbo].[FillBlankProblem] 
where [CourseID]=@CourseID
GO
/****** Object:  StoredProcedure [dbo].[Proc_JudgeProblemDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_JudgeProblemDelete]
	(@ID		[int])
AS DELETE [OnLineExam].[dbo].[JudgeProblem] 
WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_JudgeProblemAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[Proc_JudgeProblemAdd]
	(@CourseID	[int],
	 @Title 	[varchar](1000),	 
	 @Answer	[bit])

AS INSERT INTO [OnLineExam].[dbo].[JudgeProblem] 
	 ([CourseID],
	  [Title],	 
	  [Answer]) 
 
VALUES 
	(@CourseID,
	 @Title,	 
	 @Answer)
GO
/****** Object:  StoredProcedure [dbo].[Proc_MultiProblemDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_MultiProblemDelete]
	(@ID		[int])
AS DELETE [OnLineExam].[dbo].[MultiProblem] 
WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_MultiProblemAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_MultiProblemAdd]
	(@CourseID	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](50))

AS INSERT INTO [OnLineExam].[dbo].[MultiProblem] 
	 ([CourseID],
	 [Title],
	 [AnswerA],
	 [AnswerB],
	 [AnswerC],
	 [AnswerD],
	 [Answer]) 
 
VALUES 
	(@CourseID,
	 @Title,
	 @AnswerA,
	 @AnswerB,
	 @AnswerC,
	 @AnswerD,
	 @Answer)
GO
/****** Object:  StoredProcedure [dbo].[Proc_JudgeProblemModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_JudgeProblemModify]
	(@ID		[int],
	 @CourseID	[int],
	 @Title 	[varchar](1000),	 
	 @Answer	[bit])

AS UPDATE [OnLineExam].[dbo].[JudgeProblem] 

SET  [CourseID]	= @CourseID,
	 [Title]	= @Title,	 
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_JudgeProblemList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_JudgeProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[JudgeProblem].[ID], 
		[dbo].[JudgeProblem].[Title]
FROM 		[OnLineExam].[dbo].[JudgeProblem] 
where [CourseID]=@CourseID
GO
/****** Object:  StoredProcedure [dbo].[Proc_PaperDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_PaperDetail]
		(@PaperID		[int],
		 @Type			[varchar](10))
AS
begin 
	declare @sql nvarchar(1000)
if @Type='单选题'
 begin	
	set @sql='select * from PaperDetail,SingleProblem
              where [Type]=''单选题'' and
              PaperDetail.TitleID=SingleProblem.ID and [PaperID]='+ Cast(@PaperID AS varchar(10)) 
	exec sp_executesql @sql		
 end
else if @Type='多选题'
 begin	
	set @sql='select * from PaperDetail,MultiProblem 
             where [Type]=''多选题'' and PaperDetail.TitleID=MultiProblem.ID and
             [PaperID]=' +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end
else if @Type='判断题'
 begin	
	set @sql='select * from PaperDetail,JudgeProblem 
             where [Type]=''判断题'' and PaperDetail.TitleID=JudgeProblem.ID and 
            [PaperID]=' +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end
else if @Type='问答题'
 begin	
	set @sql='select * from PaperDetail,QuestionProblem 
             where [Type]=''问答题'' and PaperDetail.TitleID=QuestionProblem.ID and
             [PaperID]=' +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end
else
 begin	
	set @sql='select * from PaperDetail,FillBlankProblem
              where [Type]=''填空题'' and PaperDetail.TitleID=FillBlankProblem.ID and [PaperID]=' + +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end
end
GO
/****** Object:  StoredProcedure [dbo].[Proc_PaperDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_PaperDelete]
	(@ID		[int])
AS DELETE [OnLineExam].[dbo].[Paper] 
WHERE 
	( [PaperID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_MultiProblemModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_MultiProblemModify]
	(@ID		[int],
	 @CourseID	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](50))

AS UPDATE [OnLineExam].[dbo].[MultiProblem] 

SET  [CourseID]	= @CourseID,
	 [Title]	= @Title,
	 [AnswerA]	= @AnswerA,
	 [AnswerB]	= @AnswerB,
	 [AnswerC]	= @AnswerC,
	 [AnswerD]	= @AnswerD,
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_MultiProblemList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_MultiProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[MultiProblem].[ID], 
		[dbo].[MultiProblem].[Title]
FROM 		[OnLineExam].[dbo].[MultiProblem] 
where [CourseID]=@CourseID
GO
/****** Object:  StoredProcedure [dbo].[Proc_PaperModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_PaperModify]
	(@PaperID		[int],
	 @PaperState 	[bit])

AS UPDATE [OnLineExam].[dbo].[Paper] 

SET  [PaperState]		= @PaperState

WHERE 
	( [PaperID]	 = @PaperID)
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [varchar](64) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在部门编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'DepartmentId'
GO
/****** Object:  Table [dbo].[UserAnswer]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAnswer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[PaperID] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[TitleID] [int] NOT NULL,
	[Mark] [int] NOT NULL,
	[UserAnswer] [varchar](1000) NOT NULL,
	[ExamTime] [datetime] NOT NULL,
	[state] [varchar](50) NULL,
 CONSTRAINT [PK_UserAnswer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TreeMenu]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TreeMenu](
	[NodeId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[Text] [varchar](50) NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[Duty] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TreeMenu] PRIMARY KEY CLUSTERED 
(
	[NodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SingleProblem]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SingleProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[AnswerA] [varchar](500) NOT NULL,
	[AnswerB] [varchar](500) NOT NULL,
	[AnswerC] [varchar](500) NOT NULL,
	[AnswerD] [varchar](500) NOT NULL,
	[Answer] [varchar](2) NOT NULL,
 CONSTRAINT [PK_SingleProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科目编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SingleProblem', @level2type=N'COLUMN',@level2name=N'CourseID'
GO
/****** Object:  StoredProcedure [dbo].[Proc_ScoreDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_ScoreDelete]
	(@ID		[int])
AS DELETE [OnLineExam].[dbo].[Score] 
WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_ScoreCourseState]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_ScoreCourseState] 
	(@UserID varchar(20),
             @PaperID varchar(20))          
AS
	SELECT courseState
          FROM [OnLineExam].[dbo].[Score]
WHERE UserID=@UserID and PaperID=@PaperID
GO
/****** Object:  StoredProcedure [dbo].[Proc_ScoreAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_ScoreAdd]
	(@UserID	 	[varchar](20), 
	 @PaperID 		[int],
	 @Score 		[int],
              @ExamTime                    [DateTime],
               @JudgeTime                  [DateTime],
                @PingYu                       [varchar](1000))

AS INSERT INTO [OnLineExam].[dbo].[Score] 
	 ([UserID], 
	 [PaperID],
	 [Score],
               [ExamTime],
               [JudgeTime],
               [PingYu]) 
 
VALUES 
	( @UserID,	 
	 @PaperID,
	 @Score,
              @ExamTime,
              @JudgeTime,
               @PingYu)
GO
/****** Object:  Table [dbo].[Score]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Score](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[PaperID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[ExamTime] [datetime] NULL,
	[JudgeTime] [datetime] NULL,
	[PingYu] [varchar](1000) NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Score', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Score', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试卷编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Score', @level2type=N'COLUMN',@level2name=N'PaperID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Score', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Score', @level2type=N'COLUMN',@level2name=N'ExamTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评卷时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Score', @level2type=N'COLUMN',@level2name=N'JudgeTime'
GO
/****** Object:  StoredProcedure [dbo].[Proc_RoleModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_RoleModify] 
   (@RoleId  [int],
    @RoleName [varchar](200))
AS UPDATE [OnLineExam].[dbo].[Role]
   SET [RoleName] = @RoleName
   WHERE ( [RoleId] = @RoleId)
GO
/****** Object:  StoredProcedure [dbo].[Proc_RoleDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_RoleDelete]
	(@RoleId	[int])
AS DELETE [OnLineExam].[dbo].[Role] 
WHERE 
	( [RoleId]	 = @RoleId)
GO
/****** Object:  StoredProcedure [dbo].[Proc_RoleAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_RoleAdd]
	(
               @RoleName       [varchar](50),
              @HasDuty_DepartmentManage     [int],
              @HasDuty_UserManage    [int],
              @HasDuty_RoleManage    [int],    
             @HasDuty_Role                  [int],              
               @HasDuty_UserScore     [int],
              @HasDuty_CourseManage      [int],           
          @HasDuty_PaperLists     [int],
          @HasDuty_PaperSetup   [int],
            @HasDuty_UserPaperList   [int],
           @HasDuty_SingleSelectManage    [int],
           @HasDuty_MultiSelectManage     [int],
            @HasDuty_FillBlankManage    [int],
           @HasDuty_JudgeManage     [int],
            @HasDuty_QuestionManage     [int])

AS INSERT INTO [OnLineExam].[dbo].[Role] 
	(
               RoleName ,
             HasDuty_DepartmentManage ,
              HasDuty_UserManage  ,
              HasDuty_RoleManage  ,     
             HasDuty_Role  ,            
               HasDuty_UserScore  ,
              HasDuty_CourseManage ,         
           HasDuty_PaperLists ,
          HasDuty_PaperSetup,
           HasDuty_UserPaperList,
           HasDuty_SingleSelectManage ,
           HasDuty_MultiSelectManage  ,
            HasDuty_FillBlankManage ,
           HasDuty_JudgeManage ,
            HasDuty_QuestionManage)

VALUES 
	(
               @RoleName,
              @HasDuty_DepartmentManage,
              @HasDuty_UserManage,
              @HasDuty_RoleManage ,     
              @HasDuty_Role,         
               @HasDuty_UserScore,
              @HasDuty_CourseManage,         
          @HasDuty_PaperLists,
           @HasDuty_PaperSetup,
             @HasDuty_UserPaperList,
           @HasDuty_SingleSelectManage,
           @HasDuty_MultiSelectManage ,
            @HasDuty_FillBlankManage,
           @HasDuty_JudgeManage,
            @HasDuty_QuestionManage)
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[HasDuty_DepartmentManage] [int] NOT NULL,
	[HasDuty_UserManage] [int] NOT NULL,
	[HasDuty_RoleManage] [int] NOT NULL,
	[HasDuty_Role] [int] NOT NULL,
	[HasDuty_CourseManage] [int] NOT NULL,
	[HasDuty_PaperSetup] [int] NOT NULL,
	[HasDuty_PaperLists] [int] NOT NULL,
	[HasDuty_UserPaperList] [int] NOT NULL,
	[HasDuty_UserScore] [int] NOT NULL,
	[HasDuty_SingleSelectManage] [int] NOT NULL,
	[HasDuty_MultiSelectManage] [int] NOT NULL,
	[HasDuty_FillBlankManage] [int] NOT NULL,
	[HasDuty_JudgeManage] [int] NOT NULL,
	[HasDuty_QuestionManage] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Proc_QuestionProblemModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_QuestionProblemModify]
	(@ID		[int],
	 @CourseID	[int],
	 @Title 	[varchar](1000),	 
	 @Answer	[varchar](1000))

AS UPDATE [OnLineExam].[dbo].[QuestionProblem] 

SET  [CourseID]	= @CourseID,
	 [Title]	= @Title,	 
	 [Answer] = @Answer 

WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_QuestionProblemList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_QuestionProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[QuestionProblem].[ID], 
		[dbo].[QuestionProblem].[Title]
FROM 		[OnLineExam].[dbo].[QuestionProblem] 
where [CourseID]=@CourseID
GO
/****** Object:  StoredProcedure [dbo].[Proc_QuestionProblemDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_QuestionProblemDelete]
	(@ID		[int])
AS DELETE [OnLineExam].[dbo].[QuestionProblem] 
WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_QuestionProblemAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
Create PROCEDURE [dbo].[Proc_QuestionProblemAdd]
	(@CourseID	[int],
	 @Title 	[varchar](1000),	 
	 @Answer [varchar](1000))

AS INSERT INTO [OnLineExam].[dbo].[QuestionProblem] 
	 ([CourseID],
	  [Title],	 
	  [Answer]) 
 
VALUES 
	(@CourseID,
	 @Title,	 
	 @Answer)
GO
/****** Object:  Table [dbo].[QuestionProblem]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[Answer] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_QuestionProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Proc_SingleProblemDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_SingleProblemDelete]
	(@ID		[int])
AS DELETE [OnLineExam].[dbo].[SingleProblem] 
WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_SingleProblemAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_SingleProblemAdd]
	(@CourseID	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](2))

AS INSERT INTO [OnLineExam].[dbo].[SingleProblem] 
	 ([CourseID],
	 [Title],
	 [AnswerA],
	 [AnswerB],
	 [AnswerC],
	 [AnswerD],
	 [Answer]) 
 
VALUES 
	(@CourseID,
	 @Title,
	 @AnswerA,
	 @AnswerB,
	 @AnswerC,
	 @AnswerD,
	 @Answer)
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserPaperDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_UserPaperDelete]
	(@UserID		[varchar](50),
              @PaperID                      [int])
AS DELETE [OnLineExam].[dbo].[UserAnswer] 
WHERE 
	( UserID		 = @UserID and PaperID=@PaperID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserAnswerStateModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_UserAnswerStateModify]
	(@UserID           [varchar](50),
	 @PaperID	[int],	
	 @state              [varchar](50))

AS UPDATE [OnLineExam].[dbo].[UserAnswer] 

SET       [state]	= @state
	
WHERE 
	 [UserID]  = @UserID and [PaperID]= @PaperID
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserAnswer]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_UserAnswer]		
                           (@PaperID		int,         
		 @Type			varchar(10),
                           @UserID	 	varchar(50))
AS
begin 
	declare @sql nvarchar(1000)
if @Type='单选题' 
 begin	
	set @sql='select * from UserAnswer,SingleProblem
              where [Type]=''单选题'' and  
              UserAnswer.TitleID=SingleProblem.ID and  [PaperID]=  '  +Cast(@PaperID AS varchar(10)) + '    and 
                         [UserID]=  ''' +  @UserID +''''
	exec sp_executesql @sql	
	
 end
else if @Type='多选题'  
 begin	
	set @sql='select  * from UserAnswer,MultiProblem
             where  [Type]=''多选题'' and 
             UserAnswer.TitleID=MultiProblem.ID and  [PaperID]=  '  +Cast(@PaperID AS varchar(10)) + '    and 
                         [UserID]=  ''' +  @UserID +''''
	exec sp_executesql @sql	
 end
else if @Type='判断题' 
 begin	
	set @sql='select  * from UserAnswer,JudgeProblem
             where  [Type]=''判断题'' and
            UserAnswer.TitleID=JudgeProblem.ID and   [PaperID]=  '  +Cast(@PaperID AS varchar(10)) + '    and 
                         [UserID]=  ''' +  @UserID +''''
	exec sp_executesql @sql	
 end
else  if @Type='填空题'  
 begin	
	set @sql='select  * from UserAnswer,FillBlankProblem
              where  [Type]=''填空题'' and 
              UserAnswer.TitleID=FillBlankProblem.ID and   [PaperID]=  '  +Cast(@PaperID AS varchar(10)) + '    and 
                         [UserID]= ''' +  @UserID +''''
	exec sp_executesql @sql	
 end
else if @Type='问答题' 
 begin	
	set @sql='select  * from UserAnswer,QuestionProblem
             where  [Type]=''问答题'' and 
             UserAnswer.TitleID=QuestionProblem.ID and   [PaperID]=  '  +Cast(@PaperID AS varchar(10)) + '    and 
                      [UserID]=  ''' +  @UserID +''''
	exec sp_executesql @sql	
 end
                 
end
GO
/****** Object:  StoredProcedure [dbo].[Proc_SingleProblemModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_SingleProblemModify]
	(@ID		[int],
	 @CourseID	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](2))

AS UPDATE [OnLineExam].[dbo].[SingleProblem] 

SET  [CourseID]	= @CourseID,
	 [Title]	= @Title,
	 [AnswerA]	= @AnswerA,
	 [AnswerB]	= @AnswerB,
	 [AnswerC]	= @AnswerC,
	 [AnswerD]	= @AnswerD,
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_SingleProblemList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_SingleProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[SingleProblem].[ID], 
		[dbo].[SingleProblem].[Title]
FROM 		[OnLineExam].[dbo].[SingleProblem] 
where [CourseID]=@CourseID
GO
/****** Object:  StoredProcedure [dbo].[Proc_SingleProblemDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_SingleProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[SingleProblem]
where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[Proc_ScoreList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_ScoreList]
AS SELECT 	[dbo].[Users].[UserID],		 
		[dbo].[Users].[UserName],
		[dbo].[Score].[ID],
		[dbo].[Score].[Score],
		[dbo].[Score].[ExamTime],
                           [dbo].[Score].[JudgeTime],
                          [dbo].[Paper].[PaperID],
		[dbo].[Paper].[PaperName]
FROM 		[dbo].[Users],[dbo].[Score],[dbo].[Paper]
where Users.UserID=Score.UserID and Score.PaperID=Paper.PaperID
GO
/****** Object:  StoredProcedure [dbo].[Proc_ScoreDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_ScoreDetail]
	(@UserID   [varchar](20),
              @PaperID  [int])
AS SELECT 	*		
FROM 		[dbo].[Score]
WHERE UserID =@UserID and PaperID= @PaperID
GO
/****** Object:  StoredProcedure [dbo].[Proc_UsersModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_UsersModify]
	(@UserID	 	[varchar](20),	 
	 @UserName 		[varchar](20),
	 @DepartmentId 	[int],
              @RoleId                         [int])        
AS UPDATE [ASABIITool].[dbo].[Users] 

SET     	 [UserName]	= @UserName,
              [DepartmentId]	= @DepartmentId,
              [RoleId] 	= @RoleId
         
WHERE 
	( [UserID]	 = @UserID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_UsersList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_UsersList]
AS SELECT 	[dbo].[Users].[UserID],		 
		[dbo].[Users].[UserName],	                            
                           [dbo].[Department].[DepartmentName],
                          [dbo].[Role].[RoleName]
FROM 		[dbo].[Users],[dbo].[Department],[dbo].[Role]
WHERE     [dbo].[Users].[DepartmentId]=[dbo].[Department].[DepartmentId]
                AND [dbo].[Users].[RoleId]=[dbo].[Role].[RoleId]
GO
/****** Object:  StoredProcedure [dbo].[Proc_UsersDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_UsersDetail]
	@UserID	[varchar](50)
AS SELECT 	*		
FROM 		[dbo].[Users],[dbo].[Department],[dbo].[Role]
WHERE UserID=@UserID AND [dbo].[Users].DepartmentId = [dbo].[Department].DepartmentId And 
             [dbo].[Users].RoleId = [dbo].[Role].RoleId
GO
/****** Object:  StoredProcedure [dbo].[Proc_UsersDelete]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_UsersDelete]
	(@UserID		[varchar](20))
AS DELETE [ASABIITool].[dbo].[Users] 
WHERE 
	( [UserID]	 = @UserID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserScorePaper]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_UserScorePaper]
@UserID  [varchar](20)
AS SELECT distinct	[dbo].[Users].[UserID],		 
		[dbo].[Users].[UserName],
                          [dbo].[Users].[DepartmentId],
                          [dbo].[Department].[DepartmentId],
                           [dbo].[Department].[DepartmentName],
		[dbo].[UserAnswer].[UserID],
		[dbo].[UserAnswer].[PaperID],
		[dbo].[UserAnswer].[ExamTime],
                           [dbo].[UserAnswer].[state],
		[dbo].[Paper].[PaperName]                      
FROM 		[dbo].[Users],[dbo].[Department],[dbo].[UserAnswer],[dbo].[Paper]
where Users.DepartmentId=Department.DepartmentId and Users.UserID=UserAnswer.UserID and UserAnswer.PaperID=Paper.PaperID 
and Users.UserID = @UserID
order by UserAnswer.ExamTime desc
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserScore]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_UserScore]	
              @UserID  [varchar](20)
AS SELECT 	[dbo].[Users].[UserID],		 
		[dbo].[Users].[UserName],
		[dbo].[Score].[ID],
		[dbo].[Score].[Score],
		[dbo].[Score].[ExamTime],
                           [dbo].[Score].[JudgeTime],
                           [dbo].[Score].[PingYu],
                           [dbo].[Paper].[PaperID],
		[dbo].[Paper].[PaperName]	
FROM 		[dbo].[Users],[dbo].[Score],[dbo].[Paper]
WHERE Users.UserID=Score.UserID and Score.PaperID=Paper.PaperID and Users.UserID=@UserID order by Score.ExamTime
GO
/****** Object:  StoredProcedure [dbo].[Proc_UsersAdd]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_UsersAdd]
	(@UserID	 	[varchar](20), 
	 @UserName 		[varchar](20),
	 @UserPwd 		[varchar](64),
	 @DepartmentId 	[int],
               @RoleId                         [int])

AS INSERT INTO [ASABIITool].[dbo].[Users] 
	 ([UserID], 
	 [UserName],
	 [UserPwd],
	 [DepartmentId],
              [RoleId]) 
 
VALUES 
	( @UserID,	 
	 @UserName,
	 @UserPwd,
	 @DepartmentId,
              @RoleId)
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserPwdModify]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_UserPwdModify]
        (@UserID [varchar](20),
         @UserPwd [varchar](64))
AS UPDATE [ASABIITool].[dbo].[Users]
SET [UserPwd] = @UserPwd
WHERE ([UserID] = @UserID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_UserPaperList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_UserPaperList]
AS SELECT distinct	[dbo].[Users].[UserID],		 
		[dbo].[Users].[UserName],
                          [dbo].[Users].[DepartmentId],
                          [dbo].[Department].[DepartmentId],
                           [dbo].[Department].[DepartmentName],
		[dbo].[UserAnswer].[UserID],
		[dbo].[UserAnswer].[PaperID],
		[dbo].[UserAnswer].[ExamTime],
                           [dbo].[UserAnswer].[state],
		[dbo].[Paper].[PaperName]                      
FROM 		[dbo].[Users],[dbo].[Department],[dbo].[UserAnswer],[dbo].[Paper]
where Users.DepartmentId=Department.DepartmentId and Users.UserID=UserAnswer.UserID and UserAnswer.PaperID=Paper.PaperID order by UserAnswer.ExamTime desc
GO
/****** Object:  StoredProcedure [dbo].[Proc_RoleList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_RoleList]
 AS SELECT [dbo].[Role].[RoleId],[dbo].[Role].[RoleName]
FROM [dbo].[Role]
GO
/****** Object:  StoredProcedure [dbo].[Proc_RoleDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_RoleDetail]	
              @RoleName [varchar](20)
AS SELECT 	*		
FROM 		[dbo].[Role]
WHERE RoleName =@RoleName
GO
/****** Object:  StoredProcedure [dbo].[Proc_QuestionProblemDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_QuestionProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[QuestionProblem]
where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[Proc_PaperUseList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Proc_PaperUseList]
	(@paperState	[bit])
AS SELECT 	[dbo].[Paper].[PaperID],		 
		[dbo].[Paper].[PaperName]		
FROM 		[dbo].[Paper]
where PaperState=@paperState
GO
/****** Object:  StoredProcedure [dbo].[Proc_PaperList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_PaperList]	
AS SELECT 	*,CASE  [dbo].[Paper].PaperState WHEN 1 THEN '可用'  ELSE  '不可用'  END AS state
FROM 		[dbo].[Paper],[dbo].[Course]
where [Paper].CourseID=[Course].ID
GO
/****** Object:  StoredProcedure [dbo].[Proc_MultiProblemDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_MultiProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[MultiProblem]
where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[Proc_JudgeProblemDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_JudgeProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[JudgeProblem]
where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[Proc_IsTest]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_IsTest]
	(@UserID	[varchar](20),
             @PaperID         [int])
AS SELECT 	*		
FROM 		[dbo].[UserAnswer]
WHERE UserID=@UserID AND PaperID=@PaperID
GO
/****** Object:  StoredProcedure [dbo].[Proc_FillBlankProblemDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[Proc_FillBlankProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[FillBlankProblem]
where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DepartmentList]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_DepartmentList]
 AS SELECT [dbo].[Department].[DepartmentId],[dbo].[Department].[DepartmentName]
FROM [dbo].[Department]
GO
/****** Object:  StoredProcedure [dbo].[Proc_DepartmentDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Proc_DepartmentDetail]
	@DepartmentId	[int]
AS SELECT 	*		
FROM 		[dbo].[Department]
WHERE DepartmentId =@DepartmentId
GO
/****** Object:  Table [dbo].[PaperDetail]    Script Date: 07/25/2015 23:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaperDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaperID] [int] NOT NULL,
	[Type] [varchar](10) NULL,
	[TitleID] [int] NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_PaperDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaperDetail', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试卷编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaperDetail', @level2type=N'COLUMN',@level2name=N'PaperID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaperDetail', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaperDetail', @level2type=N'COLUMN',@level2name=N'TitleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaperDetail', @level2type=N'COLUMN',@level2name=N'Mark'
GO
/****** Object:  Default [DF_UserAnswer_state]    Script Date: 07/25/2015 23:06:51 ******/
ALTER TABLE [dbo].[UserAnswer] ADD  CONSTRAINT [DF_UserAnswer_state]  DEFAULT ('未评阅') FOR [state]
GO
/****** Object:  ForeignKey [FK_PaperDetail_Paper]    Script Date: 07/25/2015 23:06:51 ******/
ALTER TABLE [dbo].[PaperDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PaperDetail_Paper] FOREIGN KEY([PaperID])
REFERENCES [dbo].[Paper] ([PaperID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PaperDetail] CHECK CONSTRAINT [FK_PaperDetail_Paper]
GO
