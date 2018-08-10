-- Tạo database
	IF  NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'QuanLyBanHang')
    BEGIN
        CREATE DATABASE QuanLyBanHang
		on primary(
			name=QuanLyBanHang,
			filename='D:\PCA\Bài tập\SQL\QuanLyBanHang.mdf'
			)
    END;
	use QuanLyBanHang
--drop database QuanLyBanHang
--use master
-- Tạo bảng
	create table VATTU(
	Mavattu varchar(255) primary key,
	Ten varchar(255),
	Donvitinh varchar(10),
	Tilephantram int
	)

	create table NHACC(
	Mancc varchar (255) primary key,
	ten varchar(255),
	Diachi text,
	Dienthoai int
	)
	--Đơn Đặt Hàng
	create table Dondathang(
	Madondathang varchar(255) primary key,
	Ngaydat date, 
	Mancc varchar(255),
	CONSTRAINT FK_Mancc FOREIGN KEY (Mancc)
    REFERENCES NHACC(Mancc)
	)

	--Chi tiết đơn đặt hàng
	create table Chitietdonhang(
	id int primary key identity,
	Madondathang varchar(255), 
	Mavattu varchar(255), 
	Soluongdat int,
	CONSTRAINT FK_Mavattu FOREIGN KEY (Mavattu)
    REFERENCES VATTU(Mavattu),
	CONSTRAINT FK_Madondathang FOREIGN KEY (Madondathang)
    REFERENCES Dondathang(Madondathang)
	)

	--Phiếu nhập hàng: 
	create table Phieunhaphang(
	Masophieunhap varchar(255) primary key, 
	Ngaynhap date, 
	Madondathang varchar(255),
	CONSTRAINT FK_Madondathangnhap FOREIGN KEY (Madondathang)
    REFERENCES Dondathang(Madondathang)
	)

	--Chi tiết phiếu nhập:
	create table Chitietphieunhap(
	id int primary key identity,
	Masophieunhap varchar(255), 
	Mavattu varchar(255), 
	Soluongnhap int, 
	Dongianhap int,
	CONSTRAINT FK_Masophieunhap FOREIGN KEY (Masophieunhap)
    REFERENCES Phieunhaphang(Masophieunhap),
	CONSTRAINT FK_Mavattunhap FOREIGN KEY (Mavattu)
    REFERENCES VATTU(Mavattu)
	)

	--Phiếu xuất hàng:
	create table Phieuxuat(
	Maphieuxuat varchar(255) primary key,  
	Ngayxuat date, 
	Tenkhachhang text
	)

	--Chi tiết xuất hàng
	create table Chitietphieuxuat(
	id int primary key identity,  
	Maphieuxuat varchar(255),
	Mavattu varchar(255), 
	Soluongxuat int, 
	Dongia int,
	CONSTRAINT FK_Maphieuxuat FOREIGN KEY (Maphieuxuat)
    REFERENCES Phieuxuat (Maphieuxuat),
	CONSTRAINT FK_Mavattuxuat FOREIGN KEY (Mavattu)
    REFERENCES VATTU (Mavattu)
	)

