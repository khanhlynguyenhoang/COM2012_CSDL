create database datbao
use datbao
create table bao(
	mabao varchar(5) primary key,
	tenbao nvarchar(200) not null,
	gia float not null
)
create table khachhang(
	makh varchar(5) primary key,
	tenkh nvarchar(200) not null,
	ngaysinh date not null,
	diachi nvarchar(200) not null
)
create table phieudatbao(
	mabao varchar(5),
	makh varchar(5),
	ngaydat date not null,
	soluong int not null,
	constraint PK_MAKH_MABAO primary key(makh,mabao),
	constraint FK_makh_phieudatbao foreign key (makh) references khachhang(makh),
	constraint FK_mabao_phieudatbao foreign key (mabao) references bao(mabao)
)
insert into bao(mabao,tenbao,gia)
values('MB001',N'Quốc tế',17000),
('MB002',N'Lao động',22000)
insert into khachhang(makh,tenkh,ngaysinh,diachi)
values('KH001',N'Nam','2000-12-29',N'Hà Nội'),
('KH002',N'Nguyên','1999-5-16',N'Bắc Ninh'),
('KH003',N'Thúy','1997-9-9',N'Thái Nguyễn')
insert into phieudatbao(mabao,makh,ngaydat,soluong)
values('MB001','KH001','2022-12-5',58),
('MB002','KH001','2022-12-29',62),
('MB001','KH002','2022-12-15',99)
select tenkh,ngaysinh,diachi,tenbao,soluong from khachhang
join phieudatbao on phieudatbao.makh=khachhang.makh
join bao on bao.mabao=phieudatbao.mabao
--hiển thị tên kh,dc,tenbao,dongia,sl,thanhtien=sl*dongia
select tenkh,ngaysinh,diachi,tenbao,soluong,gia,soluong*gia 'Thành tiền' from khachhang
join phieudatbao on phieudatbao.makh=khachhang.makh
join bao on bao.mabao=phieudatbao.mabao
--hiển thị top 2 khách hàng đặt báo nhiều nhất
select top 2 tenkh,sum(soluong) 'Số lượng đặt báo' from phieudatbao
join khachhang on phieudatbao.makh=khachhang.makh
group by tenkh
--hiển thị những khách hàng có mức thành tiền từ 2000000
select tenkh,sum(soluong*gia) 'Tổng Thành tiền' from phieudatbao
join khachhang on khachhang.makh=phieudatbao.makh
join bao on bao.mabao=phieudatbao.mabao
group by tenkh
having sum(soluong*gia)>=2000000
--thêm 1 mặt báo vào bảng báo
insert into bao(mabao,tenbao,gia)
values('MB004',N'Hoa học trò',15000)
--cập nhật tên khách hàng thành 'Nghĩa' thay cho khách hàng có mã KH001
update khachhang set tenkh=N'Nghĩa' where makh='KH001'
--hiển thị những khách hàng có số lượng đặt báo cao nhất
select * from khachhang
where makh in (select top 1 khachhang.makh from khachhang 
join phieudatbao on phieudatbao.makh=khachhang.makh
group by khachhang.makh
order by sum(soluong) desc)

--
