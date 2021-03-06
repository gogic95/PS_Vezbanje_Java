USE [master]
GO
/****** Object:  Database [ProSoft-Septembar2019]    Script Date: 8/23/2019 3:54:20 PM ******/
USE master
IF EXISTS(select * from sys.databases where name='ProSoft-Septembar2019')
DROP DATABASE [ProSoft-Septembar2019];
GO
CREATE DATABASE [ProSoft-Septembar2019];
GO
ALTER AUTHORIZATION ON DATABASE::[ProSoft-Septembar2019] TO sa
GO
USE [ProSoft-Septembar2019]
GO
ALTER DATABASE [ProSoft-Septembar2019] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProSoft-Septembar2019].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProSoft-Septembar2019] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET ANSI_NULLS ON 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET ANSI_PADDING ON 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET ARITHABORT ON 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET RECOVERY FULL 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Septembar2019] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Septembar2019] SET QUERY_STORE = OFF
GO
USE [ProSoft-Septembar2019]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Septembar2019]
GO
/****** Object:  Table [dbo].[Podnesak]    Script Date: 8/23/2019 3:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Podnesak](
	[PredmetID] [int] NOT NULL,
	[RB] [int] NOT NULL,
	[DatumPrijema] [datetime] NULL,
	[Opis] [nvarchar](255) NULL,
	[VrstaPodneska] [nvarchar](255) NULL,
 CONSTRAINT [Podnesak$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PredmetID] ASC,
	[RB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Predmet]    Script Date: 8/23/2019 3:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predmet](
	[PredmetID] [int] IDENTITY(1,1) NOT NULL,
	[BrojPredmeta] [nvarchar](255) NULL,
	[DatumPrijema] [datetime] NULL,
	[Tuzilac] [nvarchar](255) NULL,
	[Tuzeni] [nvarchar](255) NULL,
	[PlacenaSudskaTaksa] [bit] NULL,
	[TipSporaID] [int] NULL,
	[SudID] [int] NULL,
	[Status] [nvarchar](255) NULL,
 CONSTRAINT [Predmet$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sud]    Script Date: 8/23/2019 3:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sud](
	[SudID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
	[Adresa] [nvarchar](255) NULL,
 CONSTRAINT [Sud$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[SudID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipSpora]    Script Date: 8/23/2019 3:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipSpora](
	[TipSporaID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
 CONSTRAINT [TipSpora$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[TipSporaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Sud] ([SudID], [Naziv], [Adresa]) VALUES (1, N'Vrhovni kasacioni sud', N'Adresa1')
INSERT [dbo].[Sud] ([SudID], [Naziv], [Adresa]) VALUES (2, N'Apelacioni sud', N'Adresa2')
INSERT [dbo].[Sud] ([SudID], [Naziv], [Adresa]) VALUES (3, N'Osnovni sud', N'Adresa3')
INSERT [dbo].[Sud] ([SudID], [Naziv], [Adresa]) VALUES (4, N'Upravni sud', N'Adresa4')
INSERT [dbo].[Sud] ([SudID], [Naziv], [Adresa]) VALUES (5, N'Privredni sud', N'Adresa5')
INSERT [dbo].[Sud] ([SudID], [Naziv], [Adresa]) VALUES (6, N'Prekrsajni sud', N'Adresa6')
INSERT [dbo].[Sud] ([SudID], [Naziv], [Adresa]) VALUES (7, N'Prekrsajno-apelacioni sud', N'Adresa7')
INSERT [dbo].[TipSpora] ([TipSporaID], [Naziv]) VALUES (1, N'Porez')
INSERT [dbo].[TipSpora] ([TipSporaID], [Naziv]) VALUES (2, N'Cutanje uprave')
INSERT [dbo].[TipSpora] ([TipSporaID], [Naziv]) VALUES (3, N'Ostvarivanje prava iz osiguranja')
INSERT [dbo].[TipSpora] ([TipSporaID], [Naziv]) VALUES (4, N'Takse')
INSERT [dbo].[TipSpora] ([TipSporaID], [Naziv]) VALUES (5, N'Vracanje imovine')
INSERT [dbo].[TipSpora] ([TipSporaID], [Naziv]) VALUES (6, N'Osiguranje')
INSERT [dbo].[TipSpora] ([TipSporaID], [Naziv]) VALUES (7, N'Privredni prestup')
INSERT [dbo].[TipSpora] ([TipSporaID], [Naziv]) VALUES (8, N'Obrazovanje')
/****** Object:  Index [Podnesak$PredmetID]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Podnesak$PredmetID] ON [dbo].[Podnesak]
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Podnesak$PredmetPodnesak]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Podnesak$PredmetPodnesak] ON [dbo].[Podnesak]
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Podnesak$VrstaPodneskaID]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Podnesak$VrstaPodneskaID] ON [dbo].[Podnesak]
(
	[VrstaPodneska] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Predmet$PredmetID]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Predmet$PredmetID] ON [dbo].[Predmet]
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Predmet$SudID]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Predmet$SudID] ON [dbo].[Predmet]
(
	[SudID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Predmet$SudPredmet]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Predmet$SudPredmet] ON [dbo].[Predmet]
(
	[SudID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Predmet$TipSporaID]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Predmet$TipSporaID] ON [dbo].[Predmet]
(
	[TipSporaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Predmet$TipSporaPredmet]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Predmet$TipSporaPredmet] ON [dbo].[Predmet]
(
	[TipSporaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Sud$SudID]    Script Date: 8/23/2019 3:54:20 PM ******/
