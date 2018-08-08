IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'QuanLyBanHang')
BEGIN
    CREATE DATABASE QuanLyBanHang
    ON PRIMARY
    (
        NAME = 'QuanLyBanHang',
        FILENAME = 'D:\BuiThin\CSDL SQL\QuanLyBanHang.mdf',
        size = 5,
        maxsize = 50,
        FILEGROWTH = 5
    )
END

use QuanLyBanHang

CREATE TABLE VatTu
(
    MaVatTu varchar(10) NOT NULL,
    TenVatTu NVARCHAR(255) NOT NULL,
    DonViTinh varchar(10) NOT NULL,
    TiLePhanTram int NOT NULL,
    CONSTRAINT PK_VatTu PRIMARY KEY(MaVatTu)
)

CREATE TABLE NhaCungCap
(
    MaNCC VARCHAR(10) NOT NULL,
    TenNCC NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    DienThoai INT NOT NULL,
    CONSTRAINT PK_NhaCungCap PRIMARY KEY(MaNCC)
)

CREATE TABLE DonDatHang
(
    MaDDH VARCHAR(10) NOT NULL,
    NgayDat DATE NOT NULL,
    MaNCC VARCHAR(10) NOT NULL,
    CONSTRAINT PK_DonDatHang PRIMARY KEY(MaDDH),
    CONSTRAINT FK_DonDatHang FOREIGN KEY(MaNCC) REFERENCES NhaCungCap(MaNCC)
)

CREATE TABLE ChiTietDonHang
(
    MaChiTietDDH VARCHAR(10) NOT NULL,
    MaDDH VARCHAR(10) NOT NULL,
    MaVatTu VARCHAR(10) NOT NULL,
    SoLuong int NOT NULL,
    CONSTRAINT PK_ChiTietDonDatHang PRIMARY KEY(MaChiTietDDH),
    CONSTRAINT FK_ChiTetDonDatHang1 FOREIGN KEY(MaDDH) REFERENCES DonDatHang(MaDDH),
    CONSTRAINT FK_ChiTietDonDatHang2 FOREIGN KEY(MaVatTu) REFERENCES VatTu(MaVatTu)
)

CREATE TABLE PhieuNhapHang
(
    MaSoPhieuNhap VARCHAR(10) NOT NULL,
    NgayNhap DATE NOT NULL,
    MaDDH VARCHAR(10) NOT NULL,
    CONSTRAINT PK_PhieuNhapHang PRIMARY KEY(MaSoPhieuNhap),
    CONSTRAINT FK_PhieuNhapHang FOREIGN KEY(MaDDH) REFERENCES DonDatHang(MaDDH)
)

CREATE TABLE ChiTietPhieuNhap
(
    MaChiTietPN VARCHAR(10) NOT NULL,
    MaSoPhieuNhap VARCHAR(10) NOT NULL,
    MaVatTu VARCHAR(10) NOT NULL,
    SoLuongNhap int NOT NULL,
    DonGia INT not NULL,
    CONSTRAINT PK_ChiTietPhieuNhap PRIMARY KEY(MaChiTietPN),
    CONSTRAINT FK_ChiTietPhieuNhap1 FOREIGN KEY(MaSoPhieuNhap) REFERENCES PhieuNhapHang(MaSoPhieuNhap),
    CONSTRAINT FK_ChiTietPhieuNhap2 FOREIGN KEY(MaVatTu) REFERENCES VatTu(MaVatTu)
)

CREATE TABLE PhieuXuatHang
(
    MaSoPhieuXuat VARCHAR(10) NOT NULL,
    NgayXuat DATE not null,
    TenKhachHang NVARCHAR(30) NOT NULL,
    CONSTRAINT PK_PhieuXuatHang PRIMARY KEY(MaSoPhieuXuat), 
)

CREATE TABLE ChiTietPhieuXuat
(
    MaChiTietPX VARCHAR(10) NOT NULL,
    MaSoPhieuXuat VARCHAR(10) NOT NULL,
    MaVatTu VARCHAR(10) NOT NULL,
    SoLuongXuat INT NOT NULL,
    DonGia int not null,
    CONSTRAINT PK_ChiTietPhieuXuat PRIMARY KEY(MaChiTietPX),
    CONSTRAINT FK_ChiTietPhieuXuat1 FOREIGN KEY(MaSoPhieuXuat) REFERENCES PhieuXuatHang(MaSoPhieuXuat),
    CONSTRAINT FK_ChiTietPhieuXuat2 FOREIGN KEY(MaVatTu) REFERENCES VatTu(MaVatTu)
)



