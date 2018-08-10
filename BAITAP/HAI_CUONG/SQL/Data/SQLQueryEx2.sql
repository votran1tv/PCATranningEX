use master
go
drop database qlbh
go
--Tạo cơ sở dữ liệu QLBH:
if not exists (select 1 from sys.databases where name = 'qlbh')
	create database qlbh
	on primary(
	name = qlbh,
	filename = 'D:\SQL EXE\Sql Ex 2\qlbh.mdf',
	size = 5,
	maxsize = 50,
	filegrowth = 5);
else
	print(N'Cơ sở dữ liệu đã tồn tại T.T');
go
------

use qlbh;
go

--Tạo và thêm mới dữ liệu vào bảng--
--1_VatTu:
if not exists (select 1 from sys.objects where name = 'VatTu')
	create table VatTu(
		MaVT int identity unique not null,
		TenVatTu nvarchar(50),
		DonViTinh nchar(10),
		TiLePhanTram int,
		constraint pk_VatTu_MaVT primary key(MaVT)
	);
else
	print(N'Bảng đã tồn tại T.T');
go
---
insert into VatTu(TenVatTu,DonViTinh,TiLePhanTram) values
(N'Nokia N73',N'Máy',10),
(N'Nokia N86',N'Máy',10),
(N'Nokia N86',N'Máy',10),
(N'Nokia N92',N'Máy',10),
(N'TellMobile S8800',N'Máy',10),
(N'TellMobile S6300',N'Máy',20),
(N'TellMobile S1200',N'Máy',20),
(N'TellMobile S110i',N'Máy',20);
go
-----

--2_NhaCungCap:
if not exists (select 1 from sys.objects where name = 'NhaCungCap')
	create table NhaCungCap(
		MaNCC int identity unique not null,
		TenNhaCungCap nvarchar(50),
		DiaChi nvarchar(50),
		DienThoai char(20),
		constraint pk_NhaCungCap_MaNCC primary key(MaNCC)
	);
else
	print(N'Bảng đã tồn tại T.T');
go
---
insert into NhaCungCap(TenNhaCungCap,DiaChi,DienThoai) values
(N'Nokia Miền Bắc',N'TP.Hà Nội','+84 0226668889'),
(N'Nokia Miền Trung',N'TP.Đồng Hới','+84 0256668889'),
(N'Nokia Miền Nam',N'TP.Hồ Chí Minh','+84 0286668889');
go
-----

--3_DonDatHang:
if not exists (select 1 from sys.objects where name = 'DonDatHang')
	create table DonDatHang(
		MaDDH int identity unique not null,
		MaNCC int not null,
		NgayDat date,
		constraint pk_DonDatHang_MaDDH primary key(MaDDH),
		constraint fk_DonDatHang_MaNCC foreign key(MaNCC) references NhaCungCap(MaNCC)
	);
else
	print(N'Bảng đã tồn tại T.T');
go
---
set dateformat dmy;
go
insert into DonDatHang(MaNCC,NgayDat) values
(1,'1-1-2018'),
(2,'11-1-2018'),
(3,'21-1-2018'),
(1,'1-3-2018'),
(2,'11-3-2018'),
(3,'21-3-2018'),
(1,'1-6-2018'),
(2,'11-6-2018'),
(3,'21-6-2018'),
(1,'1-9-2018'),
(2,'11-9-2018'),
(3,'21-9-2018'),
(1,'1-12-2018'),
(2,'11-12-2018'),
(3,'21-12-2018');
go
-----

--4_ChiTietDonHang:
if not exists (select 1 from sys.objects where name = 'ChiTietDonHang')
	create table ChiTietDonHang(
		MaDDH int not null,
		MaVT int not null,
		SoLuongDat int,
		constraint fk_ChiTietDonHang_MaDDH foreign key(MaDDH) references DonDatHang(MaDDH),
		constraint fk_ChiTietDonHang_MaVT foreign key(MaVT) references VatTu(MaVT)
	);
else
	print(N'Bảng đã tồn tại T.T');
