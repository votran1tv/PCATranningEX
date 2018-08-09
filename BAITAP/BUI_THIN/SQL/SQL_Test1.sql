
if not exists(select * from sys.databases where name='db_news')
begin
	create database db_news
	on primary --Tạo tập tin data --
	(
		name = db_news,
		filename = 'D:\BuiThin\CSDL SQL\db_news.mdf',
		size = 5,
		maxsize = 50,
		filegrowth = 5
	)
	log on --Tạo tập tin log--
	(
		name = db_news_log,
		filename = 'D:\BuiThin\CSDL SQL\db_news.ldf',
		size = 10,
		maxsize = 100,
		filegrowth = 10
	)
end

use db_news --Sử dụng cơ sở dữ liệu vừa tạo ở trên--

--Tạo các bảng trong CSDL ở trên--

create table ThanhVien
(
	ID int identity(1, 1) primary key,
	TaiKhoan varchar(255) not null unique,
	MatKhau varchar(255) 
)

create table Dm_BaiViet
(
	IDBaiViet int identity(1, 1) primary key,
	TenDm nvarchar(255) not null UNIQUE
)

create table BaiViet
(
	IDPost int identity(1,1) primary key,
	TieuDe nvarchar(255) not null,
	NoiDung text not null,
	HinhAnh text,
	ID_Dm int foreign key references Dm_BaiViet(IDBaiViet)
)

/*Thêm cơ sở dữ liệu vào các bảng*/
INSERT INTO ThanhVien VALUES('buicongthinit1', '123')
INSERT INTO ThanhVien VALUES('buicongthinit2', '123')
INSERT INTO ThanhVien VALUES('buicongthinit3', '123')
INSERT INTO ThanhVien VALUES('buicongthinit4', '123')
INSERT INTO ThanhVien VALUES('buicongthinit5', '123')
INSERT INTO ThanhVien VALUES('buicongthinit6', '123')
INSERT INTO ThanhVien VALUES('buicongthinit7', '123')
INSERT INTO ThanhVien VALUES('buicongthinit8', '123')
INSERT INTO ThanhVien VALUES('buicongthinit9', '123')
INSERT INTO ThanhVien VALUES('buicongthinit10', '123')
INSERT INTO ThanhVien VALUES('buicongthinit11', '123')
INSERT INTO ThanhVien VALUES('buicongthinit12', '123')
INSERT INTO ThanhVien VALUES('buicongthinit13', '123')
INSERT INTO ThanhVien VALUES('buicongthinit14', '123')
INSERT INTO ThanhVien VALUES('buicongthinit15', '123')
INSERT INTO ThanhVien VALUES('buicongthinit16', '123')
INSERT INTO ThanhVien VALUES('buicongthinit17', '123')
INSERT INTO ThanhVien VALUES('buicongthinit18', '123')
INSERT INTO ThanhVien VALUES('buicongthinit19', '123')
INSERT INTO ThanhVien VALUES('buicongthinit20', '123')
INSERT INTO ThanhVien VALUES('buicongthinit21', '123')
INSERT INTO ThanhVien VALUES('buicongthinit22', '123')
INSERT INTO ThanhVien VALUES('buicongthinit23', '123')
INSERT INTO ThanhVien VALUES('buicongthinit24', '123')
INSERT INTO ThanhVien VALUES('buicongthinit25', '123')
INSERT INTO ThanhVien VALUES('buicongthinit26', '123')
INSERT INTO ThanhVien VALUES('buicongthinit27', '123')
INSERT INTO ThanhVien VALUES('buicongthinit28', '123')
INSERT INTO ThanhVien VALUES('buicongthinit29', '123')
INSERT INTO ThanhVien VALUES('buicongthinit30', '123')

SELECT * FROM ThanhVien


INSERT INTO Dm_BaiViet values('dm1')
INSERT INTO Dm_BaiViet values('dm2')
INSERT INTO Dm_BaiViet values('dm3')
INSERT INTO Dm_BaiViet values('dm4')
INSERT INTO Dm_BaiViet values('dm5')
INSERT INTO Dm_BaiViet values('dm6')
INSERT INTO Dm_BaiViet values('dm7')
INSERT INTO Dm_BaiViet values('dm8')
INSERT INTO Dm_BaiViet values('dm9')
INSERT INTO Dm_BaiViet values('dm10')
INSERT INTO Dm_BaiViet values('dm11')
INSERT INTO Dm_BaiViet values('dm12')
INSERT INTO Dm_BaiViet values('dm13')
INSERT INTO Dm_BaiViet values('dm14')
INSERT INTO Dm_BaiViet values('dm15')
INSERT INTO Dm_BaiViet values('dm16')
INSERT INTO Dm_BaiViet values('dm17')
INSERT INTO Dm_BaiViet values('dm18')
INSERT INTO Dm_BaiViet values('dm19')
INSERT INTO Dm_BaiViet values('dm20')
INSERT INTO Dm_BaiViet values('dm21')
INSERT INTO Dm_BaiViet values('dm22')
INSERT INTO Dm_BaiViet values('dm23')
INSERT INTO Dm_BaiViet values('dm24')
INSERT INTO Dm_BaiViet values('dm25')
INSERT INTO Dm_BaiViet values('dm26')
INSERT INTO Dm_BaiViet values('dm27')
INSERT INTO Dm_BaiViet values('dm28')
INSERT INTO Dm_BaiViet values('dm29')
INSERT INTO Dm_BaiViet values('dm30')
INSERT INTO Dm_BaiViet values(N'Thể thao')

