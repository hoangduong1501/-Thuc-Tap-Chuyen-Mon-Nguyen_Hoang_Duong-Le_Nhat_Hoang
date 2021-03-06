USE [QLHocSinhTHPT]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaGiaoVien]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MaGiaoVien]()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaGiaoVien) FROM GIAOVIEN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaGiaoVien, 2)) FROM GIAOVIEN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'GV000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'GV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaHocSinh]    Script Date: 17/07/2020 14:12:58 ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaMonHoc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MaMonHoc]()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaMonHoc) FROM MONHOC) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaMonHoc, 2)) FROM MONHOC
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'MH000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'MH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaNguoiDung]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MaNguoiDung]()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MaND) FROM NGUOIDUNG) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaND, 2)) FROM NGUOIDUNG
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'ND000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'ND00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_BangDiem]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhat_BangDiem]
    @ma_HocSinh varchar(6),
    @ma_HocKy varchar(3), 
	@ma_LopHoc varchar(10),
	@ma_MonHoc varchar(6),
	@diem_Mieng float,
	@diem_151 float,
	@diem_152 float,
	@diem_153 float,
	@diem_451 float,
	@diem_452 float,
	@diem_Thi float,
	@diem_TBM float
AS
BEGIN
	UPDATE [dbo].[BANG_DIEM]
	SET diem_KTMieng = @diem_Mieng, diem_KT15L1 = @diem_151, diem_KT15L2 = @diem_152, diem_KT15L3 = @diem_153, diem_1TL1 = @diem_451, 
		diem_1TL2 = @diem_452, diem_ThiHK = @diem_Thi, diem_TBM = @diem_TBM
	WHERE ma_HocSinh = @ma_HocSinh AND ma_HocKy = @ma_HocKy AND ma_LopHoc = @ma_LopHoc AND ma_MonHoc = @ma_MonHoc
END;
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_GiaoVien]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhat_GiaoVien]
	@ma_GiaoVien varchar(6),
    @ten_GiaoVien nvarchar(30),
	@diaChi nvarchar(50),
	@dienThoai varchar(15),
	@ma_Mon varchar(6)
AS
BEGIN    
	UPDATE dbo.GIAOVIEN SET TenGiaoVien=@ten_GiaoVien,DiaChi=@diaChi,DienThoai=@dienThoai,MaMonHoc=@ma_Mon
	WHERE MaGiaoVien = @ma_GiaoVien
END;
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_HocSinh]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhat_HocSinh] 
	@ma_HocSinh varchar(6),
    @ten_HocSinh nvarchar(30),
	@gioiTinh bit,
	@ngaySinh date,
	@diaChi ntext,
	@ma_DanToc varchar(6),
	@ma_TonGiao varchar(6),
	@ten_Cha nvarchar(30),
	@ma_NgheCha varchar(6),
	@ten_Me nvarchar(30),
	@ma_NgheMe varchar(6),
	@img_Anhthe image
AS
BEGIN
	UPDATE dbo.HOCSINH 
	SET HoTen = @ten_HocSinh, GioiTinh = @gioiTinh, NgaySinh = @ngaySinh, DiaChi = @diaChi, MaDanToc = @ma_DanToc,
		MaTonGiao = @ma_TonGiao, HoTenCha = @ten_Cha, @ten_Me = @ten_Me, MaNNghiepCha = @ma_NgheCha,
		MaNNghiepMe = @ma_NgheCha, anh_The = @img_Anhthe
	WHERE MaHocSinh = @ma_HocSinh
END;
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_Lop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhat_Lop]
    @ma_Lop varchar(10),
	@ten_Lop nvarchar(30),
	@ma_KhoiLop varchar(6),
	@ma_NamHoc varchar(6),
	@siSo int,
	@ma_GiaoVien varchar(6)
AS
BEGIN
	UPDATE LOP SET TenLop=@ten_Lop, MaKhoiLop=@ma_KhoiLop, MaNamHoc=@ma_NamHoc, SiSo=@siSo, MaGiaoVien=@ma_GiaoVien
	WHERE MaLop=@ma_Lop
END;
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_MatKhau]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhat_MatKhau] 
    @ten_DangNhap varchar(30),
	@matKhau_Moi varchar(30)
