if not exists (select 1 from sys.databases where name = 'QLBH')
    begin 
        create database QLBH
        on primary(
            size=5,
            maxsize=50,
            filegrowth=5,
            filename = 'D:\DB\qlbh.mdf',
            name = 'QLBH'
        )
    end

use QLBH
use master
drop database QLBH
-- drop table VatTu,NhaCungCap,DonDatHang,ChiTietDonHang,PhieuNhapHang,ChiTietPNHang,PhieuXuat,ChiTietPNHang

if not exists (select 1 from sysobjects where name = 'VatTu')   
    begin 
        create table VatTu(
            MaVatTu nvarchar(50), -- VD vt001
            Ten nvarchar(225),
            DonViTinh nvarchar(10),
            TiLePhanTram float(3),
            constraint PK_VatTu primary key (MaVatTu)
        )
    end

if not exists (select 1 from sysobjects where name = 'NhaCungCap')
    begin 
        create table NhaCungCap(
            MaNCCap int identity,
            Ten nvarchar(225),
            DiaChi nvarchar(225),
            DienThoai int,
            constraint PK_NhaCungCap primary key (MaNCCap)
        )
    end

if not exists (select 1 from sysobjects where name = 'DonDatHang')
    begin 
        create table DonDatHang(
            MaDDHang nvarchar(50), -- VD: ddh001
            NgayDat date,
            MaNCCap int,
            constraint PK_DonDatHang primary key (MaDDHang),
            constraint FK_NhaCungCap_DonDatHang foreign key (MaNCCap) references NhaCungCap (MaNCCap)
        )
    end

if not exists (select 1 from sysobjects where name = 'ChiTietDonHang')
    begin 
        create table ChiTietDonHang(
            MaDDHang nvarchar(50),
            MaVatTu nvarchar(50),
            SoLuongDat float(3),
            constraint PK_ChiTietDonHang_MaDDHang primary key (MaDDHang,MaVatTu),
            constraint FK_DonDatHang_ChiTietDonHang foreign key (MaDDHang) references DonDatHang(MaDDHang),
            constraint FK_VatTu_ChiTietDonHang foreign key (MaVatTu) references VatTu(MaVatTu)
        )
    end

if not exists (select 1 from sysobjects where name = 'PhieuNhapHang')
    begin 
        create table PhieuNhapHang(
            MaPNHang nvarchar(50), -- VD: pnh001
            NgayNhap date,
            MaDDHang nvarchar(50),
            constraint PK_PhieuNhapHang primary key (MaPNHang),
            constraint FK_DonDatHang_PhieuNhapHang foreign key (MaDDHang) references DonDatHang(MaDDHang)
        )
    end

if not exists (select 1 from sysobjects where name = 'ChiTietPNHang')
    begin 
        create table ChiTietPNHang(
            MaPNHang nvarchar(50),
            MaVatTu nvarchar(50),
            SoLuongNhap int,
            DonGiaNhap float, -- dv: $
            constraint PK_ChiTietPNHang primary key (MaPNHang,MaVatTu),
            constraint FK_PhieuNhapHang_ChiTietPNHang foreign key (MaPNHang) references PhieuNhapHang(MaPNHang),
            constraint FK_VatTu_ChiTietPNHang foreign key (MaVatTu) references VatTu(MaVatTu)
        )
    end

if not exists (select 1 from sysobjects where name = 'PhieuXuat')
    begin 
        create table PhieuXuat(
            MaPhieuXuat nvarchar(50), -- VD: px001
            NgayXuat date,
            TenKhachHang nvarchar(225),
            constraint PK_PhieuXuat primary key (MaPhieuXuat)
        )
    end

if not exists (select 1 from sysobjects where name = 'ChiTietPXuat')
    begin 
        create table ChiTietPXuat(
            ID int PRIMARY key identity,
            MaPhieuXuat nvarchar(50),
            MaVatTu nvarchar(50),
            SoLuongXuat int,
            DonGia float, -- dv: $
            constraint FK_PhieuXuat_ChiTietPXuat foreign key (MaPhieuXuat) references PhieuXuat(MaPhieuXuat),
            constraint FK_VatTu_ChiTietPXuat foreign key (MaVatTu) references VatTu(MaVatTu)
        )
    end