go
---
insert into ChiTietDonHang(MaDDH,MaVT,SoLuongDat) values
(1,1,200),
(2,1,200),
(3,1,200),
(4,2,200),
(5,2,200),
(6,2,200),
(7,3,100),
(8,3,100),
(9,3,100),
(10,4,500),
(11,4,200),
(12,4,400),
(13,5,200),
(14,5,200),
(15,5,700);
go
-----

--5_PhieuNhapHang:
if not exists (select 1 from sys.objects where name = 'PhieuNhapHang')
	create table PhieuNhapHang(
		MaSPN int identity unique not null,
		MaDDH int not null,
		NgayNhap date,
		constraint pk_PhieuNhapHang_MaSPN primary key(MaSPN),
		constraint fk_PhieuNhapHang_MaDDH foreign key(MaDDH) references DonDatHang(MaDDH)
	);
else
	print(N'Bảng đã tồn tại T.T');
go
---
set dateformat dmy;
go
insert into PhieuNhapHang(MaDDH,NgayNhap) values
(1,'10-1-2018'),
(2,'22-1-2018'),
(3,'28-1-2018'),
(4,'10-3-2018'),
(5,'22-3-2018'),
(6,'28-3-2018'),
(7,'10-6-2018'),
(8,'22-6-2018'),
(9,'28-6-2018'),
(10,'10-9-2018'),
(11,'22-9-2018'),
(12,'28-9-2018'),
(13,'10-12-2018'),
(14,'22-12-2018'),
(15,'28-12-2018');
go
-----

--6_ChiTietPhieuNhap:
if not exists (select 1 from sys.objects where name = 'ChiTietPhieuNhap')
	create table ChiTietPhieuNhap(
		MaSPN int not null,
		MaVT int not null,
		SoLuongNhap int,
		DonGiaNhap int,
		constraint fk_ChiTietPhieuNhap_MaSPN foreign key(MaSPN) references PhieuNhapHang(MaSPN),
		constraint fk_ChiTietPhieuNhap_MaVT foreign key(MaVT) references VatTu(MaVT)
	);
else
	print(N'Bảng đã tồn tại T.T');
go
---
insert into ChiTietPhieuNhap(MaSPN,MaVT,SoLuongNhap,DonGiaNhap) values
(1,1,200,8000000),
(2,1,200,8000000),
(3,1,200,8000000),
(4,2,200,10000000),
(5,2,200,10000000),
(6,2,200,10000000),
(7,3,100,11000000),
(8,3,100,11000000),
(9,3,100,11000000),
(10,4,500,4000000),
(11,4,200,5000000),
(12,4,400,4500000),
(13,5,200,3000000),
(14,5,200,3000000),
(15,5,700,2500000);
go
-----

--7_PhieuXuatHang:
if not exists (select 1 from sys.objects where name = 'PhieuXuatHang')
	create table PhieuXuatHang(
		MaPX int identity unique not null,
		NgayXuat date,
		TenKhachHang nvarchar(255),
		constraint pk_ChiTietXuatHang primary key(MaPX)
	);
else
	print(N'Bảng đã tồn tại T.T');
go
---
set dateformat dmy;
go
--set ansi_warnings off
--go


insert into PhieuXuatHang(NgayXuat,TenKhachHang) values
('15-1-2018',N'Nguyễn Hải A'),
('25-1-2018',N'Nguyễn Hải B'),
('28-1-2018',N'Nguyễn Hải C'),
('15-3-2018',N'Nguyễn Hải D'),
('25-3-2018',N'Nguyễn Hải E'),
('28-3-2018',N'Nguyễn Hải F'),
('15-6-2018',N'Nguyễn Hải G'),
('25-6-2018',N'Nguyễn Hải H'),
('28-6-2018',N'Nguyễn Hải I'),
('15-9-2018',N'Nguyễn Hải J'),
('25-9-2018',N'Nguyễn Hải K'),
('28-9-2018',N'Nguyễn Hải L'),
('15-12-2018',N'Nguyễn Hải M'),
('25-12-2018',N'Nguyễn Hải N'),
('28-12-2018',N'Nguyễn Hải P');
go
-----

