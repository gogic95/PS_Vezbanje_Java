USE [master]
GO
USE master
IF EXISTS(select * from sys.databases where name='ProSoft-Jul2019')
DROP DATABASE [ProSoft-Jul2019];
GO
CREATE DATABASE [ProSoft-Jul2019];
GO
ALTER AUTHORIZATION ON DATABASE::[ProSoft-Jul2019] TO sa
GO

USE [ProSoft-Jul2019]
GO
ALTER DATABASE [ProSoft-Jul2019] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Jul2019] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProSoft-Jul2019] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Jul2019] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Jul2019] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProSoft-Jul2019] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Jul2019] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Jul2019] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Jul2019] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Jul2019] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Jul2019] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Jul2019] SET QUERY_STORE = OFF
GO
USE [ProSoft-Jul2019]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Jul2019]
GO
/****** Object:  Table [dbo].[Gazdinstvo]    Script Date: 01-Jul-19 11:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gazdinstvo](
	[GazdinstvoID] [int] NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[DatumRegistracije] [datetime2](0) NULL,
	[UkupnoSubvencija] [float] NULL,
	[PoljoprivrednikID] [int] NULL,
 CONSTRAINT [Gazdinstvo$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[GazdinstvoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poljoprivrednik]    Script Date: 01-Jul-19 11:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poljoprivrednik](
	[PoljoprivrednikID] [int] NOT NULL,
	[Ime] [nvarchar](max) NULL,
	[Prezime] [nvarchar](max) NULL,
	[KorisnickoIme] [nvarchar](max) NULL,
	[Lozinka] [nvarchar](max) NULL,
 CONSTRAINT [Poljoprivrednik$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PoljoprivrednikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stado]    Script Date: 01-Jul-19 11:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stado](
	[GazdinstvoID] [int] NOT NULL,
	[StadoID] [int] NOT NULL,
	[BrojGrla] [int] NULL,
	[IznosSubvencije] [float] NULL,
	[ZivotinjaID] [int] NULL,
 CONSTRAINT [Stado$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[GazdinstvoID] ASC,
	[StadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zivotinja]    Script Date: 01-Jul-19 11:23:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zivotinja](
	[ZivotinjaID] [int] NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[AutohtonaVrsta] [bit] NULL,
	[SubvencijaPoGrlu] [float] NULL,
 CONSTRAINT [Zivotinja$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ZivotinjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Poljoprivrednik] ([PoljoprivrednikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (1, N'Marko', N'Markovic', N'marko', N'marko123')
INSERT [dbo].[Poljoprivrednik] ([PoljoprivrednikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (2, N'Ana', N'Antic', N'ana', N'ana123')
INSERT [dbo].[Poljoprivrednik] ([PoljoprivrednikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (3, N'Dragan', N'Draganic', N'dragan', N'dragan123')
INSERT [dbo].[Poljoprivrednik] ([PoljoprivrednikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (4, N'Ivana', N'Ivic', N'ivana', N'ivana123')
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (1, N'Mangulica', 1, 199.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (2, N'Moravka', 1, 299.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (3, N'Sumadinka', 1, 149.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (4, N'Sjenicko-pesterska ovca', 1, 259.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (5, N'Svrljiska ovca', 1, 179.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (6, N'Pirotska ovca', 1, 169.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (7, N'Balkanska koza', 1, 299.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (8, N'Busa', 1, 129.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (9, N'Domaci bivo', 1, 139.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (10, N'Balkanski magarac', 1, 149.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (11, N'Krava', 0, 99.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (12, N'Konj', 0, 89.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (13, N'Ovca', 0, 109.99)
INSERT [dbo].[Zivotinja] ([ZivotinjaID], [Naziv], [AutohtonaVrsta], [SubvencijaPoGrlu]) VALUES (14, N'Koza', 0, 101.99)
/****** Object:  Index [Gazdinstvo$GazdinstvoID]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Gazdinstvo$GazdinstvoID] ON [dbo].[Gazdinstvo]
(
	[GazdinstvoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Gazdinstvo$PoljoprivrednikGazdinstvo]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Gazdinstvo$PoljoprivrednikGazdinstvo] ON [dbo].[Gazdinstvo]
(
	[PoljoprivrednikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Gazdinstvo$PoljoprivrednikID]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Gazdinstvo$PoljoprivrednikID] ON [dbo].[Gazdinstvo]
(
	[PoljoprivrednikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Poljoprivrednik$PoljoprivrednikID]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Poljoprivrednik$PoljoprivrednikID] ON [dbo].[Poljoprivrednik]
(
	[PoljoprivrednikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Stado$GazdinstvoID]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Stado$GazdinstvoID] ON [dbo].[Stado]
(
	[GazdinstvoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Stado$GazdinstvoStado]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Stado$GazdinstvoStado] ON [dbo].[Stado]
(
	[GazdinstvoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Stado$StadoID]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Stado$StadoID] ON [dbo].[Stado]
(
	[StadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Stado$ZivotinjaID]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Stado$ZivotinjaID] ON [dbo].[Stado]
(
	[ZivotinjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Stado$ZivotinjaStado]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Stado$ZivotinjaStado] ON [dbo].[Stado]
(
	[ZivotinjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zivotinja$ZivotinjaID]    Script Date: 01-Jul-19 11:23:35 PM ******/