-- insert du lieu
insert into VatTu values('tv001','Chais','kg',45)
insert into VatTu values('tv002','Chang','bags',20)
insert into VatTu values('tv003','Aniseed Syrup','box',33)
insert into VatTu values('tv004','Chef Anton`s Cajun Seasoning','kg',80)
insert into VatTu values('tv005','Chef Anton`s Gumbo Mix ','kg',50)
insert into VatTu values('tv006','Grandma`s Boysenberry Spread ','box',66)
insert into VatTu values('tv007','Uncle Bob`s Organic Dried Pears ','box',79)
insert into VatTu values('tv008','Northwoods Cranberry Sauce','bag',90)
insert into VatTu values('tv009','The Big Cheese','box',0)
insert into VatTu values('tv010','Alfreds Futterkiste','bag',30)
insert into VatTu values('tv011','Tortuga Restaurante ','box',0)
insert into VatTu values('tv012','Toms Spezialitäten','bag',20)

insert into NhaCungCap values('Exotic Liquid ','49 Gilbert St. Londona',0912345671)
insert into NhaCungCap values('New Orleans Cajun Delights','P.O. Box 78934 New Orleans',0912345672)
insert into NhaCungCap values('Grandma Kelly`s Homestead ','707 Oxford Rd. Ann Arbor ',0912345673)
insert into NhaCungCap values('Tokyo Traders  ','9-8 Sekimai Musashino-shi Tokyo',0912345674)
insert into NhaCungCap values('Cooperativa de Quesos `Las Cabras`  ','Calle del Rosal 4 Oviedo',0912345675)
insert into NhaCungCap values('Mayumi`s','92 Setsuko Chuo-ku Osaka',0912345676)
insert into NhaCungCap values('Pavlova, Ltd. ','74 Rose St. Moonie Ponds Melbourne',0912345677)
insert into NhaCungCap values('Specialty Biscuits, Ltd.','29 King`s Way Manchester',0912345678)
insert into NhaCungCap values('PB Knäckebröd AB','Kaloadagatan 13 Göteborg',0912345679)
insert into NhaCungCap values('Refrescos Americanas LTDA ','Av. das Americanas 12.890 São Paulo ',0912345610)
insert into NhaCungCap values('Heli Süßwaren GmbH & Co. KG ','Tiergartenstraße 5 Berlin ',0912345611)
insert into NhaCungCap values('Plutzer Lebensmittelgroßmärkte AG ','Bogenallee 51 Frankfurt ',0912345612)
insert into NhaCungCap values('Nord-Ost-Fisch Handelsgesellschaft mbH ','Frahmredder 112a Cuxhaven ',0912345613)
insert into NhaCungCap values('Formaggi Fortini s.r.l.','Viale Dante, 75 Ravenna ',0912345614)
insert into NhaCungCap values('Norske Meierier ','Hatlevegen 5 Sandvika ',0912345615)
insert into NhaCungCap values('Bigfoot Breweries','3400 - 8th Avenue Suite 210 Bend',0912345616)


-->> insert DonDatHang & ChiTietHang
set dateformat dmy;
insert into DonDatHang values('ddh001','12/9/2018',1)
insert into DonDatHang values('ddh002','7/9/2018',3)
insert into DonDatHang values('ddh003','12/7/2018',3)
insert into DonDatHang values('ddh004','12/7/2018',6)
insert into DonDatHang values('ddh005','12/6/2018',8)
insert into DonDatHang values('ddh006','12/5/2018',4)
insert into DonDatHang values('ddh007','12/4/2018',6)
    -- những đơn hàng không có dữ liệu
