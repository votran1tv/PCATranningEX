if not exists (select * from sys.databases where name = N'DB_NEWS')
	begin
		create database DB_NEWS
		on primary(
			size = 5,
			maxsize = 50,
			filegrowth = 5,
			filename = 'D:\DB_NEWS.mdf',
			name = DB_NEWS
		)
	end;
	
use DB_NEWS;

if not exists (select * from sysobjects where name = 'ThanhVien')
	begin
		create table ThanhVien(
			ID int primary key identity,
			TaiKhoan varchar(255),
			MatKhau varchar(255)
		)
	end;
if not exists (select * from sysobjects where name = 'DM_BaiViet')
	begin
		create table DM_BaiViet(
			ID int primary key identity,
			Ten_DM varchar(255)
		)
	end;
if not exists (select * from sysobjects where name = 'BaiViet')
	begin 
		create table BaiViet(
			ID int primary key identity,
			TieuDe varchar(225),
			NoiDung text,
			HinhAnh text,
			id_dm int,
			foreign key (id_dm) references DM_BaiViet(ID)
		)
	end

SELECT * FROM BaiViet
