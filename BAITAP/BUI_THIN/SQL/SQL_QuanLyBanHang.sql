IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'QuanLyBanHang')
BEGIN
    CREATE DATABASE QuanLyBanHang
    ON PRIMARY
    (
        NAME = 'QuanLyBanHang',
        FILENAME = 'D:\PCA\CSDL SQL\QuanLyBanHang.mdf',
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
    MaDDH VARCHAR(10) NOT NULL,
    MaVatTu VARCHAR(10) NOT NULL,
    SoLuong int NOT NULL,
    CONSTRAINT PK_ChiTietDonDatHang PRIMARY KEY(MaDDH, MaVatTu),
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
    MaSoPhieuNhap VARCHAR(10) NOT NULL,
    MaVatTu VARCHAR(10) NOT NULL,
    SoLuongNhap int NOT NULL,
    DonGia INT not NULL,
    CONSTRAINT PK_ChiTietPhieuNhap PRIMARY KEY(MaSoPhieuNhap, MaVatTu),
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
INSERT INTO VatTu VALUES('VT01', N'Vật tư số 1', 'kg', '99')
INSERT INTO VatTu VALUES('VT02', N'Vật tư số 2', 'cái', '96')
INSERT INTO VatTu VALUES('VT03', N'Vật tư số 3', 'chiếc', '29')
INSERT INTO VatTu VALUES('VT04', N'Vật tư số 4', 'gói', '26')
INSERT INTO VatTu VALUES('VT05', N'Vật tư số 5', 'kg', '90')
INSERT INTO VatTu VALUES('VT06', N'Tê Tê', 'con', '66')
INSERT INTO VatTu VALUES('VT07', N'Tắc', 'quả', '120')
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

INSERT INTO ChiTietDonHang VALUES('DDH02', 'VT03', 150)
INSERT INTO ChiTietDonHang VALUES('DDH02', 'VT01', 190)
INSERT INTO ChiTietDonHang VALUES('DDH03', 'VT04', 90)
INSERT INTO ChiTietDonHang VALUES('DDH05', 'VT05', 270)
INSERT INTO ChiTietDonHang VALUES('DDH01', 'VT02', 780)
INSERT INTO ChiTietDonHang VALUES('DDH03', 'VT05', 900)
SELECT * FROM ChiTietDonHang

SET DATEFORMAT DMY
INSERT INTO PhieuNhapHang VALUES('PN01', '12/12/2017', 'DDH03')
INSERT INTO PhieuNhapHang VALUES('PN02', '02/11/2017', 'DDH04')
INSERT INTO PhieuNhapHang VALUES('PN03', '18/05/2017', 'DDH03')
INSERT INTO PhieuNhapHang VALUES('PN04', '16/02/2017', 'DDH01')
INSERT INTO PhieuNhapHang VALUES('PN05', '22/12/2017', 'DDH02')
SELECT * FROM PhieuNhapHang
SELECT CONVERT([varchar], NgayNhap, 103) FROM PhieuNhapHang

INSERT INTO ChiTietPhieuNhap VALUES('PN03', 'VT04', 193, 200000)
INSERT INTO ChiTietPhieuNhap VALUES('PN02', 'VT01', 123, 315000)
INSERT INTO ChiTietPhieuNhap VALUES('PN05', 'VT02', 23, 240000)
INSERT INTO ChiTietPhieuNhap VALUES('PN01', 'VT04', 131, 205000)
INSERT INTO ChiTietPhieuNhap VALUES('PN02', 'VT03', 113, 300000)
INSERT INTO ChiTietPhieuNhap VALUES('PN03', 'VT05', 623, 500000)
INSERT INTO ChiTietPhieuNhap VALUES('PN02', 'VT05', 269, 198000)
INSERT INTO ChiTietPhieuNhap VALUES('PN04', 'VT02', 99, 20000)
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
--Cách 1--20182018
SELECT * FROM DonDatHang
WHERE (Month(NgayDat) BETWEEN 1 AND 6) AND YEAR(NgayDat) = 2018
-- Cách 2--
SELECT * FROM DonDatHang
WHERE MONTH(NgayDat) >= 1 AND MONTH(NgayDat) <=6 AND YEAR(NgayDat) = 2018
--Lấy ra danh sách những đơn đặt hàng từ 1/1/2018 đến 1/6/2018--
SELECT * FROM DonDatHang
WHERE NgayDat BETWEEN '1/1/2018' AND '1/6/2018'

--Thống kê số lượng mặt hàng (số loại mặt hàng) mà công ty đã đặt theo nhà cung cấp muốn tìm kiếm--
SELECT ncc.TenNCC [Tên nhà cung cấp], COUNT(MaVatTu) [Số loại mặt hàng]
FROM (NhaCungCap ncc INNER JOIN DonDatHang ddh ON ncc.MaNCC = ddh.MaNCC)
    INNER JOIN ChiTietDonHang ctdh ON ddh.MaDDH = ctdh.MaDDH
    WHERE ncc.MaNCC = 'NCC03'
GROUP BY ncc.TenNCC

--Thống kê tổng số lượng hàng hóa (theo từng loại mặt hàng) thực tế mà công ty đã nhập theo nhà cung cấp--
SELECT ncc.TenNCC [Tên nhà cung cấp], SUM(SoLuongNhap) [Số lượng hàng đã nhập]
FROM (NhaCungCap ncc INNER JOIN DonDatHang ddh ON ncc.MaNCC = ddh.MaNCC)
    INNER JOIN PhieuNhapHang pnh on pnh.MaDDH = ddh.MaDDH
    INNER JOIN ChiTietPhieuNhap ctpn on ctpn.MaSoPhieuNhap = pnh.MaSoPhieuNhap
    -- WHERE ncc.MaNCC = 'NCC02'
GROUP BY ncc.TenNCC

--Thống kê tổng số lượng vật tư đã xuất theo từng mã vật tư--
SELECT TenVatTu, SUM(SoLuongXuat) [Số lượng xuất]
FROM VatTu INNER JOIN ChiTietPhieuXuat ctpx on ctpx.MaVatTu = VatTu.MaVatTu
GROUP BY TenVatTu


/*                                          */
/*           EX2 - 09/08/2018               */

--  Kiểm tra xem mặt hàng nào được đặt nhiều nhất  --
--Cách 1: Sắp xếp bảng dựa theo tổng số lượng giảm dần rồi lấy ra bản ghi đầu tiên--
SELECT TOP 1 VatTu.MaVatTu, TenVatTu, SUM(SoLuong)[Số lượng] 
FROM ChiTietDonHang INNER JOIN VatTu ON VatTu.MaVatTu = ChiTietDonHang.MaVatTu
GROUP BY VatTu.MaVatTu, TenVatTu
ORDER BY SUM(SoLuonG) DESC
/*Cách 2: Tạo ra 1 bảng tạm có tên là BangTam lưu trữ mã vật tư kèm tổng số lượng của vật tư đó.
Sau đó sử dụng hàm MAX để lấy ra giá trị 'tổng số lượng' lớn nhất*/
SELECT MAX(TongSoLuong)[Số lượng] from
(
SELECT MaVatTu, SUM(SoLuong) AS [TongSoLuong] from ChiTietDonHang
GROUP BY MaVatTu
) AS BangTam

--Tìm tất cả các mặt hàng bắt đầu bằng chữ T--
SELECT * FROM VatTu
WHERE TenVatTu Like 'T%'


--Thống kê các mặt hàng mà có tổng số lượng đặt hàng nhiều hơn 1000--
--Cách 1: Nhóm theo TênVậtTư rồi đếm tổng số lượng. Sau đó dùng Having để lọc kết quả--
SELECT TenVatTu, SUM(SoLuong)[Tổng số lượng]
FROM VatTu INNER JOIN ChiTietDonHang ON VatTu.MaVatTu = ChiTietDonHang.MaVatTu
GROUP BY TenVatTu
HAVING SUM(SoLuong) > 1000
--Cách 2: Tạo ra 1 bảng tạm để lưu tổng số lượng theo Mã vật tư. Sau đó dùng Where để lọc kết quả--
SELECT MaVatTu, BangTam.tong [Tổng số lượng]
FROM (
    SELECT MaVatTu, SUM(SoLuong) AS [tong] FROM ChiTietDonHang
    GROUP BY MaVatTu
) AS BangTam
WHERE tong > 1000


--Tìm tất cả các mặt hàng đã nhập về nhưng chưa xuất--
SELECT DISTINCT VatTu.MaVatTu, TenVatTu
FROM ChiTietPhieuNhap INNER JOIN VatTu on VatTu.MaVatTu = ChiTietPhieuNhap.MaVatTu
WHERE ChiTietPhieuNhap.MaVatTu NOT IN
(
    SELECT MaVatTu FROM ChiTietPhieuXuat
)


--Tìm tất cả các mặt hàng đã nhập về và đã xuất--
SELECT DISTINCT VatTu.MaVatTu, TenVatTu
FROM ChiTietPhieuNhap INNER JOIN VatTu on VatTu.MaVatTu = ChiTietPhieuNhap.MaVatTu
WHERE ChiTietPhieuNhap.MaVatTu IN
(
    SELECT MaVatTu FROM ChiTietPhieuXuat
)


                /*                                      */
                /*           EXP 10/08/2018             */
--Tạo bảng TonKho--
CREATE TABLE TonKho
(
    ID int PRIMARY key,
    NamThang VARCHAR(255) not null,
    MaVatTu VARCHAR(10) not null,
    SLDau int not null,
    TongSLNhap INT not null,
    TongSLXuat int not null,
    SLCuoi INT NOT NULL,
    CONSTRAINT FK_TonKho FOREIGN KEY(MaVatTu) REFERENCES VatTu(MaVatTu)
)
--Đặt điều kiện ràng buộc giá trị ngày tháng nhập vào lớn hơn 1/1/1999 và nhỏ hơn 31/12/2999--
    --Bước 1: Đổi kiểu dữ liệu cho trường NamThang về kiểu date--
    ALTER TABLE TonKho ALTER COLUMN NamThang date
    --Bước 2: Thiết lập ràng buộc nhập vào cho trường NamThang bằng ràng buộc CHECK--
    ALTER TABLE TonKho ADD CONSTRAINT chk_NamThang CHECK(NamThang > '01/01/1999' AND NamThang < '31/12/2999')
    --    ALTER TABLE TonKho DROP CONSTRAINT chk_NamThang
       set dateformat dmy
    INSERT INTO TonKho VALUES(1, '10/08/2018', 'VT03', 30, 30, 30, 0)
    INSERT INTO TonKho VALUES(2, '10/08/2018', 'VT03', 30, 40, 30, 0)
    INSERT INTO TonKho VALUES(3, '02/07/2017', 'VT02', 130, 50, 30, 0)
    UPDATE TonKho SET SLCuoi = SLDau + TongSLNhap - TongSLXuat
    select * from TonKho
--Đặt điều kiện ràng buộc giá trị nhập vào cho các trường số lượng lớn hơn 0--
    ALTER TABLE TonKho ADD CONSTRAINT chk_SL CHECK(SLDau >= 0 AND TongSLNhap >= 0 AND TongSLXuat >= 0 AND SLCuoi >= 0)  
    ALTER TABLE TonKho DROP CONSTRAINT chk_SL
--Truy vấn danh sách các phiếu đặt hàng nhưng chưa được nhập hàng--
SELECT * FROM DonDatHang
WHERE MaDDH NOT IN
(
    SELECT MaDDH FROM PhieuNhapHang
)
--Lấy thông tin nhà cung cấp có nhiều đơn đặt hàng nhất--
SELECT TOP 1 NhaCungCap.MaNCC, TenNCC, DiaChi, COUNT(MaDDH) [Số lượng đơn đặt hàng]
FROM NhaCungCap INNER JOIN DonDatHang ON NhaCungCap.MaNCC = DonDatHang.MaNCC
GROUP BY NhaCungCap.MaNCC, TenNCC, DiaChi
ORDER BY COUNT(MaDDH) DESC
--Lấy thông tin vật tư được xuất bán nhiều nhất--
SELECT TOP 10 VatTu.MaVatTu, TenVatTu, SUM(SoLuongXuat)[Tổng số lượng xuất]
FROM VatTu INNER JOIN ChiTietPhieuXuat ON VatTu.MaVatTu = ChiTietPhieuXuat.MaVatTu
GROUP BY VatTu.MaVatTu, TenVatTu
ORDER BY SUM(SoLuongXuat) DESC
--Tính tổng tiền của các đơn đặt hàng, đưa ra đơn đặt hàng có giá trị lớn nhất--
SELECT TOP 10 MaDDH, SUM(SoLuongNhap*DonGia) [Tổng tiền]
FROM ChiTietPhieuNhap INNER JOIN ChiTietDonHang ON ChiTietDonHang.MaVatTu = ChiTietPhieuNhap.MaVatTu
GROUP BY MaDDH
ORDER BY SUM(SoLuongNhap*DonGia) DESC

SELECT TOP 1 MaDDH from ChiTietDonHang
WHERE MaVatTu IN
(
    select TOP 1 MaVatTu from ChiTietPhieuNhap
    GROUP by MaVatTu
    ORDER by SUM(SoLuongNhap*DonGia) DESC
)

--Thống kê những đơn đặt hàng chưa đủ số lượng--
SELECT DISTINCT MaDDH, ChiTietDonHang.MaVatTu, (SoLuong) [Số lượng hàng đặt], (SoLuongNhap) [Số lượng hàng nhập về]
FROM ChiTietDonHang INNER JOIN ChiTietPhieuNhap ON ChiTietDonHang.MaVatTu = ChiTietPhieuNhap.MaVatTu
WHERE SoLuong >= SoLuongNhap
-- GROUP BY MaDDH, ChiTietDonHang.MaVatTu, SoLuong, SoLuongNhap
