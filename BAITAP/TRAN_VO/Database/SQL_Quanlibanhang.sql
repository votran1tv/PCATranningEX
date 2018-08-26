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

	IF OBJECT_ID('NHACC','U') IS NOT NULL
	DROP TABLE NHACC
		create table NHACC(
		Mancc varchar (255) primary key,
		ten varchar(255) NOT NULL,
		Diachi text NOT NULL,
		Dienthoai int NOT NULL
		)


	IF OBJECT_ID('VATTU','U') IS NOT NULL
	DROP TABLE VATTU
		create table VATTU(
		Mavattu varchar(255) primary key NOT NULL,
		Ten varchar(255) NOT NULL,
		Donvitinh varchar(10) NOT NULL,
		Tilephantram int,
		Mancc VARCHAR (255),
		CONSTRAINT FK_Manccvt FOREIGN KEY (Mancc) REFERENCES Nhacc(Mancc)
		)

	--Đơn Đặt Hàng
	IF OBJECT_ID('Dondathang','U') IS NOT NULL
	DROP TABLE Dondathang
		create table Dondathang(
		Madondathang varchar(255) primary key NOT NULL,
		Ngaydat date NOT NULL, 
		Mancc varchar(255) NOT NULL,
		CONSTRAINT FK_Mancc FOREIGN KEY (Mancc)
		REFERENCES NHACC(Mancc)
		)	

	--Chi tiết đơn đặt hàng
	IF OBJECT_ID('Chitietdonhang','U') IS NOT NULL
	DROP TABLE Chitietdonhang
		create table Chitietdonhang(
		Madondathang varchar(255) NOT NULL, 
		Mavattu varchar(255) NOT NULL,
		Soluongdat int NOT NULL,
		constraint PK_mavattu primary key (madondathang, mavattu),
		CONSTRAINT FK_Mavattu FOREIGN KEY (Mavattu)
		REFERENCES VATTU(Mavattu),
		CONSTRAINT FK_Madondathang FOREIGN KEY (Madondathang)
		REFERENCES Dondathang(Madondathang)
		)

	--Phiếu nhập hàng: 
	IF OBJECT_ID('Phieunhaphang','U') IS NOT NULL
	DROP TABLE Phieunhaphang
		create table Phieunhaphang(
		Masophieunhap varchar(255) primary key NOT NULL, 
		Ngaynhap date NOT NULL, 
		Madondathang varchar(255) NOT NULL,
		CONSTRAINT FK_Madondathangnhap FOREIGN KEY (Madondathang)
		REFERENCES Dondathang(Madondathang)
		)

	--Chi tiết phiếu nhập:
	IF OBJECT_ID('Chitietphieunhap','U') IS NOT NULL
	DROP TABLE Chitietphieunhap
		create table Chitietphieunhap(
		Masophieunhap varchar(255) NOT NULL, 
		Mavattu varchar(255) NOT NULL, 
		Soluongnhap int NOT NULL, 
		Dongianhap int  NOT NULL,
		constraint PK_mspnmvt primary key (masophieunhap, mavattu),
		CONSTRAINT FK_Masophieunhap FOREIGN KEY (Masophieunhap)
		REFERENCES Phieunhaphang(Masophieunhap),
		CONSTRAINT FK_Mavattunhap FOREIGN KEY (Mavattu)
		REFERENCES VATTU(Mavattu)
		)
	--Phiếu xuất hàng:
		IF OBJECT_ID('Phieuxuat','U') IS NOT NULL
		DROP TABLE Phieuxuat
		create table Phieuxuat(
		Maphieuxuat varchar(255) primary key NOT NULL,  
		Ngayxuat date NOT NULL, 
		Tenkhachhang text NOT NULL
		)

	--Chi tiết xuất hàng
		IF OBJECT_ID('Chitietphieuxuat','U') IS NOT NULL
		DROP TABLE Chitietphieuxuat
		create table Chitietphieuxuat(
		id int primary key identity,  
		Maphieuxuat varchar(255) NOT NULL,
		Mavattu varchar(255) NOT NULL, 
		Soluongxuat int NOT NULL, 
		Dongia int NOT NULL,
		CONSTRAINT FK_Maphieuxuat FOREIGN KEY (Maphieuxuat)
		REFERENCES Phieuxuat (Maphieuxuat),
		CONSTRAINT FK_Mavattuxuat FOREIGN KEY (Mavattu)
		REFERENCES VATTU (Mavattu)
		)

