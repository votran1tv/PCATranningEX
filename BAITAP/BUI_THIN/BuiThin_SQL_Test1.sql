if not exists(select * from sys.databases where name='db_news')
begin
	create database db_news
	on primary --Tạo tập tin data --
	(
		name = db_news,
		filename = 'D:\BuiThin\DemoSQL\db_news.mdf',
		size = 5,
		maxsize = 50,
		filegrowth = 5
	)
	log on --Tạo tập tin log--
	(
		name = db_news_log,
		filename = 'D:\BuiThin\DemoSQL\db_news.ldf',
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
	TaiKhoan varchar(255) not null,
	MatKhau varchar(255) 
)
create table Dm_BaiViet
(
	IDBaiViet int identity(1, 1) primary key,
	TenDm varchar(255) not null
)
create table BaiViet
(
	IDPost int identity(1,1) primary key,
	TieuDe nvarchar(255) not null,
	NoiDung text not null,
	HinhAnh text,
	ID_Dm int foreign key references Dm_BaiViet(IDBaiViet)
)

SELECT * FROM ThanhVien
INSERT INTO ThanhVien VALUES('buicongthinit', '123')

