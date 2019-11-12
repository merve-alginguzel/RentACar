USE [RentACar]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteReservation]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteReservation] 
(@ID int)
AS
BEGIN

UPDATE Reservation SET IsDelete=1 WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getBrandModel]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getBrandModel] 
(
@BrandID int
)
AS
BEGIN

select * from Model where BrandID=@BrandID

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getBrands]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getBrands] 

AS
BEGIN

select * from Brand where IsDelete = 0

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getByDateCar]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getByDateCar] 
(@StartDate  date,
@EndDate date)
AS
BEGIN

select C.ID,C.LicensePlate,C.ChassisNumber,C.Color,sum(R.Amount) as 'ToplamTutar' from Car C
Inner join Reservation R ON R.CarID=C.ID
where C.IsDelete=0 and R.Date>=@StartDate and R.EndDate<=@EndDate
group by C.ID,C.LicensePlate,C.ChassisNumber,C.Color

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getCar]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getCar] 

AS
BEGIN

select C.*, B.Name [BrandName],M.Name [ModelName] from Car C
Inner join Brand B ON B.ID=C.BrandID
Inner join Model M ON M.ID=B.ID
where C.IsDelete=0

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getCity]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getCity] 

AS
BEGIN

select * from City

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getCustomer]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getCustomer] 

AS
BEGIN

select * from Customer where IsDelete = 0

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getReservation]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getReservation] 

AS
BEGIN

select * from Reservation where IsDelete = 0

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getTown]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getTown] 
(
@CityID int
)
AS
BEGIN

select * from Town where CityID=@CityID

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCar]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertCar] 
(

@brand  nvarchar(200),
@model nvarchar(200),
@model_year nvarchar(200),
@LicensePlate nvarchar(200),
@ChassisNumber nvarchar(200),
@color nvarchar(200),
@type nvarchar(200),
@status nvarchar(50),
@amount nvarchar(200),
@amountType nvarchar(200)
)
AS
BEGIN
INSERT INTO Car
(BrandID, ModelID, ModelYear, LicensePlate, ChassisNumber, Color, Type, Amount, AmountType,Status, IsDelete)
VALUES
(@brand, @model,@model_year, @LicensePlate, @ChassisNumber, @color, @type, @amount, @amountType,@status, 0)


END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCustomer]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertCustomer] 
(
@Name  nvarchar(200),
@Surname nvarchar(200),
@Title nvarchar(200),
@Gender nvarchar(200),
@DateOfBirth date,
@TCNo nvarchar(11),
@TaxNo nvarchar(50),
@TaxAdministration nvarchar(200),
@City nvarchar(200),
@Town nvarchar(200),
@Address nvarchar(200),
@HomePhone nvarchar(50),
@BusinessPhone nvarchar(50),
@CepPhone nvarchar(50)
)
AS
BEGIN
INSERT INTO Customer
(Name, Surname, Title, Gender, DateOfBirth, TCNo, TaxNo, TaxAdministration, CityID,TownID,Address,HomePhone,BusinessPhone,CepPhone, IsDelete)
VALUES
(@Name, @Surname, @Title, @Gender, @DateOfBirth, @TCNo, @TaxNo, @TaxAdministration, @City,@Town,@Address,@HomePhone,@BusinessPhone,@CepPhone, 0)


END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertReservation]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertReservation] 
(
@Date  date,
@Day int,
@EndDate date,
@Amount int,
@Customer nvarchar(200),
@Car nvarchar(200)
)
AS
BEGIN
INSERT INTO Reservation
(Date, Day, EndDate, Amount, CustomerID, CarID, IsDelete)
VALUES
(@Date, @Day, @EndDate, @Amount, @Customer, @Car, 0)

UPDATE Car SET Status='Kiralanmış' WHERE ID=@Car

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Login] 
(
@Username nvarchar(50),
@Password nvarchar(50)
)
AS
BEGIN
select * from Users where UserName = @Username and Password = @Password and IsDelete = 'False'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_popCar]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_popCar] 

AS
BEGIN

select Top 10 B.Name [BrandName],M.Name [ModelName] , C.ID,C.Amount,C.Color,C.ChassisNumber,C.LicensePlate,C.ModelYear,C.Status,COUNT(*) AS Sayı from Car C
inner join Reservation R ON R.CarID=C.ID
Inner join Brand B ON B.ID=C.BrandID
Inner join Model M ON M.ID=B.ID
where R.IsDelete=0 and C.IsDelete=0
group by B.Name,M.Name,C.ID,C.Amount,C.Color,C.ChassisNumber,C.LicensePlate,C.ModelYear,C.Status
order by Sayı desc


END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReservationDetail]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ReservationDetail] 
(@ID int)
AS
BEGIN