-- Chèn dữ liệu vào bảng
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
SELECT*FROM NHACC
	--VATTU
	insert into VATTU values ('MS01','Chais','bags','90','NCC001');
	insert into VATTU values ('MS02','Chang','bottles','50','NCC002');
	insert into VATTU values ('MS03','Aniseed Syrup','bottles','80','NCC003');
	insert into VATTU values ('MS04','Chef Anton Cajun Seasonin','jars','85','NCC003');
	insert into VATTU values ('MS05','Gumbo Mix ','bottles','95','NCC003');
	insert into VATTU values ('MS06','Organic Dried Pears','jars','98','NCC004');
	insert into VATTU values ('MS07','Sauce','kg','100','NCC004');
	insert into VATTU values ('MS08','Mishi Kobe Niku','kg','97','NCC005');
	insert into VATTU values ('MS09','Ikura ','jars','83','NCC005');
	insert into VATTU values ('MS10','Thep ','tan','83','NCC006');
	insert into VATTU values ('MS11','teance ','jars','83','NCC006');
	insert into VATTU values ('MS12','tea1 ','kg','83','NCC007');
	insert into VATTU values ('MS13','tea2 ','kg','85','NCC007');
	insert into VATTU values ('MS14','tea3 ','kg','86','NCC008');
	insert into VATTU values ('MS15','tea4 ','kg','87','NCC008');
	insert into VATTU values ('MS16','tea5 ','kg','88','NCC009');
	insert into VATTU values ('MS17','tea6 ','kg','89','NCC009');
	insert into VATTU values ('MS18','tea7 ','kg','80','NCC001');


	--Dondathang
	set dateformat dmy;
	insert into Dondathang values ('DH001','04/07/2018','NCC001');
	insert into Dondathang values ('DH002','04/02/2018','NCC005');
	insert into Dondathang values ('DH003','04/03/2018','NCC005');
	insert into Dondathang values ('DH004','04/04/2018','NCC002');
	insert into Dondathang values ('DH005','04/05/2018','NCC001');
	insert into Dondathang values ('DH006','04/06/2018','NCC003');
	insert into Dondathang values ('DH007','05/07/2018','NCC006');
	insert into Dondathang values ('DH008','04/08/2018','NCC009');
	insert into Dondathang values ('DH009','04/09/2018','NCC008');
	insert into Dondathang values ('DH010','04/09/2017','NCC007');
	insert into Dondathang values ('DH011','01/01/2018','NCC008');
	insert into Dondathang values ('DH012','04/03/2018','NCC004');
	insert into Dondathang values ('DH013','01/07/2018','NCC009');

		SELECT*FROM Dondathang

	--Chitietdonhang
	insert into Chitietdonhang values ('DH001','MS01','50');
	insert into Chitietdonhang values ('DH001','MS18','115');
	insert into Chitietdonhang values ('DH001','MS01','80');
	insert into Chitietdonhang values ('DH002','MS08','10');
	insert into Chitietdonhang values ('DH002','MS09','10');
	insert into Chitietdonhang values ('DH003','MS08','100');
	insert into Chitietdonhang values ('DH003','MS09','100');
	insert into Chitietdonhang values ('DH004','MS02','110');
	insert into Chitietdonhang values ('DH005','MS01','90');
	insert into Chitietdonhang values ('DH005','MS18','100');
	insert into Chitietdonhang values ('DH006','MS03','95');
	insert into Chitietdonhang values ('DH006','MS04','210');
	insert into Chitietdonhang values ('DH007','MS10','70');
	insert into Chitietdonhang values ('DH007','MS11','85');
	insert into Chitietdonhang values ('DH008','MS16','500');
	insert into Chitietdonhang values ('DH008','MS17','500')
	insert into Chitietdonhang values ('DH009','MS14','60');	
	insert into Chitietdonhang values ('DH009','MS15','70');
	insert into Chitietdonhang values ('DH012','MS06','80');
	insert into Chitietdonhang values ('DH013','MS17','100');

		SELECT*FROM Chitietdonhang


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
	insert into Phieunhaphang values ('MSN010','30/10/2018','DH010');
	insert into Phieunhaphang values ('MSN011','10/01/2018','DH011');
	insert into Phieunhaphang values ('MSN012','04/04/2018','DH012');
	insert into Phieunhaphang values ('MSN013','23/08/2018','DH013');
	insert into Phieunhaphang values ('MSN014','23/08/2018','DH006');