--8_ChiTietXuatHang:
if not exists (select 1 from sys.objects where name = 'ChiTietXuatHang')
	create table ChiTietXuatHang(
		MaPX int not null,
		MaVT int not null,
		SoLuongXuat int,
		DonGiaXuat int,
		constraint fk_ChiTietXuatHang_MaPX foreign key(MaPX) references PhieuXuatHang(MaPX),
		constraint fk_ChiTietXuatHang_MaVT foreign key(MaVT) references VatTu(MaVT)
	);
else
	print(N'Bảng đã tồn tại T.T');
go
---
insert into ChiTietXuatHang(MaPX,MaVT,SoLuongXuat,DonGiaXuat) values
(1,1,200,9000000),
(2,1,200,9000000),
(3,1,200,9000000),
(4,2,200,11000000),
(5,2,200,11000000),
(6,2,200,11000000),
(7,3,100,12000000),
(8,3,100,12000000),
(9,3,100,12000000),
(10,4,500,5000000),
(11,4,200,6000000),
(12,4,400,5500000),
(13,5,200,4000000),
(14,5,200,4000000),
(15,5,700,3500000);
go
-----
----------

--Bài Tập--
--\\EX2 (8/8/2018)//
--1_Tạo CSDL trên SQL Server.
-----
--2_Thiết lập khóa chính, khóa ngoại, tạo liên kết giữa các bảng.
-----
--3_Chèn dữ liệu vào các bảng.
-----
--4.Thực hiện truy vấn thêm, sửa, xóa trên các bảng:

--[Thao tác thêm cột mới trong bảng ChiTietPhieuNhap]:
alter table ChiTietPhieuNhap add DemoThemCot int;

--[Thao tác thêm bản ghi mới trong cột DemoThemCot]:
update ChiTietPhieuNhap set DemoThemCot = 8888888 where MaSPN = 1;
update ChiTietPhieuNhap set DemoThemCot = 8888888 where MaSPN = 2;
update ChiTietPhieuNhap set DemoThemCot = 8888888 where MaSPN = 3;
update ChiTietPhieuNhap set DemoThemCot = 8888888 where MaSPN = 4;
update ChiTietPhieuNhap set DemoThemCot = 8888888 where MaSPN = 5;

--[Thao tác sửa thuộc tính của cột DemoThemCot trong bảng ChiTietPhieuNhap]:
alter table ChiTietPhieuNhap alter column DemoThemCot numeric;

--[Thao tác sửa bản ghi trong bảng ChiTietPhieuNhap]:
update ChiTietPhieuNhap set DemoThemCot = 9999999 where MaVT =1;

--[Thao tác xóa một cột]
alter table ChiTietPhieuNhap drop column DemoThemCot;
--[Thao tác xóa một và tất cả bản ghi]
delete from ChiTietPhieuNhap;
delete from ChiTietPhieuNhap where DemoThemCot = 8888888;
truncate table ChiTietPhieuNhap; --//Xoa cả Index
-----
--5_Lấy ra danh sách các đơn đặt hàng từ 1/1/2018 đến 1/6/2018:
select * from DonDatHang where NgayDat between '1/1/2018' and '1/6/2018';
-----
--6_Thống kê số lượng mặt hàng theo nhà cung cấp:

-----

--\\Update EX2 (9/8/2018)//
--7_Kiểm tra xem mặt hàng nào được đặt hàng nhiều nhất:

-----
--8_Tìm tất cả mặt hàng bắt đầu bằng chữ T:

-----
--9_Thống kê các mặt hàng  mà có tổng số lượng đặt hàng nhiều hơn 1000:

-----
--10_Tìm tất cả các mặt hàng đã nhập về nhưng chưa xuất:

-----
--11_Tìm tất cả các mặt hàng đã nhập về và đã xuất:

-----
----------

--Lệnh bổ sung--
--Hiển thị các bảng:
Select * from VatTu;
Select * from NhaCungCap;
Select * from DonDatHang;
Select * from ChiTietDonHang;
Select * from PhieuNhapHang;
Select * from ChiTietPhieuNhap;
Select * from PhieuXuatHang;
Select * from ChiTietXuatHang;
-----