--Thêm dữ liệu vào bảng--
INSERT INTO VatTu VALUES('VT01', 'Vật tư số 1', 'kg', '99')
INSERT INTO VatTu VALUES('VT02', 'Vật tư số 2', 'cái', '96')
INSERT INTO VatTu VALUES('VT03', 'Vật tư số 3', 'chiếc', '29')
INSERT INTO VatTu VALUES('VT04', 'Vật tư số 4', 'gói', '26')
INSERT INTO VatTu VALUES('VT05', 'Vật tư số 5', 'kg', '90')
SELECT * FROM VatTu

INSERT INTO NhaCungCap VALUES('NCC01', N'Nhà cung cấp số 1', N'Yên Hòa, Cầu Giấy', 0224221223)
INSERT INTO NhaCungCap VALUES('NCC02', N'Nhà cung cấp số 2', N'Trung Hòa, Cầu Giấy', 0224463223)
INSERT INTO NhaCungCap VALUES('NCC03', N'Nhà cung cấp số 3', N'Yên Hòa, Cầu Giấy', 0224221313)
INSERT INTO NhaCungCap VALUES('NCC04', N'Nhà cung cấp số 4', N'Nhân Hòa, Cầu Giấy', 0224285923)
INSERT INTO NhaCungCap VALUES('NCC05', N'Nhà cung cấp số 5', N'Thái Hòa, Cầu Giấy', 0224232123)
SELECT * FROM NhaCungCap

set dateformat dmy
INSERT INTO DonDatHang VALUES('DDH01', '02/12/2018', 'NCC02')
INSERT INTO DonDatHang VALUES('DDH02', '11/02/2018', 'NCC03')
INSERT INTO DonDatHang VALUES('DDH03', '12/12/2018', 'NCC05')
INSERT INTO DonDatHang VALUES('DDH04', '22/11/2018', 'NCC02')
INSERT INTO DonDatHang VALUES('DDH05', '06/12/2018', 'NCC01')
UPDATE DonDatHang SET NgayDat = '25/06/2018' WHERE MaDDH = 'DDH03'
UPDATE DonDatHang SET NgayDat = '11/05/2017' WHERE MaDDH = 'DDH05'
SELECT * FROM DonDatHang
--In ra tháng và năm đặt hàng--
SELECT MONTH(NgayDat) [Tháng], YEAR(NgayDat) [Năm] FROM DonDatHang
--In ra Ngày Đặt theo định dạng dd/mm/yyyy (103)--
SELECT CONVERT([varchar], NgayDat, 103) from DonDatHang

INSERT INTO ChiTietDonHang VALUES('CTDDH01', 'DDH02', 'VT02', 150)
INSERT INTO ChiTietDonHang VALUES('CTDDH02', 'DDH02', 'VT01', 90)
INSERT INTO ChiTietDonHang VALUES('CTDDH03', 'DDH03', 'VT04', 90)
INSERT INTO ChiTietDonHang VALUES('CTDDH04', 'DDH05', 'VT05', 270)
INSERT INTO ChiTietDonHang VALUES('CTDDH05', 'DDH01', 'VT02', 90)
SELECT * FROM ChiTietDonHang

SET DATEFORMAT DMY
INSERT INTO PhieuNhapHang VALUES('PN01', '12/12/2017', 'DDH03')
INSERT INTO PhieuNhapHang VALUES('PN02', '02/11/2017', 'DDH04')
INSERT INTO PhieuNhapHang VALUES('PN03', '18/05/2017', 'DDH03')
INSERT INTO PhieuNhapHang VALUES('PN04', '16/02/2017', 'DDH01')
INSERT INTO PhieuNhapHang VALUES('PN05', '22/12/2017', 'DDH02')
SELECT * FROM PhieuNhapHang
SELECT CONVERT([varchar], NgayNhap, 103) FROM PhieuNhapHang