SELECT*FROM Phieunhaphang
	--Chitietphieunhap
	insert into Chitietphieunhap values ('MSN001','MS01','50','10');
	insert into Chitietphieunhap values ('MSN001','MS01','80','10');
	insert into Chitietphieunhap values ('MSN001','MS18','115','50');
	insert into Chitietphieunhap values ('MSN002','MS08','10','12');
	insert into Chitietphieunhap values ('MSN002','MS09','10','20');
	insert into Chitietphieunhap values ('MSN003','MS08','110','12');
	insert into Chitietphieunhap values ('MSN003','MS09','100','20');
	insert into Chitietphieunhap values ('MSN004','MS02','110','19');
	insert into Chitietphieunhap values ('MSN005','MS01','90','90');
	insert into Chitietphieunhap values ('MSN005','MS18','50','50');
	insert into Chitietphieunhap values ('MSN006','MS03','50','15');
	insert into Chitietphieunhap values ('MSN006','MS04','210','30');
	insert into Chitietphieunhap values ('MSN007','MS10','70','12');
	insert into Chitietphieunhap values ('MSN008','MS16','500','15');
	insert into Chitietphieunhap values ('MSN008','MS17','500','20');
	insert into Chitietphieunhap values ('MSN009','MS14','60','19');
	insert into Chitietphieunhap values ('MSN009','MS15','70','25');
	insert into Chitietphieunhap values ('MSN010','MS18','90','50');
	insert into Chitietphieunhap values ('MSN012','MS06','80','25');
	insert into Chitietphieunhap values ('MSN013','MS17','90','25');
	insert into Chitietphieunhap values ('MSN014','MS03','45','90');
		SELECT*FROM Chitietphieunhap
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
	insert into Phieuxuat values ('MSX010','23/08/2018','BaSon ');
		SELECT*FROM Phieuxuat
	--Chitietphieuxuat
	insert into Chitietphieuxuat values ('MSX001','MS01','50','15');
	insert into Chitietphieuxuat values ('MSX002','MS08','80','20');
	insert into Chitietphieuxuat values ('MSX003','MS14','60','30');
	insert into Chitietphieuxuat values ('MSX004','MS01','50','15');
	insert into Chitietphieuxuat values ('MSX005','MS02','70','25');
	insert into Chitietphieuxuat values ('MSX006','MS03','50','20');
	insert into Chitietphieuxuat values ('MSX007','MS16','100','16');
	insert into Chitietphieuxuat values ('MSX008','MS18','80','60');
	insert into Chitietphieuxuat values ('MSX009','MS06','80','30');
	insert into Chitietphieuxuat values ('MSX010','MS18','100','65');
		SELECT*FROM Chitietphieuxuat
--5. Lấy ra danh sách các đơn đặt hàng từ 1/1/2018 đến 1/6/2018
	select*from Dondathang where Ngaydat between '1/1/2018' and '1/6/2018';

--6)Thống kê số lượng mặt hàng theo nhà cung cấp 
		SELECT VATTU.Mancc, NHACC.ten, COUNT(Mavattu) FROM VATTU INNER JOIN NHACC ON NHACC.Mancc=VATTU.Mancc
		GROUP BY VATTU.Mancc, NHACC.ten

	--Thống kê số lượng mặt hàng theo đơn đặt hàng
		SELECT madondathang, COUNT(soluongdat)[số lượng mặt hàng] from Chitietdonhang group by Madondathang

	--Thống kê số lượng mặt hàng theo đơn nhập hàng
		SELECT Masophieunhap, COUNT(Soluongnhap)[số lượng mặt hàng nhập] from Chitietphieunhap group by Masophieunhap


---------UpdateEX2(9/8/2018)--------------------------------
--7. Kiểm tra xem mặt hàng nào được đặt hàng nhiều nhất
		--select Ten  from VATTU where Mavattu in(select Chitietdonhang.Mavattu, sum(Soluongdat) from Chitietdonhang GROUP BY Chitietdonhang.Mavattu )
		--C1
		SELECT MAX(sld)[số lượng đặt] FROM (SELECT Mavattu, SUM(Soluongdat) AS sld FROM Chitietdonhang GROUP BY Mavattu) as a 
		
		--C2
		SELECT TOP 1 Chitietdonhang.Mavattu,VATTU.Ten, SUM(Soluongdat) AS [số lượng đặt] 
		FROM Chitietdonhang LEFT JOIN VATTU ON VATTU.Mavattu=Chitietdonhang.Mavattu
		GROUP BY Chitietdonhang.Mavattu,VATTU.Ten
		ORDER BY [số lượng đặt] DESC

