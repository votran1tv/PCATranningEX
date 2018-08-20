if not exists (select 1 from sys.databases where name = 'QLBH')
    begin 
        create database QLBH
        -- on primary(
        --     size=5,
        --     maxsize=50,
        --     filegrowth=5,
        --     filename = '\mnt\DATA\DB\qlbh.mdf',
        --     name = 'QLBH'
        -- )
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
            MaPhieuXuat nvarchar(50),
            MaVatTu nvarchar(50),
            SoLuongXuat int,
            DonGia float, -- dv: $
            constraint PK_ChiTietPhieuXuat primary key (MaPhieuXuat,MaVatTu),
            constraint FK_PhieuXuat_ChiTietPXuat foreign key (MaPhieuXuat) references PhieuXuat(MaPhieuXuat),
            constraint FK_VatTu_ChiTietPXuat foreign key (MaVatTu) references VatTu(MaVatTu)
        )
    end

-- insert du lieu
insert into VatTu values('tv001',N'Máy tính dell','Chiec',45)
insert into VatTu values('tv002',N'Điện thoại Nokia','Chiec',20)
insert into VatTu values('tv003',N'Điện Thoại Samsung','Chiec',33)
insert into VatTu values('tv004',N'Máy tính lenevo','Chiec',80)
insert into VatTu values('tv005',N'Điện thoại cục gạch','Chiec',50)
insert into VatTu values('tv006',N'Điện thoại oppo','Chiec',66)
insert into VatTu values('tv007',N'Điện thoại apple','Chiec',79)
insert into VatTu values('tv008',N'Điện thoại sky','Chiec',90)
insert into VatTu values('tv009',N'Máy tính asus','Chiec',0)
insert into VatTu values('tv010',N'Điện thoại asus','Chiec',30)
insert into VatTu values('tv011',N'Điện thoại sony','Chiec',0)
insert into VatTu values('tv012',N'Điện thoại viettel','Chiec',20)
select * from VatTu

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
select * from NhaCungCap

set dateformat dmy;
-->> insert DonDatHang & ChiTietDonHang
insert into DonDatHang(MaDDHang,NgayDat,MaNCCap) values
	('ddh001','1/3/2018',10),
	('ddh002','3/3/2018',5),
	('ddh003','15/5/2018',11),
	('ddh004','20/6/2018',13),
	('ddh005','24/6/2018',12),
	('ddh006','14/7/2018',4),
	('ddh007','15/7/2018',9),
	('ddh008','15/7/2018',5),
	('ddh009','16/7/2018',10),
	('ddh010','20/7/2018',4),
	('ddh011','20/7/2018',9)
    select * from DonDatHang
	-- ChiTietDonHang 17v
insert into ChiTietDonHang(MaDDHang,MaVatTu,SoLuongDat) values
	('ddh001','tv001',200),
	('ddh001','tv006',400),
	('ddh001','tv010',400),
	('ddh002','tv004',300),
	('ddh002','tv007',500),
	('ddh003','tv005',400),
	('ddh004','tv008',800),
	('ddh005','tv002',500),
	('ddh005','tv003',400),
	('ddh006','tv011',350),
	('ddh006','tv012',200),
	('ddh007','tv009',600),
	('ddh008','tv004',500),
	('ddh008','tv007',400),
	('ddh009','tv001',400),
	('ddh009','tv006',400),
	('ddh009','tv010',400),
	('ddh010','tv011',350),
	('ddh010','tv012',500),
	('ddh011','tv009',500)
	select * from ChiTietDonHang
	
-->> insert PhieuNhapHang & ChiTietPNHang
insert into PhieuNhapHang(MaPNHang,NgayNhap,MaDDHang) values
    ('pnh001','15/3/2018','ddh002'),
	('pnh002','16/3/2018','ddh001'),
	('pnh003','20/5/2018','ddh003'),
	('pnh004','30/6/2018','ddh005'),
	('pnh005','01/07/2018','ddh004'),
	('pnh006','23/7/2018','ddh006'),
	('pnh007','23/7/2018','ddh007'),
	('pnh008','28/8/2018','ddh009'),
	('pnh009','1/09/2018','ddh008')
	select * from PhieuNhapHang
	-- insert ChiTietPNHang
	-- tv001 - 8.0
	-- tv002 - 10.5
	-- tv003 - 12.9
	-- tv004 - 20.4
	-- tv005 - 27.7
	-- tv006 - 6.6
	-- tv007 - 12.0
	-- tv008 - 7.5
	-- tv010 - 15.0
	-- tv011 - 30.0
	-- tv012 - 24.5
