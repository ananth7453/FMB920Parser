USE [master]
GO
/****** Object:  Database [GPS_Tracking]    Script Date: 08/07/2018 15:18:45 ******/
CREATE DATABASE [GPS_Tracking] ON  PRIMARY 
( NAME = N'GPS_Tracking', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GPS_Tracking.mdf' , SIZE = 41216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GPS_Tracking_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GPS_Tracking_log.LDF' , SIZE = 104000KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GPS_Tracking] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GPS_Tracking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GPS_Tracking] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [GPS_Tracking] SET ANSI_NULLS OFF
GO
ALTER DATABASE [GPS_Tracking] SET ANSI_PADDING OFF
GO
ALTER DATABASE [GPS_Tracking] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [GPS_Tracking] SET ARITHABORT OFF
GO
ALTER DATABASE [GPS_Tracking] SET AUTO_CLOSE ON
GO
ALTER DATABASE [GPS_Tracking] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [GPS_Tracking] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [GPS_Tracking] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [GPS_Tracking] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [GPS_Tracking] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [GPS_Tracking] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [GPS_Tracking] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [GPS_Tracking] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [GPS_Tracking] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [GPS_Tracking] SET  ENABLE_BROKER
GO
ALTER DATABASE [GPS_Tracking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [GPS_Tracking] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [GPS_Tracking] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [GPS_Tracking] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [GPS_Tracking] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [GPS_Tracking] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [GPS_Tracking] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [GPS_Tracking] SET  READ_WRITE
GO
ALTER DATABASE [GPS_Tracking] SET RECOVERY SIMPLE
GO
ALTER DATABASE [GPS_Tracking] SET  MULTI_USER
GO
ALTER DATABASE [GPS_Tracking] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [GPS_Tracking] SET DB_CHAINING OFF
GO
USE [GPS_Tracking]
GO
/****** Object:  Table [dbo].[VehicleMaster]    Script Date: 08/07/2018 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleIMEI] [nvarchar](50) NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_VehicleMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Contact]    Script Date: 08/07/2018 15:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[ReceivedOn] [datetime] NULL,
	[Subject] [nvarchar](150) NULL,
 CONSTRAINT [PK_Tbl_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[rad2deg]    Script Date: 08/07/2018 15:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[rad2deg](@rad float) RETURNS float
BEGIN
declare @deg float;
set @deg = @rad * PI() /180.0;
RETURN @deg
END
GO
/****** Object:  Table [dbo].[GPS_Element]    Script Date: 08/07/2018 15:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPS_Element](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IMEI] [nvarchar](50) NULL,
	[ignition] [tinyint] NULL,
	[movement] [tinyint] NULL,
	[dataMode] [tinyint] NULL,
	[gsmSignalStrength] [tinyint] NULL,
	[sleepMode] [tinyint] NULL,
	[GNSSStatus] [tinyint] NULL,
	[DIN1] [tinyint] NULL,
	[DOUT1] [tinyint] NULL,
	[SDStatus] [tinyint] NULL,
	[bleBatteryVolt1] [tinyint] NULL,
	[bleBatteryVolt2] [tinyint] NULL,
	[bleBatteryVolt3] [tinyint] NULL,
	[bleBatteryVolt4] [tinyint] NULL,
	[PDOP] [smallint] NULL,
	[HDOP] [smallint] NULL,
	[extVolt] [smallint] NULL,
	[speed] [smallint] NULL,
	[gsmCellID] [smallint] NULL,
	[gsmAreaCode] [smallint] NULL,
	[batteryVoltage] [smallint] NULL,
	[batteryCurrent] [smallint] NULL,
	[AIN1] [smallint] NULL,
	[averageFuelUse] [smallint] NULL,
	[xaxis] [smallint] NULL,
	[yaxis] [smallint] NULL,
	[zaxis] [smallint] NULL,
	[ecoScore] [smallint] NULL,
	[bleTemp1] [smallint] NULL,
	[bleTemp2] [smallint] NULL,
	[bleTemp3] [smallint] NULL,
	[bleTemp4] [smallint] NULL,
	[bleHumidity1] [smallint] NULL,
	[bleHumidity2] [smallint] NULL,
	[bleHumidity3] [smallint] NULL,
	[bleHumidity4] [smallint] NULL,
	[gsmOperator] [int] NULL,
	[tripOdoMeter] [int] NULL,
	[totalOdoMeter] [int] NULL,
	[fuelUsedGPS] [int] NULL,
	[ICCID1] [bigint] NULL,
	[ICCID2] [bigint] NULL,
	[userID] [bigint] NULL,
	[defaultDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[deg2rad]    Script Date: 08/07/2018 15:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[deg2rad](@deg float) RETURNS float
BEGIN
declare @rad float;
set @rad = @deg * (PI() /180.0);
RETURN @rad
END
GO
/****** Object:  Table [dbo].[VT_LocationHistory]    Script Date: 08/07/2018 15:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VT_LocationHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReceivedOn] [datetime] NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[ModemId] [nvarchar](50) NULL,
	[distance] [float] NULL,
	[Currenttime] [nvarchar](50) NULL,
	[Ignition] [nvarchar](50) NULL,
	[Speed] [nvarchar](50) NULL,
	[Movement] [nvarchar](50) NULL,
	[OdometerKm] [nvarchar](50) NULL,
	[VehicleId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetDistanceFromLocation]    Script Date: 08/07/2018 15:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[GetDistanceFromLocation]
(   
    @CurrentLatitude float,
    @CurrentLongitude float,
    @latitude float,
    @longitude float
)
RETURNS Float
AS
BEGIN
    DECLARE @geo1 geography = geography::Point(@CurrentLatitude, @CurrentLongitude, 4268), 
            @geo2 geography = geography::Point(@latitude, @longitude, 4268)

    DECLARE @distance float
    SELECT @distance = @geo1.STDistance(@geo2) 

    RETURN @distance

END
GO
/****** Object:  Table [dbo].[VT_Users]    Script Date: 08/07/2018 15:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VT_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [date] NULL,
	[LastModified] [date] NULL,
 CONSTRAINT [PK_VT_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VT_Vehicle]    Script Date: 08/07/2018 15:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VT_Vehicle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleName] [nvarchar](50) NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
	[InsuranceDate] [date] NULL,
	[FCDate] [date] NULL,
	[MileagePerLitre] [float] NULL,
	[Model] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[Color] [nvarchar](50) NULL,
	[IMEI] [nvarchar](100) NULL,
	[SIMNumber] [bigint] NULL,
	[Operator] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[Isenabled] [bit] NULL,
 CONSTRAINT [PK_VT_Vehicle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[VT_Login]    Script Date: 08/07/2018 15:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_Login]      
      
@username nvarchar(50),      
@password nvarchar(50)      
      
as      
begin      
      
declare @checkcount nvarchar(50)      
set @checkcount = (select COUNT(ID) from VT_Users where UserName = @username and Password = @password)      
      
if(@checkcount = '1')      
      
begin      
      
select ID from VT_Users where UserName = @username and Password = @password and IsActive = '1'     
end      
       
 else      
 begin      
       
 declare @idd int      
 set @idd = '0'      
       
 select @idd as ID      
       
 end      
       
       
end
GO
/****** Object:  StoredProcedure [dbo].[VT_ignitionreports]    Script Date: 08/07/2018 15:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_ignitionreports]  
  
@id nvarchar(50),  
@fromdate datetime,  
@todate datetime,  
  @userid nvarchar(50)
  
as  
begin  
  
   declare @valid nvarchar(50)
    set @valid = (select COUNT(ID) from VT_Users where ID = @userid )
    
    if(@valid = '1')
    begin
  
select Currenttime,Latitude,Longitude,Ignition from VT_LocationHistory where VehicleId = @id and [Currenttime] between @fromdate and @todate  
  
order by ID desc  

end
  
  
  else
  
  begin
  
  select Currenttime,Latitude,Longitude,Ignition from VT_LocationHistory where VehicleId = '0' and [Currenttime] between @fromdate and @todate 
  
order by ID desc
  
  end
  
end
GO
/****** Object:  StoredProcedure [dbo].[VT_Contact]    Script Date: 08/07/2018 15:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_Contact]

@name nvarchar(150),
@email nvarchar(250),
@mobile nvarchar(50),
@message nvarchar(max),
@subject nvarchar(150)


as
begin


declare @receivedOn datetime 
set @receivedOn = (select DATEADD(MINUTE,330,GETUTCDATE()))


INSERT INTO [Tbl_Contact]
           ([Name]
           ,[Email]
           ,[Mobile]
           ,[Message]
           ,[ReceivedOn]
           ,[Subject])
     VALUES
           (@name
           ,@email
           ,@mobile
           ,@message
           ,@receivedOn
           ,@subject)


end
GO
/****** Object:  StoredProcedure [dbo].[VT_user_insert]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_user_insert]  
  
@firstname nvarchar(50),  
@lastname nvarchar(50),  
@email nvarchar(50),  
@mobile nvarchar(50),  
@username nvarchar(50),  
@password nvarchar(50)  
  
as  
begin  
  
declare @createdon date  
set @createdon = (select convert(date,GETUTCDATE(),103))   
  
INSERT INTO VT_Users  
           ([FirstName]  
           ,[LastName]  
           ,[Email]  
           ,[Mobile]  
           ,[UserName]  
           ,[Password]  
           ,[IsActive]  
           ,[CreatedOn])  
             
     VALUES  
           (@firstname  
           ,@lastname  
           ,@email  
           ,@mobile  
           ,@username  
           ,@password  
           ,'1'  
           ,@createdon)  
             
             
end
GO
/****** Object:  StoredProcedure [dbo].[VT_alarmreport]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[VT_alarmreport]

@vehicleid int,
@fromdate datetime,
@todate datetime


as
begin


select Currenttime,Latitude,Longitude,Ignition from VT_LocationHistory where VehicleId = @vehicleid and Currenttime between @fromdate and @todate
 
end
GO
/****** Object:  StoredProcedure [dbo].[get_details_for_register]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_details_for_register]

@email nvarchar(50),
@phone nvarchar(50),
@username nvarchar(50)

as

begin


declare @checkemail nvarchar(50),@checkphone nvarchar(50),@checkusername nvarchar(50)

set @checkemail = (select COUNT([Email]) as abc from [VT_Users] where [Email] = @email) 
set @checkphone = (select COUNT([Mobile]) as def from [VT_Users] where [Mobile] = @phone) 
set @checkusername = (select COUNT([UserName]) as ghi from [VT_Users] where [UserName] = @username) 


select @checkemail as abc, @checkphone as def, @checkusername as ghi

end
GO
/****** Object:  UserDefinedFunction [dbo].[DistanceCalc]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[DistanceCalc](@fromlat FLOAT,@fromlon float,@tolat float,@tolon float) RETURNS float
AS
BEGIN
-- this use Haversine Formula to find the distance between two lat lon point

DECLARE @dLat float,@dLon FLOAT,@a FLOAT,@d FLOAT, @c FLOAT, @R INT;
SET @R = 6371 -- Radius of Earth;

SET @dLat =dbo.deg2rad(@tolat - @fromlat);
SET @dLon =dbo.deg2rad(@tolon - @fromlon);

SET @a  = SIN(@dLat/2) * SIN(@dLat/2) + COS(TruckTaxi.dbo.deg2rad(@fromlat))  * COS(TruckTaxi.dbo.deg2rad(@tolat)) * SIN(@dLon/2) * SIN(@dLon/2)
SET @c = 2 * ATN2(SQRT(@a),SQRT(1-@a));
SET @d = @R * @c
RETURN @d

END
GO
/****** Object:  StoredProcedure [dbo].[Distance_report]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Distance_report]  
@vehicleid nvarchar(50),@fromdate nvarchar(50),@todate nvarchar(50)  ,@userid nvarchar(50)
as  
begin  

   declare @valid nvarchar(50)
    set @valid = (select COUNT(ID) from VT_Users where ID = @userid )
    
    if(@valid = '1')
 
 begin
select DateDiff(minute   
,(select top 1 currenttime from [VT_LocationHistory] where (Currenttime between '2/8/2018 6:24:45 AM' and '2/8/2018 6:39:15 AM')  and Vehicleid = @vehicleid order by Currenttime asc)  
,(select top 1 currenttime from [VT_LocationHistory] where (Currenttime between '2/8/2018 6:24:45 AM' and '2/8/2018 6:39:15 AM') and Vehicleid = @vehicleid order by Currenttime desc))as Duration  
, (select top 1 speed from VT_LocationHistory  where (Currenttime between '2/8/2018 6:24:45 AM' and '2/8/2018 6:39:15 AM') and Vehicleid = @vehicleid order by speed desc) as MaxSpeed  
,count(ID) as RecordCount  
,(select sum(convert(float,replace(speed,',','')))) as AvgSpeed  
,(select sum(convert(float,replace(distance,',','')))) as Distance  
FROM [VT_LocationHistory] where (Currenttime between '2/8/2018 6:24:45 AM' and '2/8/2018 6:39:15 AM') and Vehicleid = @vehicleid  
  
  end
  
  else
  
  begin
  
  select DateDiff(minute   
,(select top 1 currenttime from [VT_LocationHistory] where (Currenttime between '2/8/2018 6:24:45 AM' and '2/8/2018 6:39:15 AM')  and Vehicleid = @vehicleid order by Currenttime asc)  
,(select top 1 currenttime from [VT_LocationHistory] where (Currenttime between '2/8/2018 6:24:45 AM' and '2/8/2018 6:39:15 AM') and Vehicleid = @vehicleid order by Currenttime desc))as Duration  
, (select top 1 speed from VT_LocationHistory  where (Currenttime between '2/8/2018 6:24:45 AM' and '2/8/2018 6:39:15 AM') and Vehicleid = @vehicleid order by speed desc) as MaxSpeed  
,count(ID) as RecordCount  
,(select sum(convert(float,replace(speed,',','')))) as AvgSpeed  
,(select sum(convert(float,replace(distance,',','')))) as Distance  
FROM [VT_LocationHistory] where (Currenttime between '2/8/2018 6:24:45 AM' and '2/8/2018 6:39:15 AM') and Vehicleid = '0'  

  
  end
  
end
GO
/****** Object:  StoredProcedure [dbo].[GEtliveServerData_test]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GEtliveServerData_test]      
as      
begin      
select top 1 VT_Vehicle.ID, VT_LocationHistory.Currenttime,VT_LocationHistory .[Latitude]          
         
      ,VT_LocationHistory .[Longitude] ,GPS_Element.ignition,GPS_Element.movement,GPS_Element.speed        
         
      from VT_LocationHistory       
          
      left join VT_Vehicle on VT_Vehicle.IMEI = VT_LocationHistory.ModemId    
      left join GPS_Element on GPS_Element.IMEI = VT_LocationHistory.ModemId  
          
      order by VT_LocationHistory.ID desc       
end
GO
/****** Object:  StoredProcedure [dbo].[GEtliveServerData]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GEtliveServerData]   
@userid nvarchar(50)

         
as            
begin            
--select top 1 VT_Vehicle.ID, VT_LocationHistory.Currenttime,VT_LocationHistory .[Latitude]                
               
--      ,VT_LocationHistory .[Longitude] ,GPS_Element.ignition,GPS_Element.movement,GPS_Element.speed              
               
--      from VT_LocationHistory             
                
--      left join VT_Vehicle on VT_Vehicle.IMEI = VT_LocationHistory.ModemId          
--      left join GPS_Element on GPS_Element.IMEI = VT_LocationHistory.ModemId        
                
--      order by VT_LocationHistory.ID desc     
              
--WITH zaz (DuplicateCount,Latitude,Longitude,[ID],[Altitude]              
--      ,[Direction]              
--      ,[Satellites]              
--      ,[Speed]              
                   
--     ,[Currenttime]) AS              
--(              
--    SELECT   Top 1      
               
--        ROW_NUMBER() OVER (PARTITION BY VT_Vehicle.ID ORDER BY [Currenttime] DESC) AS DuplicateCount,              
--        VT_LocationHistory.[Latitude]              
--      ,VT_LocationHistory.[Longitude]              
--      ,VT_LocationHistory.[ModemId]              
--       ,[GPS_Real].[Altitude]              
--      ,[GPS_Real].[Direction]              
--      ,[GPS_Real].[Satellites]              
--      ,[GPS_Real].[Speed]              
                    
--      ,VT_LocationHistory.[Currenttime]              
--    FROM VT_LocationHistory              
            
--    left join VT_Vehicle on VT_Vehicle.IMEI= VT_LocationHistory.ModemId          
--    left join [GPS_Real] on [GPS_Real].ModemId = VT_LocationHistory.ModemId          
                 
--    -- where VT_Vehicle.UserID = @userid  and VT_Vehicle.ID =  @vehicleid          
           
--     order by VT_LocationHistory.ID asc       
               
--)      
            
--SELECT *              
--FROM zaz             
            
--WHERE DuplicateCount = 1               
                    
                    
                    
                    
                    
                    
--                  WITH zaz (DuplicateCount,Latitude,Longitude,ID ,[Altitude]      
        
--      ,[Speed]    
--     ,[Currenttime]  
--      ,[ignition]  
--      ,[movement]) AS      
--(      
--    SELECT      
--        ROW_NUMBER() OVER (PARTITION BY VT_LocationHistory.ModemId ORDER BY VT_LocationHistory.Currenttime DESC) AS DuplicateCount,      
--         VT_LocationHistory.[Latitude]      
--      ,VT_LocationHistory.[Longitude]      
--      ,VT_Vehicle.ID      
--       ,GPS_Real.[Altitude]   
--      ,GPS_Real.[Speed]   
--      ,VT_LocationHistory.Currenttime  
--      ,GPS_Element.[ignition]  
--          ,GPS_Element.movement  
--    FROM VT_LocationHistory      
--    left join VT_Vehicle on VT_Vehicle.IMEI = VT_LocationHistory.ModemId    
--       left join GPS_Real on GPS_Real.ModemId =  VT_LocationHistory.ModemId  
--       left join GPS_Element on GPS_Element.IMEI = VT_LocationHistory.ModemId  
--)      
--SELECT *      
--FROM zaz     
    
--WHERE DuplicateCount = 1   
  
  
  
  declare @valid nvarchar(50)
    set @valid = (select COUNT(ID) from VT_Users where ID = @userid )
    
    if(@valid = '1')
  
  begin
  
  
  
WITH zaz (DuplicateCount,Latitude,Longitude,VehicleID    
      ,[Speed]   
     ,[Currenttime]  
     ,[Movement]  
      ,[OdometerKm]  
      ,[Ignition]) AS      
(      
    SELECT    top 1  
        ROW_NUMBER() OVER (PARTITION BY VT_LocationHistory.ModemId ORDER BY VT_LocationHistory.ID DESC) AS DuplicateCount,      
         VT_LocationHistory.[Latitude]      
      ,VT_LocationHistory.[Longitude]      
      ,VT_LocationHistory.VehicleId    
      ,VT_LocationHistory.[Speed]      
      ,VT_LocationHistory.Currenttime  
      ,VT_LocationHistory.[Movement]  
      ,VT_LocationHistory.[OdometerKm]  
      ,VT_LocationHistory.[Ignition]  
        
    FROM VT_LocationHistory 
    left join VT_Vehicle on VT_Vehicle.ID = VT_LocationHistory.VehicleId
    
    
    where VT_Vehicle.UserID = @userid
)      
SELECT *      
FROM zaz     
  
  end
  
  else
  
  begin
  
  
  WITH zaz (DuplicateCount,Latitude,Longitude,VehicleID    
      ,[Speed]   
     ,[Currenttime]  
     ,[Movement]  
      ,[OdometerKm]  
      ,[Ignition]) AS      
(      
    SELECT    top 1  
        ROW_NUMBER() OVER (PARTITION BY VT_LocationHistory.ModemId ORDER BY VT_LocationHistory.ID DESC) AS DuplicateCount,      
         VT_LocationHistory.[Latitude]      
      ,VT_LocationHistory.[Longitude]      
      ,VT_LocationHistory.VehicleId    
      ,VT_LocationHistory.[Speed]      
      ,VT_LocationHistory.Currenttime  
      ,VT_LocationHistory.[Movement]  
      ,VT_LocationHistory.[OdometerKm]  
      ,VT_LocationHistory.[Ignition]  
        
    FROM VT_LocationHistory 
    left join VT_Vehicle on VT_Vehicle.ID = VT_LocationHistory.VehicleId
    
    
    where VT_Vehicle.UserID = '0'
)      
SELECT *      
FROM zaz     
  
  
  end
  
  
end
GO
/****** Object:  Table [dbo].[GPS_Real]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPS_Real](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModemId] [nvarchar](50) NULL,
	[ServerTimestamp] [nvarchar](50) NULL,
	[Long] [nvarchar](50) NULL,
	[Lat] [nvarchar](50) NULL,
	[Altitude] [nvarchar](50) NULL,
	[Direction] [nvarchar](50) NULL,
	[Satellites] [nvarchar](50) NULL,
	[Speed] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[VT_Insert_vehicle]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_Insert_vehicle]      
      
@vehiclename nvarchar(50),      
@registrationnumber nvarchar(50),      
@insurancedate date ,      
@fcdate date,      
@mileageperlitre float,      
@model nvarchar(50),      
@year int,      
@color nvarchar(50),      
@imei nvarchar(50),      
@simnumber bigint,      
@operator nvarchar(50),      
@userid int      
      
as      
begin      
  
  
INSERT INTO [VT_Vehicle]      
           ([VehicleName]      
           ,[RegistrationNumber]      
           ,[InsuranceDate]      
           ,[FCDate]      
           ,[MileagePerLitre]      
           ,[Model]      
           ,[Year]      
           ,[Color]      
           ,[IMEI]      
           ,[SIMNumber]      
           ,[Operator]      
           ,[UserID]    
           ,[Isenabled])      
     VALUES      
           (@vehiclename      
           ,@registrationnumber      
           ,@insurancedate      
           ,@fcdate      
           ,@mileageperlitre      
           ,@model      
           ,@year      
           ,@color      
           ,@imei      
           ,@simnumber      
           ,@operator      
           ,@userid    
           ,'1')      
    
    end
GO
/****** Object:  StoredProcedure [dbo].[Edit_cabs_VTS]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Edit_cabs_VTS]
@UserId nvarchar(50)
as
begin
SELECT [ID]
      ,[VehicleName]
      ,[RegistrationNumber]
      ,[Model]
      ,[IMEI]
      FROM [VT_Vehicle] where UserID =@UserId and isenabled='1'
end
GO
/****** Object:  StoredProcedure [dbo].[VT_Get_Live_tracking2]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_Get_Live_tracking2]          
          
  @userid int,           
  @vehicleid int          
            
 as          
 begin          
               
      
    declare @valid nvarchar(50)
    set @valid = (select COUNT(ID) from VT_Users where ID = @userid )
    
    if(@valid = '1')
  
  begin     
              
              
 WITH zaz (DuplicateCount,Latitude,Longitude,VehicleID      
      ,[Speed]     
     ,[Currenttime]    
     ,[Movement]    
      ,[OdometerKm]    
      ,[Ignition]) AS        
(        
    SELECT    top 1    
        ROW_NUMBER() OVER (PARTITION BY VT_LocationHistory.ModemId ORDER BY VT_LocationHistory.ID DESC) AS DuplicateCount,        
         VT_LocationHistory.[Latitude]        
      ,VT_LocationHistory.[Longitude]        
      ,VT_LocationHistory.VehicleId      
      ,VT_LocationHistory.[Speed]        
      ,VT_LocationHistory.Currenttime    
      ,VT_LocationHistory.[Movement]    
      ,VT_LocationHistory.[OdometerKm]    
      ,VT_LocationHistory.[Ignition]    
          
    FROM VT_LocationHistory       
      
      left join VT_Vehicle on VT_Vehicle.ID = VT_LocationHistory.VehicleId
      
      where VT_LocationHistory.VehicleId =  @vehicleid  and VT_Vehicle.UserID = @userid 
)        
SELECT *        
FROM zaz       
    
    end
             
 else
  begin
        
        
      WITH zaz (DuplicateCount,Latitude,Longitude,VehicleID      
      ,[Speed]     
     ,[Currenttime]    
     ,[Movement]    
      ,[OdometerKm]    
      ,[Ignition]) AS        
(        
    SELECT    top 1    
        ROW_NUMBER() OVER (PARTITION BY VT_LocationHistory.ModemId ORDER BY VT_LocationHistory.ID DESC) AS DuplicateCount,        
         VT_LocationHistory.[Latitude]        
      ,VT_LocationHistory.[Longitude]        
      ,VT_LocationHistory.VehicleId      
      ,VT_LocationHistory.[Speed]        
      ,VT_LocationHistory.Currenttime    
      ,VT_LocationHistory.[Movement]    
      ,VT_LocationHistory.[OdometerKm]    
      ,VT_LocationHistory.[Ignition]    
          
    FROM VT_LocationHistory       
      
      left join VT_Vehicle on VT_Vehicle.ID = VT_LocationHistory.VehicleId
      
      where VT_LocationHistory.VehicleId =  @vehicleid  and VT_Vehicle.UserID = '0' 
)        
SELECT *        
FROM zaz     
        
        
        
   end     
               
     end  
      
      
      
    --WITH zaz (DuplicateCount,Latitude,Longitude,[ID],[Altitude]              
--      ,[Direction]              
--      ,[Satellites]              
--      ,[Speed]              
                   
--     ,[Currenttime]) AS              
--(              
--    SELECT   Top 1      
               
--        ROW_NUMBER() OVER (PARTITION BY VT_Vehicle.ID ORDER BY [Currenttime] DESC) AS DuplicateCount,              
--        VT_LocationHistory.[Latitude]              
--      ,VT_LocationHistory.[Longitude]              
--      ,VT_LocationHistory.[ModemId]              
--       ,[GPS_Real].[Altitude]              
--      ,[GPS_Real].[Direction]              
--      ,[GPS_Real].[Satellites]              
--      ,[GPS_Real].[Speed]              
                    
--      ,VT_LocationHistory.[Currenttime]              
--    FROM VT_LocationHistory              
            
--    left join VT_Vehicle on VT_Vehicle.IMEI= VT_LocationHistory.ModemId          
--    left join [GPS_Real] on [GPS_Real].ModemId = VT_LocationHistory.ModemId          
                 
           
           
--     order by VT_LocationHistory.ID desc       
               
--)      
            
--SELECT *              
--FROM zaz             
            
--WHERE DuplicateCount = 1
GO
/****** Object:  StoredProcedure [dbo].[VT_Display_Vehicle_edit]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_Display_Vehicle_edit]    
    
@userid int ,
@vehicleid nvarchar(50)   
    
    
as    
begin    
    
SELECT [ID]    
      ,[VehicleName]    
      ,[RegistrationNumber]    
      ,[InsuranceDate]    
      ,[FCDate]    
      ,[MileagePerLitre]    
      ,[Model]    
      ,[Year]    
      ,[Color]    
      ,[IMEI]    
      ,[SIMNumber]    
      ,[Operator]    
      ,[UserID]    
      ,[Isenabled]    
  FROM [VT_Vehicle]    
    
where UserID = @userid    and Id=@vehicleid
    
end
GO
/****** Object:  StoredProcedure [dbo].[VT_display_vehicle]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_display_vehicle]    
    
  
    @userid  nvarchar(50)
as    
begin    
    
    declare @valid nvarchar(50)
    set @valid = (select COUNT(ID) from VT_Users where ID = @userid )
    
    if(@valid = 1)
    begin
select ID,VehicleName from VT_Vehicle where [UserID] = @userid order by ID asc    
    end
    
    else
    begin
    
select ID,VehicleName from VT_Vehicle where [UserID] = '0' order by ID asc   
    
    
    end
    
end
GO
/****** Object:  StoredProcedure [dbo].[VT_Update_vehicle]    Script Date: 08/07/2018 15:18:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_Update_vehicle]        
        
@vehiclename nvarchar(50),        
@registrationnumber nvarchar(50),        
@insurancedate date ,        
@fcdate date,        
@mileageperlitre float,        
@model nvarchar(50),        
@year int,        
@color nvarchar(50),        
@imei nvarchar(50),        
@simnumber bigint,        
@operator nvarchar(50), 
@id nvarchar(50) 
as        
begin 
 UPDATE [VT_Vehicle]
   SET [VehicleName] = @vehiclename
      ,[RegistrationNumber] = @registrationnumber
      ,[InsuranceDate] = @insurancedate
      ,[FCDate] = @fcdate
      ,[MileagePerLitre] = @mileageperlitre
      ,[Model] = @model
      ,[Year] = @year
      ,[Color] = @color
      ,[IMEI] = @imei
      ,[SIMNumber] = @simnumber
      ,[Operator] = @operator    
 WHERE ID =@id



 
 
 
     
      
    end
GO
/****** Object:  StoredProcedure [dbo].[VT_alarmreportz]    Script Date: 08/07/2018 15:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_alarmreportz]    
    
@vehicleid int,    
@fromdate nvarchar(50),    
@todate nvarchar(50)  ,  
@Statuz nvarchar(50),  
@zaz nvarchar(50),  
 @userid nvarchar(50)   
    
as    
begin    
   declare @IMEI nvarchar(50)  
  set @IMEI = (select IMEI from VT_Vehicle where Id=@vehicleid)  
  
   declare @valid nvarchar(50)
    set @valid = (select COUNT(ID) from VT_Users where ID = @userid )
    
    if(@valid = '1')
  
  begin
  
  if(@Statuz ='3')  
  begin  
  --select GPS_Element.defaultDate from GPS_Element   
    
  --left join GPS_Real on GPS_Real.ModemId = GPS_Element.IMEI  
  --where batteryvoltage < 3929  
  --and (defaultDate between '2018-08-02 05:39:11.630' and '2018-08-02 05:41:56.953' )   
  --and IMEI = '352093083254051'   
    
    select GPS_Element.defaultDate,VT_LocationHistory.Latitude,VT_LocationHistory.Longitude,@zaz as zaz,GPS_Element.batteryvoltage as zz FROM [GPS_Element]   
    --left join GPS_Real on GPS_Real.ServerTimestamp = GPS_Element.defaultDate  
    left join VT_LocationHistory on VT_LocationHistory.Currenttime = GPS_Element.defaultDate  
    where batteryvoltage < 3929 and IMEI = @IMEI   
    and (defaultDate between '2018-08-02 05:28:11.630' and '2018-08-02 05:42:11.630')  
  end  
    
    
  if(@Statuz ='6')  
  begin  
  select GPS_Element.defaultDate,VT_LocationHistory.Latitude,VT_LocationHistory.Longitude,@zaz as zaz,GPS_Element.extVolt as zz FROM [GPS_Element]   
      left join VT_LocationHistory on VT_LocationHistory.Currenttime = GPS_Element.defaultDate  
    where extVolt < 13929 and IMEI = @IMEI   
    and (defaultDate between '2018-08-02 05:28:11.630' and '2018-08-02 05:42:11.630')  
    
  end  
  if(@Statuz ='7')  
  begin  
  select GPS_Element.defaultDate,VT_LocationHistory.Latitude,VT_LocationHistory.Longitude,@zaz as zaz,GPS_Element.GNSSStatus as zz FROM [GPS_Element]   
      left join VT_LocationHistory on VT_LocationHistory.Currenttime = GPS_Element.defaultDate  
    where GNSSStatus = 0 and IMEI = @IMEI   
    and (defaultDate between '2018-08-02 05:28:11.630' and '2018-08-02 05:42:11.630')  
  end  
     
     end
     
     else
     
     begin
     
     if(@Statuz ='3')  
  begin  
  --select GPS_Element.defaultDate from GPS_Element   
    
  --left join GPS_Real on GPS_Real.ModemId = GPS_Element.IMEI  
  --where batteryvoltage < 3929  
  --and (defaultDate between '2018-08-02 05:39:11.630' and '2018-08-02 05:41:56.953' )   
  --and IMEI = '352093083254051'   
    
    select GPS_Element.defaultDate,VT_LocationHistory.Latitude,VT_LocationHistory.Longitude,@zaz as zaz,GPS_Element.batteryvoltage as zz FROM [GPS_Element]   
    --left join GPS_Real on GPS_Real.ServerTimestamp = GPS_Element.defaultDate  
    left join VT_LocationHistory on VT_LocationHistory.Currenttime = GPS_Element.defaultDate  
    where batteryvoltage < 3929 and IMEI = '0'   
    and (defaultDate between '2018-08-02 05:28:11.630' and '2018-08-02 05:42:11.630')  
  end  
     
     
     if(@Statuz ='6')  
  begin  
  select GPS_Element.defaultDate,VT_LocationHistory.Latitude,VT_LocationHistory.Longitude,@zaz as zaz,GPS_Element.extVolt as zz FROM [GPS_Element]   
      left join VT_LocationHistory on VT_LocationHistory.Currenttime = GPS_Element.defaultDate  
    where extVolt < 13929 and IMEI = '0'   
    and (defaultDate between '2018-08-02 05:28:11.630' and '2018-08-02 05:42:11.630')  
    
  end  
     
     
     if(@Statuz ='7')  
  begin  
  select GPS_Element.defaultDate,VT_LocationHistory.Latitude,VT_LocationHistory.Longitude,@zaz as zaz,GPS_Element.GNSSStatus as zz FROM [GPS_Element]   
      left join VT_LocationHistory on VT_LocationHistory.Currenttime = GPS_Element.defaultDate  
    where GNSSStatus = 0 and IMEI = '0'   
    and (defaultDate between '2018-08-02 05:28:11.630' and '2018-08-02 05:42:11.630')  
  end  
     
     
     
     end
     
     
end
GO
/****** Object:  StoredProcedure [dbo].[VT_historyreport]    Script Date: 08/07/2018 15:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_historyreport]                      
                    
@name nvarchar(50),                    
@fromdate datetime,                    
@todate datetime ,
@userid nvarchar(50)                 
                    
as                    
                    
begin                    
                  
          declare @abc nvarchar(50)        
          set @abc = (select IMEI from VT_Vehicle where ID = @name)         
                    
       declare @valid nvarchar(50)
    set @valid = (select COUNT(ID) from VT_Users where ID = @userid )
    
    if(@valid = '1')
    begin             
                    
select Top 50 ServerTimestamp ,[Lat] ,[Long], [Altitude], [Speed] from GPS_Real                     
                      
                    
left join VT_Vehicle on VT_Vehicle.IMEI = GPS_Real.ModemId               
             
                     
 where VT_Vehicle.IMEI = @abc and ServerTimestamp between @fromdate and @todate order by GPS_Real.ID desc                
            
  end
              
  else
     begin
     select Top 50 ServerTimestamp ,[Lat] ,[Long], [Altitude], [Speed] from GPS_Real                     
                      
                    
left join VT_Vehicle on VT_Vehicle.IMEI = GPS_Real.ModemId               
             
                     
 where VT_Vehicle.IMEI = '0' and ServerTimestamp between @fromdate and @todate order by GPS_Real.ID desc
     
    end       
end
GO
/****** Object:  StoredProcedure [dbo].[VT_Speedreports]    Script Date: 08/07/2018 15:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_Speedreports]                                        
                                        
 @id int,                                        
 @fromdate nvarchar(50),                                      
 @todate nvarchar(50),                       
 @speedlimit float ,                      
 @userid nvarchar(50)                                   
as                                        
begin                                        
                                        
           declare @imei nvarchar(50)                      
           set @imei = (select IMEI from VT_Vehicle where ID = @id)                             
                                        
     declare @valid nvarchar(50)        
    set @valid = (select COUNT(ID) from VT_Users where ID = @userid )        
            
    if(@valid = '1')        
               
       begin                          
                                        
select ServerTimestamp,GPS_Real.Lat,GPS_Real.Long,GPS_Real.Altitude,GPS_Real.Speed from GPS_Real                                         
                                        
--left join VT_SpeedAlert on VT_SpeedAlert.vehicleid = GPS_Real.vehicleid                                        
                                        
where GPS_Real.ServerTimestamp between '1/8/2018 1:16:15 AM' and '1/8/2018 1:40:50 PM' and GPS_Real.ModemId = @imei and  GPS_Real.Speed >= @speedlimit                                
                                        
end        
        
        
else        
        
begin        
        
        
select  ServerTimestamp,GPS_Real.Lat,GPS_Real.Long,GPS_Real.Altitude,GPS_Real.Speed from GPS_Real                                         
                                        
--left join VT_SpeedAlert on VT_SpeedAlert.vehicleid = GPS_Real.vehicleid                                        
                                        
where GPS_Real.ServerTimestamp between '2/8/2018 1:16:15 AM' and '2/8/2018 6:40:50 PM' and GPS_Real.ModemId = '0' and  GPS_Real.Speed >= @speedlimit                   
        
end        
        
end
GO
/****** Object:  StoredProcedure [dbo].[VT_display_history_report]    Script Date: 08/07/2018 15:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VT_display_history_report]            
         
@fromdate nvarchar(50),         
 @todate nvarchar(50)      
            
as            
begin            
            
            
      --declare @todaydate nvarchar(50)      
      --set @todaydate = (select DATEADD(MINUTE,330,GETUTCDATE()))      
            
            
select Top 10 [GPS_Real].[ServerTimestamp],[GPS_Real].[Lat],[GPS_Real].[Long],[GPS_Real].[Altitude],[GPS_Real].[Speed] from GPS_Real             
            
      where [ServerTimestamp] between @fromdate and @todate   order by ID desc   
            
--left join [GPS_Real] on [GPS_Real].ModemId = VT_Vehicle.IMEI            
            
            
--order by VT_Vehicle.Id desc            
            
end
GO
/****** Object:  View [dbo].[View_GetVehicleLiveStatus]    Script Date: 08/07/2018 15:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_GetVehicleLiveStatus]
AS
SELECT     dbo.GPS_Real.ID, dbo.VehicleMaster.Name, dbo.GPS_Real.Lat, dbo.GPS_Real.Long, dbo.GPS_Real.Speed, dbo.GPS_Element.ignition, dbo.GPS_Element.movement, 
                      dbo.GPS_Real.ServerTimestamp
FROM         dbo.GPS_Real INNER JOIN
                      dbo.VehicleMaster ON dbo.GPS_Real.ModemId = dbo.VehicleMaster.VehicleIMEI INNER JOIN
                      dbo.GPS_Element ON dbo.VehicleMaster.VehicleIMEI = dbo.GPS_Element.IMEI
WHERE     (dbo.GPS_Real.ID =
                          (SELECT     MAX(ID) AS Expr1
                            FROM          dbo.GPS_Real AS gps
                            WHERE      (ModemId = dbo.GPS_Real.ModemId))) AND (dbo.GPS_Element.ID =
                          (SELECT     MAX(ID) AS ID
                            FROM          dbo.GPS_Element AS GPSE
                            WHERE      (IMEI = dbo.GPS_Element.IMEI)))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[4] 2[7] 3) )"
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
         Begin Table = "GPS_Real"
            Begin Extent = 
               Top = 48
               Left = 698
               Bottom = 250
               Right = 868
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "VehicleMaster"
            Begin Extent = 
               Top = 52
               Left = 38
               Bottom = 157
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GPS_Element"
            Begin Extent = 
               Top = 4
               Left = 439
               Bottom = 248
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 32
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
         Width = 2655
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GetVehicleLiveStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GetVehicleLiveStatus'
GO
/****** Object:  StoredProcedure [dbo].[Sp_GeoLoc]    Script Date: 08/07/2018 15:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

  
  CREATE proc [dbo].[Sp_GeoLoc]
  
  as
  begin
  
  SELECT [ID]
      ,[Name]
      ,[Lat]
      ,[Long]
      ,[Speed]
      ,[ignition]
      ,[movement]
      ,[ServerTimestamp]
  FROM [GPS_Tracking].[dbo].[View_GetVehicleLiveStatus]
  
  end
GO
/****** Object:  Default [DF_GPS_Element]    Script Date: 08/07/2018 15:18:49 ******/
ALTER TABLE [dbo].[GPS_Element] ADD  CONSTRAINT [DF_GPS_Element]  DEFAULT (getdate()) FOR [defaultDate]
GO
/****** Object:  ForeignKey [FK_VT_Vehicle_VT_Users]    Script Date: 08/07/2018 15:18:49 ******/
ALTER TABLE [dbo].[VT_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_VT_Vehicle_VT_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[VT_Users] ([ID])
GO
ALTER TABLE [dbo].[VT_Vehicle] CHECK CONSTRAINT [FK_VT_Vehicle_VT_Users]
GO