AS
BEGIN    
	UPDATE dbo.NGUOIDUNG SET MatKhau=@matKhau_Moi WHERE TenDNhap = @ten_DangNhap
END;
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_NguoiDung]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhat_NguoiDung]
    @ma_NguoiDung varchar(6),
	@ma_Loai varchar(6),
	@ten_NguoiDung nvarchar(30),
	@ten_DangNhap nvarchar(30),
	@matKhau varchar(30)
AS
BEGIN
	UPDATE NGUOIDUNG SET TenND=@ten_NguoiDung, TenDNhap=@ten_DangNhap, MatKhau=@matKhau, MaLoai=@ma_Loai
	WHERE MaND=@ma_NguoiDung
END;
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_QuyDinh]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhat_QuyDinh]
	@max_SiSo int,
	@min_SiSo int,
	@max_Tuoi int,
	@min_Tuoi int,
	@thangDiem int,
	@tenTruong nvarchar(100),
	@diaChi nvarchar(100)
AS
BEGIN
	UPDATE QUYDINH SET SiSoCanDuoi = @min_SiSo, SiSoCanTren = @max_SiSo,
		TuoiCanDuoi = @min_Tuoi, TuoiCanTren = @max_Tuoi,
		TenTruong = @tenTruong, DiaChiTruong = @diaChi, ThangDiem = @thangDiem
END;
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_ViPham]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhat_ViPham]
    @ma_HocSinh varchar(6),
	@ma_NamHoc varchar(6),
	@ma_LopHoc varchar(6),
	@ma_HocKy varchar(6),
	@ngay_ViPham date,
	@noidung_ViPham ntext
AS
BEGIN
	UPDATE VI_PHAM SET ma_NamHoc=@ma_NamHoc, ma_LopHoc=@ma_LopHoc, ma_HocKy=@ma_HocKy, ngay_ViPham=@ngay_ViPham, noidung_ViPham=@noidung_ViPham
	WHERE ma_HocSinh=@ma_HocSinh AND ngay_ViPham=@ngay_ViPham
