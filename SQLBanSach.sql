use master
go
--Drop Database QLBansach
 
create database QLAOCUOI
GO
use QLAOCUOI 
go
--BẢNG KHÁCH HÀNG
CREATE TABLE KHACHHANG (
	  MaKH INT IDENTITY(1,1)		NOT NULL,  
	  HoTen nVarchar(50)			NOT NULL,  
	  Taikhoan Varchar(50) UNIQUE,  
	  Matkhau Varchar(50)			NOT NULL,  
	  Email Varchar(100) UNIQUE,  
	  DiachiKH nVarchar(200),  
	  DienthoaiKH Varchar(50),   
	  Ngaysinh DATETIME,  
	  CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH) 
) 
go
--BẢNG CHỦ ĐỀ
Create Table CHUDE (  
	MaCD int Identity(1,1),  
	TenChuDe nvarchar(50) NOT NULL,  
	CONSTRAINT PK_ChuDe PRIMARY KEY(MaCD) 
) 
go
--BẢNG NHÀ SẢN XUẤT
Create Table NHAXUATBAN (  
	MaNXB int identity(1,1),  
	TenNXB nvarchar(50) NOT NULL,  
	Diachi NVARCHAR(200),  
	DienThoai VARCHAR(50),  
	CONSTRAINT PK_NhaXuatBan PRIMARY KEY(MaNXB) 
) 
go
--BẢNG SAN PHẨM
CREATE TABLE SACH (  
	Masach INT IDENTITY(1,1),  
	Tensach NVARCHAR(100) NOT NULL,  
	Giaban Decimal(18,0) CHECK (Giaban>=0),  
	Mota NVarchar(Max),  
	Anhbia VARCHAR(50),  
	Ngaycapnhat DATETIME,  
	Soluongton INT,  
	MaCD INT,  
	MaNXB INT,  
	Constraint PK_Sach Primary Key(Masach),  
	Constraint FK_Chude Foreign Key(MaCD) References CHUDE(MaCD),  
	Constraint FK_NhaXB Foreign Key(MaNXB)References  NHAXUATBAN(MANXB) 
) 
go