insert into ChiTietPNHang(MaPNHang,MaVatTu,SoLuongNhap,DonGiaNhap) values
	('pnh001','tv004',300,20.4),
	('pnh001','tv007',500,12.0),
	('pnh002','tv001',200,8.0),
	('pnh002','tv006',400,6.6),
	('pnh002','tv010',400,15.0),
	('pnh003','tv005',400,27.7),
	('pnh004','tv002',500,10.5),
	('pnh004','tv003',200,12.9),--ed
	('pnh005','tv008',800,7.5),
	('pnh006','tv011',350,30.0),
	('pnh006','tv012',200,24.5),
	('pnh007','tv009',600,18.9),
	('pnh008','tv001',300,8.0),--ed
	('pnh008','tv006',400,6.6),
	('pnh008','tv010',350,15.0),--ed
	('pnh009','tv004',300,20.4),--ed
	('pnh009','tv007',400,12.0)
	select * from ChiTietPNHang
	
-->> insert PhieuXuat & ChiTietPXuat
insert into PhieuXuat values('px001','10/11/2018',N'Nguyễn Hải Cường')
insert into PhieuXuat values('px002','10/11/2018',N'Trần Văn Võ')
insert into PhieuXuat values('px003','10/11/2018',N'Bùi Công Thìn')
insert into PhieuXuat values('px004','10/11/2018',N'Nguyễn Duy Anh')
insert into PhieuXuat values('px005','11/12/2018',N'Thanh Dương')

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
insert into ChiTietPXuat values('px005','tv005',20,27.7)
insert into ChiTietPXuat values('px005','tv004',30,20.0)
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
    where MaDDHang not in (
        select MaDDHang from ChiTietDonHang group by MaDDHang
    )

select * from DonDatHang

-- lấy danh sách đơn nhập hàng từ 1/1/2018 -> 1/6/2018
select * from DonDatHang where NgayDat between '1/1/2018' and '1/6/2018'
-- 6: Thống kê số lượng mặt hàng theo nhà cung cấp
    -- VD: lấy số mặt hàng từ nhà cung cấp có id=4
select count(MaPNHang) as 'Số lượng mặt hàng' from ChiTietPNHang where MaPNHang 
    in (
        select MaPNHang from PhieuNhapHang where MaDDHang 
        in (
            select MaDDHang from DonDatHang where MaNCCap = 10 
        )
    ) 

-- ex2 9/8/2018
-- 7: kiểm tra mặt hàng nào được đặt hàng nhiều nhất
select top 1 MaVatTu,sum(SoLuongDat)[SoLuong] from ChiTietDonHang
    group by MaVatTu
    order by sum(SoLuongDat) desc
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
            NamThang char(50),
            MaVatTu nvarchar(50),
            SLDau int,
            TongSLNhap int,
            TongSLXuat int,
            SLCuoi int,
            constraint PK_TonKho PRIMARY key(NamThang,MaVatTu),
            constraint FK_VatTu_TonKho foreign key (MaVatTu) references VatTu(MaVatTu)
        )
    end

-- 12:
alter TABLE TonKho
    add constraint CK_NamThang check (NamThang > '1/1/1999' and NamThang < '31/12/2999')

-- 13:Truy vấn danh sách các phiếu đặt hàng chưa được nhập hàng
select * from DonDatHang where MaDDHang not in(select MaDDHang from PhieuNhapHang)

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

select ChiTietDonHang.MaDDHang,ChiTietDonHang.MaVatTu,SoLuongDat,SoLuongNhap from ChiTietDonHang,(
	select MaDDHang,ChiTietPNHang.MaPNHang,MaVatTu,SoLuongNhap 
	from ChiTietPNHang inner join PhieuNhapHang 
	on ChiTietPNHang.MaPNHang=PhieuNhapHang.MaPNHang
)[tem] where ChiTietDonHang.MaDDHang=tem.MaDDHang and ChiTietDonHang.
MaVatTu=tem.MaVatTu and SoLuongDat>SoLuongNhap
order by ChiTietDonHang.MaDDHang asc

