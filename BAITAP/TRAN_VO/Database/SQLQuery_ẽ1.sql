
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
--Tạo database
IF  NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DB_News')
    BEGIN
        CREATE DATABASE DB_News
		on primary(
			size=5,
			maxsize=50,
			filegrowth=5,
			name=DB_News,
			filename='D:\PCA\Bài tập\SQL\dbnew.mdf'
			)
    END;
use DB_News
--Tạo bảng
IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Thanhvien')
    BEGIN
        CREATE table Thanhvien(
			id int identity,
			taikhoan nvarchar(255),
			matkhau nvarchar(255),
			primary key(id)
			)
    END;
	
IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Dm_baiviet')
    BEGIN
        CREATE table Dm_baiviet(
			id int primary key identity,
			ten nvarchar(255)
			)
    END;
	
IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Baiviet')
    BEGIN
        CREATE table Baiviet(
			id int identity,
			tieude  nvarchar(255),
			noidung ntext,
			hinhanh ntext,
			id_dm int
			)
    END;

-- Insert dữ liệu vào bảng Thanhvien
	insert into Thanhvien values('admin01','admin123');
	insert into Thanhvien values('admin02','admin123');
	insert into Thanhvien values('admin03','admin123');
	insert into Thanhvien values('admin04','admin123');
	insert into Thanhvien values('admin05','admin123');
	insert into Thanhvien values('admin06','admin123');
	insert into Thanhvien values('admin07','admin123');
	insert into Thanhvien values('admin08','admin123');
	insert into Thanhvien values('admin09','admin123');
	insert into Thanhvien values('admin10','admin123');
	insert into Thanhvien values('admin11','admin123');
	insert into Thanhvien values('admin12','admin123');
	insert into Thanhvien values('admin13','admin123');
	insert into Thanhvien values('admin14','admin123');
	insert into Thanhvien values('admin15','admin123');
	insert into Thanhvien values('admin16','admin123');
	insert into Thanhvien values('admin17','admin123');
	insert into Thanhvien values('admin18','admin123');
	insert into Thanhvien values('admin19','admin123');
	insert into Thanhvien values('admin20','admin123');
	insert into Thanhvien values('admin21','admin123');
	insert into Thanhvien values('admin22','admin123');
	insert into Thanhvien values('admin23','admin123');
	insert into Thanhvien values('admin24','admin123');
	insert into Thanhvien values('admin25','admin123');
	insert into Thanhvien values('admin26','admin123');
	insert into Thanhvien values('admin27','admin123');
	insert into Thanhvien values('admin28','admin123');
	insert into Thanhvien values('admin29','admin123');
	insert into Thanhvien values('admin30','admin123');

--Insert dữ liệu vào bảng Dm_baiviet
	insert into Dm_baiviet values('Video');
	insert into Dm_baiviet values(N'Thời sự');
	insert into Dm_baiviet values(N'Góc nhìn');
	insert into Dm_baiviet values(N'Kinh doanh');
	insert into Dm_baiviet values(N'Thế giới');
	insert into Dm_baiviet values(N'Giải trí');
	insert into Dm_baiviet values(N'Pháp luật');
	insert into Dm_baiviet values(N'Giáo dục');
	insert into Dm_baiviet values(N'Sức khỏe');
	insert into Dm_baiviet values(N'Gia đình');
	insert into Dm_baiviet values(N'Du lịch');
	insert into Dm_baiviet values(N'Khoa học');
	insert into Dm_baiviet values(N'Số hóa');
	insert into Dm_baiviet values(N'Cộng đồng');
	insert into Dm_baiviet values(N'Tâm sự');
	insert into Dm_baiviet values(N'Nội dung');
	insert into Dm_baiviet values(N'Nội dung 1');
	insert into Dm_baiviet values(N'Nội dung 11');
	insert into Dm_baiviet values(N'Nội dung 12');
	insert into Dm_baiviet values(N'Nội dung 13');
	insert into Dm_baiviet values(N'Nội dung 14');
	insert into Dm_baiviet values(N'Nội dung 15');
	insert into Dm_baiviet values(N'Nội dung 16');
	insert into Dm_baiviet values(N'Nội dung 17');
	insert into Dm_baiviet values(N'Nội dung 18');
	insert into Dm_baiviet values(N'Nội dung 19');
	insert into Dm_baiviet values(N'Nội dung 111');
	insert into Dm_baiviet values(N'Nội dung 112');
	insert into Dm_baiviet values(N'Nội dung 113');
	insert into Dm_baiviet values(N'Nội dung 114');

