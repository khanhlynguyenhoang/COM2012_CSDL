create database quanlibaihat
use quanlibaihat
go
create table casi
(
	macs varchar(5) primary key ,
	hoten nvarchar(100) not null,
	ngaysinh date not null,
	quequan nvarchar(100),
	catxe float not null
)
go
create table baihat(
	mabh varchar(5) primary key not null,
	tenbh nvarchar(100) not null,
	namst int not null
)
go
create table trinhbay(
	macs varchar(5),
	mabh varchar(5),
	ngaytrinhbay date ,
	primary key (macs,mabh),
	foreign key (macs) references casi(macs),
	foreign key (mabh) references baihat(mabh)
)
insert into casi(macs,hoten,ngaysinh,quequan,catxe)
values('CS001',N'Nguyễn Đông Nam','1999-6-3',N'Hà Nội',23000000),
('CS002',N'Đinh Văn Lợi','2002-10-9',N'TPHCM',18000000),
('CS003',N'Trần Bình Mạnh','2001-2-10',N'Thái Bình',21000000)
insert into baihat(mabh,tenbh,namst)
values('M1',N'Nhớ Mùa Xuân',2001),
('M2',N'Hoa Phượng',1990),
('M3',N'Nắng sớm',2000)
insert into trinhbay(macs,mabh,ngaytrinhbay)
values('CS001','M2','2020-10-29'),
('CS002','M1','2021-7-17'),
('CS002','M2','2021-1-20')
--	Đưa ra thông tin mã ca sỹ, họ tên, ngày sinh của ca sỹ có cát xê > 20,000,000 và ở Hà Nội
select hoten,ngaysinh  from casi
where catxe > 20000000 and quequan=N'Hà Nội'
--	Hiển thị thông tin mã bài hát, tên bài có ca sỹ đinh văn lợi thể hiện
select baihat.mabh,tenbh from baihat
join trinhbay on baihat.mabh=trinhbay.mabh
join casi on trinhbay.macs=casi.macs
where casi.hoten like N'Đinh Văn Lợi'
--	Hiển thị thông tin Mã ca sỹ, họ tên, năm sang tác có ngày trình bày 20/1/2021
select casi.macs,hoten,namst from casi
join trinhbay on trinhbay.macs=casi.macs
join baihat on trinhbay.mabh=baihat.mabh
where ngaytrinhbay='2021-1-20'
--	Hiển thị thông tin ca sỹ gồm có họ tên, mã ca sỹ, và số lượng bài hát họ trình bày4
select hoten,casi.macs,count(casi.macs) 'số lượng bài hát trình bày' from casi
join trinhbay on trinhbay.macs=casi.macs
join baihat on trinhbay.mabh=baihat.mabh
group by hoten,casi.macs
--	Thêm dữ liệu vào bảng ca sỹ và bảng trình bày (không được để trống)
insert into casi(macs,hoten,ngaysinh,quequan,catxe)
values('KH001',N'Phương Ly','1996-5-6',N'Hà Nội',50000000)
insert into trinhbay(macs,mabh,ngaytrinhbay)
values('KH001','M2','2022-10-29')
--	Thây đổi năm sang tác của bài Hoa phượng thành năm 1986
update baihat set namst=1986
where tenbh=N'Hoa phượng'
--	Xóa dữ liệu của bài hát chưa được ca sỹ nào trình bày

delete from baihat where mabh not in 
(select baihat.mabh from baihat 
join trinhbay on baihat.mabh=trinhbay.mabh)
