
use lab04;
CREATE TABLE Vanphong(
	MaPHG int identity not null,
);
alter table vanphong
add TenPH nvarchar(100)
alter table vanphong
add diadiem nvarchar(200)
CREATE TABLE Nhanvien(
	MaNV int identity not null,
	Ten nvarchar (50)
);
CREATE TABLE BDS(
	MaBDS int identity not null,
	Diadiem nvarchar(200),
);
alter table BDS
add TenBDS nvarchar(100)

CREATE TABLE Chu_so_huu(
	MaCSH int identity not null,
	Ten nvarchar(50),
	Diadiem nvarchar(200),
	SDT varchar(13)
);
CREATE TABLE Con(
	MaCon int identity not null,
	Ten nvarchar(50),
	Ngaysinh date
);
CREATE TABLE Diadiem(
	Diadiem nvarchar(200)
);

ALTER table Vanphong
ADD CONSTRAINT PK_MaPHG PRIMARY KEY(MaPHG);
ALTER TABLE Nhanvien
ADD CONSTRAINT PK_MaNV	PRIMARY KEY(MaNV);
ALTER TABLE Nhanvien
ADD MaPHG int;
ALTER TABLE Nhanvien
ADD CONSTRAINT FK_nhanvien_vanphong FOREIGN KEY(MaPHG) REFERENCES Vanphong(MaPHG);
ALTER TABLE BDS
ADD CONSTRAINT PK_MaBDS PRIMARY KEY(MaBDS);
ALTER TABLE BDS
ADD MaPHG int;
ALTER TABLE BDS
ADD MaCSH int;
ALTER TABLE BDS
add CONSTRAINT FK_Vanphong_BDS FOREIGN KEY(MaPHG) REFERENCES Vanphong(MaPHG);
ALTER TABLE Chu_so_huu
ADD CONSTRAINT PK_MaCSH PRIMARY KEY(MaCSH);
ALTER TABLE BDS
ADD constraint FK_CSH_BDS FOREIGN KEY(MaCSH) REFERENCES Chu_so_huu(MaCSH);
ALTER TABLE Con
ADD CONSTRAINT PK_MaCon PRIMARY KEY(MaCon),
	MaNV int,
	CONSTRAINT FK_Nhanthan FOREIGN KEY(MaNV) REFERENCES Nhanvien(MaNV);
ALTER TABLE Diadiem
ADD MaPHG int,
	MaDD int,
CONSTRAINT PK_MaDD PRIMARY KEY(MaDD),
CONSTRAINT FK_Diadiem_Vanphong FOREIGN KEY(MaPHG) REFERENCES Vanphong(MaPHG);


--Bài làm thêm
CREATE TABLE Lop(
	MaLop int identity NOT NULL,
	TenLop nvarchar(30),
	MoTa nvarchar(150)
	constraint pk_malop primary key(MaLop)
);
CREATE TABLE Sinhvien(
	MaSV int identity NOT NULL,
	Hoten nvarchar(50),
	Ngaysinh date,
	MaLop int not null
	CONSTRAINT PK_MaSV PRIMARY KEY(MaSV),
	CONSTRAINT FK_Sinhvien_lop FOREIGN KEY(MaLop) REFERENCES Lop(MaLop)
);

CREATE TABLE Monhoc(
	Mamon int identity not null,
	Tenmon nvarchar(100),
	constraint pk_mamon primary key(Mamon),
);
CREATE TABLE Diem(
	Mamon int identity not null,
	MaSV int,
	DiemKT1 decimal(10,1),
	DiemKT2 decimal(10,1),
	DiemThi decimal(10,1)
	constraint pk_diem_masv_mamon primary key(MaSV , Mamon),
	constraint fk_masv_diem foreign key(MaSv) references Sinhvien(MaSV),
	constraint fk_diem_Mamon foreign key(Mamon) references Monhoc(Mamon)
);