CREATE NONCLUSTERED INDEX [Sud$SudID] ON [dbo].[Sud]
(
	[SudID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Podnesak] ADD  CONSTRAINT [DF__Podnesak__Predme__2C3393D0]  DEFAULT ((0)) FOR [PredmetID]
GO
ALTER TABLE [dbo].[Podnesak] ADD  CONSTRAINT [DF__Podnesak__RB__2D27B809]  DEFAULT ((0)) FOR [RB]
GO
ALTER TABLE [dbo].[Predmet] ADD  CONSTRAINT [DF__Predmet__Placena__2E1BDC42]  DEFAULT ((0)) FOR [PlacenaSudskaTaksa]
GO
ALTER TABLE [dbo].[Predmet] ADD  CONSTRAINT [DF__Predmet__TipSpor__2F10007B]  DEFAULT ((0)) FOR [TipSporaID]
GO
ALTER TABLE [dbo].[Predmet] ADD  CONSTRAINT [DF__Predmet__SudID__300424B4]  DEFAULT ((0)) FOR [SudID]
GO
ALTER TABLE [dbo].[Sud] ADD  DEFAULT ((0)) FOR [SudID]
GO
ALTER TABLE [dbo].[TipSpora] ADD  DEFAULT ((0)) FOR [TipSporaID]
GO
ALTER TABLE [dbo].[Podnesak]  WITH CHECK ADD  CONSTRAINT [Podnesak$PredmetPodnesak] FOREIGN KEY([PredmetID])
REFERENCES [dbo].[Predmet] ([PredmetID])
GO
ALTER TABLE [dbo].[Podnesak] CHECK CONSTRAINT [Podnesak$PredmetPodnesak]
GO
ALTER TABLE [dbo].[Predmet]  WITH CHECK ADD  CONSTRAINT [Predmet$SudPredmet] FOREIGN KEY([SudID])
REFERENCES [dbo].[Sud] ([SudID])
GO
ALTER TABLE [dbo].[Predmet] CHECK CONSTRAINT [Predmet$SudPredmet]
GO
ALTER TABLE [dbo].[Predmet]  WITH CHECK ADD  CONSTRAINT [Predmet$TipSporaPredmet] FOREIGN KEY([TipSporaID])
REFERENCES [dbo].[TipSpora] ([TipSporaID])
GO
ALTER TABLE [dbo].[Predmet] CHECK CONSTRAINT [Predmet$TipSporaPredmet]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[PredmetID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'COLUMN',@level2name=N'PredmetID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[RB]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'COLUMN',@level2name=N'RB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[DatumPrijema]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'COLUMN',@level2name=N'DatumPrijema'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[Opis]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'COLUMN',@level2name=N'Opis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[VrstaPodneska]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'COLUMN',@level2name=N'VrstaPodneska'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'CONSTRAINT',@level2name=N'Podnesak$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[PredmetID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'INDEX',@level2name=N'Podnesak$PredmetID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[PredmetPodnesak]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'INDEX',@level2name=N'Podnesak$PredmetPodnesak'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[VrstaPodneskaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'INDEX',@level2name=N'Podnesak$VrstaPodneskaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Podnesak].[PredmetPodnesak]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Podnesak', @level2type=N'CONSTRAINT',@level2name=N'Podnesak$PredmetPodnesak'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[PredmetID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'PredmetID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[BrojPredmeta]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'BrojPredmeta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[DatumPrijema]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'DatumPrijema'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[Tuzilac]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'Tuzilac'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[Tuzeni]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'Tuzeni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[PlacenaSudskaTaksa]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'PlacenaSudskaTaksa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[TipSporaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'TipSporaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[SudID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'SudID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'CONSTRAINT',@level2name=N'Predmet$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[PredmetID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'INDEX',@level2name=N'Predmet$PredmetID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[SudID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'INDEX',@level2name=N'Predmet$SudID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[SudPredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'INDEX',@level2name=N'Predmet$SudPredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[TipSporaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'INDEX',@level2name=N'Predmet$TipSporaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[TipSporaPredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'INDEX',@level2name=N'Predmet$TipSporaPredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[SudPredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'CONSTRAINT',@level2name=N'Predmet$SudPredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Predmet].[TipSporaPredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'CONSTRAINT',@level2name=N'Predmet$TipSporaPredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Sud].[SudID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sud', @level2type=N'COLUMN',@level2name=N'SudID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Sud].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sud', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Sud].[Adresa]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sud', @level2type=N'COLUMN',@level2name=N'Adresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Sud].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sud', @level2type=N'CONSTRAINT',@level2name=N'Sud$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Sud].[SudID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sud', @level2type=N'INDEX',@level2name=N'Sud$SudID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[Sud]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[TipSpora].[TipSporaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipSpora', @level2type=N'COLUMN',@level2name=N'TipSporaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[TipSpora].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipSpora', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[TipSpora].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipSpora', @level2type=N'CONSTRAINT',@level2name=N'TipSpora$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2019.[TipSpora]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipSpora'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Septembar2019] SET  READ_WRITE 
GO
