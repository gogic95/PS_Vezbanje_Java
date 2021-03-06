USE [master]
GO
/****** Object:  Database [ProSoft-Februar2020]    Script Date: 30-Jan-20 0:30:02 ******/
USE master
IF EXISTS(select * from sys.databases where name='ProSoft-Februar2020')
DROP DATABASE [ProSoft-Februar2020];
GO
CREATE DATABASE [ProSoft-Februar2020];
GO
ALTER AUTHORIZATION ON DATABASE::[ProSoft-Februar2020] TO sa
GO
USE [ProSoft-Februar2020]
GO
GO
ALTER DATABASE [ProSoft-Februar2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Februar2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProSoft-Februar2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Februar2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Februar2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProSoft-Februar2020] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Februar2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Februar2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Februar2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Februar2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Februar2020] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Februar2020] SET QUERY_STORE = OFF
GO
USE [ProSoft-Februar2020]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Februar2020]
GO
/****** Object:  Table [dbo].[Intervju]    Script Date: 30-Jan-20 0:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intervju](
	[IntervjuID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [datetime] NULL,
	[Opis] [nvarchar](255) NULL,
	[BrojPoenaTest] [float] NULL,
	[VozackaDozvola] [nvarchar](255) NULL,
	[PrethodnoIskustvo] [bit] NULL,
	[KandidatID] [int] NULL,
	[RegruterID] [int] NULL,
 CONSTRAINT [Intervju$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[IntervjuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kandidat]    Script Date: 30-Jan-20 0:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kandidat](
	[KandidatID] [int] NOT NULL,
	[ImePrezime] [nvarchar](255) NULL,
	[StrucnaSprema] [nvarchar](255) NULL,
	[Zanimanje] [nvarchar](255) NULL,
 CONSTRAINT [Kandidat$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[KandidatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regruter]    Script Date: 30-Jan-20 0:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regruter](
	[RegruterID] [int] NOT NULL,
	[ImePrezime] [nvarchar](255) NULL,
	[KorisnickoIme] [nvarchar](255) NULL,
	[Lozinka] [nvarchar](255) NULL,
 CONSTRAINT [Regruter$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[RegruterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Kandidat] ([KandidatID], [ImePrezime], [StrucnaSprema], [Zanimanje]) VALUES (1, N'Ivan Ivic', N'IV', N'ekonomski tehnicar')
INSERT [dbo].[Kandidat] ([KandidatID], [ImePrezime], [StrucnaSprema], [Zanimanje]) VALUES (2, N'Marija Markovic', N'VII-1', N'diplomirani pravnik')
INSERT [dbo].[Kandidat] ([KandidatID], [ImePrezime], [StrucnaSprema], [Zanimanje]) VALUES (3, N'Jovan Jovic', N'VII-2', N'magistar farmacije')
INSERT [dbo].[Kandidat] ([KandidatID], [ImePrezime], [StrucnaSprema], [Zanimanje]) VALUES (4, N'Slobodan Senic', N'IV', N'elektrotehnicar')
INSERT [dbo].[Kandidat] ([KandidatID], [ImePrezime], [StrucnaSprema], [Zanimanje]) VALUES (5, N'Milan Milovic', N'VII-1', N'diplomirani inzenjer organizacionih nauka')
INSERT [dbo].[Kandidat] ([KandidatID], [ImePrezime], [StrucnaSprema], [Zanimanje]) VALUES (6, N'Snezana Pavlovic', N'VII-2', N'master inzenjer organizacionih nauka')
INSERT [dbo].[Kandidat] ([KandidatID], [ImePrezime], [StrucnaSprema], [Zanimanje]) VALUES (7, N'Dragan Petrovic', N'VII-1', N'diplomirani inzenjer elektrotehnike')
INSERT [dbo].[Regruter] ([RegruterID], [ImePrezime], [KorisnickoIme], [Lozinka]) VALUES (1, N'Stefan Stefanovic', N'r1', N'r1')
INSERT [dbo].[Regruter] ([RegruterID], [ImePrezime], [KorisnickoIme], [Lozinka]) VALUES (2, N'Dragana Draganic', N'r2', N'r2')
/****** Object:  Index [Intervju$IntervjuID]    Script Date: 30-Jan-20 0:30:02 ******/
CREATE NONCLUSTERED INDEX [Intervju$IntervjuID] ON [dbo].[Intervju]
(
	[IntervjuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Intervju$KandidatIntervju]    Script Date: 30-Jan-20 0:30:02 ******/
CREATE NONCLUSTERED INDEX [Intervju$KandidatIntervju] ON [dbo].[Intervju]
(
	[KandidatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Intervju$RegruterID]    Script Date: 30-Jan-20 0:30:02 ******/
CREATE NONCLUSTERED INDEX [Intervju$RegruterID] ON [dbo].[Intervju]
(
	[RegruterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Intervju$RegruterIntervju]    Script Date: 30-Jan-20 0:30:02 ******/
CREATE NONCLUSTERED INDEX [Intervju$RegruterIntervju] ON [dbo].[Intervju]
(
	[RegruterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Kandidat$KandidatID]    Script Date: 30-Jan-20 0:30:02 ******/
CREATE NONCLUSTERED INDEX [Kandidat$KandidatID] ON [dbo].[Kandidat]
(
	[KandidatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Regruter$RegruterID]    Script Date: 30-Jan-20 0:30:02 ******/
CREATE NONCLUSTERED INDEX [Regruter$RegruterID] ON [dbo].[Regruter]
(
	[RegruterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Intervju] ADD  CONSTRAINT [DF__Intervju__BrojPo__36B12243]  DEFAULT ((0)) FOR [BrojPoenaTest]
GO
ALTER TABLE [dbo].[Intervju] ADD  CONSTRAINT [DF__Intervju__Pretho__37A5467C]  DEFAULT ((0)) FOR [PrethodnoIskustvo]
GO
ALTER TABLE [dbo].[Intervju] ADD  CONSTRAINT [DF__Intervju__Kandid__38996AB5]  DEFAULT ((0)) FOR [KandidatID]
GO
ALTER TABLE [dbo].[Intervju] ADD  CONSTRAINT [DF__Intervju__Regrut__398D8EEE]  DEFAULT ((0)) FOR [RegruterID]
GO
ALTER TABLE [dbo].[Kandidat] ADD  DEFAULT ((0)) FOR [KandidatID]
GO
ALTER TABLE [dbo].[Regruter] ADD  DEFAULT ((0)) FOR [RegruterID]
GO
ALTER TABLE [dbo].[Intervju]  WITH CHECK ADD  CONSTRAINT [Intervju$KandidatIntervju] FOREIGN KEY([KandidatID])
REFERENCES [dbo].[Kandidat] ([KandidatID])
GO
ALTER TABLE [dbo].[Intervju] CHECK CONSTRAINT [Intervju$KandidatIntervju]
GO
ALTER TABLE [dbo].[Intervju]  WITH CHECK ADD  CONSTRAINT [Intervju$RegruterIntervju] FOREIGN KEY([RegruterID])
REFERENCES [dbo].[Regruter] ([RegruterID])
GO
ALTER TABLE [dbo].[Intervju] CHECK CONSTRAINT [Intervju$RegruterIntervju]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[IntervjuID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'COLUMN',@level2name=N'IntervjuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[Datum]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[Opis]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'COLUMN',@level2name=N'Opis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[BrojPoenaTest]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'COLUMN',@level2name=N'BrojPoenaTest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[VozackaDozvola]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'COLUMN',@level2name=N'VozackaDozvola'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[PrethodnoIskustvo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'COLUMN',@level2name=N'PrethodnoIskustvo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[KandidatID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'COLUMN',@level2name=N'KandidatID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[RegruterID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'COLUMN',@level2name=N'RegruterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'CONSTRAINT',@level2name=N'Intervju$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[IntervjuID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'INDEX',@level2name=N'Intervju$IntervjuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[KandidatIntervju]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'INDEX',@level2name=N'Intervju$KandidatIntervju'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[RegruterID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'INDEX',@level2name=N'Intervju$RegruterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[RegruterIntervju]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'INDEX',@level2name=N'Intervju$RegruterIntervju'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[KandidatIntervju]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'CONSTRAINT',@level2name=N'Intervju$KandidatIntervju'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Intervju].[RegruterIntervju]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Intervju', @level2type=N'CONSTRAINT',@level2name=N'Intervju$RegruterIntervju'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Kandidat].[KandidatID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kandidat', @level2type=N'COLUMN',@level2name=N'KandidatID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Kandidat].[ImePrezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kandidat', @level2type=N'COLUMN',@level2name=N'ImePrezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Kandidat].[StrucnaSprema]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kandidat', @level2type=N'COLUMN',@level2name=N'StrucnaSprema'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Kandidat].[Zanimanje]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kandidat', @level2type=N'COLUMN',@level2name=N'Zanimanje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Kandidat].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kandidat', @level2type=N'CONSTRAINT',@level2name=N'Kandidat$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Kandidat].[KandidatID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kandidat', @level2type=N'INDEX',@level2name=N'Kandidat$KandidatID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Kandidat]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kandidat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Regruter].[RegruterID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Regruter', @level2type=N'COLUMN',@level2name=N'RegruterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Regruter].[ImePrezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Regruter', @level2type=N'COLUMN',@level2name=N'ImePrezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Regruter].[KorisnickoIme]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Regruter', @level2type=N'COLUMN',@level2name=N'KorisnickoIme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Regruter].[Lozinka]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Regruter', @level2type=N'COLUMN',@level2name=N'Lozinka'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Regruter].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Regruter', @level2type=N'CONSTRAINT',@level2name=N'Regruter$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Regruter].[RegruterID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Regruter', @level2type=N'INDEX',@level2name=N'Regruter$RegruterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Februar2020.[Regruter]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Regruter'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Februar2020] SET  READ_WRITE 
GO