--8. Tìm tất cả mặt hàng bắt đầu bằng chữ T
		SELECT*FROM VATTU WHERE Ten LIKE 'T%'

--9. Thống kê các mặt hàng mà có tổng số lượng đặt hàng nhiều hơn 100

		SELECT Mavattu, SUM(Soluongdat) AS[số lượng đặt]
		FROM Chitietdonhang
		GROUP BY Mavattu
		HAVING SUM(Soluongdat) >= 100

--9. Tìm tất cả các mặt hàng đã nhập về nhưng chưa xuất 

		SELECT DISTINCT mavattu
		FROM Chitietphieunhap
		WHERE Mavattu NOT IN (SELECT Mavattu
		FROM Chitietphieuxuat)

--10.Tìm tất cả các mặt hàng đã nhập về và đã xuất 

		SELECT DISTINCT Chitietphieunhap.Mavattu, vattu.Ten
		FROM Chitietphieunhap INNER JOIN VATTU ON VATTU.mavattu= Chitietphieunhap.mavattu
		WHERE Chitietphieunhap.Mavattu IN (SELECT Mavattu
		FROM Chitietphieuxuat) 

--------Upddate EX2(10/8/2018)------------------------------------
--11. Tạo bảng tồn kho

		IF OBJECT_ID('Tonkho','U') IS NOT NULL
				DROP TABLE Tonkho
		create table Tonkho
		(
			id int identity primary key,
			Namthang char(255) NOT NULL,
			--check (Namthang > '1/1/1999'),check (Namthang<'31/12/2999'),
			Mavattu varchar(255) NOT NULL,
			SLDau int NOT NULL,
			check (SLDau>0),
			TongSLNhap int NOT NULL,
			check (TongSLNhap>0),
			TôngSLXuat int NOT NULL,
			check (TôngSLXuat>0),
			SLCuoi int NOT NULL,
			check (SLCuoi>0),
			CONSTRAINT FK_Mavattutonkho FOREIGN KEY (Mavattu)
					REFERENCES VATTU (Mavattu)
		)
		SELECT*FROM Tonkho
--12. Đặt điều kiện ràng buộc giá trị nhập vào cho các trường số lượng có giá trị lớn hơn không, giá trị ngày tháng lớn hơn 1/1/1999 và nhỏ hơn 31/12/2999

			ALTER TABLE Tonkho ALTER COLUMN Namthang date;
			alter table Tonkho add constraint namthang check( Namthang > '1/1/1999' and Namthang<'31/12/2999' )

			insert into Tonkho
			values('2/1/2005', 'MS01', '100', '150', '200', '50')

			insert into Tonkho
			values('2/1/1998', 'MS01', '100', '150', '200', '50')

--13. Truy vấn danh sách các phiếu đặt hàng chưa được nhập hàng
		
			SELECT Madondathang, Mavattu, Soluongdat
			FROM Chitietdonhang
			WHERE  Madondathang NOT IN (SELECT Madondathang
				FROM Phieunhaphang) OR Mavattu NOT IN (SELECT Mavattu
				FROM Chitietphieunhap)

--14.Lấy thông tin nhà cung cấp có nhiều đơn đặt hàng nhất
		INSERT INTO Dondathang VALUES ('DH014','23/08/2018','NCC008')
	---Cách 1
		select Mancc, ten, Diachi, Dienthoai
		from NHACC
		where Mancc in (select top 1
			Mancc
		from Dondathang
		group by mancc
		order by count(Mancc)desc)

	--Cách 2
		alter table Nhacc alter column Diachi varchar(max)
		select top 1 Dondathang.Mancc,NHACC.ten,NHACC.Dienthoai,NHACC.Diachi, count(Dondathang.Mancc) as[số lượng đơn hàng] from Dondathang inner join NHACC  on NHACC.Mancc= Dondathang.Mancc  
		group by Dondathang.Mancc,NHACC.ten,NHACC.Dienthoai,Nhacc.diachi
		order by count(Dondathang.Mancc) desc
	-- Cách 3
		select top 1 Dondathang.Mancc,NHACC.ten,NHACC.Dienthoai,NHACC.Diachi, count(Dondathang.Madondathang) as[số lượng đơn hàng] from Dondathang inner join NHACC  on NHACC.Mancc= Dondathang.Mancc  
		group by Dondathang.Mancc,NHACC.ten,NHACC.Dienthoai,Nhacc.diachi
		order by count(Dondathang.Madondathang) desc 

