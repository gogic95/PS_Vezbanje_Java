USE [master]
GO
/****** Object:  Database [ProSoft-Jul2020]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE DATABASE [ProSoft-Jul2020]
GO
ALTER DATABASE [ProSoft-Jul2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Jul2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProSoft-Jul2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Jul2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Jul2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProSoft-Jul2020] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Jul2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Jul2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Jul2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Jul2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Jul2020] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Jul2020] SET QUERY_STORE = OFF
GO
USE [ProSoft-Jul2020]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Jul2020]
GO
/****** Object:  Table [dbo].[Meteorolog]    Script Date: 05-Jul-20 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meteorolog](
	[MeteorologID] [int] NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
	[KorisnickoIme] [nvarchar](255) NULL,
	[Lozinka] [nvarchar](255) NULL,
 CONSTRAINT [Meteorolog$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[MeteorologID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prognoza]    Script Date: 05-Jul-20 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prognoza](
	[PrognozaID] [int] NOT NULL,
	[Dan] [datetime] NULL,
	[Opis] [nvarchar](255) NULL,
	[MeteorologID] [int] NULL,
 CONSTRAINT [Prognoza$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PrognozaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrognozaRegion]    Script Date: 05-Jul-20 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrognozaRegion](
	[PrognozaID] [int] NOT NULL,
	[RB] [int] NOT NULL,
	[Temperatura] [float] NULL,
	[MeteoAlarm] [nvarchar](255) NULL,
	[Pojava] [nvarchar](255) NULL,
	[RegionID] [int] NULL,
 CONSTRAINT [PrognozaRegion$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PrognozaID] ASC,
	[RB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 05-Jul-20 19:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
	[Opis] [nvarchar](255) NULL,
 CONSTRAINT [Region$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Meteorolog] ([MeteorologID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (1, N'Ivana', N'Ivanovic', N'ivana', N'ivana123')
INSERT [dbo].[Meteorolog] ([MeteorologID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (2, N'Dragan', N'Draganic', N'dragan', N'dragan123')
INSERT [dbo].[Meteorolog] ([MeteorologID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (3, N'Jovana', N'Jovanic', N'jovana', N'jovana123')
INSERT [dbo].[Meteorolog] ([MeteorologID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (4, N'Petar', N'Petrovic', N'petar', N'petar123')
INSERT [dbo].[Region] ([RegionID], [Naziv], [Opis]) VALUES (1, N'Severna Srbija', N'Obuhvata Backu, Banat i Srem')
INSERT [dbo].[Region] ([RegionID], [Naziv], [Opis]) VALUES (2, N'Beograd', N'Region koji obuhvata grad Beograd i centralnu Srbiju')
INSERT [dbo].[Region] ([RegionID], [Naziv], [Opis]) VALUES (3, N'Istocna Srbija', N'Obuhvata Istocnu Srbiju')
INSERT [dbo].[Region] ([RegionID], [Naziv], [Opis]) VALUES (4, N'Zapadna Srbija', N'Obuhvata Zapadnu Srbiju')
INSERT [dbo].[Region] ([RegionID], [Naziv], [Opis]) VALUES (5, N'Juzna Srbija', N'Obuhvata Juznu Srbiju')
/****** Object:  Index [Meteorolog$KorisnikID]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [Meteorolog$KorisnikID] ON [dbo].[Meteorolog]
(
	[MeteorologID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Prognoza$MeteorologID]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [Prognoza$MeteorologID] ON [dbo].[Prognoza]
(
	[MeteorologID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Prognoza$MeteorologPrognoza]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [Prognoza$MeteorologPrognoza] ON [dbo].[Prognoza]
(
	[MeteorologID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Prognoza$PrognozaID]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [Prognoza$PrognozaID] ON [dbo].[Prognoza]
(
	[PrognozaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PrognozaRegion$PrognozaID]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [PrognozaRegion$PrognozaID] ON [dbo].[PrognozaRegion]
(
	[PrognozaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PrognozaRegion$PrognozaPrognozaRegion]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [PrognozaRegion$PrognozaPrognozaRegion] ON [dbo].[PrognozaRegion]
(
	[PrognozaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PrognozaRegion$RegionID]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [PrognozaRegion$RegionID] ON [dbo].[PrognozaRegion]
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PrognozaRegion$RegionPrognozaRegion]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [PrognozaRegion$RegionPrognozaRegion] ON [dbo].[PrognozaRegion]
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Region$RegionID]    Script Date: 05-Jul-20 19:01:38 ******/
CREATE NONCLUSTERED INDEX [Region$RegionID] ON [dbo].[Region]
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Meteorolog] ADD  DEFAULT ((0)) FOR [MeteorologID]
GO
ALTER TABLE [dbo].[Prognoza] ADD  CONSTRAINT [DF__Prognoza__Progno__2A4B4B5E]  DEFAULT ((0)) FOR [PrognozaID]
GO
ALTER TABLE [dbo].[Prognoza] ADD  CONSTRAINT [DF__Prognoza__Meteor__2B3F6F97]  DEFAULT ((0)) FOR [MeteorologID]
GO
ALTER TABLE [dbo].[PrognozaRegion] ADD  DEFAULT ((0)) FOR [PrognozaID]
GO
ALTER TABLE [dbo].[PrognozaRegion] ADD  DEFAULT ((0)) FOR [RB]
GO
ALTER TABLE [dbo].[PrognozaRegion] ADD  DEFAULT ((0)) FOR [Temperatura]
GO
ALTER TABLE [dbo].[PrognozaRegion] ADD  DEFAULT ((0)) FOR [RegionID]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT ((0)) FOR [RegionID]
GO
ALTER TABLE [dbo].[Prognoza]  WITH CHECK ADD  CONSTRAINT [Prognoza$MeteorologPrognoza] FOREIGN KEY([MeteorologID])
REFERENCES [dbo].[Meteorolog] ([MeteorologID])
GO
ALTER TABLE [dbo].[Prognoza] CHECK CONSTRAINT [Prognoza$MeteorologPrognoza]
GO
ALTER TABLE [dbo].[PrognozaRegion]  WITH CHECK ADD  CONSTRAINT [PrognozaRegion$PrognozaPrognozaRegion] FOREIGN KEY([PrognozaID])
REFERENCES [dbo].[Prognoza] ([PrognozaID])
GO
ALTER TABLE [dbo].[PrognozaRegion] CHECK CONSTRAINT [PrognozaRegion$PrognozaPrognozaRegion]
GO
ALTER TABLE [dbo].[PrognozaRegion]  WITH CHECK ADD  CONSTRAINT [PrognozaRegion$RegionPrognozaRegion] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[PrognozaRegion] CHECK CONSTRAINT [PrognozaRegion$RegionPrognozaRegion]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Meteorolog].[MeteorologID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meteorolog', @level2type=N'COLUMN',@level2name=N'MeteorologID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Meteorolog].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meteorolog', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Meteorolog].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meteorolog', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Meteorolog].[KorisnickoIme]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meteorolog', @level2type=N'COLUMN',@level2name=N'KorisnickoIme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Meteorolog].[Lozinka]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meteorolog', @level2type=N'COLUMN',@level2name=N'Lozinka'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Meteorolog].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meteorolog', @level2type=N'CONSTRAINT',@level2name=N'Meteorolog$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Meteorolog].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meteorolog', @level2type=N'INDEX',@level2name=N'Meteorolog$KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Meteorolog]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meteorolog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[PrognozaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'COLUMN',@level2name=N'PrognozaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[Dan]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'COLUMN',@level2name=N'Dan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[Opis]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'COLUMN',@level2name=N'Opis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[MeteorologID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'COLUMN',@level2name=N'MeteorologID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'CONSTRAINT',@level2name=N'Prognoza$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[MeteorologID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'INDEX',@level2name=N'Prognoza$MeteorologID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[MeteorologPrognoza]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'INDEX',@level2name=N'Prognoza$MeteorologPrognoza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[PrognozaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'INDEX',@level2name=N'Prognoza$PrognozaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Prognoza].[MeteorologPrognoza]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prognoza', @level2type=N'CONSTRAINT',@level2name=N'Prognoza$MeteorologPrognoza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[PrognozaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'COLUMN',@level2name=N'PrognozaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[RB]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'COLUMN',@level2name=N'RB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[Temperatura]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'COLUMN',@level2name=N'Temperatura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[MeteoAlarm]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'COLUMN',@level2name=N'MeteoAlarm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[Pojava]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'COLUMN',@level2name=N'Pojava'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[RegionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'COLUMN',@level2name=N'RegionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'CONSTRAINT',@level2name=N'PrognozaRegion$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[PrognozaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'INDEX',@level2name=N'PrognozaRegion$PrognozaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[PrognozaPrognozaRegion]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'INDEX',@level2name=N'PrognozaRegion$PrognozaPrognozaRegion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[RegionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'INDEX',@level2name=N'PrognozaRegion$RegionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[RegionPrognozaRegion]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'INDEX',@level2name=N'PrognozaRegion$RegionPrognozaRegion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[PrognozaPrognozaRegion]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'CONSTRAINT',@level2name=N'PrognozaRegion$PrognozaPrognozaRegion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[PrognozaRegion].[RegionPrognozaRegion]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrognozaRegion', @level2type=N'CONSTRAINT',@level2name=N'PrognozaRegion$RegionPrognozaRegion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Region].[RegionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Region', @level2type=N'COLUMN',@level2name=N'RegionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Region].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Region', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Region].[Opis]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Region', @level2type=N'COLUMN',@level2name=N'Opis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Region].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Region', @level2type=N'CONSTRAINT',@level2name=N'Region$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Region].[RegionID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Region', @level2type=N'INDEX',@level2name=N'Region$RegionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2020.[Region]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Region'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Jul2020] SET  READ_WRITE 
GO
