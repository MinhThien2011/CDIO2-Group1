USE [master]
GO
/****** Object:  Database [duan]    Script Date: 16/05/2024 1:32:11 SA ******/
CREATE DATABASE [duan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'duan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\duan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'duan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\duan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [duan] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [duan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [duan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [duan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [duan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [duan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [duan] SET ARITHABORT OFF 
GO
ALTER DATABASE [duan] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [duan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [duan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [duan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [duan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [duan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [duan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [duan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [duan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [duan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [duan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [duan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [duan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [duan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [duan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [duan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [duan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [duan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [duan] SET  MULTI_USER 
GO
ALTER DATABASE [duan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [duan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [duan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [duan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [duan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [duan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [duan] SET QUERY_STORE = ON
GO
ALTER DATABASE [duan] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [duan]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16/05/2024 1:32:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameVN] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 16/05/2024 1:32:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16/05/2024 1:32:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Telephone] [int] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16/05/2024 1:32:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[Special] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/05/2024 1:32:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Telephone] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1, N'Điện thoại', N'OPPO')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (2, N'Điện thoại', N'SAMSUNG')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (3, N'Điện thoại', N'APPLE')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (4, N'Điện thoại', N'XIAOMI')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (8, N'Điện thoại', N'ASUS')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (9, N'Điện thoại', N'NOKIA')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (16, N'Laptop', N'ACER')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (18, N'Laptop', N'GIGABYTE')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (23, N'Tai Nghe', N'VIVO')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (24, N'Loa Bluetooth ', N'MONSTER')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (25, N'Loa Bluetooth ', N'AVA+')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (26, N'Loa Bluetooth ', N'SONY')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (27, N'Loa Bluetooth ', N'JBL Go')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (29, N'Tai Nghe', N'ZADEZ')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (30, N'Tai Nghe', N'HAVIT')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (31, N'Chuột', N'LOGITECH')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (32, N'Chuột', N'DARU')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (33, N'Điện Thoại', N'REALME')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (34, N' Micro', N'PASION')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (35, N'Loa Bluetooth ', N'FENDA')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 1, 59, 855000, 5, 0.2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (2, 1, 60, 1790000, 1, 0.05)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 1, 63, 990000, 2, 0.15)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [OrderDate], [Telephone], [Address], [Amount], [Description], [Status]) VALUES (1, N'thien', CAST(N'2024-05-14T00:00:00.000' AS DateTime), 0, N'', 6803500, N'', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (16, N'Điện thoại iPhone 15 Pro 128GB', 23990000, N'ip15pro.png', CAST(N'2024-05-10' AS Date), 1, 3, 55, N'<p>iPhone 15 Pro l&agrave; một trong những chiếc điện thoại th&ocirc;ng minh được mong đợi nhất năm 2023. Với nhiều t&iacute;nh năng mới v&agrave; cải tiến, iPhone 15 Pro chắc chắn sẽ l&agrave; một lựa chọn tuyệt vời cho những người d&ugrave;ng đang t&igrave;m kiếm một chiếc điện thoại cao cấp.</p>
', 0, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (18, N'iPhone 14 Plus', 22990000, N'ip14plus.png', CAST(N'2024-05-10' AS Date), 1, 3, 67, N'<p>Sau nhiều thế hệ điện thoại của Apple th&igrave; c&aacute;i t&ecirc;n &ldquo;Plus&rdquo; cũng đ&atilde; ch&iacute;nh thức trở lại v&agrave;o năm 2022 v&agrave; xuất hiện tr&ecirc;n chiếc iPhone 14 Plus 128GB, nổi trội với ngoại h&igrave;nh bắt trend c&ugrave;ng m&agrave;n h&igrave;nh k&iacute;ch thước lớn để đem đến kh&ocirc;ng gian hiển thị tốt hơn c&ugrave;ng cấu h&igrave;nh mạnh mẽ kh&ocirc;ng đổi so với bản ti&ecirc;u chuẩn.</p>
', 0.05, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (21, N'iPhone 15 Plus', 22990000, N'ip15plus.png', CAST(N'2024-05-10' AS Date), 1, 3, 53, N'<p>iPhone 15 Plus l&agrave; mẫu điện thoại cao cấp được Apple cho ra mắt v&agrave;o th&aacute;ng 09/2023, m&aacute;y nhận được nhiều sự ch&uacute; &yacute; đến từ người d&ugrave;ng khi mang trong m&igrave;nh bộ cấu h&igrave;nh cực khủng, vẻ ngo&agrave;i thu h&uacute;t c&ugrave;ng khả năng quay video - chụp ảnh đỉnh cao.</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (22, N'iPhone 15 Pro Max', 29590000, N'ip15promax.png', CAST(N'2024-05-10' AS Date), 1, 3, 77, N'<p>iPhone 15 Pro Max&nbsp;mẫu điện thoại mới nhất của Apple cuối c&ugrave;ng cũng đ&atilde; ch&iacute;nh thức được ra mắt v&agrave;o th&aacute;ng 09/2023. Mẫu điện thoại n&agrave;y sở hữu một con chip với hiệu năng mạnh mẽ Apple A17 Pro, m&agrave;n h&igrave;nh đẹp mắt v&agrave; cụm camera v&ocirc; c&ugrave;ng chất lượng.</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (28, N'Tai nghe Bluetooth Chụp Tai HAVIT H667BT', 420000, N'havit.png', CAST(N'2024-05-10' AS Date), 1, 30, 44, N'<p>Tai nghe Bluetooth Chụp tai Havit H667BT&nbsp;mang kiểu d&aacute;ng năng động, gam m&agrave;u thanh lịch, khả năng kết nối linh hoạt c&oacute; d&acirc;y v&agrave; kh&ocirc;ng d&acirc;y, t&iacute;ch hợp mic thoại,... sẽ đ&aacute;p ứng tốt nhu cầu sử dụng cơ bản của người d&ugrave;ng phổ th&ocirc;ng.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (29, N'Tai nghe Bluetooth Chụp Tai Zadez GP-803B', 850000, N'zades.png', CAST(N'2024-05-10' AS Date), 1, 29, 66, N'<p>Tai nghe Bluetooth Chụp Tai Zadez GP-803B&nbsp;với thiết kế trẻ trung, gấp gọn dễ d&agrave;ng mang đi bất cứ đ&acirc;u, chất liệu cao cấp v&agrave; bền bỉ, &acirc;m thanh phong ph&uacute;, chống ồn cuộc gọi tối ưu, mang đến cho bạn những trải nghiệm tuyệt vời.</p>

<p>&bull; Thiết kế&nbsp;tai nghe&nbsp;theo dạng chụp tai, gấp gọn tiện lợi, đệm tai được bọc vải tho&aacute;ng kh&iacute; v&agrave; mềm mại, đồng h&agrave;nh c&ugrave;ng bạn mọi l&uacute;c mọi nơi.</p>

<p>&bull; Micro trang bị c&ocirc;ng nghệ chống ồn ENC, khử tạp &acirc;m l&ecirc;n đến 96%, tai nghe Zadez cho ph&eacute;p bạn dễ d&agrave;ng thực hiện cuộc gọi ở nơi đ&ocirc;ng người hay những nơi ồn &agrave;o m&agrave; kh&ocirc;ng bị ảnh hưởng.</p>

<p>&bull; T&iacute;ch hợp chế độ EQ dễ d&agrave;ng t&ugrave;y chỉnh &acirc;m thanh Hi-Fi hoặc Bass, đ&aacute;p ứng nhu cầu thưởng thức &acirc;m nhạc v&agrave; giải tr&iacute; ho&agrave;n hảo nhất.</p>

<p>&bull; Người d&ugrave;ng c&oacute; thể kết nối&nbsp;tai nghe Zadez&nbsp;c&ugrave;ng thiết bị &acirc;m thanh kh&aacute;c một c&aacute;ch nhanh ch&oacute;ng v&agrave; ổn định th&ocirc;ng qua Bluetooth 5.2.</p>

<p>&bull; Sử dụng pin&nbsp;Li Polymer với dung lượng l&ecirc;n đến 400 mAh, hỗ trợ nghe nhạc, giải tr&iacute; l&ecirc;n đến 50 giờ (thời gian thực tế tuỳ thuộc v&agrave;o mức &acirc;m lượng sử dụng).</p>

<p>&bull;&nbsp;Tai nghe chụp tai&nbsp;tương th&iacute;ch với c&aacute;c thiết bị điện tử sử dụng hệ điều h&agrave;nh phổ biến hiện nay như: iOS, Android, Windows, macOS.</p>
', 0.1, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (34, N'Tai nghe Bluetooth True Wireless AVA+ FreeGo PT62', 310000, N'ava.png', CAST(N'2024-05-10' AS Date), 1, 25, 56, N'<p>Với gam m&agrave;u thanh lịch, kiểu d&aacute;ng đẹp mắt, &acirc;m thanh sống động v&agrave; r&otilde; r&agrave;ng, kết nối kh&ocirc;ng d&acirc;y nhanh ch&oacute;ng, hỗ trợ Game Mode,...&nbsp;Tai nghe Bluetooth True Wireless AVA+ FreeGo PT62&nbsp;sẽ đ&aacute;p ứng tốt c&aacute;c nhu cầu sử dụng cơ bản của người d&ugrave;ng.</p>

<p>&bull;&nbsp;Tai nghe AVA+&nbsp;mang vẻ ngo&agrave;i đẹp mắt, nhỏ gọn, tiện lợi mang theo bất cứ đ&acirc;u m&agrave; kh&ocirc;ng qu&aacute; chiếm chỗ cất giữ.</p>

<p>&bull; Bạn c&oacute; thể sẵn s&agrave;ng nhận cuộc gọi khi đeo&nbsp;tai nghe&nbsp;với mic thoại trang bị sẵn. Ngo&agrave;i ra, bạn c&oacute; thể dễ d&agrave;ng chuyển đổi chế độ Game Mode nhanh ch&oacute;ng khi cần chơi game hoặc muốn giảm tối đa độ trễ khi xem phim, nghe nhạc,...</p>

<p>&bull; Kết nối mượt m&agrave; v&agrave; ổn định với c&aacute;c thiết bị sử dụng nhiều hệ điều h&agrave;nh như iOS, macOS, Android, Windows, th&ocirc;ng qua Bluetooth 5.4 hiện đại.</p>

<p>&bull;&nbsp;Tai nghe True Wireless&nbsp;trang bị chất &acirc;m sống động, phong ph&uacute;, mang đến cho bạn những gi&acirc;y ph&uacute;t giải tr&iacute; thư gi&atilde;n, đắm ch&igrave;m.</p>

<p>&bull; Bạn c&oacute; thể thoải m&aacute;i sử dụng tai nghe m&agrave; kh&ocirc;ng phải lo lắng về việc bị gi&aacute;n đoạn do hết pin nhờ thời lượng d&ugrave;ng li&ecirc;n tục l&ecirc;n tới 7 giờ, sạc đầy trong 1.5 giờ bằng c&aacute;ch đặt tai nghe trở lại trong hộp sạc, d&ugrave;ng tai nghe kết hợp c&ugrave;ng hộp sạc cho tổng thời gian l&ecirc;n đến 20 giờ.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (36, N'AirPods Pro Gen 2 (USB-C)', 6200000, N'apple.png', CAST(N'2024-05-10' AS Date), 1, 3, 64, N'<p>Tai nghe Bluetooth AirPods Pro (2nd Gen) USB-C Charge Apple&nbsp;sở hữu thiết kế mang đậm chất thương hiệu Apple, m&agrave;u sắc sang trọng, đi c&ugrave;ng nhiều c&ocirc;ng nghệ cho c&aacute;c iFan: chip Apple H2, chống bụi, chống ồn chủ động,... hứa hẹn mang đến trải nghiệm &acirc;m thanh sống động, chinh phục người d&ugrave;ng.</p>

<p>Giữ nguy&ecirc;n thiết kế c&ugrave;ng vật liệu t&aacute;i chế th&acirc;n thiện m&ocirc;i trường</p>

<p>Tai nghe&nbsp;Bluetooth AirPods Pro (2nd Gen) được Apple tr&igrave;nh l&agrave;ng v&agrave;o th&aacute;ng 09/2023 với nhiều sự mong đợi, Apple vẫn giữ nguy&ecirc;n thiết kế AirPods Pro Gen 2 giống với phi&ecirc;n bản tiền nhiệm của m&igrave;nh như: k&iacute;ch thước nhỏ gọn, đường bo g&oacute;c tinh tế, gam m&agrave;u trắng sang trọng.</p>

<p>Tuy nhi&ecirc;n trong lần ra mắt n&agrave;y, Apple đ&atilde; thay mới cổng sạc cho c&aacute;c thiết bị của m&igrave;nh, tương tự như cổng sạc tr&ecirc;n c&aacute;c mẫu&nbsp;iPhone 15 series, AirPods Pro Gen 2 được t&iacute;ch hợp cổng sạc Type-C nhằm tối ưu phụ kiện sạc giữa c&aacute;c thiết bị. Khi hết pin bạn c&oacute; thể sạc lại hộp sạc bằng bộ sạc Apple Watch hay MagSafe. Ngo&agrave;i ra bạn c&ograve;n c&oacute; thể sử dụng đầu nối Type-C hoặc bộ sạc chuẩn Qi để nạp lại pin cho chiếc AirPods của m&igrave;nh.</p>

<p>Tr&ecirc;n hộp sạc sẽ bao gồm:</p>

<p>- Đ&egrave;n b&aacute;o pin.</p>

<p>- Cổng sạc Type-C.</p>

<p>- Khoen nhỏ để m&oacute;c d&acirc;y treo.</p>

<p>- Loa cảnh b&aacute;o.</p>

<p>Hộp sạc AirPods Pro Gen 2 được trang bị khoen m&oacute;c d&acirc;y đeo, cho ph&eacute;p người d&ugrave;ng dễ d&agrave;ng gắn hộp sạc v&agrave;o balo hoặc t&uacute;i x&aacute;ch m&agrave; kh&ocirc;ng cần d&ugrave;ng t&uacute;i đựng&nbsp;tai nghe AirPods.</p>

<p>B&ecirc;n cạnh đ&oacute;, hộp sạc c&ograve;n được t&iacute;ch hợp loa gi&uacute;p ph&aacute;t ra &acirc;m thanh để bạn dễ d&agrave;ng định vị ch&iacute;nh x&aacute;c chiếc tai nghe của m&igrave;nh khi l&agrave;m rơi, đồng thời cũng cảnh b&aacute;o cho bạn biết l&uacute;c pin yếu hay khi gh&eacute;p nối xong.</p>

<p>Khi mua&nbsp;tai nghe Apple&nbsp;ngo&agrave;i đệm tai nghe được gắn sẵn, bạn c&ograve;n nhận được th&ecirc;m 3 cặp đệm tai nghe silicone mềm mại đi k&egrave;m với k&iacute;ch thước kh&aacute;c nhau, ph&ugrave; hợp nhiều h&igrave;nh dạng tai, cho người d&ugrave;ng dễ d&agrave;ng lựa chọn đệm tai vừa vặn.</p>

<p>Chip H2 mạnh mẽ, khử tiếng ồn gấp đ&ocirc;i</p>

<p>AirPods Pro Gen 2 mang tr&ecirc;n m&igrave;nh chip Apple H2 mạnh mẽ, hỗ trợ khử tiếng ồn th&ocirc;ng minh v&agrave; &acirc;m thanh 3 chiều sống động c&ugrave;ng t&iacute;nh năng theo d&otilde;i chuyển động của đầu cho bạn trải nghiệm kh&ocirc;ng gian &acirc;m thanh tối ưu. C&ugrave;ng với đ&oacute;, chip Apple H2 c&ograve;n c&oacute; khả năng hạ cường độ tiếng ồn ở mức 48.000 lần trong 1 gi&acirc;y, giảm m&eacute;o tiếng hiệu quả, cho nốt cao r&otilde; r&agrave;ng, trong trẻo v&agrave; &acirc;m trầm s&acirc;u lắng.</p>

<p>B&ecirc;n cạnh đ&oacute;, AirPods Pro Gen 2 c&ograve;n được t&iacute;ch hợp th&ecirc;m c&ocirc;ng nghệ&nbsp;Active Noise Cancellation (chống ồn chủ động), gi&uacute;p loại bỏ tạp &acirc;m từ m&ocirc;i trường b&ecirc;n ngo&agrave;i khi người d&ugrave;ng đi qua những nơi c&oacute; &acirc;m thanh lớn. Đồng thời AirPods Pro Gen 2 cũng sẽ giữ lại những &acirc;m thanh cần thiết với chế độ xuy&ecirc;n &acirc;m mang đến sự kết hợp &acirc;m thanh tuyệt vời, bảo vệ đ&ocirc;i tai người d&ugrave;ng một c&aacute;ch tốt nhất.</p>

<p>Ngo&agrave;i ra, AirPods Pro Gen 2 c&ograve;n c&oacute; khả năng nhận biết cuộc hội thoại, tự động giảm &acirc;m lượng của nội dung đang ph&aacute;t khi bạn bắt đầu n&oacute;i chuyện. Sau khi kết th&uacute;c cuộc tr&ograve; chuyện, &acirc;m lượng sẽ được mở lại như cũ, gi&uacute;p bạn dễ d&agrave;ng chuyển đổi giữa nghe nhạc v&agrave; n&oacute;i chuyện cực tiện lợi.</p>

<p>Tai nghe True Wireless&nbsp;t&iacute;ch hợp Adaptive EQ cho ph&eacute;p bạn c&oacute; thể điều chỉnh &acirc;m thanh theo thời gian thực mang đến những nốt cao sắc n&eacute;t, trong trẻo v&agrave; &acirc;m trầm s&acirc;u, phong ph&uacute; với độ r&otilde; n&eacute;t ho&agrave;n hảo.</p>

<p>Micro n&acirc;ng cấp, t&iacute;ch hợp &acirc;m thanh 3 chiều v&agrave;o cuộc gọi</p>

<p>Micro của AirPods Pro Gen 2 được Apple thiết kế hướng v&agrave;o trong nhằm cải thiện giọng n&oacute;i nghe tự nhi&ecirc;n hơn khi bạn gọi điện thoại hoặc gọi FaceTime. Đồng thời &acirc;m thanh 3 chiều cũng được tận dụng, khi gọi FaceTime nh&oacute;m bạn sẽ cảm thấy như đang ở trong ph&ograve;ng c&ugrave;ng mọi người khi tr&ograve; chuyện.</p>

<p>Điều khiển th&ocirc;ng minh chỉ với thao t&aacute;c chạm</p>

<p>Bạn c&oacute; thể dễ d&agrave;ng điều khiển th&ocirc;ng qua c&aacute;c thao t&aacute;c vuốt, chạm tr&ecirc;n mỗi b&ecirc;n tai nghe với c&aacute;c chức năng sau:</p>

<p>- Chạm hai lần để kết th&uacute;c cuộc gọi.</p>

<p>- Ấn giữ th&acirc;n tai nghe để chuyển chế độ.</p>

<p>- Chạm để ph&aacute;t/dừng chơi nhạc.</p>

<p>- Vuốt l&ecirc;n hoặc xuống để tăng/giảm &acirc;m lượng.</p>

<p>Dung lượng pin lớn, hỗ trợ sạc kh&ocirc;ng d&acirc;y nhanh ch&oacute;ng</p>

<p>Với AirPods Pro Gen 2 bạn c&oacute; thể nghe nhạc li&ecirc;n tục trong 6 giờ c&ugrave;ng t&iacute;nh năng Chống ồn chủ động chỉ trong 1 lần sạc. Tổng thời gian sử dụng AirPods l&ecirc;n tới 30 giờ khi d&ugrave;ng k&egrave;m hộp sạc.</p>

<p>Kết nối dễ d&agrave;ng với Bluetooth 5.3</p>

<p>Tai nghe trang bị chuẩn kết nối Bluetooth 5.3, tương th&iacute;ch với nhiều thiết bị Apple kh&aacute;c nhau như:&nbsp;iPhone 15,&nbsp;iPhone 15 Plus,&nbsp;iPhone 15 Pro,&nbsp;iPhone 15 Pro Max,&nbsp;Apple Watch Ultra 2,&nbsp;Apple Watch Series 9,...</p>

<p>Ngo&agrave;i ra, tai nghe AirPods Pro Gen 2 cũng c&oacute; thể kết nối với Apple Vision Pro, một sản phẩm k&iacute;nh th&ocirc;ng minh sắp ra mắt của Apple gi&uacute;p bạn trải nghiệm &acirc;m thanh&nbsp;c&aacute; nh&acirc;n h&oacute;a chưa từng thấy với độ trễ cực thấp.</p>

<p>Chuẩn chống nước, chống bụi IP54</p>

<p>Cả AirPods Pro v&agrave; hộp sạc MagSafe đều c&oacute; khả năng chống mồ h&ocirc;i, chống nước, chống bụi đạt chuẩn IP54. Bạn c&oacute; thể an t&acirc;m sử dụng tai nghe khi luyện tập thể thao hay sử dụng trong c&aacute;c hoạt động thường ng&agrave;y m&agrave; kh&ocirc;ng lo mồ h&ocirc;i hay bụi bẩn l&agrave;m hỏng tai nghe.</p>

<p>Tai nghe Bluetooth AirPods Pro (2nd Gen) USB-C Charge Apple với nhiều t&iacute;nh năng th&ocirc;ng minh như: chip Apple H2, c&ocirc;ng nghệ Chống ồn chủ động,&nbsp;Adaptive EQ, nhận biết cuộc hội thoại, chống nước v&agrave; bụi chuẩn IP54,... hứa hẹn sẽ mang đến trải nghiệm &acirc;m thanh tuyệt vời khi sử dụng.</p>
', 0.05, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (37, N'Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 5', 990000, N'xiaomi.png', CAST(N'2024-05-10' AS Date), 1, 4, 55, N'<p>Nếu bạn l&agrave; một t&iacute;n đồ &acirc;m nhạc đ&iacute;ch thực, lu&ocirc;n t&igrave;m kiếm những trải nghiệm nghe nhạc đỉnh cao, th&igrave; đừng bỏ qua Xiaomi Redmi Buds 5. Với thiết kế thời thượng, cảm gi&aacute;c đeo thoải m&aacute;i, chất &acirc;m sống động v&agrave; thời lượng pin d&agrave;i, Redmi Buds 5 sẽ mang đến cho bạn những ph&uacute;t gi&acirc;y thư gi&atilde;n tuyệt vời.<br />
Kiểu d&aacute;ng nhỏ gọn, thoải m&aacute;i khi đeo<br />
Xiaomi Redmi Buds 5 sở hữu hộp sạc nhỏ gọn, thanh lịch với thiết kế h&igrave;nh chữ nhật bo cong mềm mại. Chất liệu nhựa nh&aacute;m mờ hạn chế b&aacute;m dấu v&acirc;n tay, gi&uacute;p hộp sạc lu&ocirc;n sạch sẽ, đẹp mắt. Chỉ với một chiếc khăn ẩm, bạn đ&atilde; c&oacute; thể dễ d&agrave;ng lau ch&ugrave;i hộp sạc m&agrave; kh&ocirc;ng lo trầy xước.</p>

<p>Phần bản lề của hộp sạc Redmi Buds 5 được l&agrave;m từ chất liệu bền bỉ, c&oacute; độ ho&agrave;n thiện cao. Thao t&aacute;c đ&oacute;ng, mở nắp hộp rất nhẹ nh&agrave;ng, &ecirc;m &aacute;i, kh&ocirc;ng g&acirc;y tiếng ồn. Một điểm cộng lớn của chiếc tai nghe n&agrave;y l&agrave; Xiaomi đ&atilde; thiết kế phần nam ch&acirc;m tr&ecirc;n chu&ocirc;i tai nghe v&agrave; trong hộp sạc rất chắc chắn. Nhờ đ&oacute;, tai nghe c&oacute; thể h&iacute;t chặt v&agrave;o hộp sạc, kh&ocirc;ng lo rơi ra ngo&agrave;i.</p>

<p>Tai nghe in-ear với housing thu&ocirc;n d&agrave;i, đệm cao su mềm mại &ocirc;m s&aacute;t v&agrave;o tai mang lại cảm gi&aacute;c đeo vừa vặn, thoải m&aacute;i, độ b&aacute;m tốt hạn chế rơi khỏi tai khi vận động mạnh hay chơi thể thao.</p>

<p>Tai nghe Bluetooth TWS Xiaomi Redmi Buds 5 - Thiết kế</p>

<p>Mang đến &acirc;m thanh ch&acirc;n thật khi nghe<br />
Tai nghe Xiaomi c&oacute; khả năng t&aacute;i hiện đầy đủ c&aacute;c dải tần &acirc;m thanh, từ những bản nhạc ballad nhẹ nh&agrave;ng, s&acirc;u lắng đến những bản nhạc rock s&ocirc;i động, mạnh mẽ. Đặc biệt, &acirc;m trường rộng r&atilde;i gi&uacute;p người d&ugrave;ng cảm nhận được sự ch&acirc;n thực, sống động của &acirc;m nhạc.</p>

<p>Tai nghe True Wireless giảm tiếng ồn c&oacute; thể tạo ra một kh&ocirc;ng gian y&ecirc;n tĩnh, thoải m&aacute;i ngay cả trong những m&ocirc;i trường ồn &agrave;o. Với khả năng giảm tiếng ồn l&ecirc;n đến 46 dB v&agrave; chặn 99.5% tiếng ồn xung quanh, tai nghe n&agrave;y c&oacute; thể gi&uacute;p bạn tập trung v&agrave;o c&ocirc;ng việc, nghe nhạc hoặc đơn giản l&agrave; thư gi&atilde;n m&agrave; kh&ocirc;ng bị ph&acirc;n t&acirc;m bởi tiếng ồn b&ecirc;n ngo&agrave;i.</p>

<p>Đặc biệt, chiếc tai nghe Xiaomi Redmi Buds 5 n&agrave;y c&ograve;n c&oacute; thể giảm tiếng ồn tần số thấp một c&aacute;ch hiệu quả, gi&uacute;p bạn thoải m&aacute;i hơn khi di chuyển bằng m&aacute;y bay hoặc t&agrave;u điện ngầm. Nhờ đ&oacute;, bạn c&oacute; thể tận hưởng trọn vẹn chuyến đi của m&igrave;nh m&agrave; kh&ocirc;ng bị tiếng ồn l&agrave;m phiền. T&iacute;nh năng chống ồn &quot;th&iacute;ch ứng&quot; bằng AI của Redmi Buds 5 cũng mang đến cho người d&ugrave;ng sự linh hoạt trong việc lựa chọn mức độ chống ồn, ph&ugrave; hợp với từng nhu cầu sử dụng.</p>

<p>Tai nghe Bluetooth TWS Xiaomi Redmi Buds 5 - Giảm tiếng ồn</p>

<p>Xiaomi Redmi Buds 5 mang đến trải nghiệm &acirc;m thanh sống động nhờ driver c&oacute; k&iacute;ch thước 12.4 mm v&agrave; m&agrave;ng loa được phủ titan. Driver c&oacute; k&iacute;ch thước lớn hơn mang lại v&ugrave;ng rung lớn hơn, gi&uacute;p t&aacute;i tạo &acirc;m trầm s&acirc;u v&agrave; c&oacute; kết cấu hơn. M&agrave;ng loa được phủ titan c&oacute; độ cứng cao, t&aacute;i tạo &acirc;m treble trong trẻo v&agrave; sắc n&eacute;t hơn.</p>

<p>Redmi Buds 5 l&agrave; phi&ecirc;n bản đầu ti&ecirc;n của tai nghe Redmi sử dụng thuật to&aacute;n AI k&ecirc;nh đ&ocirc;i tự ph&aacute;t triển, gi&uacute;p giảm tiếng ồn của gi&oacute; l&ecirc;n đến 6 m/s. Thuật to&aacute;n n&agrave;y sử dụng hai micro để thu &acirc;m thanh của gi&oacute; từ hai hướng kh&aacute;c nhau, sau đ&oacute; sử dụng thuật to&aacute;n AI để lọc tiếng ồn của gi&oacute; một c&aacute;ch hiệu quả.</p>

<p>Nhờ thuật to&aacute;n n&agrave;y, Xiaomi Redmi Buds 5 c&oacute; thể mang lại chất lượng đ&agrave;m thoại r&otilde; r&agrave;ng v&agrave; tự nhi&ecirc;n ngay cả khi bạn đang đi xe hoặc chạy ngo&agrave;i trời. Bạn sẽ c&oacute; cảm gi&aacute;c như đang giao tiếp mặt đối mặt với người đối diện, kh&ocirc;ng bị tiếng ồn của gi&oacute; l&agrave;m phiền.</p>

<p>Tai nghe Bluetooth TWS Xiaomi Redmi Buds 5 - Thuật to&aacute;n AI</p>

<p>Thao t&aacute;c điều khiển đơn giản, kết nối ổn định&nbsp;<br />
Tai nghe Xiaomi Redmi Buds 5 cho ph&eacute;p người d&ugrave;ng dễ d&agrave;ng t&ugrave;y chỉnh trải nghiệm nghe nhạc với c&aacute;c thao t&aacute;c chạm đơn giản. Bạn c&oacute; thể ph&aacute;t/dừng nhạc, nhận/ngắt cuộc gọi, chuyển b&agrave;i h&aacute;t, bật/tắt chế độ Game Mode chỉ với v&agrave;i động t&aacute;c chạm nhẹ tr&ecirc;n tai nghe.</p>

<p>C&ocirc;ng nghệ Bluetooth 5.3 ti&ecirc;n tiến gi&uacute;p kết nối tai nghe với thiết bị di động mượt m&agrave;, ổn định, giảm thiểu độ trễ, cho bạn tận hưởng &acirc;m nhạc v&agrave; c&aacute;c cuộc gọi video liền mạch. Ngo&agrave;i ra, c&ocirc;ng nghệ n&agrave;y c&ograve;n gi&uacute;p tiết kiệm năng lượng, k&eacute;o d&agrave;i thời gian sử dụng tai nghe.</p>

<p>Redmi Buds 5 được trang bị t&iacute;nh năng Google Fast Pair, gi&uacute;p người d&ugrave;ng c&oacute; thể kết nối với c&aacute;c thiết bị Android qua Bluetooth một c&aacute;ch v&ocirc; c&ugrave;ng nhanh ch&oacute;ng v&agrave; dễ d&agrave;ng. Chỉ cần mở nắp hộp đựng tai nghe, cửa sổ gh&eacute;p đ&ocirc;i sẽ tự động bật l&ecirc;n tr&ecirc;n điện thoại. Nhấn v&agrave;o cửa sổ n&agrave;y v&agrave; chạm v&agrave;o tai nghe để kết nối. To&agrave;n bộ qu&aacute; tr&igrave;nh chỉ mất v&agrave;i gi&acirc;y, kh&ocirc;ng cần phải thực hiện c&aacute;c bước rườm r&agrave; như trước đ&acirc;y.</p>

<p>Tai nghe Bluetooth TWS Xiaomi Redmi Buds 5 - Kết nối ổn định</p>

<p>Chuẩn chống nước IP54 v&agrave; thời lượng pin vượt trội<br />
Chuẩn chống nước chống bụi IP54 gi&uacute;p bảo vệ tai nghe Bluetooth True Wireless Xiaomi an to&agrave;n khi d&iacute;nh nước hay bụi bẩn trong qu&aacute; tr&igrave;nh sử dụng, nhưng khả năng n&agrave;y c&oacute; hạn chế v&agrave; sẽ giảm dần theo thời gian. Do đ&oacute;, người d&ugrave;ng n&ecirc;n bảo quản tai nghe thật tốt để k&eacute;o d&agrave;i tuổi thọ của sản phẩm.</p>

<p>Redmi Buds 5 sở hữu thời lượng pin ấn tượng, với 10 giờ ph&aacute;t nhạc li&ecirc;n tục v&agrave; tổng thời lượng l&ecirc;n đến 40 giờ khi kết hợp với hộp sạc. Đ&acirc;y l&agrave; một con số đ&aacute;ng nể, gi&uacute;p người d&ugrave;ng thoải m&aacute;i sử dụng tai nghe cả ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng cần lo lắng về vấn đề hết pin đột ngột.</p>

<p>Nếu bật t&iacute;nh năng khử tiếng ồn, thời lượng pin của Redmi Buds 5 sẽ giảm xuống c&ograve;n 8 giờ cho việc nghe nhạc v&agrave; 30 giờ khi kết hợp với hộp sạc. Tuy nhi&ecirc;n, đ&acirc;y vẫn l&agrave; một con số kh&aacute; tốt so với mặt bằng chung của c&aacute;c tai nghe Bluetooth c&oacute; t&iacute;nh năng khử tiếng ồn.</p>

<p>T&iacute;nh năng sạc nhanh của tai nghe Bluetooth True Wireless Xiaomi n&agrave;y l&agrave; một điểm cộng lớn, gi&uacute;p người d&ugrave;ng c&oacute; thể nhanh ch&oacute;ng tiếp tục sử dụng tai nghe m&agrave; kh&ocirc;ng cần phải chờ đợi l&acirc;u. Chỉ với 5 ph&uacute;t sạc, tai nghe đ&atilde; c&oacute; thể nghe nhạc li&ecirc;n tục trong 2 giờ.&nbsp;</p>

<p>Tai nghe Bluetooth TWS Xiaomi Redmi Buds 5 - Sạc nhanh</p>

<p>Tai nghe Bluetooth TWS Xiaomi Redmi Buds 5 l&agrave; một lựa chọn tuyệt vời cho những ai đang t&igrave;m kiếm một chiếc tai nghe nhỏ gọn, tiện lợi v&agrave; đ&aacute;p ứng tốt c&aacute;c nhu cầu nghe nhạc, xem phim, gọi thoại. Với thiết kế thời thượng, chất &acirc;m sống động, khả năng khử tiếng ồn hiệu quả v&agrave; thời lượng pin d&agrave;i, Redmi Buds 5 chắc chắn sẽ l&agrave; người bạn đồng h&agrave;nh l&yacute; tưởng cho bạn trong mọi hoạt động h&agrave;ng ng&agrave;y.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (38, N'Loa Bluetooth Sony SRS-XB100', 1050000, N'sony.png', CAST(N'2024-05-10' AS Date), 1, 26, 78, N'<p>Loa Bluetooth Sony SRS-XB100&nbsp;sở hữu thiết kế v&ocirc; c&ugrave;ng nhỏ gọn, độ bền cao, chất &acirc;m ấn tượng c&ugrave;ng thời lượng pin l&acirc;u d&agrave;i,... đ&aacute;p ứng đa dạng nhu cầu sử dụng của người d&ugrave;ng mọi l&uacute;c mọi nơi.</p>

<p>Thiết kế c&oacute; độ bền cao từ vật liệu th&acirc;n thiện với m&ocirc;i trường&nbsp;</p>

<p>Sony SRS-XB 100 mang diện mạo h&igrave;nh trụ v&ocirc; c&ugrave;ng nhỏ gọn với k&iacute;ch thước 7.6 x 7.6 x 9.5 cm. Được ho&agrave;n thiện từ nhựa t&aacute;i chế th&acirc;n thiện với m&ocirc;i trường gi&uacute;p sản phẩm c&oacute; độ bền cao, chịu lực tốt trước c&aacute;c va chạm. Sony cũng trang bị nhiều phi&ecirc;n bản m&agrave;u năng động cho d&ograve;ng loa n&agrave;y, đ&aacute;p ứng được nhiều sở th&iacute;ch kh&aacute;c nhau của người d&ugrave;ng, trong b&agrave;i viết n&agrave;y m&igrave;nh sử dụng phi&ecirc;n bản m&agrave;u cam.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (39, N'Loa Bluetooth AVA+ Go Z09 Mới 2024', 90000, N'loa_ava.png', CAST(N'2024-05-10' AS Date), 1, 25, 77, N'<p>Loa Bluetooth AVA+ Go Z09&nbsp;l&agrave; phi&ecirc;n bản loa gi&aacute; rẻ nhưng c&oacute; thiết kế ấn tượng với ngoại h&igrave;nh nhỏ gọn, đ&egrave;n LED sống động, đi c&ugrave;ng c&aacute;c tiện &iacute;ch hiện đại, phục vụ tốt nhu cầu giải tr&iacute; cơ bản của người d&ugrave;ng.</p>

<p>&bull;&nbsp;Loa&nbsp;AVA+&nbsp;c&oacute; thiết kế gọn nhẹ từ nhựa cao cấp,&nbsp;khối lượng&nbsp;chỉ&nbsp;0.165 kg dễ d&agrave;ng bỏ v&agrave;o balo, t&uacute;i x&aacute;ch đồng h&agrave;nh c&ugrave;ng bạn mọi l&uacute;c mọi nơi.</p>

<p>&bull;&nbsp;Loa Bluetooth&nbsp;c&oacute; chất lượng &acirc;m thanh sống động, ch&acirc;n thực, hỗ trợ kết nối 2 loa c&ugrave;ng l&uacute;c để tăng gấp đ&ocirc;i mức c&ocirc;ng suất.</p>

<p>&bull; T&iacute;ch hợp&nbsp;đ&egrave;n LED với m&agrave;u sắc đa dạng, c&oacute; thể dễ d&agrave;ng tuỳ chỉnh mang đến kh&ocirc;ng gian &acirc;m nhạc phong ph&uacute;.</p>

<p>&bull;&nbsp;C&ocirc;ng nghệ Bluetooth 5.3 hiện đại gi&uacute;p kết nối th&ecirc;m phần mượt m&agrave;, ổn định trong phạm vi từ 8 - 10 m&eacute;t.</p>

<p>&bull;&nbsp;Hỗ trợ nhiều ph&iacute;m bấm tr&ecirc;n&nbsp;loa&nbsp;gi&uacute;p bạn dễ d&agrave;ng điều khiển như:&nbsp;Chuyển b&agrave;i h&aacute;t, ph&aacute;t/dừng chơi nhạc, tăng/giảm &acirc;m lượng, thay đổi chế độ đ&egrave;n, thay đổi chế độ kết nối.</p>
', 0, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (40, N'Loa Bluetooth JBL Go 3 ', 890000, N'loa_jbl.png', CAST(N'2024-05-10' AS Date), 1, 27, 88, N'<p>Loa bluetooth JBL Go 3&nbsp;phong c&aacute;ch trẻ trung c&ugrave;ng &acirc;m thanh sống động</p>

<p>Được phủ bằng lớp nhựa bền bỉ,&nbsp;loa JBL&nbsp;được bảo vệ an to&agrave;n khỏi c&aacute;c va chạm. Thiết kế nổi bật, trẻ trung với logo JBL bắt mắt, kết hợp quai xỏ ng&oacute;n chắc chắn để&nbsp;tiện lợi khi cần di chuyển, treo m&oacute;c&nbsp;loa l&ecirc;n hay c&oacute; thể d&ugrave;ng gắn k&egrave;m m&oacute;c kh&oacute;a.</p>

<p>C&ocirc;ng suất&nbsp;4.2 W&nbsp;v&agrave; c&ocirc;ng nghệ JBL Pro Sound cho &acirc;m thanh mạnh mẽ, sống động. Chiếc&nbsp;loa&nbsp;nhỏ gọn chỉ trong b&agrave;n tay cầm n&agrave;y lại ph&aacute;t ra &acirc;m thanh kh&aacute; mạnh mẽ v&agrave;&nbsp;chất lượng &acirc;m tốt, l&ocirc;i cuốn, nhờ đ&oacute; mang đến kh&ocirc;ng gian v&agrave; trải nghiệm &acirc;m nhạc thật l&yacute; th&uacute; cho bạn.</p>
', 0, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (41, N'Loa Bluetooth AVA+ Go Z12 ', 120000, N'loa_ava_goz.png', CAST(N'2024-05-10' AS Date), 1, 25, 757, N'<p>Loa Bluetooth AVA+ Go Z12&nbsp;sở hữu ngoại h&igrave;nh nhỏ gọn với đ&egrave;n LED ấn tượng, c&ocirc;ng nghệ Bluetooth 5.3 hiện đại v&agrave; khả năng kết nối c&ugrave;ng l&uacute;c 2 loa gi&uacute;p kh&ocirc;ng gian giải tr&iacute; của bạn th&ecirc;m phần sống động.</p>

<p>&bull;&nbsp;Loa Bluetooth&nbsp;được ho&agrave;n thiện từ chất liệu nhựa cao cấp,&nbsp;thiết kế nhỏ gọn gi&uacute;p bạn dễ d&agrave;ng mang theo mọi l&uacute;c mọi nơi.</p>

<p>&bull;&nbsp;Loa&nbsp;AVA+&nbsp;c&oacute; c&ocirc;ng suất 5 W, cho &acirc;m thanh r&otilde; r&agrave;ng v&agrave; sống động trong kh&ocirc;ng gian nhỏ như ph&ograve;ng ngủ, b&agrave;n l&agrave;m việc hay nhu cầu sử dụng c&aacute; nh&acirc;n.</p>

<p>&bull; C&ocirc;ng nghệ Bluetooth 5.3 hiện đại gi&uacute;p kết nối th&ecirc;m phần nhanh ch&oacute;ng, giảm thiểu tối đa độ nhiễu, r&egrave;.</p>

<p>&bull; Cho ph&eacute;p bạn kết nối c&ugrave;ng l&uacute;c 2&nbsp;loa&nbsp;nhằm khuếch đại &acirc;m thanh, cho kh&ocirc;ng gian giải tr&iacute; th&ecirc;m phần thư gi&atilde;n.</p>

<p>&bull; Hỗ trợ nhiều ph&iacute;m điều khiển gi&uacute;p bạn dễ d&agrave;ng thao t&aacute;c như:&nbsp;Chuyển b&agrave;i h&aacute;t, ph&aacute;t/dừng chơi nhạc, tăng/giảm &acirc;m lượng, thay đổi chế độ đ&egrave;n, thay đổi chế độ kết nối.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (42, N'Loa Bluetooth Monster Superstar S320 ', 1490000, N'loa_monster.png', CAST(N'2024-05-10' AS Date), 1, 24, 34, N'<p>Loa Bluetooth Monster Superstar S320&nbsp;được h&atilde;ng Monster sản xuất c&oacute; c&ocirc;ng suất lớn, &acirc;m thanh nổi 360 độ c&ugrave;ng thời lượng pin d&agrave;i, cho bạn trải nghiệm &acirc;m nhạc ấn tượng ngay cả khi ở nh&agrave; hay hoạt động ngo&agrave;i trời.</p>

<p>Thiết kế nhỏ gọn, tiện lợi mang đi d&atilde; ngoại</p>

<p>Loa c&oacute; thiết kế h&igrave;nh trụ tr&ograve;n, cao&nbsp;19 cm&nbsp;v&agrave; ngang&nbsp;8.7 cm, đi c&ugrave;ng khối lượng&nbsp;0.568 kg, kh&aacute; nhỏ gọn để m&igrave;nh c&oacute; thể cầm bằng một tay dễ d&agrave;ng, ngo&agrave;i ra cũng kh&ocirc;ng mất qu&aacute; nhiều sức nếu muốn mang chiếc loa n&agrave;y đi du lịch hay cắm trại c&ugrave;ng bạn b&egrave; người th&acirc;n.</p>

<p>Monster Superstar S320 được trang bị th&ecirc;m một d&acirc;y đeo, m&igrave;nh c&oacute; thể luồn tay v&agrave;o để chắc chắn hơn khi cầm. Những l&uacute;c đạp xe th&igrave; m&igrave;nh sẽ treo chiếc loa n&agrave;y v&agrave;o tay cầm của xe để nghe nhạc, tr&aacute;nh bị ch&aacute;n khi tập luyện một m&igrave;nh. Khi sợi d&acirc;y n&agrave;y bị dơ th&igrave; việc vệ sinh cũng kh&aacute;c đơn giản, m&igrave;nh chỉ cần th&aacute;o d&acirc;y ra v&ograve; với nước một t&iacute; l&agrave; đ&atilde; sạch.</p>
', 0.05, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (43, N'Chuột Có dây Gaming Logitech G102 Gen2 Lightsync', 405000, N'chuot_logitech_g102.png', CAST(N'2024-05-10' AS Date), 1, 31, 35, N'<p>Mệnh danh l&agrave; một &ldquo;si&ecirc;u chuột quốc d&acirc;n&quot;&nbsp;Logitech G102 Gen 2 Lightsync&nbsp;sở hữu hiệu năng cực cao c&ugrave;ng loạt t&iacute;nh năng: dải LED 16.8 triệu m&agrave;u, n&uacute;t bấm bền bỉ, ch&acirc;n chuột d&agrave;y trơn mượt k&egrave;m theo một mức gi&aacute; hầu bao ph&ugrave; hợp với những bạn muốn sự đơn giản nhưng vẫn đi đ&ocirc;i với chất lượng.</p>

<p>Thiết kế đối xứng, th&acirc;n thiện với mọi người d&ugrave;ng</p>

<p>G102 được lấy cảm hứng từ thiết kế huyền thoại của chuột chơi game G100S, tổng thể chuột được l&agrave;m từ nhựa nh&aacute;m, theo c&aacute; nh&acirc;n m&igrave;nh sử dụng th&igrave; thấy kh&aacute; bền, kh&ocirc;ng c&oacute; hiện tượng trầy xước v&agrave; nhanh hỏng ở phần th&acirc;n chuột.&nbsp;</p>

<p>M&igrave;nh đ&atilde; cầm v&aacute;c &ldquo;ẻm&quot; đi từ Đ&agrave; Lạt về S&agrave;i G&ograve;n rồi v&ograve;ng ngược về Đ&agrave; Lạt một v&ograve;ng nữa nhưng kết luận một c&acirc;u &ldquo;Vẫn đẹp như ng&agrave;y em đi&rdquo; với độ bền của ch&uacute; chuột n&agrave;y. Kết hợp với đ&oacute; l&agrave; kiểu d&aacute;ng được thiết kế đối xứng cơ bản rất th&iacute;ch hợp cho việc sử dụng cả hai tay.</p>

<p>Ở phần đu&ocirc;i chuột c&oacute; thiết kế hơi bầu v&agrave; nh&ocirc; l&ecirc;n, đặc biệt chi tiết 2 b&ecirc;n viền h&ocirc;ng kh&ocirc;ng uốn l&otilde;m v&agrave;o như những thiết kế trước đ&acirc;y m&agrave; lại &ldquo;nở&rdquo; ra v&agrave; v&aacute;t nhỏ dần xuống ph&iacute;a đ&aacute;y mang xu hướng tổng thiết kế kh&aacute; trung t&iacute;nh.</p>

<p>Đối với những bạn c&oacute; khu&ocirc;n tay lớn theo kiểu cầm palm - cầm cả b&agrave;n tay &ocirc;m hết v&agrave;o th&acirc;n chuột th&igrave; sẽ thấy hơi nhỏ một ch&uacute;t, nhưng với c&aacute;c bạn c&oacute; khu&ocirc;n tay trung b&igrave;nh hay x&agrave;i kiểu cầm claw - chỉ tiếp x&uacute;c với chuột bằng l&ograve;ng b&agrave;n tay v&agrave; c&aacute;c đầu ng&oacute;n tay th&igrave; sẽ thấy kh&aacute; vừa vặn, thoải m&aacute;i v&agrave; ổn &aacute;p hơn.</p>

<p>Về ch&acirc;n chuột th&igrave; Logitech l&agrave;m kh&aacute; chỉnh chu ở mẫu G102. Với 4 ch&acirc;n xung quanh 4 g&oacute;c dưới của chuột v&agrave; một ch&acirc;n tr&ograve;n xung quanh cảm biến. Ch&acirc;n chuột kiểu n&agrave;y đem lại cảm gi&aacute;c di chuột rất trơn tru, tr&ecirc;n bề mặt vải lẫn cứng m&agrave; kh&ocirc;ng cần d&ugrave;ng miếng l&oacute;t chuột. Khối lượng của &ldquo;em&rdquo; chuột n&agrave;y rơi v&agrave;o khoảng 85 gram, với khối lượng n&agrave;y khi m&igrave;nh cầm nắm chuột rất nhẹ kh&ocirc;ng hề bị mỏi tay, trải nghiệm di chuột cũng kh&aacute; nhanh nhạy.</p>

<p>Chuột Logitech&nbsp;G102 Gen 2 c&oacute; 6 n&uacute;t bấm gồm: 2 n&uacute;t bấm ch&iacute;nh (tr&aacute;i - phải), con lăn, n&uacute;t back v&agrave; forward, n&uacute;t DPI. Trước hết, cảm nhận ở n&uacute;t bấm tr&aacute;i phải th&igrave; m&igrave;nh thấy tốt, lực bấm nhanh nhẹ, c&oacute; độ nảy cao v&agrave; đảm bảo tuổi thọ cao với khả năng chịu tới 10 triệu lần bấm theo như th&ocirc;ng số h&atilde;ng đưa ra.</p>

<p>Kế đến, phần con lăn nhẹ, s&agrave;i kh&aacute; d&iacute;nh tay n&ecirc;n bấm sướng, lăn sướng, kh&ocirc;ng qu&aacute; trơn v&agrave; d&ugrave;ng ổn định, kết hợp n&uacute;t DPI được chế t&aacute;c hơi cao, thi thoảng nếu d&ugrave;ng li&ecirc;n tục sẽ lỡ bị d&iacute;u tay dễ l&agrave;m nhầm lẫn thao t&aacute;c nhưng vị tr&iacute; n&uacute;t khi nhấn th&igrave; vừa, kh&ocirc;ng thừa kh&ocirc;ng thiếu v&agrave; khớp với đầu ng&oacute;n tay.</p>

<p>Cuối c&ugrave;ng, l&agrave; phần thiết kế 2 n&uacute;t phụ (extra button) đặt ở b&ecirc;n h&ocirc;ng tr&aacute;i kh&aacute; khi&ecirc;m tốn n&ecirc;n tr&aacute;nh được khả năng bị bấm nhầm, nhưng v&igrave; nhỏ n&ecirc;n khi bấm cũng dừng ở mức vừa vặn v&agrave; ổn.</p>

<p>Đ&egrave;n LED bảy sắc cầu vồng, custom m&agrave;u theo sở th&iacute;ch</p>

<p>Điểm nổi bật nhất ở phi&ecirc;n bản n&agrave;y l&agrave; sở hữu c&ocirc;ng nghệ Light Sync RGB, cho ph&eacute;p &ldquo;anh em&rdquo; pha trộn nhiều m&agrave;u sắc v&agrave; hiệu ứng kh&aacute;c nhau, trong khi G102 Prodigy th&igrave; chỉ c&oacute; LED RGB 1 v&ugrave;ng m&agrave; th&ocirc;i. Một dải đ&egrave;n th&igrave; &ocirc;m theo khu vực bụng chuột v&agrave; một dải th&igrave; xuất hiện ở logo chữ G. Dải đ&egrave;n LED s&aacute;ng rất đều, kh&ocirc;ng c&oacute; bị yếu đ&egrave;n hay kh&ocirc;ng đều đ&egrave;n ở khu vực n&agrave;o cả.</p>

<p>Bạn c&oacute; thể t&ugrave;y chỉnh LED RGB theo sở th&iacute;ch th&ocirc;ng qua phần mềm&nbsp;Logitech G Hub&nbsp;mới nhất: chọn một m&agrave;u, pha trộn 3 m&agrave;u, chọn h&igrave;nh động thiết lập sẵn, hay tạo hiệu ứng của ri&ecirc;ng bạn.</p>

<p>Đồng thời, tr&ecirc;n Logitech G HUB bạn c&oacute; thể thực hiện g&aacute;n một loạt lệnh ph&iacute;m để đơn giản h&oacute;a việc chơi game của m&igrave;nh, hoặc t&ugrave;y chỉnh từng ph&iacute;m tắt điều khiển hệ thống v&agrave; tổ hợp để l&agrave;m việc, sử dụng cho c&aacute;c phần mềm kh&aacute;c, c&aacute;c ứng dụng truy cập web.</p>

<p>Cảm biến quang học cao, cổng kết nối th&ocirc;ng dụng</p>

<p>G102 sử dụng cảm biến Mercury, cảm biến giống như tr&ecirc;n G203. Logitech gọi đ&acirc;y l&agrave; cảm biến cấp độ chơi v&agrave; n&oacute; cho ph&eacute;p người d&ugrave;ng kiểm so&aacute;t được độ nhạy từ 200 đến 8000 DPI, c&oacute; thể t&ugrave;y chỉnh 5 chế độ trong phần mềm Logitech G HUB để ph&ugrave; hợp với từng loại game m&agrave; bạn chơi một c&aacute;ch dễ d&agrave;ng.</p>

<p>Chuột Logitech c&oacute; cổng kết nối l&agrave; đầu USB tương th&iacute;ch hầu hết với c&aacute;c laptop Windows v&agrave; PC. Cổng USB tuy kh&ocirc;ng mạ v&agrave;ng nhưng nh&igrave;n hiện đại v&agrave; được gia c&ocirc;ng tốt n&ecirc;n c&oacute; thể n&oacute;i tuổi thọ cũng kh&aacute; ổn.</p>

<p>Kết hợp l&agrave; độ d&agrave;i d&acirc;y l&yacute; tưởng ở mức 2.09 m, đ&acirc;y l&agrave; một điểm cộng để bạn c&oacute; thể thoải m&aacute;i chơi game m&agrave; kh&ocirc;ng sợ bị căng d&acirc;y. Mặc d&ugrave; d&acirc;y chuột kh&ocirc;ng được l&agrave;m từ sợi d&ugrave; nhưng với loại nhựa n&agrave;y m&igrave;nh thấy vẫn rất ổn, c&oacute; độ dẻo, độ mềm mại, linh hoạt khi sử dụng v&agrave; khi quấn gọn lại mang đi cũng kh&ocirc;ng hề bị rối hay dập m&oacute;p d&acirc;y. Nh&igrave;n chung, c&aacute;c phần kết nối theo m&igrave;nh cảm nhận th&igrave; được gia c&ocirc;ng tốt v&agrave; c&oacute; độ bền ổn.</p>

<p>Sở hữu th&acirc;n h&igrave;nh nhỏ gọn, dễ cầm, hiệu năng cực tốt c&ugrave;ng mức gi&aacute; mềm mại,&nbsp;chuột&nbsp;Gaming Logitech G102 Gen2 Lightsync ph&ugrave; hợp với người chơi game n&oacute;i ri&ecirc;ng v&agrave; cả người b&igrave;nh thường n&oacute;i chung.</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (47, N'Chuột Bluetooth Silent Logitech M240', 400000, N'chuot_logitech_hong.png', CAST(N'2024-05-10' AS Date), 1, 31, 42, N'<p>Chuột Bluetooth Silent Logitech M240&nbsp;với kiểu d&aacute;ng gọn g&agrave;ng, gam m&agrave;u đẹp mắt, k&iacute;ch thước vừa vặn tay cầm, kết nối ổn định c&ugrave;ng độ nhạy kh&aacute; cao, hứa hẹn mang đến cho bạn những trải nghiệm tuyệt vời.</p>

<p>&bull;&nbsp;M&agrave;u sắc thanh lịch, khối lượng si&ecirc;u gọn nhẹ, kh&ocirc;ng chiếm qu&aacute; nhiều diện t&iacute;ch kh&ocirc;ng gian, tiện lợi bỏ v&agrave;o balo hay t&uacute;i x&aacute;ch mang theo bất cứ đ&acirc;u.</p>

<p>&bull;&nbsp;Thiết kế&nbsp;chuột&nbsp;với đường n&eacute;t sắc sảo đến từng chi tiết đem đến cho người d&ugrave;ng cảm gi&aacute;c &ecirc;m tay trong qu&aacute; tr&igrave;nh sử dụng, hạn chế mỏi tay khi d&ugrave;ng trong thời gian d&agrave;i.</p>

<p>&bull; Trang bị tốc độ di chuyển kh&aacute; nhanh v&agrave; phản hồi cao nhờ độ ph&acirc;n giải l&ecirc;n đến 4000 DPI, bạn c&oacute; thể điều chỉnh mức DPI ph&ugrave; hợp cho từng loại t&aacute;c vụ, tối ưu trải nghiệm sử dụng.</p>

<p>&bull;&nbsp;Bạn c&oacute; thể dễ d&agrave;ng kết nối với c&aacute;c thiết bị th&ocirc;ng qua Bluetooth trong v&ograve;ng 10 m, đường truyền ổn định v&agrave; mượt m&agrave;.</p>

<p>&bull;&nbsp;Chuột&nbsp;Logitech&nbsp;sử dụng vi&ecirc;n pin AA gi&uacute;p bạn c&oacute; thể y&ecirc;n t&acirc;m d&ugrave;ng trong thời gian kh&aacute; l&acirc;u m&agrave; kh&ocirc;ng lo gi&aacute;n đoạn, dễ d&agrave;ng thay thế khi hết pin.&nbsp;</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (48, N'Chuột Không dây DareU LM106G', 15000000, N'chuot_daru.png', CAST(N'2024-05-10' AS Date), 1, 32, 46, N'<p>Chuột Kh&ocirc;ng d&acirc;y DareU LM106G&nbsp;gọn nhẹ, dễ sử dụng, kết nối nhanh ch&oacute;ng, tương th&iacute;ch nhiều thiết bị.</p>

<p>&bull;&nbsp;Đường n&eacute;t mềm mại, độ ho&agrave;n thiện cao,&nbsp;chuột&nbsp;vừa vặn v&agrave; &ecirc;m tay khi sử dụng.</p>

<p>&bull;&nbsp;M&agrave;u sắc th&ocirc;ng dụng, ph&ugrave; hợp với mọi người d&ugrave;ng.</p>

<p>&bull;&nbsp;Chuột DareU&nbsp;được thiết kế đối xứng 2 b&ecirc;n, tay tr&aacute;i hay tay phải sử dụng đều thuận.</p>

<p>&bull;&nbsp;Ph&iacute;m bấm c&oacute; độ nảy tốt, con lăn chuột mềm mại, thoải m&aacute;i thực hiện c&aacute;c thao t&aacute;c di chuột tr&ecirc;n mặt phẳng.</p>

<p>&bull;&nbsp;Kết nối chuột v&agrave; thiết bị sử dụng hệ điều h&agrave;nh Windows, macOS nhanh ch&oacute;ng bằng đầu thu&nbsp;USB Receiver.</p>

<p>&bull;&nbsp;Sản phẩm tương th&iacute;ch với c&aacute;c d&ograve;ng m&aacute;y sử dụng hệ điều h&agrave;nh Windows, macOS.</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (49, N'Router Wifi Chuẩn Wifi 6 Asus AX53U', 1190000, N'router_Asus_AX53U.png', CAST(N'2024-05-10' AS Date), 1, 8, 24, N'<p>Thiết bị mạng&nbsp;cung cấp đường truyền tốc độ cao với băng tần k&eacute;p, chuẩn Wifi 802.11AX (WiFi 6)&nbsp;</p>

<p>Asus AX53U cung cấp đường truyền tốc độ Gigabit l&ecirc;n đến&nbsp;1201 Mbps&nbsp;tr&ecirc;n băng tần&nbsp;5 GHz&nbsp;v&agrave;&nbsp;574 Mbps&nbsp;tr&ecirc;n băng tần&nbsp;2.4 GHz&nbsp;đảm bảo độ mượt khi lướt web giải tr&iacute;, hay trải nghiệm c&aacute;c video 4K, chiến game online đồ họa cao v&agrave; c&aacute;c bộ phim FHD,&hellip;</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (50, N'Router Wifi Chuẩn Wifi 6 Asus AX1800HP', 1380000, N'router_asus_AX1800HP.png', CAST(N'2024-05-10' AS Date), 1, 8, 64, N'<p>Bộ Ph&aacute;t S&oacute;ng Wifi Router Chuẩn Wifi 6 Asus AX1800HP Đen&nbsp;với chuẩn WiFi 6 (802.11ax) hỗ trợ c&ocirc;ng nghệ MU-MIMO v&agrave; OFDMA cho hiệu quả kết nối v&agrave; lưu lượng tốt hơn.</p>

<p>&bull;&nbsp;Router&nbsp;hỗ trợ c&ocirc;ng nghệ OFDMA trong chuẩn WiFi 6 (802.11ax) chia mỗi k&ecirc;nh th&agrave;nh c&aacute;c k&ecirc;nh phụ nhỏ, cho ph&eacute;p t&iacute;n hiệu từ nhiều thiết bị được nh&oacute;m lại với nhau v&agrave; truyền đồng thời, giảm độ trễ từ đ&oacute; mang lại trải nghiệm lướt WiFi mượt m&agrave; hơn, thời gian phản hồi nhanh hơn.</p>

<p>&bull;&nbsp;Router Asus&nbsp;trang bị một cổng WAN Gigabit v&agrave; bốn cổng LAN Gigabit, cho tốc độ nhanh hơn 10 lần so với Ethernet 100 Base-T.</p>

<p>&bull;&nbsp;ASUS RT-AX1800HP (Gaming Router) Wifi AX1800 2 băng tần,&nbsp;router Wifi c&oacute; thể mở rộng, Wifi 6 (802.11ax), AiMesh Wifi Mesh, MU-MIMO, AiProtection.</p>

<p>&bull;&nbsp;Thiết bị mạng Asus&nbsp;c&oacute; tổng tốc độ mạng khoảng 1800 Mbps - 574 Mbps tr&ecirc;n băng tần 2.4 GHz v&agrave; 1201 Mbps tr&ecirc;n băng tần 5 GHz.</p>

<p>&bull;&nbsp;Ngo&agrave;i ra, việc bảo vệ kết nối mạng gia đ&igrave;nh của bạn an to&agrave;n hơn với phần mềm AiProtection được hợp t&aacute;c với Trend Micro, gi&uacute;p chặn c&aacute;c mối đe dọa internet, bảo mật cho tất cả c&aacute;c thiết bị th&ocirc;ng minh của bạn được kết nối với router.</p>

<p>&bull;&nbsp;Thiết bị mạng&nbsp;kiểm so&aacute;t v&agrave; tối ưu linh hoạt router qua bảng điều khiển ASUSWRT giao diện th&acirc;n thiện người d&ugrave;ng, việc thiết lập, gi&aacute;m s&aacute;t v&agrave; điều khiển c&aacute;c ứng dụng mạng đều trong một nơi điều chỉnh trực quan.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (51, N'OPPO Reno11 F 5G', 8790000, N'dt_oppo_renno18.png', CAST(N'2024-05-10' AS Date), 1, 1, 535, N'<p>OPPO Reno11 F 5G&nbsp;l&agrave; một chiếc điện thoại tầm trung mới được OPPO ra mắt trong thời gian gần đ&acirc;y. M&aacute;y sở hữu nhiều ưu điểm nổi bật như thiết kế trẻ trung, m&agrave;n h&igrave;nh đẹp, hiệu năng mạnh mẽ nhờ chip Dimensity 7050 5G, hứa hẹn mang đến trải nghiệm tốt khi sử dụng.</p>

<p>Tạo h&igrave;nh vu&ocirc;ng vức c&ugrave;ng hiệu ứng mặt lưng cuốn h&uacute;t</p>

<p>Thiết kế của điện thoại n&agrave;y được tạo h&igrave;nh vu&ocirc;ng vức hiện đại, đem đến một vẻ đẹp đầy trẻ trung v&agrave; c&aacute; t&iacute;nh. Điều đặc biệt l&agrave; phi&ecirc;n bản m&agrave;u t&iacute;m của Reno11 F 5G đ&atilde; g&acirc;y ấn tượng mạnh mẽ với c&aacute;c t&iacute;n đồ c&ocirc;ng nghệ, lấy cảm hứng từ những kết cấu kim cương, n&oacute; tạo n&ecirc;n hiệu ứng lấp l&aacute;nh tr&ecirc;n bề mặt lưng cực kỳ th&uacute; vị.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (52, N'OPPO A18', 5990000, N'dt_oppo_renno18.png', CAST(N'2024-05-10' AS Date), 1, 1, 526, N'<p>PPO A18&nbsp;-&nbsp;một trong những sản phẩm điện thoại gi&aacute; rẻ được OPPO giới thiệu tại thị trường Việt Nam trong những th&aacute;ng cuối năm 2023. Thiết kế của m&aacute;y vẫn giữ nguy&ecirc;n phong c&aacute;ch quen thuộc như c&aacute;c sản phẩm&nbsp;điện thoại OPPO A, đi k&egrave;m với đ&oacute; l&agrave; một m&agrave;n h&igrave;nh sắc n&eacute;t c&ugrave;ng một hiệu năng ổn định.</p>

<p>Thiết kế trẻ trung bật tung c&aacute; t&iacute;nh</p>

<p>Khi cầm tr&ecirc;n tay OPPO A18, điều thu h&uacute;t m&igrave;nh đầu ti&ecirc;n ch&iacute;nh l&agrave; thiết kế vu&ocirc;ng vức quen thuộc của d&ograve;ng điện thoại OPPO A. Sự tinh tế v&agrave; độc đ&aacute;o trong h&igrave;nh d&aacute;ng của m&aacute;y đ&atilde; tạo ra một ấn tượng mạnh mẽ từ c&aacute;i nh&igrave;n đầu ti&ecirc;n.</p>

<p>Mặt lưng được l&agrave;m từ thủy tinh hữu cơ, kh&ocirc;ng chỉ mang lại vẻ đẹp v&agrave; sự bền bỉ theo thời gian, n&oacute; c&ograve;n tạo cảm gi&aacute;c sang trọng v&agrave; cao cấp khi cầm nắm.</p>

<p>Một điểm đặc biệt thu h&uacute;t của OPPO A18 ch&iacute;nh l&agrave; khả năng đổi m&agrave;u đẹp mắt tr&ecirc;n mặt lưng khi tiếp x&uacute;c với &aacute;nh s&aacute;ng mặt trời hay những nguồn s&aacute;ng. M&igrave;nh cảm thấy th&uacute; vị khi thấy m&agrave;u sắc của điện thoại thay đổi t&ugrave;y thuộc v&agrave;o &aacute;nh s&aacute;ng v&agrave; g&oacute;c nh&igrave;n.</p>

<p>Với khối lượng chỉ 188 g, m&igrave;nh c&oacute; thể sử dụng điện thoại trong thời gian d&agrave;i m&agrave; kh&ocirc;ng gặp phải bất kỳ cảm gi&aacute;c kh&ocirc;ng thoải m&aacute;i n&agrave;o.</p>

<p>Ngo&agrave;i ra, việc OPPO A18 trang bị đầy đủ c&aacute;c cổng kết nối như cổng sạc Type-C v&agrave; jack tai nghe 3.5 mm đ&atilde; l&agrave;m m&igrave;nh cảm thấy thoải m&aacute;i khi sử dụng trong mọi t&igrave;nh huống. Tất cả c&aacute;c chi tiết đều được chăm ch&uacute;t kỹ lưỡng, từ thiết kế đến t&iacute;nh năng, tạo ra một trải nghiệm to&agrave;n diện v&agrave; th&uacute; vị.</p>

<p>Mặt trước, của OPPO đ&atilde; lựa chọn một thiết kế m&agrave;n h&igrave;nh giọt nước quen thuộc cho chiếc điện thoại, với ba cạnh viền được tối ưu h&oacute;a một c&aacute;ch tinh tế v&agrave; đối xứng. Mặc d&ugrave; c&oacute; thể thấy rằng phần viền dưới c&oacute; vẻ d&agrave;y một ch&uacute;t, nhưng điều n&agrave;y kh&ocirc;ng ảnh hưởng đ&aacute;ng kể đến trải nghiệm xem phim hay chơi game.</p>

<p>Hiển thị chi tiết h&igrave;nh ảnh</p>

<p>Với tấm nền IPS LCD k&iacute;ch thước 6.56 inch, mỗi chi tiết tr&ecirc;n m&agrave;n h&igrave;nh được t&aacute;i hiện một c&aacute;ch r&otilde; r&agrave;ng v&agrave; chi tiết. Độ ph&acirc;n giải HD+ đảm bảo rằng h&igrave;nh ảnh v&agrave; nội dung hiển thị tr&ecirc;n m&agrave;n h&igrave;nh đều sắc n&eacute;t v&agrave; chi tiết trong tầm gi&aacute;.</p>

<p>Tuy nhi&ecirc;n, điểm đặc biệt v&agrave; thu h&uacute;t nhất ch&iacute;nh l&agrave; tần số qu&eacute;t 90 Hz. Khi cuộn trang web, chơi game hoặc xem video, m&igrave;nh cảm nhận được sự mượt m&agrave; v&agrave; nhất qu&aacute;n trong c&aacute;c chuyển động tr&ecirc;n m&agrave;n h&igrave;nh. Tần số qu&eacute;t cao mang lại trải nghiệm mượt m&agrave; v&agrave; đ&aacute;ng kinh ngạc, khiến cho việc sử dụng điện thoại trở n&ecirc;n th&uacute; vị hơn bao giờ hết.</p>

<p>Đặc biệt, khi m&igrave;nh điều chỉnh dải m&agrave;u ở chế độ rực rỡ m&aacute;y sẽ sử dụng dải m&agrave;u DCI-P3, khi m&igrave;nh xem video hay trải nghiệm lướt web ở chế độ n&agrave;y h&igrave;nh ảnh m&agrave; m&aacute;y mang lại c&oacute; sự rực rỡ, HDR cao c&ugrave;ng với đ&oacute; độ tương phản v&agrave; m&agrave;u đen được h&atilde;ng căn chỉnh rất ph&ugrave; hợp với mắt.</p>

<p>Điểm đ&aacute;ng tiếc l&agrave; m&aacute;y c&oacute; độ s&aacute;ng kh&aacute; thấp chỉ đạt được 720 nits, khi m&igrave;nh trải nghiệm ngo&agrave;i trời để xem bản đồ hay tin nhắn th&igrave; những v&ugrave;ng tối điểm m&ugrave; vẫn xuất hiện g&acirc;y một &iacute;t ảnh hưởng đến trải nghiệm xem của m&igrave;nh. Nhưng nếu bạn d&ugrave;ng vật để che l&agrave;m hạn chế &aacute;nh nắng gắt đi một &iacute;t th&igrave; trải nghiệm vẫn rất tuyệt vời.</p>

<p>Hiệu năng tốt cho mọi t&aacute;c vụ</p>

<p>Điện thoại OPPO&nbsp;n&agrave;y sử dụng chip Helio G85 thực sự l&agrave; một sự kết hợp mạnh mẽ giữa hiệu năng v&agrave; tiết kiệm điện. Chipset n&agrave;y cung cấp sức mạnh xử l&yacute; đủ mạnh mẽ để đ&aacute;p ứng mọi nhu cầu của m&igrave;nh, từ việc xem video, chơi game đến l&agrave;m việc với c&aacute;c ứng dụng đa nhiệm.</p>

<p>Với kiến tr&uacute;c 8 nh&acirc;n, chip Helio G85 gi&uacute;p OPPO A18 hoạt động mượt m&agrave; v&agrave; nhanh ch&oacute;ng, đồng thời tiết kiệm pin hiệu quả. M&aacute;y cho m&igrave;nh một trải nghiệm với c&aacute;c ứng dụng v&agrave; game y&ecirc;u th&iacute;ch m&agrave; kh&ocirc;ng gặp phải sự giật lag hay trễ h&igrave;nh.</p>

<p>Đặc biệt, khi chơi game, hiệu năng của OPPO A18 thật sự ấn tượng. Chip Helio G85 kết hợp c&ugrave;ng GPU Mali-G52 MP2 mang lại khả năng xử l&yacute; đồ họa tốt, gi&uacute;p tr&ograve; chơi chạy mượt m&agrave; v&agrave; đồ họa r&otilde; n&eacute;t. Việc n&agrave;y tạo ra trải nghiệm gaming tuyệt vời v&agrave; th&uacute; vị.</p>

<p>Đồng thời, đ&acirc;y l&agrave; mẫu&nbsp;điện thoại RAM 4 GB&nbsp;v&agrave; đi c&ugrave;ng với t&iacute;nh năng mở rộng RAM hiện đại. Ch&iacute;nh v&igrave; thế việc chuyển đổi giữa c&aacute;c tab diễn ra kh&aacute; mượt m&agrave;, hiếm khi gặp vấn đề giật lag.</p>

<p>Hỗ trợ quay chụp với độ chi tiết tốt</p>

<p>Camera tr&ecirc;n OPPO A18 mang lại cho m&igrave;nh một trải nghiệm chụp ảnh đa dạng v&agrave; th&uacute; vị. Với camera ch&iacute;nh 8 MP, m&igrave;nh đ&atilde; c&oacute; cơ hội ghi lại những khoảnh khắc đ&aacute;ng nhớ trong cuộc sống hằng ng&agrave;y. D&ugrave; l&agrave; cảnh quan tự nhi&ecirc;n hay chụp ảnh trong nh&agrave;, m&aacute;y đều cho ra những bức ảnh kh&aacute; r&otilde; n&eacute;t, với m&agrave;u sắc tự nhi&ecirc;n v&agrave; c&acirc;n đối.</p>

<p>Camera phụ 2 MP l&agrave; một lựa chọn tuyệt vời cho việc chụp ảnh x&oacute;a ph&ocirc;ng. M&igrave;nh thấy rằng n&oacute; rất hữu &iacute;ch khi muốn ghi lại những h&igrave;nh ảnh chi tiết v&agrave; đem đến cho ảnh một g&oacute;c nh&igrave;n độc đ&aacute;o.</p>

<p>Ngo&agrave;i ra, camera selfie 5 MP tr&ecirc;n OPPO A18 cũng kh&ocirc;ng l&agrave;m m&igrave;nh thất vọng. M&igrave;nh đ&atilde; c&oacute; thể chụp những bức ảnh tự sướng tươi s&aacute;ng v&agrave; r&otilde; n&eacute;t, thậm ch&iacute; trong điều kiện &aacute;nh s&aacute;ng yếu. C&aacute;c t&iacute;nh năng l&agrave;m đẹp cũng gi&uacute;p m&igrave;nh tạo ra những bức ảnh tự tin v&agrave; xinh đẹp hơn.</p>

<p>D&ugrave;ng l&acirc;u với vi&ecirc;n pin lớn</p>

<p>Kh&ocirc;ng chỉ tạo ấn tượng về hiệu năng v&agrave; thiết kế, một ưu điểm kh&aacute;c của m&aacute;y l&agrave; thời lượng pin. Với dung lượng pin l&ecirc;n đến 5000 mAh v&agrave; khả năng hỗ trợ sạc 10 W, gi&uacute;p bạn c&oacute; thể sử dụng m&aacute;y li&ecirc;n tục cả ng&agrave;y m&agrave; kh&ocirc;ng phải bận t&acirc;m nhiều về việc sạc pin.</p>

<p>Tuy nhi&ecirc;n, với mức sạc 10 W m&aacute;y sẽ mất một khoảng thời gian để c&oacute; thể sạc đầy. V&igrave; thế m&agrave; việc sạc v&agrave;o ban đ&ecirc;m trước khi đi ngủ l&agrave; một lựa chọn th&ocirc;ng minh, sau một đ&ecirc;m l&agrave; bạn đ&atilde; c&oacute; ngay một chiếc điện thoại đầy năng lượng, gi&uacute;p bạn sẵn s&agrave;ng cho một ng&agrave;y mới đầy năng động.</p>

<p>Với thiết kế đẹp mắt, m&agrave;n h&igrave;nh hiển thị chi tiết hay c&oacute; một hiệu năng đầy ổn định, OPPO A18 ch&iacute;nh l&agrave; một sự lựa chọn ph&ugrave; hợp cho mọi đối tượng người d&ugrave;ng, đặc biệt l&agrave; cho c&aacute;c bạn học sinh, sinh vi&ecirc;n d&ugrave;ng để tra cứu t&agrave;i liệu học tập hay những người d&ugrave;ng cần một chiếc điện thoại phụ để thuận tiện cho c&ocirc;ng việc với một mức gi&aacute; hợp l&yacute;.</p>
', 0.05, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (53, N'Samsung Galaxy S23 Ultra 5G ', 20990000, N'dt_ss_galaxys23utralg.png', CAST(N'2024-05-10' AS Date), 1, 2, 779, N'<p>Samsung Galaxy S23 Ultra 5G 256GB&nbsp;l&agrave; chiếc smartphone cao cấp nhất của nh&agrave; Samsung, sở hữu cấu h&igrave;nh kh&ocirc;ng tưởng với con chip khủng được&nbsp;Qualcomm tối ưu ri&ecirc;ng cho d&ograve;ng Galaxy&nbsp;v&agrave; camera l&ecirc;n đến 200 MP, xứng danh l&agrave; chiếc flagship Android được mong đợi nhất trong năm 2023.</p>

<p>T&iacute;ch hợp c&aacute;c t&iacute;nh năng AI</p>

<p>Galaxy S23 Ultra đ&atilde; g&acirc;y ấn tượng mạnh mẽ khi ra mắt với thiết kế đột ph&aacute; v&agrave; hiệu suất vượt trội. V&agrave;o cuối th&aacute;ng 3 năm 2024, Samsung đ&atilde; giới thiệu One UI 6.1, đưa v&agrave;o Galaxy S23 Ultra c&aacute;c t&iacute;nh năng AI ti&ecirc;n tiến từ d&ograve;ng Galaxy S24 trước đ&oacute;.&nbsp;</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (54, N'Samsung Galaxy A55 5G', 11490000, N'dt_ss_a55_5g.png', CAST(N'2024-05-10' AS Date), 1, 2, 536, N'<p>Samsung Galaxy A55 5G, mẫu điện thoại mới của d&ograve;ng Galaxy A, ra mắt với nhiều c&ocirc;ng nghệ ti&ecirc;n phong k&egrave;m theo kết nối 5G nhanh ch&oacute;ng. Được giới thiệu như một lựa chọn đa năng, chất lượng cao nhưng c&oacute; mức gi&aacute; hợp l&yacute;, hứa hẹn sẽ l&agrave; sản phẩm đ&aacute;ng ch&uacute; &yacute; tr&ecirc;n thị trường.</p>

<p>Thiết kế sang trọng, tinh tế</p>

<p>Điện thoại Galaxy A55 5G tạo điểm nhấn với chất lượng v&agrave; thiết kế vu&ocirc;ng vức tinh tế. N&oacute; thể hiện sự h&ograve;a trộn ho&agrave;n hảo giữa đường n&eacute;t mềm mại v&agrave; c&aacute;c g&oacute;c cạnh, kết hợp với viền m&agrave;n h&igrave;nh si&ecirc;u mỏng v&agrave; mặt lưng nh&aacute;m mịn, tạo ra cảm gi&aacute;c sang trọng v&agrave; đẳng cấp.</p>

<p>Galaxy A55 5G với khung kim loại chắc chắn kh&ocirc;ng chỉ th&ecirc;m phần cuốn h&uacute;t m&agrave; c&ograve;n cung cấp độ bền cao. Sự kết hợp giữa vẻ ngo&agrave;i sang trọng v&agrave; t&iacute;nh bền bỉ của khung viền, tạo n&ecirc;n một chiếc điện thoại kh&ocirc;ng chỉ đẹp mắt m&agrave; c&ograve;n đ&aacute;ng tin cậy.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (55, N'Samsung Galaxy M54 5G', 8990000, N'dt_ss_m54g.png', CAST(N'2024-05-10' AS Date), 1, 2, 366, N'<p>Tiếp nối th&agrave;nh c&ocirc;ng của&nbsp;Galaxy M53 5G, Samsung tiếp tục tung ra thị trường mẫu điện thoại&nbsp;Samsung Galaxy M54 5G. Lần ra mắt n&agrave;y Samsung đ&atilde; n&acirc;ng cấp về mặt hiệu năng, dung lượng pin đồng thời cải tiến về mặt thiết kế gi&uacute;p đem đến sản phẩm tốt nhất cho bạn.</p>

<p>Thao t&aacute;c nhanh ch&oacute;ng với Exynos 1380</p>

<p>Điểm đầu ti&ecirc;n m&agrave; m&igrave;nh muốn n&oacute;i sau khi trải nghiệm Galaxy M54 5G ch&iacute;nh&nbsp;l&agrave; phần hiệu năng, m&aacute;y được trang bị con chip Exynos&nbsp;1380&nbsp;8 nh&acirc;n đầy mạnh mẽ. C&oacute; thể thấy với Exynos 1380 th&igrave; m&aacute;y sẽ đ&aacute;p ứng hầu hết mọi t&aacute;c vụ từ đơn giản đến phức tạp một c&aacute;ch nhanh ch&oacute;ng.</p>

<p>M&igrave;nh cũng kh&aacute; lo sợ về hiệu năng của m&aacute;y khi sử dụng con chip c&acirc;y nh&agrave; l&aacute; vườn của Samsung. Tuy nhi&ecirc;n, lần n&agrave;y h&atilde;ng đ&atilde; xử l&yacute; rất tốt v&agrave; mang đến một trải nghiệm tuyệt vời với việc xử l&yacute; c&aacute;c t&aacute;c vụ hằng ng&agrave;y.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (56, N'Điện thoại realme C65', 3800000, N'realmeC65.png', CAST(N'2024-05-10' AS Date), 1, 33, 423, N'<p>Realme C65 (8GB/256GB)&nbsp;l&agrave; một trong những chiếc điện thoại th&ocirc;ng minh độc đ&aacute;o v&agrave; đ&aacute;ng ch&uacute; &yacute; trong ph&acirc;n kh&uacute;c gi&aacute; phổ th&ocirc;ng. Với thiết kế hiện đại v&agrave; c&aacute;c t&iacute;nh năng th&uacute; vị, hứa hẹn mang lại trải nghiệm tuyệt vời cho người d&ugrave;ng.</p>

<p>Vẻ ngo&agrave;i đẹp mắt thu h&uacute;t &aacute;nh nh&igrave;n</p>

<p>Thiết kế của realme C65 l&agrave; sự kết hợp h&agrave;i h&ograve;a giữa sự hiện đại v&agrave; t&iacute;nh thẩm mỹ, tạo ra một c&aacute;i nh&igrave;n đầy ấn tượng v&agrave; sang trọng. M&aacute;y c&oacute; m&agrave;n h&igrave;nh lớn với tỷ lệ khung h&igrave;nh cao, tạo ra một kh&ocirc;ng gian hiển thị rộng lớn, đồng thời mang đến sự gọn g&agrave;ng v&agrave; hiện đại cho điện thoại.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (57, N'Điện thoại realme 11', 6990000, N'realme11.png', CAST(N'2024-05-10' AS Date), 1, 33, 424, N'<p>Realme 11&nbsp;l&agrave; một trong những sản phẩm mới nhất của h&atilde;ng điện thoại realme. Với nhiều t&iacute;nh năng nổi bật v&agrave; thiết kế đẹp mắt, realme 11 hứa hẹn sẽ mang đến cho người d&ugrave;ng một trải nghiệm tuyệt vời.&nbsp;</p>

<p>Thiết kế hiện đại c&ugrave;ng m&agrave;u sắc trẻ trung</p>

<p>realme 11 l&agrave; một trong những sản phẩm mới nhất của h&atilde;ng&nbsp;điện thoại realme. Với thiết kế vu&ocirc;ng vức, m&agrave;n h&igrave;nh nốt ruồi, realme 11 mang đến cho người d&ugrave;ng một trải nghiệm đầy cao cấp.</p>
', 0, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (59, N'Camera IP 360 Độ 3MP Xiaomi Mi Home C300', 855000, N'Camera_C300.png', CAST(N'2024-05-12' AS Date), 1, 4, 66, N'<p>Camera IP 360 Độ 3MP Xiaomi Mi Home C300&nbsp;l&agrave; một thiết bị an ninh th&ocirc;ng minh, c&oacute; khả năng quan s&aacute;t bao qu&aacute;t với độ ph&acirc;n giải 3 MP, ph&aacute;t hiện chuyển động bằng c&ocirc;ng nghệ AI v&agrave; hỗ trợ đ&agrave;m thoại 2 chiều, đem đến cho người d&ugrave;ng trải nghiệm sử dụng tuyệt vời.</p>

<p>Thiết kế vừa cầm tay, dễ d&agrave;ng lắp đặt</p>

<p>Camera c&oacute; h&igrave;nh dạng như quả b&oacute;ng nhỏ, đế của camera trang bị cổng cắm nguồn tiện lợi, b&ecirc;n cạnh l&agrave; n&uacute;t reset. Thiết kế với lớp vỏ cứng c&aacute;p, bền bỉ, kh&ocirc;ng dễ b&aacute;m bụi bẩn, c&ugrave;ng gam m&agrave;u trắng tinh tế v&agrave; nhiệt độ hoạt động từ &acirc;m 10 độ C đến 40 độ C, ph&ugrave; hợp lắp đặt v&agrave; sử dụng với nhiều kh&ocirc;ng gian nội thất kh&aacute;c nhau.</p>
', 0.2, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (60, N'Micro không dây Pasion Echo', 1790000, N'Micro_Pasion_Echo.png', CAST(N'2024-05-12' AS Date), 1, 34, 685, N'', 0.05, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (62, N'Micro không dây JBL VM300 Chỉ bán online', 9900000, N'Micro_JBL_VM300.png', CAST(N'2024-05-12' AS Date), 1, 27, 45, N'<p>Micro kh&ocirc;ng d&acirc;y JBL VM300&nbsp;hoạt động hiệu quả tr&ecirc;n băng tần&nbsp;UHF&nbsp;trong dải tần số từ 640 MHz - 690 MHz, duy tr&igrave; kết nối liền mạch, cho &acirc;m thanh ph&aacute;t ra r&otilde; r&agrave;ng, trong trẻo.</p>

<p>Tổng quan sản phẩm&nbsp;</p>

<p>- JBL VM300 bao gồm&nbsp;1 đầu thu v&agrave; 2 micro kh&ocirc;ng d&acirc;y&nbsp;c&oacute; vẻ ngo&agrave;i đơn giản, hiện đại, gam m&agrave;u đen thời thượng, sang trọng, gi&uacute;p tạo n&ecirc;n sự kết nối liền mạch với tổng thể thiết kế nội thất của ph&ograve;ng kh&aacute;ch, ph&ograve;ng ngủ, ph&ograve;ng karaoke gia đ&igrave;nh.&nbsp;</p>

<p>-&nbsp;Micro&nbsp;l&agrave;m bằng&nbsp;hợp kim&nbsp;cao cấp, đầu micro l&agrave;m từ&nbsp;th&eacute;p kh&ocirc;ng gỉ&nbsp;hạn chế rỉ s&eacute;t, chịu lực t&aacute;c động tốt, duy tr&igrave; t&iacute;nh thẩm mỹ cao cho sản phẩm.&nbsp;C&oacute; một lớp m&agrave;ng bằng vải mỏng ở trong đầu micro cho khả năng lọc &acirc;m tốt. Bạn c&oacute; thể theo d&otilde;i được t&igrave;nh trạng pin, c&aacute;c tần số v&agrave; thao t&aacute;c bật/tắt micro dễ d&agrave;ng với n&uacute;t điều khiển v&agrave; m&agrave;n h&igrave;nh LCD chất lượng tốt được thiết kế tr&ecirc;n tay cầm micro.</p>

<p>- Vỏ ngo&agrave;i của đầu thu bằng chất liệu&nbsp;hợp kim nh&ocirc;m&nbsp;sử dụng bền bỉ, cứng c&aacute;p, mặt trước c&oacute; m&agrave;n h&igrave;nh LCD hiển thị k&iacute;ch cỡ lớn đi k&egrave;m bảng điều khiển c&oacute; c&aacute;c n&uacute;t t&ugrave;y chỉnh k&ecirc;nh linh hoạt. Ở mặt sau của đầu thu l&agrave; ăng ten v&agrave; hệ thống cổng kết nối để bắt s&oacute;ng, gh&eacute;p nối với c&aacute;c thiết bị kh&aacute;c dễ d&agrave;ng.</p>

<p>Tần số - Khoảng c&aacute;ch sử dụng tối đa - Kết nối</p>

<p>- Sản phẩm li&ecirc;n kết với đầu thu qua s&oacute;ng&nbsp;UHF&nbsp;vận h&agrave;nh tr&ecirc;n dải tần số&nbsp;640 MHz - 690 MHz&nbsp;cho hiệu quả kết nối chất lượng cao, duy tr&igrave; đường truyền ổn định, hạn chế khả năng bị hụt s&oacute;ng, mất tiếng, bị nhiễu khi d&ugrave;ng.&nbsp;</p>

<p>- Micro kh&ocirc;ng d&acirc;y thiết lập đến&nbsp;200&nbsp;k&ecirc;nh&nbsp;tần số, hoạt động trong khoảng c&aacute;ch đến&nbsp;50m, cho khoảng c&aacute;ch sử dụng xa, đ&aacute;p ứng nhu cầu trải nghiệm đa dạng.&nbsp;</p>

<p>- Được trang bị với 2 &times; balanced XLR, 1 &times; 6.35 mm unbalanced TS.&nbsp;</p>

<p>Tiện &iacute;ch&nbsp;</p>

<p>-&nbsp;Micro JBL c&oacute; t&iacute;nh&nbsp;chống h&uacute; tốt, bắt &acirc;m chuẩn x&aacute;c, &acirc;m thanh ph&aacute;t ra trong sạch, ấm &aacute;p.</p>

<p>-&nbsp;Auto Scan:&nbsp;Tự động t&igrave;m tần số trống.&nbsp;</p>

<p>-&nbsp;Auto Sync:&nbsp;T&iacute;nh năng tự động kết nối mic v&agrave; bộ nhận.&nbsp;</p>

<p>-&nbsp;Auto Mute:&nbsp;Tắt tiếng tự động khi để y&ecirc;n kh&ocirc;ng c&oacute; t&iacute;n hiệu nguồn v&agrave;o trong khoảng 3 gi&acirc;y.&nbsp;</p>

<p>-&nbsp;Shake to Sync:&nbsp;T&iacute;nh năng c&oacute; khả năng đồng bộ c&ugrave;ng l&uacute;c cho 2 micro.</p>

<p>-&nbsp;Auto Wakeup:&nbsp;Micro sẽ hoạt động trở lại ngay khi bạn cầm nắm.&nbsp;</p>

<p>-&nbsp;Auto Sleep: Tự động tắt nguồn nếu bạn để nguy&ecirc;n khi kh&ocirc;ng c&oacute; t&iacute;n hiệu nguồn v&agrave;o trong thời gian 8 ph&uacute;t, hạn chế l&atilde;ng ph&iacute; pin tối ưu.&nbsp;</p>

<p>Sử dụng micro kh&ocirc;ng d&acirc;y hiệu quả</p>

<p>- Để tr&aacute;nh bị h&uacute; khi d&ugrave;ng, bạn n&ecirc;n hướng micro ra xa loa.</p>

<p>- Nếu nhận thấy micro c&oacute; dấu hiệu sắp hết pin, n&ecirc;n kết nối sạc hay thay thế pin mới để qu&aacute; tr&igrave;nh sử dụng li&ecirc;n tục, kh&ocirc;ng bị gi&aacute;n đoạn g&acirc;y mất hứng.</p>

<p>- Thường xuy&ecirc;n lau ch&ugrave;i để giữ cho micro sạch sẽ, kh&ocirc;ng n&eacute;m, quăng, va đập mạnh sẽ gi&uacute;p d&ugrave;ng micro l&acirc;u hơn.</p>

<p>Micro kh&ocirc;ng d&acirc;y JBL VM300&nbsp;tạo ra &acirc;m thanh trong, r&otilde; n&eacute;t, kh&ocirc;ng bị ch&oacute;i tai, d&ugrave;ng hiệu quả trong khoảng c&aacute;ch tới 50m, hỗ trợ đa dạng tiện &iacute;ch, đ&aacute;p ứng nhu cầu sử dụng ở nhiều nơi từ gia đ&igrave;nh đến trường học.</p>
', 0.05, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (63, N'Bàn Phím Có Dây Gaming Asus TUF K1', 990000, N'BP_asus_TUF_K1.png', CAST(N'2024-05-12' AS Date), 1, 8, 134, N'<p>B&agrave;n ph&iacute;m c&oacute; d&acirc;y Gaming Asus TUF K1&nbsp;với thiết kế c&oacute; phần k&ecirc; cổ tay tiện dụng, c&oacute; thể th&aacute;o rời để mang lại sự thoải m&aacute;i d&agrave;i l&acirc;u.</p>

<p>&bull;&nbsp;B&agrave;n ph&iacute;m&nbsp;được trang bị c&aacute;c ph&iacute;m bấm c&oacute; độ phản hồi &ecirc;m &aacute;i với mỗi lần nhấn.</p>

<p>&bull;&nbsp;C&aacute;c ph&iacute;m bấm n&agrave;y được đặt trong một khung chống thấm nước 300 ml, được gia c&ocirc;ng bằng một lớp phủ chuy&ecirc;n dụng v&agrave; được chứng nhận đ&aacute;p ứng hoạt động trong m&ocirc;i trường khắc nghiệt.</p>

<p>&bull;&nbsp;B&agrave;n ph&iacute;m gaming&nbsp;được thiết kế với ghi nhận 19 ph&iacute;m bấm c&ugrave;ng l&uacute;c (NKRO), nhờ đ&oacute; đảm bảo độ ch&iacute;nh x&aacute;c vượt trội v&agrave; kh&ocirc;ng bị bỏ lỡ lần nhấn ph&iacute;m n&agrave;o.</p>

<p>&bull;&nbsp;B&agrave;n ph&iacute;m Asus&nbsp;c&oacute; năm v&ugrave;ng chiếu s&aacute;ng ri&ecirc;ng biệt v&agrave; c&aacute;c thanh RGB nổi bật ở cả hai b&ecirc;n b&agrave;n ph&iacute;m, người d&ugrave;ng c&oacute; thể lựa chọn to&agrave;n bộ phổ m&agrave;u để t&ugrave;y chỉnh ri&ecirc;ng từng v&ugrave;ng, nhờ đ&oacute; gi&uacute;p bạn điều khiển d&agrave;n m&aacute;y của m&igrave;nh s&aacute;ng theo đ&uacute;ng &yacute; muốn.</p>

<p>&bull;&nbsp;N&uacute;m chỉnh &acirc;m lượng chuy&ecirc;n dụng ở g&oacute;c tr&ecirc;n b&ecirc;n phải, Asus TUF K1 gi&uacute;p bạn điều khiển &acirc;m thanh trong game một c&aacute;ch nhanh ch&oacute;ng v&agrave; dễ d&agrave;ng. Bạn c&oacute; thể dễ d&agrave;ng vặn n&uacute;m m&agrave; vẫn b&aacute;m s&aacute;t từng h&agrave;nh động tr&ecirc;n m&agrave;n h&igrave;nh.</p>

<p>&bull;&nbsp;Phần mềm ASUS Armoury Crate hợp nhất c&aacute;c cơ chế điều khiển hệ thống v&agrave; đ&egrave;n để bạn c&oacute; thể nhanh ch&oacute;ng điều chỉnh c&aacute;c c&agrave;i đặt thiết yếu trong một tiện &iacute;ch duy nhất.</p>

<p>&nbsp;</p>
', 0.15, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (64, N'Bàn Phím Bluetooth DareU EK868', 1170000, N'BP_DareU_EK868.png', CAST(N'2024-05-12' AS Date), 1, 32, 352, N'<p>DareU EK868 - Mẫu&nbsp;b&agrave;n ph&iacute;m bluetooth&nbsp;của h&atilde;ng&nbsp;DareU, sở hữu thiết kế cứng c&aacute;p, m&agrave;u sắc trẻ trung c&ugrave;ng keycap thiết kế theo kiểu&nbsp;low-profile&nbsp;độc đ&aacute;o. L&agrave; kiểu r&uacute;t gọn 68 ph&iacute;m, cảm gi&aacute;c g&otilde; nhẹ nh&agrave;ng v&agrave; &acirc;m thanh cực kỳ bắt tai. C&ugrave;ng m&igrave;nh t&igrave;m hiểu c&aacute;ch sử dụng b&agrave;n ph&iacute;m n&agrave;y nh&eacute;!</p>

<p>Hướng dẫn kết nối c&oacute; d&acirc;y</p>

<p>Bước 1: Ở cạnh tr&ecirc;n của b&agrave;n ph&iacute;m, bạn chuyển thanh gạt vật l&yacute; đầu ti&ecirc;n về hệ điều h&agrave;nh Mac/Windows cho ph&ugrave; hợp với m&aacute;y t&iacute;nh bạn đang sử dụng.</p>

<p>Bước 2: Chuyển thanh gạt b&ecirc;n cạnh về chế độ A (chế độ A d&agrave;nh cho kết nối c&oacute; d&acirc;y).</p>

<p>Bước 3: Kết nối b&agrave;n ph&iacute;m với m&aacute;y t&iacute;nh qua d&acirc;y c&aacute;p USB Type-C.</p>

<p>Hướng dẫn kết nối qua bluetooth</p>

<p>B&agrave;n ph&iacute;m EK868 hỗ trợ kết nối tr&ecirc;n c&aacute;c hệ điều h&agrave;nh kh&aacute;c nhau như: macOS, Windows, iOS, Android, bạn c&oacute; thể chuyển đổi giữa c&aacute;c thiết bị bằng c&aacute;ch thao t&aacute;c tr&ecirc;n thanh gạt vật l&yacute; cạnh tr&ecirc;n b&agrave;n ph&iacute;m, sau đ&oacute; tiến h&agrave;nh kết nối như sau:</p>

<p>*Ở b&agrave;i viết n&agrave;y hướng dẫn kết nối tr&ecirc;n hệ điều h&agrave;nh Windows.</p>

<p>Bước 1: Tr&ecirc;n b&agrave;n ph&iacute;m bạn chuyển thanh gạt vật l&yacute; l&ecirc;n nấc số 1 hoặc 2 hoặc 3 (nấc 1, 2, 3 d&agrave;nh cho kết nối kh&ocirc;ng d&acirc;y, mỗi nấc c&oacute; thể kết nối với 1 thiết bị).</p>

<p>Bước 2: Nhấn giữ tổ hợp ph&iacute;m &ldquo;Fn + Q&rdquo; 3 gi&acirc;y để reset kết nối cho đến khi g&oacute;c đ&egrave;n nhấp nh&aacute;y m&agrave;u t&iacute;m.</p>

<p>Bước 3:&nbsp;Tr&ecirc;n&nbsp;m&aacute;y t&iacute;nh, bạn mở c&agrave;i đặt bluetooth, chọn th&ecirc;m thiết bị (1) v&agrave; t&igrave;m thiết bị muốn kết nối t&igrave;m t&ecirc;n &ldquo;EK868 BT Keyboard&rdquo; v&agrave; chọn kết nối.</p>

<p>C&aacute;ch c&agrave;i đặt Driver</p>

<p>Bước 1: V&agrave;o trang&nbsp;website DAREU.</p>

<p>Bước 2: T&igrave;m kiếm Driver cho b&agrave;n ph&iacute;m EK868 &gt; Chọn tải về.</p>

<p>Bước 3: Giải n&eacute;n file v&agrave; tiến h&agrave;nh c&agrave;i đặt như c&aacute;c ứng dụng b&igrave;nh thường.</p>

<p>Bước 4: Sau khi đ&atilde; c&agrave;i đặt Driver th&agrave;nh c&ocirc;ng, bạn chuyển thanh gạt vật l&yacute; của b&agrave;n ph&iacute;m sang chế độ A, sau đ&oacute; kết nối b&agrave;n ph&iacute;m với m&aacute;y t&iacute;nh bằng c&aacute;p USB Type C.</p>

<p>Về phần đ&egrave;n nền th&igrave; b&agrave;n ph&iacute;m EK868 hỗ trợ đ&egrave;n nền 1 chế độ, c&oacute; 4 mức độ s&aacute;ng kh&aacute;c nhau, c&oacute; thể điều chỉnh bằng c&aacute;ch nhấn tổ hợp ph&iacute;m &ldquo;Fn + Space&rdquo; hoặc điều chỉnh trong driver.</p>

<p>C&aacute;ch sử dụng c&aacute;c tổ hợp ph&iacute;m</p>

<p>Fn + Q&nbsp;= Reset kết nối.</p>

<p>Hy vọng với c&aacute;c th&ocirc;ng tin chia sẻ b&ecirc;n tr&ecirc;n, sẽ hỗ trợ bạn sử dụng&nbsp;b&agrave;n ph&iacute;m bluetooth DareU EK868&nbsp;một c&aacute;ch dễ d&agrave;ng v&agrave; c&oacute; năng suất hơn.</p>
', 0.55, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (65, N'Loa Bluetooth Monster Sparkle', 2600000, N'Loa_Monster_Sparkle.png', CAST(N'2024-05-12' AS Date), 1, 24, 224, N'<p>Loa Bluetooth Monster Sparkle&nbsp;với hệ thống đ&egrave;n LED nổi bật c&ugrave;ng thiết kế thu&ocirc;n d&agrave;i đẹp mắt, c&ocirc;ng nghệ &acirc;m thanh sống động, tốc độ kết nối nhanh ch&oacute;ng, tiện lợi sử dụng trong những bữa tiệc c&aacute; nh&acirc;n v&agrave; c&aacute;c buổi tụ họp bạn b&egrave; h&agrave;ng ng&agrave;y.</p>

<p>&bull;&nbsp;Thiết kế gọn g&agrave;ng, khối lượng khoảng 2.6 kg dễ d&agrave;ng di chuyển khi cần, ph&ugrave; hợp với nhiều kh&ocirc;ng gian nội thất trong nh&agrave;.</p>

<p>&bull;&nbsp;Cuốn h&uacute;t trong từng điệu nhạc với mức c&ocirc;ng suất 30 W c&ugrave;ng c&ocirc;ng nghệ &acirc;m thanh độc quyền Monster Sound tr&ecirc;n&nbsp;loa&nbsp;đem đến chất &acirc;m sống động, cảm gi&aacute;c như đang tận hưởng kh&ocirc;ng gian giải tr&iacute; tại rạp chiếu phim.</p>

<p>&bull; Dung lượng pin lớn, lưu trữ năng lượng cho cả ng&agrave;y d&agrave;i sử dụng, sạc 1 lần khoảng 4 tiếng l&agrave; c&oacute; ngay 12 giờ sử dụng li&ecirc;n tục (ở mức 50% &acirc;m lượng).</p>

<p>&bull;&nbsp;Loa Monster&nbsp;hỗ trợ c&ocirc;ng nghệ Bluetooth 5.3 cho tốc độ kết nối nhanh hơn, đường truyền ổn định v&agrave; mượt m&agrave;, liền mạch trải nghiệm &acirc;m thanh của bạn.</p>

<p>&bull;&nbsp;Hiệu ứng đ&egrave;n LED nhấp nh&aacute;y nhiều m&agrave;u sắc c&ugrave;ng khả năng chuyển nhịp theo tiếng nhạc cho người d&ugrave;ng m&atilde;n nh&atilde;n.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 0.2, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (66, N'Loa Vi Tính 2.1 Fenda F670X', 19900000, N'Loa_Fenda _F670X.png', CAST(N'2024-05-12' AS Date), 1, 35, 322, N'<p>Loa Vi T&iacute;nh 2.1 Fenda F670X&nbsp;sở hữu kiểu d&aacute;ng mạnh mẽ, gam m&agrave;u sang trọng, &acirc;m thanh sống động, hiệu ứng đ&egrave;n LED RGB đẹp mắt, kết nối kh&ocirc;ng d&acirc;y nhanh ch&oacute;ng mang đến cho bạn những trải nghiệm tuyệt vời.</p>

<p>Phong c&aacute;ch gaming mạnh mẽ</p>

<p>Sau khi &ldquo;đập hộp&rdquo; th&igrave; m&igrave;nh thấy b&ecirc;n trong c&oacute; 2 loa vệ tinh v&agrave; 1 loa Sub. Loa Sub sẽ c&oacute; k&iacute;ch thước lớn nhất v&agrave; nặng 3.2 kg, c&ograve;n mỗi loa vệ tinh chỉ nặng 0.5 kg. Theo cảm nhận của m&igrave;nh th&igrave; bộ&nbsp;loa vi t&iacute;nh&nbsp;n&agrave;y kh&ocirc;ng qu&aacute; nặng, một người c&oacute; thể nhấc l&ecirc;n v&agrave; di chuyển dễ d&agrave;ng, thuận tiện cho việc sắp xếp.&nbsp;</p>

<p>Phần vỏ của&nbsp;loa Fenda&nbsp;được l&agrave;m từ nhựa cao cấp, bề mặt hơi nh&aacute;m n&ecirc;n khi m&igrave;nh chạm tay v&agrave;o cũng kh&ocirc;ng để lại dấu v&acirc;n tay. Khi loa bị b&aacute;m bụi th&igrave; m&igrave;nh chỉ cần d&ugrave;ng khăn lau sơ qua l&agrave; đ&atilde; sạch, đẹp như ban đầu. Mặt trước của phần loa Sub c&oacute; những đường cắt v&ocirc; c&ugrave;ng c&aacute; t&iacute;nh, kết hợp c&ugrave;ng đ&egrave;n LED RGB tạo n&ecirc;n một ngoại h&igrave;nh nổi bật.</p>

<p>Mặt tr&ecirc;n của loa Sub l&agrave; nơi bố tr&iacute; bảng điều khiển, gồm c&aacute;c n&uacute;t như: N&uacute;t nguồn, chọn nguồn ph&aacute;t, bật/tắt đ&egrave;n, ph&aacute;t/dừng chơi nhạc, l&ugrave;i b&agrave;i h&aacute;t/giảm &acirc;m lượng v&agrave; n&uacute;t chuyển b&agrave;i h&aacute;t/tăng &acirc;m lượng. Tuy n&uacute;t bấm kh&aacute; nhạy nhưng cảm gi&aacute;c khi m&igrave;nh thao t&aacute;c c&aacute;c n&uacute;t n&agrave;y kh&aacute; l&agrave; ọp ẹp, do c&aacute;c ph&iacute;m được l&agrave;m theo dạng tứ gi&aacute;c tự do v&agrave; nối liền với nhau n&ecirc;n khi bấm m&igrave;nh cảm thấy hơi lệch một ch&uacute;t, cần nhiều thời gian để l&agrave;m quen hơn.&nbsp;</p>

<p>Ph&iacute;a cạnh b&ecirc;n loa được trang bị một cổng USB-A. Mặt sau của loa sub l&agrave; nơi bố tr&iacute; c&aacute;c cổng kết nối, gồm: Cổng Coaxial, nguồn ra &acirc;m thanh, nguồn v&agrave;o &acirc;m thanh, n&uacute;t bật/tắt loa v&agrave; một d&acirc;y nguồn. Cạnh b&ecirc;n cổng kết nối l&agrave; Bass Reflex gi&uacute;p cải thiện hiệu suất của loa trầm ở tần số thấp.&nbsp;</p>

<p>C&ograve;n củ loa sẽ được bố tr&iacute; ở mặt b&ecirc;n dưới của loa Sub gi&uacute;p &acirc;m thanh trầm khuếch t&aacute;n rộng v&agrave; đều hơn ra m&ocirc;i trường. Tuy nhi&ecirc;n, khi m&igrave;nh đặt chiếc loa n&agrave;y tr&ecirc;n bề mặt thảm th&igrave; chất lượng &acirc;m thanh sẽ bị giảm đ&aacute;ng kể. V&igrave; vậy, khi sử dụng bạn n&ecirc;n đặt loa ở tr&ecirc;n bề mặt cứng như gỗ hay gạch men để đảm bảo chất lượng &acirc;m thanh.&nbsp;</p>

<p>Về phần loa vệ tinh th&igrave; c&oacute; k&iacute;ch thước kh&aacute; nhỏ gọn, c&aacute;c g&oacute;c được bo cong tinh tế khi m&igrave;nh cầm l&ecirc;n cảm gi&aacute;c kh&aacute; đầm tay. Mặt trước của loa vệ tinh c&oacute; một m&agrave;ng loa v&agrave; Bass Reflex. C&ograve;n ở ph&iacute;a sau loa được trang bị một jack RCA ri&ecirc;ng chứ kh&ocirc;ng gộp chung như những d&ograve;ng loa vi t&iacute;nh kh&aacute;c, m&igrave;nh kh&aacute; th&iacute;ch điểm n&agrave;y bởi sẽ thuận tiện hơn khi bố tr&iacute;.</p>

<p>&Acirc;m thanh được t&aacute;i hiện một c&aacute;ch ch&acirc;n thật, nội lực</p>

<p>Loa vi t&iacute;nh 2.1 Fenda F670X sở hữu hệ thống &acirc;m thanh 2.1 với loa si&ecirc;u trầm 40 W v&agrave; 2 loa vệ tinh 15 W. Tổng c&ocirc;ng suất của hệ thống l&agrave; 70W, đủ để đ&aacute;p ứng nhu cầu nghe nhạc, xem phim v&agrave; chơi game trong kh&ocirc;ng gian vừa v&agrave; lớn.</p>

<p>Về &acirc;m trầm, loa Sub của Fenda F670X c&oacute; thể tạo ra &acirc;m thanh trầm s&acirc;u, mạnh mẽ, mang đến trải nghiệm &acirc;m nhạc sống động. Tuy nhi&ecirc;n, &acirc;m trầm đ&ocirc;i khi hơi bị lấn &aacute;t &acirc;m thanh của loa vệ tinh, khiến &acirc;m thanh kh&ocirc;ng được c&acirc;n bằng.</p>

<p>Về mid, loa vệ tinh của Fenda c&oacute; thể t&aacute;i tạo &acirc;m thanh trung r&otilde; r&agrave;ng, chi tiết. &Acirc;m thanh của c&aacute;c giọng ca nam, nữ đều được thể hiện tốt. C&ograve;n treble loa c&oacute; thể t&aacute;i tạo &acirc;m thanh cao s&aacute;ng sủa, trong trẻo. Tuy nhi&ecirc;n, &acirc;m thanh đ&ocirc;i khi sẽ hơi ch&oacute;i khi nghe ở mức &acirc;m lượng cao.</p>

<p>Nh&igrave;n chung, chất &acirc;m của Fenda F670X kh&aacute; ph&ugrave; hợp với những người y&ecirc;u th&iacute;ch &acirc;m thanh mạnh mẽ, sống động. Loa cũng l&agrave; một lựa chọn tốt cho những ai đang t&igrave;m kiếm một hệ thống &acirc;m thanh chất lượng cho m&aacute;y t&iacute;nh.</p>

<p>Tương th&iacute;ch với nhiều thiết bị</p>

<p>Kết nối của&nbsp;loa vi t&iacute;nh Fenda&nbsp;kh&aacute; đa dạng v&agrave; linh hoạt, đ&aacute;p ứng tốt nhu cầu sử dụng, cho ph&eacute;p ch&uacute;ng ta thưởng thức &acirc;m nhạc một c&aacute;ch nhanh ch&oacute;ng v&agrave; tiện lợi.<br />
Với kết nối kh&ocirc;ng d&acirc;y Bluetooth 5.3, m&igrave;nh c&oacute; thể kết nối loa với điện thoại, m&aacute;y t&iacute;nh bảng, laptop,... một c&aacute;ch dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng. Kết nối kh&ocirc;ng d&acirc;y gi&uacute;p m&igrave;nh c&oacute; thể di chuyển thiết bị nguồn một c&aacute;ch thoải m&aacute;i m&agrave; kh&ocirc;ng cần lo lắng về d&acirc;y c&aacute;p.</p>

<p>C&ograve;n với kiểu kết nối c&oacute; d&acirc;y, m&igrave;nh c&oacute; thể kết nối&nbsp;loa&nbsp;với c&aacute;c thiết bị c&oacute; cổng RCA, hoặc cổng Coaxial. Kết nối n&agrave;y gi&uacute;p m&igrave;nh tận hưởng &acirc;m thanh chất lượng cao hơn so với kết nối kh&ocirc;ng d&acirc;y.</p>

<p>Nh&igrave;n chung, loa vi t&iacute;nh 2.1 Fenda F670X l&agrave; một sản phẩm loa m&aacute;y t&iacute;nh c&oacute; thiết kế đẹp mắt, chất lượng &acirc;m thanh ổn định trong tầm gi&aacute;. Sản phẩm ph&ugrave; hợp với những người y&ecirc;u th&iacute;ch &acirc;m nhạc với &acirc;m lượng vừa phải v&agrave; muốn sở hữu một hệ thống &acirc;m thanh chất lượng cho m&aacute;y t&iacute;nh của m&igrave;nh với mức gi&aacute; hợp l&yacute;.</p>
', 0.25, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (67, N'Điện thoại Vivo Y17s', 3790000, N'vivo Y17s.png', CAST(N'2024-05-12' AS Date), 1, 23, 331, N'<p>vivo Y17s&nbsp;mẫu điện thoại được nh&agrave; vivo đem đến cho người d&ugrave;ng Việt Nam trong những th&aacute;ng cuối năm 2023. Vẫn lối thiết kế 2.5D quen thuộc, camera chụp ảnh chất lượng l&ecirc;n đến 50 MP đi k&egrave;m với m&agrave;n h&igrave;nh hiển thị tốt c&ugrave;ng nhiều t&iacute;nh năng kh&aacute;c đang đợi bạn kh&aacute;m ph&aacute;.</p>

<p>Tạo h&igrave;nh vu&ocirc;ng vắn sang trọng</p>

<p>Thiết kế vu&ocirc;ng vức đang trở th&agrave;nh một xu hướng phổ biến trong ng&agrave;nh c&ocirc;ng nghệ di động v&agrave; m&igrave;nh thực sự ấn tượng với sự độc đ&aacute;o v&agrave; tinh tế của n&oacute;. Kiểu thiết kế n&agrave;y mang lại cho&nbsp;điện thoại&nbsp;một vẻ ngo&agrave;i đẹp mắt hơn, tr&aacute;nh cảm gi&aacute;c bị rẻ tiền. C&aacute;c g&oacute;c cạnh sắc n&eacute;t, đường n&eacute;t thẳng v&agrave; mạnh mẽ tạo ra một ấn tượng về sự sang trọng v&agrave; hiện đại.</p>
', 0.1, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (68, N'Điện thoại Xiaomi Redmi 12', 3490000, N'Xiaomi_Redmi_12.png', CAST(N'2024-05-12' AS Date), 1, 4, 331, N'<p>Xiaomi Redmi 12 mẫu điện thoại mới nhất được nh&agrave;&nbsp;Xiaomi&nbsp;tung ra v&agrave;o th&aacute;ng 06/2023 khiến cho cộng đồng đam m&ecirc; c&ocirc;ng nghệ v&ocirc; c&ugrave;ng th&iacute;ch th&uacute;. M&aacute;y kho&aacute;c l&ecirc;n m&igrave;nh một vẻ ngo&agrave;i c&aacute; t&iacute;nh, m&agrave;n h&igrave;nh lớn đem đến trải nghiệm đ&atilde; mắt c&ugrave;ng một hiệu năng ổn định với mọi t&aacute;c vụ.</p>

<p>Vẻ ngo&agrave;i đơn giản</p>

<p>Thiết kế của&nbsp;Xiaomi Redmi 12 4GB&nbsp;được lấy cảm hứng từ sự tối giản khi mặt lưng được l&agrave;m từ k&iacute;nh b&oacute;ng bẩy đi c&ugrave;ng với th&acirc;n m&aacute;y kh&aacute; mỏng nhẹ mang đến vẻ ngo&agrave;i thời trang, trẻ trung c&ugrave;ng khả năng cầm nắm tốt hơn khi sử dụng trong thời gian d&agrave;i.&nbsp;</p>

<p>Mặt trước của điện thoại thiết kế kiểu nốt ruồi, đồng thời c&aacute;c viền xung quanh được h&atilde;ng tối ưu kh&aacute; mỏng hứa hẹn mang đến cho bạn g&oacute;c nh&igrave;n rộng hơn gi&uacute;p việc giải tr&iacute; trở n&ecirc;n trọn vẹn.</p>

<p>M&agrave;n h&igrave;nh lớn giải tr&iacute; vui</p>

<p>Với mong muốn đem lại sự thư gi&atilde;n sau giờ l&agrave;m việc căng thẳng hoặc một g&oacute;c nh&igrave;n r&otilde; r&agrave;ng sắc n&eacute;t hơn. Xiaomi đ&atilde; trang bị tấm nền IPS LCD với k&iacute;ch thước l&ecirc;n đến 6.79 inch&nbsp;c&ugrave;ng độ ph&acirc;n giải Full HD+ (1080 x 2460 Pixels)&nbsp;gi&uacute;p bạn xem c&aacute;c nội dung tr&ecirc;n YouTube hoặc Netflix tốt hơn. M&agrave;n h&igrave;nh n&agrave;y cho chất lượng hiển thị tốt, m&agrave;u sắc ch&acirc;n thực, độ tương phản cao v&agrave; g&oacute;c nh&igrave;n rộng.</p>

<p>Redmi 12 hiển thị h&igrave;nh ảnh kh&aacute; tốt khi ở ngo&agrave;i trời nắng, kh&ocirc;ng bị mờ khi m&aacute;y c&oacute; độ s&aacute;ng tối đa l&ecirc;n đến 550 nits một con số ổn trong ph&acirc;n kh&uacute;c. Ngo&agrave;i ra, m&agrave;n h&igrave;nh n&agrave;y c&ograve;n được hỗ trợ tần số qu&eacute;t 90 Hz gi&uacute;p cho c&aacute;c thao t&aacute;c vuốt chạm tr&ecirc;n m&aacute;y được diễn ra mượt m&agrave; v&agrave; nhanh ch&oacute;ng hơn.</p>

<p>Trải nghiệm ổn định với c&aacute;c t&aacute;c vụ thường ng&agrave;y</p>

<p>Cung cấp sức mạnh cho m&aacute;y l&agrave; chip xử l&yacute; Helio G88 đến từ nh&agrave; MediaTek, c&oacute; tốc độ xử l&yacute; 2.0 GHz cho khả năng xử l&yacute; kh&aacute; ổn định v&agrave; mượt m&agrave; với c&aacute;c t&aacute;c vụ lướt web, nghe nhạc, xem phim, chỉnh sửa ảnh,&hellip; thậm ch&iacute; bạn c&oacute; thể chơi với c&aacute;c tựa game như: Li&ecirc;n Qu&acirc;n Mobile, PUBG Mobile ở mức cấu h&igrave;nh tầm trung.</p>

<p>Điện thoại RAM 4 GB&nbsp;tuy mức RAM kh&ocirc;ng qu&aacute; cao nhưng h&atilde;ng cũng đ&atilde; t&iacute;ch hợp t&iacute;nh năng mở rộng RAM n&ecirc;n vấn đề đa nhiệm tr&ecirc;n m&aacute;y kh&ocirc;ng c&ograve;n qu&aacute; bận t&acirc;m nữa. Khi c&aacute;c thao t&aacute;c chuyển đổi qua lại giữa tab kh&ocirc;ng phải đợi load lại cũng như gặp hiện tượng giật lag.</p>

<p>Cụm camera chất lượng để trải nghiệm</p>

<p>Cụm camera sau của Redmi 12 bao gồm camera ch&iacute;nh 50 MP, 2 camera phụ 8 MP v&agrave; 2 MP, hỗ trợ quay phim v&agrave; chụp ảnh chất lượng cao với c&aacute;c hiệu ứng l&agrave;m đẹp th&ocirc;ng minh, c&acirc;n bằng tốt m&agrave;u sắc v&agrave; &aacute;nh s&aacute;ng cho bức ảnh ch&acirc;n thực, c&oacute; độ n&eacute;t cao.</p>

<p>Ph&iacute;a trước điện thoại bạn sẽ c&oacute; ngay camera selfie với độ ph&acirc;n giải 8 MP đi c&ugrave;ng với nhiều t&iacute;nh năng như: l&agrave;m đẹp, bộ lọc m&agrave;u,... gi&uacute;p bạn c&oacute; những bức ảnh tự sướng đẹp mắt m&agrave; kh&ocirc;ng cần d&ugrave;ng đến ứng dụng b&ecirc;n thứ 3.</p>

<p>Vi&ecirc;n pin 5000 mAh thoải m&aacute;i d&ugrave;ng cả ng&agrave;y</p>

<p>Một chi tiết đ&aacute;ng ch&uacute; &yacute; kh&aacute;c của Xiaomi Redmi 12 l&agrave; vi&ecirc;n pin lớn 5000 mAh,&nbsp;điện thoại&nbsp;c&oacute; thể dễ d&agrave;ng cung cấp đủ năng lượng để giữ cho thiết bị hoạt động suốt cả ng&agrave;y, ngay cả khi sử dụng nhiều.&nbsp;</p>

<p>B&ecirc;n cạnh đ&oacute;, m&aacute;y cũng hỗ trợ sạc nhanh 18 W, v&igrave; vậy bạn c&oacute; thể nhanh ch&oacute;ng lấp đầy dung lượng của thiết bị m&agrave; kh&ocirc;ng cần phải mất qu&aacute; nhiều thời gian chờ đợi.</p>

<p>Xiaomi Redmi 12 sẽ l&agrave; sự lựa chọn ph&ugrave; hợp với những bạn đang c&oacute; nhu cầu t&igrave;m kiếm một chiếc điện thoại c&oacute; vẻ ngo&agrave;i đẹp mắt, m&agrave;n h&igrave;nh lớn cho h&igrave;nh ảnh sắc n&eacute;t c&ugrave;ng một hiệu năng ổn định với c&aacute;c t&aacute;c vụ hằng ng&agrave;y.</p>
', 0.15, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (69, N'Điện thoại Nokia 8210 4G', 1590000, N'Nokia_8210_4G.png', CAST(N'2024-05-12' AS Date), 1, 9, 131, N'<p>Nokia 8210 4G&nbsp;c&oacute; lẽ l&agrave; một lựa chọn ph&ugrave; hợp với những ai cần cho m&igrave;nh một chiếc&nbsp;điện thoại phổ th&ocirc;ng&nbsp;phục vụ cho nhu cầu nghe gọi. M&aacute;y c&oacute; gi&aacute; th&agrave;nh rẻ v&agrave; vừa c&oacute; độ bền cao, gi&uacute;p cho người d&ugrave;ng c&oacute; thể tiết kiệm được kha kh&aacute; số tiền bỏ ra ban đầu cũng như kh&ocirc;ng cần qu&aacute; lo lắng đến vấn đề hỏng h&oacute;c trong l&uacute;c sử dụng.</p>

<p>Ho&agrave;n thiện tỉ mỉ cho đến từng chi tiết nhỏ</p>

<p>Nokia 8210 4G sở hữu một mặt lưng v&agrave; bộ khung được l&agrave;m từ nhựa Polycarbonate, c&oacute; c&aacute;c m&agrave;u sắc trẻ trung. Với th&acirc;n h&igrave;nh của một chiếc&nbsp;điện thoại nhỏ gọn dễ cầm&nbsp;gi&uacute;p cho người d&ugrave;ng c&oacute; thể bỏ t&uacute;i một c&aacute;ch dễ d&agrave;ng m&agrave; kh&ocirc;ng sợ bị cấn như tr&ecirc;n những chiếc&nbsp;smartphone&nbsp;c&oacute; k&iacute;ch thước lớn</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (70, N'Điện thoại Nokia 215 4G', 990000, N'Nokia2154G.png', CAST(N'2024-05-12' AS Date), 1, 9, 132, N'<p>Nokia 215&nbsp;chiếc điện thoại phổ th&ocirc;ng ngo&agrave;i c&aacute;c chức năng cơ bản th&igrave; m&aacute;y đ&atilde; được n&acirc;ng cấp với sự hỗ trợ kết nối mạng 4G mang đến nhiều trải nghiệm hơn cho người d&ugrave;ng.</p>

<p>Thiết kế đơn giản, gọn nhẹ</p>

<p>Nokia 215 4G sử dụng chất liệu nhựa cho kiểu d&aacute;ng bền bỉ, c&aacute;c n&uacute;t cảm ứng mềm lớn, cạnh dễ cầm v&agrave; mặt lưng cong được thiết kế để vừa vặn ho&agrave;n to&agrave;n trong tay bạn, cho bạn c&oacute; được sự thoải m&aacute;i, tiện lợi nhất.</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (71, N'Điện thoại Nokia 110 4G Pro', 720000, N'Nokia1104G_Pro.png', CAST(N'2024-05-12' AS Date), 1, 9, 113, N'<p>Nokia 110 4G Pro&nbsp;l&agrave; một chiếc&nbsp;điện thoại phổ th&ocirc;ng&nbsp;nổi bật, được thiết kế tinh tế v&agrave; sang trọng. Điện thoại cho khả năng bền bỉ trong thời gian d&agrave;i khiến bạn cảm thấy y&ecirc;n t&acirc;m khi sử dụng. Với việc hỗ trợ c&ocirc;ng nghệ 4G VoLTE, bạn c&oacute; thể thực hiện cuộc gọi một c&aacute;ch nhanh ch&oacute;ng v&agrave; ổn định hơn.</p>

<p>Diện mạo đơn giản cuốn h&uacute;t &aacute;nh nh&igrave;n</p>

<p>M&aacute;y được l&agrave;m từ nhựa với vỏ s&aacute;ng b&oacute;ng, tạo vẻ đẹp sang trọng v&agrave; tinh tế. Điểm cộng tr&ecirc;n những mẫu điện thoại phổ th&ocirc;ng Nokia l&agrave; độ bền cao, giảm thiểu nguy cơ nứt vỡ do va chạm hoặc rơi vỡ</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (72, N'Điện thoại Nokia 105 4G Pro', 680000, N'Nokia1054GPro.png', CAST(N'2024-05-12' AS Date), 1, 9, 133, N'<p>Đi c&ugrave;ng với sự ph&aacute;t triển của những chiếc điện thoại th&ocirc;ng minh th&igrave; mẫu điện thoại &ldquo;cục gạch&rdquo; cũng được c&aacute;c nh&agrave; sản xuất trao chuốt. V&agrave;&nbsp;Nokia 105 4G Pro&nbsp;mẫu điện thoại phổ th&ocirc;ng được Nokia cho ra mắt, m&aacute;y mang một thiết kế đơn giản, dễ sử dụng, khả năng nghe gọi r&otilde; r&agrave;ng v&agrave; thời gian sử dụng d&agrave;i l&acirc;u.</p>

<p>Thiết kế đơn giản, dễ d&agrave;ng thao t&aacute;c</p>

<p>Một phong c&aacute;ch thiết kế quen thuộc vẫn được giữ nguy&ecirc;n tr&ecirc;n Nokia 105 4G Pro, nhưng đ&atilde; được điều chỉnh để mang lại vẻ trẻ trung v&agrave; nhẹ nh&agrave;ng. Mặt lưng được bo tr&ograve;n mềm mại, tạo cảm gi&aacute;c cầm nắm thoải m&aacute;i hơn.</p>

<div id="gtx-trans" style="left:-77px; position:absolute; top:-4.8px">
<div class="gtx-trans-icon">&nbsp;</div>
</div>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (73, N'Camera IP 360 Độ 2MP Xiaomi Mi Home C200', 5900000, N'Camera _C200.png', CAST(N'2024-05-12' AS Date), 1, 4, 53, N'<p>Camera IP 360 Độ 2MP Xiaomi Mi Home C200&nbsp;c&oacute; thiết kế nhỏ gọn, m&agrave;u trắng tinh tế tạo n&ecirc;n diện mạo sang trọng, hỗ trợ c&aacute;c tiện &iacute;ch gi&uacute;p ph&aacute;t hiện v&agrave; theo d&otilde;i chuyển động c&ugrave;ng khả năng xoay 360 độ gi&uacute;p quan s&aacute;t to&agrave;n cảnh, bảo vệ ng&ocirc;i nh&agrave; của bạn tối ưu.</p>

<p>Thiết kế gọn g&agrave;ng, gam m&agrave;u trắng tinh tế</p>

<p>Khu vực ống k&iacute;nh được thiết kế dạng h&igrave;nh cầu kết hợp với đế đỡ trụ tr&ograve;n tạo n&ecirc;n 1 diện mạo độc đ&aacute;o. Camera sử dụng gam m&agrave;u trắng trang nh&atilde;, dễ ch&igrave;m v&agrave;o nội thất, tường hay kệ b&agrave;n, tiện lợi theo d&otilde;i m&agrave; kh&ocirc;ng qu&aacute; g&acirc;y ch&uacute; &yacute;, kh&ocirc;ng ảnh hưởng đến thiết kế của căn ph&ograve;ng.</p>

<p>K&iacute;ch thước gọn g&agrave;ng, khối lượng chỉ 310 g gi&uacute;p bạn c&oacute; thể gắn trần hoặc đặt gọn trong 1 g&oacute;c n&agrave;o đ&oacute;, kh&ocirc;ng chiếm qu&aacute; nhiều diện t&iacute;ch lắp đặt.</p>
', 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (74, N'Asus TUF Gaming F15 FX507ZC4 i5 12500H', 21990000, N'cunn3op9.png', CAST(N'2024-05-12' AS Date), 1, 8, 424, N'<p>Laptop&nbsp;Asus TUF Gaming F15 FX507ZC4 i5 12500H&nbsp;(HN229W)&nbsp;với cấu tr&uacute;c mạnh mẽ, hiệu năng vượt trội c&ugrave;ng mức gi&aacute; ho&agrave;n to&agrave;n ưu đ&atilde;i tại Thế Giới Di Động. Đ&acirc;y ch&iacute;nh x&aacute;c l&agrave; mẫu&nbsp;laptop gaming&nbsp;được thiết kế d&agrave;nh ri&ecirc;ng cho những anh em đam m&ecirc; thể thao điện tử, đ&aacute;p ứng đầy đủ đến cả những c&ocirc;ng việc thiết kế, s&aacute;ng tạo.</p>

<p>&bull; CPU&nbsp;Intel Core i5 12500H&nbsp;d&ograve;ng H hiệu năng cao cung cấp khả năng vận h&agrave;nh đa nhiệm tuyệt vời từ việc chiến c&aacute;c tựa game Esport mượt m&agrave;, chạy coding đến việc đ&aacute;p ứng c&aacute;c nhu cầu chỉnh sửa đồ hoạ, edit video cơ bản qua c&aacute;c nền tảng nh&agrave; Adobe.&nbsp;</p>

<p>&bull; Hơn nữa, card rời&nbsp;NVIDIA GeForce RTX 3050&nbsp;với&nbsp;4 GB VRAM&nbsp;sở hữu những c&ocirc;ng nghệ như&nbsp;MUX Switch&nbsp;cho ra chất lượng h&igrave;nh ảnh xuất sắc,&nbsp;Ray Tracing t&aacute;i tạo ch&acirc;n thực những cảnh sắc game sẽ ho&agrave;n to&agrave;n đắm ch&igrave;m bạn v&agrave;o khung cảnh giải tr&iacute; hấp dẫn.</p>

<p>&bull;&nbsp;Laptop Asus&nbsp;hỗ trợ mức&nbsp;RAM&nbsp;cơ bản l&agrave;&nbsp;16 GB, tiện lợi khi người d&ugrave;ng thao t&aacute;c đa nhiệm, mở c&aacute;c tựa game c&ugrave;ng l&uacute;c với c&aacute;c nền tảng kh&aacute;c, chuyển qua lại trơn tru m&agrave; kh&ocirc;ng gặp vấn đề g&igrave;. Ngo&agrave;i ra, bạn cũng c&oacute; thể n&acirc;ng cấp thoải m&aacute;i RAM l&ecirc;n đến&nbsp;32 GB&nbsp;để tương th&iacute;ch với c&aacute;c c&ocirc;ng việc đ&ograve;i hỏi nhiều t&agrave;i nguy&ecirc;n hơn.</p>

<p>&bull; Ổ cứng&nbsp;SSD 1 TB M.2 PCIe&nbsp;r&uacute;t ngắn thời gian khởi động hệ thống chỉ trong v&agrave;i gi&acirc;y, đồng thời cung cấp một kh&ocirc;ng gian lưu trữ tuyệt vời cho c&aacute;c tr&ograve; chơi v&agrave; tệp tin của bạn.</p>

<p>&bull;&nbsp;Laptop Asus TUF Gaming&nbsp;được trang bị m&agrave;n h&igrave;nh&nbsp;IPS&nbsp;c&oacute; k&iacute;ch thước&nbsp;15.6 inch,&nbsp;độ ph&acirc;n giải&nbsp;Full HD (1920 x 1080)&nbsp;c&ugrave;ng tốc độ l&agrave;m mới&nbsp;144 Hz, mang lại trải nghiệm chơi game mượt m&agrave;, thời gian phản hồi nhanh ch&oacute;ng khi chơi c&aacute;c tựa game eSports, những khung cảnh chuyển động sắc n&eacute;t v&agrave; mượt m&agrave; sẽ n&acirc;ng tầm trải nghiệm của người d&ugrave;ng hơn rất nhiều.</p>

<p>&bull; Hệ thống loa k&eacute;p đạt chuẩn&nbsp;Hi-Res&nbsp;được t&iacute;ch hợp với c&ocirc;ng nghệ&nbsp;Dolby Atmos&nbsp;t&aacute;i tạo &acirc;m thanh 3D với chất &acirc;m như bao trọn kh&ocirc;ng gian, đầy thu h&uacute;t v&agrave; thư gi&atilde;n cho bạn tập trung to&agrave;n bộ t&acirc;m tr&iacute; v&agrave;o trận game.</p>

<p>&bull;&nbsp;TUF Gaming F15 với thiết kế đầy phong c&aacute;ch với c&aacute;c đường khắc laser sắc sảo ở mặt A m&aacute;y, logo d&ograve;ng m&aacute;y được trưng c&ugrave;ng bộ khung hầm hố chắc chắn sẽ l&agrave;m h&agrave;i l&ograve;ng mọi gu thẩm mỹ của c&aacute;c anh em game thủ.&nbsp;Đ&egrave;n chuyển m&agrave;u RGB 1 v&ugrave;ng&nbsp;cho bạn tha hồ set up m&agrave;u sắc để thể hiện phong c&aacute;ch c&aacute; nh&acirc;n, hỗ trợ sử dụng tốt hơn ngay cả khi thiếu s&aacute;ng.</p>

<p>&bull; Khối lượng tổng thể của chiếc&nbsp;laptop&nbsp;n&agrave;y l&agrave;&nbsp;2.2 kg, vẫn kh&aacute; thoải m&aacute;i cho bạn bỏ trong balo v&agrave; mang theo b&ecirc;n m&igrave;nh mọi l&uacute;c. Đa dạng c&aacute;c cổng kết nối ở c&aacute;c cạnh m&aacute;y như: Thunderbolt 4, Jack tai nghe, USB Type-C 3.2, USB 3.2, HDMI v&agrave; LAN.</p>
', 0, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (75, N'Acer Gaming Nitro 5 Tiger AN515', 21990000, N'AcerNitro5TigerAN515.png', CAST(N'2024-05-12' AS Date), 1, 16, 311, N'<p>Trải nghiệm giải tr&iacute; đỉnh cao nhờ hiệu năng từ con chip Intel Core i7 d&ograve;ng H series hiệu năng cao c&ugrave;ng ngoại h&igrave;nh độc đ&aacute;o,&nbsp;laptop&nbsp;Acer Gaming Nitro 5 AN515 58 769J i7 12700H&nbsp;(NH.QFHSV.003)&nbsp;chắc chắn sẽ trở th&agrave;nh trợ thủ đắc lực cho người d&ugrave;ng trong những chiến trường ảo đầy kịch t&iacute;nh hay những t&aacute;c vụ văn ph&ograve;ng v&agrave; đồ hoạ chuy&ecirc;n nghiệp.</p>

<p>Bứt ph&aacute; giới hạn với hiệu năng mạnh mẽ</p>

<p>Laptop gaming&nbsp;sở hữu sức mạnh đến từ con chip&nbsp;Intel Core i7 12700H&nbsp;thuộc d&ograve;ng H hiệu năng cao đạt tốc độ xung nhịp tối đa l&ecirc;n đến&nbsp;4.7 GHz&nbsp;đem đến tốc độ xử l&yacute; nhanh ch&oacute;ng v&agrave; hiệu quả cho mọi t&aacute;c vụ từ văn ph&ograve;ng như Word, Excel, PowerPoint,... đến c&aacute;c ứng dụng đồ họa kỹ thuật n&acirc;ng cao như Photoshop, Illustrator, AutoCAD,...&nbsp;&nbsp;</p>

<p>Th&ecirc;m v&agrave;o đ&oacute;, card rời&nbsp;NVIDIA GeForce RTX 3050&nbsp;với&nbsp;4 GB VRAM&nbsp;cũng hỗ trợ bạn thực hiện c&aacute;c bản thiết kế 2D, 3D hay render video một c&aacute;ch chuy&ecirc;n nghiệp với hiệu suất cao v&agrave; chiến mượt m&agrave; c&aacute;c tựa game với cấu h&igrave;nh cao như:&nbsp;FIFA Online 4, CS:GO, Cyberpunk 2077, GTA V,...&nbsp;</p>

<p>M&aacute;y được trang bị bộ nhớ&nbsp;RAM&nbsp;8 GB&nbsp;chuẩn&nbsp;DDR4&nbsp;c&oacute; khả năng đa nhiệm cao, bạn ho&agrave;n to&agrave;n c&oacute; thể mở h&agrave;ng chục cửa sổ l&agrave;m việc&nbsp;c&ugrave;ng l&uacute;c hay mở c&aacute;c t&aacute;c vụ đ&ograve;i hỏi nhiều t&agrave;i nguy&ecirc;n như game v&agrave; đồ hoạ m&agrave; kh&ocirc;ng sợ đơ hay đứng m&aacute;y nhờ tốc độ Bus RAM&nbsp;3200&nbsp;MHz,&nbsp;laptop&nbsp;cũng c&oacute; hỗ trợ n&acirc;ng cấp tối đa&nbsp;32&nbsp;GB&nbsp;để phục vụ tối ưu hơn cho nhiều nhu cầu sử dụng kh&aacute;c nhau.</p>

<p>Ổ cứng&nbsp;SSD&nbsp;512&nbsp;GB&nbsp;NVMe&nbsp;PCIe&nbsp;4.0&nbsp;gi&uacute;p r&uacute;t ngắn thời gian khởi động hệ thống v&agrave; chạy c&aacute;c phần mềm chỉ trong v&agrave;i gi&acirc;y cũng như đem lại kh&ocirc;ng gian lưu trữ đủ d&ugrave;ng. Hơn nữa, người d&ugrave;ng c&oacute; thể dễ d&agrave;ng th&aacute;o lắp ổ cứng để n&acirc;ng dung lượng l&ecirc;n tối đa&nbsp;1 TB&nbsp;hoặc sử dụng c&aacute;c khe cắm mở rộng c&oacute; sẵn tr&ecirc;n m&aacute;y.</p>

<p>Kh&ocirc;ng gian giải tr&iacute; đầy sống động với khung h&igrave;nh mượt m&agrave;&nbsp;</p>

<p>M&agrave;n h&igrave;nh&nbsp;laptop Acer&nbsp;k&iacute;ch thước&nbsp;15.6 inch&nbsp;sử dụng tấm nền&nbsp;IPS,&nbsp;kết hợp&nbsp;độ ph&acirc;n giải&nbsp;Full&nbsp;HD&nbsp;(1920 x 1080)&nbsp;mang đến những trải nghiệm giải tr&iacute; như chơi game hay xem phim đầy hấp dẫn với chất lượng h&igrave;nh ảnh r&otilde; n&eacute;t, khung h&igrave;nh bao qu&aacute;t với g&oacute;c nh&igrave;n được mở rộng l&ecirc;n đến&nbsp;178 độ.</p>

<p>Tốc độ l&agrave;m tươi khung h&igrave;nh&nbsp;144 Hz&nbsp;mang đến trải nghiệm m&atilde;n nh&atilde;n tr&ecirc;n c&aacute;c tựa game h&agrave;nh động hấp dẫn hay những bộ phim bom tấn m&agrave; kh&ocirc;ng phải lo bị x&eacute; hay nh&ograve;e h&igrave;nh, cho c&aacute;c chuyển động r&otilde; n&eacute;t v&agrave; mượt hơn bao giờ hết. Th&ecirc;m v&agrave;o đ&oacute;, c&ocirc;ng nghệ&nbsp;Acer ComfyView&nbsp;được t&iacute;ch hợp cho m&agrave;n h&igrave;nh cũng gi&uacute;p người d&ugrave;ng tr&aacute;nh được c&aacute;c hiện tượng nhức mỏi mắt khi tiếp x&uacute;c với m&agrave;n h&igrave;nh qu&aacute; l&acirc;u.</p>

<p>Đa dạng c&aacute;c c&ocirc;ng nghệ &acirc;m thanh hiện đại như:&nbsp;Spatial Audio, Acer Purified Voice, Acer TrueHarmony&nbsp;v&agrave;&nbsp;DTS:X ULTRA&nbsp;mang đến những trải nghiệm giải tr&iacute; l&ocirc;i cuốn, cảm nhận r&otilde; chuyển động của đối thủ hay ho&agrave; m&igrave;nh v&agrave;o những tựa phim y&ecirc;u th&iacute;ch với chất &acirc;m đa chiều đầy sống động v&agrave; ch&acirc;n thực.</p>

<p>Thiết kế độc đ&aacute;o, ngoại h&igrave;nh ph&aacute; c&aacute;ch</p>

<p>Laptop Acer Gaming Nitro&nbsp;được thiết kế dường như c&oacute; phần gọn g&agrave;ng hơn so với những phi&ecirc;n bản trước nhưng những n&eacute;t độc đ&aacute;o v&agrave; đặc trưng của những d&ograve;ng gaming vẫn được giữ nguy&ecirc;n với c&aacute;c đường v&acirc;n hologram chạy dọc mặt lưng m&aacute;y c&ugrave;ng bộ khung cứng c&aacute;p. M&aacute;y c&oacute; khối lượng hơi chắc tay&nbsp;2.5 kg&nbsp;nhưng vẫn kh&ocirc;ng qu&aacute; kh&oacute; khăn cho anh em bỏ trong balo v&agrave; mang theo b&ecirc;n m&igrave;nh.</p>

<p>B&agrave;n ph&iacute;m với&nbsp;đ&egrave;n chuyển m&agrave;u RGB - 4 v&ugrave;ng, mang đến sự tiện lợi khi c&oacute; thể thoải m&aacute;i sử dụng ngay cả khi thiếu s&aacute;ng, cũng như tạo n&ecirc;n nhiều cảm hứng cho game thủ mỗi khi bước v&agrave;o c&aacute;c trận đấu căng thẳng.</p>

<p>Dọc th&acirc;n m&aacute;y l&agrave; c&aacute;c cổng kết nối th&ocirc;ng dụng hiện nay như: USB Type-C, Jack tai nghe 3.5 mm, USB 3.2, HDMI v&agrave; LAN, hỗ trợ người d&ugrave;ng li&ecirc;n kết v&agrave; truyền tải dữ liệu đến c&aacute;c thiết bị ngoại vi như loa, chuột, m&aacute;y in,... một c&aacute;ch dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng.</p>
', 0.05, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (76, N'Acer Aspire Lite 15 51M 5542 i5 1155G7 ', 12290000, N'AcerAspireLite1551M .png', CAST(N'2024-05-12' AS Date), 1, 16, 223, N'<p>Laptop Acer Aspire Lite 15 51M 5542 i5 1155G7 (NX.KS5SV.001)&nbsp;đưa đến một trải nghiệm to&agrave;n diện cho người d&ugrave;ng với sự kết hợp độc đ&aacute;o giữa thiết kế thanh lịch, hiệu suất ổn định v&agrave; t&iacute;nh năng đa dạng. Sản phẩm hứa hẹn mang lại sự lựa chọn l&yacute; tưởng cho những bạn trong ph&acirc;n kh&uacute;c học sinh, sinh vi&ecirc;n v&agrave; nh&acirc;n vi&ecirc;n văn ph&ograve;ng.</p>

<p>Kiểu d&aacute;ng tối giản, sang trọng</p>

<p>H&atilde;ng đ&atilde; ghi điểm trong mắt người d&ugrave;ng khi những mẫu m&aacute;y Acer cho ra mắt ở bất cứ thời điểm n&agrave;o, vẫn giữ nguy&ecirc;n thiết kế tối giản v&agrave; tinh tế. So với những chiếc m&aacute;y t&iacute;nh x&aacute;ch tay c&ugrave;ng ph&acirc;n kh&uacute;c,&nbsp;laptop Acer&nbsp;thực sự nổi bật với diện mạo thanh lịch v&agrave; đẳng cấp kh&ocirc;ng thua k&eacute;m g&igrave; những mẫu ultrabook thuộc ph&acirc;n kh&uacute;c cao hơn.</p>

<p>T&iacute;nh tới từng chi tiết nhỏ, chiếc&nbsp;laptop&nbsp;n&agrave;y kh&ocirc;ng chỉ l&agrave; một c&ocirc;ng cụ l&agrave;m việc m&agrave; c&ograve;n l&agrave; một t&aacute;c phẩm nghệ thuật. M&agrave;u sắc được chọn lựa kỹ lưỡng, chủ đạo l&agrave; t&ocirc;ng m&agrave;u&nbsp;x&aacute;m&nbsp;trầm, tạo n&ecirc;n sự sang trọng v&agrave; thời thượng. Logo Acer v&agrave; d&ograve;ng chữ &quot;Aspire&quot; ở ph&iacute;a trước được đặt một c&aacute;ch tinh tế, kh&ocirc;ng qu&aacute; ch&oacute;i lọi nhưng vẫn l&agrave; điểm nhấn quan trọng, t&ocirc;n l&ecirc;n vẻ đẹp tối giản d&ugrave; m&igrave;nh đặt ở bất kỳ đ&acirc;u.</p>

<p>Tuy vậy, thiết bị n&agrave;y hơi b&aacute;m dấu v&acirc;n tay một x&iacute;u cho n&ecirc;n c&aacute;c bạn lưu &yacute; trong qu&aacute; tr&igrave;nh sử dụng, c&oacute; thể sắm một chiếc khăn tay lau ch&ugrave;i để chiếc m&aacute;y được sạch, đẹp hơn nh&eacute;. Đồng thời, khi m&igrave;nh thao t&aacute;c mở đ&oacute;ng m&aacute;y, kh&ocirc;ng c&oacute; cảm gi&aacute;c lỏng lẻo hay rung lắc một x&iacute;u n&agrave;o cả, mọi thứ được ho&agrave;n thiện rất l&agrave; chắc chắn lu&ocirc;n, cho thấy độ gia c&ocirc;ng m&agrave; Acer đem lại cực kỳ bền vững. Khối lượng nhẹ nh&agrave;ng chỉ&nbsp;1.59 kg&nbsp;th&ocirc;i, đủ để m&igrave;nh bỏ gọn v&agrave;o chiếc balo hay t&uacute;i x&aacute;ch m&agrave; kh&ocirc;ng hề cảm gi&aacute;c nặng nề hay cồng kềnh.&nbsp;</p>

<p>L&agrave; một chiếc m&aacute;y nằm trong ph&acirc;n kh&uacute;c tr&ecirc;n dưới 13 triệu, laptop kh&aacute; nổi bật khi trang bị một bộ b&agrave;n ph&iacute;m layout Fullsize chắc chắn ph&ugrave; hợp cho c&aacute; nh&acirc;n m&igrave;nh hoặc những bạn l&agrave;m việc văn ph&ograve;ng đặc biệt l&agrave; những ai cần nhập liệu nhiều trong lĩnh vực kế to&aacute;n, h&agrave;nh ch&iacute;nh,&hellip; B&ecirc;n cạnh đ&oacute;, khoảng c&aacute;ch giữa c&aacute;c ph&iacute;m xa nhau, kh&ocirc;ng bị hụt tay khi g&otilde;, h&agrave;nh tr&igrave;nh ph&iacute;m cũng kh&aacute; s&acirc;u n&ecirc;n khi m&igrave;nh bấm rất nịnh tay lu&ocirc;n. Một điểm trừ duy nhất m&igrave;nh thấy kh&aacute; l&agrave; tiếc tr&ecirc;n chiếc m&aacute;y n&agrave;y khi&nbsp;kh&ocirc;ng&nbsp;hỗ trợ sẵn&nbsp;đ&egrave;n nền&nbsp;kh&aacute; kh&oacute; khăn đối với những bạn chưa quen l&agrave;m việc trong m&ocirc;i trường thiếu s&aacute;ng.&nbsp;</p>

<p>Về phần Touchpad theo c&aacute; nh&acirc;n m&igrave;nh cảm nhận, với k&iacute;ch thước vừa phải, kh&ocirc;ng qu&aacute; nhỏ cũng kh&ocirc;ng qu&aacute; lớn, đủ để m&igrave;nh thao t&aacute;c thoải m&aacute;i m&agrave; kh&ocirc;ng gặp phải cảm gi&aacute;c r&iacute;t tay. Điều n&agrave;y tăng th&ecirc;m sự tiện &iacute;ch v&agrave; linh hoạt khi sử dụng m&aacute;y t&iacute;nh.</p>

<p>Laptop học tập - văn ph&ograve;ng&nbsp;vẫn t&iacute;ch hợp đa dạng cổng kết nối th&ocirc;ng dụng dọc hai b&ecirc;n th&acirc;n m&aacute;y như HDMI, Jack tai nghe 3.5 mm, USB 3.2, LAN, USB 2.0, USB Type-C.</p>

<p>Vận h&agrave;nh mượt m&agrave; mọi t&aacute;c vụ</p>

<p>Sở hữu một hiệu năng v&ocirc; c&ugrave;ng ổn định đến từ con chip&nbsp;Intel Core i5 1155G7&nbsp;thế hệ thứ 11, mặc d&ugrave; l&agrave; một con chip kh&ocirc;ng qu&aacute; mới thế nhưng để l&agrave;m c&aacute;c t&aacute;c vụ văn ph&ograve;ng th&igrave; rất l&agrave; tốt nha. Điểm số&nbsp;CINEBENCH R23&nbsp;m&agrave; m&igrave;nh đo đạc được l&agrave;&nbsp;4215 điểm đa nh&acirc;n&nbsp;v&agrave;&nbsp;1431 điểm đơn nh&acirc;n&nbsp;n&ecirc;n với em Acer n&agrave;y m&igrave;nh kh&aacute; thoải m&aacute;i giải quyết những nhiệm vụ hằng ng&agrave;y như xử l&yacute; văn bản, tr&igrave;nh chiếu, lập bảng t&iacute;nh Excel,&hellip; một c&aacute;ch rất mượt m&agrave; bởi đ&acirc;y l&agrave; nhiệm vụ ch&iacute;nh của em n&oacute; m&agrave;.</p>

<p>Về phần giải tr&iacute; hay đồ họa&nbsp;laptop Acer Aspire&nbsp;được trang bị card đồ họa t&iacute;ch hợp&nbsp;Intel Iris Xe Graphics&nbsp;cho n&ecirc;n m&igrave;nh thường thao t&aacute;c dựng ảnh hay l&agrave;m video cơ bản từ c&aacute;c ứng dụng như Photoshop, CapCut đều vận h&agrave;nh một c&aacute;ch ổn thỏa nhất v&agrave; kh&ocirc;ng hề xảy ra bất kỳ vấn đề g&igrave;. Ngo&agrave;i ra, nếu c&aacute;c bạn muốn sử dụng cao hơn như render ảnh 4K, 3D hay thậm ch&iacute; l&agrave; những nhiệm vụ cao cấp hơn, chuy&ecirc;n s&acirc;u hơn hoặc chơi những con game nặng nề hơn th&igrave; chiếc m&aacute;y n&agrave;y kh&ocirc;ng thể đảm bảo được tốt lắm, n&ecirc;n c&aacute;c bạn c&acirc;n nhắc khi sử dụng để chỉnh mức đồ họa ph&ugrave; hợp nhất nh&eacute;.</p>

<p>Bộ nhớ&nbsp;RAM 16 GB&nbsp;đối với một chiếc laptop học tập - văn ph&ograve;ng th&igrave; m&igrave;nh ho&agrave;n to&agrave;n c&oacute; thể l&agrave;m được đa t&aacute;c vụ như vừa dựng clip, chơi game hay mở h&agrave;ng loạt c&aacute;c tab Chrome, m&aacute;y vẫn chạy rất ổn v&agrave; kh&ocirc;ng hề gặp trường hợp giật lag, đứng m&aacute;y một x&iacute;u n&agrave;o. Hơn nữa, m&igrave;nh cũng sẽ c&acirc;n nhắc n&acirc;ng cấp RAM l&ecirc;n&nbsp;32 GB&nbsp;để phục vụ cho c&aacute;c nhu cầu cao hơn khi cần.</p>

<p>Sự kết hợp giữa dung lượng lớn v&agrave; c&ocirc;ng nghệ SSD mang lại trải nghiệm vận h&agrave;nh m&aacute;y tốt nhất. Với&nbsp;SSD 512 GB, Acer Aspire Lite 15 đảm bảo m&aacute;y kh&ocirc;ng bị chậm trễ v&agrave; thời gian phản hồi v&ocirc; c&ugrave;ng nhanh ch&oacute;ng. Việc mở ứng dụng, chạy c&aacute;c t&aacute;c vụ đồng thời hay khởi động m&aacute;y đều diễn ra một c&aacute;ch mượt m&agrave; v&agrave; cho m&igrave;nh những trải nghiệm hiệu quả nhất khi l&agrave;m việc. B&ecirc;n cạnh đ&oacute;, h&atilde;ng cũng ưu &aacute;i th&aacute;o lắp thanh kh&aacute;c tối đa&nbsp;1 TB&nbsp;đ&aacute;p ứng mọi nhu cầu của những bạn mong muốn sử dụng cao hơn.</p>

<p>Em n&agrave;y c&ograve;n được trang bị vi&ecirc;n pin&nbsp;36 Wh, đối với việc sử dụng đơn giản như giải quyết c&aacute;c t&aacute;c vụ văn ph&ograve;ng hay xem phim, Acer Aspire Lite 15 c&oacute; thể cung cấp thời lượng pin từ&nbsp;4 đến 5 tiếng&nbsp;đồng hồ. Tuy nhi&ecirc;n, khi thực hiện c&aacute;c thao t&aacute;c nặng hơn như chơi game, thời lượng pin giảm xuống đ&acirc;u đ&oacute; khoảng&nbsp;2 đến 3 tiếng. Mặc d&ugrave; sử dụng d&agrave;i hay ngắn th&igrave; m&igrave;nh khuy&ecirc;n c&aacute;c bạn vẫn n&ecirc;n đem theo cục sạc để c&oacute; được những gi&acirc;y ph&uacute;t trải nghiệm được trọn vẹn nhất nha.</p>

<p>M&agrave;n h&igrave;nh rộng lớn, chi tiết</p>

<p>Khung h&igrave;nh c&oacute; k&iacute;ch thước l&yacute; tưởng l&ecirc;n đến&nbsp;15.6 inch&nbsp;đem đến một trải nghiệm h&igrave;nh ảnh đỉnh cao. Viền m&agrave;n h&igrave;nh được thiết kế mỏng, tối giản h&oacute;a kh&ocirc;ng gian xung quanh, tạo ra một c&aacute;i nh&igrave;n hiện đại v&agrave; g&oacute;c nh&igrave;n mở rộng hơn, m&igrave;nh c&ograve;n c&oacute; thể chia hai tab để l&agrave;m việc m&agrave; vẫn thấy r&otilde; mọi chi tiết tr&ecirc;n m&aacute;y. Đi c&ugrave;ng mức độ ph&acirc;n giải&nbsp;Full HD (1920 x 1080)&nbsp;mang đến ch&uacute;ng ta một khung h&igrave;nh m&agrave;u sắc sinh động, c&aacute;c chi tiết được t&aacute;i tạo kh&aacute; l&agrave; sắc n&eacute;t, độ s&aacute;ng vừa đủ thuận lợi cho những c&ocirc;ng việc đồ họa nhẹ.</p>

<p>Mặc d&ugrave; m&aacute;y chỉ c&oacute; tần số qu&eacute;t ở mức&nbsp;60 Hz, nhưng laptop vẫn đảm bảo độ tr&igrave;nh chiếu h&igrave;nh ảnh ổn định m&agrave; kh&ocirc;ng gặp sự cố như nhiễu hay nh&ograve;e h&igrave;nh. Điều n&agrave;y đặc biệt quan trọng đối với m&igrave;nh trong việc trải nghiệm c&aacute;c hoạt động giải tr&iacute; v&agrave; c&ocirc;ng việc h&agrave;ng ng&agrave;y.&nbsp;</p>

<p>Một điểm m&igrave;nh kh&aacute; th&iacute;ch ở chiếc m&aacute;y n&agrave;y khi t&iacute;ch hợp c&ocirc;ng nghệ độc quyền&nbsp;Acer ComfyView&nbsp;một t&iacute;nh năng gi&uacute;p giảm &aacute;nh s&aacute;ng phản chiếu từ m&agrave;n h&igrave;nh, giảm mệt mỏi cho mắt khi sử dụng trong m&ocirc;i trường &aacute;nh s&aacute;ng mạnh, giữ mắt m&igrave;nh được bảo vệ suốt cả một ng&agrave;y d&agrave;i.</p>

<p>Sử dụng c&ocirc;ng nghệ &acirc;m thanh&nbsp;Stereo speakers&nbsp;hỗ trợ t&aacute;i tạo chất &acirc;m ho&agrave;n to&agrave;n ch&acirc;n thực v&agrave; sống động. M&igrave;nh ho&agrave;n to&agrave;n c&oacute; thể tận hưởng &acirc;m nhạc, xem phim hay thậm ch&iacute; l&agrave;m việc với chất lượng &acirc;m thanh đầy đủ v&agrave; đong đầy nhất.</p>

<p>Tổng kết lại, laptop Acer Aspire Lite 15 51M 5542 i5 1155G7 (NX.KS5SV.001) kh&ocirc;ng chỉ đẹp mắt m&agrave; c&ograve;n mạnh mẽ v&agrave; linh hoạt, đ&aacute;p ứng đa dạng nhu cầu của bạn từ c&ocirc;ng việc đến giải tr&iacute;, tạo n&ecirc;n một trải nghiệm laptop to&agrave;n diện v&agrave; đ&aacute;ng gi&aacute; trong ph&acirc;n kh&uacute;c gi&aacute; l&yacute; tưởng như vậy.</p>
', 0.05, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [Image], [ProductDate], [Available], [CategoryId], [Quantity], [Description], [Discount], [ViewCount], [Special]) VALUES (77, N'Đồng hồ thông minh Apple Watch SE 2022', 5990000, N'Apple_Watch_SE_2022.png', CAST(N'2024-05-15' AS Date), 1, 3, 332, N'<p>Trong sự kiện Far Out 2022, nh&agrave; T&aacute;o Khuyết đ&atilde; mang đến h&agrave;ng loạt sản phẩm mới trong đ&oacute; c&oacute; đồng hồ th&ocirc;ng minh&nbsp;Apple Watch SE 2022. Mẫu smartwatch gi&aacute; rẻ mới nhất của Apple n&agrave;y hứa hẹn sẽ khiến cho c&aacute;c iFans đứng ngồi kh&ocirc;ng y&ecirc;n khi sở hữu nhiều t&iacute;nh năng hấp dẫn.</p>

<p>Kiểu d&aacute;ng cuốn h&uacute;t với thiết kế đặc trưng của Apple</p>

<p>Nh&igrave;n tổng thể,&nbsp;Apple Watch SE 2022 GPS 40mm viền nh&ocirc;m d&acirc;y thể thao&nbsp;vẫn giữ kiểu thiết kế tương tự như thế hệ tiền nhiệm, tuy nhi&ecirc;n&nbsp;đ&atilde; được Apple trang bị&nbsp;m&agrave;n h&igrave;nh lớn hơn 30%&nbsp;so với phi&ecirc;n bản Watch 3 Series, cho bạn một kh&ocirc;ng gian hiển thị lớn hơn. Tấm nền&nbsp;OLED&nbsp;c&ugrave;ng độ ph&acirc;n giải&nbsp;324 x 394 pixels&nbsp;cũng mang đến những trải nghiệm về thị gi&aacute;c tuyệt vời trong bất cứ điều kiện &aacute;nh s&aacute;ng n&agrave;o.</p>

<p>Apple Watch&nbsp;c&oacute; khung viền được ho&agrave;n thiện từ&nbsp;hợp kim nh&ocirc;m&nbsp;kết hợp c&ugrave;ng d&acirc;y đeo silicone với nhiều m&agrave;u sắc. B&ecirc;n cạnh đ&oacute;, lớp vỏ xung quanh c&aacute;c cảm biến của thiết bị đ&atilde; được đổi mới để ph&ugrave; hợp hơn với m&agrave;u sắc của đồng hồ.</p>

<p>Hiệu suất nhanh hơn với bộ vi xử l&yacute; ho&agrave;n to&agrave;n mới</p>

<p>Hệ thống&nbsp;vi xử l&yacute; S8 SiP&nbsp;mới nhất v&agrave; mạnh nhất l&agrave; một trong những n&acirc;ng cấp đ&aacute;ng gi&aacute; của&nbsp;đồng hồ th&ocirc;ng minh Apple Watch SE&nbsp;n&agrave;y. Apple cho biết, với bộ chipset được cải tiến, đồng hồ cho khả năng&nbsp;xử l&yacute; c&aacute;c t&aacute;c vụ nhanh hơn đến 20%&nbsp;so với thế hệ Watch SE trước đ&oacute;. Điều n&agrave;y mang đến cho bạn những trải nghiệm nhanh ch&oacute;ng, mượt m&agrave; v&agrave; thậm ch&iacute; vẫn rất ổn định trong nhiều năm tới.</p>

<p>Apple Watch SE 2022 GPS 40mm hoạt động tr&ecirc;n nền tảng&nbsp;WatchOS 9 mới nhất. Apple đ&atilde; bổ sung nhiều t&iacute;nh năng cao cấp từ tiện &iacute;ch đến chăm s&oacute;c sức khoẻ n&acirc;ng cao. Nổi bật trong số đ&oacute; c&oacute; thể kể đến như c&aacute;c t&iacute;nh năng tập luyện chi tiết hơn, dữ liệu chuy&ecirc;n s&acirc;u về giấc ngủ lần đầu ti&ecirc;n v&agrave; theo d&otilde;i thuốc. Ngo&agrave;i ra, bạn cũng sẽ nhận được t&ugrave;y chọn cho c&aacute;c th&ocirc;ng b&aacute;o kiểu biểu ngữ (thay v&igrave; những th&ocirc;ng b&aacute;o chiếm to&agrave;n m&agrave;n h&igrave;nh), c&aacute;c t&iacute;nh năng thiết lập gia đ&igrave;nh mới v&agrave; mặt đồng hồ mới t&ugrave;y chỉnh.</p>

<p>Lưu &yacute;: Apple Watch SE 2022 tương th&iacute;ch với iOS 17 trở l&ecirc;n.</p>

<p>T&iacute;nh năng ph&aacute;t hiện va chạm&nbsp;</p>

<p>Giống như Apple Watch Series 8, Watch SE 2022 được cung cấp&nbsp;t&iacute;nh năng ph&aacute;t hiện va chạm. Apple đ&atilde; th&ecirc;m hai cảm biến gia tốc mới tr&ecirc;n đồng hồ v&agrave; gia tốc kế được sử dụng để ph&aacute;t hiện va chạm. Khi bạn c&agrave;i đặt số điện thoại người th&acirc;n l&agrave;m địa chỉ li&ecirc;n hệ khẩn cấp, t&iacute;nh năng n&agrave;y sẽ&nbsp;ph&aacute;t cảnh b&aacute;o&nbsp;cho c&aacute;c dịch vụ khẩn cấp, cung cấp th&ocirc;ng tin vị tr&iacute; v&agrave; th&ocirc;ng b&aacute;o cho những người th&acirc;n nếu chẳng may người d&ugrave;ng kh&ocirc;ng may gặp tai nạn &ocirc; t&ocirc;.</p>

<p>Đa dạng t&iacute;nh năng chăm s&oacute;c v&agrave; theo d&otilde;i sức khoẻ th&ocirc;ng minh</p>

<p>Apple Watch SE 2022 được thừa hưởng loạt cảm biến ấn tượng từ thế hệ cũ như theo d&otilde;i nhịp tim, chấm điểm chất lượng giấc ngủ, ph&aacute;t hiện t&eacute; ng&atilde;, nhắc nhở nhịp tim cao, thấp,... Đ&aacute;ng ch&uacute; &yacute;,&nbsp;đồng hồ th&ocirc;ng minh&nbsp;n&agrave;y cũng sở hữu th&ecirc;m&nbsp;hệ thống cảm biến nhịp tim quang học thế hệ 2&nbsp;v&agrave;&nbsp;t&iacute;nh năng theo d&otilde;i thuốc, hỗ trợ bạn chủ động theo d&otilde;i sức khỏe nhanh v&agrave; ch&iacute;nh x&aacute;c hơn.</p>

<p>Thời lượng pin được cải thiện</p>

<p>Đồng hồ cho thời lượng pin sử dụng khoảng&nbsp;18&nbsp;giờ&nbsp;ở chế độ sử dụng th&ocirc;ng thường (theo c&ocirc;ng bố từ nh&agrave; sản xuất).&nbsp;</p>

<p>Đa dạng c&aacute;c b&agrave;i tập thể thao</p>

<p>Kh&ocirc;ng chỉ l&agrave; một chiếc&nbsp;đồng hồ th&ocirc;ng minh&nbsp;chăm s&oacute;c sức khỏe, Apple Watch c&ograve;n l&agrave; một thiết bị gi&uacute;p người d&ugrave;ng r&egrave;n luyện thể thao hiệu quả. N&oacute; được t&iacute;ch hợp nhiều chế độ tập luyện kh&aacute;c nhau như đạp xe, bơi, Yoga, chạy bộ,... gi&uacute;p bạn c&oacute; thể cải thiện sức khỏe của m&igrave;nh tốt hơn. T&iacute;nh năng tự động tạm dừng v&agrave; tiếp tục gi&uacute;p phản &aacute;nh ch&iacute;nh x&aacute;c thời gian luyện tập của bạn.</p>

<p>Nhiều t&iacute;nh năng hấp dẫn kh&aacute;c</p>

<p>Đồng hồ th&ocirc;ng minh Apple chống nước 5 ATM&nbsp;cho ph&eacute;p bạn hoạt động trong m&ocirc;i trường ẩm ướt v&agrave; vẫn an to&agrave;n khi đi mưa hay rửa tay. Một số tiện &iacute;ch ấn tượng kh&aacute;c cũng xuất hiện tr&ecirc;n đồng hồ như cuộc gọi khẩn cấp SOS, nghe gọi tr&ecirc;n đồng hồ, điều khiển chụp ảnh v&agrave; ph&aacute;t nhạc,... hứa hẹn sẽ mang đến cho bạn một cuộc sống hiện đại hơn.</p>

<p>Nh&igrave;n chung, Apple Watch SE 2022 GPS 40mm l&agrave; phi&ecirc;n bản&nbsp;đồng hồ th&ocirc;ng minh đa tiện &iacute;ch&nbsp;rất đ&aacute;ng để sở hữu trong năm 2022 n&agrave;y. Nhờ v&agrave;o thiết kế đẹp mắt, c&aacute;c t&iacute;nh năng về an to&agrave;n v&agrave; sức khoẻ được h&atilde;ng ch&uacute; trọng n&acirc;ng cấp. Đ&acirc;y sẽ l&agrave; m&oacute;n phụ kiện thời trang tuyệt vời d&agrave;nh cho c&aacute;c t&iacute;n đồ nh&agrave; T&aacute;o.</p>
', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'admin', N'hahaha', N'hahaha', 343906233, N'happyshopsuport2024@gmail.com', N'avatar.jpg', 1, 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'phuc', N'123456', N'trthanhphuc', 795710107, N'tranthanhphuc919@gmail.com', N'phuc.png', 1, 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'qanh', N'123456', N'trquanganh', 332044749, N'anhpk2310@gmail.com  ', N'user.png', 1, 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'thien', N'123456', N'phamminhthien', 984268233, N'minhthienp50@gmail.com', N'7c3b81ea7380800cf006b940ae5799d5.png', 1, 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'tuan', N'123456', N'nguyenleanhtuan', 886767856, N'anhtuanhdqb@gmail.com', N'tuan.png', 1, 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Telephone], [Email], [Photo], [Activated], [Admin]) VALUES (N'xiucute', N'xinhdep123', N'Xinh đẹp', 343906233, N'bethien92qn@gmail.com', N'730790ba0a90abcef281.png', 1, 0)
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [duan] SET  READ_WRITE 
GO