END
GO
/****** Object:  StoredProcedure [dbo].[LayDS_BangDiem_Mon]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_BangDiem_Mon]
	@ma_Lop varchar(10),
	@ma_HocKy varchar(6),
	@ma_MonHoc varchar(6)
AS
BEGIN
	SELECT HS.MaHocSinh, HS.HoTen, BD.ma_HocKy,  BD.ma_LopHoc, BD.ma_MonHoc, BD.diem_KTMieng, BD.diem_KT15L1, BD.diem_KT15L2, BD.diem_KT15L3,
	BD.diem_1TL1, BD.diem_1TL2, BD.diem_ThiHK, BD.diem_TBM
	FROM BANG_DIEM BD, HOCSINH HS
	WHERE BD.ma_HocSinh = HS.MaHocSinh AND ma_LopHoc = @ma_Lop AND ma_HocKy = @ma_HocKy AND ma_MonHoc = @ma_MonHoc
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_DanToc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_DanToc] 
AS
BEGIN
	SELECT * FROM dbo.DANTOC
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_GiaoVien]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_GiaoVien] 
AS
BEGIN
    SELECT MaGiaoVien, TenGiaoVien, DiaChi, DienThoai, TenMonHoc 
	FROM dbo.GIAOVIEN, dbo.MONHOC
	WHERE dbo.GIAOVIEN.MaMonHoc = dbo.MONHOC.MaMonHoc
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_HocKy]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_HocKy]
AS
BEGIN
	SELECT * FROM HOCKY
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_HocSinh]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_HocSinh] 
AS
BEGIN
	SELECT MaHocSinh, HoTen, GioiTinh, NgaySinh, DiaChi, TenDanToc, TenTonGiao, HoTenCha, HoTenMe, anh_The 
	FROM HOCSINH HS, TONGIAO TG, DANTOC DT
	WHERE DT.MaDanToc =HS.MaDanToc AND TG.MaTonGiao = HS.MaTonGiao
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_KhoiLop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_KhoiLop] 
AS
BEGIN
	SELECT * FROM KHOILOP
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_LoaiNguoiDung]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LayDS_LoaiNguoiDung]
AS
BEGIN
    SELECT * FROM dbo.LOAINGUOIDUNG
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_Lop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_Lop]
AS
BEGIN
	SELECT MaLop, TenLop, TenKhoiLop, TenNamHoc, SiSo, TenGiaoVien 
	FROM LOP LH, NAMHOC NH, GIAOVIEN GV, KHOILOP KL
	WHERE LH.MaKhoiLop = KL.MaKhoiLop AND LH.MaGiaoVien = GV.MaGiaoVien
		AND NH.MaNamHoc=LH.MaNamHoc
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_MonHoc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_MonHoc] 
AS
BEGIN
    SELECT * FROM dbo.MONHOC
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_NamHoc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_NamHoc] 
AS
BEGIN
	SELECT * FROM NAMHOC
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_NguoiDung]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_NguoiDung]  
AS
BEGIN
	SELECT MaND, TenLoaiND, TenND, TenDNhap, MatKhau FROM NGUOIDUNG ND, LOAINGUOIDUNG LND
	WHERE ND.MaLoai=LND.MaLoai
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_PhanCong]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_PhanCong]
AS 
BEGIN
	SELECT STT, TenNamHoc, TenLop, TenMonHoc, TenGiaoVien FROM PHANCONG PC, LOP LH, MONHOC MH, GIAOVIEN GV, NAMHOC NH
	WHERE PC.MaNamHoc = NH.MaNamHoc AND LH.MaLop = PC.MaLop AND GV.MaGiaoVien = PC.MaGiaoVien AND MH.MaMonHoc = PC.MaMonHoc
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_TonGiao]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LayDS_TonGiao] 
AS
BEGIN
	SELECT * FROM dbo.TONGIAO
END;
GO
/****** Object:  StoredProcedure [dbo].[LayDS_ViPham]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayDS_ViPham]
AS
BEGIN
	SELECT  HS.MaHocSinh, HS.HoTen, LOP.TenLop, HK.TenHocKy, NH.TenNamHoc ,ngay_ViPham, noidung_ViPham,LOP.MaLop,HK.MaHocKy,NH.MaNamHoc
	FROM VI_PHAM VP, HOCSINH HS, NAMHOC NH, LOP, HOCKY HK
	WHERE NH.MaNamHoc=VP.ma_NamHoc AND HS.MaHocSinh=VP.ma_HocSinh AND LOP.MaLop=VP.ma_LopHoc AND HK.MaHocKy=VP.ma_HocKy
END;
GO
/****** Object:  StoredProcedure [dbo].[Loc_Lop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Loc_Lop]
	@ma_NamHoc varchar(6),
	@ma_KhoiLop varchar(6)
AS
BEGIN
	SELECT LH.MaLop, LH.TenLop FROM LOP LH, NAMHOC NH, KHOILOP KL
	WHERE LH.MaNamHoc = NH.MaNamHoc AND KL.MaKhoiLop = LH.MaKhoiLop
			AND LH.MaNamHoc = @ma_NamHoc AND KL.MaKhoiLop = @ma_KhoiLop

			--EXEC [dbo].[Loc_Lop] 'NH1920','KHOI12'
END;
GO
/****** Object:  StoredProcedure [dbo].[LocDS_HocSinh]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LocDS_HocSinh]
	
	@ma_Lop varchar(10)
AS
BEGIN
	SELECT HS.MaHocSinh, HS.HoTen FROM PHANLOP,HOCSINH HS
	WHERE MaLop=@ma_Lop AND HS.MaHocSinh=PHANLOP.MaHocSinh
		
END;
GO
/****** Object:  StoredProcedure [dbo].[LocDS_Lop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LocDS_Lop]
	@ma_Nam varchar(6),
	@ma_Khoi varchar(6),
	@ma_Lop varchar(10)
AS
BEGIN
	SELECT HS.MaHocSinh, HS.HoTen, PL.MaLop, HS.GioiTinh, HS.NgaySinh HS, DiaChi, DT.TenDanToc, TG.TenTonGiao  
	FROM PHANLOP PL, HOCSINH HS, TONGIAO TG, DANTOC DT
	WHERE HS.MaHocSinh = PL.MaHocSinh AND HS.MaDanToc = DT.MaDanToc AND HS.MaTonGiao = TG.MaTonGiao AND
		PL.MaNamHoc = @ma_Nam AND PL.MaKhoiLop = @ma_Khoi AND PL.MaLop = @ma_Lop
END;
GO
/****** Object:  StoredProcedure [dbo].[LocDS_ThongTinLop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LocDS_ThongTinLop]
	@ma_NamHoc varchar(6),
	@ma_KhoiLop varchar(6)
AS
BEGIN
	SELECT LH.MaLop, LH.TenLop, LH.SiSo, GV.TenGiaoVien FROM LOP LH, NAMHOC NH, KHOILOP KL, GIAOVIEN GV
	WHERE LH.MaNamHoc = NH.MaNamHoc AND KL.MaKhoiLop = LH.MaKhoiLop AND GV.MaGiaoVien = LH.MaGiaoVien
			AND LH.MaNamHoc = @ma_NamHoc AND KL.MaKhoiLop = @ma_KhoiLop

			--EXEC [dbo].[LocDS_ThongTinLop] 'NH1920','KHOI12'
END;
GO
/****** Object:  StoredProcedure [dbo].[Sua_MonHoc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sua_MonHoc]
    @ID varchar(6),
	@ten_MonHoc nvarchar(30),
	@so_TietHoc int,
	@heSo int
AS
BEGIN
	UPDATE MONHOC SET TenMonHoc = @ten_MonHoc, SoTiet = @so_TietHoc, HeSo = @heSo
	WHERE MaMonHoc = @ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_BangDiem]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_BangDiem]
	@ma_HocSinh varchar(6),
	@ma_NamHoc varchar(6),
	@ma_HocKy varchar(3),
	@ma_LopHoc varchar(10),
	@ma_MonHoc varchar(6)
AS
BEGIN
	INSERT INTO dbo.BANG_DIEM 
	VALUES (@ma_HocSinh, @ma_NamHoc, @ma_HocKy, @ma_LopHoc, @ma_MonHoc,0,0,0,0,0,0,0,0)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_DanToc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_DanToc] 
    @tenDanToc nvarchar(30) 
      
AS
BEGIN
	DECLARE @ID varchar(6)
	SET @ID = dbo.AUTO_MaDanToc()
	INSERT INTO DANTOC VALUES (@ID,@tenDanToc)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_GiaoVien]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_GiaoVien] 
    @ten_GiaoVien nvarchar(30),
	@diaChi_GiaoVien nvarchar(50),
	@dienthoai_GiaoVien varchar(15),
	@ma_MonHoc varchar(6), 
	@ten_DangNhap varchar(30),
	@matkhau_DangNhap varchar(30),
	@ma_Loai varchar(6)
AS
BEGIN
	DECLARE @ma_GiaoVien varchar(6), @ma_NguoiDung varchar(6)
	SET @ma_GiaoVien = dbo.AUTO_MaGiaoVien();
	SET @ma_NguoiDung = dbo.AUTO_MaNguoiDung();
	
	INSERT INTO GIAOVIEN VALUES (@ma_GiaoVien, @ten_GiaoVien, @diaChi_GiaoVien, @dienthoai_GiaoVien, @ma_MonHoc)
	INSERT INTO NGUOIDUNG VALUES (@ma_NguoiDung, @ma_Loai, @ten_GiaoVien, @ten_DangNhap, @matkhau_DangNhap)

END;
GO
/****** Object:  StoredProcedure [dbo].[Them_HocSinh]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_HocSinh] 
    @ten_HocSinh nvarchar(30),
	@gioiTinh bit,
	@ngaySinh date,
	@diaChi ntext,
	@ma_DanToc varchar(6),
	@ma_TonGiao varchar(6),
	@ten_Cha nvarchar(30),
	@ma_NgheCha varchar(6),
	@ten_Me nvarchar(30),
	@ma_NgheMe varchar(6),
	@ma_Khoi varchar(6),
	@ma_Lop varchar(10),
	@ma_Nam varchar(6),
	@img_Anhthe image
AS
BEGIN
	DECLARE @sisoLop int, @max int, @ID varchar(6)
	SET @sisoLop = (SELECT SiSo FROM LOP WHERE MaNamHoc = @ma_Nam AND MaLop = @ma_Lop AND MaKhoiLop = @ma_Khoi)
	SET @max = (SELECT SiSoCanDuoi FROM QUYDINH)
	SET @ID = dbo.AUTO_MaHocSinh()

	PRINT @sisoLop
	PRINT @max

	IF(@max > @sisoLop)
	BEGIN
		INSERT INTO HOCSINH VALUES (@ID, @ten_HocSinh, @gioiTinh, @ngaySinh, @ma_DanToc, @ma_TonGiao, 
									@ten_Cha, @ma_NgheCha, @ten_Me, @ma_NgheMe, @img_Anhthe, @diaChi)
		INSERT INTO PHANLOP VALUES (@ma_Nam, @ma_Khoi, @ma_Lop, @ID)
		PRINT N'Thêm thành công'
	END
	ELSE BEGIN
		PRINT N'Thêm không thành công. Sĩ số lớp đã đạt tối đa.'
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_Lop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_Lop]
    @ten_Lop nvarchar(30),
	@ma_KhoiLop varchar(6),
	@ma_NamHoc varchar(6),
	@ma_GiaoVien varchar(6)
AS
BEGIN
	DECLARE @ID varchar(10)	
	SET @ID = 'LOP' + SUBSTRING(@ten_Lop,1,2) + SUBSTRING(@ten_Lop,4,1) + SUBSTRING(@ma_NamHoc,3,4)
	INSERT INTO LOP VALUES(@ID, @ten_Lop, @ma_KhoiLop, @ma_NamHoc, 0, @ma_GiaoVien)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_MonHoc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_MonHoc]
    @ten_MonHoc nvarchar(30),
	@so_TietHoc int,
	@heSo int
AS
BEGIN
	DECLARE @ID varchar(6)
	SET @ID = [dbo].[AUTO_MaMonHoc]()
	INSERT INTO MONHOC VALUES (@ID, @ten_MonHoc, @so_TietHoc, @heSo)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_NamHoc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_NamHoc]
    @namHoc varchar(30)
AS
BEGIN
	DECLARE @ID varchar(6)
	SET @ID = 'NH' + SUBSTRING(@namHoc, 3, 2) + SUBSTRING(@namHoc, 8, 2)
	INSERT INTO NAMHOC VALUES (@ID,@namHoc)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_NguoiDung]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_NguoiDung]
    @ma_Loai varchar(6),
	@ten_NguoiDung nvarchar(30),
	@ten_DangNhap nvarchar(30),
	@matKhau varchar(30)
AS
BEGIN
	DECLARE @ID varchar(6)
	SET @ID = dbo.AUTO_MaNguoiDung()
	INSERT INTO dbo.NGUOIDUNG VALUES (@ID, @ma_Loai, @ten_NguoiDung, @ten_DangNhap, @matKhau)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_PhanCong]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_PhanCong]
    @maNamHoc varchar(6),
	@maLop varchar(10),
	@maMonHoc varchar(6),
	@maGiaoVien varchar(6)
AS
BEGIN
    INSERT INTO PHANCONG VALUES(@maNamHoc, @maLop, @maMonHoc, @maGiaoVien)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_PhanLop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_PhanLop]
	@maNam varchar(6),
	@maKhoi varchar(6),
	@maLop varchar(10),
	@maHocSinh varchar(6)
AS
BEGIN	
	INSERT INTO dbo.PHANLOP VALUES (@maNam, @maKhoi, @maLop, @maHocSinh)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_TonGiao]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_TonGiao]
    @tenTonGiao nvarchar(30) 
  
AS
BEGIN
	DECLARE @ID varchar(6)
	SET @ID = dbo.AUTO_MaTonGiao()
	INSERT INTO TONGIAO VALUES (@ID,@tenTonGiao)
END;
GO
/****** Object:  StoredProcedure [dbo].[Them_ViPham]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Them_ViPham]
    @ma_HocSinh varchar(6),
	@ma_NamHoc varchar(6),
	@ma_LopHoc varchar(10),
	@ma_HocKy varchar(3),
	@ngay_ViPham date,
	@noidung_ViPham ntext
AS
BEGIN
    INSERT INTO VI_PHAM VALUES(@ma_HocSinh, @ma_NamHoc, @ma_LopHoc, @ma_HocKy,@ngay_ViPham,@noidung_ViPham)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThongTinDangNhap]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongTinDangNhap] 
    @tenDangNhap varchar(30)
AS
BEGIN
	select * from dbo.NGUOIDUNG, dbo.LOAINGUOIDUNG
	where TenDNhap = @tenDangNhap
END;
GO
/****** Object:  StoredProcedure [dbo].[Tim_GiaoVien]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tim_GiaoVien]
    
	@ten_GiaoVien nvarchar(30)
AS
BEGIN	
	SELECT * FROM GIAOVIEN
	WHERE MaGiaoVien = @ten_GiaoVien OR TenGiaoVien = @ten_GiaoVien OR DiaChi = @ten_GiaoVien OR DienThoai = @ten_GiaoVien
END;
GO
/****** Object:  StoredProcedure [dbo].[Tim_HocSinh]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tim_HocSinh]
	@value nvarchar(30)
AS
BEGIN
	SELECT MaHocSinh, HoTen, GioiTinh, NgaySinh, DiaChi, TenDanToc, TenTonGiao, HoTenCha, HoTenMe, anh_The 
	FROM HOCSINH HS, TONGIAO TG, DANTOC DT
	WHERE DT.MaDanToc =HS.MaDanToc AND TG.MaTonGiao = HS.MaTonGiao 
	AND (MaHocSinh = @value OR HoTen = @value OR TenDanToc = @value OR TenTonGiao = @value)
END;
GO
/****** Object:  StoredProcedure [dbo].[Tim_LopHoc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tim_LopHoc]
	@value nvarchar(30)
AS
BEGIN
	SELECT MaLop, TenLop, TenKhoiLop, TenNamHoc, SiSo, TenGiaoVien 
	FROM LOP LH, NAMHOC NH, GIAOVIEN GV, KHOILOP KL
	WHERE LH.MaKhoiLop = KL.MaKhoiLop AND LH.MaGiaoVien = GV.MaGiaoVien AND NH.MaNamHoc=LH.MaNamHoc 
		AND (MaLop = @value OR TenLop = @value OR TenKhoiLop = @value 
		OR TenGiaoVien = @value OR TenNamHoc = @value)
END;
GO
/****** Object:  StoredProcedure [dbo].[Tim_NguoiDung]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tim_NguoiDung] 
    @value nvarchar(30)
AS
BEGIN
	SELECT MaND, TenLoaiND, TenND, TenDNhap, MatKhau FROM NGUOIDUNG ND, LOAINGUOIDUNG LND
	WHERE ND.MaLoai = LND.MaLoai AND (MaND = @value OR TenLoaiND = @value OR TenDNhap = @value OR TenND = @value)
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_DanToc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_DanToc] 
    @maDanToc varchar(6) 
AS
BEGIN
	DELETE FROM DANTOC WHERE MaDanToc = @maDanToc
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_GiaoVien]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_GiaoVien] 
    @maGiaoVien varchar(6) 
AS
BEGIN
	DELETE FROM GIAOVIEN WHERE MaGiaoVien = @maGiaoVien
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_Lop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_Lop] 
    @maLop varchar(10) 
AS
BEGIN
	DELETE FROM LOP WHERE MaLop = @maLop
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_MonHoc]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_MonHoc]
    @ID varchar(6)
AS
BEGIN
	DELETE MONHOC WHERE MaMonHoc = @ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_NguoiDung]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_NguoiDung]
	@ma_NguoiDung varchar(6)
AS
BEGIN
	DELETE dbo.NGUOIDUNG WHERE MaND = @ma_NguoiDung
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_PhanCong]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_PhanCong]
    @STT int
AS
BEGIN
    DELETE dbo.PHANCONG 
	WHERE STT = @STT
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_PhanLop]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_PhanLop]
	@maLop varchar(10),
	@maHocSinh varchar(6)
AS
BEGIN	
	DELETE dbo.PHANLOP WHERE MaLop = @maLop AND MaHocSinh = @maHocSinh
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_TonGiao]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_TonGiao] 
    @maTonGiao varchar(6) 
AS
BEGIN
	DELETE FROM TONGIAO WHERE MaTonGiao = @maTonGiao
END;
GO
/****** Object:  StoredProcedure [dbo].[Xoa_ViPham]    Script Date: 17/07/2020 14:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Xoa_ViPham] 
    @ma_HocSinh varchar(6) 
AS
BEGIN
	DELETE FROM VI_PHAM WHERE ma_HocSinh = @ma_HocSinh
END;
GO
