-- Chú thích 1 dòng 
/*
Chú thích nhiều dòng 

*/
--Tạo CSDL
/*
Create database vidu
--Xóa CSDL
Drop database vidu

Tạo bảng 
create table tên bảng
(
Tên cột1 kiểudl[ràng buộc],
Tên cột 2 kiểudl .....,
....
+primary key: ràng buộc khóa chính
+not null: không được để trống
)


*/
--Tạo csdl qlns_it18321
create database qlns_it18321
go 
--Sử dụng csdl để làm việc
use qlns_it18321
go
create table Phongban
(
	MaPH char(5) primary key,
	TenPh nvarchar(100) Not null,
)
go
create table Nhanvien
(
	MaNV char(5),
	TenNV nvarchar(30),
	Tuoi int,
	Diachi nvarchar(50),
	MaPH char(5),
	--Tạo ràng buộc khóa chính
	constraint PK_Nhanvien primary key(MaNV),
	--Tạo ràng buộc khóa ngoại
	constraint FK_NV_PB foreign key(MaPH) references phongban(MaPH)
)
--Xóa bảng
drop table Nhanvien
--Thêm ràng buộc cho thuộc tính
Alter table Nhanvien
Add constraint CK_Tuoi check(Tuoi>=18)
--Xóa ràng buộc
Alter table Nhanvien
Drop constraint CK_Tuoi
--Thêm ràng buộc khóa ngoại
Alter table Nhanvien
Add constraint FK_NV_PB foreign Key(MaPH) references Phongban(MaPH)
--Thay đổi kiểu dữ liệu của thuộc tính 
Alter table Nhanvien
Alter Column TenNV nvarchar(40)
--Thêm cột vào bảng 
Alter table Phongban
Add MatruongPH char(5)
--Xóa cột trong bảng
Alter table Phongban
Drop column MatruongPh
--Ràng buộc duy nhất cho thuộc tính
Alter table Phongban
Add constraint uq_tenPh unique(TenPH)
--Thêm dữ liệu : Insert Into Tên bảng(tên cột 1, tên cột2,...)
--Values('giá trị',...)
--Thêm dữ liệu cho bảng phòng ban
Insert into phongban(MaPH,TenPh) values('PH001',N'Phòng công nghệ');
Insert into phongban(MaPH,TenPh) values('PH002',N'Phòng kinh doanh');
--Xem dữ liệu
select*from Phongban
--Thêm nhana viên
Insert into Nhanvien (maNV,tennv,tuoi,diachi,maph)
values('NV001',N'Nguyễn',17,N'Hà Nội','PH001');
Insert into Nhanvien (maNV,tennv,tuoi,diachi,maph)
values('NV002',N'Hoàng',18,N'Hà Nội','PH001');
Insert into Nhanvien (maNV,tennv,tuoi,diachi,maph)
values('NV003',N'Khánh',19,N'Hà Nội','PH001');
Insert into Nhanvien (maNV,tennv,tuoi,diachi,maph)
values('NV004',N'Ly',20,N'Hà Nội','PH001')