insert into DonDatHang values('ddh008','12/3/2018',4)
insert into DonDatHang values('ddh009','12/3/2018',4)
insert into DonDatHang values('ddh010','12/2/2018',1)
insert into DonDatHang values('ddh011','9/2/2018',5)
insert into DonDatHang values('ddh012','12/1/2018',8)
insert into DonDatHang values('ddh013','12/1/2018',8)

insert into ChiTietDonHang values('ddh001','tv002',100)
insert into ChiTietDonHang values('ddh001','tv005',200)

insert into ChiTietDonHang values('ddh002','tv001',120)
insert into ChiTietDonHang values('ddh002','tv005',300)
insert into ChiTietDonHang values('ddh002','tv008',200)

insert into ChiTietDonHang values('ddh003','tv002',150)
insert into ChiTietDonHang values('ddh003','tv003',190)
insert into ChiTietDonHang values('ddh003','tv006',400)

insert into ChiTietDonHang values('ddh004','tv004',250)

insert into ChiTietDonHang values('ddh005','tv004',170)
insert into ChiTietDonHang values('ddh005','tv002',430)
insert into ChiTietDonHang values('ddh005','tv006',300)
insert into ChiTietDonHang values('ddh005','tv007',300)
insert into ChiTietDonHang values('ddh005','tv003',190)

insert into ChiTietDonHang values('ddh006','tv003',230)
insert into ChiTietDonHang values('ddh006','tv006',250)
insert into ChiTietDonHang values('ddh006','tv002',340)

insert into ChiTietDonHang values('ddh007','tv002',160)

insert into ChiTietDonHang values('ddh008','tv003',160)
insert into ChiTietDonHang values('ddh008','tv002',160)

insert into ChiTietDonHang values('ddh009','tv001',160)
insert into ChiTietDonHang values('ddh009','tv008',160)
insert into ChiTietDonHang values('ddh009','tv007',160)

insert into ChiTietDonHang values('ddh010','tv003',160)

insert into ChiTietDonHang values('ddh011','tv004',160)

insert into ChiTietDonHang values('ddh012','tv005',160)
insert into ChiTietDonHang values('ddh012','tv002',160)

insert into ChiTietDonHang values('ddh013','tv005',100)
insert into ChiTietDonHang values('ddh013','tv002',100)
-->> insert PhieuNhapHang & ChiTietPNHang
insert into PhieuNhapHang values('pnh001','1/10/2018','ddh001')
insert into PhieuNhapHang values('pnh002','1/7/2018','ddh005')
insert into PhieuNhapHang values('pnh003','20/9/2018','ddh002')
insert into PhieuNhapHang values('pnh004','4/5/2018','ddh007')
insert into PhieuNhapHang values('pnh005','10/6/2018','ddh006')
insert into PhieuNhapHang values('pnh006','18/8/2018','ddh004')
insert into PhieuNhapHang values('pnh007','21/8/2018','ddh003')
insert into PhieuNhapHang values('pnh008','21/10/2018','ddh013')
insert into PhieuNhapHang values('pnh009','21/10/2018','ddh010')

insert into ChiTietPNHang values('pnh001','tv002',100,5.0)
insert into ChiTietPNHang values('pnh001','tv005',200,14.4)

insert into ChiTietPNHang values('pnh002','tv004',170,12.0)
insert into ChiTietPNHang values('pnh002','tv002',430,6.0)
insert into ChiTietPNHang values('pnh002','tv006',300,3.9)
insert into ChiTietPNHang values('pnh002','tv007',300,8.0)
insert into ChiTietPNHang values('pnh002','tv003',190,6.8)

insert into ChiTietPNHang values('pnh003','tv001',120,5.0)
insert into ChiTietPNHang values('pnh003','tv005',300,15.0)
insert into ChiTietPNHang values('pnh003','tv008',200,5.4)

insert into ChiTietPNHang values('pnh004','tv002',160,4.8)

insert into ChiTietPNHang values('pnh005','tv003',230,5.0)
insert into ChiTietPNHang values('pnh005','tv006',250,4.0)
insert into ChiTietPNHang values('pnh005','tv002',340,5.0)

