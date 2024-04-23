--Tạo bảng nhanvien2,từ bảng nhanvien có điều kiện là lương>1000
select* into nhanvien2 from nhanvien where luong>1000
select*from nhanvien2
--insert into tablename(cột1,cột2,..) 
--values('values1','values2')
--thêm 1 nhân viên vào bảng nhân viên
insert into nhanvien(honv,tennv,ngaysinh,diachi,gioitinh,luong,maphg)
values(N'Trịnh Vũ',N'Thu','1999-10-20',N'Hà Nam',N'Nữ', 760, 17)
--thêm nhiều nv
insert into nhanvien(honv,tennv,ngaysinh,diachi,gioitinh,luong,maphg)
values(N'Lê Thanh',N'Thúy','1996-8-22',N'Hà Nội',N'Nữ',1760,17),
(N'Nguyễn Anh',N'Quân','1996-12-2',N'Quảng Nam ',N'Nam',1500,17)
--update tableName set cột1='values',cột2='values',..
--where [ĐK]
--cập nhật lại thông tin ngày sinh của nhân viên trịnh vũ thu là 1997-9-20
update nhanvien set ngaysinh='1997-9-20' where honv=N'Trịnh Vũ' and tennv=N'Thu'
--tìm các nhân viên trong phòng kinh doanh
select manv from nhanvien N 
join phongban P on N.maphg=P.maphg
where tenphg like N'%Kinh doanh%'
select manv from nhanvien where maphg in (select maphg from phongban where tenphg like N'%Kinh doanh%')

--tăng lương cho những nhân viên trong phòng có tên 'Kinh doanh' lên 60$
update nhanvien set luong=luong+60 where manv in (select manv from nhanvien where maphg 
in (select maphg from phongban where tenphg like N'%Kinh doanh%'))
--delete from tablename where [đk]
--xóa nhân viên có mã số là 59
select*from nhanvien2
delete from nhanvien2 where (manv =59)
--Tìm những nhân viên đang làm trong dự án
select *from nhanvien where manv in(
select distinct  manv from Quanly_Duan)
--tìm những nv không làm dự án
select manv from nhanvien where manv not in(
select distinct  manv from Quanly_Duan)
--xóa tất những nv hiện tại không làm trong dự án nào
delete from nhanvien2 where manv in (select manv from nhanvien2 where manv not in(
select distinct  manv from Quanly_Duan))
--tăng lương cho nhân viên có tên Nguyễn Văn Anh lên 10%
update nhanvien set luong=luong*0.1 where (honv like N'%Nguyễn Văn' and tennv like N'Anh')
--Đổi 