--Insert dữ liệu vào bảng baiviet
	insert into Baiviet values(N'Tiêu đề 1', N'Nội dung 1', N'Hình ảnh 1', 1 );
	insert into Baiviet values(N'Tiêu đề 2', N'Nội dung 2', N'Hình ảnh 2', 2 );
	insert into Baiviet values(N'Tiêu đề 3', N'Nội dung 3', N'Hình ảnh 3', 3 );
	insert into Baiviet values(N'Tiêu đề 4', N'Nội dung 4', N'Hình ảnh 4', 4 );
	insert into Baiviet values(N'Tiêu đề 5', N'Nội dung 5', N'Hình ảnh 5', 5 );
	insert into Baiviet values(N'Tiêu đề 6', N'Nội dung 6', N'Hình ảnh 6', 6 );
	insert into Baiviet values(N'Tiêu đề 7', N'Nội dung 7', N'Hình ảnh 7', 7 );
	insert into Baiviet values(N'Tiêu đề 8', N'Nội dung 8', N'Hình ảnh 8', 8 );
	insert into Baiviet values(N'Tiêu đề 9', N'Nội dung 9', N'Hình ảnh 9', 9 );
	insert into Baiviet values(N'Tiêu đề 10', N'Nội dung 10', N'Hình ảnh 10', 10 );
	insert into Baiviet values(N'Tiêu đề 11', N'Nội dung 11', N'Hình ảnh 11', 11 );
	insert into Baiviet values(N'Tiêu đề 12', N'Nội dung 12', N'Hình ảnh 12', 12 );
	insert into Baiviet values(N'Tiêu đề 13', N'Nội dung 13', N'Hình ảnh 13', 13 );
	insert into Baiviet values(N'Tiêu đề 14', N'Nội dung 14', N'Hình ảnh 14', 14 );
	insert into Baiviet values(N'Tiêu đề 15', N'Nội dung 15', N'Hình ảnh 15', 15 );
	insert into Baiviet values(N'Tiêu đề 16', N'Nội dung 16', N'Hình ảnh 16', 16 );
	insert into Baiviet values(N'Tiêu đề 17', N'Nội dung 17', N'Hình ảnh 17', 17 );
	insert into Baiviet values(N'Tiêu đề 18', N'Nội dung 18', N'Hình ảnh 18', 18 );
	insert into Baiviet values(N'Tiêu đề 19', N'Nội dung 19', N'Hình ảnh 19', 19 );
	insert into Baiviet values(N'Tiêu đề 20', N'Nội dung 20', N'Hình ảnh 20', 20 );
	insert into Baiviet values(N'Tiêu đề 21', N'Nội dung 21', N'Hình ảnh 21', 21 );
	insert into Baiviet values(N'Tiêu đề 22', N'Nội dung 22', N'Hình ảnh 22', 22 );
	insert into Baiviet values(N'Tiêu đề 23', N'Nội dung 23', N'Hình ảnh 23', 23 );
	insert into Baiviet values(N'Tiêu đề 24', N'Nội dung 24', N'Hình ảnh 24', 24 );
	insert into Baiviet values(N'Tiêu đề 25', N'Nội dung 25', N'Hình ảnh 25', 25 );
	insert into Baiviet values(N'Tiêu đề 26', N'Nội dung 26', N'Hình ảnh 26', 26 );
	insert into Baiviet values(N'Tiêu đề 27', N'Nội dung 27', N'Hình ảnh 27', 27 );
	insert into Baiviet values(N'Tiêu đề 28', N'Nội dung 28', N'Hình ảnh 28', 28 );
	insert into Baiviet values(N'Tiêu đề 29', N'Nội dung 29', N'Hình ảnh 29', 29 );
	insert into Baiviet values(N'Tiêu đề 30', N'Nội dung 30', N'Hình ảnh 30', 30 );

-- Đổi tên bảng
	sp_rename 'Thanhvien', 'User'

-- Chèn thêm cột cho bảng user
	alter table [User] add Gender ntext
	alter table [User] add Email text
	alter table [User] add Phone int
	alter table [User] add Birthday date
	alter table [User] add Country ntext

