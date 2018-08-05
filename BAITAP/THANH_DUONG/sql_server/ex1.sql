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
			TaiKhoan nvarchar(255),
			MatKhau nvarchar(255)
		)
	end;
if not exists (select * from sysobjects where name = 'DM_BaiViet')
	begin
		create table DM_BaiViet(
			ID int primary key identity,
			Ten_DM nvarchar(255)
		)
	end;
if not exists (select * from sysobjects where name = 'BaiViet')
	begin 
		create table BaiViet(
			ID int primary key identity,
			TieuDe nvarchar(225),
			NoiDung ntext,
			HinhAnh ntext,
			id_dm int,
			foreign key (id_dm) references DM_BaiViet(ID)
		)
	end

INSERT INTO ThanhVien VALUES('duongth','123456');
INSERT INTO ThanhVien VALUES('duongth02','123456');
INSERT INTO ThanhVien VALUES('duongth03','123456');
INSERT INTO ThanhVien VALUES('duongth04','123456');
INSERT INTO ThanhVien VALUES('duongth05','123456');
INSERT INTO ThanhVien VALUES('duongth06','123456');
INSERT INTO ThanhVien VALUES('duongth07','123456');
INSERT INTO ThanhVien VALUES('duongth08','123456');
INSERT INTO ThanhVien VALUES('duongth09','123456');
INSERT INTO ThanhVien VALUES('duongth10','123456');
INSERT INTO ThanhVien VALUES('duongth11','123456');
INSERT INTO ThanhVien VALUES('duongth12','123456');
INSERT INTO ThanhVien VALUES('duongth13','123456');
INSERT INTO ThanhVien VALUES('duongth14','123456');
INSERT INTO ThanhVien VALUES('duongth15','123456');
INSERT INTO ThanhVien VALUES('duongth16','123456');
INSERT INTO ThanhVien VALUES('duongth17','123456');
INSERT INTO ThanhVien VALUES('duongth18','123456');
INSERT INTO ThanhVien VALUES('duongth19','123456');
INSERT INTO ThanhVien VALUES('duongth20','123456');
INSERT INTO ThanhVien VALUES('duongth21','123456');
INSERT INTO ThanhVien VALUES('duongth22','123456');
INSERT INTO ThanhVien VALUES('duongth23','123456');
INSERT INTO ThanhVien VALUES('duongth24','123456');
INSERT INTO ThanhVien VALUES('duongth25','123456');
INSERT INTO ThanhVien VALUES('duongth26','123456');
INSERT INTO ThanhVien VALUES('duongth27','123456');
INSERT INTO ThanhVien VALUES('duongth28','123456');
INSERT INTO ThanhVien VALUES('duongth29','123456');
INSERT INTO ThanhVien VALUES('duongth30','123456');

INSERT INTO DM_BaiViet VALUES(N'thể thao');
INSERT INTO DM_BaiViet VALUES(N'video');
INSERT INTO DM_BaiViet VALUES(N'góc nhìn');
INSERT INTO DM_BaiViet VALUES(N'thế giới');
INSERT INTO DM_BaiViet VALUES(N'kinh doanh');
INSERT INTO DM_BaiViet VALUES(N'giải trí');
INSERT INTO DM_BaiViet VALUES(N'pháp luật');
INSERT INTO DM_BaiViet VALUES(N'giáo dục');
INSERT INTO DM_BaiViet VALUES(N'sức khỏe');
INSERT INTO DM_BaiViet VALUES(N'gia đình');
INSERT INTO DM_BaiViet VALUES(N'du lịch');
INSERT INTO DM_BaiViet VALUES(N'khoa học');
INSERT INTO DM_BaiViet VALUES(N'số hóa');
INSERT INTO DM_BaiViet VALUES(N'xe');
INSERT INTO DM_BaiViet VALUES(N'cộng đồng');
INSERT INTO DM_BaiViet VALUES(N'tâm sự');
INSERT INTO DM_BaiViet VALUES(N'cười');
INSERT INTO DM_BaiViet VALUES('de muc 18');
INSERT INTO DM_BaiViet VALUES('de muc 19');
INSERT INTO DM_BaiViet VALUES('de muc 20');
INSERT INTO DM_BaiViet VALUES('de muc 21');
INSERT INTO DM_BaiViet VALUES('de muc 22');
INSERT INTO DM_BaiViet VALUES('de muc 23');
INSERT INTO DM_BaiViet VALUES('de muc 24');
INSERT INTO DM_BaiViet VALUES('de muc 25');
INSERT INTO DM_BaiViet VALUES('de muc 26');
INSERT INTO DM_BaiViet VALUES('de muc 27');
INSERT INTO DM_BaiViet VALUES('de muc 28');
INSERT INTO DM_BaiViet VALUES('de muc 29');
INSERT INTO DM_BaiViet VALUES('de muc 30');