SELECT * FROM Dm_BaiViet


INSERT INTO BaiViet values('TieuDe1', 'NoiDung1', null, 2)
INSERT INTO BaiViet values('TieuDe2', 'NoiDung2', null, 3)
INSERT INTO BaiViet values('TieuDe3', 'NoiDung3', null, 1)
INSERT INTO BaiViet values('TieuDe4', 'NoiDung4', null, 5)
INSERT INTO BaiViet values('TieuDe5', 'NoiDung5', null, 4)
INSERT INTO BaiViet values('TieuDe6', 'NoiDung6', null, 4)
INSERT INTO BaiViet values('TieuDe7', 'NoiDung7', null, 2)
INSERT INTO BaiViet values('TieuDe8', 'NoiDung8', null, 25)
INSERT INTO BaiViet values('TieuDe9', 'NoiDung9', null, 8)
INSERT INTO BaiViet values('TieuDe10', 'NoiDung10', null, 2)
INSERT INTO BaiViet values('TieuDe11', 'NoiDung11', null, 2)
INSERT INTO BaiViet values('TieuDe12', 'NoiDung12', null, 10)
INSERT INTO BaiViet values('TieuDe13', 'NoiDung13', null, 2)
INSERT INTO BaiViet values('TieuDe14', 'NoiDung14', null, 23)
INSERT INTO BaiViet values('TieuDe15', 'NoiDung15', null, 12)
INSERT INTO BaiViet values('TieuDe16', 'NoiDung16', null, 2)
INSERT INTO BaiViet values('TieuDe17', 'NoiDung17', null, 2)
INSERT INTO BaiViet values('TieuDe18', 'NoiDung18', null, 22)
INSERT INTO BaiViet values('TieuDe19', 'NoiDung19', null, 18)
INSERT INTO BaiViet values('TieuDe20', 'NoiDung20', null, 23)
INSERT INTO BaiViet values('TieuDe21', 'NoiDung21', null, 26)
INSERT INTO BaiViet values('TieuDe22', 'NoiDung22', null, 2)
INSERT INTO BaiViet values('TieuDe23', 'NoiDung23', null, 26)
INSERT INTO BaiViet values('TieuDe24', 'NoiDung24', null, 12)
INSERT INTO BaiViet values('TieuDe25', 'NoiDung25', null, 2)
INSERT INTO BaiViet values('TieuDe26', 'NoiDung26', null, 27)
INSERT INTO BaiViet values('TieuDe27', 'NoiDung27', null, 2)
INSERT INTO BaiViet values('TieuDe28', 'NoiDung28', null, 29)
INSERT INTO BaiViet values('TieuDe29', 'NoiDung29', null, 2)
INSERT INTO BaiViet values('TieuDe30', 'NoiDung30', null, 20)
INSERT INTO BaiViet values('TieuDe31', 'NoiDung31', null, 31)

SELECT * FROM BaiViet


/*Đổi tên bảng Thanhvien thành bảng User*/
ALTER TABLE 
sp_rename 'ThanhVien', 'User'
select * from [User]

/*Chèn thêm cột gender, email, phone, birthday, country cho bảng User*/
ALTER TABLE [User] ADD 
Gender varchar(10),
Email varchar(50),
Phone int,
BirthDay date,
Country nvarchar(255)

set dateformat dmy;


