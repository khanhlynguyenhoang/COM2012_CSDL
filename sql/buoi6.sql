select honv, tennv, luong,tenphg,N.maphg
from nhanvien N, phongban P where N.maphg=P.maphg
--select t1.cột1, t2.cột2, ... tn.cột n
--from table1 as tên1 inner join table2 tên 2
--điều kiện: 2 bảng phải có cột giống nhau
--Sử dụng inner join hiển thị họ nv, tên nv, luong, tên phòng của bảng nhanvien và bảng phongban
select honv, tennv, luong, tenphg 
from nhanvien N inner join phongban P
on N.maphg=P.maphg
--Hiển thị những nv và tên dự án của những nhân viên đó đang làm
select * from duan,nhanvien
select honv,tennv,tenda 
from nhanvien N join  Quanly_Duan Q on N.manv=Q.manv
join Duan D on Q.mada=D.mada
--left join
select * from nhanvien n left join phongban p 
on n.maphg=p.maphg
--right join
select * from nhanvien n right join phongban p 
on n.maphg=p.maphg
--full join
select * from nhanvien n full join phongban p 
on n.maphg=p.maphg
select*from nhanvien,duan,phongban,Quanly_Duan
/*Sử dụng JOIN hoặc phép tích để hiển thị thông
tin của 3 bảng gồm: họ và tên nhân viên, lương,
tên phòng ban mà nhân viên thuộc về, tên dự
án, ngày bắt đầu tham gia vào sự án và số giờ đã
làm*/
select honv,tennv,luong,tenphg,tenda,ngaybatdau,So_gio
from nhanvien N join phongban P 
on N.maphg=P.maphg
join Quanly_Duan Q on N.manv=Q.manv
join duan D on Q.MaDA=D.MaDA
select*from Quanly_Duan
where tenphg=N'Phòng kỹ thuâtj' and ngaybatdau='2016-04-12'
--Hiển thị mức lương trung bình của nv
select avg(luong) from nhanvien
--Hiển thị những nhân viên có lương>lương trung bình
select*from nhanvien where luong> (select avg(luong) from nhanvien)
--Hiển thị những nv có lương> lương trung bình phòng 10
select avg(luong) from nhanvien 
group by maphg
having maphg=10
select*from nhanvien where luong > (select avg(luong) from nhanvien 
group by maphg
having maphg=10)
--chỉ  lấy ra các nhân viên đang làm dự án
select distinct  manv from Quanly_Duan
select*from nhanvien 
where manv<any(select distinct  manv from Quanly_Duan)
--lấy ra những nhân viên đang làm dự án
select*from nhanvien N
where exists (select manv from Quanly_Duan Q where N.manv=Q.manv)
--hiển thị những nv k làm dự án
select*from nhanvien N
where not exists (select manv from Quanly_Duan Q where N.manv=Q.manv)
