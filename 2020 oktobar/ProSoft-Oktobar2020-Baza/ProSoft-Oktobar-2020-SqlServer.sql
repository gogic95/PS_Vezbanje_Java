USE [master]
GO
/****** Object:  Database [ProSoft-Oktobar2020]    Script Date: 30-Jan-20 0:19:22 ******/
USE master
IF EXISTS(select * from sys.databases where name='ProSoft-Oktobar2020')
DROP DATABASE [ProSoft-Oktobar2020];
GO
CREATE DATABASE [ProSoft-Oktobar2020];
GO
ALTER AUTHORIZATION ON DATABASE::[ProSoft-Oktobar2020]TO sa
GO
USE [ProSoft-Oktobar2020]
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET QUERY_STORE = OFF
GO
USE [ProSoft-Oktobar2020]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Oktobar2020]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 13-Sep-20 20:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[KorisnikID] [int] NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
	[KorisnickoIme] [nvarchar](255) NULL,
	[Lozinka] [nvarchar](255) NULL,
 CONSTRAINT [Korisnik$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nastavnik]    Script Date: 13-Sep-20 20:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nastavnik](
	[NastavnikID] [int] NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
	[Zvanje] [nvarchar](255) NULL,
 CONSTRAINT [Nastavnik$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[NastavnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PredajePredmet]    Script Date: 13-Sep-20 20:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PredajePredmet](
	[NastavnikID] [int] NOT NULL,
	[PredmetID] [int] NOT NULL,
	[Semestar] [int] NULL,
	[StudijskiProgram] [nvarchar](255) NULL,
	[DatumAngazovanja] [datetime] NULL,
	[KorisnikID] [int] NULL,
 CONSTRAINT [PredajePredmet$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[NastavnikID] ASC,
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Predmet]    Script Date: 13-Sep-20 20:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predmet](
	[PredmetID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
	[ESPB] [int] NULL,
 CONSTRAINT [Predmet$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Korisnik] ([KorisnikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (1, N'Ana', N'Anic', N'ana', N'ana')
INSERT [dbo].[Korisnik] ([KorisnikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (2, N'Ivan', N'Ivic', N'ivan', N'ivan')
INSERT [dbo].[Nastavnik] ([NastavnikID], [Ime], [Prezime], [Zvanje]) VALUES (1, N'Ivana', N'Ivanovic', N'Redovni profesor')
INSERT [dbo].[Nastavnik] ([NastavnikID], [Ime], [Prezime], [Zvanje]) VALUES (2, N'Dragan', N'Draganic', N'Docent')
INSERT [dbo].[Nastavnik] ([NastavnikID], [Ime], [Prezime], [Zvanje]) VALUES (3, N'Marija', N'Marjanovic', N'Asistent')
INSERT [dbo].[Nastavnik] ([NastavnikID], [Ime], [Prezime], [Zvanje]) VALUES (4, N'Petar', N'Petkovic', N'Saradnik u nastavi')
INSERT [dbo].[Nastavnik] ([NastavnikID], [Ime], [Prezime], [Zvanje]) VALUES (5, N'Marko', N'Markovic', N'Vanredni profesor')
INSERT [dbo].[Nastavnik] ([NastavnikID], [Ime], [Prezime], [Zvanje]) VALUES (6, N'Mirko', N'Mirkovic', N'Asistent')
INSERT [dbo].[PredajePredmet] ([NastavnikID], [PredmetID], [Semestar], [StudijskiProgram], [DatumAngazovanja], [KorisnikID]) VALUES (1, 1, 5, N'OM', CAST(N'2020-09-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[PredajePredmet] ([NastavnikID], [PredmetID], [Semestar], [StudijskiProgram], [DatumAngazovanja], [KorisnikID]) VALUES (1, 2, 8, N'ISIT', CAST(N'2020-09-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (1, N'Osnove programiranja', 6)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (2, N'Projektovanje softvera', 6)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (3, N'Programiranje 1', 5)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (4, N'Engleski jezik struke 1', 6)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (5, N'Matematika 1', 6)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (6, N'Matematika 2', 6)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (7, N'Teorija verovatnoce', 6)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (8, N'Statistika', 6)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (9, N'Operaciona istrazivanja 1', 6)
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [ESPB]) VALUES (10, N'Operaciona istrazivanja 2', 6)
/****** Object:  Index [Korisnik$KorisnikID]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [Korisnik$KorisnikID] ON [dbo].[Korisnik]
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Nastavnik$ProfesorID]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [Nastavnik$ProfesorID] ON [dbo].[Nastavnik]
(
	[NastavnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PredajePredmet$KorisnikID]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [PredajePredmet$KorisnikID] ON [dbo].[PredajePredmet]
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PredajePredmet$KorisnikPredajePredmet]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [PredajePredmet$KorisnikPredajePredmet] ON [dbo].[PredajePredmet]
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PredajePredmet$NastavnikID]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [PredajePredmet$NastavnikID] ON [dbo].[PredajePredmet]
(
	[NastavnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PredajePredmet$NastavnikPredajePredmet]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [PredajePredmet$NastavnikPredajePredmet] ON [dbo].[PredajePredmet]
(
	[NastavnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PredajePredmet$PredmetID]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [PredajePredmet$PredmetID] ON [dbo].[PredajePredmet]
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PredajePredmet$PredmetPredajePredmet]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [PredajePredmet$PredmetPredajePredmet] ON [dbo].[PredajePredmet]
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Predmet$PredmetID]    Script Date: 13-Sep-20 20:30:45 ******/
CREATE NONCLUSTERED INDEX [Predmet$PredmetID] ON [dbo].[Predmet]
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Korisnik] ADD  DEFAULT ((0)) FOR [KorisnikID]
GO
ALTER TABLE [dbo].[PredajePredmet] ADD  CONSTRAINT [DF__PredajePr__Koris__2D27B809]  DEFAULT ((0)) FOR [KorisnikID]
GO
ALTER TABLE [dbo].[PredajePredmet]  WITH NOCHECK ADD  CONSTRAINT [PredajePredmet$KorisnikPredajePredmet] FOREIGN KEY([KorisnikID])
REFERENCES [dbo].[Korisnik] ([KorisnikID])
GO
ALTER TABLE [dbo].[PredajePredmet] CHECK CONSTRAINT [PredajePredmet$KorisnikPredajePredmet]
GO
ALTER TABLE [dbo].[PredajePredmet]  WITH NOCHECK ADD  CONSTRAINT [PredajePredmet$NastavnikPredajePredmet] FOREIGN KEY([NastavnikID])
REFERENCES [dbo].[Nastavnik] ([NastavnikID])
GO
ALTER TABLE [dbo].[PredajePredmet] CHECK CONSTRAINT [PredajePredmet$NastavnikPredajePredmet]
GO
ALTER TABLE [dbo].[PredajePredmet]  WITH NOCHECK ADD  CONSTRAINT [PredajePredmet$PredmetPredajePredmet] FOREIGN KEY([PredmetID])
REFERENCES [dbo].[Predmet] ([PredmetID])
GO
ALTER TABLE [dbo].[PredajePredmet] CHECK CONSTRAINT [PredajePredmet$PredmetPredajePredmet]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Korisnik].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Korisnik].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Korisnik].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Korisnik].[KorisnickoIme]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'KorisnickoIme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Korisnik].[Lozinka]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'Lozinka'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Korisnik].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'CONSTRAINT',@level2name=N'Korisnik$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Korisnik].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'INDEX',@level2name=N'Korisnik$KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Korisnik]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Nastavnik].[NastavnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nastavnik', @level2type=N'COLUMN',@level2name=N'NastavnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Nastavnik].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nastavnik', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Nastavnik].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nastavnik', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Nastavnik].[Zvanje]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nastavnik', @level2type=N'COLUMN',@level2name=N'Zvanje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Nastavnik].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nastavnik', @level2type=N'CONSTRAINT',@level2name=N'Nastavnik$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Nastavnik].[ProfesorID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nastavnik', @level2type=N'INDEX',@level2name=N'Nastavnik$ProfesorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Nastavnik]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nastavnik'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[NastavnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'COLUMN',@level2name=N'NastavnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[PredmetID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'COLUMN',@level2name=N'PredmetID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[Semestar]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'COLUMN',@level2name=N'Semestar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[StudijskiProgram]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'COLUMN',@level2name=N'StudijskiProgram'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[DatumAngazovanja]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'COLUMN',@level2name=N'DatumAngazovanja'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'COLUMN',@level2name=N'KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'CONSTRAINT',@level2name=N'PredajePredmet$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'INDEX',@level2name=N'PredajePredmet$KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[KorisnikPredajePredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'INDEX',@level2name=N'PredajePredmet$KorisnikPredajePredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[NastavnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'INDEX',@level2name=N'PredajePredmet$NastavnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[NastavnikPredajePredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'INDEX',@level2name=N'PredajePredmet$NastavnikPredajePredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[PredmetID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'INDEX',@level2name=N'PredajePredmet$PredmetID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[PredmetPredajePredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'INDEX',@level2name=N'PredajePredmet$PredmetPredajePredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[KorisnikPredajePredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'CONSTRAINT',@level2name=N'PredajePredmet$KorisnikPredajePredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[NastavnikPredajePredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'CONSTRAINT',@level2name=N'PredajePredmet$NastavnikPredajePredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[PredajePredmet].[PredmetPredajePredmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PredajePredmet', @level2type=N'CONSTRAINT',@level2name=N'PredajePredmet$PredmetPredajePredmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Predmet].[PredmetID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'PredmetID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Predmet].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Predmet].[ESPB]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'COLUMN',@level2name=N'ESPB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Predmet].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'CONSTRAINT',@level2name=N'Predmet$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Predmet].[PredmetID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet', @level2type=N'INDEX',@level2name=N'Predmet$PredmetID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Oktobar2020.[Predmet]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Oktobar2020] SET  READ_WRITE 
GO
