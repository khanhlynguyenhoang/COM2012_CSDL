/*DATABASE banhang
Các bảng
Hanghoa(MaHH, TenHH, Dongia, Soluong, Mota)
Khachhang(MaKH, Hoten, Diachi)
Hoadon(MaKH, MaHH, Soluong, Thanhtien)
1. tạo database
2. Tạo cấu trúc bảng và mối quan hệ giữa các bảng
3. Thêm dữ liệu cho các bảng (3 bản ghi)
4. Hiển thị dữ liệu bảng hàng hóa
5. Hiển thị dữ liệu khách hàng có địa chỉ hà Nội
6. Cập nhật dữ liệu cho khách hàng KH003 có Hoten là Nguyễn Văn Đông
7. Hiển thị những khách hàng đã từng mua hàng
8. Xóa dữ liệu những khách hàng chưa mua hàng lần nào*/
create database banhang
go
use banhang
create table hanghoa(
	mahh varchar(5) primary key not null,
	tenhh nvarchar(100) not null,
	dongia float not null,
	soluong int not null,
	mota nvarchar(250) not null,
)
create table khachhang(
	makh varchar(5) primary key not null,
	hoten nvarchar(100) not null,
	diachi nvarchar(200) not null,
)
create table hoadon(
	makh varchar(5),
	mahh varchar(5),
	soluong int not null,
	
	constraint PK_hoadon primary key(makh,mahh),
	constraint FK_HD_KH  foreign key (makh) references khachhang(makh),
	constraint FK_HD_HH foreign key (mahh) references hanghoa(mahh),

)
go 

go
insert into hanghoa(mahh,tenhh,dongia,soluong,mota)
values('HH001',N'Hàng hóa 1','20.000',70,N'gjsahfgkgfksads'),
('HH002',N'Hàng hóa 2','30.000',80,N'gjsahfgkgfksads'),
('HH003',N'Hàng hóa 3','40.000',90,N'gjsahfgkgfksads')
go
insert into khachhang(makh,hoten,diachi)
values('KH001',N'Nguyễn Ly',N'Hà Nội'),
('KH002',N'Vũ Hiếu',N'Hà Nội'),
('KH003',N'Nguyễn Linh',N'Bắc Ninh')
go
insert into hoadon(makh,mahh,soluong)
values('KH001','HH001',40),
('KH002','HH002',50,),
('KH003','HH003',90,)
--5. Hiển thị dữ liệu khách hàng có địa chỉ hà Nội
select*from khachhang where diachi like N'%Hà Nội%'
--6.Cập nhật dữ liệu cho khách hàng KH003 có Hoten là Nguyễn Văn Đông
update khachhang set hoten= N'Nguyễn Văn Đông' 
where makh='KH003'
--7. Hiển thị những khách hàng đã từng mua hàng

select * from khachhang where makh in 
(select khachhang.makh from khachhang
join hoadon on hoadon.makh=khachhang.makh)
--cách 2
select* from khachhang where makh in 
(select makh from hoadon)
--8. Xóa dữ liệu những khách hàng chưa mua hàng lần nào
delete from khachhang where makh not in 
(select khachhang.makh from khachhang
join hoadon on hoadon.makh=khachhang.makh)
--hiển thị những cột tenkh,tenhh,soluongmua,dongia,thanhtien 
select hoten,tenhh, hoadon.soluong,dongia, hoadon.soluong*dongia 'Thành tiền'
from hoadon
join khachhang on khachhang.makh=hoadon.makh
join hanghoa on hanghoa.mahh=hoadon.mahh