CREATE NONCLUSTERED INDEX [Zivotinja$ZivotinjaID] ON [dbo].[Zivotinja]
(
	[ZivotinjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gazdinstvo] ADD  DEFAULT ((0)) FOR [GazdinstvoID]
GO
ALTER TABLE [dbo].[Gazdinstvo] ADD  DEFAULT ((0)) FOR [UkupnoSubvencija]
GO
ALTER TABLE [dbo].[Gazdinstvo] ADD  DEFAULT ((0)) FOR [PoljoprivrednikID]
GO
ALTER TABLE [dbo].[Poljoprivrednik] ADD  DEFAULT ((0)) FOR [PoljoprivrednikID]
GO
ALTER TABLE [dbo].[Stado] ADD  DEFAULT ((0)) FOR [GazdinstvoID]
GO
ALTER TABLE [dbo].[Stado] ADD  DEFAULT ((0)) FOR [StadoID]
GO
ALTER TABLE [dbo].[Stado] ADD  DEFAULT ((0)) FOR [BrojGrla]
GO
ALTER TABLE [dbo].[Stado] ADD  DEFAULT ((0)) FOR [IznosSubvencije]
GO
ALTER TABLE [dbo].[Stado] ADD  DEFAULT ((0)) FOR [ZivotinjaID]
GO
ALTER TABLE [dbo].[Zivotinja] ADD  DEFAULT ((0)) FOR [ZivotinjaID]
GO
ALTER TABLE [dbo].[Zivotinja] ADD  DEFAULT ((0)) FOR [AutohtonaVrsta]
GO
ALTER TABLE [dbo].[Zivotinja] ADD  DEFAULT ((0)) FOR [SubvencijaPoGrlu]
GO
ALTER TABLE [dbo].[Gazdinstvo]  WITH CHECK ADD  CONSTRAINT [Gazdinstvo$PoljoprivrednikGazdinstvo] FOREIGN KEY([PoljoprivrednikID])
REFERENCES [dbo].[Poljoprivrednik] ([PoljoprivrednikID])
GO
ALTER TABLE [dbo].[Gazdinstvo] CHECK CONSTRAINT [Gazdinstvo$PoljoprivrednikGazdinstvo]
GO
ALTER TABLE [dbo].[Stado]  WITH CHECK ADD  CONSTRAINT [Stado$GazdinstvoStado] FOREIGN KEY([GazdinstvoID])
REFERENCES [dbo].[Gazdinstvo] ([GazdinstvoID])
GO
ALTER TABLE [dbo].[Stado] CHECK CONSTRAINT [Stado$GazdinstvoStado]
GO
ALTER TABLE [dbo].[Stado]  WITH CHECK ADD  CONSTRAINT [Stado$ZivotinjaStado] FOREIGN KEY([ZivotinjaID])
REFERENCES [dbo].[Zivotinja] ([ZivotinjaID])
GO
ALTER TABLE [dbo].[Stado] CHECK CONSTRAINT [Stado$ZivotinjaStado]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[GazdinstvoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'COLUMN',@level2name=N'GazdinstvoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[DatumRegistracije]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'COLUMN',@level2name=N'DatumRegistracije'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[UkupnoSubvencija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'COLUMN',@level2name=N'UkupnoSubvencija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[PoljoprivrednikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'COLUMN',@level2name=N'PoljoprivrednikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'CONSTRAINT',@level2name=N'Gazdinstvo$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[GazdinstvoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'INDEX',@level2name=N'Gazdinstvo$GazdinstvoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[PoljoprivrednikGazdinstvo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'INDEX',@level2name=N'Gazdinstvo$PoljoprivrednikGazdinstvo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[PoljoprivrednikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'INDEX',@level2name=N'Gazdinstvo$PoljoprivrednikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Gazdinstvo].[PoljoprivrednikGazdinstvo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gazdinstvo', @level2type=N'CONSTRAINT',@level2name=N'Gazdinstvo$PoljoprivrednikGazdinstvo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Poljoprivrednik].[PoljoprivrednikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Poljoprivrednik', @level2type=N'COLUMN',@level2name=N'PoljoprivrednikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Poljoprivrednik].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Poljoprivrednik', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Poljoprivrednik].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Poljoprivrednik', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Poljoprivrednik].[KorisnickoIme]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Poljoprivrednik', @level2type=N'COLUMN',@level2name=N'KorisnickoIme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Poljoprivrednik].[Lozinka]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Poljoprivrednik', @level2type=N'COLUMN',@level2name=N'Lozinka'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Poljoprivrednik].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Poljoprivrednik', @level2type=N'CONSTRAINT',@level2name=N'Poljoprivrednik$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Poljoprivrednik].[PoljoprivrednikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Poljoprivrednik', @level2type=N'INDEX',@level2name=N'Poljoprivrednik$PoljoprivrednikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Poljoprivrednik]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Poljoprivrednik'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[GazdinstvoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'COLUMN',@level2name=N'GazdinstvoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[StadoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'COLUMN',@level2name=N'StadoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[BrojGrla]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'COLUMN',@level2name=N'BrojGrla'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[IznosSubvencije]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'COLUMN',@level2name=N'IznosSubvencije'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[ZivotinjaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'COLUMN',@level2name=N'ZivotinjaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'CONSTRAINT',@level2name=N'Stado$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[GazdinstvoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'INDEX',@level2name=N'Stado$GazdinstvoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[GazdinstvoStado]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'INDEX',@level2name=N'Stado$GazdinstvoStado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[StadoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'INDEX',@level2name=N'Stado$StadoID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[ZivotinjaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'INDEX',@level2name=N'Stado$ZivotinjaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[ZivotinjaStado]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'INDEX',@level2name=N'Stado$ZivotinjaStado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[GazdinstvoStado]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'CONSTRAINT',@level2name=N'Stado$GazdinstvoStado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Stado].[ZivotinjaStado]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stado', @level2type=N'CONSTRAINT',@level2name=N'Stado$ZivotinjaStado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Zivotinja].[ZivotinjaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zivotinja', @level2type=N'COLUMN',@level2name=N'ZivotinjaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Zivotinja].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zivotinja', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Zivotinja].[AutohtonaVrsta]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zivotinja', @level2type=N'COLUMN',@level2name=N'AutohtonaVrsta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Zivotinja].[SubvencijaPoGrlu]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zivotinja', @level2type=N'COLUMN',@level2name=N'SubvencijaPoGrlu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Zivotinja].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zivotinja', @level2type=N'CONSTRAINT',@level2name=N'Zivotinja$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Zivotinja].[ZivotinjaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zivotinja', @level2type=N'INDEX',@level2name=N'Zivotinja$ZivotinjaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jul2019.[Zivotinja]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zivotinja'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Jul2019] SET  READ_WRITE 
GO
