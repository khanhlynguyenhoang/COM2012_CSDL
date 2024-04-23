use QuanLyBanHang
--bài1
--a. Sử dụng câu lệnh INSERT để thêm dữ liệu các các bảng như sau:
insert into khachhang (maKhachHang,hoVaTenLot,Ten,Diachi,Email,Dienthoai)
values('KH001',N'Nguyễn Thị ',N'Nga',N'15 Quang Trung TP Đà Nẵng','ngant@gamil.com',0912345670),
('KH002',N'Trần Công ',N' Thành',N' 234 Lê Lợi Quảng Nam','thanhtc@gmail.com',16109423443),
('KH003',N'Lê Hoàng ',N' Nam',N'23 Trần Phú TP Huế','namlt@yahoo.com 0989354556',0989354556),
('KH004',N'Vũ Ngọc ',N' Hiền',N'37 Nguyễn Thị Thập TP Đà Nẵng','hienvn@gmail.com ',0894545435)
 
 select*from khachhang
 insert into sanpham (maSanPham,moTa,soLuong,donGia,tenSP)
 values(1,N'Samsung Galaxy J7 Pro là một chiếc
smartphone phù hợp với những người
yêu thích một sản phẩm pin tốt, thích
hệ điều hành mới cùng những tính
năng đi kèm độc quyền',800,'6.600.000','Samsung Galaxy J7 Pro'),
(2,N'iPhone 6 là một trong những
smartphone được yêu thích nhất.
Lắng nghe nhu cầu về thiết kế, khả
năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối
chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot"',
500,'8.990.000','iPhone 6 32GB'),
(3,N'Dell Inspiron 3467 i3
7100U/4GB/1TB/Win10/(M20NR21)',507,' 11.290.000','Laptop Dell
Inspiron 3467'),
(4,N'Pin sạc dự phòng Polymer 5.000
mAh eSaver JP85',600,'200.000',N'Pin sạc dự+
phòng'),
(5,N'Nokia 3100 phù hợp với SINH VIÊN',100,'700.000','Nokia 3100')
select*from sanpham

insert into hoadon(maKhachHang,maHoaDon,ngayMuaHang,trangThai)
values('KH001',120954, '03-23-2016', N'Đã thanh toán'),
('KH002', 120955, '04-02-2016' ,N'Đã thanh toán'),
('KH001',120956, '07-12-2016', N'chưa thanh toán'),
('KH004', 125957, '12-04-2016', N'chưa thanh toán')

insert into HoaDonChiTiet(maHoaDonChiTiet,maHoaDon,maSanPham,soLuong)
values (1, 120954, 3 ,40),
(2, 120954, 1, 20),
(3,120955, 2 ,100),
(4, 120956, 4 ,6),
(5, 120956, 2 ,60),
(6, 120956, 1 ,10),
(7, 125957, 2 ,50)
--b. Tạo 1 bảng có tên KhachHang_daNang chứa thông tin tin đầy đủ về các khách hàng đến từ Đà Nẵng (sử dụng SELECT INTO)
create table khachhang_danang (
	makhachhang nvarchar(5) primary key,
	hovatenlot nvarchar(50),
	ten nvarchar(25),
	diachi nvarchar(100),
	email varchar(25),
	dienthoai char (14)
);
insert into khachhang_danang
select* from khachhang
where khachhang.Diachi like N'%Đà Nẵng%'

--Bài 2
--a. Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới là ‘16267788989’
update khachhang set dienthoai=16267788989 where maKhachHang='KH002'
--b. Tăng số lượng mặt hàng có mã ‘3’ lên thêm ‘200’ đơn vị
update sanpham set soluong=soluong+200 where masanpham=3
--c. Giảm giá cho tất cả sản phẩm giảm 5%
update sanpham set donGia=donGia - donGia*0.05
--d. Tăng số lượng của mặt hàng bán chạy nhất trong tháng 12/2016 lên 100 đơn vị

update sanpham set soluong=soluong+100 where masanpham in 
(select top 1 maSanPham from HoaDon
join HoaDonChiTiet on HoaDon.maHoaDon=HoaDonChiTiet.maHoaDon
where year(ngayMuaHang)=2016 and month(ngayMuaHang)=12
group by maSanPham
order by sum(soluong) desc )
--e. Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2016
update sanpham set donGia=donGia*0.9  where masanpham in 
(select top 2 maSanPham from HoaDon
join HoaDonChiTiet on HoaDon.maHoaDon=HoaDonChiTiet.maHoaDon
where year(ngayMuaHang)=2016 
group by maSanPham
order by sum(soluong) )
--f. Cập nhật lại trạng thái “đã thanh toán” cho hoá đơn có mã 120956
update hoadon set trangthai = N'đã thanh toán' where maHoaDon=120956
--g. Xoá mặt hàng có mã sản phẩm là ‘2’ ra khỏi hoá đơn ‘120956’ và trạng thái là chưa thanh toán.
delete from HoaDonChiTiet where masanpham=2 
and maHoaDon in 
(select maHoaDon from HoaDon where maHoaDon=120956 and trangthai=N'chưa thanh toán')
--h. Xoá khách hàng chưa từng mua hàng kể từ ngày “1-1-2016”

delete from khachhang
where makhachhang not in (select maKhachHang from hoadon where ngayMuaHang >= '2016-01-01')