-- Chèn dữ liệu vào bảng
	--VATTU
	insert into VATTU values ('MS01','Chais','bags','90');
	insert into VATTU values ('MS02','Chang','bottles','50');
	insert into VATTU values ('MS03','Aniseed Syrup','bottles','80');
	insert into VATTU values ('MS04','Chef Anton Cajun Seasonin','jars','85');
	insert into VATTU values ('MS05','Gumbo Mix ','bottles','95');
	insert into VATTU values ('MS06','Organic Dried Pears','jars','98');
	insert into VATTU values ('MS07','Sauce','kg','100');
	insert into VATTU values ('MS08','Mishi Kobe Niku','kg','97');
	insert into VATTU values ('MS09','Ikura ','jars','83');
	insert into VATTU values ('MS10','Thep ','tan','83');
	insert into VATTU values ('MS11','teance ','jars','83');
	insert into VATTU values ('MS12','tea ','kg','83');

	--NHACC
	insert into NHACC values ('NCC001','Exotic Liquid','49 Gilbert St.','1715552222');
	insert into NHACC values ('NCC002','New Orleans Cajun Delights','P.O. Box 78934','1005554822');
	insert into NHACC values ('NCC003','Grandma Kelly Homestead','707 Oxford Rd.','35555735');
	insert into NHACC values ('NCC004','Tokyo Traders','Sekimai Musashino','35555011');
	insert into NHACC values ('NCC005','Pavlova','74 Rose St. Moonie Ponds','4442343');
	insert into NHACC values ('NCC006','Biscuits','29 KingWay','5554448');
	insert into NHACC values ('NCC007','LTDA','Av. das Americanas 12.890',' 5554640');
	insert into NHACC values ('NCC008','Formaggi Fortini ','Viale Dante, 75','054460323');
	insert into NHACC values ('NCC009','Bigfoot Breweries','3400 - 8th Avenue Suite 210','5559931');

	--Dondathang
	set dateformat dmy;
	insert into Dondathang values ('DH001','04/07/2018','NCC001');
	insert into Dondathang values ('DH002','04/02/2018','NCC005');
	insert into Dondathang values ('DH003','04/03/2018','NCC004');
	insert into Dondathang values ('DH004','04/04/2018','NCC002');
	insert into Dondathang values ('DH005','04/05/2018','NCC001');
	insert into Dondathang values ('DH006','04/06/2018','NCC003');
	insert into Dondathang values ('DH007','05/07/2018','NCC006');
	insert into Dondathang values ('DH008','04/08/2018','NCC009');
	insert into Dondathang values ('DH009','04/09/2018','NCC008');
	insert into Dondathang values ('DH010','04/09/2017','NCC008');
	insert into Dondathang values ('DH011','01/01/2018','NCC008');

	--Chitietdonhang
	insert into Chitietdonhang values ('DH001','MS08','50');insert into Chitietdonhang values ('DH001','MS07','80');
	insert into Chitietdonhang values ('DH002','MS05','10');insert into Chitietdonhang values ('DH002','MS06','10');
	insert into Chitietdonhang values ('DH003','MS04','100');insert into Chitietdonhang values ('DH003','MS04','100');
	insert into Chitietdonhang values ('DH004','MS02','110');insert into Chitietdonhang values ('DH004','MS05','110');
	insert into Chitietdonhang values ('DH005','MS01','90');insert into Chitietdonhang values ('DH005','MS03','90');
	insert into Chitietdonhang values ('DH006','MS03','95');insert into Chitietdonhang values ('DH006','MS04','95');
	insert into Chitietdonhang values ('DH007','MS06','70');insert into Chitietdonhang values ('DH007','MS01','70');
	insert into Chitietdonhang values ('DH008','MS09','500');insert into Chitietdonhang values ('DH008','MS09','500')
	insert into Chitietdonhang values ('DH009','MS08','60');	
	insert into Chitietdonhang values ('DH009','MS07','60');
	insert into Chitietdonhang values ('DH009','MS09','60');
	
	


	--Phieunhaphang
	
	insert into Phieunhaphang values ('MSN001','24/07/2018','DH001');
	insert into Phieunhaphang values ('MSN002','24/02/2018','DH002');
	insert into Phieunhaphang values ('MSN003','24/03/2018','DH003');
	insert into Phieunhaphang values ('MSN004','26/04/2018','DH004');
	insert into Phieunhaphang values ('MSN005','30/05/2018','DH005');
	insert into Phieunhaphang values ('MSN006','18/06/2018','DH006');
	insert into Phieunhaphang values ('MSN007','15/07/2018','DH007');
	insert into Phieunhaphang values ('MSN008','19/08/2018','DH008');
	insert into Phieunhaphang values ('MSN009','20/09/2018','DH009');

	--Chitietphieunhap
	insert into Chitietphieunhap values ('MSN009','MS01','50','10');
	insert into Chitietphieunhap values ('MSN008','MS05','500','12');
	insert into Chitietphieunhap values ('MSN007','MS03','510','15');
	insert into Chitietphieunhap values ('MSN006','MS06','200','19');
	insert into Chitietphieunhap values ('MSN005','MS08','150','5');
	insert into Chitietphieunhap values ('MSN004','MS01','60','90');
	insert into Chitietphieunhap values ('MSN003','MS09','90','12');
	insert into Chitietphieunhap values ('MSN002','MS04','300','35');
	insert into Chitietphieunhap values ('MSN001','MS02','250','40');


	--Chitietphieuxuat
	insert into Chitietphieuxuat values ('MSX001','MS01','20','10');
	insert into Chitietphieuxuat values ('MSX002','MS04','50','35');
	insert into Chitietphieuxuat values ('MSX003','MS03','60','90');
	insert into Chitietphieuxuat values ('MSX004','MS06','20','19');
	insert into Chitietphieuxuat values ('MSX005','MS02','100','40');
	insert into Chitietphieuxuat values ('MSX006','MS03','50','19');
	insert into Chitietphieuxuat values ('MSX007','MS05','30','12');
	insert into Chitietphieuxuat values ('MSX008','MS07','10','10');
	insert into Chitietphieuxuat values ('MSX009','MS09','50','12');

	--Phieuxuat
	insert into Phieuxuat values ('MSX001','10/07/2018','Maria ');
	insert into Phieuxuat values ('MSX002','10/02/2018','Trujillo');
	insert into Phieuxuat values ('MSX003','15/03/2018','Moreno');
	insert into Phieuxuat values ('MSX004','13/04/2018','Thomas ');
	insert into Phieuxuat values ('MSX005','20/05/2018','Christina ');
	insert into Phieuxuat values ('MSX006','25/06/2018','Hanna ');
	insert into Phieuxuat values ('MSX007','10/07/2018','Sommer	');
	insert into Phieuxuat values ('MSX008','30/08/2018','Victoria ');
	insert into Phieuxuat values ('MSX009','10/09/2018','Francisco ');

	UPDATE Dondathang SET Ngaydat = '7/8/2018', Mancc = 'NCC009' where Madondathang='DH001';
	delete from Dondathang where Madondathang='DH010'; 