--15. Lấy thông tin vật tư được xuất bán nhiều nhất
		select top 1 Chitietphieuxuat.mavattu,vattu.ten,sum(soluongxuat)as[số lượng hàng xuất]from Chitietphieuxuat inner join VATTU on VATTU.mavattu= Chitietphieuxuat.mavattu 
		group by Chitietphieuxuat.mavattu,vattu.ten
		order by sum(soluongxuat)desc

--16. Tính tổng tiền của các đơn đặt hàng, đưa ra đơn đặt hàng có giá trị lớn nhất

		select Chitietdonhang.Madondathang, SUM(dongianhap*soluongdat)[Tổng tiền]
		from Chitietdonhang INNER JOIN Phieunhaphang ON chitietdonhang.madondathang=Phieunhaphang.Madondathang INNER JOIN Chitietphieunhap ON Chitietphieunhap.masophieunhap=Phieunhaphang.Masophieunhap
		where Chitietdonhang.Madondathang=Phieunhaphang.Madondathang and Phieunhaphang.Masophieunhap=Chitietphieunhap.Masophieunhap and Chitietdonhang.Mavattu=Chitietphieunhap.Mavattu
		group by Chitietdonhang.Madondathang
		order by [Tổng tiền] DESC 

		--Tổng tiền các đơn nhập
		SELECT Phieunhaphang.Madondathang, Chitietphieunhap.Masophieunhap, SUM(Soluongnhap*Dongianhap) FROM Phieunhaphang, Chitietphieunhap
		WHERE Phieunhaphang.Masophieunhap=Chitietphieunhap.Masophieunhap
		GROUP BY Chitietphieunhap.Masophieunhap,Phieunhaphang.Madondathang

		--Tham khảo
		SELECT TOP 10 madondathang,SUM(soluongnhap*dongianhap)
		FROM chitietphieunhap INNER JOIN chitietdonhang ON ChiTietDonHang.MaVatTu = ChiTietPhieuNhap.MaVatTu 
		WHERE Masophieunhap IN
		(SELECT MaSoPhieuNhap FROM PhieuNhapHang)
		group by madondathang
		ORDER BY SUM(SoLuongNhap*dongianhap) DESC
		SELECT*FROM Chitietphieunhap
--17. Thống kê những đơn đặt hàng chưa nhập đủ số lượng(số lượng nhập ít hơn số lượng đặt)
		select  DISTINCT Chitietdonhang.Madondathang,chitietphieunhap.mavattu,chitietdonhang.soluongdat, chitietphieunhap.soluongnhap
		from Chitietdonhang,Phieunhaphang,Chitietphieunhap
		where Chitietdonhang.Madondathang=Phieunhaphang.Madondathang AND Phieunhaphang.Masophieunhap=Chitietphieunhap.Masophieunhap and Chitietdonhang.Mavattu=Chitietphieunhap.Mavattu 
		OR chitietdonhang.Madondathang NOT IN (SELECT Phieunhaphang.Madondathang  FROM Phieunhaphang)
		GROUP BY Chitietdonhang.Madondathang,chitietdonhang.soluongdat, chitietphieunhap.soluongnhap,chitietphieunhap.mavattu
		having chitietphieunhap.soluongnhap<chitietdonhang.soluongdat
	
		--Thống kê những đơn đặt hàng chưa nhập đủ số lượng
		select Phieunhaphang.Madondathang,Chitietphieunhap.mavattu,Chitietdonhang.Soluongdat,sum(Chitietphieunhap.Soluongnhap) from Chitietphieunhap inner join Chitietdonhang on Chitietdonhang.Mavattu=Chitietphieunhap.Mavattu inner join Phieunhaphang on Phieunhaphang.Madondathang=Chitietdonhang.Madondathang
		group by Phieunhaphang.Madondathang,Chitietphieunhap.mavattu,Chitietdonhang.Soluongdat,Chitietphieunhap.Soluongnhap
		having sum(Chitietdonhang.Soluongdat)>sum(Chitietphieunhap.Soluongnhap)
		order by Phieunhaphang.Madondathang asc



----------Update EX2(13/8)----------------------------------------------------------------
--18) Tạo View  vw_DMVT gồm (MAVTu và TenVTu) dùng liệt kê các danh sách trong bảng vật tư
		
		CREATE VIEW [vw_DMVT]
		AS
			SELECT Mavattu, Ten
			FROM VATTU
		WITH CHECK OPTION
		drop VIEW vw_DMVT
		SELECT*
		FROM [vw_DMVT]
		UPDATE VATTU set Ten='tea8' WHERE Mavattu='MS18'

