USE [master]
GO
/****** Object:  Database [ProSoft-Septembar2020]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE DATABASE [ProSoft-Septembar2020]

GO
ALTER DATABASE [ProSoft-Septembar2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Septembar2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Septembar2020] SET QUERY_STORE = OFF
GO
USE [ProSoft-Septembar2020]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Septembar2020]
GO
/****** Object:  Table [dbo].[Laborant]    Script Date: 23-Aug-20 22:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laborant](
	[LaborantID] [int] NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
	[KorisnickoIme] [nvarchar](255) NULL,
	[Lozinka] [nvarchar](255) NULL,
	[LaboratorijaID] [int] NULL,
 CONSTRAINT [Laborant$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[LaborantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratorija]    Script Date: 23-Aug-20 22:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorija](
	[LaboratorijaID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
	[DnevniKapacitetTestova] [int] NULL,
	[Grad] [nvarchar](255) NULL,
 CONSTRAINT [Laboratorija$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[LaboratorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OsiguranoLice]    Script Date: 23-Aug-20 22:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OsiguranoLice](
	[OsiguranoLiceID] [int] NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
	[LBO] [nvarchar](255) NULL,
	[KrvnaGrupa] [nvarchar](255) NULL,
 CONSTRAINT [OsiguranoLice$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[OsiguranoLiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zahtev]    Script Date: 23-Aug-20 22:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zahtev](
	[ZahtevID] [int] NOT NULL,
	[DatumVremeTestiranja] [datetime] NULL,
	[Hitno] [bit] NULL,
	[Tip] [nvarchar](255) NULL,
	[Rezultat] [nvarchar](255) NULL,
	[DatumVremeRezultata] [datetime] NULL,
	[Napomena] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[OsiguranoLiceID] [int] NULL,
	[LaboratorijaID] [int] NULL,
	[LaborantID] [int] NULL,
 CONSTRAINT [Zahtev$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ZahtevID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Laborant] ([LaborantID], [Ime], [Prezime], [KorisnickoIme], [Lozinka], [LaboratorijaID]) VALUES (1, N'Ana', N'Anic', N'ana', N'ana', 1)
INSERT [dbo].[Laborant] ([LaborantID], [Ime], [Prezime], [KorisnickoIme], [Lozinka], [LaboratorijaID]) VALUES (2, N'Marko', N'Peric', N'marko', N'marko', 2)
INSERT [dbo].[Laborant] ([LaborantID], [Ime], [Prezime], [KorisnickoIme], [Lozinka], [LaboratorijaID]) VALUES (3, N'Jovan', N'Jovic', N'jovan', N'jovan', 3)
INSERT [dbo].[Laboratorija] ([LaboratorijaID], [Naziv], [DnevniKapacitetTestova], [Grad]) VALUES (1, N'Vatreno oko BG', 2000, N'Beograd')
INSERT [dbo].[Laboratorija] ([LaboratorijaID], [Naziv], [DnevniKapacitetTestova], [Grad]) VALUES (2, N'Vatreno oko Nis', 1000, N'Nis')
INSERT [dbo].[Laboratorija] ([LaboratorijaID], [Naziv], [DnevniKapacitetTestova], [Grad]) VALUES (3, N'Institut Torlak', 500, N'Beograd')
INSERT [dbo].[OsiguranoLice] ([OsiguranoLiceID], [Ime], [Prezime], [LBO], [KrvnaGrupa]) VALUES (1, N'Marko', N'Markovic', N'1111', N'0+')
INSERT [dbo].[OsiguranoLice] ([OsiguranoLiceID], [Ime], [Prezime], [LBO], [KrvnaGrupa]) VALUES (2, N'Dragan', N'Draganic', N'2222', N'A-')
INSERT [dbo].[OsiguranoLice] ([OsiguranoLiceID], [Ime], [Prezime], [LBO], [KrvnaGrupa]) VALUES (3, N'Jovana', N'Jovanic', N'3333', N'AB+')
INSERT [dbo].[OsiguranoLice] ([OsiguranoLiceID], [Ime], [Prezime], [LBO], [KrvnaGrupa]) VALUES (4, N'Marija', N'Markovic', N'4444', N'B+')
INSERT [dbo].[OsiguranoLice] ([OsiguranoLiceID], [Ime], [Prezime], [LBO], [KrvnaGrupa]) VALUES (5, N'Petar', N'Petrovic', N'5555', N'A+')
INSERT [dbo].[OsiguranoLice] ([OsiguranoLiceID], [Ime], [Prezime], [LBO], [KrvnaGrupa]) VALUES (6, N'Mirko', N'Mirkovic', N'6666', N'B-')
INSERT [dbo].[OsiguranoLice] ([OsiguranoLiceID], [Ime], [Prezime], [LBO], [KrvnaGrupa]) VALUES (7, N'Milos', N'Milosevic', N'7777', N'0-')
INSERT [dbo].[OsiguranoLice] ([OsiguranoLiceID], [Ime], [Prezime], [LBO], [KrvnaGrupa]) VALUES (8, N'Milos', N'Mitrovic', N'8888', N'0+')
INSERT [dbo].[Zahtev] ([ZahtevID], [DatumVremeTestiranja], [Hitno], [Tip], [Rezultat], [DatumVremeRezultata], [Napomena], [Status], [OsiguranoLiceID], [LaboratorijaID], [LaborantID]) VALUES (1, CAST(N'2020-08-23T11:15:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, N'Neobradjen', 1, 1, NULL)
INSERT [dbo].[Zahtev] ([ZahtevID], [DatumVremeTestiranja], [Hitno], [Tip], [Rezultat], [DatumVremeRezultata], [Napomena], [Status], [OsiguranoLiceID], [LaboratorijaID], [LaborantID]) VALUES (2, CAST(N'2020-08-23T00:10:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, N'Neobradjen', 2, 1, NULL)
INSERT [dbo].[Zahtev] ([ZahtevID], [DatumVremeTestiranja], [Hitno], [Tip], [Rezultat], [DatumVremeRezultata], [Napomena], [Status], [OsiguranoLiceID], [LaboratorijaID], [LaborantID]) VALUES (3, CAST(N'2020-08-24T07:10:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, N'Neobradjen', 3, 1, NULL)
INSERT [dbo].[Zahtev] ([ZahtevID], [DatumVremeTestiranja], [Hitno], [Tip], [Rezultat], [DatumVremeRezultata], [Napomena], [Status], [OsiguranoLiceID], [LaboratorijaID], [LaborantID]) VALUES (4, CAST(N'2020-08-25T00:10:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, N'Neobradjen', 4, 1, NULL)
INSERT [dbo].[Zahtev] ([ZahtevID], [DatumVremeTestiranja], [Hitno], [Tip], [Rezultat], [DatumVremeRezultata], [Napomena], [Status], [OsiguranoLiceID], [LaboratorijaID], [LaborantID]) VALUES (5, CAST(N'2020-08-25T10:50:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, N'Neobradjen', 5, 2, NULL)
INSERT [dbo].[Zahtev] ([ZahtevID], [DatumVremeTestiranja], [Hitno], [Tip], [Rezultat], [DatumVremeRezultata], [Napomena], [Status], [OsiguranoLiceID], [LaboratorijaID], [LaborantID]) VALUES (6, CAST(N'2020-08-26T11:43:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, N'Neobradjen', 6, 2, NULL)
INSERT [dbo].[Zahtev] ([ZahtevID], [DatumVremeTestiranja], [Hitno], [Tip], [Rezultat], [DatumVremeRezultata], [Napomena], [Status], [OsiguranoLiceID], [LaboratorijaID], [LaborantID]) VALUES (7, CAST(N'2020-08-24T07:20:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, N'Neobradjen', 7, 2, NULL)
INSERT [dbo].[Zahtev] ([ZahtevID], [DatumVremeTestiranja], [Hitno], [Tip], [Rezultat], [DatumVremeRezultata], [Napomena], [Status], [OsiguranoLiceID], [LaboratorijaID], [LaborantID]) VALUES (8, CAST(N'2020-08-24T07:25:00.000' AS DateTime), 0, NULL, NULL, NULL, NULL, N'Neobradjen', 8, 2, NULL)
/****** Object:  Index [Laborant$LaboratorijaID]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Laborant$LaboratorijaID] ON [dbo].[Laborant]
(
	[LaboratorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Laborant$LaboratorijaLaborant]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Laborant$LaboratorijaLaborant] ON [dbo].[Laborant]
(
	[LaboratorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Laborant$LekarID]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Laborant$LekarID] ON [dbo].[Laborant]
(
	[LaborantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Laboratorija$LaboratorijaID]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Laboratorija$LaboratorijaID] ON [dbo].[Laboratorija]
(
	[LaboratorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [OsiguranoLice$OsiguranoLiceID]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [OsiguranoLice$OsiguranoLiceID] ON [dbo].[OsiguranoLice]
(
	[OsiguranoLiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zahtev$LaborantID]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Zahtev$LaborantID] ON [dbo].[Zahtev]
(
	[LaborantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zahtev$LaborantZahtev]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Zahtev$LaborantZahtev] ON [dbo].[Zahtev]
(
	[LaborantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zahtev$LaboratorijaID]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Zahtev$LaboratorijaID] ON [dbo].[Zahtev]
(
	[LaboratorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zahtev$LaboratorijaZahtev]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Zahtev$LaboratorijaZahtev] ON [dbo].[Zahtev]
(
	[LaboratorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zahtev$OsiguranoLiceID]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Zahtev$OsiguranoLiceID] ON [dbo].[Zahtev]
(
	[OsiguranoLiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zahtev$OsiguranoLiceZahtev]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Zahtev$OsiguranoLiceZahtev] ON [dbo].[Zahtev]
(
	[OsiguranoLiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zahtev$RezultatID]    Script Date: 23-Aug-20 22:09:26 ******/
