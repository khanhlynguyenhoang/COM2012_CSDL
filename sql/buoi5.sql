--Lấy ra toàn bộ bảng nhân viên
select * from Nhanvien
-- select cột1, cột2,... from tên_bảng
--lấy ra họ và tên, lương của nhân viên
select honv,tennv,luong from nhanvien
-- distinct để loại bỏ những dòng dữ liệu giống nhau
select distinct tennv from nhanvien
--top [number, percent] lấy ra số lượng dòng theo number hoặc percent
select top 5 * from nhanvien
select top 5 percent *from nhanvien
select *from phongban
select tenda, ngaybatdau,ngayketthuc from Duan
-- thay đổi tên hiển thị
select tennv as 'tên nhân viên', luong 'lương' from nhanvien
-- nối nhiều cột bằng toán tử +
select honv+ ' ' +tennv 'họ và tên', luong from nhanvien
-- select * from tablename where [condition]
-- toán tử so sánh: >;<;>=;<=,<>
--lấy ra những nhân viên có lương lơns hơn 200
select*from nhanvien where luong>2000
--lấy ra những nhân viên có lương nhỏơn 2000
select*from nhanvien where luong<2000
-- toán tử logic: and, or, not in
--nv có lương >2000 và mã ph 10
select*from nhanvien where luong>2000 and maphg=10
--nv có lương >2000 hoặc họ ở phongf  10
select*from nhanvien where luong>2000 or maphg=10
--nv không ở phongf 10 
select*from nhanvien where maphg not in (10)
-- lấy ra những nv ở p10 và p8
select * from nhanvien where maphg in(10,8)
-- between ... and... nằm trong khoảng
--lấy những nv có lương từ 1000-2000
select*from nhanvien where luong between 1000 and 2000
-- từ khóa like
-- tìm những nv có họ Văn
select*from nhanvien where honv like N'%văn'
select honv,tennv from nhanvien where luong>800
select honv,tennv from nhanvien where luong between 800 and 1000
select*from duan where ngaybatdau>='2017-01-01'
select*from duan
select*from phongban where tenphg like N'%sản xuất'
select honv,tennv,luong from nhanvien where luong<800 and maphg='Pb002'
select*from nhanvien
--tìm lương cao nhất của  nv
select max(luong) ' lương cao nhất' from nhanvien
--tìm lương thấp nhất
select min(luong) ' lương' from nhanvien
-- tìm lương trung bình
select avg(luong) ' lương trung bình' from nhanvien
-- đếm số nhân viên trong cty
select count(*) 'số lượng nhân viên' from nhanvien
select*from nhanvien
--đếm mỗi phòng có bn nhan viên
select maphg, count(manv) 'số lượng nhân viên' from nhanvien group by maphg
--tìm lương trung bình của mỗi phòng
select avg(luong) ' trung bình lương', maphg  from nhanvien group by maphg
--lấy ra những phong ban có lương trung bình >1000
select avg(luong) ' trung bình lương', maphg  from nhanvien group by maphg
having avg(luong)>1000
--sắp xếp nhân viên theo tên nhân viên
select*from nhanvien order by tennv desc
--sx tiến: asc lùi:desc
select*from nhanvien order by luong desc