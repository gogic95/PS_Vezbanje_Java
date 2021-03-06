USE [master]
GO
USE master
IF EXISTS(select * from sys.databases where name='ProSoft-Jun2019')
DROP DATABASE [ProSoft-Jun2019];
GO
CREATE DATABASE [ProSoft-Jun2019];
GO
ALTER AUTHORIZATION ON DATABASE::[ProSoft-Jun2019] TO sa
GO

USE [ProSoft-Jun2019]
GO
CREATE TABLE [dbo].[Linija](
	[LinijaID] [int] IDENTITY(1,1) NOT NULL,
	[NazivLinije] [nvarchar](255) NULL,
	[PocetnaStanica] [int] NULL,
	[KrajnjaStanica] [int] NULL,
 CONSTRAINT [Linija$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[LinijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinijaStanica](
	[LinijaID] [int] NOT NULL,
	[StanicaID] [int] NOT NULL,
 CONSTRAINT [LinijaStanica$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[LinijaID] ASC,
	[StanicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stanica](
	[StanicaID] [int] NOT NULL,
	[NazivStanice] [nvarchar](255) NULL,
 CONSTRAINT [Stanica$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[StanicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Linija] ON 

INSERT [dbo].[Linija] ([LinijaID], [NazivLinije], [PocetnaStanica], [KrajnjaStanica]) VALUES (1, N'Beograd-Banja Koviljaca', 1, 4)
SET IDENTITY_INSERT [dbo].[Linija] OFF
INSERT [dbo].[LinijaStanica] ([LinijaID], [StanicaID]) VALUES (1, 2)
INSERT [dbo].[LinijaStanica] ([LinijaID], [StanicaID]) VALUES (1, 3)
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (1, N'Beograd')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (2, N'Sabac')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (3, N'Loznica')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (4, N'Banja Koviljaca')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (5, N'Smederevo')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (6, N'Nis')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (7, N'Zlatibor')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (8, N'Uzice')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (9, N'Cacak')
INSERT [dbo].[Stanica] ([StanicaID], [NazivStanice]) VALUES (10, N'Kragujevac')
CREATE NONCLUSTERED INDEX [Linija$LinijaID] ON [dbo].[Linija]
(
	[LinijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Linija$TStanicaTLinija] ON [dbo].[Linija]
(
	[PocetnaStanica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Linija$TStanicaTLinija1] ON [dbo].[Linija]
(
	[KrajnjaStanica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LinijaStanica$LinijaLinijaStanica] ON [dbo].[LinijaStanica]
(
	[LinijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LinijaStanica$StanicaID] ON [dbo].[LinijaStanica]
(
	[StanicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LinijaStanica$StanicaLinijaStanica] ON [dbo].[LinijaStanica]
(
	[StanicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Linija]  WITH NOCHECK ADD  CONSTRAINT [Linija$TStanicaTLinija] FOREIGN KEY([PocetnaStanica])
REFERENCES [dbo].[Stanica] ([StanicaID])
GO
ALTER TABLE [dbo].[Linija] CHECK CONSTRAINT [Linija$TStanicaTLinija]
GO
ALTER TABLE [dbo].[Linija]  WITH NOCHECK ADD  CONSTRAINT [Linija$TStanicaTLinija1] FOREIGN KEY([KrajnjaStanica])
REFERENCES [dbo].[Stanica] ([StanicaID])
GO
ALTER TABLE [dbo].[Linija] CHECK CONSTRAINT [Linija$TStanicaTLinija1]
GO
ALTER TABLE [dbo].[LinijaStanica]  WITH NOCHECK ADD  CONSTRAINT [LinijaStanica$LinijaLinijaStanica] FOREIGN KEY([LinijaID])
REFERENCES [dbo].[Linija] ([LinijaID])
GO
ALTER TABLE [dbo].[LinijaStanica] CHECK CONSTRAINT [LinijaStanica$LinijaLinijaStanica]
GO
ALTER TABLE [dbo].[LinijaStanica]  WITH NOCHECK ADD  CONSTRAINT [LinijaStanica$StanicaLinijaStanica] FOREIGN KEY([StanicaID])
REFERENCES [dbo].[Stanica] ([StanicaID])
GO
ALTER TABLE [dbo].[LinijaStanica] CHECK CONSTRAINT [LinijaStanica$StanicaLinijaStanica]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[LinijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'COLUMN',@level2name=N'LinijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[NazivLinije]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'COLUMN',@level2name=N'NazivLinije'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[PocetnaStanica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'COLUMN',@level2name=N'PocetnaStanica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[KrajnjaStanica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'COLUMN',@level2name=N'KrajnjaStanica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'CONSTRAINT',@level2name=N'Linija$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[LinijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'INDEX',@level2name=N'Linija$LinijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[TStanicaTLinija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'INDEX',@level2name=N'Linija$TStanicaTLinija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[TStanicaTLinija1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'INDEX',@level2name=N'Linija$TStanicaTLinija1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[TStanicaTLinija]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'CONSTRAINT',@level2name=N'Linija$TStanicaTLinija'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Linija].[TStanicaTLinija1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Linija', @level2type=N'CONSTRAINT',@level2name=N'Linija$TStanicaTLinija1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica].[LinijaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica', @level2type=N'COLUMN',@level2name=N'LinijaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica].[StanicaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica', @level2type=N'COLUMN',@level2name=N'StanicaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica', @level2type=N'CONSTRAINT',@level2name=N'LinijaStanica$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica].[LinijaLinijaStanica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica', @level2type=N'INDEX',@level2name=N'LinijaStanica$LinijaLinijaStanica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica].[StanicaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica', @level2type=N'INDEX',@level2name=N'LinijaStanica$StanicaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica].[StanicaLinijaStanica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica', @level2type=N'INDEX',@level2name=N'LinijaStanica$StanicaLinijaStanica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica].[LinijaLinijaStanica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica', @level2type=N'CONSTRAINT',@level2name=N'LinijaStanica$LinijaLinijaStanica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[LinijaStanica].[StanicaLinijaStanica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LinijaStanica', @level2type=N'CONSTRAINT',@level2name=N'LinijaStanica$StanicaLinijaStanica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Stanica].[StanicaID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stanica', @level2type=N'COLUMN',@level2name=N'StanicaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Stanica].[NazivStanice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stanica', @level2type=N'COLUMN',@level2name=N'NazivStanice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Stanica].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stanica', @level2type=N'CONSTRAINT',@level2name=N'Stanica$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'ProSoft-Jun2019.[Stanica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stanica'
GO
USE [master]
GO
ALTER DATABASE [ProSoft-Jun2019] SET  READ_WRITE 
GO
