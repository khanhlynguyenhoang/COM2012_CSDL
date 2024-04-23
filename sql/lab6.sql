use QuanLyBanHang
--Bài 1
/*a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua*/
select H.mahoadon 'Mã hóa đơn', trangthai 'Trạng thái', masanpham 'Mã sản phẩm', soluong 'Số lượng', ngaymuahang  'Ngày mua hàng '
from hoadon H join HoaDonChiTiet C on H.maHoaDon=C.maHoaDon
/*b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với
điều kiện maKhachHang = ‘KH001’*/
select H.mahoadon 'Mã hóa đơn', makhachhang 'Mã khách hàng', trangthai 'Trạng thái', masanpham 'Mã sản phẩm',soluong 'Số lượng', ngaymuahang  'Ngày mua hàng '
from hoadon H
join HoaDonChiTiet C
on H.mahoadon=C.maHoaDon
where makhachhang= N'KH001'
/*c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột
sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành
tiền. Với thành tiền= donGia* soLuong*/
Select  H.mahoadon 'Mã hóa đơn', ngaymuahang 'Ngày mua hàng', tensp 'Tên sản phẩm', dongia ' Đơn giá', C.soluong 'Số lượng',
dongia*C.soluong 'Thành tiền'
from hoadon H
join hoadonchitiet C on H.maHoaDon=C.maHoaDon
join sanpham S on C.maSanPham=S.maSanPham


/*d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các
cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và
tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh
toán.*/
select hovatenlot + ' ' + ten 'Họ và tên khách hàng', email, dienthoai 'Điện thoại', H.mahoadon 'Mã hóa đơn',
trangthai 'Trạng thái',dongia*C.soluong 'Tổng tiền'
from hoadon H
join hoadonchitiet C on H.maHoaDon=C.maHoaDon
join khachhang K on H.maKhachHang=K.maKhachHang
join sanpham S on C.maSanPham=S.maSanPham
where trangthai like N'Chưa thanh toán'
/*e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần
của cột tổng tiền.*/
SELECT HD.maHoaDon, NgayMuaHang,SUM( HDCT.soLuong * DonGia) as 'Tổng Tiền'
FROM HoaDon HD
INNER JOIN HoaDonChiTiet HDCT
ON HD.MaHoaDon=HDCT.maHoaDon
INNER JOIN SanPham SP ON HDCT.maSanPham=SP.maSanPham
GROUP BY HD.maHoaDon, NgayMuaHang
HAVING SUM( HDCT.soLuong * DonGia) > 500
ORDER BY N'Tổng Tiền' DESC
--Bài 2
--a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
select*from khachhang
where makhachhang not in( select makhachhang from  hoadon where ngaymuahang >='2016-12-31')
--b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
SELECT HDCT.MaSanPham,SP.TenSP,COUNT(*) 'Lượt mua'
FROM HoaDonChiTiet HDCT
INNER JOIN HoaDon HD ON HDCT.MaHoaDon=HD.MaHoaDon
INNER JOIN SanPham SP ON SP.maSanPham=HDCT.maSanPham
WHERE NgayMuaHang like '2016-12%'
GROUP BY HDCT.MaSanPham,SP.TenSP
HAVING COUNT(*) >= ALL(SELECT COUNT(*)
FROM HoaDonChiTiet HDCT
INNER JOIN HoaDon HD ON HDCT.MaHoaDon=HD.MaHoaDon
WHERE NgayMuaHang like '2016-12%'
GROUP BY HDCT.MaSanPham)


--c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
SELECt Top 5 KH.*, SUM(HDCT.SoLuong * SP.DonGia) 'Tổng tiền'
FROM SanPham SP
 JOIN HoaDonChiTiet HDCT ON SP.MaSanPham=HDCT.maSanPham
 JOIN HoaDon HD ON HD.MaHoaDon=HDCT.MaHoaDon
 JOIN KhachHang KH ON KH.MaKhachHang=HD.MaKHachHang
WHERE YEAR(HD.NgayMuaHang)='2016'
GROUP BY KH.MaKhachHang, KH.Hovatenlot, KH.Ten, DiaChi,Email,DienThoai
ORDER BY N'Tổng tiền' desc

--d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên
--“Iphone 7 32GB” trong tháng 12/2016
SELECT KH.* FROM HoaDonChiTiet HDCT
JOIN SanPham SP on HDCT.MaSanPham=SP.MaSanPham
JOIN HoaDon HD On HD.MaHoaDon=HDCT.MaHoaDon
JOIN KhachHang KH ON KH.maKhachHang=HD.maKhachHang
where KH.DiaChi like N'%Đà Nẵng%' AND SP.tenSP like N'Iphone 7 32GB' and HD.ngayMuaHang like '2016-12%'


--e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản
--phẩm.
 SELECT sp.maSanPham,tensp, count(*) 'Lượt mua'
 from sanpham Sp
 join hoadonchitiet C on sp.maSanPham=C.maSanPham
 group by sp.masanpham,tensp
 having count(*) < (
	select avg(soLuong)
	from
	(select masanpham,
	count(*) as soluong
	from hoadonchitiet
	group by masanpham) as temp )
	--Bài thêm
	-- Hiển thị thông tin khách hàng có tổng tiền các hóa đơn > 1000000
SELECT kh.maKhachHang,kh.hoVaTenLot,  kh.Ten ,SUM(sp.donGia*hdct.soLuong) as'Tổng tiền'
FROM HoaDonChiTiet hdct
INNER JOIN HoaDon hd
ON hdct.maHoaDon=hd.maHoaDon
INNER JOIN KhachHang kh
ON kh.maKhachHang=hd.maKhachHang
INNER JOIN SanPham sp
ON sp.maSanPham = hdct.maSanPham
GROUP BY kh.maKhachHang,kh.hoVaTenLot,  kh.Ten
HAVING SUM(sp.donGia*hdct.soLuong) >1000000
-- Hiển thị thông tin khách hàng mua nhiều sản hơn 5 sản phẩm
SELECT kh.maKhachHang, hoVaTenLot+''+Ten as 'Hovaten', COUNT(sp.maSanPham)
FROM SanPham sp
INNER JOIN HoaDonChiTiet  hdct
ON sp.maSanPham=hdct.maSanPham
INNER JOIN HoaDon hd
ON hdct.maHoaDon=hd.maHoaDon
INNER JOIN KhachHang kh
ON kh.maKhachHang=hd.maKhachHang
GROUP BY kh.maKhachHang,  hoVaTenLot+''+Ten 
HAVING COUNT(sp.maSanPham) >5
-- Tìm những khách hàng mua sản phẩm nào trong ngày 15/6/2019 (có thể thay đổi để phù hợp với dữ liệu của mình)
SELECT * FROM HoaDon hd
INNER JOIN KhachHang kh
ON hd.maKhachHang=kh.maKhachHang
WHERE hd.ngayMuaHang LIKE '2020-01-12'


	