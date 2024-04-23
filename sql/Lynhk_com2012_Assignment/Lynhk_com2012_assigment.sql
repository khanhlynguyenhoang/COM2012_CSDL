--Tạo database
CREATE DATABASE Assigment;

USE Assigment;

CREATE TABLE Loaisach(
	MaLoai int identity NOT NULL,
	TenLoai nvarchar(100),
	CONSTRAINT PK_MaLoai PRIMARY KEY(MaLoai)
);
Insert into Loaisach(TenLoai)
values(N'Kinh Tế');
Insert into Loaisach(TenLoai)
values(N'Công nghệ thông tin');
Insert into Loaisach(TenLoai)
values(N'Du lịch');
Insert into Loaisach(TenLoai)
values(N'Văn học');
Insert into Loaisach(TenLoai)
values(N'Ngoại ngữ');

CREATE TABLE Sach(
	MaSach int identity NOT NULL,
	TieuDe nvarchar(50),
	Nha_Xuat_Ban nvarchar(50),
	TacGia nvarchar(50),
	SLBS int,
	Gia money,
	NgayNhap Date,
	ViTri Nvarchar(100),
	MaLoai int,
	CONSTRAINT PK_MaSach PRIMARY KEY(MaSach),
	CONSTRAINT FK_Loai_Sach FOREIGN KEY(MaLoai) REFERENCES Loaisach(MaLoai)
);
Insert into sach(tieude,Nha_Xuat_Ban,TacGia,SLBS,Gia,NgayNhap,ViTri,MaLoai)
values(N'Công phá Toán học','Fpoly',N'Ngô Bảo Châu',56,'100.000','2023-2-1',N'Tủ A',2);
Insert into sach(tieude,Nha_Xuat_Ban,TacGia,SLBS,Gia,NgayNhap,ViTri,MaLoai)
values(N'Tuyển tập thơ','Fpoly',N'Xuân Diệu',56,'100.000','2023-2-1',N'Tủ B',4);
Insert into sach(tieude,Nha_Xuat_Ban,TacGia,SLBS,Gia,NgayNhap,ViTri,MaLoai)
values(N'Kinh tế','Fpoly',N'Ngô Bảo Châu',76,'56.000','2023-2-1',N'Tủ C',1);
Insert into sach(tieude,Nha_Xuat_Ban,TacGia,SLBS,Gia,NgayNhap,ViTri,MaLoai)
values(N'Hà Nội','Fpoly',N'Nhiều tác giả',96,'53.000','2023-2-1',N'Tủ B',3);
Insert into sach(tieude,Nha_Xuat_Ban,TacGia,SLBS,Gia,NgayNhap,ViTri,MaLoai)
values(N' Toán học','Fpoly',N'Ngô Bảo Châu',256,'108.000','2023-2-1',N'Tủ A',2);

CREATE TABLE SinhVien(
	MaSV int identity NOT NULL,
	TenSV nvarchar(50),
	NgayHetHan DATE,
	ChuyenNganh nvarchar(50),
	Email nvarchar(50),
	SDT varchar(15),
	CONSTRAINT PK_Phieumuon_Sinhvien PRIMARY KEY(MaSV)
);
Insert into SinhVien(TenSV,NgayHetHan,ChuyenNganh,Email,SDT)
values(N'Khánh Ly','2024-8-29',N'Phát triển phần mềm','lyly@gmail.com','0987634287');
Insert into SinhVien(TenSV,NgayHetHan,ChuyenNganh,Email,SDT)
values(N'Thiên Thiện','2024-8-29',N'Phát triển phần mềm','Thienthien@gmail.com','0987656247');
Insert into SinhVien(TenSV,NgayHetHan,ChuyenNganh,Email,SDT)
values(N'Xuân Bằng','2024-8-29',N'Phát triển phần mềm','Xuanbang@gmail.com','0987773447');
Insert into SinhVien(TenSV,NgayHetHan,ChuyenNganh,Email,SDT)
values(N'Ngọc Vy','2024-8-29',N'Phát triển phần mềm','ngocvi@gmail.com','0985632428');
Insert into SinhVien(TenSV,NgayHetHan,ChuyenNganh,Email,SDT)
values(N'Minh Hiếu','2024-8-29',N'Phát triển phần mềm','minhhieu@gmail.com','0956323428');

