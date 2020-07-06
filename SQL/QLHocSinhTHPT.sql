USE [master]
GO
/****** Object:  Database [QLHocSinhTHPT]    Script Date: 06/07/2020 4:27:38 PM ******/
CREATE DATABASE [QLHocSinhTHPT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLHocSinhTHPT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLHocSinhTHPT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLHocSinhTHPT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLHocSinhTHPT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLHocSinhTHPT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLHocSinhTHPT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLHocSinhTHPT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLHocSinhTHPT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLHocSinhTHPT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLHocSinhTHPT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLHocSinhTHPT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET RECOVERY FULL 
GO
ALTER DATABASE [QLHocSinhTHPT] SET  MULTI_USER 
GO
ALTER DATABASE [QLHocSinhTHPT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLHocSinhTHPT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLHocSinhTHPT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLHocSinhTHPT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLHocSinhTHPT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLHocSinhTHPT', N'ON'
GO
ALTER DATABASE [QLHocSinhTHPT] SET QUERY_STORE = OFF
GO
USE [QLHocSinhTHPT]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaHocSinh]    Script Date: 06/07/2020 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MaHocSinh]()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaHocSinh) FROM HOCSINH) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaHocSinh, 2)) FROM HOCSINH
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HS000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'HS00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  Table [dbo].[DANTOC]    Script Date: 06/07/2020 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANTOC](
	[MaDanToc] [varchar](6) NOT NULL,
	[TenDanToc] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanToc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIEM]    Script Date: 06/07/2020 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIEM](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaHocSinh] [varchar](6) NOT NULL,
	[MaMonHoc] [varchar](6) NOT NULL,
	[MaHocKy] [varchar](3) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaLoai] [varchar](6) NOT NULL,
	[Diem] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 06/07/2020 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MaGiaoVien] [varchar](6) NOT NULL,
	[TenGiaoVien] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[DienThoai] [varchar](15) NOT NULL,
	[MaMonHoc] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANHKIEM]    Script Date: 06/07/2020 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANHKIEM](
	[MaHanhKiem] [varchar](6) NOT NULL,
	[TenHanhKiem] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHanhKiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCKY]    Script Date: 06/07/2020 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCKY](
	[MaHocKy] [varchar](3) NOT NULL,
	[TenHocKy] [nvarchar](30) NOT NULL,
	[HeSo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCLUC]    Script Date: 06/07/2020 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCLUC](
	[MaHocLuc] [varchar](6) NOT NULL,
	[TenHocLuc] [nvarchar](30) NOT NULL,
	[DiemCanDuoi] [float] NOT NULL,
	[DiemCanTren] [float] NOT NULL,
	[DiemKhongChe] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocLuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCSINH]    Script Date: 06/07/2020 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCSINH](
	[MaHocSinh] [varchar](6) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [datetime] NULL,
	[NoiSinh] [nvarchar](50) NOT NULL,
	[MaDanToc] [varchar](6) NOT NULL,
	[MaTonGiao] [varchar](6) NOT NULL,
	[HoTenCha] [nvarchar](30) NOT NULL,
	[MaNNghiepCha] [varchar](6) NOT NULL,
	[HoTenMe] [nvarchar](30) NOT NULL,
	[MaNNghiepMe] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KETQUA]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KETQUA](
	[MaKetQua] [varchar](6) NOT NULL,
	[TenKetQua] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKetQua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOILOP]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOILOP](
	[MaKhoiLop] [varchar](6) NOT NULL,
	[TenKhoiLop] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoiLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KQ_CA_NAM_MON_HOC]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_CA_NAM_MON_HOC](
	[MaHocSinh] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaMonHoc] [varchar](6) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[DiemThiLai] [float] NULL,
	[DTBCaNam] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaLop] ASC,
	[MaMonHoc] ASC,
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KQ_CA_NAM_TONG_HOP]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_CA_NAM_TONG_HOP](
	[MaHocSinh] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[MaHocLuc] [varchar](6) NOT NULL,
	[MaHanhKiem] [varchar](6) NOT NULL,
	[DTBCaNam] [float] NOT NULL,
	[MaKetQua] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaLop] ASC,
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KQ_HOC_KY_MON_HOC]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_HOC_KY_MON_HOC](
	[MaHocSinh] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaMonHoc] [varchar](6) NOT NULL,
	[MaHocKy] [varchar](3) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[DTBKiemTra] [float] NOT NULL,
	[DTBMonHocKy] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaLop] ASC,
	[MaMonHoc] ASC,
	[MaHocKy] ASC,
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KQ_HOC_KY_TONG_HOP]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_HOC_KY_TONG_HOP](
	[MaHocSinh] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaHocKy] [varchar](3) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[MaHocLuc] [varchar](6) NOT NULL,
	[MaHanhKiem] [varchar](6) NOT NULL,
	[DTBMonHocKy] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaHocKy] ASC,
	[MaLop] ASC,
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIDIEM]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIDIEM](
	[MaLoai] [varchar](6) NOT NULL,
	[TenLoai] [nvarchar](30) NOT NULL,
	[HeSo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAINGUOIDUNG]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINGUOIDUNG](
	[MaLoai] [varchar](6) NOT NULL,
	[TenLoaiND] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOP](
	[MaLop] [varchar](10) NOT NULL,
	[TenLop] [nvarchar](30) NOT NULL,
	[MaKhoiLop] [varchar](6) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[SiSo] [int] NOT NULL,
	[MaGiaoVien] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MaMonHoc] [varchar](6) NOT NULL,
	[TenMonHoc] [nvarchar](30) NOT NULL,
	[SoTiet] [int] NOT NULL,
	[HeSo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NAMHOC]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NAMHOC](
	[MaNamHoc] [varchar](6) NOT NULL,
	[TenNamHoc] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGHENGHIEP]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGHENGHIEP](
	[MaNghe] [varchar](6) NOT NULL,
	[TenNghe] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNghe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[MaND] [varchar](6) NOT NULL,
	[MaLoai] [varchar](6) NOT NULL,
	[TenND] [nvarchar](30) NOT NULL,
	[TenDNhap] [varchar](30) NOT NULL,
	[MatKhau] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaMonHoc] [varchar](6) NOT NULL,
	[MaGiaoVien] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANLOP]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANLOP](
	[MaNamHoc] [varchar](6) NOT NULL,
	[MaKhoiLop] [varchar](6) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaHocSinh] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNamHoc] ASC,
	[MaKhoiLop] ASC,
	[MaLop] ASC,
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUYDINH]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYDINH](
	[TuoiCanDuoi] [int] NOT NULL,
	[TuoiCanTren] [int] NOT NULL,
	[SiSoCanDuoi] [int] NOT NULL,
	[SiSoCanTren] [int] NOT NULL,
	[ThangDiem] [int] NOT NULL,
	[TenTruong] [nvarchar](100) NULL,
	[DiaChiTruong] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TONGIAO]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TONGIAO](
	[MaTonGiao] [varchar](6) NOT NULL,
	[TenTonGiao] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTonGiao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0001', N'Kinh')
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0002', N'Hoa')
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0003', N'Khome')
INSERT [dbo].[DANTOC] ([MaDanToc], [TenDanToc]) VALUES (N'DT0004', N'Cham')
GO
SET IDENTITY_INSERT [dbo].[DIEM] ON 

INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (1, N'HS0001', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (5, N'HS0001', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (8, N'HS0001', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (10, N'HS0001', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (11, N'HS0001', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (12, N'HS0001', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (13, N'HS0001', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (14, N'HS0001', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (15, N'HS0001', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8.8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (17, N'HS0001', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (18, N'HS0001', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (20, N'HS0001', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (21, N'HS0001', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (22, N'HS0001', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (23, N'HS0001', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (25, N'HS0001', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (26, N'HS0001', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (27, N'HS0001', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (28, N'HS0001', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (29, N'HS0001', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (30, N'HS0001', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (31, N'HS0001', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (32, N'HS0001', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (33, N'HS0001', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (34, N'HS0001', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (35, N'HS0001', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (36, N'HS0001', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (37, N'HS0001', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (38, N'HS0001', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (40, N'HS0001', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (41, N'HS0001', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (42, N'HS0001', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (43, N'HS0001', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (44, N'HS0001', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (45, N'HS0001', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (46, N'HS0001', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (47, N'HS0001', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (48, N'HS0001', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (49, N'HS0001', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (50, N'HS0001', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (51, N'HS0001', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (52, N'HS0001', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (53, N'HS0001', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (54, N'HS0001', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (56, N'HS0001', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (57, N'HS0001', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (61, N'HS0001', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (62, N'HS0001', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (63, N'HS0001', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (64, N'HS0001', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (65, N'HS0001', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (66, N'HS0001', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (68, N'HS0002', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (69, N'HS0002', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (70, N'HS0002', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (72, N'HS0002', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (73, N'HS0002', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (74, N'HS0002', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (75, N'HS0002', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (76, N'HS0002', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (77, N'HS0002', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (78, N'HS0002', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (79, N'HS0002', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (80, N'HS0002', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (81, N'HS0002', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (82, N'HS0002', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (83, N'HS0002', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (84, N'HS0002', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (86, N'HS0002', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (87, N'HS0002', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (88, N'HS0002', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (89, N'HS0002', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (90, N'HS0002', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (92, N'HS0002', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 5.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (93, N'HS0002', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (94, N'HS0002', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (95, N'HS0002', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (96, N'HS0002', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (97, N'HS0002', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (98, N'HS0002', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (99, N'HS0002', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (100, N'HS0002', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (101, N'HS0002', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (102, N'HS0002', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (103, N'HS0002', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (104, N'HS0002', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (105, N'HS0002', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (106, N'HS0002', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (107, N'HS0002', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (108, N'HS0002', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (109, N'HS0002', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (110, N'HS0002', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (111, N'HS0002', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (112, N'HS0002', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (114, N'HS0002', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (115, N'HS0002', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (116, N'HS0002', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (117, N'HS0002', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (119, N'HS0002', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6)
GO
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (120, N'HS0002', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (121, N'HS0002', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (122, N'HS0002', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (123, N'HS0002', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (124, N'HS0002', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (125, N'HS0002', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (126, N'HS0003', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (127, N'HS0003', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (128, N'HS0003', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (129, N'HS0003', N'MH0001', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (130, N'HS0003', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (131, N'HS0003', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (132, N'HS0003', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (133, N'HS0003', N'MH0002', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (134, N'HS0003', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (135, N'HS0003', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (136, N'HS0003', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (137, N'HS0003', N'MH0003', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (138, N'HS0003', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (139, N'HS0003', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (143, N'HS0003', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (144, N'HS0003', N'MH0004', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (145, N'HS0003', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (146, N'HS0003', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (147, N'HS0003', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (148, N'HS0003', N'MH0005', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (149, N'HS0003', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (150, N'HS0003', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (152, N'HS0003', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (153, N'HS0003', N'MH0006', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (154, N'HS0003', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (155, N'HS0003', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (156, N'HS0003', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (157, N'HS0003', N'MH0007', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (158, N'HS0003', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (159, N'HS0003', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (160, N'HS0003', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (161, N'HS0003', N'MH0008', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (162, N'HS0003', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (163, N'HS0003', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (164, N'HS0003', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (165, N'HS0003', N'MH0009', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (166, N'HS0003', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (167, N'HS0003', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (168, N'HS0003', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (169, N'HS0003', N'MH0010', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (170, N'HS0003', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (171, N'HS0003', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (172, N'HS0003', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (173, N'HS0003', N'MH0011', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (174, N'HS0003', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (175, N'HS0003', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (176, N'HS0003', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (177, N'HS0003', N'MH0012', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (178, N'HS0003', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (179, N'HS0003', N'MH0013', N'Hk1', N'NH0708', N'LOP1010708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (180, N'HS0003', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (181, N'HS0003', N'MH0013', N'HK1', N'NH0708', N'LOP1010708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (182, N'HS0011', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (183, N'HS0011', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (185, N'HS0011', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (186, N'HS0011', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (187, N'HS0011', N'MH0002', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (188, N'HS0011', N'MH0002', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (189, N'HS0011', N'MH0002', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (190, N'HS0011', N'MH0002', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (191, N'HS0011', N'MH0003', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (192, N'HS0011', N'MH0003', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (193, N'HS0011', N'MH0003', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (194, N'HS0011', N'MH0003', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (195, N'HS0011', N'MH0004', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (196, N'HS0011', N'MH0004', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (197, N'HS0011', N'MH0004', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (198, N'HS0011', N'MH0004', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (199, N'HS0011', N'MH0005', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (200, N'HS0011', N'MH0005', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (201, N'HS0011', N'MH0005', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (203, N'HS0011', N'MH0005', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (204, N'HS0011', N'MH0006', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (205, N'HS0011', N'MH0006', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (206, N'HS0011', N'MH0006', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (207, N'HS0011', N'MH0006', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (208, N'HS0011', N'MH0007', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (209, N'HS0011', N'MH0007', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (210, N'HS0011', N'MH0007', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (211, N'HS0011', N'MH0007', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (212, N'HS0011', N'MH0008', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (213, N'HS0011', N'MH0008', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (214, N'HS0011', N'MH0008', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (216, N'HS0011', N'MH0008', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (217, N'HS0011', N'MH0009', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (218, N'HS0011', N'MH0009', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (219, N'HS0011', N'MH0009', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (220, N'HS0011', N'MH0009', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (221, N'HS0011', N'MH0010', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (222, N'HS0011', N'MH0010', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (223, N'HS0011', N'MH0010', N'Hk1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (224, N'HS0011', N'MH0010', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (225, N'HS0011', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (226, N'HS0011', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9)
GO
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (227, N'HS0011', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (228, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (229, N'HS0004', N'MH0012', N'Hk1', N'NH0708', N'LOP1020708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (230, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (231, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (232, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (233, N'HS0004', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (234, N'HS0004', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (236, N'HS0004', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (237, N'HS0004', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (238, N'HS0005', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (239, N'HS0005', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (240, N'HS0005', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (241, N'HS0005', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (242, N'HS0005', N'MH0002', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (243, N'HS0005', N'MH0002', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (244, N'HS0005', N'MH0002', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (245, N'HS0005', N'MH0002', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (246, N'HS0005', N'MH0003', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (247, N'HS0005', N'MH0003', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (248, N'HS0005', N'MH0003', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (249, N'HS0005', N'MH0003', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (250, N'HS0005', N'MH0004', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (251, N'HS0005', N'MH0004', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (252, N'HS0005', N'MH0004', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (253, N'HS0005', N'MH0004', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (254, N'HS0005', N'MH0005', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (255, N'HS0005', N'MH0005', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (257, N'HS0005', N'MH0005', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (258, N'HS0005', N'MH0005', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (259, N'HS0005', N'MH0006', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (260, N'HS0005', N'MH0006', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (261, N'HS0005', N'MH0006', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (262, N'HS0005', N'MH0006', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (263, N'HS0005', N'MH0007', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (264, N'HS0005', N'MH0007', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (266, N'HS0005', N'MH0007', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (267, N'HS0005', N'MH0007', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (268, N'HS0005', N'MH0008', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (269, N'HS0005', N'MH0008', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (270, N'HS0005', N'MH0008', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (271, N'HS0005', N'MH0008', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (272, N'HS0005', N'MH0009', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (273, N'HS0005', N'MH0009', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (275, N'HS0005', N'MH0009', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (276, N'HS0005', N'MH0009', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (277, N'HS0005', N'MH0010', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (278, N'HS0005', N'MH0010', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (279, N'HS0005', N'MH0010', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (280, N'HS0005', N'MH0010', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (281, N'HS0005', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (282, N'HS0005', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (284, N'HS0005', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (286, N'HS0005', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (287, N'HS0005', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (288, N'HS0005', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (289, N'HS0005', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (290, N'HS0005', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (291, N'HS0005', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (292, N'HS0005', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (293, N'HS0005', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (294, N'HS0005', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (296, N'HS0006', N'MH0001', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (297, N'HS0006', N'MH0001', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (298, N'HS0006', N'MH0001', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (300, N'HS0006', N'MH0001', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (301, N'HS0006', N'MH0002', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (302, N'HS0006', N'MH0002', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (303, N'HS0006', N'MH0002', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (304, N'HS0006', N'MH0002', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (305, N'HS0006', N'MH0003', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (306, N'HS0006', N'MH0003', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (307, N'HS0006', N'MH0003', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (308, N'HS0006', N'MH0003', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (309, N'HS0006', N'MH0004', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (310, N'HS0006', N'MH0004', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (311, N'HS0006', N'MH0004', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (312, N'HS0006', N'MH0004', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (313, N'HS0006', N'MH0005', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (314, N'HS0006', N'MH0005', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (315, N'HS0006', N'MH0005', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (316, N'HS0006', N'MH0005', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (317, N'HS0006', N'MH0006', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (318, N'HS0006', N'MH0006', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (319, N'HS0006', N'MH0006', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (320, N'HS0006', N'MH0006', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (321, N'HS0006', N'MH0007', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (322, N'HS0006', N'MH0007', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (323, N'HS0006', N'MH0007', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (324, N'HS0006', N'MH0007', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (325, N'HS0006', N'MH0008', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (326, N'HS0006', N'MH0008', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (327, N'HS0006', N'MH0008', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (329, N'HS0006', N'MH0008', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (330, N'HS0006', N'MH0009', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (331, N'HS0006', N'MH0009', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (332, N'HS0006', N'MH0009', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (333, N'HS0006', N'MH0009', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (334, N'HS0006', N'MH0010', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (335, N'HS0006', N'MH0010', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7)
GO
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (337, N'HS0006', N'MH0010', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (338, N'HS0006', N'MH0010', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (339, N'HS0006', N'MH0011', N'Hk1', N'NH0708', N'LOP1030708', N'LD0001', 4)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (340, N'HS0006', N'MH0011', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (341, N'HS0006', N'MH0011', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (342, N'HS0006', N'MH0011', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (343, N'HS0006', N'MH0012', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (344, N'HS0006', N'MH0012', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (345, N'HS0006', N'MH0012', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (346, N'HS0006', N'MH0012', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 6.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (347, N'HS0006', N'MH0013', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (348, N'HS0006', N'MH0013', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (349, N'HS0006', N'MH0013', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (350, N'HS0006', N'MH0013', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (351, N'HS0007', N'MH0001', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (352, N'HS0007', N'MH0001', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (353, N'HS0007', N'MH0001', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (354, N'HS0007', N'MH0001', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (355, N'HS0007', N'MH0002', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (356, N'HS0007', N'MH0002', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (358, N'HS0007', N'MH0002', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (359, N'HS0007', N'MH0002', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (360, N'HS0007', N'MH0003', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (361, N'HS0007', N'MH0003', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (362, N'HS0007', N'MH0003', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (363, N'HS0007', N'MH0003', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (364, N'HS0007', N'MH0004', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (365, N'HS0007', N'MH0004', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (366, N'HS0007', N'MH0004', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (367, N'HS0007', N'MH0004', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (368, N'HS0007', N'MH0005', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (369, N'HS0007', N'MH0005', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (370, N'HS0007', N'MH0005', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (371, N'HS0007', N'MH0005', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (372, N'HS0007', N'MH0006', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (373, N'HS0007', N'MH0006', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (374, N'HS0007', N'MH0006', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (375, N'HS0007', N'MH0006', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (376, N'HS0007', N'MH0007', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (377, N'HS0007', N'MH0007', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (379, N'HS0007', N'MH0007', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (380, N'HS0007', N'MH0007', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (381, N'HS0007', N'MH0008', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (382, N'HS0007', N'MH0008', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (383, N'HS0007', N'MH0008', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (384, N'HS0007', N'MH0008', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (385, N'HS0007', N'MH0009', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (386, N'HS0007', N'MH0009', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (387, N'HS0007', N'MH0009', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (388, N'HS0007', N'MH0009', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (389, N'HS0007', N'MH0010', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 9.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (391, N'HS0007', N'MH0010', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (392, N'HS0007', N'MH0010', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (394, N'HS0007', N'MH0010', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (395, N'HS0007', N'MH0011', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (396, N'HS0007', N'MH0011', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (397, N'HS0007', N'MH0011', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (398, N'HS0007', N'MH0011', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (399, N'HS0007', N'MH0012', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (400, N'HS0007', N'MH0012', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (401, N'HS0007', N'MH0012', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (402, N'HS0007', N'MH0012', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (403, N'HS0007', N'MH0013', N'HK1', N'NH0708', N'LOP1030708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (404, N'HS0007', N'MH0013', N'HK1', N'NH0708', N'LOP1030708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (405, N'HS0007', N'MH0013', N'HK1', N'NH0708', N'LOP1030708', N'LD0003', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (406, N'HS0007', N'MH0013', N'HK1', N'NH0708', N'LOP1030708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (407, N'HS0005', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (408, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (409, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (410, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (411, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (412, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (413, N'HS0004', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (414, N'HS0004', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (415, N'HS0004', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (416, N'HS0004', N'MH0013', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (418, N'HS0005', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0002', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (419, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (420, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (421, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (423, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (424, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (425, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (426, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (427, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 10)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (428, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (429, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 6)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (430, N'HS0005', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 7.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (431, N'HS0004', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 7)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (432, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 9)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (433, N'HS0004', N'MH0012', N'HK1', N'Nh0708', N'LOP1020708', N'LD0003', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (434, N'HS0004', N'MH0012', N'HK1', N'NH0708', N'LOp1020708', N'LD0004', 8.5)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (435, N'HS0005', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (436, N'HS0005', N'MH0001', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (437, N'HS0005', N'MH0012', N'HK1', N'NH0708', N'LOP1020708', N'LD0001', 8)
INSERT [dbo].[DIEM] ([STT], [MaHocSinh], [MaMonHoc], [MaHocKy], [MaNamHoc], [MaLop], [MaLoai], [Diem]) VALUES (438, N'HS0011', N'MH0011', N'HK1', N'NH0708', N'LOP1020708', N'LD0004', 8)
SET IDENTITY_INSERT [dbo].[DIEM] OFF
GO
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [DiaChi], [DienThoai], [MaMonHoc]) VALUES (N'GV0001', N'Nguyen Hoang Tung', N'100 Tran Hung Dao, Long Xuyen', N'0975058876', N'MH0001')
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [DiaChi], [DienThoai], [MaMonHoc]) VALUES (N'GV0002', N'Phan Hong Nhung', N'Lac Quoi - Tri Ton', N'0976630315', N'MH0002')
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [DiaChi], [DienThoai], [MaMonHoc]) VALUES (N'GV0003', N'Huynh Thanh Truc', N'10C Nguyen Trung Truc, Chau Doc', N'0699015456', N'MH0003')
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [DiaChi], [DienThoai], [MaMonHoc]) VALUES (N'GV0004', N'Lam Trung Toan', N'Long Dien B, An Phu', N'0845241566', N'MH0004')
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [DiaChi], [DienThoai], [MaMonHoc]) VALUES (N'GV0005', N'Huynh Tuc Tri', N'Rach Gia, Kien Giang', N'0123456789', N'MH0005')
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [DiaChi], [DienThoai], [MaMonHoc]) VALUES (N'GV0006', N'Le Thi Minh Nguyet', N'000 Long Xuyen, An Giang', N'0123456789', N'MH0006')
GO
INSERT [dbo].[HANHKIEM] ([MaHanhKiem], [TenHanhKiem]) VALUES (N'HK0001', N'Tot')
INSERT [dbo].[HANHKIEM] ([MaHanhKiem], [TenHanhKiem]) VALUES (N'HK0002', N'Kha')
INSERT [dbo].[HANHKIEM] ([MaHanhKiem], [TenHanhKiem]) VALUES (N'HK0003', N'Trung binh')
INSERT [dbo].[HANHKIEM] ([MaHanhKiem], [TenHanhKiem]) VALUES (N'HK0004', N'Yeu')
GO
INSERT [dbo].[HOCKY] ([MaHocKy], [TenHocKy], [HeSo]) VALUES (N'HK1', N'Hoc ky 1', 1)
INSERT [dbo].[HOCKY] ([MaHocKy], [TenHocKy], [HeSo]) VALUES (N'HK2', N'Hoc ky 2', 2)
GO
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren], [DiemKhongChe]) VALUES (N'HL0001', N'Gioi', 8, 10, 6.5)
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren], [DiemKhongChe]) VALUES (N'HL0002', N'Kha', 6.5, 7.9, 5)
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren], [DiemKhongChe]) VALUES (N'HL0003', N'Trung binh', 5, 6.4, 3.5)
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren], [DiemKhongChe]) VALUES (N'HL0004', N'Yeu', 3.5, 4.9, 2)
INSERT [dbo].[HOCLUC] ([MaHocLuc], [TenHocLuc], [DiemCanDuoi], [DiemCanTren], [DiemKhongChe]) VALUES (N'HL0005', N'Kem', 0, 3.4, 0)
GO
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0001', N'Nguyen Van Tu', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0002', N'Nguyen Ngoc An', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0003', N'Le Hoang Anh', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0004', N'Huynh Thien Chi', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0005', N'Ly Ngoc Duy', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0006', N'Huynh Ngoc Diep', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0007', N'Tran Thi Hue', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0008', N'Nguyen Thanh Huy', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0009', N'Tran Phuoc Lap', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0010', N'Truong Thi Nga', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0011', N'Nguyen Thi Nga', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0012', N'Tran Thi Hong Nghi', 1, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0013', N'Huynh Thi My Ngoc', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0014', N'Tran Thi My Nhan', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0015', N'Truong Thi Ngoc Nhung', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0016', N'Huynh Quoc Phuong', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0003', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0017', N'Ly Ngoc Phuong', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0018', N'Nguyen Thi Phuong', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0019', N'Nguyen Phu Quoc', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0020', N'Vo Thien Quoc', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0021', N'Tran Van Rang', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0022', N'Vo Huu Tanh', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0023', N'Le Minh Tam', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0024', N'Nguyen Duc Tam', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0025', N'Nguyen Thanh Tam', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0026', N'Tran Ngoc Minh Tan', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0027', N'Duong Kim Thanh', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0028', N'Vang Si Thanh', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0029', N'Do Thi Bich Thao', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0030', N'Ho Minh Thien', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0031', N'Nguyen Thi Anh Thu', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0032', N'Pham Nguyen B.Trinh', 1, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0033', N'Vo Ngoc Trinh', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0034', N'Nguyen Huynh Minh Tri', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0035', N'Do Xuan Trinh', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0036', N'Nguyen Hieu Trung', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0037', N'Nguyen Thanh Trung', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0038', N'Tran Thanh Truc', 1, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0039', N'Cao Minh Tuan', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0040', N'Nguyen Hoang Tuan', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0041', N'Truong Minh Tuyen', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0042', N'Le Thanh Tung', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0043', N'Pham Thi Bich Vi', 1, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0044', N'Dang Quang Vinh', 0, CAST(N'1991-01-02T00:00:00.000' AS DateTime), N'Dong Thap', N'DT0001', N'TG0003', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0004')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0045', N'Au Ngoc Vu', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Long Xuyen', N'DT0001', N'TG0005', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0002')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0046', N'Ho Thanh Vu', 0, CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'Ben Tre', N'DT0001', N'TG0002', N'Biet chet lien', N'NN0003', N'Biet chet lien', N'NN0001')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0047', N'Phan Quoc Vuong', 0, CAST(N'1992-04-15T00:00:00.000' AS DateTime), N'Cho Moi', N'DT0001', N'TG0004', N'Biet chet lien', N'NN0005', N'Biet chet lien', N'NN0005')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0048', N'Nguyễn An', 0, CAST(N'1994-01-01T00:00:00.000' AS DateTime), N'Hồ Chí Minh', N'DT0001', N'TG0001', N'Biet chet lien', N'NN0002', N'Biet chet lien', N'NN0003')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [HoTen], [GioiTinh], [NgaySinh], [NoiSinh], [MaDanToc], [MaTonGiao], [HoTenCha], [MaNNghiepCha], [HoTenMe], [MaNNghiepMe]) VALUES (N'HS0049', N'Le Nguyen', 0, CAST(N'1991-01-01T00:00:00.000' AS DateTime), N'Long An', N'DT0001', N'TG0001', N'Biet chet lien', N'NN0001', N'Biet chet lien', N'NN0002')
GO
INSERT [dbo].[KETQUA] ([MaKetQua], [TenKetQua]) VALUES (N'KQ0001', N'Len lop')
INSERT [dbo].[KETQUA] ([MaKetQua], [TenKetQua]) VALUES (N'KQ0002', N'Thi lai')
INSERT [dbo].[KETQUA] ([MaKetQua], [TenKetQua]) VALUES (N'KQ0003', N'Ren luyen he')
INSERT [dbo].[KETQUA] ([MaKetQua], [TenKetQua]) VALUES (N'KQ0004', N'O lai')
GO
INSERT [dbo].[KHOILOP] ([MaKhoiLop], [TenKhoiLop]) VALUES (N'KHOI10', N'Khoi 10')
INSERT [dbo].[KHOILOP] ([MaKhoiLop], [TenKhoiLop]) VALUES (N'KHOI11', N'Khoi 11')
INSERT [dbo].[KHOILOP] ([MaKhoiLop], [TenKhoiLop]) VALUES (N'KHOI12', N'Khoi 12')
GO
INSERT [dbo].[LOAIDIEM] ([MaLoai], [TenLoai], [HeSo]) VALUES (N'LD0001', N'Kiem tra mieng', 1)
INSERT [dbo].[LOAIDIEM] ([MaLoai], [TenLoai], [HeSo]) VALUES (N'LD0002', N'Kiem tra 15 phut', 1)
INSERT [dbo].[LOAIDIEM] ([MaLoai], [TenLoai], [HeSo]) VALUES (N'LD0003', N'Kiem tra 1 tiet', 2)
INSERT [dbo].[LOAIDIEM] ([MaLoai], [TenLoai], [HeSo]) VALUES (N'LD0004', N'Thi hoc ky', 1)
GO
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoai], [TenLoaiND]) VALUES (N'LND001', N'Ban giam hieu')
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoai], [TenLoaiND]) VALUES (N'LND002', N'Giao vien')
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoai], [TenLoaiND]) VALUES (N'LND003', N'Nhan vien giao vu')
GO
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1010708', N'10A1', N'KHOI10', N'NH0708', 35, N'GV0006')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1010809', N'10A1', N'KHOI10', N'NH0809', 39, N'GV0001')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1020708', N'10A2', N'KHOI10', N'NH0708', 36, N'GV0005')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1020809', N'10A2', N'KHOI10', N'NH0809', 38, N'GV0002')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1030708', N'10A3', N'KHOI10', N'NH0708', 34, N'GV0004')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1030809', N'10A3', N'KHOI10', N'NH0809', 35, N'GV0003')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1110708', N'11A1', N'KHOI11', N'NH0708', 37, N'GV0003')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1110809', N'11A1', N'KHOI11', N'NH0809', 40, N'GV0004')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1120708', N'11A2', N'KHOI11', N'NH0708', 38, N'GV0002')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1120809', N'11A2', N'KHOI11', N'NH0809', 38, N'GV0005')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1210708', N'12A1', N'KHOI12', N'NH0708', 39, N'GV0001')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [MaKhoiLop], [MaNamHoc], [SiSo], [MaGiaoVien]) VALUES (N'LOP1210809', N'12A1', N'KHOI12', N'NH0809', 38, N'GV0006')
GO
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0001', N'Toan Hoc', 90, 2)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0002', N'Vat Ly', 60, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0003', N'Hoa Hoc', 60, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0004', N'Sinh Hoc', 60, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0005', N'Ngu Van', 90, 2)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0006', N'Lich Su', 45, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0007', N'Dia Ly', 45, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0008', N'Anh Van', 45, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0009', N'GD Cong Dan', 30, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0010', N'Tin Hoc', 30, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0011', N'The Duc', 30, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0012', N'Quoc Phong', 30, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [TenMonHoc], [SoTiet], [HeSo]) VALUES (N'MH0013', N'Cong Nghe', 30, 1)
GO
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (N'NH0708', N'2007 - 2008')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (N'NH0809', N'2008 - 2009')
GO
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0001', N'Noi tro')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0002', N'Giao vien')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0003', N'Cong nhan')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0004', N'Lam ruong')
INSERT [dbo].[NGHENGHIEP] ([MaNghe], [TenNghe]) VALUES (N'NN0005', N'Buon ban')
GO
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [MatKhau]) VALUES (N'ND0001', N'LND001', N'Nguyen Hoang Tung', N'admin', N'hoangtung')
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [MatKhau]) VALUES (N'ND0002', N'LND002', N'Phan Hong Nhung', N'hongnhung', N'hongnhung')
INSERT [dbo].[NGUOIDUNG] ([MaND], [MaLoai], [TenND], [TenDNhap], [MatKhau]) VALUES (N'ND0003', N'LND003', N'Lam Trung Toan', N'trungtoan', N'toantrung')
GO
SET IDENTITY_INSERT [dbo].[PHANCONG] ON 

INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (1, N'NH0708', N'LOP1010708', N'MH0001', N'GV0001')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (2, N'NH0708', N'LOP1010708', N'MH0002', N'GV0002')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (3, N'NH0708', N'LOP1010708', N'MH0003', N'GV0003')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (4, N'NH0708', N'LOP1010708', N'MH0004', N'GV0004')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (5, N'NH0708', N'LOP1020708', N'MH0001', N'GV0001')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (6, N'NH0708', N'LOP1020708', N'MH0002', N'GV0002')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (7, N'NH0708', N'LOP1020708', N'MH0003', N'GV0003')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (8, N'NH0708', N'LOP1020708', N'MH0004', N'GV0004')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (9, N'NH0708', N'LOP1110708', N'MH0001', N'GV0001')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (10, N'NH0708', N'LOP1110708', N'MH0002', N'GV0002')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (11, N'NH0708', N'LOP1110708', N'MH0003', N'GV0003')
INSERT [dbo].[PHANCONG] ([STT], [MaNamHoc], [MaLop], [MaMonHoc], [MaGiaoVien]) VALUES (12, N'NH0708', N'LOP1110708', N'MH0004', N'GV0004')
SET IDENTITY_INSERT [dbo].[PHANCONG] OFF
GO
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0001')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0002')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0003')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0004')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0005')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0006')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0007')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0008')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0009')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1010708', N'HS0010')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0011')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0012')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0013')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0014')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0015')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0016')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0017')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0018')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0019')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI10', N'LOP1020708', N'HS0020')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0021')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0022')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0023')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0024')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0025')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0026')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0027')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0028')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0029')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1110708', N'HS0030')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0031')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0032')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0033')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0034')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0035')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0036')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0037')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0038')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0039')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI11', N'LOP1120708', N'HS0040')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI12', N'LOP1210708', N'HS0041')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI12', N'LOP1210708', N'HS0042')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI12', N'LOP1210708', N'HS0043')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI12', N'LOP1210708', N'HS0044')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI12', N'LOP1210708', N'HS0045')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI12', N'LOP1210708', N'HS0046')
INSERT [dbo].[PHANLOP] ([MaNamHoc], [MaKhoiLop], [MaLop], [MaHocSinh]) VALUES (N'NH0708', N'KHOI12', N'LOP1210708', N'HS0047')
GO
INSERT [dbo].[QUYDINH] ([TuoiCanDuoi], [TuoiCanTren], [SiSoCanDuoi], [SiSoCanTren], [ThangDiem], [TenTruong], [DiaChiTruong]) VALUES (15, 20, 30, 40, 10, N'THPT My Thoi', N'79 Tran Hung Dao - TPLX')
GO
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0001', N'Khong')
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0002', N'Phat')
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0003', N'PG Hoa Hao')
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0004', N'Thien Chua')
INSERT [dbo].[TONGIAO] ([MaTonGiao], [TenTonGiao]) VALUES (N'TG0005', N'Tin Lanh')
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [F_DIEM_HK] FOREIGN KEY([MaHocKy])
REFERENCES [dbo].[HOCKY] ([MaHocKy])
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [F_DIEM_HK]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [F_DIEM_HS] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [F_DIEM_HS]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [F_DIEM_LD] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAIDIEM] ([MaLoai])
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [F_DIEM_LD]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [F_DIEM_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [F_DIEM_LOP]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [F_DIEM_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [F_DIEM_MH]
GO
ALTER TABLE [dbo].[DIEM]  WITH CHECK ADD  CONSTRAINT [F_DIEM_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[DIEM] CHECK CONSTRAINT [F_DIEM_NH]
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD  CONSTRAINT [F_GV_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[GIAOVIEN] CHECK CONSTRAINT [F_GV_MH]
GO
ALTER TABLE [dbo].[HOCSINH]  WITH CHECK ADD  CONSTRAINT [F_HS_DT] FOREIGN KEY([MaDanToc])
REFERENCES [dbo].[DANTOC] ([MaDanToc])
GO
ALTER TABLE [dbo].[HOCSINH] CHECK CONSTRAINT [F_HS_DT]
GO
ALTER TABLE [dbo].[HOCSINH]  WITH CHECK ADD  CONSTRAINT [F_HS_NNC] FOREIGN KEY([MaNNghiepCha])
REFERENCES [dbo].[NGHENGHIEP] ([MaNghe])
GO
ALTER TABLE [dbo].[HOCSINH] CHECK CONSTRAINT [F_HS_NNC]
GO
ALTER TABLE [dbo].[HOCSINH]  WITH CHECK ADD  CONSTRAINT [F_HS_NNM] FOREIGN KEY([MaNNghiepMe])
REFERENCES [dbo].[NGHENGHIEP] ([MaNghe])
GO
ALTER TABLE [dbo].[HOCSINH] CHECK CONSTRAINT [F_HS_NNM]
GO
ALTER TABLE [dbo].[HOCSINH]  WITH CHECK ADD  CONSTRAINT [F_HS_TG] FOREIGN KEY([MaTonGiao])
REFERENCES [dbo].[TONGIAO] ([MaTonGiao])
GO
ALTER TABLE [dbo].[HOCSINH] CHECK CONSTRAINT [F_HS_TG]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQCNMH_HS] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_MON_HOC] CHECK CONSTRAINT [F_KQCNMH_HS]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQCNMH_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_MON_HOC] CHECK CONSTRAINT [F_KQCNMH_LOP]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQCNMH_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_MON_HOC] CHECK CONSTRAINT [F_KQCNMH_MH]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQCNMH_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_MON_HOC] CHECK CONSTRAINT [F_KQCNMH_NH]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_HKIEM] FOREIGN KEY([MaHanhKiem])
REFERENCES [dbo].[HANHKIEM] ([MaHanhKiem])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_HKIEM]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_HL] FOREIGN KEY([MaHocLuc])
REFERENCES [dbo].[HOCLUC] ([MaHocLuc])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_HL]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_HS] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_HS]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_KQ] FOREIGN KEY([MaKetQua])
REFERENCES [dbo].[KETQUA] ([MaKetQua])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_KQ]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_LOP]
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQCN_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[KQ_CA_NAM_TONG_HOP] CHECK CONSTRAINT [F_KQCN_NH]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_HK] FOREIGN KEY([MaHocKy])
REFERENCES [dbo].[HOCKY] ([MaHocKy])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_HK]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_HS] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_HS]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_LO] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_LO]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_MH]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC]  WITH CHECK ADD  CONSTRAINT [F_KQHKMH_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_MON_HOC] CHECK CONSTRAINT [F_KQHKMH_NH]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_HK] FOREIGN KEY([MaHocKy])
REFERENCES [dbo].[HOCKY] ([MaHocKy])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_HK]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_HKIEM] FOREIGN KEY([MaHanhKiem])
REFERENCES [dbo].[HANHKIEM] ([MaHanhKiem])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_HKIEM]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_HL] FOREIGN KEY([MaHocLuc])
REFERENCES [dbo].[HOCLUC] ([MaHocLuc])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_HL]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_HS] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_HS]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_LOP]
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP]  WITH CHECK ADD  CONSTRAINT [F_KQHK_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[KQ_HOC_KY_TONG_HOP] CHECK CONSTRAINT [F_KQHK_NH]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [F_LOP_GV] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GIAOVIEN] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [F_LOP_GV]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [F_LOP_KL] FOREIGN KEY([MaKhoiLop])
REFERENCES [dbo].[KHOILOP] ([MaKhoiLop])
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [F_LOP_KL]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [F_LOP_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [F_LOP_NH]
GO
ALTER TABLE [dbo].[NGUOIDUNG]  WITH CHECK ADD  CONSTRAINT [F_ND_LND] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAINGUOIDUNG] ([MaLoai])
GO
ALTER TABLE [dbo].[NGUOIDUNG] CHECK CONSTRAINT [F_ND_LND]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [F_PC_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [F_PC_NH]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [P_PC_GV] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GIAOVIEN] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [P_PC_GV]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [P_PC_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [P_PC_LOP]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [P_PC_MH] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [P_PC_MH]
GO
ALTER TABLE [dbo].[PHANLOP]  WITH CHECK ADD  CONSTRAINT [F_PL_HS] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[PHANLOP] CHECK CONSTRAINT [F_PL_HS]
GO
ALTER TABLE [dbo].[PHANLOP]  WITH CHECK ADD  CONSTRAINT [F_PL_KHOI] FOREIGN KEY([MaKhoiLop])
REFERENCES [dbo].[KHOILOP] ([MaKhoiLop])
GO
ALTER TABLE [dbo].[PHANLOP] CHECK CONSTRAINT [F_PL_KHOI]
GO
ALTER TABLE [dbo].[PHANLOP]  WITH CHECK ADD  CONSTRAINT [F_PL_LOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[PHANLOP] CHECK CONSTRAINT [F_PL_LOP]
GO
ALTER TABLE [dbo].[PHANLOP]  WITH CHECK ADD  CONSTRAINT [F_PL_NH] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[PHANLOP] CHECK CONSTRAINT [F_PL_NH]
GO
/****** Object:  StoredProcedure [dbo].[NhapThongTinHocSinh]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NhapThongTinHocSinh] 
    
    @hotenHS nvarchar(30), 
	@giotinh bit,
	@ngaysinh datetime,
	@noisinh nvarchar(50),
	@maDanToc varchar(6),
	@maTonGiao varchar(6),
	@hotenCha nvarchar(30),
	@maNNCha varchar(6),
	@hotenMe nvarchar(30),
	@maNNMe varchar(6)
AS
	DECLARE @maHocSinh varchar(6)
	SELECT @maHocSinh = dbo.AUTO_MaHocSinh()
	INSERT INTO HOCSINH (MaHocSinh, HoTen, GioiTinh, NgaySinh, NoiSinh, MaDanToc, MaTonGiao, HoTenCha, MaNNghiepCha, HoTenMe, MaNNghiepMe) VALUES (@maHocSinh, @hotenHS, @giotinh, @ngaysinh, @noisinh, @maDanToc, @maTonGiao, @hotenCha, @maNNCha, @hotenMe, @maNNMe)


	
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinHocSinh]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SuaThongTinHocSinh] 
    @maHocSinh varchar(6),
    @hotenHS nvarchar(30), 
	@giotinh bit,
	@ngaysinh datetime,
	@noisinh nvarchar(50),
	@maDanToc varchar(6),
	@maTonGiao varchar(6),
	@hotenCha nvarchar(30),
	@maNNCha varchar(6),
	@hotenMe nvarchar(30),
	@maNNMe varchar(6)
AS
	
	UPDATE HOCSINH SET HoTen = @hotenHS, GioiTinh = @giotinh, NgaySinh = @ngaysinh , NoiSinh = @noisinh, MaDanToc =  @maDanToc, MaTonGiao = @maTonGiao , 
	HoTenCha = @hotenCha, MaNNghiepCha = @maNNCha , HoTenMe = @hotenMe , MaNNghiepMe = @maNNMe WHERE MaHocSinh = @maHocSinh 
GO
/****** Object:  StoredProcedure [dbo].[TraCuuHocSinh]    Script Date: 06/07/2020 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TraCuuHocSinh] 
   @maHS varchar(6) null,
   @hotenHS nvarchar(30) null,
   @maDanToc varchar(6) null,
   @maTonGiao varchar(6) null
AS
    SELECT * FROM HOCSINH WHERE MaHocSinh=@maHS OR HoTen = @hotenHS OR MaDanToc = @maDanToc OR MaTonGiao = @maTonGiao




	EXEC TraCuuHocSinh NULL, NULL, NULL, 'TG0005'
GO
USE [master]
GO
ALTER DATABASE [QLHocSinhTHPT] SET  READ_WRITE 
GO