--------------------------------------------------------------------------
-- ex2 (13/08/18)--
-- 18:
create view vw_DMVT as
	select MaVatTu,Ten from VatTu

-- 19:
    --TODO
create view vw_DDH_TongSLDatNhap as 
    select ChiTietDonHang.MaDDHang,ChiTietDonHang.MaVatTu,SoLuongDat,SoLuongNhap from ChiTietDonHang,(
		select MaDDHang,ChiTietPNHang.MaPNHang,MaVatTu,SoLuongNhap 
		from ChiTietPNHang inner join PhieuNhapHang 
		on ChiTietPNHang.MaPNHang=PhieuNhapHang.MaPNHang
	)[tem] where ChiTietDonHang.MaDDHang=tem.MaDDHang and ChiTietDonHang.
	MaVatTu=tem.MaVatTu and SoLuongDat<=SoLuongNhap
	order by ChiTietDonHang.MaDDHang asc
-- 20:
    --TODO
create view vw_DonDH_DaNhapDu as
	select ChiTietDonHang.MaDDHang,
		(case
			when sum(SoLuongDat)<=sum(SoLuongNhap) then 'Da Nhap Du'
			when sum(SoLuongDat)>sum(SoLuongNhap) then 'Chu Nhap Du'
		end)[DaNhapDu]
	from ChiTietDonHang,(
		select MaDDHang,ChiTietPNHang.MaPNHang,MaVatTu,SoLuongNhap 
		from ChiTietPNHang inner join PhieuNhapHang 
		on ChiTietPNHang.MaPNHang=PhieuNhapHang.MaPNHang
	)[tem] where ChiTietDonHang.MaDDHang=tem.MaDDHang and ChiTietDonHang.
	MaVatTu=tem.MaVatTu
	group by ChiTietDonHang.MaDDHang
	order by ChiTietDonHang.MaDDHang asc
-- 21:
create view vw_TongNhap AS 
    select concat(cast(year(NgayNhap) as char),cast(month(NgayNhap) as char)) as ngay,MaVatTu,sum(SoLuongNhap) as SoLuong
    from ChiTietPNHang 
    inner join PhieuNhapHang on ChiTietPNHang.MaPNHang = PhieuNhapHang.MaPNHang
    group by concat(cast(year(NgayNhap) as char),cast(month(NgayNhap) as char)),MaVatTu

-- 22:
create view vw_TongXuat as 
    select cast(year(NgayXuat) as char) as nam,MaVatTu,sum(SoLuongXuat) as SoLuong from ChiTietPXuat 
    inner join PhieuXuat on ChiTietPXuat.MaPhieuXuat=PhieuXuat.MaPhieuXuat
    group by cast(year(NgayXuat) as char),MaVatTu

-- ex2 update (15/08/18)
-- 23. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
create procedure sp_SoLuongCuoiVatTu 
    @MaVatTu nvarchar(50)
as
   select (
        select sum(SoLuongNhap) from ChiTietPNHang where MaVatTu = @MaVatTu
    )-(
        select sum(SoLuongXuat) from ChiTietPXuat where MaVatTu = @MaVatTu
    )[Tổng số lượng cuối]

sp_SoLuongCuoiVatTu 'tv004'

-- 24: 
create procedure sp_TongTienXuatVatTu
    @MaVatTu nvarchar(50)
as
    select sum(SoLuongXuat*DonGia)[Tổng tiền xuất] from ChiTietPXuat where MaVatTu = @MaVatTu

sp_TongTienXuatVatTu 'tv001'

-- 25:
create procedure sp_TongSoLuongDatHang
    @DonDatHang nvarchar(50)
AS
    select sum(SoLuongDat)[So luong dat] from ChiTietDonHang where MaDDHang = @DonDatHang

sp_TongSoLuongDatHang 'ddh001'

-- 26, 27:
    -- sp them don hang