-- Thêm dữ liệu cho cột mơi tạo
	set dateformat dmy;
	update [User]
	Set Gender='Nam', Email='admin001@mail.com', Phone='01234561', Birthday='01/01/1990', Country=N'Hà Nội'
	Where id =1;
	update [User]
	Set Gender='Nam', Email='admin002@mail.com', Phone='01234562', Birthday='01/02/1990', Country=N'Nam Định'
	Where id =2;
	update [User]
	Set Gender='Nam', Email='admin003@mail.com', Phone='01234563', Birthday='01/03/1990', Country=N'Lào Cai'
	Where id =3;
	update [User]
	Set Gender='Nam', Email='admin004@mail.com', Phone='01234564', Birthday='01/04/1990', Country=N'Yên Bái'
	Where id =4;
	update [User]
	Set Gender='Nam', Email='admin005@mail.com', Phone='01234565', Birthday='01/05/1990', Country=N'Hồ Chí Minh'
	Where id =5;
	update [User]
	Set Gender='Nam', Email='admin006@mail.com', Phone='01234566', Birthday='01/06/1990', Country=N'Ninh Bình'
	Where id =6;
	update [User]
	Set Gender='Nam', Email='admin007@mail.com', Phone='01234567', Birthday='01/07/1990', Country=N'Hòa Bình'
	Where id =7;
	update [User]
	Set Gender='Nam', Email='admin008@mail.com', Phone='01234568', Birthday='01/08/1990', Country=N'Hà Nội2'
	Where id =8;
	update [User]
	Set Gender='Nam', Email='admin009@mail.com', Phone='01234569', Birthday='01/09/1990', Country=N'Bình Định'
	Where id =9;
	update [User]
	Set Gender='Nam', Email='admin010@mail.com', Phone='01234551', Birthday='01/10/1990', Country=N'Nghệ An'
	Where id =10;
	update [User]
	Set Gender='Nam', Email='admin011@mail.com', Phone='01234552', Birthday='02/01/1990', Country=N'Hà Tĩnh'
	Where id =11;
	update [User]
	Set Gender='Nam', Email='admin012@mail.com', Phone='01234553', Birthday='03/01/1990', Country=N'Long An'
	Where id =12;
	update [User]
	Set Gender='Nam', Email='admin013@mail.com', Phone='01234554', Birthday='04/01/1990', Country=N'Quảng Ninh'
	Where id =13;
	update [User]
	Set Gender='Nam', Email='admin014@mail.com', Phone='01234555', Birthday='05/01/1990', Country=N'Hải Phòng'
	Where id =14;
	update [User]
	Set Gender='Nam', Email='admin015@mail.com', Phone='01234556', Birthday='06/01/1990', Country=N'Điện Biên'
	Where id =15;
	update [User]
	Set Gender='Nam', Email='admin016@mail.com', Phone='01234557', Birthday='07/01/1990', Country=N'Cần Thơ'
	Where id =16;
	update [User]
	Set Gender='Nam', Email='admin017@mail.com', Phone='01234558', Birthday='08/01/1990', Country=N'Hà Nội2'
	Where id =17;
	update [User]
	Set Gender='Nam', Email='admin018@mail.com', Phone='01234559', Birthday='09/01/1990', Country=N'Phú Thọ'
	Where id =18;
	update [User]
	Set Gender='Nam', Email='admin019@mail.com', Phone='01234570', Birthday='10/01/1990', Country=N'Nam Định'
	Where id =19;
	update [User]
	Set Gender='Nam', Email='admin020@mail.com', Phone='01234571', Birthday='11/01/1990', Country=N'Hà Nội'
	Where id =20;
	update [User]
	Set Gender='Nam', Email='admin021@mail.com', Phone='01234572', Birthday='12/01/1990', Country=N'Hà Nội3'
	Where id =21;
	update [User]
	Set Gender='Nam', Email='admin022@mail.com', Phone='01234573', Birthday='13/01/1990', Country=N'Hà Nội4'
	Where id =22;
	update [User]
	Set Gender='Nam', Email='admin023@mail.com', Phone='01234574', Birthday='14/01/1990', Country=N'Hà Nội5'
	Where id =23;
	update [User]
	Set Gender='Nam', Email='admin024@mail.com', Phone='01234575', Birthday='15/01/1990', Country=N'Hà Nội6'
	Where id =24;
	update [User]
	Set Gender='Nam', Email='admin025@mail.com', Phone='01234576', Birthday='16/01/1990', Country=N'Hà Nội7'
	Where id =25;
	update [User]
	Set Gender='Nam', Email='admin026@mail.com', Phone='01234577', Birthday='17/01/1990', Country=N'Nam định'
	Where id =26;
	update [User]
	Set Gender='Nam', Email='admin027@mail.com', Phone='01234578', Birthday='18/01/1990', Country=N'Long Khánh'
	Where id =27;
	update [User]
	Set Gender='Nam', Email='admin028@mail.com', Phone='01234579', Birthday='19/01/1990', Country=N'Đà Nẵng'
	Where id =28;
	update [User]
	Set Gender='Nam', Email='admin029@mail.com', Phone='01234580', Birthday='20/01/1990', Country=N'Cà Mau'
	Where id =29;
	update [User]
	Set Gender='Nam', Email='admin030@mail.com', Phone='01234581', Birthday='20/01/1990', Country=N'Vũng Tàu'
	Where id =30;
	
	select CONVERT(VARCHAR(10), GETDATE(), 103)


 alter table Baiviet add constraint fkbaiviet  foreign key(id_dm) references Dm_Baiviet
 alter table Baiviet with nocheck add constraint fkbaiviet  foreign key(id_dm) references Dm_Baiviet
-- Tìm và xóa danh mục
	ALTER TABLE Baiviet DROP CONSTRAINT fkbaiviet
	delete from Dm_baiviet where ten=N'Thời sự';

--Select bảng
	Select*from Thanhvien;
	Select*from Dm_baiviet;
	Select*from Baiviet;
	Select*from [dbo].[User];

