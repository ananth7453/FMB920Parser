using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GPSParser.DBLogic
{
    public class GPSElement
    {

        
        //1Byte Data
        public byte ignition { get; set; }
        public byte movement { get; set; }
        public byte dataMode { get; set; }
        public byte gsmSignalStrength { get; set; }
        public byte sleepMode { get; set; }
        public byte GNSSStatus { get; set; }
        public byte DIN1 { get; set; }
        public byte DOUT1 { get; set; }
        public byte SDStatus { get; set; }
        public byte bleBatteryVolt1 { get; set; }
        public byte bleBatteryVolt2 { get; set; }
        public byte bleBatteryVolt3 { get; set; }
        public byte bleBatteryVolt4 { get; set; }

        //2Byte Date

        public short PDOP { get; set; }
        public short HDOP { get; set; }
        public short extVolt { get; set; }
        public short speed { get; set; }
        public short gsmCellID { get; set; }
        public short gsmAreaCode { get; set; }
        public short batteryVoltage { get; set; }
        public short batteryCurrent { get; set; }
        public short AIN1 { get; set; }
        public short averageFuelUse { get; set; }
        public short xaxis { get; set; }
        public short yaxis { get; set; }
        public short zaxis { get; set; }
        public short ecoScore { get; set; }
        public short bleTemp1 { get; set; }
        public short bleTemp2 { get; set; }
        public short bleTemp3 { get; set; }
        public short bleTemp4 { get; set; }
        public short bleHumidity1 { get; set; }
        public short bleHumidity2 { get; set; }
        public short bleHumidity3 { get; set; }
        public short bleHumidity4 { get; set; }

        //4Byte Data

        public int gsmOperator { get; set; }
        public int tripOdoMeter { get; set; }
        public int totalOdoMeter { get; set; }
        public int fuelUsedGPS { get; set; }


        //8Byte Data

        public long ICCID1 { get; set; }
        public long ICCID2 { get; set; }
        public long userID { get; set; }



    }
}
