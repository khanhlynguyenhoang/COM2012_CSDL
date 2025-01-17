CREATE DATABASE [QuanLyBanHang]
GO
USE [QuanLyBanHang]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2/8/2023 2:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[ngayMuaHang] [date] NULL,
	[maKhachHang] [char](5) NULL,
	[trangThai] [nvarchar](100) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 2/8/2023 2:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[maHoaDonChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[maSanPham] [int] NULL,
	[maHoaDon] [int] NULL,
	[soLuong] [int] NULL,
 CONSTRAINT [PK_HoaDonChiTiet] PRIMARY KEY CLUSTERED 
(
	[maHoaDonChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/8/2023 2:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKhachHang] [char](5) NOT NULL,
	[hoVaTenLot] [nvarchar](50) NULL,
	[Ten] [nvarchar](10) NULL,
	[Diachi] [nvarchar](200) NULL,
	[Email] [varchar](50) NULL,
	[Dienthoai] [varchar](13) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2/8/2023 2:01:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSanPham] [int] IDENTITY(1,1) NOT NULL,
	[moTa] [nvarchar](255) NULL,
	[soLuong] [int] NULL,
	[donGia] [decimal](10, 2) NULL,
	[tenSP] [nvarchar](150) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (1, CAST(N'2020-01-12' AS Date), N'KH001', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (2, CAST(N'2020-11-22' AS Date), N'KH002', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (3, CAST(N'2020-03-02' AS Date), N'KH001', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (4, CAST(N'2020-06-12' AS Date), N'KH001', N'Chưa thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (5, CAST(N'2021-03-09' AS Date), N'KH002', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (6, CAST(N'2021-02-02' AS Date), N'KH003', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (7, CAST(N'2020-01-02' AS Date), N'KH004', N'Chưa thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (8, CAST(N'2021-09-12' AS Date), N'KH005', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (9, CAST(N'2021-05-03' AS Date), N'KH006', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (10, CAST(N'2021-03-25' AS Date), N'KH007', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (11, CAST(N'2021-11-12' AS Date), N'KH008', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (12, CAST(N'2021-10-01' AS Date), N'KH009', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (13, CAST(N'2021-01-16' AS Date), N'KH010', N'Chưa thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (14, CAST(N'2021-08-17' AS Date), N'KH010', N'Chưa thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (15, CAST(N'2021-12-11' AS Date), N'KH011', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (16, CAST(N'2021-07-14' AS Date), N'KH012', N'Chưa thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (17, CAST(N'2021-02-23' AS Date), N'KH013', N'Chưa thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (18, CAST(N'2021-11-29' AS Date), N'KH014', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (19, CAST(N'2019-11-12' AS Date), N'KH015', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([maHoaDon], [ngayMuaHang], [maKhachHang], [trangThai]) VALUES (24, CAST(N'2017-09-22' AS Date), N'KH012', N'Đã thanh toán')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] ON 

INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (1, 1, 2, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (2, 1, 1, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (3, 1, 3, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (4, 2, 2, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (5, 4, 2, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (6, 4, 1, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (7, 5, 1, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (8, 8, 2, 10)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (9, 9, 3, 21)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (10, 5, 2, 2)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (11, 3, 4, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (12, 6, 4, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (13, 7, 4, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (14, 8, 4, 11)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (15, 9, 4, 22)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (16, 3, 5, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (17, 6, 6, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (18, 9, 7, 10)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (19, 10, 8, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (20, 10, 9, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (21, 10, 10, 2)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (22, 3, 11, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (23, 1, 12, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (24, 2, 13, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (25, 1, 14, 3)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (26, 3, 15, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (27, 5, 16, 4)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (28, 6, 17, 2)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (29, 7, 18, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (30, 2, 19, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (31, 3, 19, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (32, 7, 19, 3)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (33, 3, 18, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (34, 5, 18, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (35, 3, 16, 1)
INSERT [dbo].[HoaDonChiTiet] ([maHoaDonChiTiet], [maSanPham], [maHoaDon], [soLuong]) VALUES (41, 7, 5, 2)
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] OFF
GO
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH001', N'Nguyễn Văn', N'An', N'Hà Nội', N'namnv@gmail.com', N'0981259384')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH002', N'Lê Văn', N'Tùng', N'Hà Nội', N'tunglv@gmail.com', N'0981259475')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH003', N'Trịnh Dương', N'Linh', N'Bắc Giang', N'linhtd@gmail.com', N'0961259384')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH004', N'Phạm Thanh', N'Thúy', N'TP Hồ Chí Minh', N'thuypt@gmail.com', N'0681259389')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH005', N'Đào Minh', N'Tiến', N'Hà Nội', N'tiendm@gmail.com', N'0912259382')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH006', N'Pham Quốc', N'Việt', N'Thanh Hóa', N'vietpq@gmail.com', N'0934234564')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH007', N'Chu Bạch', N'Dương', N'Đà Nẵng', N'duongcb@gmail.com', N'0932874563')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH008', N'Lương Văn', N'Du', N'Thái Bình', N'dulv@gmail.com', N'0976483912')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH009', N'Lương Văn', N'Hiếu', N'Hà Nội', N'hieulv12@gmail.com', N'0967123322')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH010', N'Phạm huy', N'Tùng', N'Đà Nẵng', N'tungph@gmail.com', N'0945273849')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH011', N'Trần Thị Thanh', N'Hương', N'Hà Nội', N'huongttt@gmail.com', N'0912376833')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH012', N'Vũ Văn', N'Khán', N'Hải Dương', N'khanvv@gmail.com', N'0976483895')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH013', N'Ngô Văn', N'Chuyên', N'Nam ĐỊnh', N'chuyennv@gmail.com', N'0331238976')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH014', N'Pham Nam', N'Trường', N'Ninh Bình', N'truongpn@gmail.com', N'0788125938')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH015', N'Lê Trần', N'Khánh', N'Nghệ An', N'khanhlt@gmail.com', N'0887463522')
INSERT [dbo].[KhachHang] ([maKhachHang], [hoVaTenLot], [Ten], [Diachi], [Email], [Dienthoai]) VALUES (N'KH016', N'Nguyễn Lê ', N'Anh', N'Thái Bình', N'anhnl@gmail.com', N'0980432343')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (1, N'Điện thoại Iphone 13 256 GB', 100, CAST(899.00 AS Decimal(10, 2)), N'Iphone 13 256 GB')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (2, N'Điện thoại Iphone 13 128 GB', 999, CAST(849.00 AS Decimal(10, 2)), N'Iphone 13 128 GB')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (3, N'Điện thoại Iphone 13 Mini 256 GB', 212, CAST(799.00 AS Decimal(10, 2)), N'Iphone 13 Mini 256 GB')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (4, N'Điện thoại Iphone 13 Mini 128 GB', 100, CAST(99.00 AS Decimal(10, 2)), N'Iphone 13 Mini 128 GB')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (5, N'Điện thoại samsung galaxy S22', 1000, CAST(799.00 AS Decimal(10, 2)), N'Samsung Galaxy S22')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (6, N'Điện thoại samsung galaxy S22 Plus', 2300, CAST(899.00 AS Decimal(10, 2)), N'Samsung Galaxy S22 Plus')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (7, N'Điện thoại samsung galaxy S22 Ultra', 999, CAST(1299.00 AS Decimal(10, 2)), N'Samsung Galaxy S22 Ultra')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (8, N'Sữa hộp', 1000, CAST(1.20 AS Decimal(10, 2)), N'Sữa Ông Thọ')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (9, N'Kẹo candy plus', 5000, CAST(2.10 AS Decimal(10, 2)), N'Kẹo Candy Plus')
INSERT [dbo].[SanPham] ([maSanPham], [moTa], [soLuong], [donGia], [tenSP]) VALUES (10, N'Điện thoại Iphone 6', 80, CAST(219.00 AS Decimal(10, 2)), N'Iphone 7')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Khachhang] FOREIGN KEY([maKhachHang])
REFERENCES [dbo].[KhachHang] ([maKhachHang])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Khachhang]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDon]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_SanPham] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSanPham])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_SanPham]
GO
