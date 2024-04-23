create database QLNVtt
use QLNVtt
create table vanphong(
	mavp char(5) primary key,
	tenvp nvarchar(150) not null
)
create table nhanvien(
	manv char(5) primary key,
	hoten nvarchar(200) not null,
	ngaysinh date not null,
	gioitinh nvarchar(5) not null,
	mavp char(5) ,
	email varchar(100) not null,
	sodt int not null,
	foreign key (mavp) references vanphong(mavp)
)
create table thannhan(
	matn char(5) primary key,
	hotentn nvarchar(200) not null,
	ngaysinh date not null,
	moilh nvarchar(100) not null,
	manv char(5),
	foreign key (manv) references nhanvien(manv) 

)
insert into vanphong(mavp,tenvp)
values('HC',N'Hành chính'),
('CTSV',N'Công tác sinh viên')
insert into nhanvien(manv,hoten,ngaysinh,gioitinh,mavp,email,sodt)
values('NV1',N'Nguyễn Anh Tuấn','1989-11-12','Nam','HC','Tuanna5@fpt.edu.vn',0988554303),
('Nv2',N'Trần Thanh Tùng','1988-1-2','Nam','CTSV','tungtt2@fpte.du.vn',0987792457),

insert into thannhan(matn,hotentn,ngaysinh,moilh,manv)
values('TN01',N'Nguyễn Ngọc Anh','1962-12-7',N'Người thân','NV2'),
('TN02',N'Trần Tuấn Tú','1970-6-6',N'Người quen','NV2')
update nhanvien set ngaysinh='2004-8-10' where manv='NV3'
--hiển thị manv,hotennv,mavp và tháng sinh là tháng 8
select manv,hoten,mavp from nhanvien 
where month(ngaysinh)=8
--hiển thij manv,hotennv,mavp và tuổi nv. chỉ hiện những nv có tuổi lớn hơn 19

--hiển thị manv,hotennv,tenvp,ngaysinh,giỏitinh email,sdt của những nv có họ trần
select manv,hoten,tenvp,ngaysinh,gioitinh,email,sodt from nhanvien
join vanphong on nhanvien.mavp=vanphong.mavp
where hoten like N'Trần%'
--hiển thị những nv không có nhân thân
select * from nhanvien


where manv not in
(
	select nhanvien.manv from nhanvien 
	join thannhan on thannhan.manv=nhanvien.manv
)
--thêm một bản ghi mới vào bảng văn phòng, dữ liệu phù hợp nhưng không được nhập giá trị null
insert into vanphong(mavp,tenvp)
values('DVSV',N'Dịch vụ sinh viên')
--cập nhật lại sdt của manv nv2 là 098779244
update nhanvien set sodt=098779244
where manv='NV2'
--xóa thông tin của nhân viên có mlh là ng quen
