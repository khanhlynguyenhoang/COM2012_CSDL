--Bài 1
--a. Sử dụng câu lệnh INSERT để thêm dữ liệu các các bảng như sau:--Khách hàng
INSERT INTO KhachHang(MaKhachHang,hoVaTenLot,Ten,Diachi,Email,Dienthoai)
Values ('KH01',N'Nguyễn Thị',N'Nga',N'15 Quang Trung TP Đà Nẵng','ngant@gmail.com',N'0912345670')
INSERT INTO KhachHang(MaKhachHang,hoVaTenLot,Ten,Diachi,Email,Dienthoai)
Values ('KH02',N'Trần Công',N'Thành',N'234 Lê Lợi Quảng Nam','thanhtc@gmail.com',N'1610942344')
INSERT INTO KhachHang(MaKhachHang,hoVaTenLot,Ten,Diachi,Email,Dienthoai)
Values ('KH03',N'Lê Hoàng',N'Nam',N'23 Trần Phú TP Huế','namlt@gmail.com',N'08934556')
INSERT INTO KhachHang(MaKhachHang,hoVaTenLot,Ten,Diachi,Email,Dienthoai)
Values ('KH04',N'Vũ Ngọc',N'Hiền',N'37 Nguyễn Thị Thập TP Đà Nẵng','hienvn@gmail.com',N'0894545435')

alter table Sanpham 
alter COLUMN DonGia money;
--Sản Phẩm
INSERT INTO SanPham(maSanPham,moTa,soLuong,donGia,tenSP)
Values ('1',N'Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt','800','6600',N'Samsung Galaxy J7 Pro')
INSERT INTO SanPham(maSanPham,moTa,soLuong,donGia,tenSP)
Values ('2',N'iPhone 6 là một trong những smartphone được yêu thích nhất.Lắng nghe nhu cầu về thiết kế, khả
năng lưu trữ và giá cả','500','8990',N'Iphone 6 32 GB')
INSERT INTO SanPham(maSanPham,moTa,soLuong,donGia,tenSP)
Values ('3',N'Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)','570','11290',N'Laptop Dell Inspiron 3467')
INSERT INTO SanPham(maSanPham,moTa,soLuong,donGia,tenSP)
Values ('4',N'Pin sạc dự phòng Polymer 5.000 mAh eSaver JP85','600','200',N'Pin sạc dự phòng')
INSERT INTO SanPham(maSanPham,moTa,soLuong,donGia,tenSP)
Values ('5',N'Nokia 3100 phù hợp với SINH VIÊN','100','700',N'Nokia 3100')

--Hóa đơn
INSERT INTO HoaDon(maKhachHang,maHoaDon,NgayMuaHang,trangThai)
Values ('KH01','120954','2016-03-23',N'đã thanh toán')
INSERT INTO HoaDon(maKhachHang,maHoaDon,NgayMuaHang,trangThai)
Values ('KH02','120955','2016-04-2',N'đã thanh toán')
INSERT INTO HoaDon(maKhachHang,maHoaDon,NgayMuaHang,trangThai)
Values ('KH01','120956','2016-07-12',N'chưa thanh toán')
INSERT INTO HoaDon(maKhachHang,maHoaDon,NgayMuaHang,trangThai)
Values ('KH04','120957','2016-12-04',N'chưa thanh toán')

--Hóa đơn chi tiết
INSERT INTO HoaDonChiTiet(maHoaDonChiTiet,maHoaDon,maSanPham,soLuong)
Values ('17','120954','3','40')
INSERT INTO HoaDonChiTiet(maHoaDonChiTiet,maHoaDon,maSanPham,soLuong)
Values ('18','120954','1','20')
INSERT INTO HoaDonChiTiet(maHoaDonChiTiet,maHoaDon,maSanPham,soLuong)
Values ('19','120955','2','100')
INSERT INTO HoaDonChiTiet(maHoaDonChiTiet,maHoaDon,maSanPham,soLuong)
Values ('20','120956','4','6')
INSERT INTO HoaDonChiTiet(maHoaDonChiTiet,maHoaDon,maSanPham,soLuong)
Values ('21','120956','2','60')
INSERT INTO HoaDonChiTiet(maHoaDonChiTiet,maHoaDon,maSanPham,soLuong)
Values ('22','120956','1','10')
INSERT INTO HoaDonChiTiet(maHoaDonChiTiet,maHoaDon,maSanPham,soLuong)
Values ('23','120957','2','50')


--b. Tạo 1 bảng có tên KhachHangdaNang chứa thông tin tin đầy đủ về các khách
--hàng đến từ Đà Nẵng (sử dụng SELECT INTO)
SELECT * Into KhachHangDaNang
FROM KhachHang
WHERE diachi like N'%Đà Nẵng%'
SELECT * FROM KhachHangDaNang



--Bài 2
--a. Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH02’ có giá trị mới
--là ‘16267788989’
update KhachHang SET dienThoai = '162677889'
WHERE maKhachHang = 'KH02'

--b. Tăng số lượng mặt hàng có mã ‘3’ lên thêm ‘200’ đơn vị
UPDATE SanPham SET soLuong = soLuong + 200 
WHERE maSanPham = '3'

--c. Giảm giá cho tất cả sản phẩm giảm 5%
update SanPham SET donGia = donGia - donGia * 0.5

--d. Tăng số lượng của mặt hàng bán chạy nhất trong tháng 12/2016 lên 100 đơn vị
UPDATE SanPham SET Soluong= soluong + 100 
where maSanPham in(SELECT top 1 maSanPham FROM HoaDonChiTiet HDCT
INNER JOIN HoaDon HD
ON HD.maHoaDon=HDCT.maHoaDon
where YEAR(ngayMuaHang)='2016' and MONTH(ngayMuaHang)='12'
group by maSanPham
order by Sum(soLuong) desc)

--e. Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2016
update SanPham set donGia = donGia - donGia * 0.1
where maSanPham in(SELECT top 2 maSanPham FROM HoaDonChiTiet HDCT
INNER JOIN HoaDon HD
ON HD.maHoaDon=HDCT.maHoaDon
where YEAR(ngayMuaHang)='2016'
group by maSanPham
order by Sum(soLuong))


--f. Cập nhật lại trạng thái “đã thanh toán” cho hoá đơn có mã 120956
UPDATE HoaDon SET trangThai = N'chưa thanh toán'
where maHoaDon = '120956'

--g. Xoá mặt hàng có mã sản phẩm là ‘2’ ra khỏi hoá đơn ‘120956’ và trạng thái là
--chưa thanh toán.
delete from HoaDonChiTiet
where maSanPham='2' and maHoaDon in(select hdct.maHoaDon from HoaDonChiTiet hdct
inner join HoaDon hd
ON HD.maHoaDon=HDCT.maHoaDon
where hdct.maHoaDon='120956' and trangThai=N'chưa thanh toán' )

--h. Xoá khách hàng chưa từng mua hàng kể từ ngày “1-10-2016
delete from KhachHang where maKhachHang not in (select hd.maKhachHang from HoaDon hd
inner join KhachHang kh
on kh.maKhachHang=hd.maKhachHang
where ngayMuaHang >= '2016-12-20')