create procedure sp_ThemDonhang
    @MaDonHang nvarchar(50),
    @NgayDat date,
    @MaNCCap int
AS
    insert into DonDatHang(MaDDHang,NgayDat,MaNCCap) VALUES (@MaDonHang,@NgayDat,@MaNCCap);
    -- sp them chi tiet don hang
create procedure sp_ThemChiTietDonHang
    @MaDonHang nvarchar(50),
    @MaVatTu nvarchar(50),
    @SoLuongDat float(3)
AS
    insert into ChiTietDonHang(MaDDHang,MaVatTu,SoLuongDat) VALUES (@MaDonHang,@MaVatTu,@SoLuongDat);

sp_ThemDonhang 'ddh012','21-07-2018','11';
sp_ThemChiTietDonHang 'ddh012','tv005',100;

-- 28: kiem tra so luong vat tu khong duoc > 100
create trigger tg_KienTraSLVatTu on VatTu for INSERT
as 
    if(select count(MaVatTu) from VatTu) > 15
        begin
            print 'So luong vat tu da lon hon 15'
        end
    

    -- test
    insert into VatTu values('tv034','test','kg',30)
    select * from VatTu
    delete VatTu where Ten = 'test'

-- ex2 update 16/08
-- 29:
    -- them cot ThanhTien
alter table ChiTietPNHang
    add ThanhTien float(3)
    -- function tinh ThanhTien
create function fn_ThanhTien ( @DonGia float(3),@SoLuong int)
returns float(3) as
    begin 
        DECLARE @Tong float(3)
        set @Tong = @DonGia*@SoLuong
        return @Tong
    end

    -- tu dong tinh ThanhTien trong ChiTietPhieuNhap
create trigger tg_TinhTongTien on ChiTietPNHang for INSERT
as
    begin
        DECLARE @DonGia float(3) = (
            select ChiTietPNHang.DonGiaNhap 
            from ChiTietPNHang,inserted
            where ChiTietPNHang.MaVatTu = inserted.MaVatTu and ChiTietPNHang.MaPNHang = inserted.MaPNHang
        )
        DECLARE @SoLuong int = (
            select ChiTietPNHang.SoLuongNhap 
            from ChiTietPNHang,inserted
            where ChiTietPNHang.MaVatTu = inserted.MaVatTu and ChiTietPNHang.MaPNHang = inserted.MaPNHang
        )
        UPDATE ChiTietPNHang 
            set ThanhTien = dbo.fn_ThanhTien(@DonGia,@SoLuong)
            from inserted
            where ChiTietPNHang.MaPNHang = inserted.MaPNHang and ChiTietPNHang.MaPNHang=inserted.MaPNHang
    end

    --insert into PhieuNhapHang values ('pnh010','23/07/2018','ddh012')
    -- test du lieu (1)
    insert into ChiTietPNHang (MaPNHang,MaVatTu,SoLuongNhap,DonGiaNhap,ThanhTien) values ('pnh010','tv005',100,27.7,0) -- (1)
    delete ChiTietPNHang where MaPNHang = 'pnh010' and MaVatTu = 'tv005' -- (2)

-- 30:
    -- them cot TinhTrang vao bang VatTu
alter table VatTu
   add TinhTrang bit not null DEFAULT 0
    
    -- thu tuc kiem tra TinhTrang of VatTu
create PROCEDURE sp_TinhTrangVatTu
AS
    select MaVatTu,(
        case
            when TinhTrang = 1 then 'Còn hàng'
            else 'Không còn hàng'
        end
    )[TrangThai] from VatTu

-- 31: 
    -- trigger thay doi VatTu.TinhTrang khi ChiTietPNHang thay doi
