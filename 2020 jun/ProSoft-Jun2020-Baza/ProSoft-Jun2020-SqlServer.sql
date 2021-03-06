USE [master]
GO
/****** Object:  Database [ProSoft-Jun2020]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE DATABASE [ProSoft-Jun2020]
GO
ALTER DATABASE [ProSoft-Jun2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Jun2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProSoft-Jun2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Jun2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Jun2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProSoft-Jun2020] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Jun2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Jun2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Jun2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Jun2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Jun2020] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Jun2020] SET QUERY_STORE = OFF
GO
USE [ProSoft-Jun2020]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Jun2020]
GO
/****** Object:  Table [dbo].[Banka]    Script Date: 22-Jun-20 20:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banka](
	[BankaID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
	[Adresa] [nvarchar](255) NULL,
	[JedinstveniBrojPlatnogPrometa] [int] NULL,
 CONSTRAINT [Banka$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[BankaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kompanija]    Script Date: 22-Jun-20 20:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kompanija](
	[KompanijaID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
	[TipKompanije] [nvarchar](255) NULL,
	[PDVObveznik] [bit] NULL,
	[MaticniBroj] [nvarchar](255) NULL,
	[DatumVremeEvidentiranja] [datetime] NULL,
	[BrojZaposlenih] [int] NULL,
	[KorisnikID] [int] NULL,
 CONSTRAINT [Kompanija$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[KompanijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 22-Jun-20 20:28:59 ******/
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
/****** Object:  Table [dbo].[Zaposleni]    Script Date: 22-Jun-20 20:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposleni](
	[ZaposleniID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
	[JMBG] [nvarchar](255) NULL,
	[ZiroRacun] [nvarchar](255) NULL,
	[Iznos] [float] NULL,
	[KompanijaID] [int] NULL,
	[BankaID] [int] NULL,
 CONSTRAINT [Zaposleni$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ZaposleniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Banka] ([BankaID], [Naziv], [Adresa], [JedinstveniBrojPlatnogPrometa]) VALUES (1, N'Banka Postanska Stedionica', N'Kraljice Marije 3, Beograd', 200)
INSERT [dbo].[Banka] ([BankaID], [Naziv], [Adresa], [JedinstveniBrojPlatnogPrometa]) VALUES (2, N'Komercijalna Banka', N'Svetog Save 14, Beograd', 205)
INSERT [dbo].[Banka] ([BankaID], [Naziv], [Adresa], [JedinstveniBrojPlatnogPrometa]) VALUES (3, N'Raiffeisen Bank', N'Djordja Stanojevica 16, Novi Beograd', 265)
INSERT [dbo].[Banka] ([BankaID], [Naziv], [Adresa], [JedinstveniBrojPlatnogPrometa]) VALUES (4, N'Banca Intesa', N'Milentija Popovica 7b, Novi Beograd', 160)
INSERT [dbo].[Banka] ([BankaID], [Naziv], [Adresa], [JedinstveniBrojPlatnogPrometa]) VALUES (5, N'Mobi Banka', N'Omladinskih Brigada 88, Novi Beograd', 115)
INSERT [dbo].[Banka] ([BankaID], [Naziv], [Adresa], [JedinstveniBrojPlatnogPrometa]) VALUES (6, N'UniCredit Bank', N'Rajiceva 27-29', 170)
INSERT [dbo].[Korisnik] ([KorisnikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (1, N'Ivana', N'Ivanovic', N'ivana', N'ivana123')
INSERT [dbo].[Korisnik] ([KorisnikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (2, N'Dragan', N'Draganic', N'dragan', N'dragan123')
INSERT [dbo].[Korisnik] ([KorisnikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (3, N'Jovana', N'Jovanic', N'jovana', N'jovana123')
INSERT [dbo].[Korisnik] ([KorisnikID], [Ime], [Prezime], [KorisnickoIme], [Lozinka]) VALUES (4, N'Petar', N'Petrovic', N'petar', N'petar123')
/****** Object:  Index [Banka$BankaID]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Banka$BankaID] ON [dbo].[Banka]
(
	[BankaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Kompanija$KompanijaID]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Kompanija$KompanijaID] ON [dbo].[Kompanija]
(
	[KompanijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Kompanija$KorisnikID]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Kompanija$KorisnikID] ON [dbo].[Kompanija]
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Kompanija$KorisnikKompanija]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Kompanija$KorisnikKompanija] ON [dbo].[Kompanija]
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Korisnik$KorisnikID]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Korisnik$KorisnikID] ON [dbo].[Korisnik]
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zaposleni$BankaID]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Zaposleni$BankaID] ON [dbo].[Zaposleni]
(
	[KompanijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zaposleni$BankaZaposleni]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Zaposleni$BankaZaposleni] ON [dbo].[Zaposleni]
(
	[BankaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zaposleni$KompanijaZaposleni]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Zaposleni$KompanijaZaposleni] ON [dbo].[Zaposleni]
(
	[KompanijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zaposleni$ZaposleniID]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Zaposleni$ZaposleniID] ON [dbo].[Zaposleni]
(
	[ZaposleniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Zaposleni$ZaposleniID1]    Script Date: 22-Jun-20 20:28:59 ******/
