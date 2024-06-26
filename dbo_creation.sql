USE [master]
GO
/****** Object:  Database [dwh_project]    Script Date: 12.06.2023 16:36:54 ******/
CREATE DATABASE [dwh_project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dwh_project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dwh_project.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dwh_project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dwh_project_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dwh_project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dwh_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dwh_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dwh_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dwh_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dwh_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dwh_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [dwh_project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dwh_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dwh_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dwh_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dwh_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dwh_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dwh_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dwh_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dwh_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dwh_project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dwh_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dwh_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dwh_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dwh_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dwh_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dwh_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dwh_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dwh_project] SET RECOVERY FULL 
GO
ALTER DATABASE [dwh_project] SET  MULTI_USER 
GO
ALTER DATABASE [dwh_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dwh_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dwh_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dwh_project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dwh_project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dwh_project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dwh_project', N'ON'
GO
ALTER DATABASE [dwh_project] SET QUERY_STORE = OFF
GO
USE [dwh_project]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 12.06.2023 16:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[date_id] [int] NOT NULL,
	[calendar_date] [date] NOT NULL,
	[week_of_year] [int] NOT NULL,
	[quarter] [int] NOT NULL,
	[year] [int] NOT NULL,
	[month] [varchar](11) NOT NULL,
	[day_of_week] [varchar](12) NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEconomicProfile]    Script Date: 12.06.2023 16:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEconomicProfile](
	[economic_profile_id] [int] NOT NULL,
	[unemployment_rate] [float] NULL,
	[inflation] [float] NULL,
	[target_inflation_flag] [bit] NULL,
	[deflation_flag] [bit] NULL,
	[EU_flag] [bit] NULL,
 CONSTRAINT [PK_DimEconomicProfile] PRIMARY KEY CLUSTERED 
(
	[economic_profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGovernmentProfile]    Script Date: 12.06.2023 16:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGovernmentProfile](
	[government_profile_id] [int] NOT NULL,
	[ruling_party] [nvarchar](50) NOT NULL,
	[president_name] [nvarchar](60) NOT NULL,
	[prime_minister_name] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_DimGovernmentProfile] PRIMARY KEY CLUSTERED 
(
	[government_profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRegion]    Script Date: 12.06.2023 16:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRegion](
	[region_id] [int] NOT NULL,
	[municipality] [nvarchar](50) NOT NULL,
	[county] [nvarchar](50) NOT NULL,
	[voivodeship] [nvarchar](50) NOT NULL,
	[valid_from] [date] NOT NULL,
	[valid_to] [date] NOT NULL,
 CONSTRAINT [PK_DimRegion] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactEconomicDevelopment]    Script Date: 12.06.2023 16:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactEconomicDevelopment](
	[region_id] [int] NOT NULL,
	[date_id] [int] NOT NULL,
	[government_profile_id] [int] NOT NULL,
	[economic_profile_id] [int] NULL,
	[expenses_per_capita] [money] NOT NULL,
	[income_per_capita_start] [money] NOT NULL,
	[income_per_capita_end] [money] NOT NULL,
	[income_per_capita_change_absolute] [money] NOT NULL,
	[income_per_capita_change_relative] [float] NOT NULL,
	[number_of_new_apartments] [int] NOT NULL,
	[number_of_libraries] [int] NOT NULL,
	[unemployment_male] [int] NOT NULL,
	[unemployment_female] [int] NOT NULL,
	[id] [bigint] NOT NULL,
 CONSTRAINT [PK_FactEconomicDevelopment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactEUDonation]    Script Date: 12.06.2023 16:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactEUDonation](
	[id] [bigint] NOT NULL,
	[date_id] [int] NOT NULL,
	[region_id] [int] NOT NULL,
	[amount] [money] NOT NULL,
 CONSTRAINT [PK_FactEUDonation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactEconomicDevelopment]  WITH CHECK ADD  CONSTRAINT [FK_FactEconomicDevelopment_DimDate] FOREIGN KEY([date_id])
REFERENCES [dbo].[DimDate] ([date_id])
GO
ALTER TABLE [dbo].[FactEconomicDevelopment] CHECK CONSTRAINT [FK_FactEconomicDevelopment_DimDate]
GO
ALTER TABLE [dbo].[FactEconomicDevelopment]  WITH CHECK ADD  CONSTRAINT [FK_FactEconomicDevelopment_DimEconomicProfile] FOREIGN KEY([economic_profile_id])
REFERENCES [dbo].[DimEconomicProfile] ([economic_profile_id])
GO
ALTER TABLE [dbo].[FactEconomicDevelopment] CHECK CONSTRAINT [FK_FactEconomicDevelopment_DimEconomicProfile]
GO
ALTER TABLE [dbo].[FactEconomicDevelopment]  WITH CHECK ADD  CONSTRAINT [FK_FactEconomicDevelopment_DimGovernmentProfile] FOREIGN KEY([government_profile_id])
REFERENCES [dbo].[DimGovernmentProfile] ([government_profile_id])
GO
ALTER TABLE [dbo].[FactEconomicDevelopment] CHECK CONSTRAINT [FK_FactEconomicDevelopment_DimGovernmentProfile]
GO
ALTER TABLE [dbo].[FactEconomicDevelopment]  WITH CHECK ADD  CONSTRAINT [FK_FactEconomicDevelopment_DimRegion] FOREIGN KEY([region_id])
REFERENCES [dbo].[DimRegion] ([region_id])
GO
ALTER TABLE [dbo].[FactEconomicDevelopment] CHECK CONSTRAINT [FK_FactEconomicDevelopment_DimRegion]
GO
ALTER TABLE [dbo].[FactEUDonation]  WITH CHECK ADD  CONSTRAINT [FK_FactEUDonation_DimDate] FOREIGN KEY([date_id])
REFERENCES [dbo].[DimDate] ([date_id])
GO
ALTER TABLE [dbo].[FactEUDonation] CHECK CONSTRAINT [FK_FactEUDonation_DimDate]
GO
ALTER TABLE [dbo].[FactEUDonation]  WITH CHECK ADD  CONSTRAINT [FK_FactEUDonation_DimRegion] FOREIGN KEY([region_id])
REFERENCES [dbo].[DimRegion] ([region_id])
GO
ALTER TABLE [dbo].[FactEUDonation] CHECK CONSTRAINT [FK_FactEUDonation_DimRegion]
GO
USE [master]
GO
ALTER DATABASE [dwh_project] SET  READ_WRITE 
GO