create trigger tg_insert_PhieuNhap on ChiTietPNHang for INSERT,UPDATE
AS
    BEGIN
        DECLARE @SL_Nhap int =(
            select sum(ChiTietPNHang.SoLuongNhap)
            from ChiTietPNHang,inserted 
            where ChiTietPNHang.MaVatTu = inserted.MaVatTu
        )
        DECLARE @SL_Xuat int = (
            select sum(ChiTietPXuat.SoLuongXuat) 
            from ChiTietPXuat,inserted
            where ChiTietPXuat.MaVatTu = inserted.MaVatTu
        )
        if (@SL_Nhap>@SL_Xuat)
            UPDATE VatTu 
                set TinhTrang = 1
            from inserted
            where VatTu.MaVatTu = inserted.MaVatTu
        if(@SL_Nhap<=@SL_Xuat)
            UPDATE VatTu 
                set TinhTrang = 0
            from inserted
            where VatTu.MaVatTu = inserted.MaVatTu
    end

    -- trigger thay doi VatTu.TinhTrang khi ChiTietPXuat thay doi
create trigger tg_insert_PhieuXuat on ChiTietPXuat for INSERT,UPDATE
as
    BEGIN
        DECLARE @SL_Nhap int =(
            select sum(ChiTietPNHang.SoLuongNhap)
            from ChiTietPNHang,inserted 
            where ChiTietPNHang.MaVatTu = inserted.MaVatTu
        )
        DECLARE @SL_Xuat int = (
            select sum(ChiTietPXuat.SoLuongXuat) 
            from ChiTietPXuat,inserted
            where ChiTietPXuat.MaVatTu = inserted.MaVatTu
        )
        if (@SL_Nhap>@SL_Xuat)
            UPDATE VatTu 
                set TinhTrang = 1
            from inserted
            where VatTu.MaVatTu = inserted.MaVatTu
        if(@SL_Nhap<=@SL_Xuat)
            UPDATE VatTu 
                set TinhTrang = 1
            from inserted
            where VatTu.MaVatTu = inserted.MaVatTu
    END
    -- test du lieu (1)
    insert into ChiTietPNHang (MaPNHang,MaVatTu,SoLuongNhap,DonGiaNhap,ThanhTien) values ('pnh010','tv005',100,27.7,0) -- (1)
    delete ChiTietPNHang where MaPNHang = 'pnh010' and MaVatTu = 'tv005' -- (2)

-- 32:
create PROCEDURE sp_CapNhat_VatTu_TinhTrang
AS  
    BEGIN

        DECLARE @i int = 1
        DECLARE @n int = (select Count(MaVatTu) from VatTu)
        DECLARE @VatTu_ID nvarchar(50)

        DECLARE @DonNhap_ID int
        DECLARE @DonXuat_ID int
        DECLARE @ab int

        while @i <= @n
            BEGIN
                --print @i
                set @VatTu_ID = (
                    select MaVatTu from (
                        select ROW_NUMBER() Over(order by MaVatTu) as index_id,MaVatTu
                        from VatTu
                    ) as tem_VatTu 
                    where index_id = @i
                )
                set @DonNhap_ID = (select sum(SoLuongNhap) from ChiTietPNHang where MaVatTu = @VatTu_ID)
                set @DonXuat_ID = (select sum(SoLuongXuat) from ChiTietPXuat where MaVatTu = @VatTu_ID)

                if (@DonNhap_ID <= @DonXuat_ID) 
                    BEGIN
                        UPDATE VatTu
                        set TinhTrang = 0
                        where MaVatTu = @VatTu_ID
                    end
                ELSE
                    BEGIN
                        UPDATE VatTu
                        set TinhTrang = 1
                        WHERE MaVatTu = @VatTu_ID
                    end

                set @i = @i + 1
            END
    end--32

    -- test du lieu 
    insert into VatTu(MaVatTu,Ten,DonViTinh,TiLePhanTram) values('tv013',N'Điện thoại BlackBerry','Chiec',30.0)
    delete VatTu where MaVatTu = 'tv013'

    -- test dulieu cau 32:
    insert into PhieuXuat(MaPhieuXuat,NgayXuat,TenKhachHang)
        VALUES ('px006','12/12/2018','Duongth')

    insert into ChiTietPXuat (MaPhieuXuat,MaVatTu,SoLuongXuat,DonGia)
        VALUES ('px006','tv006',800,9)
    

    select MaVatTu,sum(SoLuongNhap) from ChiTietPNHang group by MaVatTu
-- 33:
    -- trigger ChiTietPNHang