CREATE TABLE PhieuMuon(
	MaPM int identity NOT NULL,
	NgayMuon DATE,
	NgayTra DATE,
	MaSV int,
	CONSTRAINT PK_PM PRIMARY KEY(MaPM),
	CONSTRAINT FK_PM_SV FOREIGN KEY(MaSV) REFERENCES SinhVien(MaSV)
);
alter table phieumuon
add trangthai nvarchar(50)
insert into phieumuon(ngaymuon,ngaytra,masv)
values('2023-2-1','2023-2-7',1);
insert into phieumuon(ngaymuon,ngaytra,masv)
values('2023-2-2','2023-2-8',2);
insert into phieumuon(ngaymuon,ngaytra,masv)
values('2023-2-1','2023-2-7',3);
insert into phieumuon(ngaymuon,ngaytra,masv)
values('2023-2-1','2023-2-7',4);
insert into phieumuon(ngaymuon,ngaytra,masv)
values('2023-2-1','2023-2-7',5);

CREATE TABLE PhieuMuon_ChiTiet(
	MaSach int identity NOT NULL,
	MaPM int,
	GhiChu nvarchar(200),
	CONSTRAINT PK_PM_ChiTiet PRIMARY KEY(MaSach, MaPM),
	CONSTRAINT FK_PM_ChiTiet1 FOREIGN KEY(MaSach) REFERENCES Sach(MaSach),
	CONSTRAINT FK_PM_ChiTiet2 FOREIGN KEY(MaPM) REFERENCES PhieuMuon(MaPM)
);
insert into PhieuMuon_ChiTiet(mapm,ghichu)
values(1,N'Không');
insert into PhieuMuon_ChiTiet(mapm,ghichu)
values(2,N'Không');
insert into PhieuMuon_ChiTiet(mapm,ghichu)
values(3,N'Không');
insert into PhieuMuon_ChiTiet(mapm,ghichu)
values(4,N'Không');
insert into PhieuMuon_ChiTiet(mapm,ghichu)
values(5,N'Không');
select*from loaisach,sach,PhieuMuon,PhieuMuon_ChiTiet,SinhVien
--Y6: 
--6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả
--thuộc loại sách có mã “IT”.
select tieude, masach,gia,tacgia from sach where (maloai like 'IT')
--6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã
--sinh viên có ngày mượn trong tháng 01/2017.
select PM.MaPM,masach,ngaymuon,SV.MaSV from phieumuon PM
join sinhvien SV on PM.MaSV=SV.MaSV
join PhieuMuon_ChiTiet PMCT  on PM.MaPM= PMCT.MaPM
where ngaymuon like '2017-1-%'
--6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày mượn sách.
select*from phieumuon PM where trangthai like N'chưa trả'
order by ngaymuon 
--6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số lượng sách mỗi loại).
select S.MaLoai,LS.TenLoai, Count(Ls.MaLoai) as 'Số đầu sách' from sach S
join Loaisach LS on S.MaLoai=LS.MaLoai
group by s.MaLoai,ls.TenLoai

--6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
select MaSV, count(*) as 'Số lượt mượn' from phieumuon 

--6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.
select*from sach
where tieude like N'%SQL%'
--6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã
--phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.
select sinhvien.MaSV,TenSV,phieumuon.MaPM,tieude,ngaymuon,ngaytra  from phieumuon
join sinhvien on PhieuMuon.MaSV=SinhVien.MaSV
join PhieuMuon_ChiTiet on PhieuMuon.MaPM=PhieuMuon_ChiTiet.MaPM
join sach on PhieuMuon_ChiTiet.MaSach=sach.MaSach
order by ngaymuon
--6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 20 lần.
select sach.MaSach, count(phieumuon_chitiet.masach) from sach
join PhieuMuon_ChiTiet on sach.MaSach=PhieuMuon_ChiTiet.MaSach
group by sach.masach
having count(phieumuon_chitiet.masach) >20

--6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm 2014 giảm 30%.
update sach set gia=gia - gia*0.3 where masach in (select masach  from sach where year(ngaynhap) <=2014)
--6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã sinh viên PD12301 (ví dụ).
update phieumuon set trangthai = N'đã trả' where masv='PD12301'
--6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn,
--tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
select phieumuon.MaPM, sinhvien.TenSV,email, ngaymuon,ngaytra, trangthai ,
datediff(day,phieumuon.ngaytra, getdate()) as 'Số ngày vượt'
from phieumuon
join sinhvien on sinhvien.MaSV=phieumuon.MaSV
where trangthai like N'chưa trả'
and datediff(day,phieumuon.ngaytra, getdate()) >=0

--6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có lượt mượn lớn hơn 10
update sach set slbs =slbs+5 where masach in 
(select sach.MaSach from sach
join PhieuMuon_ChiTiet on sach.MaSach=PhieuMuon_ChiTiet.MaSach
group by sach.masach
having count(phieumuon_chitiet.masach) >10)
--6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước „1/1/2010‟
delete phieumuon
where ngaymuon  < '2010-01-01'