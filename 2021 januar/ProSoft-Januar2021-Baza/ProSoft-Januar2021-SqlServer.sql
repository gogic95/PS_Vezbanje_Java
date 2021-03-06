USE [master]
GO
/****** Object:  Database [ProSoft-Januar2021]    Script Date: 20-Jan-21 0:44:08 ******/
CREATE DATABASE [ProSoft-Januar2021]
GO
ALTER DATABASE [ProSoft-Januar2021] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Januar2021] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProSoft-Januar2021] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Januar2021] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Januar2021] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProSoft-Januar2021] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Januar2021] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Januar2021] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Januar2021] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Januar2021] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Januar2021] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Januar2021] SET QUERY_STORE = OFF
GO
USE [ProSoft-Januar2021]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Januar2021]
GO
/****** Object:  Table [dbo].[Paket]    Script Date: 20-Jan-21 0:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paket](
	[PaketID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](255) NULL,
	[Opis] [nvarchar](255) NULL,
	[Cena] [float] NOT NULL,
	[Aktivan] [bit] NULL,
 CONSTRAINT [Paket$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PaketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pretplatnik]    Script Date: 20-Jan-21 0:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pretplatnik](
	[PretplatnikID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
 CONSTRAINT [Pretplatnik$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PretplatnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ugovor]    Script Date: 20-Jan-21 0:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ugovor](
	[UgovorID] [int] IDENTITY(1,1) NOT NULL,
	[DatumEvidentiranja] [datetime] NULL,
	[VrstaUgovora] [nvarchar](255) NOT NULL,
	[DodatneUsluge] [bit] NULL,
	[Cena] [float] NULL,
	[PaketID] [int] NULL,
	[PretplatnikID] [int] NULL,
 CONSTRAINT [Ugovor$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[UgovorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Paket] ON 

INSERT [dbo].[Paket] ([PaketID], [Naziv], [Opis], [Cena], [Aktivan]) VALUES (1, N'Duo TV-NET', N'Televizija i Internet', 2599, 1)
INSERT [dbo].[Paket] ([PaketID], [Naziv], [Opis], [Cena], [Aktivan]) VALUES (2, N'Duo TV-TEL', N'Televizija i telefonija', 2399, 0)
INSERT [dbo].[Paket] ([PaketID], [Naziv], [Opis], [Cena], [Aktivan]) VALUES (3, N'Duo NET-TEL', N'Internet i telefonija', 2299, 1)
INSERT [dbo].[Paket] ([PaketID], [Naziv], [Opis], [Cena], [Aktivan]) VALUES (4, N'Trio TV-NET-TEL', N'Televizija, Internet i telefonija', 3199, 1)
INSERT [dbo].[Paket] ([PaketID], [Naziv], [Opis], [Cena], [Aktivan]) VALUES (5, N'Singl TV', N'Televizija', 1599, 1)
INSERT [dbo].[Paket] ([PaketID], [Naziv], [Opis], [Cena], [Aktivan]) VALUES (6, N'Singl NET', N'Internet', 1599, 1)
INSERT [dbo].[Paket] ([PaketID], [Naziv], [Opis], [Cena], [Aktivan]) VALUES (7, N'Singl TEL', N'Telefonija', 599, 1)
SET IDENTITY_INSERT [dbo].[Paket] OFF
SET IDENTITY_INSERT [dbo].[Pretplatnik] ON 

INSERT [dbo].[Pretplatnik] ([PretplatnikID], [Ime], [Prezime]) VALUES (1, N'Marko', N'Markovic')
INSERT [dbo].[Pretplatnik] ([PretplatnikID], [Ime], [Prezime]) VALUES (2, N'Dragana', N'Draganic')
INSERT [dbo].[Pretplatnik] ([PretplatnikID], [Ime], [Prezime]) VALUES (3, N'Ivan', N'Ivanic')
INSERT [dbo].[Pretplatnik] ([PretplatnikID], [Ime], [Prezime]) VALUES (4, N'Marija', N'Markovic')
INSERT [dbo].[Pretplatnik] ([PretplatnikID], [Ime], [Prezime]) VALUES (5, N'Petar', N'Petrovic')
INSERT [dbo].[Pretplatnik] ([PretplatnikID], [Ime], [Prezime]) VALUES (6, N'Dusanka', N'Dusanic')
INSERT [dbo].[Pretplatnik] ([PretplatnikID], [Ime], [Prezime]) VALUES (7, N'Jovan', N'Jovanovic')
INSERT [dbo].[Pretplatnik] ([PretplatnikID], [Ime], [Prezime]) VALUES (8, N'Ana', N'Anic')
SET IDENTITY_INSERT [dbo].[Pretplatnik] OFF
/****** Object:  Index [Paket$PaketID]    Script Date: 20-Jan-21 0:44:08 ******/
CREATE NONCLUSTERED INDEX [Paket$PaketID] ON [dbo].[Paket]
(
	[PaketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Pretplatnik$PretplatnikID]    Script Date: 20-Jan-21 0:44:08 ******/
CREATE NONCLUSTERED INDEX [Pretplatnik$PretplatnikID] ON [dbo].[Pretplatnik]
(
	[PretplatnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Ugovor$PaketID]    Script Date: 20-Jan-21 0:44:08 ******/
CREATE NONCLUSTERED INDEX [Ugovor$PaketID] ON [dbo].[Ugovor]
(
	[PaketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Ugovor$PaketUgovor]    Script Date: 20-Jan-21 0:44:08 ******/
CREATE NONCLUSTERED INDEX [Ugovor$PaketUgovor] ON [dbo].[Ugovor]
(
	[PaketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Ugovor$PretplatnikID]    Script Date: 20-Jan-21 0:44:08 ******/
CREATE NONCLUSTERED INDEX [Ugovor$PretplatnikID] ON [dbo].[Ugovor]
(
	[PretplatnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Ugovor$PretplatnikUgovor]    Script Date: 20-Jan-21 0:44:08 ******/
CREATE NONCLUSTERED INDEX [Ugovor$PretplatnikUgovor] ON [dbo].[Ugovor]
(
	[PretplatnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Ugovor$UgovorID]    Script Date: 20-Jan-21 0:44:08 ******/
CREATE NONCLUSTERED INDEX [Ugovor$UgovorID] ON [dbo].[Ugovor]
(
	[UgovorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Paket] ADD  DEFAULT ((0)) FOR [Cena]
GO
ALTER TABLE [dbo].[Paket] ADD  DEFAULT ((0)) FOR [Aktivan]
GO
ALTER TABLE [dbo].[Ugovor] ADD  CONSTRAINT [DF__Ugovor__DodatneU__2F10007B]  DEFAULT ((0)) FOR [DodatneUsluge]
GO
ALTER TABLE [dbo].[Ugovor] ADD  CONSTRAINT [DF__Ugovor__Cena__300424B4]  DEFAULT ((0)) FOR [Cena]
GO
ALTER TABLE [dbo].[Ugovor] ADD  CONSTRAINT [DF__Ugovor__PaketID__30F848ED]  DEFAULT ((0)) FOR [PaketID]
GO
ALTER TABLE [dbo].[Ugovor] ADD  CONSTRAINT [DF__Ugovor__Pretplat__31EC6D26]  DEFAULT ((0)) FOR [PretplatnikID]
GO
ALTER TABLE [dbo].[Ugovor]  WITH CHECK ADD  CONSTRAINT [Ugovor$PaketUgovor] FOREIGN KEY([PaketID])
REFERENCES [dbo].[Paket] ([PaketID])
GO
ALTER TABLE [dbo].[Ugovor] CHECK CONSTRAINT [Ugovor$PaketUgovor]
GO
ALTER TABLE [dbo].[Ugovor]  WITH CHECK ADD  CONSTRAINT [Ugovor$PretplatnikUgovor] FOREIGN KEY([PretplatnikID])
REFERENCES [dbo].[Pretplatnik] ([PretplatnikID])
GO
ALTER TABLE [dbo].[Ugovor] CHECK CONSTRAINT [Ugovor$PretplatnikUgovor]
GO
ALTER TABLE [dbo].[Paket]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paket$Naziv$disallow_zero_length] CHECK  ((len([Naziv])>(0)))
GO
ALTER TABLE [dbo].[Paket] CHECK CONSTRAINT [SSMA_CC$Paket$Naziv$disallow_zero_length]
GO
ALTER TABLE [dbo].[Paket]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paket$Opis$disallow_zero_length] CHECK  ((len([Opis])>(0)))
GO
ALTER TABLE [dbo].[Paket] CHECK CONSTRAINT [SSMA_CC$Paket$Opis$disallow_zero_length]
GO
ALTER TABLE [dbo].[Pretplatnik]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Pretplatnik$Ime$disallow_zero_length] CHECK  ((len([Ime])>(0)))
GO
ALTER TABLE [dbo].[Pretplatnik] CHECK CONSTRAINT [SSMA_CC$Pretplatnik$Ime$disallow_zero_length]
GO
ALTER TABLE [dbo].[Pretplatnik]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Pretplatnik$Prezime$disallow_zero_length] CHECK  ((len([Prezime])>(0)))
GO
ALTER TABLE [dbo].[Pretplatnik] CHECK CONSTRAINT [SSMA_CC$Pretplatnik$Prezime$disallow_zero_length]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Paket].[PaketID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paket', @level2type=N'COLUMN',@level2name=N'PaketID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Paket].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paket', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Paket].[Opis]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paket', @level2type=N'COLUMN',@level2name=N'Opis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Paket].[Cena]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paket', @level2type=N'COLUMN',@level2name=N'Cena'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Paket].[Aktivan]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paket', @level2type=N'COLUMN',@level2name=N'Aktivan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Paket].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paket', @level2type=N'CONSTRAINT',@level2name=N'Paket$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Paket].[PaketID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paket', @level2type=N'INDEX',@level2name=N'Paket$PaketID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Paket]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Pretplatnik].[PretplatnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pretplatnik', @level2type=N'COLUMN',@level2name=N'PretplatnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Pretplatnik].[Ime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pretplatnik', @level2type=N'COLUMN',@level2name=N'Ime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Pretplatnik].[Prezime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pretplatnik', @level2type=N'COLUMN',@level2name=N'Prezime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Pretplatnik].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pretplatnik', @level2type=N'CONSTRAINT',@level2name=N'Pretplatnik$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Pretplatnik].[PretplatnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pretplatnik', @level2type=N'INDEX',@level2name=N'Pretplatnik$PretplatnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Pretplatnik]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pretplatnik'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[UgovorID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'COLUMN',@level2name=N'UgovorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[DatumEvidentiranja]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'COLUMN',@level2name=N'DatumEvidentiranja'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[VrstaUgovora]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'COLUMN',@level2name=N'VrstaUgovora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[DodatneUsluge]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'COLUMN',@level2name=N'DodatneUsluge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[Cena]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'COLUMN',@level2name=N'Cena'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PaketID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'COLUMN',@level2name=N'PaketID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PretplatnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'COLUMN',@level2name=N'PretplatnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'CONSTRAINT',@level2name=N'Ugovor$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PaketID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'INDEX',@level2name=N'Ugovor$PaketID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PaketUgovor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'INDEX',@level2name=N'Ugovor$PaketUgovor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PretplatnikID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'INDEX',@level2name=N'Ugovor$PretplatnikID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PretplatnikUgovor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'INDEX',@level2name=N'Ugovor$PretplatnikUgovor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[UgovorID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'INDEX',@level2name=N'Ugovor$UgovorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PaketUgovor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'CONSTRAINT',@level2name=N'Ugovor$PaketUgovor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Januar2021.[Ugovor].[PretplatnikUgovor]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ugovor', @level2type=N'CONSTRAINT',@level2name=N'Ugovor$PretplatnikUgovor'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Januar2021] SET  READ_WRITE 
GO
