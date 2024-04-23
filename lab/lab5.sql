use QuanLyBanHang
--bài 1
--a,tất cả thông tin khách hàng
select*from khachhang
-- b,Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã
--khách hàng, họ và tên, email, số điện thoại
select top 10 makhachhang,hovatenlot+' '+ten 'Họ và tên',email,dienthoai from khachhang
--c,Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm,
--tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select masanpham ' Mã sản phẩm',tensp 'Tên sản phẩm',dongia*soluong as 'Tổng tiền tồn kho' from sanpham
/*d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột:
maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột
hoVaTenLot và Ten*/
select makhachhang ' Mã khách hàng', hovatenlot + ' ' + ten 'Họ và tên', diachi 'Địa chỉ' 
from khachhang where ten like N'H%'
/*e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng*/
select*from khachhang where diachi like N'%Đà Nẵng'
/*f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.*/
select*from sanpham where soluong between 100 and 500
/*g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng
trong năm 2016*/
select*from hoadon where trangthai like N'chưa thanh toán' and year(ngaymuahang) ='2016'
/*h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003,
KH006*/
select*from hoadon  where makhachhang='KH001' or  makhachhang= 'KH003' 
or   makhachhang= 'KH006'
--Bài 2
--a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(*) from khachhang 
--b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(dongia) from sanpham
--c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(soluong) from sanpham
--d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(soluong) from sanpham
--e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select*from hoadon where ngaymuahang between '2016-12-1' and '2016-12-31' and trangthai=N'chưa thanh toán'
--f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select mahoadon ' Mã hóa đơn', sum(soluong) 'Số loại sản phẩm' from hoadonchitiet don
group by mahoadon
--g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu
--chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select mahoadon ' Mã hóa đơn', sum(soluong) 'Số loại sản phẩm' from hoadonchitiet 
group by mahoadon
having sum(soluong)>=5
--h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang,
--maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select mahoadon 'Mã hóa đơn', ngaymuahang 'Ngày mua hàng', makhachhang 'Mã khách hàng'
from hoadon 
order by ngaymuahang desc
--bài thêm
-- hãy tính số lượng mua của từng sản phẩm
select masanpham 'Mã sản phẩm', sum(soluong) 'Số lượng'
from hoadonchitiet
group by masanpham
--Kiểm tra xem sản phẩm nào có nhiều người mua nhất
select top 1 masanpham 'Mã sản phẩm', sum(soluong) 'Số lượng'
from hoadonchitiet
group by masanpham
order by sum(soluong) desc

-- Kiểm tra xem hóa đơn nào mua nhiều sản phẩm nhất

select top 1 mahoadon 'mã hóa đơn', sum(soluong) 'Số lượng'
from hoadonchitiet
group by mahoadon
order by sum(soluong) desc