if not exists (select * from sys.databases where name = 'db_news')
begin
create database db_news
on primary(
	name = db_news,
	filename = 'D:\SQL EXE\db_news.mdf',
	size = 5,
	maxsize = 50,
	filegrowth = 5);
end

if not exists (select * from sys.databases where name = 'db_news')
begin
create database db_news
on primary(
	name = db_news,
	filename = 'D:\SQL EXE\db_news.mdf',
	size = 5,
	maxsize = 50,
	filegrowth = 5);
end

use db_news

if not exists (select * from sys.objects where name = 'Thanh_Vien')
begin
create table Thanh_Vien (
Id int not null identity(1, 1) unique,
TaiKhoan nchar(255),
MatKhau nvarchar(255),
constraint pk_Thanh_Vien primary key(Id)
);
end

if not exists (select * from sys.objects where name = 'Dm_BaiViet')
begin
create table Dm_BaiViet (
Id int,
TenDm nvarchar(255),
constraint fk_Dm_BaiViet foreign key(Id) references Thanh_Vien(Id)
);
end

if not exists (select * from sys.objects where name = 'Bai_Viet')
begin
create table Bai_Viet (
Id int,
TieuDe nchar(255),
NoiDung text,
HinhAnh text,
constraint fk_Bai_Viet foreign key(Id) references Thanh_Vien(Id)
);
end

select * from Thanh_Vien
select * from Dm_BaiViet
select * from Bai_Viet