--BẢNG ĐƠN HÀNG
CREATE TABLE DONDATHANG (  
	MaDonHang INT IDENTITY(1,1),  
	Dathanhtoan bit,  
	Tinhtranggiaohang  bit,  
	Ngaydat Datetime,  
	Ngaygiao Datetime,   
	MaKH INT,  
	CONSTRAINT FK_Khachhang FOREIGN KEY (MaKH)  REFERENCES Khachhang(MaKH),  
	CONSTRAINT PK_DonDatHang PRIMARY KEY (MaDonHang) 
)
go
--BẢNG CHI TIẾT ĐƠN HÀNG 
CREATE TABLE CHITIETDONTHANG (  
	MaCTDH Int,
	MaDonHang INT,  
	Masach INT,  
	Soluong Int Check(Soluong>0),  
	Dongia Decimal(18,0) Check(Dongia>=0),   
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,Masach),  
	CONSTRAINT FK_Donhang FOREIGN KEY (MaDonHang)  REFERENCES Dondathang(MaDonHang),  
	CONSTRAINT FK_Sach FOREIGN KEY (Masach)  REFERENCES Sach(Masach)  
)
go
--NHẬP DỮ LIỆU CHO BẢNG CHỦ ĐỀ--
SET IDENTITY_INSERT CHUDE ON
go
INSERT INTO CHUDE(MaCD,TenChuDe) VALUES(1,N'ASYMMERTRIC')
INSERT INTO CHUDE(MaCD,TenChuDe) VALUES(2,N'HIGH NECK')
INSERT INTO CHUDE(MaCD,TenChuDe) VALUES(3,N'HALTER')
INSERT INTO CHUDE(MaCD,TenChuDe) VALUES(4,N'JEWEL')
SET IDENTITY_INSERT CHUDE OFF
go
--NHẬP DỮ LIỆU CHO BẢNG NHÀ SAN XUẤT--
SET IDENTITY_INSERT NHAXUATBAN ON
go
INSERT INTO NHAXUATBAN(MaNXB,TenNXB,Diachi,DienThoai) VALUES(1,N'SINL',N'356 An Phú Đông, Quận 12, Tp HCM','19006993')
INSERT INTO NHAXUATBAN(MaNXB,TenNXB,Diachi,DienThoai) VALUES(2,N'MY',N'356 An Phú Đông, Quận 12, Tp HCM','19001845')
INSERT INTO NHAXUATBAN(MaNXB,TenNXB,Diachi,DienThoai) VALUES(3,N'MARIE',N'356 An Phú Đông, Quận 12, Tp HCM','18006068')
SET IDENTITY_INSERT NHAXUATBAN OFF
go
--SACH--
SET IDENTITY_INSERT SACH ON
go
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(1,N'Áo Cổ Lệch','6000000',N'Thông tin sản phẩm:
Thiết kế phần vài cổ lệch hoặc chỉ có một dây chéo trên vai','imageSP1.jpg','',20,1,1)
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(2,N'Áo Cổ Cao','1850000',N'Thông tin sản phẩm:
Thiết kế đường viền cổ cao, ôm gọn lấy phần cổ tạo nên vẻ đẹp thanh thoát cho người mặc','imageSP2.jpg','',12,2,3)
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(3,N'Áo Hở Lưng','1700000',N'Thông tin sản phẩm:
Thiết kế phần vải buộc quanh cổ, chỉ để hở lưng và vai','imageSP3.jpg','',24,2,2)
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(4,N'Áo Cổ Tròn','850000',N'Thông tin sản phẩm:
Thiết kế đường viền tròn ở phần chân cổ, để thấy được vòng cổ hay xương quai xanh','imageSP4.jpg','',25,1,3)
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(5,N'Áo Cổ chữ U','6000000',N'Thông tin sản phẩm:
Thiết kế có đường viền cổ có dạng chữ U','imageSP5.jpg','',30,1,1)
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(6,N'Áo Cổ Vuông','18000000',N'Thông tin sản phẩm:
Thiết kế có đường viền cổ vuông, vạt áo thằng với quai hoặc tay áo tạo thành góc 90 độ','imageSP6.jpg','',26,3,2)
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(7,N'Áo Quay ngang','18000000',N'Thông tin sản phẩm:
 Loại không cổ, quay ngang được thiết kế và may khéo léo thành đường thẳng trên đường viền cổ áo.','imageSP7.jpg','',40,2,2)
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(8,N'Áo Trễ Vai','15000000',N'Thông tin sản phẩm:
Thiết kế không cổ trễ vai, tạo vẻ đẹp sexy quyến rũ.','imageSP8.jpg','',21,4,2)
INSERT INTO SACH(Masach,Tensach,Giaban,Mota,Anhbia,Ngaycapnhat,Soluongton,MaCD,MaNXB)
	VALUES(9,N'Áo Dáng Chữ A','15000000',N'Thông tin sản phẩm:
Dáng váy có phần thân trên vừa vặn, đường cắt eo trễ xuống và tầng váy xòe (fit-and-flare). Váy cưới chữ A hiện đại đi theo xu hướng tối giản, hạn chế chi tiết rườm rà và ôm gọn vừa vẹn với cơ thể hơn là kiểu dáng chữ A cổ điển..','imageSP9.jpg','',21,4,2)
SET IDENTITY_INSERT SACH OFF
go
--NHẬP DỮ LIỆU KHÁCH HÀNG--
SET IDENTITY_INSERT KHACHHANG ON
go
INSERT INTO KHACHHANG(MaKH,HoTen,Taikhoan,Matkhau,Email,DiachiKH,DienthoaiKH,Ngaysinh) values (01,N'Trần Lê Minh Trung',N'tlmt',123,N'tlminhtrung1999@gmail.com',N'HCM',null,null)
INSERT INTO KHACHHANG(MaKH,HoTen,Taikhoan,Matkhau,Email,DiachiKH,DienthoaiKH,Ngaysinh) values (02,N'Võ Quốc Tấn',N'vqt',N'vqTan',N'tan0909@gmail.com',N'Hà Nội',null,null)
SET IDENTITY_INSERT KHACHHANG OFF
go