INSERT INTO ChiTietPhieuNhap VALUES('CTPN01', 'PN03', 'VT05', 193, 200000)
INSERT INTO ChiTietPhieuNhap VALUES('CTPN02', 'PN02', 'VT01', 123, 300000)
INSERT INTO ChiTietPhieuNhap VALUES('CTPN03', 'PN05', 'VT02', 23, 240000)
INSERT INTO ChiTietPhieuNhap VALUES('CTPN04', 'PN01', 'VT04', 131, 205000)
INSERT INTO ChiTietPhieuNhap VALUES('CTPN05', 'PN02', 'VT03', 113, 200000)
SELECT * FROM ChiTietPhieuNhap

INSERT INTO PhieuXuatHang VALUES('PX01', '22/02/2018', N'Khách hàng 01')
INSERT INTO PhieuXuatHang VALUES('PX02', '12/05/2018', N'Khách hàng 03')
INSERT INTO PhieuXuatHang VALUES('PX03', '19/02/2018', N'Khách hàng 02')
INSERT INTO PhieuXuatHang VALUES('PX04', '18/07/2018', N'Khách hàng 05')
INSERT INTO PhieuXuatHang VALUES('PX05', '21/03/2018', N'Khách hàng 03')
SELECT * FROM PhieuXuatHang

INSERT INTO ChiTietPhieuXuat VALUES('CTPX01', 'PX03', 'VT02', 70, 200000)
INSERT INTO ChiTietPhieuXuat VALUES('CTPX02', 'PX04', 'VT01', 27, 200000)
INSERT INTO ChiTietPhieuXuat VALUES('CTPX03', 'PX01', 'VT03', 22, 200000)
INSERT INTO ChiTietPhieuXuat VALUES('CTPX04', 'PX03', 'VT05', 12, 200000)
INSERT INTO ChiTietPhieuXuat VALUES('CTPX05', 'PX02', 'VT05', 32, 200000)
SELECT * FROM ChiTietPhieuXuat

--Lấy ra danh sách những đơn đặt hàng từ tháng 1/2018 đến tháng 6/2018--
--Cách 1--
SELECT * FROM DonDatHang
WHERE (Month(NgayDat) BETWEEN 1 AND 6) AND YEAR(NgayDat) = 2018
-- Cách 2--
SELECT * FROM DonDatHang
WHERE MONTH(NgayDat) >= 1 AND MONTH(NgayDat) <=6 AND YEAR(NgayDat) = 2018
--Lấy ra danh sách những đơn đặt hàng từ 1/1/2018 đến 1/6/2018--
SELECT * FROM DonDatHang
WHERE NgayDat BETWEEN '1/1/2018' AND '1/6/2018'

--Thống kê số lượng mặt hàng mà công ty đã đặt theo nhà cung cấp--
SELECT ncc.TenNCC [Tên nhà cung cấp], SUM(SoLuong) [Số lượng hàng đặt hàng]
FROM (NhaCungCap ncc INNER JOIN DonDatHang ddh ON ncc.MaNCC = ddh.MaNCC)
    INNER JOIN ChiTietDonHang ctdh ON ddh.MaDDH = ctdh.MaDDH
GROUP BY ncc.TenNCC

--Thống kê số lượng mặt hàng thực tế mà công ty đã nhập theo nhà cung cấp--
SELECT ncc.TenNCC [Tên nhà cung cấp], SUM(SoLuongNhap) [Số lượng hàng đã nhập]
FROM (NhaCungCap ncc INNER JOIN DonDatHang ddh ON ncc.MaNCC = ddh.MaNCC)
    INNER JOIN PhieuNhapHang pnh on pnh.MaDDH = ddh.MaDDH
    INNER JOIN ChiTietPhieuNhap ctpn on ctpn.MaSoPhieuNhap = pnh.MaSoPhieuNhap
GROUP BY ncc.TenNCC

--Thống kê số lượng vật tư đã xuất theo từng mã vật tư--
SELECT TenVatTu, SUM(SoLuongXuat) [Số lượng xuất]
FROM VatTu INNER JOIN ChiTietPhieuXuat ctpx on ctpx.MaVatTu = VatTu.MaVatTu
GROUP BY TenVatTu