/*Thêm dữ liệu cho các cột mới thêm*/
UPDATE [User] SET
Gender = 'Nam', Email = 'email@gmail.com', Phone = 01234561231, BirthDay = '21/09/1993', Country = N'VN'
where ID = 1;
UPDATE [User] SET
Gender = N'Nu', Email = 'email1@gmail.com', Phone = 01234561232, BirthDay = '09/09/1996', Country = N'VNI'
where ID = 2;
UPDATE [User] SET
Gender = 'Nam', Email = 'email2@gmail.com', Phone = 01234561233, BirthDay = '21/02/1998', Country = N'VN'
where ID = 3;
UPDATE [User] SET
Gender = 'Nam', Email = 'email3@gmail.com', Phone = 01234561234, BirthDay = '12/11/1992', Country = N'VN'
where ID = 4
UPDATE [User] SET
Gender = 'Nam', Email = 'email4@gmail.com', Phone = 01234561235, BirthDay = '21/03/1991', Country = N'VN'
where ID = 5
UPDATE [User] SET
Gender = N'Nu', Email = 'email5@gmail.com', Phone = 01234561236, BirthDay = '11/11/1991', Country = N'VN'
where ID = 6
UPDATE [User] SET
Gender = N'Nu', Email = 'email6@gmail.com', Phone = 01234561237, BirthDay = '21/09/1992', Country = N'VNI'
where ID = 7
UPDATE [User] SET
Gender = 'Nam', Email = 'email7@gmail.com', Phone = 01234561238, BirthDay = '21/09/1993', Country = N'VN'
where ID = 8
UPDATE [User] SET
Gender = 'Nam', Email = 'email8@gmail.com', Phone = 01234561239, BirthDay = '22/06/1996', Country = N'VN'
where ID = 9
UPDATE [User] SET
Gender = 'Nam', Email = 'email9@gmail.com', Phone = 01234561240, BirthDay = '28/09/1988', Country = N'Việt Nam'
where ID = 10
UPDATE [User] SET
Gender = 'Nam', Email = 'email10@gmail.com', Phone = 01234561241, BirthDay = '12/09/1991', Country = N'VN'
where ID = 11
UPDATE [User] SET
Gender = N'Nu', Email = 'email11@gmail.com', Phone = 01234561242, BirthDay = '17/09/1994', Country = N'VN'
where ID = 12
UPDATE [User] SET
Gender = 'Nam', Email = 'email12@gmail.com', Phone = 01234561243, BirthDay = '21/11/1992', Country = N'VNI'
where ID = 13
UPDATE [User] SET
Gender = 'Nam', Email = 'email13@gmail.com', Phone = 01234561244, BirthDay = '21/07/1991', Country = N'VN'
where ID = 14
UPDATE [User] SET
Gender = N'Nu', Email = 'email14@gmail.com', Phone = 01234561245, BirthDay = '17/02/1999', Country = N'VN'
where ID = 15
UPDATE [User] SET
Gender = 'Nam', Email = 'email15@gmail.com', Phone = 01234561246, BirthDay = '20/03/1997', Country = N'VN'
where ID = 16
UPDATE [User] SET
Gender = N'Nu', Email = 'email16@gmail.com', Phone = 01234561247, BirthDay = '26/12/1992', Country = N'VN'
where ID = 17
UPDATE [User] SET
Gender = 'Nam', Email = 'email17@gmail.com', Phone = 01234561248, BirthDay = '22/02/1993', Country = N'VN'
where ID = 18
UPDATE [User] SET
Gender = 'Nu', Email = 'email18@gmail.com', Phone = 01234561249, BirthDay = '01/02/1994', Country = N'VN'
where ID = 19
UPDATE [User] SET
Gender = 'Nam', Email = 'email19@gmail.com', Phone = 01234561250, BirthDay = '11/11/1992', Country = N'VN'
where ID = 20
UPDATE [User] SET
Gender = N'Nu', Email = 'email20@gmail.com', Phone = 01234561251, BirthDay = '18/01/1991', Country = N'VN'
where ID = 21
UPDATE [User] SET
Gender = 'Nam', Email = 'email21@gmail.com', Phone = 01234561252, BirthDay = '17/05/1990', Country = N'VNI'
where ID = 22
UPDATE [User] SET
Gender = 'Nam', Email = 'email22@gmail.com', Phone = 01234561253, BirthDay = '02/01/1996', Country = N'VN'
where ID = 23
UPDATE [User] SET
Gender = 'Nam', Email = 'email23@gmail.com', Phone = 01234561254, BirthDay = '29/03/1995', Country = N'VN'
where ID = 24
UPDATE [User] SET
Gender = N'Nu', Email = 'email24@gmail.com', Phone = 01234561255, BirthDay = '22/02/1993', Country = N'VN'
where ID = 25
UPDATE [User] SET
Gender = 'Nam', Email = 'email25@gmail.com', Phone = 01234561256, BirthDay = '05/09/1999', Country = N'VN'
where ID = 26
UPDATE [User] SET
Gender = N'Nu', Email = 'email26@gmail.com', Phone = 01234561257, BirthDay = '04/09/1990', Country = N'VNI'
where ID = 27
UPDATE [User] SET
Gender = 'Nam', Email = 'email27@gmail.com', Phone = 01234561258, BirthDay = '20/06/1989', Country = N'VN'
where ID = 28
UPDATE [User] SET
Gender = N'Nu', Email = 'email28@gmail.com', Phone = 01234561259, BirthDay = '21/02/1992', Country = N'VN'
where ID = 29
UPDATE [User] SET
Gender = 'Nam', Email = 'email29@gmail.com', Phone = 01234561260, BirthDay = '07/01/1991', Country = N'Việt Nam'
where ID = 30

/*Test thử tính năng convert*/
select ID, Gender, (select convert(varchar, BirthDay, 103) from [User] where ID = 1) AS [SN]
FROM [User]
where ID = 1

/*Convert Birthday về dạng dd/mm/yyyy*/
select convert(varchar, BirthDay, 103) AS [Sinh nhật] from [User]
/*Tìm danh mục Thể Thao trong bảng danh mục và xóa bỏ danh mục đó*/
DELETE FROM Dm_BaiViet
where TenDm = N'Thể thao'
/*Sử dụng lệnh Truncate Table để xóa bản ghi + xóa luôn index của các trường có thuộc tính tự tăng Identity*/