insert into ChiTietPNHang values('pnh006','tv004',250,11.5)

insert into ChiTietPNHang values('pnh007','tv002',150,5.4)
insert into ChiTietPNHang values('pnh007','tv003',190,5.5)
insert into ChiTietPNHang values('pnh007','tv006',400,4.1)

insert into ChiTietPNHang values('pnh008','tv005',100,15.5)
insert into ChiTietPNHang values('pnh008','tv002',50,4.7)

insert into ChiTietPNHang values('pnh009','tv002',100,5.4)
insert into ChiTietPNHang values('pnh009','tv003',50,5.5)
insert into ChiTietPNHang values('pnh009','tv006',40,4.1)

-- tv001 - 8.0
-- tv002 - 10.5
-- tv003 - 12.9
-- tv004 - 20.4
-- tv005 - 27.7
-- tv006 - 6.6
-- tv007 - 12.0
-- tv008 - 7.5
-->> insert PhieuXuat & ChiTietPXuat
insert into PhieuXuat values('px001','10/11/2018',N'Nguyễn Hải Cường')
insert into PhieuXuat values('px002','10/11/2018',N'Trần Văn Võ')
insert into PhieuXuat values('px003','10/11/2018',N'Bùi Công Thìn')
insert into PhieuXuat values('px004','10/11/2018',N'Nguyễn Duy Anh')

insert into ChiTietPXuat values('px001','tv001',1,8.0)
insert into ChiTietPXuat values('px001','tv004',2,20.0)
insert into ChiTietPXuat values('px001','tv002',1,10.0)

insert into ChiTietPXuat values('px002','tv001',1,8.0)
insert into ChiTietPXuat values('px002','tv002',1,10.0)

insert into ChiTietPXuat values('px003','tv001',2,8.0)

insert into ChiTietPXuat values('px004','tv004',1,20.0)
insert into ChiTietPXuat values('px004','tv005',2,27.7)
insert into ChiTietPXuat values('px004','tv003',1,12.9)
insert into ChiTietPXuat values('px004','tv002',2,10.5)
insert into ChiTietPXuat values('px004','tv001',3,8.0)
-- 6-7-8
-------------------------------------------------------------------------------------------------------------
-- update
update DonDatHang
    set NgayDat = '15/2/2018'
where MaDDHang = 'ddh001'
update DonDatHang
    set NgayDat = '15/4/2018'
where MaDDHang = 'ddh002'
-- delete những DonDatHang mà không có chi tiết đơn hàng
delete DonDatHang 
    where MaDDHang = 'ddh008' 
    and (select count(MaDDHang) from ChiTietDonHang where MaDDHang = 'ddh008') = 0
delete DonDatHang 
    where MaDDHang = 'ddh009' 
    and (select count(MaDDHang) from ChiTietDonHang where MaDDHang = 'ddh009') = 0
delete DonDatHang 
    where MaDDHang = 'ddh010' 
    and (select count(MaDDHang) from ChiTietDonHang where MaDDHang = 'ddh010') = 0
delete DonDatHang 
    where MaDDHang = 'ddh011'
    and (select count(MaDDHang) from ChiTietDonHang where MaDDHang = 'ddh011') = 0
delete DonDatHang 
    where MaDDHang = 'ddh012' 
    and (select count(MaDDHang) from ChiTietDonHang where MaDDHang = 'ddh012') = 0

select * from DonDatHang

-- lấy danh sách đơn nhập hàng từ 1/1/2018 -> 1/6/2018
select * from DonDatHang where NgayDat between '1/1/2018' and '1/6/2018'
-- Thống kê số lượng mặt hàng theo nhà cung cấp
    -- VD: lấy số mặt hàng từ nhà cung cấp có id=4
select count(ID) as 'Số lượng mặt hàng' from ChiTietPNHang where MaPNHang 
    in (
        select MaPNHang from PhieuNhapHang where MaDDHang 
        in (
            select MaDDHang from DonDatHang where MaNCCap = 4 
        )
    )

