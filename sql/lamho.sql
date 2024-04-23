create database qlkh
use qlkh
create table khachhang(
	makh char(5) primary key,
	tenkh nvarchar(50) not null,
	taikhoan varchar(20) not null
)
create table dathang(
	madathang char(5) primary key,
	makh char(5) ,
	masach char(5),
	soluong int not null,
	dongia varchar(200) not null,
	foreign key (makh) references khachhang(makh)
)
insert into khachhang(makh,tenkh,taikhoan)
values('A01','ToanNK',000502001),
('A02','VanNT',00745001),
('A03','TrangTT',000341928)
insert into dathang(madathang,makh,masach,soluong,dongia)
values('DT01','A01','S01',10,'50000'),
('DT02','A01','S02',9,'30000'),
('DT03','A02','S03',7,'70000')
--hiển thị thông tin khách hàng bao gồm mã kh, tên kh
select makh,tenkh from khachhang
--hiển thị thông tin khách hàng mua sách gồm madathang,makh,soluong,dongia,thanhtien
select madathang,makh,soluong,dongia, soluong*dongia N'Thành tiền'  from dathang
--hiển thị tất cả khách hàng có tài khoản kết thúc là 01
select * from khachhang
where taikhoan like '%01'
--hiển thị tất cả thông tin trong bảng khách hàng của những kh có tenkh bắt đầu là T
select * from khachhang
where tenkh like 'T%'
--hiển thị tổng số lượng mua của từng kh.
--yêu cầu chỉ hiện thị hàng nào có tổng số lượng mua >=10
--sắp xếp tổng số lượng theo thứ tự tăng dần
select   tenkh,sum(soluong) 'Số lượng đặt báo' from dathang
join khachhang on dathang.makh=khachhang.makh
group by tenkh
having sum(soluong)>=10
order by sum(soluong) 
--đưa ra kh mua số lượng nhiều nhất gồm makh,soluong
select top 1  tenkh,sum(soluong) 'Số lượng đặt báo' from dathang
join khachhang on dathang.makh=khachhang.makh
group by tenkh