select R.ID,R.Date,R.EndDate,R.Amount,Cus.Name as 'CustomerName',Cus.Surname as 'CustomerSurname',
Cus.CepPhone as 'CustomerPhone',C.LicensePlate,C.ChassisNumber,B.Name as 'BrandName'
 from Reservation R
inner join Customer Cus ON Cus.ID=R.CustomerID
inner join Car C ON C.ID=R.CarID
inner join Brand B ON B.ID = C.BrandID
where R.ID=@ID and R.IsDelete=0

END
GO
/****** Object:  StoredProcedure [dbo].[sp_StatusControl]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_StatusControl] 
(
@CarID int,
@StartDate  date,
@EndDate date)
AS
BEGIN

select C.ID,C.Status from Car C
Inner join Reservation R ON R.CarID=C.ID
where C.ID=@CarID and C.IsDelete=0 and R.Date>=@StartDate and R.EndDate<=@EndDate

END
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Car]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LicensePlate] [nvarchar](50) NULL,
	[ChassisNumber] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Amount] [int] NULL,
	[AmountType] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[BrandID] [int] NULL,
	[ModelID] [int] NULL,
	[ModelYear] [int] NULL,
	[Type] [nvarchar](100) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Surname] [nvarchar](200) NULL,
	[Title] [nvarchar](200) NULL,
	[Gender] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[TCNo] [nvarchar](11) NULL,
	[TaxNo] [nvarchar](50) NULL,
	[TaxAdministration] [nvarchar](200) NULL,
	[CityID] [int] NULL,
	[TownID] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[BusinessPhone] [nvarchar](50) NULL,
	[CepPhone] [nvarchar](50) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Model]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[BrandID] [int] NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Day] [int] NULL,
	[EndDate] [date] NULL,
	[Amount] [int] NULL,
	[CustomerID] [int] NULL,
	[CarID] [int] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.11.2019 02:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [Name], [IsDelete]) VALUES (1, N'Audi', 0)
INSERT [dbo].[Brand] ([ID], [Name], [IsDelete]) VALUES (2, N'BMW', 0)
INSERT [dbo].[Brand] ([ID], [Name], [IsDelete]) VALUES (3, N'Hyundai', 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([ID], [LicensePlate], [ChassisNumber], [Color], [Amount], [AmountType], [Status], [BrandID], [ModelID], [ModelYear], [Type], [IsDelete]) VALUES (6, N'25 AS 2154', N'12345678978', N'Siyah', 30000, N'TL', N'Uygun', 1, 2, 2020, N'Sedan', 0)
INSERT [dbo].[Car] ([ID], [LicensePlate], [ChassisNumber], [Color], [Amount], [AmountType], [Status], [BrandID], [ModelID], [ModelYear], [Type], [IsDelete]) VALUES (5, N'61 FE 1461', N'00571001461', N'Bordo', 1234, N'USD', N'Kiralanmış', 2, 6, 2014, N'Sedan', 0)
INSERT [dbo].[Car] ([ID], [LicensePlate], [ChassisNumber], [Color], [Amount], [AmountType], [Status], [BrandID], [ModelID], [ModelYear], [Type], [IsDelete]) VALUES (4, N'15 MR 1231', N'4564654654', N'Beyaz', 25000, N'EUR', N'Uygun', 3, 8, 2014, N'Sedan', 0)
INSERT [dbo].[Car] ([ID], [LicensePlate], [ChassisNumber], [Color], [Amount], [AmountType], [Status], [BrandID], [ModelID], [ModelYear], [Type], [IsDelete]) VALUES (3, N'01 AS 232132', N'4564654654', N'Beyaz', 50000, N'USD', N'Kiralanmış', 3, 10, 2015, N'Sedan', 0)
INSERT [dbo].[Car] ([ID], [LicensePlate], [ChassisNumber], [Color], [Amount], [AmountType], [Status], [BrandID], [ModelID], [ModelYear], [Type], [IsDelete]) VALUES (2, N'01 AS 232132', N'4564654654', N'Siyah', 30000, N'TL', N'Kiralanmış', 2, 6, 2017, N'Jip', 0)
INSERT [dbo].[Car] ([ID], [LicensePlate], [ChassisNumber], [Color], [Amount], [AmountType], [Status], [BrandID], [ModelID], [ModelYear], [Type], [IsDelete]) VALUES (1, N'34 CB 12456', N'12345464', N'Siyah', 20000, N'TL', N'Kiralanmış', 1, 2, 2017, N'Sedan', 0)
SET IDENTITY_INSERT [dbo].[Car] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [Name]) VALUES (1, N'İstanbul')
INSERT [dbo].[City] ([ID], [Name]) VALUES (2, N'Ankara')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Name], [Surname], [Title], [Gender], [DateOfBirth], [TCNo], [TaxNo], [TaxAdministration], [CityID], [TownID], [Address], [HomePhone], [BusinessPhone], [CepPhone], [IsDelete]) VALUES (3, N'Sevgi', N'Yıldız', N'Mühendis', N'Erkek', CAST(0x93190B00 AS Date), N'12321321231', N'6115651651', N'Esenler', 1, 3, N'Fatih Cad.', N'(555) 564-8987', N'(498) 149-8198', N'(516) 546-5416', 0)
INSERT [dbo].[Customer] ([ID], [Name], [Surname], [Title], [Gender], [DateOfBirth], [TCNo], [TaxNo], [TaxAdministration], [CityID], [TownID], [Address], [HomePhone], [BusinessPhone], [CepPhone], [IsDelete]) VALUES (2, N'Burcu', N'Günaydın', N'Doktor', N'Erkek', CAST(0x62400B00 AS Date), N'12315644', N'13212312', N'Başakşehir', 1, 2, N'Mah Sokak no:12', N'212 534 845 46', N'1321321', N'13211123', 0)
INSERT [dbo].[Customer] ([ID], [Name], [Surname], [Title], [Gender], [DateOfBirth], [TCNo], [TaxNo], [TaxAdministration], [CityID], [TownID], [Address], [HomePhone], [BusinessPhone], [CepPhone], [IsDelete]) VALUES (1, N'Merve', N'Algıngüzel', N'Müühendis', N'Kadın', CAST(0x5F400B00 AS Date), N'123156456', N'13213132', N'Arnavutköy', 1, 2, N'Mah Sokak no:12', N'212 534 845 46', N'1231 1231 231 ', N'1221 321 31 11', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Model] ON 

INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (1, N'S3 Sportback', 1)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (2, N'S3 Sedan', 1)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (3, N'A3 Cabrio', 1)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (4, N'RS 3 Limousine', 1)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (5, N'M6 Cabrio', 2)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (6, N'X6 M', 2)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (7, N'i8', 2)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (8, N'Galloper', 3)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (9, N'Kona', 3)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (10, N'Tucson', 3)
INSERT [dbo].[Model] ([ID], [Name], [BrandID]) VALUES (11, N'Santa Fe', 3)
SET IDENTITY_INSERT [dbo].[Model] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([ID], [Date], [Day], [EndDate], [Amount], [CustomerID], [CarID], [IsDelete]) VALUES (6, CAST(0x60400B00 AS Date), 15, CAST(0x6F400B00 AS Date), 600, 3, 5, 1)
INSERT [dbo].[Reservation] ([ID], [Date], [Day], [EndDate], [Amount], [CustomerID], [CarID], [IsDelete]) VALUES (5, CAST(0x60400B00 AS Date), 3, CAST(0x63400B00 AS Date), 7000, 3, 5, 1)
INSERT [dbo].[Reservation] ([ID], [Date], [Day], [EndDate], [Amount], [CustomerID], [CarID], [IsDelete]) VALUES (4, CAST(0x66400B00 AS Date), 3, CAST(0x69400B00 AS Date), 6000, 2, 1, 0)
INSERT [dbo].[Reservation] ([ID], [Date], [Day], [EndDate], [Amount], [CustomerID], [CarID], [IsDelete]) VALUES (3, CAST(0x59400B00 AS Date), 15, CAST(0x62400B00 AS Date), 3000, 1, 2, 0)
INSERT [dbo].[Reservation] ([ID], [Date], [Day], [EndDate], [Amount], [CustomerID], [CarID], [IsDelete]) VALUES (2, CAST(0x53400B00 AS Date), 2, CAST(0x55400B00 AS Date), 500, 1, 3, 0)
INSERT [dbo].[Reservation] ([ID], [Date], [Day], [EndDate], [Amount], [CustomerID], [CarID], [IsDelete]) VALUES (1, CAST(0x60400B00 AS Date), 20, CAST(0x68400B00 AS Date), 1000, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([ID], [Name], [CityID]) VALUES (1, N'Beşiktaş', 1)
INSERT [dbo].[Town] ([ID], [Name], [CityID]) VALUES (2, N'Kadıköy', 1)
INSERT [dbo].[Town] ([ID], [Name], [CityID]) VALUES (3, N'Eminönü', 1)
INSERT [dbo].[Town] ([ID], [Name], [CityID]) VALUES (4, N'Etimesgut', 2)
INSERT [dbo].[Town] ([ID], [Name], [CityID]) VALUES (5, N'Çankaya', 2)
INSERT [dbo].[Town] ([ID], [Name], [CityID]) VALUES (6, N'Keçiören', 2)
INSERT [dbo].[Town] ([ID], [Name], [CityID]) VALUES (7, N'Sincan', 2)
SET IDENTITY_INSERT [dbo].[Town] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Password], [IsDelete]) VALUES (1, N'Admin', N'admin', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [IsDelete]) VALUES (2, N'Merve', N'12345', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