--Lấy ra danh sách các đơn đặt hàng từ 1/1/2018 đến 1/6/2018
	select*from Dondathang where Ngaydat between '1/1/2018' and '1/6/2018';

--Thống kê số lượng mặt hàng theo nhà cung cấp 
	--Thống kê số lượng mặt hàng theo đơn đặt hàng
	--select Madondathang, sum(soluongdat) as[số lượng đặt hàng] from Chitietdonhang where Madondathang in(select Chitietdonhang.Madondathang from Chitietdonhang inner join Dondathang on Dondathang.Madondathang=Chitietdonhang.Madondathang)
	--group by Madondathang
	select madondathang, sum(soluongdat) as[số lượng đặt hàng] from Chitietdonhang group by Madondathang

	--Thống kê số lượng mặt hàng theo đơn nhập hàng
	select Masophieunhap, sum(Soluongnhap) as[số lượng mặt hàng nhập] from Chitietphieunhap group by Masophieunhap


---------UpdateEX2(9/8/2018)--------------------------------
	--Kiểm tra xem mặt hàng nào được đặt hàng nhiều nhất
		--select Ten  from VATTU where Mavattu in(select sum(Chitietdonhang.Soluongdat) from Chitietdonhang)
		 select top 1 Mavattu, SUM(soluongdat) as[số lượng đặt] from Chitietdonhang group by Soluongdat,Mavattu order by SUM(Soluongdat)DESC

	---Tìm tất cả mặt hàng bắt đầu bằng chữ T
		select *from VATTU where Ten like 'T%'

	--Thống kê các mặt hàng mà có tổng số lượng đặt hàng nhiều hơn 1000
		SELECT Mavattu, sum(Soluongdat) FROM Chitietdonhang GROUP BY Mavattu HAVING sum(Soluongdat) >= 100

	--Tìm tất cả các mặt hàng đã nhập về nhưng chưa xuất 
		select distinct mavattu from Chitietphieunhap where Mavattu not in (select  Mavattu from Chitietphieuxuat)

	--Tìm tất cả các mặt hàng đã nhập về và đã xuất 
		select distinct Chitietphieunhap.Mavattu, vattu.Ten from Chitietphieunhap inner join VATTU on VATTU.mavattu= Chitietphieunhap.mavattu where Chitietphieunhap.Mavattu in (select  Mavattu from Chitietphieuxuat) 
-------------------------------------------------------------
	select*from VATTU
	select*from NHACC
	select*from Dondathang
	select*from Chitietdonhang
	select*from Phieunhaphang
	select*from Chitietphieunhap
	select*from Phieuxuat
	select*from Chitietphieuxuat