CREATE NONCLUSTERED INDEX [Zahtev$RezultatID] ON [dbo].[Zahtev]
(
	[ZahtevID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Laborant] ADD  DEFAULT ((0)) FOR [LaborantID]
GO
ALTER TABLE [dbo].[Laborant] ADD  DEFAULT ((0)) FOR [LaboratorijaID]
GO
ALTER TABLE [dbo].[Laboratorija] ADD  DEFAULT ((0)) FOR [LaboratorijaID]
GO
ALTER TABLE [dbo].[Laboratorija] ADD  DEFAULT ((0)) FOR [DnevniKapacitetTestova]
GO
ALTER TABLE [dbo].[OsiguranoLice] ADD  DEFAULT ((0)) FOR [OsiguranoLiceID]
GO
ALTER TABLE [dbo].[Zahtev] ADD  CONSTRAINT [DF__Zahtev__ZahtevID__31EC6D26]  DEFAULT ((0)) FOR [ZahtevID]
GO
ALTER TABLE [dbo].[Zahtev] ADD  CONSTRAINT [DF__Zahtev__Hitno__32E0915F]  DEFAULT ((0)) FOR [Hitno]
GO
ALTER TABLE [dbo].[Zahtev] ADD  CONSTRAINT [DF__Zahtev__Osiguran__33D4B598]  DEFAULT ((0)) FOR [OsiguranoLiceID]
GO
ALTER TABLE [dbo].[Zahtev] ADD  CONSTRAINT [DF__Zahtev__Laborato__34C8D9D1]  DEFAULT ((0)) FOR [LaboratorijaID]
GO
ALTER TABLE [dbo].[Zahtev] ADD  CONSTRAINT [DF__Zahtev__Laborant__35BCFE0A]  DEFAULT ((0)) FOR [LaborantID]
GO
ALTER TABLE [dbo].[Laborant]  WITH NOCHECK ADD  CONSTRAINT [Laborant$LaboratorijaLaborant] FOREIGN KEY([LaboratorijaID])
REFERENCES [dbo].[Laboratorija] ([LaboratorijaID])
GO
ALTER TABLE [dbo].[Laborant] CHECK CONSTRAINT [Laborant$LaboratorijaLaborant]
GO
ALTER TABLE [dbo].[Zahtev]  WITH NOCHECK ADD  CONSTRAINT [Zahtev$LaborantZahtev] FOREIGN KEY([LaborantID])
REFERENCES [dbo].[Laborant] ([LaborantID])
GO
ALTER TABLE [dbo].[Zahtev] CHECK CONSTRAINT [Zahtev$LaborantZahtev]
GO
ALTER TABLE [dbo].[Zahtev]  WITH NOCHECK ADD  CONSTRAINT [Zahtev$LaboratorijaZahtev] FOREIGN KEY([LaboratorijaID])
REFERENCES [dbo].[Laboratorija] ([LaboratorijaID])
GO
ALTER TABLE [dbo].[Zahtev] CHECK CONSTRAINT [Zahtev$LaboratorijaZahtev]
GO
ALTER TABLE [dbo].[Zahtev]  WITH NOCHECK ADD  CONSTRAINT [Zahtev$OsiguranoLiceZahtev] FOREIGN KEY([OsiguranoLiceID])
REFERENCES [dbo].[OsiguranoLice] ([OsiguranoLiceID])
GO
ALTER TABLE [dbo].[Zahtev] CHECK CONSTRAINT [Zahtev$OsiguranoLiceZahtev]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[LaborantID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'COLUMN',@level2name=N'LaborantID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[KorisnickoIme]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'COLUMN',@level2name=N'KorisnickoIme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[Lozinka]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'COLUMN',@level2name=N'Lozinka'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[LaboratorijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'COLUMN',@level2name=N'LaboratorijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'CONSTRAINT',@level2name=N'Laborant$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[LaboratorijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'INDEX',@level2name=N'Laborant$LaboratorijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[LaboratorijaLaborant]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'INDEX',@level2name=N'Laborant$LaboratorijaLaborant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[LekarID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'INDEX',@level2name=N'Laborant$LekarID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laborant].[LaboratorijaLaborant]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laborant', @level2type=N'CONSTRAINT',@level2name=N'Laborant$LaboratorijaLaborant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laboratorija].[LaboratorijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laboratorija', @level2type=N'COLUMN',@level2name=N'LaboratorijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laboratorija].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laboratorija', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laboratorija].[DnevniKapacitetTestova]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laboratorija', @level2type=N'COLUMN',@level2name=N'DnevniKapacitetTestova'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laboratorija].[Grad]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laboratorija', @level2type=N'COLUMN',@level2name=N'Grad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laboratorija].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laboratorija', @level2type=N'CONSTRAINT',@level2name=N'Laboratorija$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laboratorija].[LaboratorijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laboratorija', @level2type=N'INDEX',@level2name=N'Laboratorija$LaboratorijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Laboratorija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Laboratorija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[OsiguranoLice].[OsiguranoLiceID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OsiguranoLice', @level2type=N'COLUMN',@level2name=N'OsiguranoLiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[OsiguranoLice].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OsiguranoLice', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[OsiguranoLice].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OsiguranoLice', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[OsiguranoLice].[LBO]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OsiguranoLice', @level2type=N'COLUMN',@level2name=N'LBO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[OsiguranoLice].[KrvnaGrupa]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OsiguranoLice', @level2type=N'COLUMN',@level2name=N'KrvnaGrupa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[OsiguranoLice].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OsiguranoLice', @level2type=N'CONSTRAINT',@level2name=N'OsiguranoLice$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[OsiguranoLice].[OsiguranoLiceID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OsiguranoLice', @level2type=N'INDEX',@level2name=N'OsiguranoLice$OsiguranoLiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[OsiguranoLice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OsiguranoLice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[ZahtevID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'ZahtevID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[DatumVremeTestiranja]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'DatumVremeTestiranja'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[Hitno]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'Hitno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[Tip]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'Tip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[Rezultat]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'Rezultat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[DatumVremeRezultata]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'DatumVremeRezultata'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[Napomena]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'Napomena'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[OsiguranoLiceID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'OsiguranoLiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[LaboratorijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'LaboratorijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[LaborantID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'COLUMN',@level2name=N'LaborantID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'CONSTRAINT',@level2name=N'Zahtev$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[LaborantID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'INDEX',@level2name=N'Zahtev$LaborantID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[LaborantZahtev]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'INDEX',@level2name=N'Zahtev$LaborantZahtev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[LaboratorijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'INDEX',@level2name=N'Zahtev$LaboratorijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[LaboratorijaZahtev]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'INDEX',@level2name=N'Zahtev$LaboratorijaZahtev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[OsiguranoLiceID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'INDEX',@level2name=N'Zahtev$OsiguranoLiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[OsiguranoLiceZahtev]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'INDEX',@level2name=N'Zahtev$OsiguranoLiceZahtev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[RezultatID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'INDEX',@level2name=N'Zahtev$RezultatID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[LaborantZahtev]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'CONSTRAINT',@level2name=N'Zahtev$LaborantZahtev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[LaboratorijaZahtev]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'CONSTRAINT',@level2name=N'Zahtev$LaboratorijaZahtev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Septembar2020.[Zahtev].[OsiguranoLiceZahtev]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zahtev', @level2type=N'CONSTRAINT',@level2name=N'Zahtev$OsiguranoLiceZahtev'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Septembar2020] SET  READ_WRITE 
GO
