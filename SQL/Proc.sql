USE [QLHocSinhTHPT]
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_GiaoVien]    Script Date: 08/07/2020 15:00:15 ******/
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

CREATE PROCEDURE [dbo].[CapNhat_MatKhau] 
    @ten_DangNhap varchar(30),
	@matKhau_Moi varchar(30)
AS
BEGIN    
	UPDATE dbo.NGUOIDUNG SET MatKhau=@matKhau_Moi WHERE TenDNhap = @ten_DangNhap
END;
GO

CREATE PROCEDURE [dbo].[Lay_HocKy]
AS
BEGIN
	SELECT * FROM HOCKY
END;
GO

CREATE PROCEDURE [dbo].[Lay_KhoiLop] 
AS
BEGIN
	SELECT * FROM KHOILOP
END;
GO

CREATE PROCEDURE [dbo].[Lay_NamHoc] 
AS
BEGIN
	SELECT * FROM NAMHOC
END;
Go

CREATE PROCEDURE [dbo].[LayDS_GiaoVien] 
AS
BEGIN
    SELECT MaGiaoVien, TenGiaoVien, DiaChi, DienThoai, TenMonHoc 
	FROM dbo.GIAOVIEN, dbo.MONHOC
	WHERE dbo.GIAOVIEN.MaMonHoc = dbo.MONHOC.MaMonHoc
END;
GO

CREATE PROCEDURE [dbo].[LayDS_LoaiNguoiDung]
AS
BEGIN
    SELECT * FROM dbo.LOAINGUOIDUNG
END;
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

CREATE PROCEDURE [dbo].[LayDS_MonHoc] 
AS
BEGIN
    SELECT * FROM dbo.MONHOC
END;
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

CREATE PROCEDURE [dbo].[Them_Lop]
    @ten_Lop nvarchar(30),
	@ma_KhoiLop varchar(6),
	@ma_NamHoc varchar(6),
	@siSo int,
	@ma_GiaoVien varchar(6)
AS
BEGIN
	DECLARE @ID varchar(10)	
	SET @ID = 'LOP' + SUBSTRING(@ten_Lop,1,2) + SUBSTRING(@ten_Lop,4,1) + SUBSTRING(@ma_NamHoc,3,4)
	INSERT INTO LOP VALUES(@ID, @ten_Lop, @ma_KhoiLop, @ma_NamHoc, @siSo, @ma_GiaoVien)
END;
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

CREATE PROCEDURE [dbo].[ThongTinDangNhap] 
    @tenDangNhap varchar(30)
AS
BEGIN
	select * from dbo.NGUOIDUNG, dbo.LOAINGUOIDUNG
	where TenDNhap = @tenDangNhap
END;
GO

CREATE PROCEDURE [dbo].[Tim_GiaoVien]
    
	@ten_GiaoVien nvarchar(30)
AS
BEGIN	
	SELECT * FROM GIAOVIEN
	WHERE MaGiaoVien = @ten_GiaoVien OR TenGiaoVien = @ten_GiaoVien OR DiaChi = @ten_GiaoVien OR DienThoai = @ten_GiaoVien
END;
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

CREATE PROCEDURE [dbo].[Xoa_GiaoVien] 
    @maGiaoVien varchar(6) 
AS
BEGIN
	DELETE FROM GIAOVIEN WHERE MaGiaoVien = @maGiaoVien
END;
GO
