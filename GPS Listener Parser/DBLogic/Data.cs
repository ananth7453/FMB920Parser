using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;
using System.Data.SqlClient;

namespace GPSParser.DBLogic
{
    public class Data
    {
        public void SaveGPSPositionFMXXXX(GPSdata gpsPos)
        {
            DBUtils db = new DBUtils();
            SqlCommand sp = db.InitQuery(@" INSERT INTO GPS_Real (ModemId, [ServerTimestamp],    
    Long,
    Lat, 
    Altitude, 
    Direction, 
    Satellites, 
    Speed)
    VALUES (@ModemId, @ServerTimestamp,    
    @Long,
   @Lat, 
   @Altitude, 
   @Direction, 
   @Satellites, 
   @Speed)");
            sp.Parameters.AddWithValue("@ModemId", gpsPos.IMEI.ToString());
            sp.Parameters.AddWithValue("@ServerTimestamp", gpsPos.Timestamp.ToString());
            sp.Parameters.AddWithValue("@Long", gpsPos.Long.ToString());
            sp.Parameters.AddWithValue("@Lat", gpsPos.Lat.ToString());
            sp.Parameters.AddWithValue("@Altitude", gpsPos.Altitude.ToString());
            sp.Parameters.AddWithValue("@Direction", gpsPos.Direction.ToString());
            sp.Parameters.AddWithValue("@Satellites", gpsPos.Satellite.ToString());
            sp.Parameters.AddWithValue("@Speed", gpsPos.Speed.ToString());
            db.ExecQuery(sp);
            try
            {
                db.ExecSP(sp);
            }
            catch (Exception ex)
            {
                WriteIntoFile.write(ex.ToString());
            }
            finally
            {
                db.FreeSP(sp);
            }
        }


