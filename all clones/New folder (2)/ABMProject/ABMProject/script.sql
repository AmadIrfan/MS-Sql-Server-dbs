USE [master]
GO
/****** Object:  Database [ABMBank]    Script Date: 29/04/2023 12:05:46 am ******/
CREATE DATABASE [ABMBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ABMBank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ABMBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ABMBank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ABMBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ABMBank] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ABMBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ABMBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ABMBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ABMBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ABMBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ABMBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [ABMBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ABMBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ABMBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ABMBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ABMBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ABMBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ABMBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ABMBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ABMBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ABMBank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ABMBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ABMBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ABMBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ABMBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ABMBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ABMBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ABMBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ABMBank] SET RECOVERY FULL 
GO
ALTER DATABASE [ABMBank] SET  MULTI_USER 
GO
ALTER DATABASE [ABMBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ABMBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ABMBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ABMBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ABMBank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ABMBank] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ABMBank', N'ON'
GO
ALTER DATABASE [ABMBank] SET QUERY_STORE = ON
GO
ALTER DATABASE [ABMBank] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ABMBank]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accountId] [int] NOT NULL,
	[accountName] [varchar](40) NULL,
	[accountTypeId] [int] NOT NULL,
	[customerId] [int] NOT NULL,
	[Amounts] [real] NOT NULL,
	[dateOpened] [datetime] NOT NULL,
	[accountNumber] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[accountType] [int] IDENTITY(1,1) NOT NULL,
	[accountTypeName] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beneficiary]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NULL,
	[beneficiaryName] [varchar](20) NOT NULL,
	[accountNumber] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](max) NOT NULL,
	[customerTypeId] [int] NOT NULL,
	[uid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomersType]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersType](
	[customerTypeId] [int] IDENTITY(1,1) NOT NULL,
	[customerTypeDescription] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[customerTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[emailId] [int] IDENTITY(1,1) NOT NULL,
	[emailFrom] [varchar](50) NOT NULL,
	[emailTo] [varchar](50) NOT NULL,
	[text] [varchar](max) NOT NULL,
	[userId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[employeeTypeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeTypeName] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[reviewId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](10) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[reating] [real] NOT NULL,
	[customerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[transactionsId] [int] NOT NULL,
	[amountOfTransactions] [real] NOT NULL,
	[transactionsTypeId] [int] NOT NULL,
	[date] [timestamp] NOT NULL,
	[accountId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transactionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionsType]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionsType](
	[transactionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionTypeName] [varchar](10) NOT NULL,
	[accountTypeDEscription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[transactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](15) NULL,
	[lastName] [nvarchar](15) NULL,
	[address] [nvarchar](100) NULL,
	[createDate] [datetime] NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[phoneNumbers] [nvarchar](15) NULL,
	[uId] [nvarchar](max) NOT NULL,
	[userTypeId] [int] NOT NULL,
	[dateOfBirth] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 29/04/2023 12:05:46 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[userTypeId] [int] IDENTITY(1,1) NOT NULL,
	[userTypeName] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([accountId], [accountName], [accountTypeId], [customerId], [Amounts], [dateOpened], [accountNumber]) VALUES (1, N'a', 1, 12, 12000, CAST(N'2023-04-28T00:00:00.000' AS DateTime), N'98671234125432')
INSERT [dbo].[Accounts] ([accountId], [accountName], [accountTypeId], [customerId], [Amounts], [dateOpened], [accountNumber]) VALUES (32, N'asassa', 1, 20, 10000, CAST(N'2023-04-28T23:52:03.797' AS DateTime), N'98673755319375')
INSERT [dbo].[Accounts] ([accountId], [accountName], [accountTypeId], [customerId], [Amounts], [dateOpened], [accountNumber]) VALUES (33, N'amadIrfan khan', 1, 21, 10000, CAST(N'2023-04-28T23:55:00.717' AS DateTime), N'98677312569241')
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([accountType], [accountTypeName]) VALUES (1, N'saving')
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (1, N'asdk2s1as3asdfasf12sdda3a', 1, 7)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (2, N'56f43d09ae5d4e70befb76c134e8e265', 1, 27)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (3, N'2443b2ef16af44648629913b76d9cc69', 1, 1018)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (4, N'857d4f6a763a4ce391d454bbbe651ed2', 1, 1019)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (6, N'ac447c3dd43f48f791eff1f9eeade58b', 1, 1021)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (7, N'2f3a4a588ccf43279b762697e0b4efbe', 1, 1022)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (8, N'b6eba32b5b4f4264832e4191bb7ae31c', 1, 1023)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (9, N'4b963e9e83bb48888c0f596a4062d0ab', 1, 1024)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (10, N'4926359298384720882c8ce5c5ffae2e', 1, 1025)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (11, N'9b16138d2fdf4c25b5c64d328ed1cd4f', 1, 1026)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (12, N'c90dbfe225c54aae842f3abc7a882211', 1, 1027)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (13, N'7db60b81d5b94ffb93cde75f4d088e12', 1, 1028)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (14, N'74c4ffb0a17746fca815a79f5e61f34a', 1, 1029)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (15, N'671fb5aa8cec4ec9ba0b90741466b89a', 1, 1030)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (16, N'e52d1d0b5d5949c3b5a3b27eae466764', 1, 1031)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (17, N'6b50d48db555496da7f61cca287de18c', 1, 1032)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (18, N'cf48ae2497a54ac9acfa76a0388e1bcb', 1, 1033)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (19, N'6153a524aef542be8a020e60a3b11baa', 1, 1034)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (20, N'5f503876151a474698e7d53aaaa6e8bb', 1, 1035)
INSERT [dbo].[Customers] ([CustomerId], [userId], [customerTypeId], [uid]) VALUES (21, N'c30ef5c2cfb94932be648bd1cfa25d27', 1, 1036)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomersType] ON 

INSERT [dbo].[CustomersType] ([customerTypeId], [customerTypeDescription]) VALUES (1, N'individual')
SET IDENTITY_INSERT [dbo].[CustomersType] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (7, N'Amad', N'Irfan', N'Lahore', CAST(N'2023-04-26T00:00:00.000' AS DateTime), N'amadirfan@gmail.com', N'12121212', N'03460151920', N'asdk2s1as3asdfasf12sdda3a', 1, CAST(N'2002-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (27, N'abc', N'cdf', N'Lahore', CAST(N'2023-04-26T21:01:47.977' AS DateTime), N'abc@gmail.com', N'12123434', N'034612321', N'56f43d09ae5d4e70befb76c134e8e265', 1, CAST(N'2023-03-31T21:01:19.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1016, N'Saad', N'Irfan', N'Lahore', CAST(N'2023-04-27T21:54:11.367' AS DateTime), N'saad@gmail.com', N'1234567890', N'03460151920', N'd16d92e063bc4e76b9d27825cfd17277', 1, CAST(N'2003-05-12T21:53:20.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1018, N'ahmad', N'khan', N'Bhakkar', CAST(N'2023-04-27T22:10:39.213' AS DateTime), N'ahmad@gmail.com', N'12123434', N'0312312120', N'2443b2ef16af44648629913b76d9cc69', 1, CAST(N'2009-08-06T22:09:59.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1019, N'm', N' moazam', N'Lahore', CAST(N'2023-04-27T22:23:15.340' AS DateTime), N'mmoazam123@gmail.com', N'1234554321', N'03490132132', N'857d4f6a763a4ce391d454bbbe651ed2', 1, CAST(N'2023-04-07T22:22:44.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1020, N'ali', N'mian', N'Lahore', CAST(N'2023-04-27T22:47:26.287' AS DateTime), N'ali@gmail.com', N'1243212312', N'03467571143', N'0ad43410123544d7be60602e353d10ae', 1, CAST(N'2000-03-03T22:46:51.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1021, N'khan', N'khan', N'Lahore', CAST(N'2023-04-27T22:48:30.690' AS DateTime), N'khan@gmail.com', N'123243123124', N'03121234567', N'ac447c3dd43f48f791eff1f9eeade58b', 1, CAST(N'2023-04-11T22:47:57.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1022, N'amad', N'Irfan', N'mughalpura lahore', CAST(N'2023-04-28T22:46:06.523' AS DateTime), N'amadirfan443@gmail.com', N'12amad', N'03450123412', N'2f3a4a588ccf43279b762697e0b4efbe', 1, CAST(N'2023-04-28T22:45:15.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1023, N'usama', N'khan', N'Lahore', CAST(N'2023-04-28T22:48:14.437' AS DateTime), N'usakhan@gmail.com', N'12122121', N'03423412312', N'b6eba32b5b4f4264832e4191bb7ae31c', 1, CAST(N'2023-04-28T22:47:47.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1024, N'amad', N'khan', N'lahore', CAST(N'2023-04-28T22:50:36.437' AS DateTime), N'amadkhan2772@gmail.com', N'123amad', N'03123123122', N'4b963e9e83bb48888c0f596a4062d0ab', 1, CAST(N'2009-04-28T22:49:55.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1025, N'amadirfan', N'irfan', N'lahore', CAST(N'2023-04-28T22:54:08.580' AS DateTime), N'amadirfan@gmail.com', N'12321', N'03123211123', N'4926359298384720882c8ce5c5ffae2e', 1, CAST(N'2023-04-28T22:53:28.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1026, N'Amna', N'zafar', N'Lahore', CAST(N'2023-04-28T23:01:02.387' AS DateTime), N'amnazafar123@gmail.com', N'123123123', N'03123123212', N'9b16138d2fdf4c25b5c64d328ed1cd4f', 1, CAST(N'1999-12-21T23:00:19.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1027, N'saad', N'irfan', N'lahore', CAST(N'2023-04-28T23:04:24.457' AS DateTime), N'saadirfan@gmail.com', N'231123123', N'03234232332', N'c90dbfe225c54aae842f3abc7a882211', 1, CAST(N'2023-04-28T23:03:43.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1028, N'khan', N'khan', N'Lahore', CAST(N'2023-04-28T23:16:20.373' AS DateTime), N'khan@gmail.com', N'12khan', N'03432423421', N'7db60b81d5b94ffb93cde75f4d088e12', 1, CAST(N'2023-04-28T23:15:55.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1029, N'my', N'dummy', N'not', CAST(N'2023-04-28T23:21:39.397' AS DateTime), N'mydumy@gmail.com', N'12dummy', N'03123123122', N'74c4ffb0a17746fca815a79f5e61f34a', 1, CAST(N'2023-04-28T23:20:53.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1030, N'a', N'bc', N'df', CAST(N'2023-04-28T23:24:48.653' AS DateTime), N'asd@gmail.com', N'12321', N'03456343343', N'671fb5aa8cec4ec9ba0b90741466b89a', 1, CAST(N'2023-04-28T23:24:21.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1031, N'ahmad', N'khan', N'Lahore', CAST(N'2023-04-28T23:32:33.393' AS DateTime), N'amd@gmail.com', N'1232111', N'03211232321', N'e52d1d0b5d5949c3b5a3b27eae466764', 1, CAST(N'2023-04-28T23:32:03.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1032, N'asd', N'asd', N'Lahore', CAST(N'2023-04-28T23:39:25.290' AS DateTime), N'asd@gmail.com', N'123123', N'03123456789', N'6b50d48db555496da7f61cca287de18c', 1, CAST(N'2023-04-28T23:39:03.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1033, N'as', N'asd', N'Lahore', CAST(N'2023-04-28T23:44:44.593' AS DateTime), N'sada@gmail.com', N'12312312', N'02321312323', N'cf48ae2497a54ac9acfa76a0388e1bcb', 1, CAST(N'2023-04-28T23:44:06.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1034, N'amadirfan', N'ai', N'Lahore', CAST(N'2023-04-28T23:48:14.757' AS DateTime), N'ai@gmail.com', N'123123', N'03214123122', N'6153a524aef542be8a020e60a3b11baa', 1, CAST(N'2023-04-28T23:47:42.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1035, N'as', N'assa', N'Lahore', CAST(N'2023-04-28T23:52:03.797' AS DateTime), N'as@gmail.com', N'123321', N'03212321321', N'5f503876151a474698e7d53aaaa6e8bb', 1, CAST(N'2023-04-28T23:51:23.000' AS DateTime))
INSERT [dbo].[Users] ([userId], [firstName], [lastName], [address], [createDate], [email], [password], [phoneNumbers], [uId], [userTypeId], [dateOfBirth]) VALUES (1036, N'amad', N'Irfan khan', N'Lahore', CAST(N'2023-04-28T23:55:00.717' AS DateTime), N'amadirfan443@gmail.com', N'123321', N'03460151920', N'c30ef5c2cfb94932be648bd1cfa25d27', 1, CAST(N'2023-04-28T23:51:23.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([userTypeId], [userTypeName]) VALUES (1, N'customer')
INSERT [dbo].[UserType] ([userTypeId], [userTypeName]) VALUES (2, N'employee')
INSERT [dbo].[UserType] ([userTypeId], [userTypeName]) VALUES (1002, N'admin')
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([accountTypeId])
REFERENCES [dbo].[AccountType] ([accountType])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Beneficiary]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([customerTypeId])
REFERENCES [dbo].[CustomersType] ([customerTypeId])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([employeeTypeId])
REFERENCES [dbo].[EmployeeType] ([id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([transactionsTypeId])
REFERENCES [dbo].[TransactionsType] ([transactionTypeId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([userTypeId])
REFERENCES [dbo].[UserType] ([userTypeId])
GO
USE [master]
GO
ALTER DATABASE [ABMBank] SET  READ_WRITE 
GO