-- ex2 9/8/2018
-- 7: kiểm tra mặt hàng nào được đặt hàng nhiều nhất
    -- 3,tv002=33,12,27
select max(Tong) as Tong
    from (
        select sum(SoLuongDat) as Tong from ChiTietDonHang group by MaVatTu
    ) as tem
-- 8: tìm các mặt hàng bắt đầu bằng T
select * from VatTu where Ten like 't%'
-- 9: thống kê mặt hàng có số lượng đặt hàng nhiều hơn 1000
select MaVatTu,sum(SoLuongDat) from ChiTietDonHang group by MaVatTu 
    having sum(SoLuongDat) > 1000
-- 10: Tìm tất cả các mặt hàng đã nhập về nhưng chưa xuất
select * from VatTu where MaVatTu not in (select MaVatTu from ChiTietPXuat) and MaVatTu in (select MaVatTu from ChiTietPNHang)
-- 11: Tìm tất cả các mặt hàng đã nhập về và đã xuất
select * from VatTu where MaVatTu in (select MaVatTu from ChiTietPXuat) and MaVatTu in (select MaVatTu from ChiTietPNHang)

-- EX2 10/08/2018
-- 11: tạo bảng tồn kho
if not exists (select 1 from sysobjects where name = 'TonKho')
    begin 
        create table TonKho(
            ID int identity primary key,
            NamThang char(100),
            MaVatTu nvarchar(50),
            SLDau int,
            TongSLNhap int,
            TongSLXuat int,
            SLCuoi int,
            constraint FK_VatTu_TonKho foreign key (MaVatTu) references VatTu(MaVatTu)
        )
    end

-- 12:
alter table TonKho 
    alter column NamThang date
alter TABLE TonKho
    add constraint CK_NamThang check (NamThang > '1/1/1999' and NamThang < '31/12/2999')
-- 13:Truy vấn danh sách các phiếu đặt hàng chưa được nhập hàng
select * from DonDatHang where MaDDHang = any(select MaDDHang from PhieuNhapHang)

-- 14:Lấy thông tin nhà cung cấp có nhiều đơn đặt hàng nhất
select top 1 tem.SLD as [Số đơn],NhaCungCap.* from NhaCungCap 
    inner join (
        select MaNCCap as IDNCC,count(MaNCCap) as SLD from DonDatHang group by MaNCCap
    ) as tem on NhaCungCap.MaNCCap=tem.IDNCC order by tem.SLD desc

-- 15: Lấy thông tin vật tư được xuất bán nhiều nhất
select top 1 tem.SLX as [số lượng],VatTu.* from VatTu 
    inner join (
        select MaVatTu as MVT_ID, Sum(SoLuongXuat) as SLX from ChiTietPXuat group by MaVatTu
    ) as tem on VatTu.MaVatTu = tem.MVT_ID order by tem.SLX desc
-- 16: Tính tổng tiền của các đơn đặt hàng, đưa ra đơn đặt hàng có giá trị lớn nhất
select DonDatHang.*,tem.Tien from DonDatHang inner join 
    (
        select MaDDHang,tem.Tien from PhieuNhapHang 
        inner join (
            select MaPNHang as PNH_ID, sum((SoLuongNhap * DonGiaNhap)) as Tien from ChiTietPNHang where MaPNHang in (select MaPNHang from PhieuNhapHang) group by MaPNHang
        ) as tem on PhieuNhapHang.MaPNHang = tem.PNH_ID
    ) as tem on DonDatHang.MaDDHang = tem.MaDDHang order by tem.Tien desc
-- 17: Thống kê những đơn đặt hàng chưa đủ số lượng [tick]
    -- TODO
--select * from ChiTietDonHang 

select * from ChiTietPNHang where MaVatTu = 'tv006'

SELECT * from ChiTietDonHang
SELECT * from ChiTietPNHang
