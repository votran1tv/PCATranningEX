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
			matkhau nvarchar(255)
			)
    END;
	
IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Dm_baiviet')
    BEGIN
        CREATE table Dm_baiviet(
			id int identity,
			ten nvarchar(255)
			)
    END;
	
IF  NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Baiviet')
    BEGIN
        CREATE table Baiviet(
			id int identity,
			tieude  nvarchar(255),
			noidung text,
			hinhanh text,
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
	alter table [User] add Gender nvarchar(10)
	alter table [User] add Email nvarchar(255)
	alter table [User] add Phone varchar
	alter table [User] add Birthday date
	alter table [User] add Country nvarchar(255)

-- Thêm dữ liệu cho cột mơi tạo
	insert into [User] (Gender,Email, Phone, Birthday, Country) values (N'Nam','admin01@mail.com','123456','01/01/1990',N'Hà Nội');

--Select bảng
Select*from Thanhvien;
Select*from Dm_baiviet;
Select*from Baiviet;
Select*from [dbo].[User];