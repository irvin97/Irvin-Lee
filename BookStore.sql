USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 6/1/2020 08:10:34 ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.IRVIN\MSSQL\DATA\BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.IRVIN\MSSQL\DATA\BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore', N'ON'
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaChuDe] [char](5) NOT NULL,
	[TenChuDe] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[SachID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayDang] [date] NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[SachID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[DatHangID] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [datetime] NOT NULL,
	[TriGia] [float] NOT NULL,
	[DaGiao] [bit] NOT NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [varchar](15) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[DatHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHangCT]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHangCT](
	[DatHangID] [int] NOT NULL,
	[SachID] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[ThanhTien] [float] NOT NULL,
 CONSTRAINT [PK_DatHangCT] PRIMARY KEY CLUSTERED 
(
	[DatHangID] ASC,
	[SachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[NhaXuatBanID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaXuatBan] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [varchar](15) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[NhaXuatBanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[SachID] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](150) NULL,
	[GiaBan] [float] NOT NULL,
	[MaChuDe] [char](5) NULL,
	[NhaXuatBanID] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhBia] [nvarchar](50) NULL,
	[SoTrang] [int] NOT NULL,
	[TrongLuong] [int] NOT NULL,
	[NgayCapNhat] [datetime] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[SoLuongBan] [int] NOT NULL,
	[HetHang] [bit] NOT NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[SachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlideBar]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlideBar](
	[SlideID] [int] IDENTITY(1,1) NOT NULL,
	[Hinh] [varchar](50) NULL,
 CONSTRAINT [PK_SlideBar] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[TacGiaID] [int] IDENTITY(1,1) NOT NULL,
	[TenTacGia] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [varchar](15) NULL,
	[TieuSu] [nvarchar](max) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[TacGiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThamGia]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThamGia](
	[SachID] [int] NOT NULL,
	[TacGiaID] [int] NOT NULL,
	[VaiTro] [nvarchar](100) NULL,
	[ViTri] [int] NOT NULL,
 CONSTRAINT [PK_ThamGia] PRIMARY KEY CLUSTERED 
(
	[SachID] ASC,
	[TacGiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinCongTi]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinCongTi](
	[TenCongTi] [nvarchar](50) NOT NULL,
	[TruSo] [nvarchar](max) NULL,
	[SDT] [varchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Logo] [varchar](50) NULL,
 CONSTRAINT [PK_ThongTinCongTi] PRIMARY KEY CLUSTERED 
(
	[TenCongTi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](max) NULL,
	[TrangThai] [bit] NOT NULL,
	[RoleID] [int] NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserKH]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserKH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](max) NULL,
	[PassWord] [nvarchar](max) NULL,
	[ConfirmPassword] [nvarchar](max) NULL,
	[Ten] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[DienThoai] [nvarchar](max) NULL,
	[TinhThanh] [nvarchar](50) NULL,
	[QuanHuyen] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [bit] NULL,
	[Hinh] [varchar](50) NULL,
 CONSTRAINT [PK_UserKH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[TenRole] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YKienKH]    Script Date: 6/1/2020 08:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YKienKH](
	[Email] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [varbinary](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayGui] [date] NULL,
	[KHID] [bigint] NULL,
 CONSTRAINT [PK_YKienKH] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'ABC  ', N'AHDNCU')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'AH   ', N'AH')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'AMNHA', N'Âm nhạc')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'CNTTI', N'Công nghệ thông tin')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'DNHAN', N'Danh nhân')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'DULIC', N'Du lịch')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'KHKTH', N'Khoa học kỹ thuật')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'KHVLY', N'Khoa học Vật lý')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'KHXHO', N'Khoa học Xã hội')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'KINTE', N'Kinh Tế')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'LSDLY', N'Lịch sử, địa lý')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'LUAT ', N'Luật')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'MYTHU', N'Mỹ thuật')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'NCGCH', N'Nữ công gia chánh')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'NGNGU', N'Ngoại ngữ')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'NGTHU', N'Nghệ thuật')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'NTLDE', N'Nghệ thuật làm đẹp')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'PGIAO', N'Phật Giáo')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'SGKHO', N'Sách giáo khoa')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'SHLNG', N'Sách học làm người')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'STKHA', N'Sách tham khảo')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'TDIEN', N'Từ điển')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'TLGDU', N'Tâm lý giáo dục')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'TTVTH', N'Thể thao - Võ thuật')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'VHNNG', N'Văn học nước ngoài')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'VHXHO', N'Văn hóa - Xã hội')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'VNCCA', N'Vật nuôi - Cây cảnh')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (N'YHDTO', N'Y Học dân tộc')
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (1, 5, N'123', CAST(N'2019-11-19' AS Date), 5)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (2, 4, N'taoasdasdada', CAST(N'2015-12-12' AS Date), 4)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (2, 5, N'9556', CAST(N'2019-11-20' AS Date), 0)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (3, 4, N'edvc', CAST(N'2019-12-15' AS Date), 3)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (4, 4, N'good', CAST(N'2019-12-15' AS Date), 5)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (5, 5, N'wd', CAST(N'2019-11-20' AS Date), 4)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (11, 4, N'edewfdv', CAST(N'2019-12-25' AS Date), 4)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (13, 1009, N'ưqdefg', CAST(N'2019-12-24' AS Date), 5)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (16, 4, N'dàghhj', CAST(N'2020-06-01' AS Date), 3)
INSERT [dbo].[Comment] ([SachID], [UserID], [NoiDung], [NgayDang], [Rating]) VALUES (54, 1008, N'ef4w', CAST(N'2019-11-21' AS Date), 3)
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (1, CAST(N'2019-04-15T13:21:30.000' AS DateTime), 85000, 1, CAST(N'2019-04-15T12:00:00.000' AS DateTime), N'Tấn Phát', N'146/13 Trần Kế Xương P.7 Q.Phú Nhuận', N'0938676155', N'tanphat@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (2, CAST(N'2019-04-15T13:23:08.000' AS DateTime), 55000, 0, NULL, N'ada', N'ada', N'0236 3797 814', N'ssa@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (3, CAST(N'2019-04-16T13:44:39.507' AS DateTime), 75000, 0, NULL, N'wqdq', N'sada', N'0938676155', N'54@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (4, CAST(N'2019-04-18T11:12:51.480' AS DateTime), 222600, 0, NULL, N'Irvin', N'abcd', N'0236 3797 814', N'irvin@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (5, CAST(N'2019-04-20T21:30:55.520' AS DateTime), 380000, 0, NULL, N'Trần Công Danh', N'146/13 Trần Kế Xương P.7 Q.Phú Nhuận', N'0938676155', N'danh@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (6, CAST(N'2019-10-30T21:22:25.000' AS DateTime), 75000, 1, NULL, N'irvin lee', N'Su van hanh', N'05418404244', N'irvinlee@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (7, CAST(N'2019-11-20T19:46:37.610' AS DateTime), 460000, 0, NULL, N'phat', N'9412rfgfb', N'wer', NULL)
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (1007, CAST(N'2019-11-21T11:14:31.707' AS DateTime), 55000, 0, NULL, N'phat', N'fghg', N'321321', N'phat12@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (1008, CAST(N'2019-12-16T08:04:13.250' AS DateTime), 95000, 0, NULL, N'john', N'john 123456', N'2158465123', N'john@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (1009, CAST(N'2019-12-16T08:12:17.880' AS DateTime), 60000, 0, NULL, N'khang', N'ewgdjhj', N'97465', N'dh@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (1010, CAST(N'2019-12-16T08:17:32.623' AS DateTime), 55000, 0, NULL, N'qefdnmdsfgbn vcx', N'sadfvbnm,412', N'6523', N'dewfd@gmail.com')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (1011, CAST(N'2019-12-24T23:25:01.450' AS DateTime), 274000, 0, NULL, N'ABCJD', N'jgvdhbjnkqd', N'65412', N'sldjnld')
INSERT [dbo].[DatHang] ([DatHangID], [NgayDatHang], [TriGia], [DaGiao], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [Email]) VALUES (1012, CAST(N'2019-12-25T01:38:17.790' AS DateTime), 61000, 0, NULL, N'Phuc', N'dfeewfr', N'419894', N'dfsx@gmail.com')
SET IDENTITY_INSERT [dbo].[DatHang] OFF
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1, 1, 1, 85000, 85000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (2, 3, 1, 55000, 55000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (3, 2, 1, 75000, 75000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (4, 2, 2, 75000, 150000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (4, 65, 1, 72600, 72600)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (5, 68, 10, 38000, 380000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (6, 2, 1, 75000, 75000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (7, 11, 1, 50000, 50000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (7, 38, 1, 25000, 25000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (7, 40, 11, 35000, 385000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1007, 3, 1, 55000, 55000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1008, 1, 1, 95000, 95000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1009, 4, 1, 60000, 60000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1010, 45, 1, 55000, 55000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1011, 4, 1, 60000, 60000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1011, 32, 2, 65000, 130000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1011, 53, 1, 84000, 84000)
INSERT [dbo].[DatHangCT] ([DatHangID], [SachID], [SoLuong], [DonGia], [ThanhTien]) VALUES (1012, 12, 1, 61000, 61000)
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang Chủ', N'/#', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Danh Mục', N'/danh-muc', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Sách Theo NXB', N'/sach-theo-nxb', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Đọc Nhiều', N'/doc-nhieu', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên Hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Admin Trang Chủ', N'/admin-trang-chu', 1, N'_blank', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Admin San Phẩm', N'/admin-san-pham', 2, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (8, N'Admin Nhà Xuất Bản', N'/admin-nha-xuat-ban', 3, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (9, N'Admin Chủ Đề', N'/admin-chu-de', 4, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (10, N'Admin Quản Lý CSDL', N'/admin-quan-ly-csdl', 5, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (11, N'Admin Chi Tiết Đơn Hàng', N'/admin-chi-tiet-don-hang', 6, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (12, N'Đăng nhập', N'/KhachHangUser/DangNhap', 1, N'_self', 1, 3)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (13, N'Đăng ký', N'/KhachHangUser/DangNhap', 2, N'_self', 1, 3)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu Trang Chủ')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Admin')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (3, N'Menu Top Trang Chủ')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (1, N'Nhà xuất bản Trẻ', N'124 Nguyễn Văn Cừ Q.1 Tp.HCM', N'19001560')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (2, N'NXB Thống kê', N'Biên Hòa-Đồng Nai', N'190015110')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (3, N'Kim đồng', N'Tp.HCM', N'19001570')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (4, N'Đại học quốc gia', N'Tp.HCM', N'0908419981')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (5, N'Văn hóa nghệ thuật', N'Đà Nẵng', N'0903118833')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (6, N'Văn hóa', N'Bình Dương', N'0913336677')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (7, N'NXB Lao động - Xã hội', N'Tp.HCM', N'0989888888')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (8, N'Khoa Học & Kỹ Thuật', N'Hà Nội', N'8351056')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (9, N'Thanh Niên', N'Tp.HCM', N'4545454')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (10, N'NXB Tài Chính', N'Huế', N'')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (11, N'NXB Phụ Nữ', N'Tp.HCM', N'')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (12, N'NXB Hồng Đức ', N'Tp.HCM', N'0989888885')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (13, N'NXB Phương Đông', N'Tp.HCM', N'0989888889')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (14, N'NXB Thời Đại', N'', N'')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (15, N'NXB Tổng hợp TP.HCM', N'', N'')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (16, N'NXB Đà Nẵng', N'30 Tháng 4, Hoà Cường Bắc, Hải Châu, Đà Nẵng', N'0236 3797 814')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (17, N'sadfr', N'sdca', N'6152215623')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (19, N'DFWEDNDF', N'wffewd21', N'214')
INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNhaXuatBan], [DiaChi], [DienThoai]) VALUES (20, N'DFWEDN', N'dfdfv2154đe', N'8787')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (1, N'Sketchup & Vray Trong Thiết Kế Kiến Trúc', 95000, N'CNTTI', 1, N'Nội dung sách bao gồm 2 phần - 17 bài tập:Phần 1: Gồm 2 bài tập hướng dẫn thực hành với SKETCHUP PRO 7.0, các công cụ troongSketchup trình bày sâu hơn giúp bạn đọc khai thác có hiệu quả Sketchup trong công việc.Phần 2: Gồm 5 bài tập hướng dẫn thục hành với Sketchup Pro phiên bản mới nhất 8.0 cùng chương trình V- Ray chuyên dùng để render (diễn hoạt) mà trong tập 1 chưa trình bày.Sau đây là tóm tắt các nội dung các bài tập trong sáchBài tập 1: Tổng quan về SketchupBài tập 2: Các thao tác cơ bản trong SketchupBài tập 3: Sử dụng công cụ move/copyBài tập 4: Sử dụng công cụ OffsetBài tập 5: Sử dụng công cụ Foollow meBài tập 6: Tạo tốc độ của mái nhà Bài tập 7: Hướng dẫn thiết kế mái nhàBài tập 8: Tạo Groups và ComponentsBài tập 9: Sử dụng chức năng Intersect with modelBài tập 10: Sử dụng chức năng ComponentBài tập 11: Nhập và xuất FileBài tập 12: Vẽ nhà phốBài tập 13: Cài đặt Vray cho SketchupBài tập 14: Giới thiệu VrayBài tập 15: Gắn vật liệu và Render phòng tắmBài tập 16: Gán vật liệu và Render nhà phốBài tập 17: Gán vật liệu và Render phòng đọc sách', N'000001.jpg', 227, 324, CAST(N'2012-03-31T00:00:00.000' AS DateTime), 200, 60, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (2, N'3DS Max-Thủ Thuật Render Phối Cảnh kiến Trúc Ban Ngày Và Đêm Với V-Ray 1.50 RC3', 75000, N'CNTTI', 2, N'Cuốn sách 3DS Max giới thiệu đến các bạn những kỹ năng sử dụng phần mềm hỗ trợ V-ray mới nhất đang được nhiều người trên thế giới quan tâm. 
Đây là một Plug-in có nhiều tính năng hỗ trợ mới như: 
Ánh sáng VrayLight, VraySun, VraySky
Vật liệu VrayMaterial
Xuất tập tin RenderVray 
Đó là nội dung tập sách "3DS Max - Thủ thuật Render phối cảnh kiến trúc ban ngày và đêm với V-ray 1.50 RC3 ứng dụng thực hành trong thiết kế kiến trúc" với phương pháp ngắn gọn, học nhanh, dễ hiểu.', N'000002.jpg', 302, 342, CAST(N'2012-03-31T00:00:00.000' AS DateTime), 1000, 25, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (3, N'Tự Học InDesign CS3', 55000, N'CNTTI', 3, N'InDesign CS3 là chương trình dàn trang rất hiện đại và tiện dụng dành cho việc trình bày sách, báo, tạp chí...
Với InDesign CS3 các bạn sẽ thực hiện các ấn phẩm của mình một cách dễ dàng tiện lợi và đạt tính thẩm mỹ cao.', N'000003.jpg', 220, 324, CAST(N'2012-01-02T00:00:00.000' AS DateTime), 200, 23, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (4, N'Đắc Nhân Tâm - Cuốn Sách Hay Nhất Của Mọi Thời Đại Đưa Bạn Đến Thành Công!', 60000, N'SHLNG', 4, N'Đắc nhân tâm – How to win friends and Influence People của Dale Carnegie là quyển sách nổi tiếng nhất, bán chạy nhất và có tầm ảnh hưởng nhất của mọi thời đại. 
Tác phẩm đã được chuyển ngữ sang hầu hết các thứ tiếng trên thế giới và có mặt ở hàng trăm quốc gia. Đây là quyển sách duy nhất về thể loại self-help liên tục đứng đầu danh mục sách bán chạy nhất (best-selling Books) do báo The New York Times bình chọn suốt 10 năm liền. Riêng bản tiếng Anh của sách đã bán được hơn 15 triệu bản trên thế giới. 
Tác phẩm có sức lan toả vô cùng rộng lớn – dù bạn đi đến bất cứ đâu, bất kỳ quốc gia nào cũng đều có thể nhìn thấy. 
Tác phẩm được đánh giá là quyển sách đầu tiên và hay nhất, có ảnh hưởng làm thay đổi cuộc đời của hàng triệu người trên thế giới.', N'000004.jpg', 302, 342, CAST(N'2012-02-18T00:00:00.000' AS DateTime), 2000, 240, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (5, N'Tự Học Photoshop CS5 Qua Hình Ảnh Minh Họa (Sách Kèm CD)', 62000, N'CNTTI', 1, N'Nhằm đáp ứng nhu cầu tự học Photoshop, một phần mềm xử lý ảnh ngày càng nhiều. Sách " Tự Học Photoshop CS5 Qua Hình Ảnh Minh Họa" được chia thành 11 chương kèm với hình ảnh minh họa và CD bài tập được kèm theo sách. 
Với các chương giúp bạn tự học và tự thực hành nhằm ứng dụng vào công việc của mình dễ dàng như:- Xử lý các ảnh chụp kỹ thuật số...', N'000005.jpg', 302, 342, CAST(N'2012-02-18T00:00:00.000' AS DateTime), 200, 16, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (6, N'180 Thủ Thuật Và Mẹo Hay Trong Flash CS4', 71000, N'CNTTI', 5, N'Adobe Flash Professional CS4 là phiên bản mới nhất của công cụ thiết kế Web đang rất thịnh hành hiện nay. 
Chương trình không những được sử dụng để tạo các hoạt hình đơn giản mà còn có công dụng rất cao trong việc tạo những Website ấn tượng và những ứng dụng Web chuyên nghiệp. 
Quyển sách "180 Thủ thuật và mẹo hay trong Flash CS4" sẽ hướng dẫn bạn đọc về các tính năng của ứng dụng này và cách vận dụng chúng một cách khéo léo và sáng tạo vào việc tạo hoạt hình.
Sách gồm 12 chương, được thiết kế phù hợp cho những người mới bắt đầu sử dụng Flash và những chuyên viên thiết kế Flash muốn tìm hiểu thêm về Flash CS4. 
Các chương đầu trình bày những vấn đề căn bản về việc tạo các thành phần đồ họa bằng cách sử dụng các công cụ vẽ của Flash CS4. Các chương tiếp theo sau đó sẽ hướng dẫn cách biến đổi các thành phần đồ họa thành những cảnh hoạt hình ấn tượng. 
Bên cạnh đó sách còn hướng dẫn nhiều nội dung thú vị khác liên quan đến hoạt hình với Flash. Sách được bố cục rõ ràng theo từng chương và đề mục, nội dung trình bày ngắn gọn kèm hình ảnh minh họa. ', N'000006.jpg', 302, 342, CAST(N'2012-01-15T00:00:00.000' AS DateTime), 200, 65, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (7, N'Microsoft Office 2010 - Dành Cho Người Tự Học', 18000, N'CNTTI', 6, N'Trong lĩnh vực tin học văn phòng, Microsoft Word, Excel, PowerPoint, Visio là những chương trình thuộc bộ Microsoft Office đã và đang được ứng dụng rộng rãi trong nhiều lĩnh vực: kinh tế, kế toán, thương mại, quản lý, vẽ kỹ thuật và nhiều hơn nữa. Với Office 2010, bạn có trong tay đầy đủ các công cụ và lệnh để thực hiện các tiện ích trong diện toán văn phòng .', N'000007.jpg', 124, 253, CAST(N'2012-01-10T00:00:00.000' AS DateTime), 200, 5, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (8, N'Tự học Microsoft Excel 2010', 37000, N'CNTTI', 7, N'Sách được chia thành 11 bài, từ căn bản đến nâng cao kèm theo CD bài tập thực hành nhằm giúp bạn học một cách nhanh chóng và dễ hiểu như:', N'000008.jpg', 124, 253, CAST(N'2012-01-15T00:00:00.000' AS DateTime), 200, 8, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (9, N'C# Dành Cho Người Tự Học - Tập 1', 67000, N'CNTTI', 8, N'', N'000009.jpg', 302, 342, CAST(N'2012-02-15T00:00:00.000' AS DateTime), 200, 87, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (10, N'C# Dành Cho Người Tự Học - Tập 2', 69000, N'CNTTI', 2, N'Trong tập 2 này, các bạn sẽ tìm hiểu ứng dụng C# trong Windows Form qua 2 phần, mỗi phần là một bài tập lớn xây dựng lên ứng dụng Quản lý bán hàng và Quản lý tuyển sinh để bạn đọc hiểu rõ và khai thác có hiệu quả những công cụ và lệnh của C# đã trình bày trong tập 1.

Mục lục
Phần 1: Ứng dụng quản lý nhà hàng
Phần 2: Ứng dụng quản lý tuyển sinh Đại học - Cao đẳng
', N'000010.jpg', 302, 342, CAST(N'2012-02-15T00:00:00.000' AS DateTime), 500, 5, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (11, N'Nghệ Thuật Sống An Lạc ', 50000, N'PGIAO', 3, N'"Nghệ thuật sống An lạc là tuyển tập các bài giảng liên quan tới chủ đề nghệ thuật sống của Đức Nhiếp Chính Vương Khamtrul Rinpoche đời thứ IX Jigme Pema Nyinjadh . 
Tốt nghiệp bằng Tiến Sĩ Phật giáo hạng ưu tại Đại học Tự Viện Tango, vương quốc Bhutan, Ngài trứ danh với sở học uyên bác, khả năng thuyết pháp độc đáo uyên thâm song cũng vô cùng gần gũi, nhân văn. 
Tuyển tập này bao gồm các bài giảng gần đây của Ngài tại Singapore, Hồng Kông...giúp chúng ta có được tri kiến đúng đắn về các giá trị tâm linh, qua đó mở ra cánh cửa trở về tự tính tâm và tìm lại chìa khóa hạnh phúc vô giá cho mình và mọi người trong đời sống hiện tại.', N'000011.jpg', 220, 324, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 1790, 1500, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (12, N'Phương Pháp Quản Lý Nhân Sự Trong Công Ty', 61000, N'KINTE', 8, N'Những người sử dụng lao động đã hiểu dần các giá trị mà con người tạo ra cho tổ chức của họ. 
Việc duy trì nhân viên hiện trở nên rất quan tâm. Dưới 20 năm trước, các lao động trung thành rất cao, ít người phải xem xét chuyện rời bỏ công việc để đi làm cho đối thủ cạnh tranh. Tất cả đã thay đổi. Những ngày xa vời đó, người lao động chịu trách nhiệm về sự nghiệp của họ.
Nếu người chủ hiện tại không thể đề nghị một công việc để thử thách, đủ thúc đẩy, đủ linh hoạt cũng như trả lương cao như họ muốn, thế là giải pháp nhanh nhất hữu hiệu nhất là đi tìm một ông chủ khác có thể làm các việc trên. Do một số lý do, nhân viên trung thành tất cả đã bốc hơi.', N'000012.jpg', 302, 342, CAST(N'2012-02-16T00:00:00.000' AS DateTime), 1230, 5, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (13, N'Ngọc Sáng Trong Hoa Sen', 79000, N'PGIAO', 7, N'Trong nửa thế kỷ qua, số người phương Tây thăm viếng phương Đông không phải là ít nhưng đã có mấy ai lĩnh hội được tinh hoa của phương Đông? 
Nếu có một thiểu số may mắn học hỏi được chút gì thì đã mấy người viết sách chia sẻ kinh nghiệm đó với chúng ta? Tất nhiên Lafcadio Hearn đã làm điều này, nhưng ông chỉ ghi nhận vài chi tiết huyền bí về châu Á. 
Alan Watts đi xa hơn trong việc tìm hiểu những giá trị tâm linh, nhưng ông cũng chỉ chú trọng về kỹ thuật và phương pháp chứ không đào sâu vào những phương diện khác. 
John Blofeld khác hẳn hai tác giả trên, ông không ghé thăm như một khách lạ mà sống hẳn ở đây gần trọn cuộc đời. Không những ông học hỏi và trải nghiệm nhiều, mà ông còn chia sẻ với chúng ta những vui buồn của kiếp người trong giai đoạn giao thời giữa Đông và Tây lúc đó.', N'000013.jpg', 302, 342, CAST(N'2011-05-24T00:00:00.000' AS DateTime), 2209, 2000, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (14, N'Hành Trình Về Phương Đông', 48000, N'PGIAO', 6, N'"Hành trình về phương đông" kể về những trải nghiệm của một đoàn khoa học gồm các chuyên gia hàng đầu của Hội Khoa Học Hoàng Gia Anh được cử sang Ấn Độ nghiên cứu về huyền học và những khả năng siêu nhiên của con người. 
Suốt hai năm trời rong ruổi khắp các đền chùa Ấn Độ, chứng kiến nhiều pháp thuật, nhiều cảnh mê tín dị đoan, thậm chí lừa đảo...của nhiều pháp sư, đạo sĩ...họ được tiếp xúc với những vị chân tu thông thái sống ẩn dật ở thị trấn hay trên rặng Tuyết Sơn. 
Nhờ thế, họ được chứng kiến, trải nghiệm, hiểu biết sâu sắc về các khoa học cổ xưa và bí truyền của văn hóa Ấn Độ như yoga, thiền định, thuật chiêm tinh, các phép dưỡng sinh và chữa bệnh, những kiến thức về nhân duyên, nghiệp báo, luật nhân quả, cõi sống và cõi chết...', N'000014.jpg', 124, 253, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 800, 2500, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (15, N'Lập Bản Đồ Tư Duy - Công Cụ Tư Duy Tối Ưu Sẽ Làm Thay Đổi Cuộc Sống Của Bạn', 18000, N'SHLNG', 3, N'Lập Bản Đồ Tư Duy - Công Cụ Tư Duy Tối Ưu Sẽ Làm Thay Đổi Cuộc Sống Của Bạn:', N'000015.jpg', 124, 253, CAST(N'2011-11-20T00:00:00.000' AS DateTime), 800, 8, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (16, N'Đơn Giản Và Thuần Khiết', 61000, N'PGIAO', 8, N'Giới thiệu về nội dung Tác phẩm này là tổng hợp của nhiều bài Pháp được giảng từ những năm 1954 đến 1977 của Upasika Kee Nanayon. Mỗi phần có thể là một bài giảng ở một thời điểm khác nhau, vì thế khi tập hợp lại, điều này tạo cho chúng ta cảm tưởng của sự lặp đi lặp lại nhiều ý tưởng. Đó có thể là lý do khiến cho một số độc giả thiếu kiên nhẫn khi theo dõi, riêng đối với những người sơ cơ thì điều đó lại là một ân huệ. Ngoài ra văn phong của Upasika Kee Nanayon rất giản dị, chân tình. Đôi khi chúng ta sẽ có cảm giác như đang nghe những lời nhắc nhở, dạy dỗ của một người thầy, người mẹ, dầu hơi nghiêm khắc, nhưng luôn tràn đầy tâm từ bi, muốn cho người nghe, người đọc phải tinh tấn thêm lên, gấp rút thêm lên trên con đường tu học của mình.', N'000016.jpg', 302, 342, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 800, 4, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (17, N'Cách Sống - Từ Bình Thường Trở Nên Phi Thường', 75000, N'KINTE', 7, N'Inamori Kazuo một doanh nhân hết sức thành đạt trong việc sáng lập và điều hành tập đoàn Kyocera lớn mạnh của Nhật Bản. 
Ông sẽ đem đến cho chúng ta những tư tưởng về Cách Sống. Đây là tập hợp những triết lý mà ông đúc rút ra được từ thực tế sau bao nhiêu năm gian nan xây dựng công ty.', N'000017.jpg', 302, 342, CAST(N'2012-02-15T00:00:00.000' AS DateTime), 800, 148, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (18, N'Những Quy Luật Mới Trong Bán Lẻ', 98000, N'KINTE', 6, N'Ngành bán lẻ đang chứng kiến một sự thay đổi trọng đại. 
Sự tiến bộ khoa học kỹ thuật, toàn cầu hóa và tình trạng bão hòa trên thị trường đã tạo ra cho người tiêu dùng hàng ngàn lựa chọn thay thế cho những sản phẩm tương tự nhau, và chính vì thế, họ càng trở nên khó tính và khắt khe hơn. 
Dưới tác động mạnh mẽ của những thay đổi này, hơn 50% số lượng nhà bán sỉ và bán lẻ hiện tại sẽ có nguy cơ bị gạt ra khỏi cuộc chơi. Các mô hình kinh doanh truyền thống đã hết thời và mối quan hệ giữa người bán và người mua sẽ chuyển dịch theo một hướng mới.', N'000018.jpg', 403, 412, CAST(N'2012-02-16T00:00:00.000' AS DateTime), 800, 46, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (19, N'Lavina Và Hầu Tước Elswick (Cuộc Chạy Trốn Nữ Hoàng)', 52000, N'VHNNG', 5, N'Khi Hoàng tử Stanislaus của xứ Balkan yêu cầu có một cô dâu của Anh quốc, Nữ hoàng Victoria đã quyết định chọn tiểu thư Lavina gửi cho hắn. Gia đình nàng có quan hệ họ hàng xa với hoàng tộc.', N'000019.jpg', 220, 324, CAST(N'2012-02-15T00:00:00.000' AS DateTime), 800, 100, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (20, N'Hành Vi Tổ Chức - Organizational Behavior', 252000, N'KINTE', 2, N'"Vũ trụ cũng không khó hiểu bằng hành động của con người." Marcel Proust Tiến sĩ Timothy A. Judge từng là giáo sư giảng dạy tại trường Đại Học Cornell và đại học Lowa. Ông nghiên cứu chuyên sâu vào các lĩnh vực liên quan đến sự khác biệt cá nhân, thuật lãnh đạo và ảnh hưởng hành vi con người...Ông đã được trao nhiều giải thưởng quan trọng như Emest J.McCormick Award, Larry L. Cummings Award...', N'000020.jpg', 370, 342, CAST(N'2012-02-11T00:00:00.000' AS DateTime), 700, 1, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (21, N'17 Nguyên Tắc Vàng Trong Làm Việc Nhóm', 61000, N'KINTE', 3, N'Khi trở thành thành viên của một nhóm nào đó thì vấn đề bạn cần băn khoăn không phải là “Có nên tham gia các hoạt động của nhóm không?” mà là “Những đóng góp của bạn có mang lại thành công cho nhóm không?” Các cá nhân không thể gắn kết với nhau là nguyên nhân làm tan rã nhóm. Một số người nghĩ rằng chìa khoá để thành công là nguyên tắc làm việc rõ ràng. Nhưng trên thực tế, có nhiều người rất siêng năng, khả năng làm việc độc lập rất tốt nhưng lại không thể làm việc cùng nhau để phát huy hết tiềm lực của họ. Thực chất, nhóm phải là nhóm những cá nhân luôn tương trợ, giúp đỡ lẫn nhau, tạo động lực cho nhau phát triển. Giữa các cá nhân phải có sự tương tác với nhau như một chuỗi phản ứng hoá học. Đó là cách thức để xây dựng nhóm của riêng bạn. ', N'000021.jpg', 302, 342, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 700, 4, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (22, N'Essential Words For The IELTS (Kèm 1 Đĩa CD)', 85000, N'NGNGU', 1, N'Extensive practice in vocabulary building and correct English usage, with emphasis on 600 words that appear frequently on the IELTS.', N'000022.jpg', 403, 412, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 700, 7, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (23, N'Tiếng Hàn Trong Giao Tiếp Hàng Ngày', 16800, N'NGNGU', 6, N'Mục lục
Bài 1: Chào hỏi
Bài 2: Sồ đếm
Bài 3: Thời gian, ngày, tháng, năm
Bài 4: Hỏi, đáp
Bài 5: Giao tế
Bài 6: Thời tiết, môi trường, quang cảnh
Bài 7: Giao thông
Bài 8: Ăn uống
Bài 9: Mua sắm
Bài 10: Du lịch', N'000023.jpg', 124, 253, CAST(N'2011-09-12T00:00:00.000' AS DateTime), 100, 7, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (24, N'80 Chiêu Thức Kinh Doanh Thành Công', 48000, N'KINTE', 4, N'Làm sao để nắm bắt và khai thác cơ hội kinh doanh hiệu quả nhất, doanh số tăng, lợi nhuận cao nhưng chi phí giảm? Làm sao để tạo được ấn tượng trong trí nhớ khách hàng? Làm sao để thị trường công nhận rằng bạn cung cấp các sản phẩm tốt nhất, có dịch vụ hậu mãi hoàn hảo nhất? Làm sao để tạo nên một tập thể nhân viên làm việc tích cực và sáng tạo?... Những câu hỏi đó luôn làm trăn trở các nhà quản trị doanh nghiệp, và bí mật sẽ được tiết lộ trong cuốn sách này', N'000024.jpg', 124, 253, CAST(N'2011-09-12T00:00:00.000' AS DateTime), 1700, 100, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (25, N'Những Công Cụ Thiết Yếu Trong Phân Tích Kỹ Thuật Thị Trường Tài Chính ', 106000, N'KINTE', 4, N'Một cuốn sách nghiêm túc thiết thực, sự giới thiệu tuyệt vời về phát triển kỹ thuật. Chen mang lại cho những người mới bắt đầu những ví dụ rõ ràng về các phương pháp và kinh tế, từ đó người đọc có thể chọn ra một hướng chuyên môn hóa', N'000025.jpg', 0, 253, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 700, 8, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (26, N'Nàng Lọ Lem Và Đàn Chuột Mất Tích', 15000, N'VHNNG', 8, N'Những chú chuột nhỏ đã trải qua một đêm lạnh cóng trên gác mái của lâu đài, chúng tìm vào phòng Lọ Lem mong được sưởi ấm. 
Nhưng bà quản gia khó tính của lâu đài đã nhẫn tâm xua đuổi chúng đi. May nhờ có bác làm vườn nhân hậu, lũ chuột đã được đem về sưởi ấm ở tàu ngựa. Nhưng còn Lọ Lem, nàng không biết các bạn chuột đáng yêu của mình ở đâu. Thế là một cuộc tìm kiếm bắt đầu!', N'000026.jpg', 124, 253, CAST(N'2012-03-29T00:00:00.000' AS DateTime), 730, 98, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (27, N'Công Chúa Aurora Và Chú Rồng Nhỏ', 15000, N'VHNNG', 3, N'Hãy thử tưởng tượng xem mình sẽ làm gì nếu kết bạn với một chú rồng nhỏ? Chắc chắn sẽ có những điều rất thú vị phải không? Vậy công chúa Aurora đã làm những gì khi tình cờ gặp chú rồng nhỏ trên đường đi dạo cùng hoàng tử ?', N'000027.jpg', 124, 253, CAST(N'2011-09-12T00:00:00.000' AS DateTime), 100, 8, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (28, N'3ds Max 2009 ', 74000, N'CNTTI', 2, N'Bộ sách “Dựng Các Mô Hình Kiến Trúc Phức Tạp Và Mô Phỏng Nội Thất - Ngoại Thất 3D” được biên soạn nhằm mục đích hướng dẫn những bạn đọc yêu thích đồ họa 3D thực hiện dễ dàng với chương trình 3ds Max 2009 Pro. Đây là chương trình có nhiều tính năng thiết kế 3D tuyệt vời mà bạn có thể ứng dụng trong kiến trúc xây dựng và trang trí nội ngoại thất.', N'000028.jpg', 302, 342, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 100, 28, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (29, N'Công Nghệ Mạng Máy Tính', 23000, N'CNTTI', 1, N'Cuốn sách gồm các nội dung chính sau:', N'000029.jpg', 124, 253, CAST(N'2002-07-16T00:00:00.000' AS DateTime), 700, 4, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (30, N'Tính Toán Thiết Kế Kết Cấu Với SAP 14', 82000, N'CNTTI', 2, N'Sách "Tính toán thiết kế kết cấu với SAP 14" được biên soạn gồm 13 tập, hướng dẫn các bạn thực hành tính toán, thiết kế những kết cấu cơ bản nhất với SAP 2000 14 qua mô hình dầm một nhịp đơn giản, dầm liên tục tải tập trung, dầm liên tục chịu tải phân bố, dầm liên tục chịu tải tổng hợp, dầm cầu thang, khung phẳng, khung không gian, bể nước các loại giàn không gian...Sách có thể làm tài liệu tham khảo thực hành cho các kĩ thuật liên quan như: chế tạo máy, giao thông, kiến trúc, kết cấu và nhiều hơn nữa.', N'000030.jpg', 403, 412, CAST(N'2011-09-12T00:00:00.000' AS DateTime), 700, 5, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (31, N'Revit Architecture 2011 Từ A Đến Z - Tập 2', 90000, N'CNTTI', 5, N'Revit Architecture 2011 từ A đến Z (Tập 2) là 1 trong những chuyên đề thuộc họ sách CAD trong kiến trúc-xây dựng do nhà sách STK biên soạn dùng làm tài liệu tham khảo, chủ yếu là thực hành hướng dẫn sử dụng chương trình Revit Architecture đã và đang sử dụng rộng rãi trong các trường Cao đẳng, Đại học khối công nghệ chuyên ngành, cũng như tại các văn phòng thiết kế. Nó cung cấp cho học sinh, sinh viên, giáo viên, kiến trúc sư, họa viên những kiến thức và kỹ năng cơ bản nhất về ứng dụng CAD trong thiết kế kiến trúc.', N'000031.jpg', 403, 412, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 700, 8, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (32, N'CoreIDraw X5 - Dành Cho Người Tự Học', 65000, N'CNTTI', 6, N'Coreldraw X5 dành cho người tự học được biên soạn cho người mới bắt đầu sử dụng coreldraw trong thiết kế, học tập và nhiều hơn nữa. Quyển sách này được minh họa bằng hình ảnh cả lý thuyết lẫn thực hành sẽ giúp bạn dễ dàng tìm hiểu và khám phá các đặc tính của Coreldraw x5 để ứng dụng trong công việc thực tế và hiệu quả nhất.', N'000032.jpg', 302, 342, CAST(N'2012-01-15T00:00:00.000' AS DateTime), 700, 56, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (33, N'Chế Bản Điện Tử Với Ilustrator CS5', 56000, N'CNTTI', 7, N'Sách cần thiết cho học sinh, sinh viên, những bạn đã biết hoặc chua từng tiếp xúc với chương trình Illustrator cũng như các giáo viên dạy thực hành tại các trung tâm chuyên đồ họa, multimedia, mỹ thuật công nghiệp ...', N'000033.jpg', 220, 324, CAST(N'2011-09-12T00:00:00.000' AS DateTime), 709, 4, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (34, N'Cẩm Nang Tin Học Văn Phòng', 32000, N'CNTTI', 8, N'Với những tiến bộ của khoa học kỹ thuật, máy vi tính ra đời và được sử dụng trong khắp các văn phòng, công sở, gia đình... đã trở thành công cụ không thể thiếu đối với mỗi người', N'000034.jpg', 124, 253, CAST(N'2011-09-12T00:00:00.000' AS DateTime), 400, 6, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (35, N'Xử Lý Ảnh Photoshop CS5 Dành Cho Người Tự Học - Tập 1', 21000, N'CNTTI', 5, N'Bộ sách được chia làm nhiều chuyên đề đi sâu vào từng tính năng quan trọng của Photoshop. Chuyên đề đâu tiên này sẽ tập trung trình bày cách tạo vùng chọn. Đây là phần cơ bản nhưng rất quan trọng sách khi sử dụng Photoshop. ', N'000035.jpg', 124, 253, CAST(N'2011-09-12T00:00:00.000' AS DateTime), 550, 8, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (36, N'71 Kỹ Thuật Thâm Nhập Windows Vista Pro', 75000, N'CNTTI', 2, N'71 Kỹ Thuật Thâm Nhập Windows Vista Pro:', N'000036.jpg', 302, 342, CAST(N'2011-12-21T00:00:00.000' AS DateTime), 650, 6, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (37, N'Hướng Dẫn Học Từng Bước Excel 2010 Dành Cho Người Tự Học', 25000, N'CNTTI', 1, N'Nội dung sách trình bày những kiến thức không quá sâu, nhằm phục vụ cho những người mới bắt đầu làm quen với điện toán văn phòng, đồng thời là tài liệu tham khảo để giảng dạy liên quan đến chương trình Excel.', N'000037.jpg', 124, 253, CAST(N'2011-12-21T00:00:00.000' AS DateTime), 750, 74, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (38, N'SQL Server 2005 - Xây Dựng Ứng Dụng Quản Lý Kế Toán Bằng C# 2005 ', 25000, N'CNTTI', 4, N'Giáo trình bao gồm 10 chương và phần phụ lục tham khảo được nhấn mạnh xuyên suốt từ giao diện, hàm, phát biểu SQL động, phát biểu SQL phức tạp, phát biểu điều khiển, thủ tục nội tại, trigger, giúp cho bạn sử dụng chúng trong ứng dụng kế toán cùng với sự kết hợp hoàn hảo bằng ngôn ngữ lập trình C# 2005.', N'000038.jpg', 124, 253, CAST(N'2011-12-21T00:00:00.000' AS DateTime), 700, 9, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (39, N'Lập Trình Web Bằng ASP.Net Với Macromedia Dreamweaver MX - Tập 2', 50000, N'CNTTI', 5, N'ASP.NET khác biệt rất nhiều so với các công nghệ Web đi trước. Macromedia Dreamweaver MX tuy vẫn duy trì sức mạnh của công cụ thiết kế trang nhã, nhưng đã chuyển từ công nghệ cổ điển sang ASP.NET bằng cách cung cấp nhiều công cụ đơn giản bớt quá trình tự động hoá ứng dụng Web. Nhờ kết hợp sức mạnh của ASP.NET với Dreamweaver, các nhà phát triển sẽ nắm bắt được ASP.NET chỉ trong nháy mắt.', N'000039.jpg', 220, 324, CAST(N'2012-03-31T00:00:00.000' AS DateTime), 700, 1, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (40, N'Tạo Website Hướng Database Bằng PHP Và MYSQL - Tập 2', 35000, N'CNTTI', 4, N'Nội dung là yếu tố quyết định tất cả! Ừm… nghe thì hơi “kêu” thật, nhưng không thể nào đúng hơn. Chỉ cần nắm vững HTML và học thêm vài bí quyết cơ bản về JavaScript và Dynamic HTML là ta đã có thể thiết kế một Website đầy ấn tượng được rồi. Nhưng muốn thu hút một lượng fan đông đảo thì nội dung của Website phải mới mẻ và liên tục được cập nhật. Trong thiết kế Web truyền thống, nội dung được quyết định bở tập tin HTML…', N'000040.jpg', 124, 253, CAST(N'2011-12-21T00:00:00.000' AS DateTime), 700, 4, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (41, N'Tạo Bản Thuyết Trình Trong Microsoft Office PowerPoint 2007 For Windows', 23000, N'CNTTI', 2, N'Tạo bản thuyết trình trong Microsoft Office PowerPoint 2007 for Windows mang lại cho bạn phương pháp nghiên cứu công nghệ mới độc đáo nhất từ trước đến nay. Thay vì làm nản lòng độc giả bằng những giải thích dông dài mang nặng tính lý thuyết, tập sách sử dụng hình ảnh minh họa đi kèm hướng dẫn cụ thể hầu giúp bạn hoàn thành dự án chỉ trong nháy mắt', N'000041.jpg', 124, 253, CAST(N'2012-01-28T00:00:00.000' AS DateTime), 700, 9, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (42, N'Shambhala - Vùng Đất Tây Tạng Huyền Bí Hay Cuộc Hành Trình Tìm Về Bản Thể', 59000, N'PGIAO', 6, N'Tu viện Tashilumbo thuộc thành phố Phật giáo Shigatze, nằm ở miền Tây của Tây Tạng. Nơi đây, gió thường thổi xuyên qua các hành lang rải đầy đá, để lại những luồng không khí mát rượu giữa cái nóng dịu nhẹ của buổi chiều tà. Vào thời khắc này, người ta thường cảm thấy trào dâng niềm cảm xúc động khi ngắm nhìn những tia sáng chói lòa chiếu rọi qua cao nguyên Himalaya. Cảm xúc ấy càng trở nên mãnh liệt hơn khi mặt trời dần khuất bóng.Shambhala là bản kinh cổ xưa viết bằng tay, được lưu giữ tại Tu viện Tashilumbo. Kinh Shambhala miêu tả những noi như "Hồ Độc Dược", "Hồ Ác Quỷ" và cả hiện tượng quầng cực quang ở dãy núi Himalaya, khi "Một trăm ngọn núi cùng phát sáng sau khi màn đêm buông xuống". Tất cả những nơi này đều có thực. Chúng nằm ở Ngari, một vùng xa xôi hẻo lánh ở cực tây của Tây Tạng.Ở một góc độ khác, bản kinh không chỉ đơn thuần là một cuốn sách dẫn đường theo nghĩa đen nữa, nó còn có thể là một tấm bản đồ chỉ dẫn thiền định cho mỗi cá nhân trên con đường khám phá nội tâm của chính mình. Ở góc độ này, Kinh Shambhala mang ý nghĩa phức tạp hơn. Nó dạy chúng ta cách khống chế những năng lượng tiêu cực và chuyển hóa chúng thành năng lượng tiêu cực và chuyển hóa chúng thành năng lượng tích cực....', N'000042.jpg', 220, 324, CAST(N'2012-03-28T00:00:00.000' AS DateTime), 1700, 500, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (43, N'Sức Mạnh Của Đạo Phật - Để Sống Tốt Hơn Trong Thế Giới Ngày Nay', 112000, N'PGIAO', 8, N'Nói đến Đạo Phật là nói đến giác ngộ, chủ trương của Đạo Phật là giác ngộ. Đạo Phật có mặt trên thế giới đến nay là 2556 năm (tính đến thời điểm hiện tại năm 2008). 
Phật Pháp như ngọn đuốc soi sáng đưa đường chỉ lối cho chúng sinh đang chìm đắm trong bể khổ Tham, Sân, Si và kiếp Sinh-Tử luân hồi.Lý thuyết của Đạo Phật hoàn toàn khác hẳn so với những học thuyết, lý luận, của những vị học giả, những vị triết gia trên khắp Thế giới. 
Vì họ có những ý tưởng, biện luận, biện chứng, giả thuyết của họ, còn lý thuyết của đạo Phật là do đức Phật sau khi giác ngộ chánh giác thành bậc Đại Trí, Đại Hùng, Đại Lực, Đại Từ, Đại Bi… thấy những vấn đề thực tế, những lý lẽ thực tế theo từng hoàn cảnh thực tế mà Ngài đem ra chỉ dạy cho con người. Sự truyền bá của đạo Phật từ những bản Kinh chữ Phạn sau khi được du nhập, truyền bá, được phiên dịch sang ngôn ngữ của những nước được tiếp thu, tiếp nhận để thấm nhuần và phát triển theo lịch sử tôn giáo của mỗi nước, giúp chúng sinh chuyển hóa những Khổ đau thành An lạc.', N'000043.jpg', 306, 342, CAST(N'2012-03-20T00:00:00.000' AS DateTime), 2700, 79, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (44, N'Điều Trị Bệnh Tận Gốc - Năng Lực Của Tâm Bi Mẫn ', 95000, N'PGIAO', 7, N'"Điều trị bệnh tận gốc" không chỉ là một cuốn sách với những lời cầu nguyện cho bệnh tật cơ thể được giảm bớt. Nội dung của cuốn sách này còn chứa đựng nhiều hơn thế nữa. Các phần lý thuyết và thực hành chứa đựng trong sách này có tác dụng dẫn dắt tâm chúng ta đến chỗ thấu hiểu sâu xa hơn về sự sống và cái chết, về vô thường và khổ đau. Sự thấu hiểu sâu sắc như thế sẽ cho phép chúng ta bắt đầu nhìn ngắm cơn đau và bệnh tật bằng một tầm nhìn bao quát hơn. Với tầm nhìn này thì khái niệm về nghiệp quả, về tái sinh và về phẩm chất của sự tái sinh, tát cả những khái niệm đó sẽ mang những ý nghĩa mới có năng lực làm dịu cơn đau và chữa lành tận gốc các căn bệnh của chúng ta', N'000044.jpg', 403, 412, CAST(N'2012-03-25T00:00:00.000' AS DateTime), 4700, 1000, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (45, N'Nhập Môn Windows Vista Tập 1', 55000, N'CNTTI', 2, N'Nhập Môn Windows Vista - Tập 1 gồm những nôi dung sau:', N'000045.jpg', 220, 324, CAST(N'2011-12-27T00:00:00.000' AS DateTime), 700, 100, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (46, N'Hành Trình Tâm Linh Siêu Việt', 71000, N'PGIAO', 11, N'Một cuốn sách của tác giả Gyalwang Drukpa, một bậc thầy về tâm linh, người đang dẫn dắt dòng truyền thừa Drukpa, một dòng truyền thừa với những hành giả thực hành tâm linh trải khắp Ấn Độ và các nước tại Châu Á, Châu Âu và Châu Mỹ. 
Cuốn sách là những lời tự sự, những hướng dẫn, những lời khuyên chân thành của một bậc thầy trên con đường tâm linh dành cho bất cứ một ai đang mới bỡ ngỡ hay đã bước trên con đường tâm linh để tìm lại bản tâm chân thật của mình.', N'000046.jpg', 302, 342, CAST(N'2012-01-17T00:00:00.000' AS DateTime), 760, 200, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (47, N'Nghiệp Lực - Nhìn Lại Quá Khứ & Nhận Biết Tương Lai', 63000, N'PGIAO', 10, N'Nỗi hoang mang bối rối của con người về nghiệp không khiến bà ngạc nhiên. Hỏi mười người ý nghĩa của từ này, bạn sẽ nhận được mười câu trả lời khác nhau. 
"Nó là định mệnh phải không?" 
"Đó là một từ được dùng từ những năm 1960 ở Woodstock phải không?" 
"Tôi nghĩ, nghiệp có nghĩa là một việc làm sai trái của tôi." 
"Có phải nó là một chuyện gì đó tác động lên những người theo đạo Phật phải không?" 
"Ồ, vâng, nó nghĩa là số phận chứ gì!" 
Hầu hết mọi người biết Mười điều răn của Chúa, nhưng chẳng biết gì về nghiệp.', N'000047.jpg', 302, 342, CAST(N'2012-01-17T00:00:00.000' AS DateTime), 3700, 100, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (48, N'Tỉnh Thức', 32000, N'PGIAO', 2, N'"Con người còn luôn mãi khổ đau một khi chưa tỉnh thức."
Không gian nội tâm mênh mông sâu thẳm của con người luôn chứa đựng những điều diệu kỳ chưa được khám phá. Qua nghiên cứu và trải nghiệm của một nhà khoa học, Bác sĩ Prashant Kakode sẽ giúp chúng ta bước vào một cuộc hành trình nội tâm thật thú vị. Được trình bày rất khoa học, logic, 
Tỉnh Thức gồm hai phần:
Phần 1: 
Chia sẻ những trải nghiệm tâm linh theo nghiên cứu khoa học, giải phẫu tâm hồn và suy nghĩ con người để tìm ra nguồn gốc, căn nguyên của mọi đau khổ, bất an.
Phần 2: 
Câu chuyện về con đường dẫn đến sự thức tỉnh, trưởng thành nội tâm, con đường giải thoát ta khỏi những nỗi khổ đau, sự sợ hãi và bất hạnh.Lý thú, sâu sắc mà lại dễ hiểu, bạn hãy đọc câu chuyện bằng cái nhìn mới mẻ và tìm thấy ý nghĩa cho hành trình của riêng mình.', N'000048.jpg', 124, 253, CAST(N'2012-01-10T00:00:00.000' AS DateTime), 1700, 100, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (49, N'13 Nguyên Tắc Nghĩ Giàu, Làm Giàu - Think And Grow Rich', 80000, N'KINTE', 7, N'"Think and Grow Rich - 13 nguyên tắc nghĩ giàu, làm giàu" là cuốn sách "chỉ dẫn" duy nhất chỉ ra những nguồn lực bạn phải có để thành công. Cuốn sách sẽ giúp bạn trở nên giàu có, làm giàu thêm cho cuộc sống của bạn trên tất cả các phương diện của cuộc sống chứ không chỉ về tài chính và vật chất. Những ý tưởng trong sách "Think and Grow Rich - 13 nguyên tắc nghĩ giàu, làm giàu" bắt nguồn từ những động lực tốt đẹp: "Thành công cá nhân" và "Quan điểm suy nghĩ tích cực".', N'000049.jpg', 403, 412, CAST(N'2012-03-27T00:00:00.000' AS DateTime), 3700, 20, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (50, N'Đạo Kỷ Nguyên Mới', 54000, N'PGIAO', 12, N'', N'000050.jpg', 220, 324, CAST(N'2011-12-08T00:00:00.000' AS DateTime), 1700, 50, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (51, N'The Power Of Compassion - Sức mạnh của lòng từ', 25000, N'PGIAO', 12, N'Từ ngày 11 đến ngày 11 tháng 6 năm 2008 này, Đức Đạt Lai Lạt Ma sẽ viếng thăm Úc Châu, đây là chuyến thăm Úc lần thứ năm của Ngài để giảng dạy Phật Pháp. Mọi người đang trông đợi sự xuất hiện của ngài.
Năm lần viếng thăm Úc trước đây đã diễn ra vào các năm 1982, 1992, 1996, 2002, 2007 đặc biệt trong lần viếng thăm và hoằng pháp lần thứ tư năm 2002, đã có trên 110. 000 người trên khắp các thủ phủ như Melbourne, Geelong, Sydney, và Canberra đến lắng nghe ngài thuyết giảng để thay đổi và thăng hoa đời sống tâm linh của mình. 
Có thể nói Đức Đạt Lai Lạt Ma là nhà hoằng pháp vĩ đại nhất của PG trong thời hiện đại, và được xem là người có nhiều tác phẩm Phật học được người Tây Phương tiếp nhận và tìm đọc nhất. Tập sách nhỏ này được ấn hành trong mùa Phật Đản năm nay, là một món quà khiêm tốn kính dâng tặng đến Đức Đạt Lai Lạt Ma nhân chuyến viếng thăm Úc năm nay và cũng để chia sẻ bức thông điệp từ bi của Ngài đến với mọi người trong biển đời phiền lụy và khổ đau này. 
Xin chắp tay nguyện cầu cho xứ sở Tây Tạng sớm tìm lại được nền độc lập tự do, để mang lại hạnh phúc ấm no cho người dân Tây Tạng và cũng để Đức Đạt Lai Lạt Ma thứ 14 có cơ hội trở về cố hương sau nhiều thập niên sống lưu vong ở nước ngoài. 
Viết tại Tu Viện Quảng Đức, Melbourne, Australia 
Mùa Phật Đản lần thứ 2631- Đinh Hợi – 2007.
Dịch giả, 
Tỳ Kheo Thích Nguyên Tạng', N'000051.jpg', 124, 253, CAST(N'2012-03-31T00:00:00.000' AS DateTime), 7300, 2800, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (52, N'Con Đường Mây Trắng - DER WEG DER WEISSEN WOLKEN', 36000, N'PGIAO', 12, N'Trong thế kỷ hai muơi này, phương Tây có hai người tìm hiểu đất nước Tây Tạng rất sâu sắc, đó là bà Alexandra David Nesel và ông Anagarika Govinda. Cả hai vị này đã từng sống nhiều năm tại tây Tạng, từng tu tập thiền định và đi khắp nơi trong xứ sở huyền bí này hơn bất cứ người nước ngoài nào khác. Có thế nói họ hiểu tây Tạng với tất cả những khía cạnh tâm linh, tâm lý, địa lý nhiều hơn cả phần đông người tây Tạng.

Hai vị này đều đã qua đời nhưng họ đã để lại cho thế giới vô số sách vở về kinh nghiệm, suy niệm của họ tại tây Tạng ngày nay vẫn còn được đánh giá cao nhất và hậu thế có lẻ cũng sẽ khó có ai vượt qua được tầm nhìn và kinh nghiệm nội tâm của họ. Điều này thật ra không phải đáng ngạc nhiên, nếu ta biết rằng hai vị này không phải là khách hành hương bình thường, mà họ đã thực sự độc cư tu tập trên các vùng núi non hẻo lánh của Himalaya. Vì lẽ đó mà những gì họ viết ra không phải chỉ là những nhận xét bằng con mắt thường tình của một lữ khách, mà là những khám phá và sáng tạo tâm linh ở xứ sở gió tuyết này.

Trong khoảng hơn 10 cuốn sách của hai vị này để lại thì cuốn Der Weg der weissen Wolken (Con đường mây trắng) này của Govinda là nổi tiếng hơn cả. Nó là cuốn sách được nhắc nhở, được tham cứu, được tìm đọc nhiều nhất khi nói về Tây Tạng dưới ngòi bút của một người phương Tây.

Govinda người Bolivia gốc Đức, nhưng sách ông viết thường bằng Anh ngữ. Đặc biệt cuốn sách này được ông viết thành hai bản, Anh ngữ và Đức ngữ. Bản Đức ngữ là bản cuối cùng, được sửa chữa và vì thế quy mô, đầy đủ và chính xác hơn bản Anh ngữ. Ai đã từng đọc Govinda đều biết văn của ông hùng biện, súc tích, nhiều hình ảnh, nhiều tầng lớp và vì thế người dịch thường gặp nhiều khó khăn để hiểu hết ý ông.

Là một người phương Tây với tính sắc sảo của óc lý luận phân tích sẵn có, pha lẫn sự huyền bí của một quá trình chứng thực tâm linh bằng trực giác, Govinda là một con người kì lạ và điều đó phản ánh rõ nét trong cuốn sách này. Vì những lẽ đó, đọc cuốn sách này, phần nào ta cảm nhận được sự tổng hợp giữa hai cực lý luận và trực giác trong tâm thức con người phương Đông.

Nội Dung:
Phần Một : Những linh ảnh.
Phần hai: Cuộc đời hành hương.
Phần ba: Tử vong và tái sinh.
Phần bốn : Miền Nam và Trung Tây Tạng.
Phần năm: Trở lại miền Tây Tạng.', N'000052.jpg', 124, 253, CAST(N'2012-03-31T00:00:00.000' AS DateTime), 7500, 100, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (53, N'Đức Đạt Lai Lạt Ma Tại Harvard', 84000, N'PGIAO', 13, N'Đức Đạt lai Lạt ma tại Harvard là một loạt bài thuyết giảng tại Đại Học Harvard do Viện nghiên cứu Phật học Hoa Kỳ (AIRS) và Trung tâm nghiên cứu các tôn giáo bảo trợ. Các bài thuyết giảng của Đức Đạt-lai-Lạt-ma, chủ yếu do giáo sư Robert Thurman sắp xếp, đã được thực hiện tại Giảng đường Emerson trong khuôn viên của Havard.', N'000053.jpg', 304, 396, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 6400, 200, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (54, N'Những Con Đường Của Ánh Sáng - Tập 1', 160000, N'KHVLY', 1, N'Những Con Đường Của Ánh Sáng - Tập 1: Vật Lý Siêu Hình Học Của Ánh Sáng Và Bóng Tối (Tái Bản)

Trong cuốn sách này, Trịnh Xuân Thuận đã thảo luận về ánh sáng, và liên quan tới nó là bóng tối, trên nhiều phương diện, bao gồm tầm quan trọng của nó đối với sự sống, đối với khoa học, sự diễn giải ánh sáng của bộ não, nghệ thuật của các hoạ sĩ thuộc trường phái ấn tượng, việc sử dụng ánh sáng trong kiến trúc và các khía cạnh tâm linh của ánh sáng,... Cuốn sách này cũng là bản sử thi về cuộc hành trình của con người đi vào vương quốc của ánh sáng và giải mã những bí mật của nó.', N'000054.jpg', 328, 462, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 1290, 200, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (55, N'Những Con Đường Của Ánh Sáng - Tập 2', 90000, N'KHVLY', 1, N'Những con đường của ánh sáng được coi là bản sử thi về cuộc hành trình của con người đi vào vương quốc ánh sáng và giải mã những bí mật của nó. Và trong cuốn sách này tác giả đã thảo luận về ánh sáng, và liên qua tới nó là bóng tối, trên nhiều phương diện bao gồm tầm quan trọng của nó đối với sự sống, đối với khoa học, sự diễn giải ánh sáng của bộ não, nghệ thuật của các họa sĩ thuộc trường phái ấn tượng, việc sử dụng ánh sáng trong kiến trúc và các khía cạnh tâm linh của ánh sáng....

Mời bạn đón đọc.', N'000055.jpg', 304, 660, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 3190, 200, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (56, N'Cái Vô Hạn Trong Lòng Bàn Tay (Từ Big Bang Đến Giác Ngộ)', 95000, N'PGIAO', 1, N'Cái Vô Hạn Trong Lòng Bàn Tay (Từ Big Bang Đến Giác Ngộ):

Cuốn sách Cái Vô Hạn Trong Lòng Bàn Tay (Từ Big Bang Đến Giác Ngộ) được dịch từ L INFINI DANS LA PAUME DE LA MAIN Du Big Bang à LÉveil. 

Sách đề cập đến cuộc đời của hai con người: Một là nhà vật lý thiên văn vốn là Phật tử, người mong muốn đem những hiểu biết khoa học của bản thân đối chiếu với những nguồn gốc triết học về sự sống theo quan niệm nhà Phật. Một người là nhà khoa học phương Tây trở thành nhà sư, người mà những kinh nghiệm cá nhân đã kích thích ông so sánh hai con đường nhận thức hiện thực khách quan đó.

Họ nói chuyện với nhau không theo kiểu tranh luận mà cùng bổ khuyết cho nhau để xây dựng một cái nhìn nhân văn về khoa học tự nhiên, mượn tinh thần đạo Phật để hạn chế cái ác của nền khoa học kỹ thuật đang phát triển đến tột bậc, có nguy cơ hủy diệt cả cuộc sống và nền văn minh con người.

Mời bạn đón đọc.', N'000056.jpg', 480, 460, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 3210, 1200, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (57, N'Nghệ Thuật Thiền Định', 50000, N'PGIAO', 14, N'Nếu như học thiền là một con đường mà các bậc cao minh nhất đã theo đuổi trong suốt cuộc đời thì thực hành thiền trong cuộc sống hằng ngày sẽ làm thay đổi cách nhìn của chúng ta về chính bản thân mình và thế giới. Đó là thông điệp mà cuốn sách Nghệ thuật thiền định muốn gửi đến chúng ta. Cuốn sách vừa như người dẵn dắt cụ thể cho chúng ta cách thực hành thiền.

Mang trong mình hai nền văn hóa, bản thân lại có kinh nghiệm của người tu sĩ, hiểu biết những kinh sách thiên liêng, được tiếp xúc thường xuyên với các vị thầy, Matthieu Ricard cho chúng ta thấy đặc tính chung của một môn phái thiền xây dựng trên nền tảng là tình thương yêu đồng loại, sự cảm thông và phát triển các phẩm chất của con người. Ông cũng hé lộ cho ta thấy những phúc lạc đường trong một xã hội hiện tại vốn mang đậm tính cá nhân và vật chất, giúp chúng ta khám phá và vun trồng những khát vọng sâu xa nhất của bản thân.', N'000057.jpg', 184, 176, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 4300, 200, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (58, N'Bàn Về Hạnh Phúc', 69000, N'PGIAO', 14, N'Tất cả chúng ta đều khát khao hạnh phúc, song làm cách nào để có được, giữ gìn nó và thậm chí để định nghĩa nó? Trước câu hỏi mang đầy tính triết lý đang bị giằng xé giữa chủ nghĩa bi quan và thái độ giễu cợt trong tư tưởng phương Tây này, Matthieu Ricard đã mang lại lời giải đáp của đạo Phật: một câu trả lời rất khắt khe, song làm chúng ta yên lòng, lạc quan và ai cũng có thể chấp nhận được.

Thôi tìm hạnh phúc bằng mọi giá ở bên ngoài mình, học cách nhìn vào bên trong nhưng tự ngắm mình ít hơn một chút, làm quen với một cách tiếp cận thế giới vừa sâu sắc hơn, vừa vị tha hơn...

Với một tâm hồn phong phú bởi hai nền văn hóa,với những cuộc gặp gỡ với những nhà minh triết lớn, với sự hiểu biết kinh sách linh thiêng cũng như nỗi thống khổ của con người, Mathieu Ricard - nhà tu hành Phật giáo được nhiều người biết đến nhất và nổi tiếng nhất về đạo Phật tại Pháp - chia sẻ với chúng ta trong cuốn sách này những suy ngẫm say mê về con đường tìm kiếm chân hạnh phúc và những phương pháp để đạt được nó.', N'000058.jpg', 412, 440, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 4124, 700, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (59, N'Lượng tử hoa và sen', 75000, N'PGIAO', 15, N'Lưỡng Tử và Hoa Sen là sự khai phá mở rộng tri thức, tầm nhìn về những tương đương thú vị giữa tư tưởng sắc sảo về vật lý học và Phật giáo - một cuộc trò chuyện mà bất kỳ ai có suy nghĩ đều thích thú dù chỉ tình cờ nghe thấy.
DANIEL GOLEMAN
Lưỡng Tử và Hoa Sen là kết quả phong phú và gợi mở của cuộc trao đổi hết sức thú vị giữa khoa học phương Tây và triết học Phật giáo. Cuốn sách độc đáo này sẽ góp phần lớn để chúng ta hiểu thêm về thực chất của thế giới và cách chúng ta sống cuộc đời của chúng ta.
sự thánh thiện DALAI LAMA.
Quyển sách này bao gồm nội dung chính sau:
- Đến bước ngoặt
- Hiện hữu và không hiện hữu
- Đi tìm tay chế tạo đồng hồ vĩ đại
- Vũ trụ trong hạt cát
- Những ảo ảnh của thực tại
- Như tiếng sét ngang tai
- Từng cái đối với thực tại riêng
- Những vấn nạn về thời gian
- Hỗn mang và hài hoà
- Biên giới ảo
- Người máy có thể nghĩ những gì chúng ta nghĩ?
- Ngữ pháp của vũ trụ
- Lý lẽ và trầm tư
- Vẻ đẹp dưới mắt khán giả
- Từ trầm tư tới hành động
- Kết luận của nhà sư
- Kết luận của nhà khoa học
+ Bảng thuật ngữ khoa học
+ Bảng thuật ngữ nhà Phật.', N'000059.jpg', 384, 780, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 3290, 600, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (60, N'Đối Thoại Giữa Triết Học Và Phật Giáo', 43000, N'PGIAO', 15, N'Dựa theo quan niệm cũ kỹ lâu đời, phương Tây hình dung Phật giáo như là một sự minh triết nhưng thụ động và tiêu cực, và xem Niết Bàn như là một sự quay về sống với nội tâm, không màng đến thế sự bên ngoài, kể cả sinh hoạt trong các thành phố.

Quyển sách này đem lại cho độc giả cái nhìn mới của Tây phương đối với Phật giáo trước đây vốn hoàn toàn xa lạ và hiện nay đang rất thịnh hành ở châu Âu và châu Mỹ.', N'000060.jpg', 330, 360, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 2267, 500, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (61, N'Phật giáo truyền thống Đại Thừa', 65000, N'PGIAO', 12, N'... Cái tâm cảm thấy mình gần gũi với tất cả mọi chúng sinh như thế chính là tâm từ vô thượng. Một người có được tình yêu này đối với tất cả hữu tình không phân biệt, thì không phải là một người thường. Chắc chắn một con người như vậy đang nắm giữ những thực chứng nội tâm trong tâm thức họ. Khi một người nào có được thứ tình yêu này gặp hoặc nhìn thấy người khác, thì một cảm giác hạnh phúc hồn nhiên sinh khởi. Một người như thế không bao giờ sinh tâm giận dữ hay ganh tị, và do hậu quả của điều này, mọi người sẽ trở thành bạn của vị ấy, có niềm kính trọng lớn lao đối với vị ấy. Một người thực tập tâm từ thuần tịnh thì kết quả cũng sẽ có nội tâm rất an bình', N'000061.jpg', 292, 286, CAST(N'2012-11-17T10:22:01.000' AS DateTime), 1497, 400, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (62, N'Tình Yêu Phổ Quát', 55000, N'PGIAO', 12, N'...Tất cả chúng sinh đều có hạt giống Phật hay Phật tính. Phương pháp khiến cho hạt giống này nảy nở chính là thực hành những chỉ giáo về pháp luyện tâm. Những kinh nghiệm hay thực chứng trong pháp luyện tâm chính là con đường đến giác ngộ, bởi thế điểm thiết yếu là tất cả chúng sinh cần đạt được kinh nghiệm về pháp tu này. Kết thúc kinh Tiểu phẩm Bát-nhã, đức Phật đã dạy:

"Ta đã giải thích những con đường đến giác ngộ để mọi chúng sinh đều có thể đạt đến."', N'000062.jpg', 228, 220, CAST(N'2012-11-17T10:22:00.000' AS DateTime), 1385, 600, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (63, N'Rộng Mở Tâm Hồn - Tu Tập Từ Bi Trong Đời Sống Hàng Ngày', 69000, N'PGIAO', 12, N'Rộng Mở Tâm Hồn - Tu Tập Từ Bi Trong Đời Sống Hàng Ngày

Trong đạo Phật, lòng bi mẫn được định nghĩa như là tâm nguyện cứu giúp tất cả chúng sinh thoát khỏi khổ đau. Thật không may là chúng ta không thể diệt trừ hết khổ đau trong thế giới này. Chúng ta không thể riêng một mình làm điều đó, và không có bất kỳ phép lạ thần kỳ nào để tự nhiên chuyển hóa phiền não khổ đau thành hạnh phúc an lạc. Dù vậy, chúng ta có thể phát triển tâm thức của chính mình bằng giới hạnh và qua đó giúp đỡ những người khác cũng làm giống như ta.

Cuốn sách Rộng Mở Tâm Hồn - Tu Tập Từ Bi Trong Đời Sống Hàng Ngày là bài thuyết pháp và là lời cầu nguyện của đức Đạt lai Lạt Ma chia sẻ phương thức của Ngài, trong việc chuyển hóa tính cao ngạo thành đức khiêm tốn và sự sân hận thành lòng yêu thương. Ngài bày tỏ mối quan tâm đối với khoảng cách phân chia giữa người giàu và người nghèo. Và ngài kết thúc bằng việc hướng dẫn một khóa cầu nguyện cho tất cả chúng sinh đều được hạnh phúc. Bản ghi lại buổi nói chuyện của Ngài tại Central Park được trình bày ngay sau đây trong phần Dẫn nhập.

Hy vọng cuốn sách này sẽ hữu ích cho tất cả người đọc trong việc tìm cầu hạnh phúc, và hạnh phúc mà họ đạt được sẽ tiếp tục lan truyền sang nhiều người khác nữa, sao cho tâm hồn của tất cả chúng sinh, theo một cách nào đó, đều sẽ được rộng mở.

Mục lục:

Dẫn nhập

Chương 1. Khát khao niềm hạnh phúc

Chương 2. Thiền tập - bước khởi đầu

Chương 3. Thế giới vật chất và phi vật chất

Chương 4. Nghiệp quả

Chương 5. Phiền não

Chương 6. Rộng lớn và sâu sắc: Hai khía cạnh

Chương 7. Lòng bí ẩn

...', N'000063.jpg', 344, 396, CAST(N'2012-11-17T10:32:39.000' AS DateTime), 2457, 500, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (64, N'Cuộc Đời Là Vô Thường', 47000, N'PGIAO', 12, N'Cuộc Đời Là Vô Thường

Khi nghe đến hai chữ vô thường, nói chung người ta thường cho đó là lời ta thán về sự phù du mỏng manh của kiếp người. Hơn nữa, đời người là thứ quá bấp bênh, sống chết không kiểm soát được cho nên vô thường cũng gắn liền với chềt chóc. Nhưng thật sự có phải vô thường mang hình ảnh ảm đạm như vậy không?

Nguyên ngữ Sanskrit của vô thường là anitya. Trong đó nitya là một tính từ mang nghĩa vĩnh cửu, hằng cửu, bất biến, còn a- là tiếp đầu từ mang nghĩa phủ định cho nên anitya sẽ là không hằng thường, không vĩnh viễn, nhất thời.

Có ba slogan làm nền tảng cho Phật giáo gọi là Tam pháp ấn. Chư hành vô thường là một trong ba slogan đó. Những thứ có sự sống ở thế gian này, và ngay cả cái thế giới mà chúng trú ngụ, tất cả đều biến dịch theo dòng chảy thời gian. Không hề tồn tại bất cứ một thực thể cố định nào có thể siêu việt khỏi hiện tượng biến hóa. Nắm bắt hiện thực như vậy chính là xuất phát điểm của Phật giáo.

Chúng ta có thói quen ngắm nhìn sự vật ngoại giới như là những thứ cố định. Tuy nhiên trên thực tế lại không có thứ gì vĩnh viễn bất biến. Chư hành vô thường của Phật giáo chỉ trình bày lại y nguyên sự thật vạn vật biến hóa, chứ không đưa ra một tư tưởng khó hiểu nào cả, và cũng không nhìn phù du đời người một cách bi quan. Ý nghĩa của Chư hành vô thường đó là nắm bắt chính xác sự thật cái gì đã có sinh ắt có diệt, tất cả đều biến hóa không ngừng, hơn nữa tìm thấy ở sinh mệnh hữu hạn một giá trị vô hạn.

Chính vì vô thường cho nên con người mới nỗ lực, mới tìm ra cái khả năng biến hóa hướng thượng. Chính vì mọi thứ biến hóa từng khắc cho nên không thể xao nhãng phút giây nào. Vô thường trình bày nhân sinh quan nền tảng của Phật giáo mà cũng là trụ cột chống đỡ cho chủ nghĩa nỗ lực của Phật giáo. Cuốn sách mỏng này chỉ mong làm sáng tỏ trong khả năng giới hạn một chân lý muôn đời ấy là vô thường mà thôi.', N'000064.jpg', 200, 245, CAST(N'2012-11-17T10:40:06.000' AS DateTime), 1578, 300, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (65, N'GIẢI THÍCH NGỮ PHÁP TIẾNG ANH (BÀI TẬP & ĐÁP ÁN) - TÁI BẢN 2018', 72600, N'NGNGU', 16, N'GIẢI THÍCH NGỮ PHÁP TIẾNG ANH gồm 9 chương, trình bày những chủ điểm ngữ pháp tiếng Anh từ cơ bản đến nâng cao, phù hợp với mọi trình độ. Các chủ điểm ngữ pháp trong từng chương được biên soạn chi tiết, giải thích cặn kẽ các cách dùng và quy luật mà người học cần nắm vững. Sau mỗi chủ điểm ngữ pháp là phần bài tập đa dạng nhằm giúp người học củng cố phần lý thuyết.', N'65.jpg', 536, 550, CAST(N'2019-04-14T11:50:00.000' AS DateTime), 1500, 2000, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (66, N'BÀI TẬP TRẮC NGHIỆM TIẾNG ANH - LỚP 7 - CÓ ĐÁP ÁN (MAI LAN HƯƠNG - 2017)', 22000, N'NGNGU', 16, N'Bài Tập Trắc Nghiệm Tiếng Anh - Lớp 7 - Có Đáp Án (Mai Lan Hương - 2017)  Bài Tập Trắc Nghiệm Tiếng Anh Lớp 7 (Có Đáp Án) được soạn theo từng đơn vị bài học (Unit) của sách giáo khoa Tiếng Anh 7. Mỗi Unit được soạn thành 3 Test gồm 25 đến 30 câu. Sau mỗi cụm bài tập có bài tự kiểm tra (Test Yourself) và sau Unit 8 và Unit 16 là 2 bài kiểm tra học kì gồm 35 câu, nhằm giúp các em ôn luyện và củng cố kiến thức đã học.  Các đề trắc nghiệm thường có số lượng bài tập nhiều, thời gian dành cho mỗi câu rất ngắn, nên học sinh cần nắm vững bài học và phương pháp làm bài trắc nghiệm thì mới đạt kết quả tốt.', N'66.jpg', 64, 150, CAST(N'2019-04-15T10:52:00.000' AS DateTime), 200, 150, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (67, N'NGỮ PHÁP TIẾNG ANH (TÁI BẢN 2018)', 70000, N'NGNGU', 16, N'Cuốn NGỮ PHÁP TIẾNG ANH tổng hợp các chủ điểm ngữ pháp trọng yếu mà các em học sinh cần nắm vững. Các chủ điểm ngữ pháp được trình bày rõ ràng, chi tiết. Sau mỗi chủ điểm ngữ pháp là phần bài tập nhằm giúp các em củng cố kiến thức đã học.', N'67.jpg', 279, 300, CAST(N'2019-04-20T21:24:00.000' AS DateTime), 100, 2000, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (68, N'BÀI TẬP TRẮC NGHIỆM TIẾNG ANH LỚP 9 MAI LAN HƯƠNG', 38000, N'NGNGU', 16, N'Bài Tập Trắc Nghiệm Tiếng Anh Lớp 9 Mai Lan Hương gồm 2 phần :  Phần 1: Được soạn theo từng đơn vị bài học (Unit) của sách giáo khoa Tiếng Anh 9. Mỗi Unit được soạn thành 4 Test, từ dễ đến khó. Mỗi Test từ 50 câu, chia làm 6 phần:   1. Pronounciation  2. Stress  3. Complete Sentences  4. Indentify Errors  5. Cloze  6.Reading Comprehension  Phần 2: Gồm 10 bài kiểm tra nâng cao ( Test Yourself)  -Sản phẩm không được tặng kèm bọc plastic. Mong quý khách hàng lưu ý', N'68.jpg', 0, 140, CAST(N'2019-04-20T21:28:00.000' AS DateTime), 150, 2000, 0)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (69, N'sadasdsadsa', 12321321, N'AMNHA', 1, N'dsfdsfdsfsdfds', NULL, 2321, 21312, CAST(N'2019-10-28T20:21:23.483' AS DateTime), 21321, 21321, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (70, N'kg', 65451, N'AMNHA', 1, N'dsfsdcdsxzv', NULL, 651, 5412, CAST(N'2019-10-29T00:53:27.670' AS DateTime), 145, 20, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (71, N'Phat', 52000, N'AMNHA', 1, N'Tan Phat', NULL, 512, 846512, CAST(N'2019-10-30T20:51:24.670' AS DateTime), 64512, 45, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (72, N'ABCH', 251, N'AMNHA', 1, N'7dfewfdzx', NULL, 541, 841, CAST(N'2019-10-31T11:42:00.880' AS DateTime), -1, 42, 1)
INSERT [dbo].[Sach] ([SachID], [TenSach], [GiaBan], [MaChuDe], [NhaXuatBanID], [MoTa], [HinhBia], [SoTrang], [TrongLuong], [NgayCapNhat], [SoLanXem], [SoLuongBan], [HetHang]) VALUES (1073, N'ÁDFGHJKL', 526512, N'MYTHU', 12, N'jgsdfiywqkfj,qeigdewfrgd', NULL, 984, 52, CAST(N'2019-12-24T20:28:50.000' AS DateTime), 5412, 84512, 1)
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (1, N'Tenzin Gyatso - Đức Đạt Lai Lạt Ma 14', N'', N'', N'"Tenzin Gyatso, nói đủ là Jetsun Jamphel Ngawang Lobsang Yeshe Tenzin Gyatso, là pháp hiệu của Đức Đạt Lai Lạt Ma thứ 14 là vị đạo sư lãnh đạo tinh thần của người dân Tây Tạng và nhiều đạo tràng Phật Giáo trên thế giới. Đức Đạt Lai Lạt Ma là tước hiệu của vua Mông Cổ Altan Khan ban cho Lạt ma Sonam Gyatso vào năm 1578. Từ đó, “Đức Đạt Lai Lạt Ma” trở thành danh xưng cho vị Lạt ma cao nhất trong truyền thống Phật giáo Gelug (Mũ Vàng). Đạt Lai Lạt Ma (Dalai Lama) nghĩa là ""Người bảo vệ đức tin"" (Defender of the Faith), ""Biển lớn của trí tuệ"" (Ocean of Wisdom), ""Vua của Chánh Pháp"" (King of Dharma), “Viên bảo châu như ý” (Wishfulfilling Gem), “Hoa sen trắng” (White lotus) và Hóa thân Quan Âm (Kuan Yin Boddhisattva).')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (2, N'Trịnh Xuân Thuận', N'', N'', N'"Trịnh Xuân Thuận (1948- ) là một khoa học gia người Mỹ gốc Việt trong lĩnh vực vật lý thiên văn, là một nhà văn đã viết nhiều quyển sách có giá trị cao về vũ trụ học và về những suy nghĩ của ông trong tương quan giữa khoa học và Phật giáo. Ông còn là một nhà thơ, một triết gia, một Phật tử và một nhà hoạt động cho môi trường và hòa bình. Ông đã nhận lãnh nhiều giải thưởng trong lĩnh vực thiên văn và trong lĩnh vực văn hoá xã hội.')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (3, N'Vật lý ,Thiên văn học', NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (4, N'Matthieu Ricard', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (5, N'Kyabje Khamtrul Rinpoche', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (6, N'Đức Pháp Vương GYALWANG DRUKPA XII', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (7, N'Nguyên Phong', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (8, N'Lama Zopa Rinpoche', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (9, N'Lama Anagarika Govinda', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (10, N'Ni sư Thích Nữ Trí Hải', N'', N'', N'"Phó viện trưởng viện Nghiên cứu Phật học Việt Nam')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (11, N'Ngọc Bích', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (12, N'Quỳnh Nga', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (13, N'Edward Peppitt', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (14, N'Nhân Văn', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (15, N'Blair T.Spalding', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (16, N'FPT Polytechnic', N'179 Chánh Hưng F.4 Q.8 Tp.HCM', N'8504122', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (17, N'Upasika Kee Nanayon', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (18, N'Inamori Kazuo', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (19, N'Robin Lewis', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (20, N'Michael Dart', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (21, N'Mary T.Browne', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (22, N'Minh Đức', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (23, N'John C.Maxwell', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (24, N'Dr. Lin Lougheed, Ed.D', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (25, N'Đổ Thái Hòa', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (26, N'Barbara Bazaldua', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (27, N'Th.S Nguyễn Nam Thuận', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (28, N'Lê Thuận', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (29, N'Trần Tuấn Mẫn', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (30, N'Dr. Prashant Kakode', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (31, N'John Blofeld', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (32, N'Nguyễn Bá Tiến', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (33, N'Vô Úy', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (34, N'Quang Hiển', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (35, N'Tường Thụy', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (36, N'Huyền Cơ', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (37, N'Phương Thảo', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (38, N'Tony Buzan', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (39, N'Dale Carnegie ', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (40, N'Stephen P. Robbins .Timothy A. Judge', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (41, N'Vương Chí Cương', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (42, N'James Chen. Lê Đạt Chí', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (43, N'Th.S Nguyễn Công Minh', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (44, N'TS. Phạm Thế Quế', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (45, N'Phạm Quang Hiển', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (46, N'Phạm Hữu Khang', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (47, N'Laurence J. Brahm', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (48, N'Nguyễn Tường Bách', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (49, N'Thích Nguyên Tạng', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (50, N'Thanh Tâm', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (51, N'Trần Hà', N'197 Trần Hưng Đạo', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (52, N'Phan Lê Nhật Hý', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (53, N'Quang Huy', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (54, N'Geshe Kelsang Gyatso', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (55, N'Nguyễn Minh Tiến', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (56, N'Ngọc Cầm', N'', N'', N'')
INSERT [dbo].[TacGia] ([TacGiaID], [TenTacGia], [DiaChi], [DienThoai], [TieuSu]) VALUES (60, N'uyên', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TacGia] OFF
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (1, 33, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (1, 34, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (2, 51, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (3, 50, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (4, 38, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (5, 31, N'Chủ biên', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (5, 50, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (6, 26, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (7, 27, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (7, 49, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (7, 52, N'Tác giả', 3)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (8, 49, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (9, 10, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (9, 11, N'Tác giả', 3)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (9, 34, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (10, 10, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (10, 11, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (10, 34, N'Tác giả', 3)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (11, 4, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (11, 32, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (12, 12, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (12, 13, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (13, 6, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (13, 30, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (14, 6, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (14, 14, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (15, 37, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (16, 16, N'Chủ biên', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (17, 17, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (18, 18, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (18, 19, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (19, 25, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (20, 15, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (20, 39, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (21, 22, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (22, 23, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (23, 24, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (24, 40, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (25, 41, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (26, 25, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (27, 25, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (28, 42, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (29, 43, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (30, 44, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (31, 49, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (31, 52, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (32, 27, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (32, 49, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (32, 52, N'Tác giả', 3)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (33, 27, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (33, 49, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (33, 52, N'Tác giả', 3)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (34, 27, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (34, 49, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (34, 52, N'Tác giả', 3)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (35, 27, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (35, 49, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (35, 52, N'Tác giả', 3)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (36, 26, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (37, 26, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (38, 45, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (39, 10, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (39, 34, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (40, 26, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (41, 26, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (42, 46, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (43, 1, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (44, 7, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (45, 46, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (46, 5, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (46, 21, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (47, 20, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (47, 21, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (48, 29, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (49, 35, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (49, 36, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (50, 1, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (51, 1, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (51, 48, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (52, 8, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (52, 47, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (53, 1, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (53, 28, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (54, 2, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (55, 2, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (56, 2, N'Tác giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (56, 3, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (57, 3, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (58, 3, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (59, 3, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (60, 3, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (61, 9, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (61, 53, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (62, 9, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (62, 53, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (63, 1, N'Tác giả', 1)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (63, 54, N'Dịch giả', 2)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (63, 55, N'Dịch giả', 3)
INSERT [dbo].[ThamGia] ([SachID], [TacGiaID], [VaiTro], [ViTri]) VALUES (64, 35, N'Tác giả', 1)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [TaiKhoan], [MatKhau], [TrangThai], [RoleID], [Email]) VALUES (3, N'danh', N'123456', 0, 2, N'danh@gmail.com')
INSERT [dbo].[User] ([UserID], [TaiKhoan], [MatKhau], [TrangThai], [RoleID], [Email]) VALUES (4, N'nhanvien', N'123456', 0, 3, N'nhanvien@gmail.com')
INSERT [dbo].[User] ([UserID], [TaiKhoan], [MatKhau], [TrangThai], [RoleID], [Email]) VALUES (5, N'irvin', N'123456', 0, 2, N'irvin@gmail.com')
INSERT [dbo].[User] ([UserID], [TaiKhoan], [MatKhau], [TrangThai], [RoleID], [Email]) VALUES (6, N'admin', N'123456', 0, 1, N'admin@gmail.com')
INSERT [dbo].[User] ([UserID], [TaiKhoan], [MatKhau], [TrangThai], [RoleID], [Email]) VALUES (7, N'phat', N'123456', 0, 1, N'phat@gmail.com')
INSERT [dbo].[User] ([UserID], [TaiKhoan], [MatKhau], [TrangThai], [RoleID], [Email]) VALUES (8, N'khang', N'123456', 0, 3, N'khang@gmail.com')
INSERT [dbo].[User] ([UserID], [TaiKhoan], [MatKhau], [TrangThai], [RoleID], [Email]) VALUES (9, N'abc', N'1254', 0, 1, N'abc@gmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserKH] ON 

INSERT [dbo].[UserKH] ([ID], [TaiKhoan], [PassWord], [ConfirmPassword], [Ten], [DiaChi], [Email], [DienThoai], [TinhThanh], [QuanHuyen], [NgayTao], [NgayCapNhat], [TrangThai], [Hinh]) VALUES (4, N'irvin', N'123', N'123', N'Irvin', N'ABC', N'abc@gmail.com', N'8465213', NULL, NULL, CAST(N'2019-11-04T18:40:42.403' AS DateTime), NULL, 1, N'phat.jpg')
INSERT [dbo].[UserKH] ([ID], [TaiKhoan], [PassWord], [ConfirmPassword], [Ten], [DiaChi], [Email], [DienThoai], [TinhThanh], [QuanHuyen], [NgayTao], [NgayCapNhat], [TrangThai], [Hinh]) VALUES (5, N'admin', N'123', N'123', N'Admin', N'ANHDSXA', N'annhds@gmail.com', N'1741874', N'815', N'81523', CAST(N'2019-11-04T18:45:05.597' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[UserKH] ([ID], [TaiKhoan], [PassWord], [ConfirmPassword], [Ten], [DiaChi], [Email], [DienThoai], [TinhThanh], [QuanHuyen], [NgayTao], [NgayCapNhat], [TrangThai], [Hinh]) VALUES (6, N'phat', N'123', N'123', N'ddf', N'dfghDSFGH', N'sdfbvn', N'98651', N'715', N'71511', CAST(N'2019-11-04T18:47:48.223' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[UserKH] ([ID], [TaiKhoan], [PassWord], [ConfirmPassword], [Ten], [DiaChi], [Email], [DienThoai], [TinhThanh], [QuanHuyen], [NgayTao], [NgayCapNhat], [TrangThai], [Hinh]) VALUES (7, N'phat12', N'123', N'123', N'wdesf', N'defgb', N'65123dsfvb', N'w8qd4s15', N'811', N'81103', CAST(N'2019-11-05T00:29:29.990' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[UserKH] ([ID], [TaiKhoan], [PassWord], [ConfirmPassword], [Ten], [DiaChi], [Email], [DienThoai], [TinhThanh], [QuanHuyen], [NgayTao], [NgayCapNhat], [TrangThai], [Hinh]) VALUES (8, N'danh', N'123', N'123', N'Danh', N'123456ABC', N'danh@gmail.com', N'123456', N'701', N'70121', CAST(N'2019-11-18T23:42:50.363' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[UserKH] ([ID], [TaiKhoan], [PassWord], [ConfirmPassword], [Ten], [DiaChi], [Email], [DienThoai], [TinhThanh], [QuanHuyen], [NgayTao], [NgayCapNhat], [TrangThai], [Hinh]) VALUES (1008, N'danh12', N'123456', N'123456', N'Danh Trần', N'dfs7v64', N'ewdjghj@gmail.com', N'2158465123', N'811', N'81109', CAST(N'2019-11-21T10:58:57.037' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[UserKH] ([ID], [TaiKhoan], [PassWord], [ConfirmPassword], [Ten], [DiaChi], [Email], [DienThoai], [TinhThanh], [QuanHuyen], [NgayTao], [NgayCapNhat], [TrangThai], [Hinh]) VALUES (1009, N'khachhang', N'123', N'123', N'Khach Hang', N'weg', N'dwfgb@gmail.com', N'8787', NULL, NULL, CAST(N'2019-12-24T20:22:21.563' AS DateTime), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[UserKH] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleID], [TenRole]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([RoleID], [TenRole]) VALUES (2, N'Manager')
INSERT [dbo].[UserRole] ([RoleID], [TenRole]) VALUES (3, N'Staff')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_NgayDatHang]  DEFAULT (getdate()) FOR [NgayDatHang]
GO
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_TriGia]  DEFAULT ((0)) FOR [TriGia]
GO
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_DaGiao]  DEFAULT ((0)) FOR [DaGiao]
GO
ALTER TABLE [dbo].[DatHangCT] ADD  CONSTRAINT [DF_DatHangCT_SoLuong]  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[DatHangCT] ADD  CONSTRAINT [DF_DatHangCT_DonGia]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[DatHangCT] ADD  CONSTRAINT [DF_DatHangCT_ThanhTien]  DEFAULT ((0)) FOR [ThanhTien]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_GiaBan]  DEFAULT ((0)) FOR [GiaBan]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_SoTrang]  DEFAULT ((0)) FOR [SoTrang]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_TrongLuong]  DEFAULT ((0)) FOR [TrongLuong]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_NgayCapNhat]  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_SoLanXem]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_SoLuongBan]  DEFAULT ((0)) FOR [SoLuongBan]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_HetHang]  DEFAULT ((0)) FOR [HetHang]
GO
ALTER TABLE [dbo].[ThamGia] ADD  CONSTRAINT [DF_ThamGia_ViTri]  DEFAULT ((1)) FOR [ViTri]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Sach] FOREIGN KEY([SachID])
REFERENCES [dbo].[Sach] ([SachID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Sach]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_UserKH] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserKH] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_UserKH]
GO
ALTER TABLE [dbo].[DatHangCT]  WITH CHECK ADD  CONSTRAINT [FK_DatHangCT_DatHang] FOREIGN KEY([DatHangID])
REFERENCES [dbo].[DatHang] ([DatHangID])
GO
ALTER TABLE [dbo].[DatHangCT] CHECK CONSTRAINT [FK_DatHangCT_DatHang]
GO
ALTER TABLE [dbo].[DatHangCT]  WITH CHECK ADD  CONSTRAINT [FK_DatHangCT_Sach] FOREIGN KEY([SachID])
REFERENCES [dbo].[Sach] ([SachID])
GO
ALTER TABLE [dbo].[DatHangCT] CHECK CONSTRAINT [FK_DatHangCT_Sach]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_MenuType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[MenuType] ([ID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_MenuType]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_ChuDe] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDe] ([MaChuDe])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_ChuDe]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([NhaXuatBanID])
REFERENCES [dbo].[NhaXuatBan] ([NhaXuatBanID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
ALTER TABLE [dbo].[ThamGia]  WITH CHECK ADD  CONSTRAINT [FK_ThamGia_Sach] FOREIGN KEY([SachID])
REFERENCES [dbo].[Sach] ([SachID])
GO
ALTER TABLE [dbo].[ThamGia] CHECK CONSTRAINT [FK_ThamGia_Sach]
GO
ALTER TABLE [dbo].[ThamGia]  WITH CHECK ADD  CONSTRAINT [FK_ThamGia_TacGia] FOREIGN KEY([TacGiaID])
REFERENCES [dbo].[TacGia] ([TacGiaID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ThamGia] CHECK CONSTRAINT [FK_ThamGia_TacGia]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thứ tự hiển thị trên giao diện' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThamGia', @level2type=N'COLUMN',@level2name=N'ViTri'
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