--19) Tạo View vw_DonDH_Tong SLDatNhap gồm (SoHD, TongSLDat và TongSLNhap) dùng để thống kê những đơn đặt hàng đã được nhập hàng đầy đủ
		create view vwDonDH_Tong_SLDatNhap as
		select Chitietdonhang.Madondathang, sum(chitietdonhang.soluongdat)TongSLDat, sum(Chitietphieunhap.Soluongnhap)TongSLNhap
		from Chitietdonhang inner join Chitietphieunhap on Chitietdonhang.Mavattu=Chitietphieunhap.Mavattu
		group by Chitietdonhang.Madondathang
		having sum(chitietdonhang.soluongdat)< sum(Chitietphieunhap.Soluongnhap)


--20) Tạo View vw_DonDH_DaNhapDu gồm (Số DH, DaNhapDu) có hai giá trị là “Da Nhap Du” nếu đơn hàng đó đã nhập đủ hoặc “Chu Nhap Du” nếu đơn đặt hàng chưa nhập đủ


		create view vw_DonDH_DaNhapDu
		as
			select distinct Chitietdonhang.Madondathang, Chitietdonhang.Mavattu, case
						when soluongdat = soluongnhap then N'Đã nhập đủ'
						else N'Chưa nhập đủ' end
						[Trạng thái hàng]
			from chitietdonhang, chitietphieunhap, Phieunhaphang
			WHERE Chitietdonhang.Madondathang=Phieunhaphang.Madondathang AND Phieunhaphang.Masophieunhap=Chitietphieunhap.Masophieunhap AND Chitietdonhang.Mavattu=Chitietphieunhap.Mavattu

DROP VIEW vw_DonDH_DaNhapDu

--21) Tạo View vw_TongNhap gồm (NamThang, MaVTu và TongSLNhap) dùng để thống kê số lượng nhập của các vật tư trong năm tháng tương ứng (Không sử dụng bảng tồn kho)

		create view vw_TongNhap
		as
			select cast (MONTH(Ngaynhap)as varchar) +'/'+CAST(YEAR(Ngaynhap)as varchar)[Thời gian], Chitietphieunhap.Mavattu, Chitietphieunhap.Soluongnhap
			from Phieunhaphang inner join Chitietphieunhap on Phieunhaphang.Masophieunhap=Chitietphieunhap.Masophieunhap
			group by Phieunhaphang.Ngaynhap, Chitietphieunhap.Mavattu, Chitietphieunhap.Soluongnhap
				WITH CHECK OPTION
		drop VIEW vw_TongNhap
--22) Tạo View vw_TongXuat gồm (NamThang, MaVTu và TongSLXuat) dùng để thống kê SL xuất của vật tư trong từng năm tương ứng (Không sử dụng bảng tồn kho)

		create view vw_TongXuat
		AS
			SELECT DISTINCT Chitietphieuxuat.Mavattu, CAST(YEAR(Ngayxuat) as varchar)[Thời gian], SUM(Chitietphieuxuat.Soluongxuat)
			FROM Phieuxuat, Chitietphieuxuat
			GROUP BY Phieuxuat.Ngayxuat, Chitietphieuxuat.Mavattu

SELECT Chitietphieuxuat.Mavattu, CAST(YEAR(Ngayxuat) AS VARCHAR)[Năm], Soluongxuat
FROM Chitietphieuxuat, Phieuxuat
WHERE Phieuxuat.Maphieuxuat=Chitietphieuxuat.Maphieuxuat
--GROUP BY Chitietphieuxuat.Mavattu, Phieuxuat.Ngayxuat

SELECT distinct Mavattu,CAST(YEAR(Phieuxuat.Ngayxuat) AS VARCHAR)[Năm],SUM(soluongxuat) FROM Chitietphieuxuat, Phieuxuat
WHERE Phieuxuat.Maphieuxuat=Chitietphieuxuat.Maphieuxuat
GROUP BY Mavattu, Phieuxuat.Ngayxuat


------------------------------------- Upddate EX2(15/8) – Store Procedure, Trigger, Fuction And Transaction----------------------------------------------------------------------
-- Câu 23. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
		CREATE PROCEDURE sp_TongluongcuoiVT
			@mavattu VARCHAR(255)
		AS
		SELECT ((select SUM(soluongnhap)FROM Chitietphieunhap WHERE Mavattu=@mavattu)-
		(select SUM(Soluongxuat) FROM Chitietphieuxuat WHERE Mavattu=@mavattu))

		EXECUTE sp_TongluongcuoiVT @mavattu='MS01'
