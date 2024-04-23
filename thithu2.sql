create database qlsv
use qlsv
create table sinhvien(
	masv varchar(5) not null primary key,
	hoten nvarchar(100) not null,
	ngaysinh date not null,
	gioitinh nvarchar(5),
	diachi nvarchar(50)
)
create table monhoc(
	mamh varchar(5) not null primary key,
	tenmonhoc nvarchar(100) not null,
	sotinchi int not null
)
create table diem(
	masv varchar(5),
	mamh varchar(5),
	diemthi int,
	constraint PK_diem primary key(masv,mamh),
	constraint FK_diem_sinhvien foreign key (masv) references sinhvien(masv),
	constraint FK_diem_monhoc foreign key (mamh) references monhoc(mamh)
	
)
create table diachi(
	madc varchar(5) primary key not null,
	ten nvarchar(100)
)
go
insert into sinhvien(masv,hoten,ngaysinh,gioitinh,diachi)
values('DL001',N'Trần Văn A','1998-11-12',N'Nam',1),
('LT001',N'Lê Thị B','1999-12-22',N'Nữ',2)
go
insert into monhoc(mamh,tenmonhoc,sotinchi)
values('SQL',N'Cơ sở dữ liệu SQL Server',3),
('XML',N'Ngôn ngữ đánh dấu mở rộng',4)
go
insert into diem(masv,mamh,diemthi)
values('DL001','SQL',8),
('DL001','XML',7),
('LT001','SQL',4)
go 
insert into diachi(madc,ten)
values('DC001',N'Hà Nội'),
('DC002',N'Hải Phòng'),
('DC003',N'Nam Định')
--2.Hiển thị thông tin sinh viên gồm: Masv, hoten, ngaysinh, gioitinh, tuổi, dịa chỉ. 
select masv,hoten,ngaysinh,gioitinh, 2023-year(ngaysinh) 'Tuổi',diachi
from sinhvien
--3.Hiển thị thông tin: Masv, hoten , Mamh và có điểm thi >=5
select sinhvien.masv,hoten,monhoc.mamh from sinhvien 
join diem on sinhvien.masv=diem.masv
join monhoc on monhoc.mamh=diem.mamh
where diemthi>=5
--: Hiển thị thông tin Masv, hoten và ĐTB của các sinh viên. 
--Trong đó ĐTB = (điểm thi  * Số tín chỉ)/tổng số tín chỉ.
select diem.masv, hoten, (diemthi * sotinchi)/sum(sotinchi) 'ĐTB'
from sinhvien
join diem on sinhvien.masv=diem.masv
join monhoc on monhoc.mamh=diem.mamh
group by diem.masv,hoten,sotinchi,diemthi
--Hiển thị thông tin Masv, hoten, Tuổi , địa chỉ của sinh viên. 
--Chỉ hiển thị  những sinh viên có tuổi lớn hơn 19 tuổi
select masv,hoten, 2023-year(ngaysinh) 'Tuổi',diachi
from sinhvien
where 2023-year(ngaysinh)>19
--: Chèn thêm một bản ghi mới vào bảng DIEM; 
--dữ liệu phù hợp nhưng không được nhập giá trị null
go
insert into diem(masv,mamh,diemthi)
values('KH001','IT',9)
--7.Cập nhật lại số tín chỉ môn XML  là 5 
update monhoc set sotinchi=5 where mamh='XML'
--8.: Xóa những sinh viên có điểm thi <= 4 trong bảng DIEM
alter table diem
add constraint FK_diem_masv
foreign key (masv)
references sinhvien(masv) on delete cascade
delete from sinhvien where masv in (select masv from diem where diemthi <=4)
--9.Đếm số lượng sinh viên có DTB >= 8.0 theo từng địa chỉ  
alter table sinhvien
add madc varchar(5) foreign key (madc) references diachi(madc)
select count(diachi) from sinhvien where masv in 
(
	select diem.masv, hoten, (diemthi * sotinchi)/sum(sotinchi) 'ĐTB'
	from sinhvien
	join diem on sinhvien.masv=diem.masv
	join monhoc on monhoc.mamh=diem.mamh
	group by diem.masv,hoten,sotinchi,diemthi
	having (diemthi * sotinchi)/sum(sotinchi)>=8
)

select count(*), diachi  from sinhvien
group by diachi
having diachi in (select diachi from sinhvien join diem on sinhvien.masv=diem.masv
	join monhoc on monhoc.mamh=diem.mamh)

select (