create trigger tg_UpdateTonKho on ChiTietPNHang for INSERT,UPDATE
AS
BEGIN
    DECLARE @toMonth char(50) = (
        select cast(month(GETDATE()) as char) + cast(year(getdate()) as char)
    )
    DECLARE @SL_Tong1VatTu int = (
        select sum(ChiTietPNHang.SoLuongNhap) from ChiTietPNHang,inserted WHERE ChiTietPNHang.MaVatTu =inserted.MaVatTu
    )
    DECLARE @SL_Tong1VatTu_1Thang int = (
        select sum(ChiTietPXuat.SoLuongXuat) from ChiTietPXuat,inserted,PhieuXuat
        where ChiTietPXuat.MaVatTu=inserted.MaVatTu 
            and ChiTietPXuat.MaPhieuXuat=PhieuXuat.MaPhieuXuat 
            and (CAST(month(PhieuXuat.NgayXuat) as char ) + CAST(year(PhieuXuat.NgayXuat) as char)) = @toMonth
        group by ChiTietPXuat.MaVatTu
    )
    if exists ( select TonKho.MaVatTu from TonKho,inserted where TonKho.MaVatTu=inserted.MaVatTu ) 
        and exists (select TonKho.NamThang from TonKho where TonKho.NamThang = @toMonth)
        BEGIN -- neu trong TonKho da ton tai thi update
            --@SL_Tong1VatTu - sl_PhieuXuat_of_ThangNam
            UPDATE TonKho
            set 
                SLDau = 0, -- chua biet cach su ly
                TongSLNhap = TongSLNhap - deleted.SoLuongNhap + inserted.SoLuongNhap,
                TongSLXuat = isnull(@SL_Tong1VatTu_1Thang,0),
                SLCuoi = (TongSLNhap - deleted.SoLuongNhap + inserted.SoLuongNhap) - TongSLXuat
            from TonKho,deleted,inserted
            where TonKho.MaVatTu=deleted.MaVatTu and TonKho.MaVatTu=inserted.MaVatTu

            PRINT 'upd'
        END
    ELSE 
        BEGIN
            DECLARE @MVT nvarchar(50) = (select MaVatTu from inserted)
            alter TABLE TonKho
                drop constraint CK_NamThang
            insert into TonKho(NamThang,MaVatTu,SLDau,TongSLNhap,TongSLXuat,SLCuoi)
                VALUES (
                    @toMonth,
                    @MVT,
                    0,
                    @SL_Tong1VatTu,
                    isnull(@SL_Tong1VatTu_1Thang,0),
                    (@SL_Tong1VatTu - isnull(@SL_Tong1VatTu_1Thang,0))
                )
            alter TABLE TonKho WITH NOCHECK
                add constraint CK_NamThang check (NamThang > '1/1/1999' and NamThang < '31/12/2999')
                print 'ins'
        end
    -- print @SL_Tong1VatTu
    -- PRINT @SL_Tong1VatTu_1Thang
end--tg_UpdateTonKho

    -- trigger insert,update,delete from ChiTietPXuat
