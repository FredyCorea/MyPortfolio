--*************************************
--* TABLES AND OTHER OBJECTS CREATION *
--*************************************
USE [master]
GO

/****** Object:  Database [ServicesOnLine1]    Script Date: 4/1/2021 12:26:45 AM ******/
DROP DATABASE [ServicesOnLine1]
GO

/****** Object:  Database [ServicesOnLine1]    Script Date: 4/1/2021 12:26:45 AM ******/
CREATE DATABASE [ServicesOnLine1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ServicesOnLine1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ServicesOnLine1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ServicesOnLine1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ServicesOnLine1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ServicesOnLine1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ServicesOnLine1] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET ARITHABORT OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ServicesOnLine1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ServicesOnLine1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ServicesOnLine1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ServicesOnLine1] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [ServicesOnLine1] SET  MULTI_USER 
GO

ALTER DATABASE [ServicesOnLine1] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ServicesOnLine1] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ServicesOnLine1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ServicesOnLine1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [ServicesOnLine1] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ServicesOnLine1] SET QUERY_STORE = OFF
GO

ALTER DATABASE [ServicesOnLine1] SET  READ_WRITE 
GO


USE [ServicesOnLine1]



---------------------
--GeoNations
--===================
DROP table GeoNations

CREATE TABLE GeoNations(
NationID int PRIMARY KEY NOT NULL IDENTITY(1,1),
ISOCode varchar(2),
NationName varchar(50)
)

INSERT INTO GeoNations (ISOCode, NationName)
VALUES
('US','United States'),
('MX','Mexico' ),
('HN','Honduras' );
GO

SELECT * from GeoNations;

-------------------
--GeoCity
--=================
DROP table GeoCity;

CREATE TABLE GeoCity(
CityId int PRIMARY KEY NOT NULL IDENTITY(1,1),
IATACode varchar(3),
CityName varchar(25),
NationID int
)

ALTER TABLE GeoCity
ADD CONSTRAINT [FK_NationId]
FOREIGN KEY (NationID)
REFERENCES GeoNations (NationID);

INSERT INTO GeoCity (IATACode,CityName, NationID)
VALUES 
( 'JNU',  'Juneau, Alaska',1  ),
( 'SFO',  'San Francisco, California' ,1 ),
( 'SEA',  'Seattle, Washington',1),
( 'SGY',  'Skagway, Alaska',1),
( 'SIT',  'Sitka, Alaska',1 ),
( 'CZM',  'Cozumel, M?xico' ,2 ),
( 'CUN',  'Costa Maya, M?xico',2 ),
( 'RTB',  'Roat?n, Honduras' ,3 );

----------------------
--GeoRegions;
--====================
DROP TABLE GeoRegions;

CREATE TABLE GeoRegions( 
RegionId int PRIMARY KEY NOT NULL IDENTITY(1,1),
RegionName varchar(20)
)

INSERT INTO GeoRegions(RegionName)
values
('Caribbean'),
('North America'),
('South America'),
('North Europe'),
('Mediterranean');

SELECT * FROM GeoRegions;

--======
--States
--======
DROP TABLE States;
CREATE TABLE States(
	StateId int PRIMARY KEY NOT NULL IDENTITY(1,1),
	StateName varchar(50) NULL,
	StateCode varchar(50) NULL,
)
GO

INSERT INTO States(
           StateName,StateCode)
     VALUES
           ('California','CA'),
           ('Washington','WA');
GO

--EntityType
DROP TABLE EntityType;

CREATE TABLE EntityType(
	EntityTypeId int IDENTITY(1,1) NOT NULL,
	Name varchar(50) NOT NULL
 )

INSERT INTO EntityType
           (Name)
     VALUES
			('Cruise Ship'),
			('Hotel'),
			('Financial'),
			('Legal'),
			('Person')

GO



**

DROP TABLE Entity;
CREATE TABLE [dbo].[Entity](
	[EntityId] [int] PRIMARY KEY NOT NULL  IDENTITY(1,1) ,
	[PersonId] [int] NULL,
	[PropertyId] [int] NULL,
	[LocationId] [int] NULL)

--ALTER TABLE [dbo].[Entity]  
--WITH CHECK ADD  CONSTRAINT [FK_LocationId_Locations] 
--FOREIGN KEY([LocationId])
--REFERENCES [dbo].[Locations] ([LocationId])
--GO

--ALTER TABLE [dbo].[Entity] 
--CHECK CONSTRAINT [FK_LocationId_Locations]
--GO


INSERT INTO [dbo].[Entity]
           ([PersonId]
           ,[PropertyId]
           ,[LocationId])
     VALUES
		(1,	NULL	,NULL),
		(2,	NULL,	NULL),
		(NULL	,NULL,	2),
		(NULL	,NULL	,3),
		(NULL,	NULL	,4),
		(NULL	,NULL,	5),
		(NULL,	NULL,	6),
		(NULL,	NULL,	6),
		(4,	NULL,	NULL),
		(5	,NULL	,NULL),
		(6	,NULL,	NULL),
		(7,	NULL	,NULL),
		(8	,NULL,	NULL),
		(9	,NULL,	NULL),
		(10	,NULL	,NULL),
		(11	,NULL,	NULL),
		(12,	NULL,	NULL),
		(NULL,	NULL,	1),
		(18	,NULL	,NULL);

GO


DROP TABLE ContactType;
CREATE TABLE ContactType(
	ContactTypeId   int        PRIMARY KEY NOT NULL IDENTITY(1,1),
	ContactTypeName varchar(20) NULL,
)

INSERT INTO ContactType
           (ContactTypeName)
     VALUES
		('Home Address'),
		('Home Address'),
		('Business Address'),
		('Postal Address'),
		('Home Phone'),
		('Portable Phone'),
		('Email Address'),
		('Site Url');
GO


DROP TABLE [Addresses]
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[StateId] [int] NULL,
	[County] [varchar](20) NULL,
	[NationId] [int] NULL,
	[ZipCode] [varchar](50) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [fk_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([StateId])
GO

ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [fk_StateId]
GO


INSERT INTO [dbo].[Addresses]
           ([Address1]
           ,[Address2]
           ,[City]
           ,[StateId]
           ,[County]
           ,[NationId]
           ,[ZipCode])
     VALUES
('1970 Napa Ct.'	,		NULL,	'Bothell',	2,		NULL,	1,	98011),
('9833 Mt. Dias Blv.'	,	NULL,	'Bothell',	2,		NULL,	1,	98011),
('6657 Sand Pointe Lane',	NULL,	'Seattle',	2,		NULL,	1,	98104),
('80 Sunview Terrace'	,	NULL,	'Duluth',		1,		NULL,	1,	55802),
('No address'	,			NULL,	NULL	,	NULL,	NULL,	NULL	,NULL);
GO


DROP TABLE [ContactMechanisms];
CREATE TABLE [dbo].[ContactMechanisms](
	[ContMechID] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[ValidUntil] [date] NULL,
	[ContactTypeId] [int] NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](25) NULL,
	[SiteUrl] [varchar](50) NULL,
	[IsPrimary] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ContactMechanisms] ADD  CONSTRAINT [DF_EntityAddress_ValidUntil]  DEFAULT (dateadd(year,(20),getdate())) FOR [ValidUntil]
GO

ALTER TABLE [dbo].[ContactMechanisms]  WITH CHECK ADD  CONSTRAINT [FK_ContactTypeId] FOREIGN KEY([ContactTypeId])
REFERENCES [dbo].[ContactType] ([ContactTypeId])
GO

ALTER TABLE [dbo].[ContactMechanisms] CHECK CONSTRAINT [FK_ContactTypeId]
GO

