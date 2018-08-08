if not exists (select * from sys.databases where name = N'DB_NEWS')
	begin
		create database DB_NEWS
		-- on primary(
		-- 	size = 5,
		-- 	maxsize = 50,
		-- 	filegrowth = 5,
		-- filename = '/home/duongth/db/DB/DB_NEWS.mdf',
		-- 	name = DB_NEWS
		-- )
	end;

-- DROP DATABASE DB_NEWS
-- use master
	
use DB_NEWS;

if not exists (select * from sysobjects where name = 'ThanhVien')
	begin
		create table ThanhVien(
			ID int identity,
			TaiKhoan nvarchar(255),
			MatKhau nvarchar(255),
			constraint PK_ThanhVien PRIMARY KEY (ID)
		)
	end;
if not exists (select * from sysobjects where name = 'DM_BaiViet')
	begin
		create table DM_BaiViet(
			ID int identity,
			Ten_DM nvarchar(255),
			constraint PK_DM_BaiViet PRIMARY KEY (ID)
		)
	end;
if not exists (select * from sysobjects where name = 'BaiViet')
	begin 
		create table BaiViet(
			ID int identity,
			TieuDe nvarchar(225),
			NoiDung ntext,
			HinhAnh ntext,
			id_dm int,
			CONSTRAINT PK_BaiViet PRIMARY key (ID),
			CONSTRAINT FK_id_dm FOREIGN key (id_dm) REFERENCES DM_BaiViet(ID)
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
INSERT INTO BaiViet VALUES('tieu de 13','day la noi dung 13','hinhanh-13',1);
INSERT INTO BaiViet VALUES('tieu de 14','day la noi dung 14','hinhanh-14',7);
INSERT INTO BaiViet VALUES('tieu de 15','day la noi dung 15','hinhanh-15',8);
INSERT INTO BaiViet VALUES('tieu de 16','day la noi dung 16','hinhanh-16',15);
INSERT INTO BaiViet VALUES('tieu de 17','day la noi dung 17','hinhanh-17',13);
INSERT INTO BaiViet VALUES('tieu de 18','day la noi dung 18','hinhanh-18',15);
INSERT INTO BaiViet VALUES('tieu de 19','day la noi dung 19','hinhanh-19',11);
INSERT INTO BaiViet VALUES('tieu de 20','day la noi dung 20','hinhanh-20',18);
INSERT INTO BaiViet VALUES('tieu de 21','day la noi dung 21','hinhanh-21',20);
INSERT INTO BaiViet VALUES('tieu de 22','day la noi dung 22','hinhanh-22',1);
INSERT INTO BaiViet VALUES('tieu de 23','day la noi dung 23','hinhanh-23',30);
INSERT INTO BaiViet VALUES('tieu de 24','day la noi dung 24','hinhanh-24',23);
INSERT INTO BaiViet VALUES('tieu de 25','day la noi dung 25','hinhanh-25',27);
INSERT INTO BaiViet VALUES('tieu de 26','day la noi dung 26','hinhanh-26',28);
INSERT INTO BaiViet VALUES('tieu de 27','day la noi dung 27','hinhanh-27',24);
INSERT INTO BaiViet VALUES('tieu de 28','day la noi dung 28','hinhanh-28',21);
INSERT INTO BaiViet VALUES('tieu de 29','day la noi dung 29','hinhanh-29',20);
INSERT INTO BaiViet VALUES('tieu de 30','day la noi dung 30','hinhanh-30',14);

sp_rename 'ThanhVien','User'

ALTER TABLE [User] ADD 
	Gender nvarchar(10), 
	Email nvarchar(255),
	Phone int,
	Birthday date,
	Country ntext

--SELECT Birthday FROM [User]
-- câu lệnh để máy tính hiểu người dùng nhập date định dạng kiểu dd/mm/yyyy
set dateformat dmy;

update [User]
	set Gender=N'Nam',Email='example001@gmail.com',Phone='0123456781',Birthday = '03/04/1994',Country=N'Hà NỘI'
WHERE ID = 1;
update [User]
	set Gender='Nu',Email='example002@gmail.com',Phone='0123456782',Birthday= '03/04/1991',Country=N'Hà NỘI'
WHERE ID = 2;
update [User]
	set Gender='Nu',Email='example003@gmail.com',Phone='0123456783',Birthday= '03/04/1994',Country=N'Hải Phòng'
WHERE ID = 3;
update [User]
	set Gender='Nam',Email='example004@gmail.com',Phone='0123456784',Birthday= '17/07/1994',Country=N'Hải Phòng'
WHERE ID = 4;
update [User]
	set Gender='Nu',Email='example005@gmail.com',Phone='0123456785',Birthday='22/07/1996',Country=N'Hà Nam'
WHERE ID = 5;
update [User]
	set Gender='Nu',Email='example006@gmail.com',Phone='0123456786',Birthday='21/01/1992',Country=N'Quảng Bình'
WHERE ID = 6;
update [User]
	set Gender='Nu',Email='example007@gmail.com',Phone='0123456787',Birthday='21/09/1997',Country=N'Phú Thọ'
WHERE ID = 7;
update [User]
	set Gender='Nam',Email='example008@gmail.com',Phone='0123456788',Birthday='16/11/1994',Country=N'Nam Định'
WHERE ID = 8;
update [User]
	set Gender='Nu',Email='example009@gmail.com',Phone='0123456789',Birthday='29/12/1992',Country=N'Hòa Bình'
WHERE ID = 9;
update [User]
	set Gender='Nam',Email='example010@gmail.com',Phone='0123456710',Birthday='11/12/1997',Country=N'Hà Nội'
WHERE ID = 10;
update [User]
	set Gender='Nam',Email='example011@gmail.com',Phone='0123456711',Birthday='15/07/1995',Country=N'Hà Nội'
WHERE ID = 11;
update [User]
	set Gender='Nam',Email='example011@gmail.com',Phone='0123456711',Birthday='15/07/1995',Country=N'Hà Nội'
WHERE ID = 12;
update [User]
	set Gender='Nu',Email='example012@gmail.com',Phone='0123456712',Birthday='15/02/1993',Country=N'Nạm Định'
WHERE ID = 13;
update [User]
	set Gender='Nu',Email='example013@gmail.com',Phone='0123456713',Birthday='15/09/1993',Country=N'Sơn La'
WHERE ID = 14;
update [User]
	set Gender='Nam',Email='example014@gmail.com',Phone='0123456714',Birthday='17/02/1993',Country=N'Điện Biên'
WHERE ID = 15;
update [User]
	set Gender='Nu',Email='example015@gmail.com',Phone='0123456715',Birthday='15/02/1993',Country=N'Hà Nam'
WHERE ID = 16;
update [User]
	set Gender='Nu',Email='example016@gmail.com',Phone='0123456716',Birthday='15/12/1996',Country=N'Hà Nội'
WHERE ID = 17;
update [User]
	set Gender='Nu',Email='example017@gmail.com',Phone='0123456717',Birthday='26/05/1997',Country=N'Điện Biên'
WHERE ID = 18;
update [User]
	set Gender='Nu',Email='example018@gmail.com',Phone='0123456718',Birthday='27/07/1991',Country=N'Bình Định'
WHERE ID = 19;
update [User]
	set Gender='Nu',Email='example019@gmail.com',Phone='0123456719',Birthday='15/02/1994',Country=N'Bắc Ninh'
WHERE ID = 20;
update [User]
	set Gender='Nam',Email='example020@gmail.com',Phone='0123456720',Birthday='19/01/1997',Country=N'Quảng Ninh'
WHERE ID = 21;
update [User]
	set Gender='Nu',Email='example021@gmail.com',Phone='0123456721',Birthday='20/03/1993',Country=N'Phú Thọ'
WHERE ID = 22;
update [User]
	set Gender='Nam',Email='example022@gmail.com',Phone='0123456722',Birthday='29/07/1998',Country=N'Hà Nội'
WHERE ID = 23;
update [User]
	set Gender='Nam',Email='example023@gmail.com',Phone='0123456723',Birthday='13/12/1997',Country=N'Quảng Ninh'
WHERE ID = 24;
update [User]
	set Gender='Nam',Email='example024@gmail.com',Phone='0123456724',Birthday='13/11/1992',Country=N'Hòa Bình'
WHERE ID = 25;
update [User]
	set Gender='Nam',Email='example025@gmail.com',Phone='0123456725',Birthday='13/12/1997',Country=N'Quảng Ninh'
WHERE ID = 26;
update [User]
	set Gender='Nu',Email='example026@gmail.com',Phone='0123456726',Birthday='19/01/1995',Country=N'Nam Định'
WHERE ID = 27;
update [User]
	set Gender='Nam',Email='example027@gmail.com',Phone='0123456727',Birthday='13/12/1994',Country=N'Quảng Ninh'
WHERE ID = 28;
update [User]
	set Gender='Nu',Email='example028@gmail.com',Phone='0123456728',Birthday='18/09/1997',Country=N'Nghệ An'
WHERE ID = 29;
update [User]
	set Gender='Nam',Email='example029@gmail.com',Phone='0123456729',Birthday='13/12/1996',Country=N'Bình Định'
WHERE ID = 30;

-- xóa danh mục thể thao --
	-- C1: cách làm thủ công.
	-- C1 - b1: tìm toàn bộ những bài viết thuộc danh mục 'thể thao' xong xóa tất cả để bỏ rằng buộc
	select BaiViet.ID, BaiViet.TieuDe
		from  BaiViet inner join DM_BaiViet 
		on BaiViet.id_dm = DM_BaiViet.ID where DM_BaiViet.Ten_DM = N'thể thao';
		-- xóa các bài viết thuộc danh mục 'thể thao'
		delete from BaiViet where ID = 1 -- bài viết thuộc danh mục thể thao có ID = 1,8,12,28 
	-- C1 - b2: quay lại xóa thư mục có tên 'thể thao'
	select ID,Ten_DM from DM_BaiViet; -- show toàn bộ dữ liệu trong DM_BaiViet, tìm thấy danh mục thể thao có ID = 1;
	DELETE from DM_BaiViet where id = 1; -- xóa danh mục 'thể thao' theo ID = 1
		-- hoăc 
	DELETE from DM_BaiViet where Ten_DM = N'thể thao'; -- xóa danh mục thể thao theo tên 

	-- C2: sử dụng bỏ rằng buộc
	-- C2 - b1: drop khóa ngoại trong bảng BaiViet
	alter table BaiViet
		drop constraint FK_id_dm;
	-- C2 - b2: xóa
	DELETE from DM_BaiViet where Ten_DM = N'thể thao'
	-- C2 - b3: add lại khóa ngoại cho bảng BaiViet
	alter table BaiViet with NOCHECK
		add constraint FK_id_dm foreign key (id_dm) references DM_BaiViet(ID)

-- select * from [User]


-- ALTER TABLE Purchasing.PurchaseOrderHeader  
-- NOCHECK CONSTRAINT FK_PurchaseOrderHeader_Employee_EmployeeID;  

-- SELECT CONVERT(varchar,Birthday,103) from [User]
-- SELECT CONVERT(varchar,Birthday,103) from [User] where id = 4;
-- SELECT Birthday from [User] where id = 4;
-- update [User]
-- 	set Birthday= CONVERT(varchar,'17-07-1994',105)
-- WHERE ID = 4;
-- select * from [User]
-- BEGIN
-- 	DECLARE @d date = CONVERT(varchar,'17-07-1994',110) ;
-- 	insert into [User](email, Birthday) VALUES ('anhnd1503@gmail.com',CONVERT(varchar,'12-07-1994',110));
-- end