INSERT INTO BaiViet VALUES('tieu de 01','day la noi dung 01','hinhanh-01',1);
INSERT INTO BaiViet VALUES('tieu de 02','day la noi dung 02','hinhanh-02',3);
INSERT INTO BaiViet VALUES('tieu de 03','day la noi dung 03','hinhanh-03',4);
INSERT INTO BaiViet VALUES('tieu de 04','day la noi dung 04','hinhanh-04',6);
INSERT INTO BaiViet VALUES('tieu de 05','day la noi dung 05','hinhanh-05',11);
INSERT INTO BaiViet VALUES('tieu de 06','day la noi dung 06','hinhanh-06',13);
INSERT INTO BaiViet VALUES('tieu de 07','day la noi dung 07','hinhanh-07',5);
INSERT INTO BaiViet VALUES('tieu de 08','day la noi dung 08','hinhanh-08',18);
INSERT INTO BaiViet VALUES('tieu de 09','day la noi dung 09','hinhanh-09',20);
INSERT INTO BaiViet VALUES('tieu de 10','day la noi dung 10','hinhanh-10',18);
INSERT INTO BaiViet VALUES('tieu de 11','day la noi dung 11','hinhanh-11',13);
INSERT INTO BaiViet VALUES('tieu de 12','day la noi dung 12','hinhanh-12',6);
INSERT INTO BaiViet VALUES('tieu de 13','day la noi dung 13','hinhanh-13',7);
INSERT INTO BaiViet VALUES('tieu de 14','day la noi dung 14','hinhanh-14',7);
INSERT INTO BaiViet VALUES('tieu de 15','day la noi dung 15','hinhanh-15',8);
INSERT INTO BaiViet VALUES('tieu de 16','day la noi dung 16','hinhanh-16',15);
INSERT INTO BaiViet VALUES('tieu de 17','day la noi dung 17','hinhanh-17',13);
INSERT INTO BaiViet VALUES('tieu de 18','day la noi dung 18','hinhanh-18',15);
INSERT INTO BaiViet VALUES('tieu de 19','day la noi dung 19','hinhanh-19',11);
INSERT INTO BaiViet VALUES('tieu de 20','day la noi dung 20','hinhanh-20',18);
INSERT INTO BaiViet VALUES('tieu de 21','day la noi dung 21','hinhanh-21',20);
INSERT INTO BaiViet VALUES('tieu de 22','day la noi dung 22','hinhanh-22',23);
INSERT INTO BaiViet VALUES('tieu de 23','day la noi dung 23','hinhanh-23',30);
INSERT INTO BaiViet VALUES('tieu de 24','day la noi dung 24','hinhanh-24',23);
INSERT INTO BaiViet VALUES('tieu de 25','day la noi dung 25','hinhanh-25',27);
INSERT INTO BaiViet VALUES('tieu de 26','day la noi dung 26','hinhanh-26',28);
INSERT INTO BaiViet VALUES('tieu de 27','day la noi dung 27','hinhanh-27',24);
INSERT INTO BaiViet VALUES('tieu de 28','day la noi dung 28','hinhanh-28',21);
INSERT INTO BaiViet VALUES('tieu de 29','day la noi dung 29','hinhanh-29',20);
INSERT INTO BaiViet VALUES('tieu de 30','day la noi dung 30','hinhanh-30',14);

sp_rename 'ThanhVien','Users'

ALTER TABLE Users ADD 
	Gender nvarchar(10), 
	Email nvarchar(255),
	Phone int,
	Birthday date,
	Country ntext