ALTER TABLE [dbo].[ContactMechanisms]  WITH CHECK ADD  CONSTRAINT [FK_EntityAddress_Entity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Entity] ([EntityId])
GO

ALTER TABLE [dbo].[ContactMechanisms] CHECK CONSTRAINT [FK_EntityAddress_Entity]
GO

ALTER TABLE [dbo].[ContactMechanisms] 
WITH CHECK ADD  CONSTRAINT [FK_EntityAddress_EntityAddress] 
FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO

ALTER TABLE [dbo].[ContactMechanisms] 
CHECK CONSTRAINT [FK_EntityAddress_EntityAddress]
GO

INSERT INTO [dbo].[ContactMechanisms]
           ([EntityId]
           ,[AddressId]
           ,[ValidUntil]
           ,[ContactTypeId]
           ,[Phone]
           ,[Email]
           ,[SiteUrl]
           ,[IsPrimary])
     VALUES
			(1,	1,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(2,	2,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(3,	5,	NULL,	3,		NULL,	NULL,	NULL,	NULL),
			(4,	3,	NULL,	3,		NULL,	NULL,	NULL,	NULL),
			(5,	1,	NULL,	3,		NULL,	NULL,	NULL,	NULL),
			(6,	4,	NULL,	3,		NULL,	NULL,	NULL,	NULL),
			(7,	1,	NULL,	3,		NULL,	NULL,	NULL,	NULL),
			(8,	3,	NULL,	3,		NULL,	NULL,	NULL,	NULL),
			(9,	1,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(10,1,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(11,1,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(12,2,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(13,3,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(14,4,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(15,5,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
			(16,2,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(17,3,	NULL,	1,		NULL,	NULL,	NULL,	NULL),
			(1,	5,	NULL,	6,	'786 473 9999',	NULL,	NULL,	NULL),
			(1,	5,	NULL,	5,	'305 993 4455',	NULL,	NULL,	NULL),
			(1,	5,	NULL,	6,	'305 999 6666',	NULL,	NULL,	NULL),
			(4,	5,	NULL,	6,	'786 473 9999',	NULL,	NULL,	NULL),
			(1,	5,	NULL,	7,	NULL,			'name@progess.com',	NULL,	NULL),
			(3,	5,	NULL,	7,	NULL,			'name@success.com',	NULL,	NULL)
GO



--Locations type
--==============
DROP TABLE LocationsType;
CREATE TABLE LocationsType(
	LocTypeId int PRIMARY KEY NOT NULL IDENTITY(1,1),
	LocTypeName varchar(50) NULL
	)

GO

--Locations Types Data
--=======================
INSERT INTO LocationsType
           (LocTypeName)
     VALUES
          ('Cruise Ship'),
		  ('Cargo Ship'),
		  ('Hotel'),
		  ('Private Island')
GO

--Locations table
--===============
DROP TABLE Locations;

CREATE TABLE Locations(
	LocationId int  PRIMARY KEY NOT NULL IDENTITY(1,1) ,
	LocationName varchar(50) NULL,
	LocationTypeId int NOT NULL
 )

GO

ALTER TABLE Locations
ADD  CONSTRAINT [DF_Locations_LocationType]  DEFAULT ((0)) 
FOR [LocationTypeId]
GO

ALTER TABLE Locations  
WITH CHECK ADD  CONSTRAINT [FK_Location_LocationType] 
FOREIGN KEY(LocationTypeId)
REFERENCES LocationsType (LocTypeId)
GO

INSERT INTO Locations
           (LocationName
           ,LocationTypeId)
     VALUES
        ('Orion',		1),
		('Cassiopeia',	1),
		('Perseus'	,	1),
		('Hercules',	2),
		('Ursa Major',	3),
		('Paradise',	4)
GO

--Roles
--=====
DROP TABLE Roles;

CREATE TABLE [dbo].[Roles](
	[RoleId] [int] PRIMARY KEY NOT NULL IDENTITY(1,1) ,
	[RoleName] [varchar](50) NULL
	) ON [PRIMARY]
GO

INSERT INTO [dbo].[Roles]
           ([RoleName])
     VALUES
			('Customer'),
			('Employee'),
			('VIP'),
			('Repeater'),
			('Golden Club Member'),
			('Travel Agent'),
			('Inspector');
GO



--================================================================================
--Persons, the seed satarst at 1000 to give 999 possible id for the Location table
--================================================================================
CREATE TABLE Persons(
	[PersonId] [int] IDENTITY(1000,1) NOT NULL,
	[PersonName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Persons] ADD  CONSTRAINT [DF_Persons_RoomId]  DEFAULT ((0)) FOR [RoomId]
GO


INSERT INTO [dbo].[Persons]
           ([PersonName]
           ,[LastName]
           ,[RoomId])
     VALUES
		('Peter','Smith',	1),
		('Paul','Smith',	1),
		('Wanda','Smith',	2),
		('Ken','Sanchez',	2),
		('Terri','Lee',	3),
		('Rob','Walters',	4),
		('Gail','Ericson',	4),
		('Jossef','Goldberg',	5),
		('Dylan','Miller',	6),
		('Michael','Raheem',	7),
		('Janice','Galvin',	7),
		('Sharon','Salavaria',	7),
		('Updated','Again',	290),
		('Test','FromAPI',	130),
		('Fredy','Corea',	130);

		GO




DROP TABLE [PersonsRoles];
CREATE TABLE [dbo].[PersonsRoles](
	[PersonRolesId] [int]  PRIMARY KEY NOT NULL IDENTITY(1,1) ,
	[PersonId] [int] NOT NULL,
	[RoleId] [int] NOT NULL)


ALTER TABLE [dbo].[PersonsRoles] 
ADD  CONSTRAINT [DF_PersonsRoles_RoleId]  
DEFAULT ((1)) FOR [RoleId]
GO

ALTER TABLE [dbo].[PersonsRoles]  
WITH CHECK ADD  CONSTRAINT [FK_PersonRoles_Person] 
FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO

ALTER TABLE [dbo].[PersonsRoles] 
CHECK CONSTRAINT [FK_PersonRoles_Person]
GO

ALTER TABLE [dbo].[PersonsRoles]  
WITH CHECK ADD  CONSTRAINT [FK_PersonRoles_Roles] 
FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO

ALTER TABLE [dbo].[PersonsRoles] 
CHECK CONSTRAINT [FK_PersonRoles_Roles]
GO


INSERT INTO [dbo].[PersonsRoles]
           ([PersonId]
           ,[RoleId])
     VALUES
			(1,	1),
			(2,	1),
			(3,	1),
			(4,	1),
			(5,	1),
			(6,	1),
			(7,	1),
			(8,	1),
			(9,	1),
			(10,	1),
			(11,	1),
			(12,	1),
			(1,	3),
			(2,	3);
GO


-------------
--TransactStates

DROP TABLE  TransactStates;

CREATE TABLE TransactStates(
StateId int PRIMARY KEY NOT NULL IDENTITY(1,1),
StateCode varchar(3),
StateName varchar(20)
)

INSERT INTO TransactStates(StateCode,StateName)
VALUES ('ACT', 'Active in cart'),
('DEL', 'Deleted from cart'),
('ORD', 'Ordered'),
('PRT', 'Printed from order'),
('SHP', 'Shipped'),
('DEL', 'Delivered'),
('CAN', 'Cancelled from order'),
('PP' , 'Payment Pending'),
('P'  , 'Paid'),
('CCA', 'Credit Card approved'),
('CCR', 'Credit Card rejected');


DROP TABLE UnitOfMeasures;
--========================
CREATE TABLE UnitOfMeasures(
UoMId int PRIMARY KEY NOT NULL IDENTITY(1,1),
UomName varchar(15)
)

INSERT INTO UnitOfMeasures(UomName)
VALUES ('each'),
('hrs'),
('kg'),
('lbs');


DROP TABLE ServicesType;
--=====================
CREATE TABLE ServicesType(
ServTypeId int PRIMARY KEY NOT NULL
IDENTITY(1,1),
ServTypeName varchar(20)
);

INSERT INTO [dbo].[ServicesType]
values ('Excursions'),
('Sport Events'),
('SPA');


DROP TABLE Services;
--==================
CREATE TABLE Services
(
ServicesId int PRIMARY KEY NOT NULL IDENTITY(1,1),
ServicesName varchar(50),
ServiceDescr varchar(400), 
Requirements varchar(200),
RegionId int,
ServTypeId int,
CityId int,
Duration int,
DurUomId int,
UnitOfMeasureId int,
MaxCapacity int
)

ALTER TABLE Services
ADD CONSTRAINT [FK_ReagionId]
FOREIGN KEY (RegionId)
REFERENCES GeoRegions (RegionId );

ALTER TABLE Services
ADD CONSTRAINT [FK_ServiceTypeId]
FOREIGN KEY (ServTypeId)
REFERENCES ServicesType (ServTypeId);

ALTER TABLE Services
ADD CONSTRAINT [FK_CityId]
FOREIGN KEY (CityId)
REFERENCES GeoCity (CityId);

ALTER TABLE Services
ADD CONSTRAINT [FK_DurUomId]
FOREIGN KEY (DurUomId )
REFERENCES UnitOfMeasures (UoMId );

ALTER TABLE Services
ADD CONSTRAINT [FK_UnitOfMeasureId]
FOREIGN KEY (UnitOfMeasureId )
REFERENCES UnitOfMeasures (UoMId );

INSERT INTO Services
(
ServicesName,ServiceDescr,Requirements,RegionId,ServTypeId,CityId,Duration,DurUomId,UnitOfMeasureId,MaxCapacity)
values('Whale Watching & Wildlife Quest',
'This sightseeing cruise features ... ',
'Warm clothes',2,1,1,4,2,1,50);

INSERT INTO Services
(
ServicesName,ServiceDescr,Requirements,RegionId,ServTypeId,CityId,Duration,DurUomId,UnitOfMeasureId,MaxCapacity)
values('Whale Watching & Wildlife Quest',
'This sightseeing cruise features ... ',
'Warm clothes',2,1,1,4,2,1,50);

INSERT INTO Services
(
ServicesName,ServiceDescr,Requirements,RegionId,ServTypeId,CityId,Duration,DurUomId,UnitOfMeasureId,MaxCapacity)
values('Whale Watching & Wildlife Quest',
'This sightseeing cruise features ... ',
'Warm clothes',2,1,1,4,2,1,50);

INSERT INTO Services
(
ServicesName,ServiceDescr,Requirements,RegionId,ServTypeId,CityId,Duration,DurUomId,UnitOfMeasureId,MaxCapacity)
values('Whale Watching & Wildlife Quest',
'This sightseeing cruise features ... ',
'Warm clothes',2,1,1,4,2,1,50);

INSERT INTO Services
(
ServicesName,ServiceDescr,Requirements,RegionId,ServTypeId,CityId,Duration,DurUomId,UnitOfMeasureId,MaxCapacity)
values('Whale Watching & Wildlife Quest',
'This sightseeing cruise features ... ',
'Warm clothes',2,1,1,4,2,1,50);
--select * from [dbo].[Services]

--select s.[ServicesiD],st.ServTypeName,s.ServicesName, s.ServiceDescr, s.Requirements,
--st.ServTypeName
--from services s
--join [dbo].ServicesType st
--on s.ServTypeId = st.ServTypeId



--------------
--ServiceMedia
--============
DROP TABLE ServiceMedia;

CREATE TABLE ServiceMedia(
ServiceMediaId int PRIMARY KEY NOT NULL IDENTITY(1,1),
ServiceId int,
MediaDescr varchar(20),
UrlPath varchar(50),
ValidFrom datetime,
ValidUntil datetime);

ALTER TABLE ServiceMedia
ADD CONSTRAINT [FK_ServiceId_for_media]
FOREIGN KEY (ServiceId)
REFERENCES Services (ServicesId);

INSERT INTO [dbo].[ServiceMedia]
           ([ServiceId]
           ,[MediaDescr]
           ,[UrlPath]
           ,[ValidFrom]
           ,[ValidUntil])
     VALUES
            (1,'Alaska Scenary', '../Images/Alaska1.jfif',NULL, NULL),
			(1,'Alaska Scenary','../Images/Alaska2.jfif',NULL, NULL),
			(1,'Alaska Scenary','../Images/Alaska3.jfif',NULL, NULL);
GO

--Product/Services availability
--ServiceSched
--=============================
DROP TABLE ServiceSched;   

CREATE TABLE ServiceSched(
ServiceSchedId int PRIMARY KEY NOT NULL IDENTITY(1,1),
ServiceId int,
FromDate datetime,
UntilDate datetime,
Capacity int
);

ALTER TABLE ServiceSched
ADD CONSTRAINT [FK_ServiceId_for_ServiceSched]
FOREIGN KEY (ServiceId)
REFERENCES Services (ServicesId);

INSERT INTO ServiceSched (ServiceId, FromDate, UntilDate, Capacity )
VALUES(1, getdate(), dateadd(month, 12, getdate()), 50 );

INSERT INTO ServiceSched (ServiceId, FromDate, UntilDate, Capacity )
VALUES(2, getdate(), dateadd(month, 12, getdate()), 50 );

INSERT INTO ServiceSched (ServiceId, FromDate, UntilDate, Capacity )
VALUES(3, getdate(), dateadd(month, 12, getdate()), 50 );

INSERT INTO ServiceSched (ServiceId, FromDate, UntilDate,Capacity )
VALUES(3, dateadd(month, 12, getdate()), dateadd(month, 18, getdate()), 50 )

INSERT INTO ServiceSched (ServiceId, FromDate, UntilDate,Capacity )
VALUES(4, getdate(), dateadd(month, 12, getdate()), 50 );

SELECT * FROM ServiceSched


--====================
DROP TABLE PriceList;
--====================
CREATE TABLE PriceList (
PriceListId int PRIMARY KEY NOT NULL IDENTITY(1,1),
ServiceId int NOT NULL,
ListName varchar(20) NOT NULL,
Price money NOT NULL,
ValidFrom datetime,
ValidUntil datetime
)

ALTER TABLE PriceList
ADD CONSTRAINT [DF_validUntilDate]
DEFAULT (dateadd(year,(20),getdate()))
FOR [validUntil]
GO

ALTER TABLE PriceList
ADD CONSTRAINT [FK_ServiceId]
FOREIGN KEY (ServiceId)
REFERENCES Services (ServicesId);

INSERT INTO PriceList(ServiceId,ListName,Price, ValidFrom,ValidUntil)
VALUES(1, 'Adult',50,   
dateadd(month,(3),getdate()), dateadd(month,(6), getdate()));

INSERT INTO PriceList(ServiceId,ListName,Price, ValidFrom,ValidUntil)
VALUES(1, 'Adult',40,   
dateadd(month,(3),getdate()), dateadd(month,(6), getdate()));

//SELECT * FROM PriceList;


--==========
--Marketing
--Promotions
--==========
DROP TABLE Promotions;

CREATE TABLE Promotions(
PromotionsId int PRIMARY KEY NOT NULL IDENTITY(1,1),
ServiceId int,
PromDescr varchar(50),
DaysBefore int,
SalesRatio int,
Discount int,
ValidFrom datetime,
ValidUntil datetime);

ALTER TABLE Promotions
ADD CONSTRAINT [FK_ServiceId_for_Promotions]
FOREIGN KEY (ServiceId)
REFERENCES [dbo].[Services]([ServicesId] );

INSERT INTO Promotions(ServiceId, PromDescr, DaysBefore, SalesRatio, Discount, ValidFrom, ValidUntil)
VALUES (1,'Rule 1', 1, 80, 20, getdate(), dateadd(month, 12, getdate() ));

INSERT INTO Promotions(ServiceId, PromDescr, DaysBefore, SalesRatio, Discount, ValidFrom, ValidUntil)
VALUES (1,'Rule 1', 2, 60, 10, getdate(), dateadd(month, 12, getdate() ));

INSERT INTO Promotions(ServiceId, PromDescr, DaysBefore, SalesRatio, Discount, ValidFrom, ValidUntil)
VALUES (1,'Rule 1', 3, 60, 20, getdate(), dateadd(month, 12, getdate() ));

SELECT * FROM Promotions;


		
DROP TABLE OrdersHeader;
CREATE TABLE OrdersHeader(
	OrdersHdrId int PRIMARY KEY NOT NULL IDENTITY(1,1),
	EntityId int, 
	OrderDate datetime,
	StateId integer, 
	Shipped datetime,
	Delivered datetime
)

ALTER TABLE OrdersHeader
ADD CONSTRAINT [FK_OrdersHeader_EntityId]
FOREIGN KEY (EntityId )
REFERENCES [dbo].[Entity](EntityId );

ALTER TABLE OrdersHeader
ADD CONSTRAINT [FK_OrdersHeader_StateId]
FOREIGN KEY (StateId )
REFERENCES [dbo].[TransactStates](StateId );

--Insert OrdersHeader data
INSERT INTO [dbo].[OrdersHeader]( [EntityId], [OrderDate], [StateId])
VALUES( 1, getdate(), 3 );

--Get Orders Header data
--SELECT  oh.[OrdersHdrId], oh.[EntityId],e.[PersonId],p.[PersonName],p.[LastName],
--oh.OrderDate, oh.StateId, st.StateCode, st.StateName,
--oh.Shipped,oh.Delivered
--FROM [OrdersHeader] oh
--JOIN Entity e on oh.[EntityId] = e.[EntityId]
--JOIN Persons p on e.PersonId = p.PersonId
--JOIN TransactStates st on st.StateId = oh.StateId

--Orders Details
DROP TABLE Orders;
CREATE TABLE Orders( 
	OrdersId int PRIMARY KEY NOT NULL IDENTITY(1,1),
	OrdersHdrId int,
	ServiceId int,
	StateId int,
	Shipped datetime,
	Delivered datetime
)

ALTER TABLE Orders
ADD CONSTRAINT [FK_OrdersHdrId_Orders ]
FOREIGN KEY (OrdersHdrId)
REFERENCES OrdersHeader( OrdersHdrId)

ALTER TABLE Orders
ADD CONSTRAINT [FK_ServiceId_Orders ]
FOREIGN KEY (ServiceId)
REFERENCES Services( ServicesId)

ALTER TABLE Orders
ADD CONSTRAINT [FK_Orders_StateId]
FOREIGN KEY (StateId )
REFERENCES TransactStates(StateId );

--Insert data into orders details
INSERT INTO Orders([OrdersHdrId],[ServiceId],[StateId])
     VALUES(1,1,3)
GO

----Get order details data
--SELECT [OrdersId],[OrdersHdrId],[ServiceId],s.[ServicesName], o.[StateId],
--[StateName],[Shipped],[Delivered]
--  FROM [dbo].[Orders] o
--  JOIN Services s on o.[ServiceId] = s.[ServicesId]
--  JOIN [dbo].[TransactStates] t on o.[StateId] = t.[StateId]
--GO



--Payments related
drop table PaymentHist;
CREATE TABLE PaymentHist (  
	PaymentsId int PRIMARY KEY NOT NULL IDENTITY(1,1),
	OrdersHdrId int,
	PaymentDate datetime,
	PaymntStateId int,
	Amount money
)

ALTER TABLE PaymentHist
ADD CONSTRAINT [OrdersHdrId_IN_PaymentHist]
FOREIGN KEY (OrdersHdrId)
REFERENCES OrdersHeader(OrdersHdrId);

ALTER TABLE PaymentHist
ADD CONSTRAINT [FK_PaymntStateId_PaymentHist]
FOREIGN KEY (PaymntStateId)
REFERENCES [dbo].[TransactStates]([StateId]);

--Insert data into PaymentHist
INSERT INTO  PaymentHist (OrdersHdrId, PaymentDate,  PaymntStateId, Amount)
VALUES ( 1, getdate(),  9, 150.00  );

----Get data from PaymentHist
--SELECT [PaymentsId],[OrdersHdrId],[PaymentDate],[PaymntStateId],t.[StateName],[Amount]
--  FROM [dbo].[PaymentHist] ph
--  JOIN [dbo].[TransactStates] t on ph.[PaymntStateId] = t.[StateId]
--GO 


--Credit card transactions
DROP TABLE CCTransactions;
CREATE TABLE CCTransactions(
	CCTransactId int PRIMARY KEY NOT NULl IDENTITY(1,1),
	OrdersHdrId int,
	CCResponse varchar(2),
	Amount money,
	ResponseDate datetime,
)

ALTER TABLE CCTransactions
ADD CONSTRAINT [FK_OrdersHdrId_CCTransactions]
FOREIGN KEY (OrdersHdrId)
REFERENCES OrdersHeader (OrdersHdrId);

--Insert data into the credit card transactions
INSERT INTO [dbo].[CCTransactions]
           ([OrdersHdrId]
           ,[CCResponse]
           ,[Amount]
           ,[ResponseDate])
     VALUES
           (1,'00',50.00,getdate())
GO

--Get data
--SELECT * FROM CCTransactions


--ShoppingCart
--============
DROP TABLE ShoppingCart;

CREATE TABLE ShoppingCart(
ShopCartId int PRIMARY KEY NOT NULL IDENTITY(1,1),
EntityId int,
ShopDate datetime,
ServiceId int,
Quantity int,
PriceListId int,
Discount money,
StateId int
)

ALTER TABLE ShoppingCart
ADD CONSTRAINT [FK_EntityId]
FOREIGN KEY (EntityId)
REFERENCES [dbo].[Entity] ([EntityId]);

ALTER TABLE ShoppingCart
ADD CONSTRAINT [FK_ServiceId_From_ShoppingCart]
FOREIGN KEY (ServiceId)
REFERENCES Services (ServicesId);

ALTER TABLE ShoppingCart
ADD CONSTRAINT [FK_PriceId_ShoppintCart]
FOREIGN KEY (PriceListId )
REFERENCES PriceList(PriceListId );

ALTER TABLE ShoppingCart
ADD CONSTRAINT [FK_ShoppintCart_StateId]
FOREIGN KEY (StateId )
REFERENCES TransactStates(StateId );

INSERT INTO ShoppingCart (EntityId ,ShopDate ,ServiceId ,Quantity ,PriceListId, Discount, StateId)
VALUES (1, getdate(), 1, 2, 1, 10,  1  );

INSERT INTO ShoppingCart (EntityId ,ShopDate ,ServiceId ,Quantity ,PriceListId, Discount, StateId)
VALUES (1, getdate(), 2, 2, 1, 10,  1  );

--SELECT  s.EntityId ,s.ShopDate ,s.ServiceId , sv.[ServicesName], s.Quantity ,
--s.PriceListId, pl.[ListName], pl.[Price],
--s.Discount, s.StateId, ts.StateCode, ts.[StateName]
--FROM ShoppingCart s
--JOIN dbo.Services sv ON s.ServiceId = sv.ServicesId
--JOIN PriceList pl ON s.PriceListId = pl.PriceListId
--JOIN [dbo].[TransactStates] ts ON s.StateId = ts.[StateId]



CREATE TABLE [dbo].[PropertyType](
	[PropertyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PropTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_PropertyType] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT INTO [dbo].[PropertyType]
           ([PropTypeName])
     VALUES
		    ('Cruise Ship'),
			('Cargo Ship'),
			('Hotel'),
			('Private Island'),
			('Financial'),
			('Legal'),
			('Goverment')

GO


CREATE TABLE [dbo].[Property](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [varchar](50) NULL,
	[PropertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Property] ADD  CONSTRAINT [DF_Property_PropertyType]  DEFAULT ((0)) FOR [PropertyTypeId]
GO

ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_PropertyType] FOREIGN KEY([PropertyTypeId])
REFERENCES [dbo].[PropertyType] ([PropertyTypeId])
GO

ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_PropertyType]
GO


--Create views
--============
USE [ServicesOnLine]
GO

/****** Object:  View [dbo].[vAddresses]    Script Date: 4/1/2021 3:45:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vAddresses]
as
(

SELECT [AddressId]
      ,[Address1]
      ,[Address2]
      ,[City]
      ,a.[StateId]
	  ,s.[StateCode],s.[StateName]
      ,[County]
      ,[NationId]
      ,[ZipCode]
  FROM [ServicesOnLine].[dbo].[Addresses] a
  join States s on a.[StateId] = s.[StateId]);
GO


USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAddressForAllEntities'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAddressForAllEntities'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAddressForAllEntities'
GO

/****** Object:  View [dbo].[vAddressForAllEntities]    Script Date: 4/1/2021 3:47:06 AM ******/
DROP VIEW [dbo].[vAddressForAllEntities]
GO

/****** Object:  View [dbo].[vAddressForAllEntities]    Script Date: 4/1/2021 3:47:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vAddressForAllEntities]
AS
SELECT        dbo.ContactMechanisms.ContMechID, dbo.ContactMechanisms.EntityId, dbo.ContactType.ContactTypeName, dbo.ContactMechanisms.ValidUntil, dbo.Addresses.Address1, dbo.Addresses.Address2, dbo.Addresses.City, 
                         dbo.States.StateCode, dbo.States.StateName, dbo.Addresses.County, dbo.Addresses.ZipCode
FROM            dbo.Entity INNER JOIN
                         dbo.ContactMechanisms INNER JOIN
                         dbo.ContactType ON dbo.ContactMechanisms.ContactTypeId = dbo.ContactType.ContactTypeId INNER JOIN
                         dbo.Addresses ON dbo.ContactMechanisms.AddressId = dbo.Addresses.AddressId INNER JOIN
                         dbo.States ON dbo.Addresses.StateId = dbo.States.StateId ON dbo.Entity.EntityId = dbo.ContactMechanisms.EntityId CROSS JOIN
                         dbo.Locations INNER JOIN
                         dbo.LocationsType ON dbo.Locations.LocationTypeId = dbo.LocationsType.LocTypeId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[69] 4[5] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ContactMechanisms"
            Begin Extent = 
               Top = 12
               Left = 304
               Bottom = 229
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ContactType"
            Begin Extent = 
               Top = 269
               Left = 642
               Bottom = 364
               Right = 830
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Addresses"
            Begin Extent = 
               Top = 36
               Left = 621
               Bottom = 234
               Right = 791
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "States"
            Begin Extent = 
               Top = 73
               Left = 997
               Bottom = 186
               Right = 1167
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LocationsType"
            Begin Extent = 
               Top = 266
               Left = 370
               Bottom = 362
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Locations"
            Begin Extent = 
               Top = 183
               Left = 69
               Bottom = 296
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Entity"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAddressForAllEntities'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2850
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAddressForAllEntities'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAddressForAllEntities'
GO



USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vContactMechanismForLocations'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vContactMechanismForLocations'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vContactMechanismForLocations'
GO

/****** Object:  View [dbo].[vContactMechanismForLocations]    Script Date: 4/1/2021 3:47:42 AM ******/
DROP VIEW [dbo].[vContactMechanismForLocations]
GO

/****** Object:  View [dbo].[vContactMechanismForLocations]    Script Date: 4/1/2021 3:47:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vContactMechanismForLocations]
AS
SELECT        dbo.Locations.LocationName, dbo.LocationsType.LocTypeName, dbo.ContactMechanisms.ContMechID, dbo.ContactType.ContactTypeName, dbo.Entity.EntityId, dbo.ContactMechanisms.AddressId, dbo.Addresses.Address1, 
                         dbo.Addresses.Address2, dbo.States.StateCode, dbo.States.StateName, dbo.Addresses.ZipCode, dbo.ContactMechanisms.ValidUntil, dbo.ContactMechanisms.Phone, dbo.ContactMechanisms.Email, 
                         dbo.ContactMechanisms.SiteUrl
FROM            dbo.ContactMechanisms INNER JOIN
                         dbo.Entity ON dbo.ContactMechanisms.EntityId = dbo.Entity.EntityId INNER JOIN
                         dbo.ContactType ON dbo.ContactMechanisms.ContactTypeId = dbo.ContactType.ContactTypeId INNER JOIN
                         dbo.Addresses ON dbo.ContactMechanisms.AddressId = dbo.Addresses.AddressId INNER JOIN
                         dbo.States ON dbo.Addresses.StateId = dbo.States.StateId RIGHT OUTER JOIN
                         dbo.LocationsType INNER JOIN
                         dbo.Locations ON dbo.LocationsType.LocTypeId = dbo.Locations.LocationTypeId ON dbo.Entity.LocationId = dbo.Locations.LocationId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[73] 4[5] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Entity"
            Begin Extent = 
               Top = 17
               Left = 259
               Bottom = 150
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Locations"
            Begin Extent = 
               Top = 27
               Left = 24
               Bottom = 140
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LocationsType"
            Begin Extent = 
               Top = 168
               Left = 228
               Bottom = 264
               Right = 398
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ContactMechanisms"
            Begin Extent = 
               Top = 27
               Left = 476
               Bottom = 244
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ContactType"
            Begin Extent = 
               Top = 237
               Left = 702
               Bottom = 333
               Right = 890
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Addresses"
            Begin Extent = 
               Top = 28
               Left = 747
               Bottom = 226
               Right = 917
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "States"
            Begin Extent = 
               Top = 6
               Left = 955
               Bottom = 119
               Right = 1125
            End
          ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vContactMechanismForLocations'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vContactMechanismForLocations'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vContactMechanismForLocations'
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntities'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntities'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntities'
GO

/****** Object:  View [dbo].[vEntities]    Script Date: 4/1/2021 3:48:05 AM ******/
DROP VIEW [dbo].[vEntities]
GO

/****** Object:  View [dbo].[vEntities]    Script Date: 4/1/2021 3:48:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vEntities]
AS
SELECT        e.EntityId, e.PersonId, pe.LastName, pe.PersonName, pe.RoomId, prl.RoleId, r.RoleName, e.PropertyId, e.LocationId, dbo.Locations.LocationName, dbo.LocationsType.LocTypeName
FROM            dbo.LocationsType INNER JOIN
                         dbo.Locations ON dbo.LocationsType.LocTypeId = dbo.Locations.LocationTypeId RIGHT OUTER JOIN
                         dbo.Entity AS e ON dbo.Locations.LocationId = e.LocationId LEFT OUTER JOIN
                         dbo.Persons AS pe ON pe.PersonId = e.PersonId LEFT OUTER JOIN
                         dbo.PersonsRoles AS prl ON pe.PersonId = prl.PersonId LEFT OUTER JOIN
                         dbo.Roles AS r ON prl.RoleId = r.RoleId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[0] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LocationsType"
            Begin Extent = 
               Top = 177
               Left = 571
               Bottom = 291
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Locations"
            Begin Extent = 
               Top = 149
               Left = 263
               Bottom = 262
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pe"
            Begin Extent = 
               Top = 6
               Left = 420
               Bottom = 136
               Right = 590
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "prl"
            Begin Extent = 
               Top = 25
               Left = 736
               Bottom = 138
               Right = 906
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 157
               Left = 941
               Bottom = 253
               Right = 1111
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntities'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntities'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntities'
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderHeader'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderHeader'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderHeader'
GO

/****** Object:  View [dbo].[vOrderHeader]    Script Date: 4/1/2021 3:48:37 AM ******/
DROP VIEW [dbo].[vOrderHeader]
GO

/****** Object:  View [dbo].[vOrderHeader]    Script Date: 4/1/2021 3:48:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vOrderHeader]
AS
SELECT        dbo.OrdersHeader.OrdersHdrId, dbo.Persons.PersonName, dbo.Persons.LastName, dbo.OrdersHeader.OrderDate, dbo.TransactStates.StateName, dbo.OrdersHeader.EntityId, dbo.Entity.PersonId
FROM            dbo.OrdersHeader INNER JOIN
                         dbo.Entity ON dbo.OrdersHeader.EntityId = dbo.Entity.EntityId INNER JOIN
                         dbo.Persons ON dbo.Entity.PersonId = dbo.Persons.PersonId INNER JOIN
                         dbo.TransactStates ON dbo.OrdersHeader.StateId = dbo.TransactStates.StateId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[58] 4[10] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrdersHeader"
            Begin Extent = 
               Top = 33
               Left = 31
               Bottom = 210
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Entity"
            Begin Extent = 
               Top = 35
               Left = 249
               Bottom = 165
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Persons"
            Begin Extent = 
               Top = 77
               Left = 458
               Bottom = 207
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactStates"
            Begin Extent = 
               Top = 185
               Left = 246
               Bottom = 298
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1395
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderHeader'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderHeader'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrderHeader'
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrders'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrders'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrders'
GO

/****** Object:  View [dbo].[vOrders]    Script Date: 4/1/2021 3:48:59 AM ******/
DROP VIEW [dbo].[vOrders]
GO

/****** Object:  View [dbo].[vOrders]    Script Date: 4/1/2021 3:48:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vOrders]
AS
SELECT        dbo.OrdersHeader.OrdersHdrId, dbo.OrdersHeader.EntityId, dbo.OrdersHeader.OrderDate, dbo.OrdersHeader.StateId, dbo.OrdersHeader.Shipped, dbo.OrdersHeader.Delivered
FROM            dbo.Services INNER JOIN
                         dbo.Orders ON dbo.Services.ServicesId = dbo.Orders.ServiceId RIGHT OUTER JOIN
                         dbo.OrdersHeader LEFT OUTER JOIN
                         dbo.CCTransactions ON dbo.OrdersHeader.OrdersHdrId = dbo.CCTransactions.OrdersHdrId ON dbo.Orders.OrdersHdrId = dbo.OrdersHeader.OrdersHdrId LEFT OUTER JOIN
                         dbo.PaymentHist ON dbo.OrdersHeader.OrdersHdrId = dbo.PaymentHist.OrdersHdrId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[8] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[80] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrdersHeader"
            Begin Extent = 
               Top = 34
               Left = 22
               Bottom = 206
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 119
               Left = 439
               Bottom = 285
               Right = 609
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CCTransactions"
            Begin Extent = 
               Top = 17
               Left = 636
               Bottom = 167
               Right = 806
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PaymentHist"
            Begin Extent = 
               Top = 211
               Left = 221
               Bottom = 341
               Right = 391
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Services"
            Begin Extent = 
               Top = 253
               Left = 676
               Bottom = 420
               Right = 855
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrders'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrders'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrders'
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrdersDetails'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrdersDetails'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrdersDetails'
GO

/****** Object:  View [dbo].[vOrdersDetails]    Script Date: 4/1/2021 3:49:23 AM ******/
DROP VIEW [dbo].[vOrdersDetails]
GO

/****** Object:  View [dbo].[vOrdersDetails]    Script Date: 4/1/2021 3:49:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vOrdersDetails]
AS
SELECT        dbo.Orders.OrdersId, dbo.OrdersHeader.OrderDate, dbo.Orders.Shipped, dbo.Orders.Delivered, dbo.Persons.PersonName, dbo.Persons.LastName, dbo.Services.ServicesName, dbo.Services.Requirements, 
                         dbo.Services.Duration
FROM            dbo.PaymentHist INNER JOIN
                         dbo.OrdersHeader ON dbo.PaymentHist.OrdersHdrId = dbo.OrdersHeader.OrdersHdrId INNER JOIN
                         dbo.TransactStates ON dbo.PaymentHist.PaymntStateId = dbo.TransactStates.StateId LEFT OUTER JOIN
                         dbo.Locations RIGHT OUTER JOIN
                         dbo.Entity INNER JOIN
                         dbo.ContactMechanisms ON dbo.Entity.EntityId = dbo.ContactMechanisms.EntityId LEFT OUTER JOIN
                         dbo.Addresses ON dbo.ContactMechanisms.AddressId = dbo.Addresses.AddressId ON dbo.Locations.LocationId = dbo.Entity.LocationId LEFT OUTER JOIN
                         dbo.Persons ON dbo.Entity.PersonId = dbo.Persons.PersonId ON dbo.OrdersHeader.EntityId = dbo.Entity.EntityId FULL OUTER JOIN
                         dbo.Services RIGHT OUTER JOIN
                         dbo.Orders ON dbo.Services.ServicesId = dbo.Orders.ServiceId ON dbo.OrdersHeader.OrdersHdrId = dbo.Orders.OrdersHdrId AND dbo.TransactStates.StateId = dbo.Orders.StateId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[65] 4[5] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[87] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 14
               Left = 38
               Bottom = 183
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrdersHeader"
            Begin Extent = 
               Top = 9
               Left = 314
               Bottom = 176
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Entity"
            Begin Extent = 
               Top = 15
               Left = 526
               Bottom = 142
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Persons"
            Begin Extent = 
               Top = 148
               Left = 799
               Bottom = 278
               Right = 969
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Services"
            Begin Extent = 
               Top = 248
               Left = 471
               Bottom = 378
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "TransactStates"
            Begin Extent = 
               Top = 307
               Left = 269
               Bottom = 420
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ContactMechanisms"
            Begin Extent = 
               Top = 9
               Left = 803
               Bottom = 139
               Right = 973
            End
            ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrdersDetails'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Addresses"
            Begin Extent = 
               Top = 197
               Left = 1037
               Bottom = 327
               Right = 1207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Locations"
            Begin Extent = 
               Top = 285
               Left = 797
               Bottom = 398
               Right = 967
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PaymentHist"
            Begin Extent = 
               Top = 256
               Left = 22
               Bottom = 408
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrdersDetails'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrdersDetails'
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonContactMechnaisms'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonContactMechnaisms'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonContactMechnaisms'
GO

/****** Object:  View [dbo].[vPersonContactMechnaisms]    Script Date: 4/1/2021 3:49:44 AM ******/
DROP VIEW [dbo].[vPersonContactMechnaisms]
GO

/****** Object:  View [dbo].[vPersonContactMechnaisms]    Script Date: 4/1/2021 3:49:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vPersonContactMechnaisms]
AS
SELECT        dbo.Persons.PersonId, dbo.Persons.PersonName, dbo.Persons.LastName, dbo.Persons.RoomId, dbo.Roles.RoleName, dbo.ContactType.ContactTypeName, dbo.Addresses.AddressId, dbo.Addresses.Address1, 
                         dbo.Addresses.Address2, dbo.Addresses.City, dbo.Addresses.StateId, dbo.Addresses.County, dbo.Addresses.NationId, dbo.Addresses.ZipCode, dbo.ContactMechanisms.ValidUntil, dbo.ContactMechanisms.Phone, 
                         dbo.ContactMechanisms.Email, dbo.ContactMechanisms.SiteUrl, dbo.ContactMechanisms.IsPrimary, dbo.States.StateCode, dbo.States.StateName
FROM            dbo.States INNER JOIN
                         dbo.Addresses ON dbo.States.StateId = dbo.Addresses.StateId RIGHT OUTER JOIN
                         dbo.PersonsRoles INNER JOIN
                         dbo.Persons ON dbo.PersonsRoles.PersonId = dbo.Persons.PersonId INNER JOIN
                         dbo.Roles ON dbo.PersonsRoles.RoleId = dbo.Roles.RoleId LEFT OUTER JOIN
                         dbo.ContactMechanisms INNER JOIN
                         dbo.Entity ON dbo.ContactMechanisms.EntityId = dbo.Entity.EntityId ON dbo.Persons.PersonId = dbo.Entity.PersonId LEFT OUTER JOIN
                         dbo.ContactType ON dbo.ContactMechanisms.ContactTypeId = dbo.ContactType.ContactTypeId ON dbo.Addresses.AddressId = dbo.ContactMechanisms.AddressId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[75] 4[5] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "States"
            Begin Extent = 
               Top = 113
               Left = 958
               Bottom = 226
               Right = 1128
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Addresses"
            Begin Extent = 
               Top = 9
               Left = 750
               Bottom = 139
               Right = 920
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "PersonsRoles"
            Begin Extent = 
               Top = 206
               Left = 237
               Bottom = 325
               Right = 407
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Persons"
            Begin Extent = 
               Top = 14
               Left = 17
               Bottom = 163
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Roles"
            Begin Extent = 
               Top = 267
               Left = 508
               Bottom = 363
               Right = 678
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ContactMechanisms"
            Begin Extent = 
               Top = 8
               Left = 457
               Bottom = 200
               Right = 680
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Entity"
            Begin Extent = 
               Top = 18
               Left = 243
               Bottom = 151
               Right = 413
            End
            Displa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonContactMechnaisms'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'yFlags = 280
            TopColumn = 0
         End
         Begin Table = "ContactType"
            Begin Extent = 
               Top = 251
               Left = 780
               Bottom = 347
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1605
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonContactMechnaisms'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonContactMechnaisms'
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonsRoles'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonsRoles'
GO

/****** Object:  View [dbo].[vPersonsRoles]    Script Date: 4/1/2021 3:50:06 AM ******/
DROP VIEW [dbo].[vPersonsRoles]
GO

/****** Object:  View [dbo].[vPersonsRoles]    Script Date: 4/1/2021 3:50:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vPersonsRoles]
AS
SELECT        p.PersonId, p.LastName, p.PersonName, r.RoleName
FROM            dbo.Roles AS r RIGHT OUTER JOIN
                         dbo.PersonsRoles AS pr ON r.RoleId = pr.RoleId RIGHT OUTER JOIN
                         dbo.Persons AS p ON pr.PersonId = p.PersonId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[22] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pr"
            Begin Extent = 
               Top = 14
               Left = 287
               Bottom = 127
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 97
               Left = 530
               Bottom = 193
               Right = 700
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonsRoles'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPersonsRoles'
GO




USE [ServicesOnLine]
GO

/****** Object:  View [dbo].[vProperties]    Script Date: 4/1/2021 3:50:32 AM ******/
DROP VIEW [dbo].[vProperties]
GO

/****** Object:  View [dbo].[vProperties]    Script Date: 4/1/2021 3:50:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[vProperties] as(
	SELECT p.[PropertyId],p.[PropertyName],p.[PropertyTypeId] ,pt.Name as PropertyType
	FROM [ServicesOnLine].[dbo].[Property] p
	JOIN [ServicesOnLine].[dbo].[PropertyType] pt
	ON p.PropertyTypeId = pt.PropertyTypeId);
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPropertiesContactMechanisms'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPropertiesContactMechanisms'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPropertiesContactMechanisms'
GO

/****** Object:  View [dbo].[vPropertiesContactMechanisms]    Script Date: 4/1/2021 3:50:55 AM ******/
DROP VIEW [dbo].[vPropertiesContactMechanisms]
GO

/****** Object:  View [dbo].[vPropertiesContactMechanisms]    Script Date: 4/1/2021 3:50:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vPropertiesContactMechanisms]
AS
SELECT        dbo.Property.PropertyId, dbo.Property.PropertyName, dbo.PropertyType.PropTypeName, dbo.ContactType.ContactTypeName, dbo.Addresses.Address1, dbo.Addresses.Address2, dbo.Addresses.City, dbo.Addresses.StateId, 
                         dbo.Addresses.County, dbo.Addresses.NationId, dbo.Addresses.ZipCode, dbo.ContactMechanisms.Phone, dbo.ContactMechanisms.Email, dbo.ContactMechanisms.SiteUrl, dbo.ContactMechanisms.IsPrimary, 
                         dbo.ContactMechanisms.ValidUntil, dbo.States.StateCode, dbo.States.StateName
FROM            dbo.States INNER JOIN
                         dbo.Addresses ON dbo.States.StateId = dbo.Addresses.StateId RIGHT OUTER JOIN
                         dbo.Entity INNER JOIN
                         dbo.PropertyType INNER JOIN
                         dbo.Property ON dbo.PropertyType.PropertyTypeId = dbo.Property.PropertyTypeId ON dbo.Entity.PropertyId = dbo.Property.PropertyId LEFT OUTER JOIN
                         dbo.ContactType RIGHT OUTER JOIN
                         dbo.ContactMechanisms ON dbo.ContactType.ContactTypeId = dbo.ContactMechanisms.ContactTypeId ON dbo.Entity.EntityId = dbo.ContactMechanisms.EntityId ON dbo.Addresses.AddressId = dbo.ContactMechanisms.AddressId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[75] 4[5] 2[1] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -321
      End
      Begin Tables = 
         Begin Table = "Entity"
            Begin Extent = 
               Top = 2
               Left = 272
               Bottom = 135
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "States"
            Begin Extent = 
               Top = 39
               Left = 1008
               Bottom = 152
               Right = 1178
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Addresses"
            Begin Extent = 
               Top = 1
               Left = 783
               Bottom = 187
               Right = 953
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ContactType"
            Begin Extent = 
               Top = 223
               Left = 781
               Bottom = 331
               Right = 969
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ContactMechanisms"
            Begin Extent = 
               Top = 15
               Left = 483
               Bottom = 234
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PropertyType"
            Begin Extent = 
               Top = 193
               Left = 250
               Bottom = 289
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Property"
            Begin Extent = 
               Top = 5
               Left = 24
               Bottom = 155
               Right = 193
            End
          ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPropertiesContactMechanisms'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPropertiesContactMechanisms'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPropertiesContactMechanisms'
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServiceFull'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServiceFull'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServiceFull'
GO

/****** Object:  View [dbo].[vServiceFull]    Script Date: 4/1/2021 3:51:15 AM ******/
DROP VIEW [dbo].[vServiceFull]
GO

/****** Object:  View [dbo].[vServiceFull]    Script Date: 4/1/2021 3:51:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vServiceFull]
AS
SELECT        dbo.Services.ServicesId, dbo.Services.ServicesName, dbo.Services.ServiceDescr, dbo.Services.Requirements, dbo.Services.RegionId, dbo.GeoRegions.RegionName, dbo.Services.ServTypeId, 
                         dbo.ServicesType.ServTypeName, dbo.Services.CityId, dbo.Services.MaxCapacity, dbo.GeoCity.CityName, dbo.Services.Duration, dbo.Services.DurUomId, UnitOfMeasuresDur.UomName, 
                         dbo.UnitOfMeasures.UomName AS Expr1
FROM            dbo.Services INNER JOIN
                         dbo.PriceList ON dbo.Services.ServicesId = dbo.PriceList.ServiceId INNER JOIN
                         dbo.Promotions ON dbo.Services.ServicesId = dbo.Promotions.ServiceId INNER JOIN
                         dbo.ServiceMedia ON dbo.Services.ServicesId = dbo.ServiceMedia.ServiceId INNER JOIN
                         dbo.ServiceSched ON dbo.Services.ServicesId = dbo.ServiceSched.ServiceId INNER JOIN
                         dbo.ShoppingCart ON dbo.Services.ServicesId = dbo.ShoppingCart.ServiceId AND dbo.PriceList.PriceListId = dbo.ShoppingCart.PriceListId LEFT OUTER JOIN
                         dbo.GeoCity ON dbo.Services.CityId = dbo.GeoCity.CityId LEFT OUTER JOIN
                         dbo.UnitOfMeasures ON dbo.Services.UnitOfMeasureId = dbo.UnitOfMeasures.UoMId LEFT OUTER JOIN
                         dbo.UnitOfMeasures AS UnitOfMeasuresDur ON dbo.Services.DurUomId = UnitOfMeasuresDur.UoMId LEFT OUTER JOIN
                         dbo.GeoRegions ON dbo.Services.RegionId = dbo.GeoRegions.RegionId LEFT OUTER JOIN
                         dbo.ServicesType ON dbo.Services.ServTypeId = dbo.ServicesType.ServTypeId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[63] 4[5] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 12
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Services"
            Begin Extent = 
               Top = 19
               Left = 0
               Bottom = 331
               Right = 179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GeoCity"
            Begin Extent = 
               Top = 17
               Left = 564
               Bottom = 147
               Right = 734
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UnitOfMeasures"
            Begin Extent = 
               Top = 23
               Left = 1053
               Bottom = 119
               Right = 1223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UnitOfMeasuresDur"
            Begin Extent = 
               Top = 26
               Left = 846
               Bottom = 122
               Right = 1016
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GeoRegions"
            Begin Extent = 
               Top = 124
               Left = 1116
               Bottom = 220
               Right = 1286
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServicesType"
            Begin Extent = 
               Top = 18
               Left = 322
               Bottom = 114
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PriceList"
            Begin Extent = 
               Top = 396
               Left = 751
               Bottom = 526
               Right = 921
            En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServiceFull'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Promotions"
            Begin Extent = 
               Top = 334
               Left = 472
               Bottom = 464
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServiceMedia"
            Begin Extent = 
               Top = 186
               Left = 908
               Bottom = 347
               Right = 1078
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServiceSched"
            Begin Extent = 
               Top = 188
               Left = 581
               Bottom = 342
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShoppingCart"
            Begin Extent = 
               Top = 336
               Left = 1114
               Bottom = 538
               Right = 1284
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServiceFull'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServiceFull'
GO




USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServices'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServices'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServices'
GO

/****** Object:  View [dbo].[vServices]    Script Date: 4/1/2021 3:51:34 AM ******/
DROP VIEW [dbo].[vServices]
GO

/****** Object:  View [dbo].[vServices]    Script Date: 4/1/2021 3:51:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vServices]
AS
SELECT        dbo.Services.ServicesId, dbo.Services.ServicesName, dbo.Services.ServiceDescr, dbo.Services.Requirements, dbo.Services.RegionId, dbo.GeoRegions.RegionName, dbo.Services.ServTypeId, 
                         dbo.ServicesType.ServTypeName, dbo.Services.CityId, dbo.Services.MaxCapacity, dbo.GeoCity.CityName, dbo.Services.Duration, dbo.Services.DurUomId, UnitOfMeasuresDur.UomName, 
                         dbo.UnitOfMeasures.UomName AS Expr1
FROM            dbo.Services LEFT OUTER JOIN
                         dbo.GeoCity ON dbo.Services.CityId = dbo.GeoCity.CityId LEFT OUTER JOIN
                         dbo.UnitOfMeasures ON dbo.Services.UnitOfMeasureId = dbo.UnitOfMeasures.UoMId LEFT OUTER JOIN
                         dbo.UnitOfMeasures AS UnitOfMeasuresDur ON dbo.Services.DurUomId = UnitOfMeasuresDur.UoMId LEFT OUTER JOIN
                         dbo.GeoRegions ON dbo.Services.RegionId = dbo.GeoRegions.RegionId LEFT OUTER JOIN
                         dbo.ServicesType ON dbo.Services.ServTypeId = dbo.ServicesType.ServTypeId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[68] 4[7] 2[5] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Services"
            Begin Extent = 
               Top = 17
               Left = 18
               Bottom = 269
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GeoCity"
            Begin Extent = 
               Top = 96
               Left = 708
               Bottom = 243
               Right = 878
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UnitOfMeasures"
            Begin Extent = 
               Top = 246
               Left = 280
               Bottom = 342
               Right = 458
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UnitOfMeasuresDur"
            Begin Extent = 
               Top = 174
               Left = 504
               Bottom = 270
               Right = 673
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GeoRegions"
            Begin Extent = 
               Top = 14
               Left = 267
               Bottom = 110
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServicesType"
            Begin Extent = 
               Top = 43
               Left = 520
               Bottom = 139
               Right = 690
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServices'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1080
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServices'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vServices'
GO


USE [ServicesOnLine]
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vShoppingCart'
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vShoppingCart'
GO



/****** Object:  View [dbo].[vShoppingCart]    Script Date: 4/1/2021 3:51:56 AM ******/
DROP VIEW [dbo].[vShoppingCart]
GO

/****** Object:  View [dbo].[vShoppingCart]    Script Date: 4/1/2021 3:51:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vShoppingCart]
AS
SELECT        TOP (100) PERCENT dbo.ShoppingCart.ShopCartId, dbo.Entity.EntityId, dbo.Entity.PersonId, dbo.Entity.LocationId, dbo.Services.ServicesName, dbo.ShoppingCart.PriceListId
FROM            dbo.ShoppingCart INNER JOIN
                         dbo.Services ON dbo.ShoppingCart.ServiceId = dbo.Services.ServicesId INNER JOIN
                         dbo.Entity ON dbo.ShoppingCart.EntityId = dbo.Entity.EntityId
ORDER BY dbo.Entity.PersonId, dbo.Entity.LocationId
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[14] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[15] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ShoppingCart"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 227
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Services"
            Begin Extent = 
               Top = 63
               Left = 622
               Bottom = 193
               Right = 801
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Entity"
            Begin Extent = 
               Top = 10
               Left = 314
               Bottom = 167
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3405
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vShoppingCart'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vShoppingCart'
GO
