        public void SaveGPSElementsFMXXXX(string IMEI,GPSElement _gpsElement)
        {
            DBUtils db = new DBUtils();
            string sqlQuery = (@"INSERT INTO [GPS_Tracking].[dbo].[GPS_Element]
           ([IMEI]
           ,[ignition]
           ,[movement]
           ,[dataMode]
           ,[gsmSignalStrength]
           ,[sleepMode]
           ,[GNSSStatus]
           ,[DIN1]
           ,[DOUT1]
           ,[SDStatus]
           ,[bleBatteryVolt1]
           ,[bleBatteryVolt2]
           ,[bleBatteryVolt3]
           ,[bleBatteryVolt4]
           ,[PDOP]
           ,[HDOP]
           ,[extVolt]
           ,[speed]
           ,[gsmCellID]
           ,[gsmAreaCode]
           ,[batteryVoltage]
           ,[batteryCurrent]
           ,[AIN1]
           ,[averageFuelUse]
           ,[xaxis]
           ,[yaxis]
           ,[zaxis]
           ,[ecoScore]
           ,[bleTemp1]
           ,[bleTemp2]
           ,[bleTemp3]
           ,[bleTemp4]
           ,[bleHumidity1]
           ,[bleHumidity2]
           ,[bleHumidity3]
           ,[bleHumidity4]
           ,[gsmOperator]
           ,[tripOdoMeter]
           ,[totalOdoMeter]
           ,[fuelUsedGPS]
           ,[ICCID1]
           ,[ICCID2]
           ,[userID])
     VALUES
           (@IMEI
           ,@ignition
           ,@movement
           ,@dataMode
           ,@gsmSignalStrength 
           ,@sleepMode 
           ,@GNSSStatus 
           ,@DIN1 
           ,@DOUT1 
           ,@SDStatus 
           ,@bleBatteryVolt1 
           ,@bleBatteryVolt2 
           ,@bleBatteryVolt3 
           ,@bleBatteryVolt4 
           ,@PDOP 
           ,@HDOP 
           ,@extVolt 
           ,@speed 
           ,@gsmCellID 
           ,@gsmAreaCode 
           ,@batteryVoltage 
           ,@batteryCurrent 
           ,@AIN1 
           ,@averageFuelUse 
           ,@xaxis 
           ,@yaxis 
           ,@zaxis 
           ,@ecoScore 
           ,@bleTemp1 
           ,@bleTemp2 
           ,@bleTemp3 
           ,@bleTemp4 
           ,@bleHumidity1 
           ,@bleHumidity2 
           ,@bleHumidity3 
           ,@bleHumidity4 
           ,@gsmOperator
           ,@tripOdoMeter
           ,@totalOdoMeter
           ,@fuelUsedGPS
           ,@ICCID1
           ,@ICCID2
           ,@userID)");

            SqlCommand sp = db.InitQuery(sqlQuery);

            sp.Parameters.AddWithValue("@IMEI", IMEI);
            sp.Parameters.AddWithValue("@ignition", _gpsElement.ignition);
            sp.Parameters.AddWithValue("@movement", _gpsElement.movement);
            sp.Parameters.AddWithValue("@dataMode", _gpsElement.dataMode);
            sp.Parameters.AddWithValue("@gsmSignalStrength", _gpsElement.gsmSignalStrength);
            sp.Parameters.AddWithValue("@sleepMode", _gpsElement.sleepMode);
            sp.Parameters.AddWithValue("@GNSSStatus", _gpsElement.GNSSStatus);
            sp.Parameters.AddWithValue("@DIN1", _gpsElement.DIN1);
            sp.Parameters.AddWithValue("@DOUT1", _gpsElement.DOUT1);
            sp.Parameters.AddWithValue("@SDStatus", _gpsElement.SDStatus);
            sp.Parameters.AddWithValue("@bleBatteryVolt1", _gpsElement.bleBatteryVolt1);
            sp.Parameters.AddWithValue("@bleBatteryVolt2", _gpsElement.bleBatteryVolt2);
            sp.Parameters.AddWithValue("@bleBatteryVolt3", _gpsElement.bleBatteryVolt3);
            sp.Parameters.AddWithValue("@bleBatteryVolt4", _gpsElement.bleBatteryVolt4);
            sp.Parameters.AddWithValue("@PDOP", _gpsElement.PDOP);
            sp.Parameters.AddWithValue("@HDOP", _gpsElement.HDOP);
            sp.Parameters.AddWithValue("@extVolt", _gpsElement.extVolt);
            sp.Parameters.AddWithValue("@speed", _gpsElement.speed);
            sp.Parameters.AddWithValue("@gsmCellID", _gpsElement.gsmCellID);
            sp.Parameters.AddWithValue("@gsmAreaCode", _gpsElement.gsmAreaCode);
            sp.Parameters.AddWithValue("@batteryVoltage", _gpsElement.batteryVoltage);
            sp.Parameters.AddWithValue("@batteryCurrent", _gpsElement.batteryCurrent);
            sp.Parameters.AddWithValue("@AIN1", _gpsElement.AIN1);
            sp.Parameters.AddWithValue("@averageFuelUse", _gpsElement.averageFuelUse);
            sp.Parameters.AddWithValue("@xaxis", _gpsElement.xaxis);
            sp.Parameters.AddWithValue("@yaxis", _gpsElement.yaxis);
            sp.Parameters.AddWithValue("@zaxis", _gpsElement.zaxis);
            sp.Parameters.AddWithValue("@ecoScore", _gpsElement.ecoScore);
            
            sp.Parameters.AddWithValue("@bleTemp1", _gpsElement.bleTemp1);
            sp.Parameters.AddWithValue("@bleTemp2", _gpsElement.bleTemp2);
            sp.Parameters.AddWithValue("@bleTemp3", _gpsElement.bleTemp3);
            sp.Parameters.AddWithValue("@bleTemp4", _gpsElement.bleTemp4);
            sp.Parameters.AddWithValue("@bleHumidity1", _gpsElement.bleHumidity1);
            sp.Parameters.AddWithValue("@bleHumidity2", _gpsElement.bleHumidity2);
            sp.Parameters.AddWithValue("@bleHumidity3", _gpsElement.bleHumidity3);
            sp.Parameters.AddWithValue("@bleHumidity4", _gpsElement.bleHumidity4);
            sp.Parameters.AddWithValue("@gsmOperator", _gpsElement.gsmOperator);
            sp.Parameters.AddWithValue("@tripOdoMeter", _gpsElement.tripOdoMeter);
            sp.Parameters.AddWithValue("@totalOdoMeter", _gpsElement.totalOdoMeter);
            sp.Parameters.AddWithValue("@fuelUsedGPS", _gpsElement.fuelUsedGPS);
            sp.Parameters.AddWithValue("@ICCID1", _gpsElement.ICCID1);
            sp.Parameters.AddWithValue("@ICCID2", _gpsElement.ICCID2);
            sp.Parameters.AddWithValue("@userID", _gpsElement.userID);

            ////LoggerInLogger(sqlQuery);

            db.ExecQuery(sp);
            try
            {
                db.ExecSP(sp);
            }
            catch (Exception ex)
            {
                WriteIntoFile.write(ex.ToString());
            }
            finally
            {
                db.FreeSP(sp);
            }
        }




        public void SaveGPSPositionGH3000(GPSdata gpsPos)
        {
            DBUtils db = new DBUtils();
            SqlCommand sp = db.InitQuery(@" INSERT INTO GPS_Real (ModemId, [ServerTimestamp],    
    Long,
    Lat, 
    Altitude, 
    Direction, 
    Satellites, 
    Speed)
    VALUES (@ModemId, @ServerTimestamp,    
    @Long,
   @Lat, 
   @Altitude, 
   @Direction, 
   @Satellites, 
   @Speed)");
            sp.Parameters.AddWithValue("@ModemId", gpsPos.Direction.ToString());
            sp.Parameters.AddWithValue("@ServerTimestamp", gpsPos.Direction.ToString());
            sp.Parameters.AddWithValue("@Long", gpsPos.Direction.ToString());
            sp.Parameters.AddWithValue("@Lat", gpsPos.Direction.ToString());
            sp.Parameters.AddWithValue("@Altitude", gpsPos.Direction.ToString());
            sp.Parameters.AddWithValue("@Direction", gpsPos.Direction.ToString());
            sp.Parameters.AddWithValue("@Satellites", gpsPos.Direction.ToString());
            sp.Parameters.AddWithValue("@Speed", gpsPos.Direction.ToString());
            db.ExecQuery(sp);
            try
            {
                db.ExecSP(sp);
            }
            catch (Exception ex)
            {
                WriteIntoFile.write(ex.ToString());
            }
            finally
            {
                db.FreeSP(sp);
            }
        }
       
    }
}