-- Câu 24. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.
		CREATE PROCEDURE sp_TongTienXuat
			@Mavattu VARCHAR(255)
		AS
		SELECT SUM(dongia*soluongxuat) FROM Chitietphieuxuat WHERE Mavattu=@Mavattu


-- Câu 25. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.
		CREATE PROCEDURE sp_Tongluongdat
			@madondathang VARCHAR(255)
		AS
		SELECT SUM(soluongdat) FROM Chitietdonhang WHERE Madondathang=@madondathang

-- Câu 26. Tạo SP dùng để thêm một đơn đặt hàng
		CREATE PROCEDURE sp_Donhangnew
			@Madondathang varchar(255),
			@Ngaydat date, 
			@Mancc varchar(255)
		AS
		INSERT INTO Dondathang(Madondathang,Ngaydat,Mancc) values(@Madondathang,@Ngaydat,@Mancc )

		sp_Donhangnew 'DH014','15/8/2018','NCC002'
		-- drop PROCEDURE sp_Donhangnew
	SELECT*FROM Dondathang

-- Câu 27. Tạo SP dùng để thêm một chi tiết đơn đặt hang
		CREATE PROCEDURE sp_chitietdonhang
			@Madondathang varchar(255), 
			@Mavattu varchar(255), 
			@Soluongdat int
		AS
		INSERT into Chitietdonhang(Madondathang,Mavattu,Soluongdat) VALUES(@Madondathang,@Mavattu,@Soluongdat)
		sp_chitietdonhang 'DH014','MS02','150'
	SELECT*FROM Chitietdonhang

-- Câu 28. Tạo trigger kiểm soát quá trình thêm dữ liệu vào bảng vật tư, đưa ra thông báo khi số lượng vật tư vượt quá 100 sp.
		CREATE TRIGGER nhapvattu ON VATTU FOR INSERT
		AS
		 IF (select COUNT(Mavattu) FROM VATTU)>18
		 ROLLBACK
		 PRINT N'Số lượng vật tư không lớn hơn 18'

	insert into VATTU values ('MS19','tea19 ','kg','83','NCC009');
	

--------------------------- Update (16/8) – Store Procedure, Trigger, Function And Transaction---------------------------------------------------
-- Câu 29: Thêm cột thành tiền  cho bảng Chi tiết phiếu nhập, viết hàm tính thành tiền với biến đầu vào là đơn giá và số lượng.  Tạo trigger cho phép tự động tính thành tiền trong bảng Chi tiết phiếu nhập mỗi khi có 1 bảng ghi mới được thêm vào
		ALTER TABLE Chitietphieunhap add Thanhtien FLOAT(3) 
		CREATE FUNCTION fn_tinhtien
			(@soluongnhap int,
			@dongianhap int)
		RETURNS INT
		AS BEGIN
			DECLARE @Thanhtien INT
			set @Thanhtien=@soluongnhap*@dongianhap
			RETURN @Thanhtien;
		END
		SELECT dbo.fn_tinhtien (13,40)

	--Tạo trigger cho phép tự động tính thành tiền trong bảng Chi tiết phiếu nhập mỗi khi có 1 bảng ghi mới được thêm vào
		ALTER TRIGGER tg_tinhtien on Chitietphieunhap FOR INSERT, UPDATE 
		AS 
		BEGIN
		DECLARE @SL INT, @dongia INT, @Thanhtien INT, @MSN VARCHAR(255), @mavattu VARCHAR(255)
		SELECT @SL = soluongnhap FROM inserted
		select @dongia = dongianhap FROM inserted
		SELECT @MSN = masophieunhap FROM inserted
		SELECT @mavattu = mavattu FROM inserted

		UPDATE Chitietphieunhap	SET Thanhtien=@SL*@dongia WHERE Chitietphieunhap.Masophieunhap=@MSN AND Chitietphieunhap.Mavattu=@mavattu
		END
		SELECT*FROM Chitietphieunhap
	

-- Câu 30: Thêm cột tinhtrang (tình trạng) vào bảng Vattu (quy định 0 = “hết hàng’, 1=”còn hàng”). Viết thủ tục kiểm tra trạng thái của các vật tư hiện đang có.
		ALTER TABLE VATTU add tinhtrang BIT
		BEGIN
		select Mavattu, Ten, Donvitinh, Tilephantram, (case
		when tinhtrang= 0 THEN N'Hết hàng'
		else N'Còn hàng'
		END)[Tình trạng] FROM VATTU
		END