alter trigger tg_DataChange_ChiTietPhieuXuat on ChiTietPXuat for insert,update,delete 
as 
BEGIN
    DECLARE @Activity nvarchar(50)

    DECLARE @toMonth char(50) = (
        select cast(month(GETDATE()) as char) + cast(year(getdate()) as char)
    )
    DECLARE @SL_TongNhap_1Thang int = (
        select sum(ChiTietPNHang.SoLuongNhap) from ChiTietPNHang,inserted WHERE ChiTietPNHang.MaVatTu =inserted.MaVatTu
    )
    DECLARE @SL_TongXuat_1Thang int = (
        select sum(ChiTietPXuat.SoLuongXuat) from ChiTietPXuat,inserted,PhieuXuat
        where ChiTietPXuat.MaVatTu=inserted.MaVatTu 
            and ChiTietPXuat.MaPhieuXuat=PhieuXuat.MaPhieuXuat 
            and (CAST(month(PhieuXuat.NgayXuat) as char ) + CAST(year(PhieuXuat.NgayXuat) as char)) = @toMonth
        group by ChiTietPXuat.MaVatTu
    )

    if exists (select 1 from inserted) and exists (select 1 from deleted) -- for update
    BEGIN
        set @Activity = 'update'
        if exists (select TonKho.MaVatTu from TonKho,inserted where TonKho.MaVatTu=inserted.MaVatTu) 
        and exists ( select TonKho.NamThang from TonKho where TonKho.NamThang = @toMonth)
            begin
                update TonKho
                    set TongSLXuat = TongSLXuat - deleted.SoLuongXuat + inserted.SoLuongXuat,
                        SLCuoi = @SL_TongNhap_1Thang - inserted.SoLuongXuat
                    from TonKho,inserted,deleted
                    where TonKho.MaVatTu=inserted.MaVatTu and TonKho.MaVatTu=deleted.MaVatTu
            end
        ELSE
            BEGIN
                DECLARE @MVT nvarchar(50) = (select MaVatTu from inserted)
                alter TABLE TonKho
                    drop constraint CK_NamThang
                insert into TonKho(NamThang,MaVatTu,SLDau,TongSLNhap,TongSLXuat,SLCuoi)
                    VALUES (
                        @toMonth,
                        @MVT,
                        0,
                        @SL_TongNhap_1Thang,
                        (select SoLuongXuat from inserted where MaVatTu = @MVT),
                        (@SL_TongNhap_1Thang - isnull(@SL_TongXuat_1Thang,0))
                    )
                alter TABLE TonKho WITH NOCHECK
                    add constraint CK_NamThang check (NamThang > '1/1/1999' and NamThang < '31/12/2999')
            end
    end
    
    if exists (select 1 from inserted) and not exists (select 1 from deleted) -- for insert
    BEGIN
        set @Activity = 'insert'
        if not exists ( select TonKho.NamThang from TonKho where TonKho.NamThang = @toMonth)
            BEGIN
                DECLARE @MVT_02 nvarchar(50) = (select MaVatTu from inserted)
                alter TABLE TonKho
                    drop constraint CK_NamThang

                insert into TonKho(NamThang,MaVatTu,SLDau,TongSLNhap,TongSLXuat,SLCuoi)
                    VALUES (
                        @toMonth,
                        @MVT_02,
                        0,
                        @SL_TongNhap_1Thang,
                        (select SoLuongXuat from inserted where MaVatTu = @MVT_02),
                        @SL_TongNhap_1Thang - (select SoLuongXuat from inserted where MaVatTu = @MVT_02)
                    )

                alter TABLE TonKho WITH NOCHECK
                    add constraint CK_NamThang check (NamThang > '1/1/1999' and NamThang < '31/12/2999')
            END
        ELSE
            begin
                update TonKho
                    set TongSLXuat = TongSLXuat - deleted.SoLuongXuat + inserted.SoLuongXuat,
                        SLCuoi = (TongSLXuat - deleted.SoLuongXuat + inserted.SoLuongXuat) - TongSLXuat
                    from TonKho,inserted,deleted
                    where TonKho.MaVatTu=inserted.MaVatTu and TonKho.MaVatTu=deleted.MaVatTu
            END
    end

    if exists (select 1 from deleted) and not exists (select 1 from inserted) -- for delete
    BEGIN
        set @Activity = 'deleted'
        if exists (select TonKho.MaVatTu from TonKho,deleted where TonKho.MaVatTu=deleted.MaVatTu) 
        and exists ( select TonKho.NamThang from TonKho where TonKho.NamThang = @toMonth)
            BEGIN
                update TonKho
                    set TongSLXuat = TongSLXuat - (
                        select SoLuongXuat from deleted where MaVatTu = ChiTietPXuat.MaVatTu
                    ),
                    SLCuoi = TongSLNhap - isnull(@SL_TongXuat_1Thang,0)
                from ChiTietPXuat,deleted
                where ChiTietPXuat.MaVatTu = deleted.MaVatTu
            end
    end

    print @Activity
end--tg_DataChange_ChiTietPhieuXuat
----------------------------------
    use QLBH;
    set dateformat dmy;

    select * from VatTu
    select * from DonDatHang
    select * from ChiTietDonHang
    select * from PhieuNhapHang
    select * from ChiTietPNHang
    select * from PhieuXuat
    select * from ChiTietPXuat
    select * from TonKho