CREATE NONCLUSTERED INDEX [Zaposleni$ZaposleniID1] ON [dbo].[Zaposleni]
(
	[BankaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banka] ADD  DEFAULT ((0)) FOR [BankaID]
GO
ALTER TABLE [dbo].[Banka] ADD  DEFAULT ((0)) FOR [JedinstveniBrojPlatnogPrometa]
GO
ALTER TABLE [dbo].[Kompanija] ADD  CONSTRAINT [DF__Kompanija__Kompa__2E1BDC42]  DEFAULT ((0)) FOR [KompanijaID]
GO
ALTER TABLE [dbo].[Kompanija] ADD  CONSTRAINT [DF__Kompanija__PDVOb__2F10007B]  DEFAULT ((0)) FOR [PDVObveznik]
GO
ALTER TABLE [dbo].[Kompanija] ADD  CONSTRAINT [DF__Kompanija__BrojZ__300424B4]  DEFAULT ((0)) FOR [BrojZaposlenih]
GO
ALTER TABLE [dbo].[Kompanija] ADD  CONSTRAINT [DF__Kompanija__Koris__30F848ED]  DEFAULT ((0)) FOR [KorisnikID]
GO
ALTER TABLE [dbo].[Korisnik] ADD  DEFAULT ((0)) FOR [KorisnikID]
GO
ALTER TABLE [dbo].[Zaposleni] ADD  DEFAULT ((0)) FOR [Iznos]
GO
ALTER TABLE [dbo].[Zaposleni] ADD  DEFAULT ((0)) FOR [KompanijaID]
GO
ALTER TABLE [dbo].[Zaposleni] ADD  DEFAULT ((0)) FOR [BankaID]
GO
ALTER TABLE [dbo].[Kompanija]  WITH CHECK ADD  CONSTRAINT [Kompanija$KorisnikKompanija] FOREIGN KEY([KorisnikID])
REFERENCES [dbo].[Korisnik] ([KorisnikID])
GO
ALTER TABLE [dbo].[Kompanija] CHECK CONSTRAINT [Kompanija$KorisnikKompanija]
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [Zaposleni$BankaZaposleni] FOREIGN KEY([BankaID])
REFERENCES [dbo].[Banka] ([BankaID])
GO
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [Zaposleni$BankaZaposleni]
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [Zaposleni$KompanijaZaposleni] FOREIGN KEY([KompanijaID])
REFERENCES [dbo].[Kompanija] ([KompanijaID])
GO
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [Zaposleni$KompanijaZaposleni]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Banka].[BankaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banka', @level2type=N'COLUMN',@level2name=N'BankaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Banka].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banka', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Banka].[Adresa]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banka', @level2type=N'COLUMN',@level2name=N'Adresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Banka].[JedinstveniBrojPlatnogPrometa]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banka', @level2type=N'COLUMN',@level2name=N'JedinstveniBrojPlatnogPrometa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Banka].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banka', @level2type=N'CONSTRAINT',@level2name=N'Banka$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Banka].[BankaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banka', @level2type=N'INDEX',@level2name=N'Banka$BankaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Banka]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banka'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[KompanijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'COLUMN',@level2name=N'KompanijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[TipKompanije]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'COLUMN',@level2name=N'TipKompanije'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[PDVObveznik]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'COLUMN',@level2name=N'PDVObveznik'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[MaticniBroj]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'COLUMN',@level2name=N'MaticniBroj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[DatumVremeEvidentiranja]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'COLUMN',@level2name=N'DatumVremeEvidentiranja'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[BrojZaposlenih]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'COLUMN',@level2name=N'BrojZaposlenih'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'COLUMN',@level2name=N'KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'CONSTRAINT',@level2name=N'Kompanija$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[KompanijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'INDEX',@level2name=N'Kompanija$KompanijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'INDEX',@level2name=N'Kompanija$KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[KorisnikKompanija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'INDEX',@level2name=N'Kompanija$KorisnikKompanija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Kompanija].[KorisnikKompanija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kompanija', @level2type=N'CONSTRAINT',@level2name=N'Kompanija$KorisnikKompanija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Korisnik].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Korisnik].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Korisnik].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Korisnik].[KorisnickoIme]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'KorisnickoIme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Korisnik].[Lozinka]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'COLUMN',@level2name=N'Lozinka'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Korisnik].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'CONSTRAINT',@level2name=N'Korisnik$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Korisnik].[KorisnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik', @level2type=N'INDEX',@level2name=N'Korisnik$KorisnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Korisnik]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Korisnik'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[ZaposleniID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'COLUMN',@level2name=N'ZaposleniID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[JMBG]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'COLUMN',@level2name=N'JMBG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[ZiroRacun]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'COLUMN',@level2name=N'ZiroRacun'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[Iznos]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'COLUMN',@level2name=N'Iznos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[KompanijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'COLUMN',@level2name=N'KompanijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[BankaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'COLUMN',@level2name=N'BankaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'CONSTRAINT',@level2name=N'Zaposleni$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[BankaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'INDEX',@level2name=N'Zaposleni$BankaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[BankaZaposleni]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'INDEX',@level2name=N'Zaposleni$BankaZaposleni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[KompanijaZaposleni]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'INDEX',@level2name=N'Zaposleni$KompanijaZaposleni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[ZaposleniID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'INDEX',@level2name=N'Zaposleni$ZaposleniID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[ZaposleniID1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'INDEX',@level2name=N'Zaposleni$ZaposleniID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[BankaZaposleni]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'CONSTRAINT',@level2name=N'Zaposleni$BankaZaposleni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2020.[Zaposleni].[KompanijaZaposleni]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Zaposleni', @level2type=N'CONSTRAINT',@level2name=N'Zaposleni$KompanijaZaposleni'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Jun2020] SET  READ_WRITE 
GO
