IF  NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DB_News')
    BEGIN
        CREATE DATABASE DB_News
		on primary(
			size=5,
			maxsize=50,
			filegrowth=5,
			name=DB_News,
			filename='D:\PCA\PCAEx\PCATranningEX\BAITAP\TRAN_VO\Database\dbnew.mdf'
			)
    END;
use DB_News
IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Thanhvien')
    BEGIN
        CREATE table Thanhvien(
			id int identity,
			taikhoan varchar(255),
			matkhau varchar(255)
			)
    END;
	SELECT*FROM Thanhvien;
IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Dm_baiviet')
    BEGIN
        CREATE table Dm_baiviet(
			id int identity,
			ten varchar(255)
			)
    END;
	SELECT*FROM Dm_baiviet;
IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Baiviet')
    BEGIN
        CREATE table Baiviet(
			id int identity,
			tieude  varchar(255),
			noidung text,
			hinhanh text,
			id_dm int
			)
    END;
	SELECT*FROM Baiviet;
	IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Baiviet1')
    BEGIN
        CREATE table Baiviet1(
			id int identity,
			tieude  varchar(255),
			noidung text,
			hinhanh text,
			id_dm int
			)
    END;
	SELECT*FROM Baiviet1;