-- Câu 31: Viết trigger cho phép tự động cập nhật trạng thái của vật tư mỗi khi có sự thay đổi nhập hoặc xuất.
		CREATE TRIGGER trg_capnhathang on chitietphieunhap for INSERT, UPDATE  AS
		BEGIN
		DECLARE @soluongnhap int=( select SUM(Chitietphieunhap.Soluongnhap)FROM Chitietphieunhap, inserted WHERE Chitietphieunhap.Mavattu=inserted.Mavattu)
		DECLARE @soluongxuat INT=(SELECT SUM(Chitietphieuxuat.Soluongxuat)FROM Chitietphieuxuat,inserted WHERE Chitietphieuxuat.Mavattu=inserted.Mavattu)
		IF @soluongnhap>@soluongxuat 
			UPDATE VATTU SET tinhtrang=	1 FROM inserted WHERE VATTU.Mavattu=inserted.Mavattu
		
		IF @soluongnhap<=@soluongxuat
			UPDATE VATTU SET tinhtrang=0 FROM inserted WHERE VATTU.Mavattu=inserted.Mavattu
		END


-- Câu 32: Viết thủ tục tính lượng hàng tồn kho hiện tại cho mỗi loại vật tư và áp dụng lên bảng vật tư

		SELECT Chitietphieunhap.Mavattu, SUM(Chitietphieunhap.Soluongnhap)-SUM(Chitietphieuxuat.Soluongxuat) FROM Chitietphieunhap LEFT JOIN Chitietphieuxuat ON  Chitietphieunhap.Mavattu=Chitietphieuxuat.Mavattu
		GROUP BY Chitietphieunhap.Mavattu


DECLARE @i int = 1
        DECLARE @n int = (select Count(mavattu) from VatTu)
        DECLARE @VatTu_ID nvarchar(50)

        DECLARE @DonNhap_ID int
        DECLARE @DonXuat_ID int
        DECLARE @ab int

        while @i <= @n
            BEGIN
                --print @i
                set @VatTu_ID = (
                    select Mavattu from (
                        select ROW_NUMBER() Over(order by mavattu) as index_id,Mavattu
                        from VATTU
                    ) as tem_VATTU 
                    where index_id = @i
                )
                set @DonNhap_ID = (select sum(soluongnhap) from Chitietphieunhap where Mavattu = @VatTu_ID)
                set @DonXuat_ID = (select sum(Soluongxuat) from Chitietphieuxuat where Mavattu = @VatTu_ID)

                if (@DonNhap_ID <= @DonXuat_ID) 
                    BEGIN
                        UPDATE VATTU
                        set tinhtrang = 0
                        where Mavattu = @VatTu_ID
                    end
                ELSE
                    BEGIN
                        UPDATE VATTU
                        set tinhtrang = 1
                        WHERE Mavattu = @VatTu_ID
                    end

                set @i = @i + 1
            END



			CREATE PROCEDURE sp_tonkho AS 
			BEGIN
				DECLARE @bang TABLE (mavattu varchar(255), tongnhap int, tongxuat int)
				INSERT into @bang(mavattu, tongnhap, tongxuat)
				SELECT VATTU.Mavattu, SUM(soluongnhap), SUM(soluongxuat) FROM VATTU FULL join Chitietphieunhap
				ON VATTU.Mavattu=Chitietphieunhap.Mavattu FULL JOIN Chitietphieuxuat ON chitietphieunhap.Mavattu=Chitietphieuxuat.Mavattu 
				GROUP BY VATTU.Mavattu
				select*FROM @bang
 			END
-- Câu 33: Tạo trigger cho phép thay đổi số lượng tồn kho vật tư mỗi khi có sự thay đổi vể nhập xuất, đưa ra thông báo “Không Đủ Vật Tư Đề Xuất” trong trường hợp không đủ vật tư theo phiếu chi tiết xuất

-------------------------------------------------------------
	select*from VATTU
	select*from NHACC
	select*from Dondathang
	select*from Chitietdonhang
	select*from Phieunhaphang
	select*from Chitietphieunhap
	select*from Phieuxuat
	select*from Chitietphieuxuat
	select*from Tonkho
	SELECT * FROM vw_DMVT
	SELECT * FROM vw_DonDH_Tong_SLDatNhap
	SELECT*FROM vw_DonDH_DaNhapDu
	select * from vw_TongNhap
	select*from vw_TongXuat
	drop database QuanLyBanHang
	use master