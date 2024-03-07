USE master
GO
-- Drop the database if it already exists
IF  EXISTS (SELECT name FROM sys.databases WHERE name = 'Code_Data_N6')
	DROP DATABASE Code_Data_N6
GO
CREATE DATABASE Code_Data_N6
GO
USE Code_Data_N6
GO
CREATE TABLE NhanVien(
	MaNV int IDENTITY(1001,1) PRIMARY KEY,
    TenNV NVARCHAR(255),
	GioiTinh NVARCHAR(6),
    NgaySinh DATE,
	SoDienThoai CHAR(12),
    DiaChi NVARCHAR(255),
    Email NVARCHAR(255),
    ChucVu NVARCHAR(50)
)
INSERT INTO NhanVien
VALUES (N'Nguyễn Hữu Đức', N'Nam', '2003-12-29', '0987654321', N'Hà Nội', 'duc@gmail.com', N'Bác sĩ'),
		(N'Trần Thị Dung', N'Nữ', '1996-05-12', '0963852741', N'Hà Nam', 'dung@gmail.com', N'Phó giám đốc'),
		(N'Lê Ngọc Anh', N'Nam', '2000-01-01', '0369258147', N'TP. Hồ Chí Minh', 'anh@gmail.com', N'Điều dưỡng');

CREATE TABLE VatTu(
	MaVT int IDENTITY(2001,1) PRIMARY KEY,
    TenVatTu NVARCHAR(255),
	NgayNhap DATE,
    DonViTinh NVARCHAR(10),
    TenThuongHieu NVARCHAR(255),
    NhaCungCap NVARCHAR(255),
    SoLo INT,
    GiaTien float,
	MaNV INT,
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
INSERT INTO VatTu
VALUES (N'Kim tiêm', '2023-1-1', N'Cái', N'Bình Minh', N'Hồng Hà', 9001, 25000, 1001),
		(N'Gạc phẫu thuật', '2023-6-15', N'Gói', N'Tiên Sa', N'Thái Hà', 9003, 50000, 1002),
		(N'Ống đựng', '2023-12-1', N'Cái', N'Hồng Ngọc', N'Thu Cúc', 9002, 100000, 1003);

CREATE TABLE KhachHang(
	MaKH int IDENTITY(3001,1) PRIMARY KEY,
    TenKH NVARCHAR(255),
	GioiTinh NVARCHAR(6),
    DiaChi NVARCHAR(255),
	SoDienThoai CHAR(12),
	MaVT INT,
    FOREIGN KEY (MaVT) REFERENCES VatTu(MaVT)
)
INSERT INTO KhachHang
VALUES (N'Lê Văn Thắng', N'Nam', N'Hà Giang', '0321654987', 2001),
		(N'Lý Thu Phương', N'Nữ', N'Thừa Thiên Huế', '0321456789', 2002),
		(N'Phạm Minh Quang', N'Nữ', N'Bình Dương', '0325698714', 2003);

CREATE TABLE TaiKhoan(
	TenDangNhap char(10) primary key,
	MatKhau char(10),
	MaNV INT,
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
INSERT INTO TaiKhoan
VALUES ('duc', 'ducnhom6', 1001),
		('dung', 'dungnhom6', 1002),
		('duong', 'duongnhom6', 1003);

CREATE TABLE ThongKe(
	VatTuID int primary key,
    NgayXuLy date,
    SoLuongNhap int,
    SoLuongXuat int
)
INSERT INTO ThongKe
VALUES (2001, '2022-12-10', 10, 5),
		(2002, '2023-12-15', 20, 4),
		(2003, '2023-11-29', 47, 14);

CREATE TABLE PhongBan(
	MaPB int IDENTITY(10001,1) PRIMARY KEY,
    TenPB NVARCHAR(255),
    TenVatTu NVARCHAR(255),
	SoLuongMuon int,
	NgayMuon datetime,
	NgayTra datetime,
	TrangThai NVARCHAR(255)
)
select * from NhanVien
select * from KhachHang
select * from VatTu
select * from PhongBan
select * from ThongKe