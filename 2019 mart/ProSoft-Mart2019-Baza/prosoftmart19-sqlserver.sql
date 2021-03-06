USE master
IF EXISTS(select * from sys.databases where name='Mart2019')
DROP DATABASE [Mart2019];
GO
CREATE DATABASE [Mart2019];
GO
ALTER AUTHORIZATION ON DATABASE::[Mart2019] TO sa
GO
USE [Mart2019]
GO
ALTER DATABASE [Mart2019] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mart2019].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mart2019] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mart2019] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mart2019] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mart2019] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mart2019] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mart2019] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mart2019] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mart2019] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mart2019] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mart2019] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mart2019] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mart2019] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mart2019] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mart2019] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mart2019] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mart2019] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mart2019] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mart2019] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mart2019] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mart2019] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mart2019] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mart2019] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mart2019] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Mart2019] SET  MULTI_USER 
GO
ALTER DATABASE [Mart2019] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mart2019] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mart2019] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mart2019] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mart2019] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mart2019] SET QUERY_STORE = OFF
GO
USE [Mart2019]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Mart2019]
GO
/****** Object:  Table [dbo].[Advokat]    Script Date: 22-Mar-19 12:31:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advokat](
	[AdvokatID] [int] NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
	[SpecijalnostZaVrstuPostupka] [int] NULL,
 CONSTRAINT [PK_Advokat] PRIMARY KEY CLUSTERED 
(
	[AdvokatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klijent]    Script Date: 22-Mar-19 12:31:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klijent](
	[KlijentID] [int] NOT NULL,
	[Ime] [nvarchar](255) NULL,
	[Prezime] [nvarchar](255) NULL,
	[Telefon] [nvarchar](255) NULL,
	[ElPosta] [nvarchar](255) NULL,
	[Adresa] [nvarchar](255) NULL,
 CONSTRAINT [PK_Klijent] PRIMARY KEY CLUSTERED 
(
	[KlijentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Predmet]    Script Date: 22-Mar-19 12:31:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predmet](
	[PredmetID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
	[Problem] [nvarchar](255) NULL,
	[Datum] [datetime] NULL,
	[AdvokatID] [int] NULL,
	[KlijentID] [int] NULL,
	[VrstaPostupkaID] [int] NULL,
 CONSTRAINT [PK_Predmet] PRIMARY KEY CLUSTERED 
(
	[PredmetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrstaPostupka]    Script Date: 22-Mar-19 12:31:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaPostupka](
	[VrstaPostukaID] [int] NOT NULL,
	[Naziv] [nvarchar](255) NULL,
 CONSTRAINT [PK_VrstaPostupka] PRIMARY KEY CLUSTERED 
(
	[VrstaPostukaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Advokat] ([AdvokatID], [Ime], [Prezime], [SpecijalnostZaVrstuPostupka]) VALUES (1, N'Ivana', N'Ivanovic', 1)
INSERT [dbo].[Advokat] ([AdvokatID], [Ime], [Prezime], [SpecijalnostZaVrstuPostupka]) VALUES (2, N'Borivoje', N'Boric', 2)
INSERT [dbo].[Advokat] ([AdvokatID], [Ime], [Prezime], [SpecijalnostZaVrstuPostupka]) VALUES (3, N'Dragana', N'Draganic', 1)
INSERT [dbo].[Klijent] ([KlijentID], [Ime], [Prezime], [Telefon], [ElPosta], [Adresa]) VALUES (1, N'Marko', N'Markovic', N'0113950800', N'test1@fon.rs', N'Adresa 1')
INSERT [dbo].[Klijent] ([KlijentID], [Ime], [Prezime], [Telefon], [ElPosta], [Adresa]) VALUES (2, N'Jovana', N'Jovanic', N'0113950801', N'test2@fon.rs', N'Adresa 2')
INSERT [dbo].[VrstaPostupka] ([VrstaPostukaID], [Naziv]) VALUES (1, N'Parnicni postupak')
INSERT [dbo].[VrstaPostupka] ([VrstaPostukaID], [Naziv]) VALUES (2, N'Vanparnicni postupak')
INSERT [dbo].[VrstaPostupka] ([VrstaPostukaID], [Naziv]) VALUES (3, N'Izvrsni postupak')
INSERT [dbo].[VrstaPostupka] ([VrstaPostukaID], [Naziv]) VALUES (4, N'Upravni spor')
INSERT [dbo].[VrstaPostupka] ([VrstaPostukaID], [Naziv]) VALUES (5, N'Krivicni postupak')
INSERT [dbo].[VrstaPostupka] ([VrstaPostukaID], [Naziv]) VALUES (6, N'Prekrsajni postupak')
ALTER TABLE [dbo].[Advokat]  WITH CHECK ADD  CONSTRAINT [FK_Advokat_VrstaPostupka] FOREIGN KEY([SpecijalnostZaVrstuPostupka])
REFERENCES [dbo].[VrstaPostupka] ([VrstaPostukaID])
GO
ALTER TABLE [dbo].[Advokat] CHECK CONSTRAINT [FK_Advokat_VrstaPostupka]
GO
ALTER TABLE [dbo].[Predmet]  WITH CHECK ADD  CONSTRAINT [FK_Predmet_Advokat] FOREIGN KEY([AdvokatID])
REFERENCES [dbo].[Advokat] ([AdvokatID])
GO
ALTER TABLE [dbo].[Predmet] CHECK CONSTRAINT [FK_Predmet_Advokat]
GO
ALTER TABLE [dbo].[Predmet]  WITH CHECK ADD  CONSTRAINT [FK_Predmet_Klijent] FOREIGN KEY([KlijentID])
REFERENCES [dbo].[Klijent] ([KlijentID])
GO
ALTER TABLE [dbo].[Predmet] CHECK CONSTRAINT [FK_Predmet_Klijent]
GO
ALTER TABLE [dbo].[Predmet]  WITH CHECK ADD  CONSTRAINT [FK_Predmet_VrstaPostupka] FOREIGN KEY([VrstaPostupkaID])
REFERENCES [dbo].[VrstaPostupka] ([VrstaPostukaID])
GO
ALTER TABLE [dbo].[Predmet] CHECK CONSTRAINT [FK_Predmet_VrstaPostupka]
GO
USE [master]
GO
ALTER DATABASE [Mart2019] SET  READ_WRITE 
GO
