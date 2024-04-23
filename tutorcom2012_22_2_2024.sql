create database PTPM_COM2012_PH40263
go
use  PTPM_COM2012_PH40263
go
create table SanPham(
	MaSP varchar(5) primary key,
	TenSP nvarchar(100) not null,
	LoaiSP nvarchar(100),
	GiaBan float not null
)
go
create table Kho(
	MaKho varchar(5) primary key,
	DiaDiem nvarchar(100) not null
)
go
create table NhapHang(
	MaNhapHang varchar(5) primary key,
	MaKho varchar(5) not null,
	NgayNhap date not null
	foreign key (MaKho) references Kho(MaKho)
)
go
create table NhapHangChiTiet(
	MaNhapHang varchar(5) ,
	MaSP varchar(5) ,
	GiaNhap float not null,
	SoLuong int not null,
	primary key (MaNhapHang,MaSP),
	foreign key (MaNhapHang) references NhapHang(MaNhapHang),
	foreign key (MaSP) references SanPham(MaSP)
)
go
INSERT INTO SanPham (MaSP,TenSP,LoaiSP,GiaBan)
VALUES('S23','Galaxy S23','Android',12100000),
('IP14','IPhone 14 ','IPhone',18450000),
('IP15','IPhone 15 ','IPhone',21690000)
GO
INSERT INTO Kho (MaKho,DiaDiem)
VALUES('XD',N'Số 190 Xã Đàn'),
('TH',N' 216 Thái Hà'),
('HTM',N' 46 Hồ Tùng Mậu')
go
INSERT INTO NhapHang (MaNhapHang,MaKho,NgayNhap)
VALUES('1','XD','2024-02-15'),
('2','HTM','2024-02-16'),
('3','TH','2024-02-17')
INSERT INTO NhapHang (MaNhapHang,MaKho,NgayNhap)
VALUES('4','XD','2024-03-15')
go
INSERT INTO NhapHangChiTiet (MaNhapHang,MaSP,GiaNhap,SoLuong)
VALUES('1','S23',11190000,20),
('1','IP14 ',18050000,-5),
('2','IP15',21290000,40),
('3','IP14',18150000,30)
SELECT * FROM NhapHangChiTiet
-- Hiển thị danh sách sản phẩm gồm: Mã, Tên, Giá bán
SELECT MaSP,TenSP,GiaBan FROM SanPham
-- Hiển thị danh sách các đợt nhập hàng trong tháng 2/2024
SELECT * FROM NhapHang
WHERE MONTH(NgayNhap) = 02
-- Viết câu lệnh cập nhập giá bán của một sản phẩm theo mã
UPDATE SanPham SET GiaBan = 18450000
WHERE MaSP = 'S23'
SELECT * FROM SanPham
-- Viết câu lệnh xóa các bản ghi nhập hàng chi tiết có số lượng nhỏ hơn 0
DELETE FROM NhapHangChiTiet
WHERE SoLuong < 0
SELECT * FROM NhapHangChiTiet
--Hiển thị danh sách các mặt hàng nhập về của một đơn nhập hàng có mã cho trước, 
--các trường cần lấy về: Tên Sản phẩm, Số lượng, Giá Nhập
SELECT SP.TenSP, NHCT.SoLuong , NHCT.SoLuong FROM NhapHangChiTiet NHCT
INNER JOIN SanPham SP ON SP.MaSP = NHCT.MaSP
WHERE NHCT.MaNhapHang = 1
-- Thống kế tổng số tiền nhập hàng của các sản phẩm thuộc loại IPHONE tại mỗi địa điểm kho trong tháng 2, 
-- sắp xếp theo thứ tự giảm dần của tổng số tiền nhập
SELECT Kho.DiaDiem, NH.NgayNhap ,
       SUM(NHCT.GiaNhap * NHCT.SoLuong) AS TongTienNhap 
FROM NhapHangChiTiet NHCT
INNER JOIN SanPham SP ON SP.MaSP = NHCT.MaSP
INNER JOIN NhapHang NH ON NH.MaNhapHang = NHCT.MaNhapHang
INNER JOIN Kho ON NH.MaKho = Kho.MaKho
WHERE MONTH(NgayNhap) = 2 AND SP.LoaiSP = 'IPhone'
GROUP BY Kho.DiaDiem,NH.NgayNhap
ORDER BY TongTienNhap DESC;