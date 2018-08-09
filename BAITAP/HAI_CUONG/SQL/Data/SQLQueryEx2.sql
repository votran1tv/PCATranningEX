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
------

use qlbh;
go

--Tạo bảng--
--1_VatTu:
if not exists (select 1 from sys.objects where name = 'VatTu')
	create table VatTu(
		MaVT int identity unique not null,
		Ten nvarchar(50),
		DonViTinh nchar(10),
		TiLePhanTram int,
		constraint pk_VatTu_MaVT primary key(MaVT)
	);
else
	print('Bảng đã tồn tại T.T');

--2_NhaCungCap:
if not exists (select 1 from sys.objects where name = 'NhaCungCap')
	create table NhaCungCap(
		MaNCC int identity unique not null,
		Ten nvarchar(50),
		DiaChi nvarchar(50),
		DienThoai int,
		constraint pk_NhaCungCap_MaNCC primary key(MaNCC)
	);
else
	print('Bảng đã tồn tại T.T');

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
	print('Bảng đã tồn tại T.T');

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
	print('Bảng đã tồn tại T.T');

--5_PhieuNhapHang:
if not exists (select 1 from sys.objects where name = 'PhieuNhapHang')
	create table PhieuNhapHang(
		MaSPN int identity unique not null,
		MaDDH int not null,
		NgayNhap int,
		constraint pk_PhieuNhapHang_MaSPN primary key(MaSPN),
		constraint fk_PhieuNhapHang_MaDDH foreign key(MaDDH) references DonDatHang(MaDDH)
	);
else
	print('Bảng đã tồn tại T.T');

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
	print('Bảng đã tồn tại T.T');

--7_PhieuXuatHang:
if not exists (select 1 from sys.objects where name = 'PhieuXuatHang')
	create table PhieuXuatHang(
		MaPX int identity unique not null,
		NgayXuat date,
		TenKhachHang nvarchar,
		constraint pk_ChiTietXuatHang primary key(MaPX)
	);
else
	print('Bảng đã tồn tại T.T');

--8_ChiTietXuatHang:
if not exists (select 1 from sys.objects where name = 'ChiTietXuatHang')
	create table ChiTietXuatHang(
		MaPX int not null,
		MaVT int not null,
		SoLuongXuat int,
		DonGia int,
		constraint fk_ChiTietXuatHang_MaPX foreign key(MaPX) references PhieuXuatHang(MaPX),
		constraint fk_ChiTietXuatHang_MaVT foreign key(MaVT) references VatTu(MaVT)
	);
else
	print('Bảng đã tồn tại T.T');