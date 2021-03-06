USE [master]
GO
/****** Object:  Database [ProSoft-Mart2020]    Script Date: 31-May-20 22:05:06 ******/
CREATE DATABASE [ProSoft-Mart2020]

GO
ALTER DATABASE [ProSoft-Mart2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProSoft-Mart2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProSoft-Mart2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProSoft-Mart2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProSoft-Mart2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProSoft-Mart2020] SET  MULTI_USER 
GO
ALTER DATABASE [ProSoft-Mart2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProSoft-Mart2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProSoft-Mart2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProSoft-Mart2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProSoft-Mart2020] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProSoft-Mart2020] SET QUERY_STORE = OFF
GO
USE [ProSoft-Mart2020]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProSoft-Mart2020]
GO
/****** Object:  Table [dbo].[Izdanje]    Script Date: 31-May-20 22:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Izdanje](
	[IzdanjeID] [int] NOT NULL,
	[Datum] [datetime] NULL,
	[Broj] [int] NULL,
	[PublikacijaID] [int] NULL,
 CONSTRAINT [Izdanje$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[IzdanjeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publikacija]    Script Date: 31-May-20 22:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publikacija](
	[PublikacijaID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
 CONSTRAINT [Publikacija$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PublikacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vest]    Script Date: 31-May-20 22:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vest](
	[IzdanjeID] [int] NOT NULL,
	[RB] [int] NOT NULL,
	[Naslov] [nvarchar](255) NULL,
	[Tekst] [nvarchar](255) NULL,
 CONSTRAINT [Vest$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[IzdanjeID] ASC,
	[RB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Publikacija] ([PublikacijaID], [Naziv]) VALUES (1, N'Sportski zurnal')
INSERT [dbo].[Publikacija] ([PublikacijaID], [Naziv]) VALUES (2, N'Politika')
INSERT [dbo].[Publikacija] ([PublikacijaID], [Naziv]) VALUES (3, N'Danas')
INSERT [dbo].[Publikacija] ([PublikacijaID], [Naziv]) VALUES (4, N'Blic')
INSERT [dbo].[Publikacija] ([PublikacijaID], [Naziv]) VALUES (5, N'Bazar')
INSERT [dbo].[Publikacija] ([PublikacijaID], [Naziv]) VALUES (6, N'Politikin Zabavnik')
/****** Object:  Index [Izdanje$IzdanjeID]    Script Date: 31-May-20 22:05:06 ******/
CREATE NONCLUSTERED INDEX [Izdanje$IzdanjeID] ON [dbo].[Izdanje]
(
	[IzdanjeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Izdanje$PublikacijaID]    Script Date: 31-May-20 22:05:06 ******/
CREATE NONCLUSTERED INDEX [Izdanje$PublikacijaID] ON [dbo].[Izdanje]
(
	[PublikacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Izdanje$PublikacijaIzdanje]    Script Date: 31-May-20 22:05:06 ******/
CREATE NONCLUSTERED INDEX [Izdanje$PublikacijaIzdanje] ON [dbo].[Izdanje]
(
	[PublikacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Publikacija$PublikacijaID]    Script Date: 31-May-20 22:05:06 ******/
CREATE NONCLUSTERED INDEX [Publikacija$PublikacijaID] ON [dbo].[Publikacija]
(
	[PublikacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Vest$IzdanjeID]    Script Date: 31-May-20 22:05:06 ******/
CREATE NONCLUSTERED INDEX [Vest$IzdanjeID] ON [dbo].[Vest]
(
	[IzdanjeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Vest$IzdanjeVest]    Script Date: 31-May-20 22:05:06 ******/
CREATE NONCLUSTERED INDEX [Vest$IzdanjeVest] ON [dbo].[Vest]
(
	[IzdanjeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Vest$VestID]    Script Date: 31-May-20 22:05:06 ******/
CREATE NONCLUSTERED INDEX [Vest$VestID] ON [dbo].[Vest]
(
	[RB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Izdanje]  WITH CHECK ADD  CONSTRAINT [Izdanje$PublikacijaIzdanje] FOREIGN KEY([PublikacijaID])
REFERENCES [dbo].[Publikacija] ([PublikacijaID])
GO
ALTER TABLE [dbo].[Izdanje] CHECK CONSTRAINT [Izdanje$PublikacijaIzdanje]
GO
ALTER TABLE [dbo].[Vest]  WITH CHECK ADD  CONSTRAINT [Vest$IzdanjeVest] FOREIGN KEY([IzdanjeID])
REFERENCES [dbo].[Izdanje] ([IzdanjeID])
GO
ALTER TABLE [dbo].[Vest] CHECK CONSTRAINT [Vest$IzdanjeVest]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[IzdanjeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'COLUMN',@level2name=N'IzdanjeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[Datum]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[Broj]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'COLUMN',@level2name=N'Broj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[PublikacijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'COLUMN',@level2name=N'PublikacijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'CONSTRAINT',@level2name=N'Izdanje$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[IzdanjeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'INDEX',@level2name=N'Izdanje$IzdanjeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[PublikacijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'INDEX',@level2name=N'Izdanje$PublikacijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[PublikacijaIzdanje]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'INDEX',@level2name=N'Izdanje$PublikacijaIzdanje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Izdanje].[PublikacijaIzdanje]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Izdanje', @level2type=N'CONSTRAINT',@level2name=N'Izdanje$PublikacijaIzdanje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Publikacija].[PublikacijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Publikacija', @level2type=N'COLUMN',@level2name=N'PublikacijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Publikacija].[Naziv]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Publikacija', @level2type=N'COLUMN',@level2name=N'Naziv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Publikacija].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Publikacija', @level2type=N'CONSTRAINT',@level2name=N'Publikacija$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Publikacija].[PublikacijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Publikacija', @level2type=N'INDEX',@level2name=N'Publikacija$PublikacijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Publikacija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Publikacija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[IzdanjeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'COLUMN',@level2name=N'IzdanjeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[RB]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'COLUMN',@level2name=N'RB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[Naslov]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'COLUMN',@level2name=N'Naslov'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[Tekst]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'COLUMN',@level2name=N'Tekst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'CONSTRAINT',@level2name=N'Vest$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[IzdanjeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'INDEX',@level2name=N'Vest$IzdanjeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[IzdanjeVest]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'INDEX',@level2name=N'Vest$IzdanjeVest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[VestID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'INDEX',@level2name=N'Vest$VestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Mart2020.[Vest].[IzdanjeVest]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vest', @level2type=N'CONSTRAINT',@level2name=N'Vest$IzdanjeVest'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Mart2020] SET  READ_WRITE 
GO
