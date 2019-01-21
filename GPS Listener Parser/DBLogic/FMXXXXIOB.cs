using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GPSParser.DBLogic
{
    public class FMXXXXIOB
    {
        public GPSElement _gpsElement = new GPSElement();
        public GPSdata _gpsData = new GPSdata();

        public void Store1B()
        {

            _gpsElement.ignition = 0;
            _gpsElement.movement = 0;
            _gpsElement.dataMode = 0;
            _gpsElement.gsmSignalStrength = 0;
            _gpsElement.sleepMode = 0;
            _gpsElement.GNSSStatus = 0;
            _gpsElement.DIN1 = 0;
            _gpsElement.DOUT1 = 0;
            _gpsElement.SDStatus = 0;


            foreach (KeyValuePair<byte, byte> _1B in _gpsData.IO_Elements_1B)
            {
                switch (_1B.Key)
                {
                    case 239:
                        _gpsElement.ignition = _1B.Value;
                        break;
                    case 240:
                        _gpsElement.movement = _1B.Value;
                        break;
                    case 80:
                        _gpsElement.dataMode = _1B.Value;
                        break;
                    case 21:
                        _gpsElement.gsmSignalStrength = _1B.Value;
                        break;
                    case 200:
                        _gpsElement.sleepMode = _1B.Value;
                        break;
                    case 69:
                        _gpsElement.GNSSStatus = _1B.Value;
                        break;

                    case 1:
                        _gpsElement.DIN1 = _1B.Value;
                        break;
                    case 179:
                        _gpsElement.DOUT1 = _1B.Value;
                        break;
                    case 10:
                        _gpsElement.SDStatus = _1B.Value;
                        break;

                }
            }
        }


        public void Store2B()
        {

            _gpsElement.PDOP = 0;
            _gpsElement.HDOP = 0;
            _gpsElement.extVolt = 0;
            _gpsElement.speed = 0;
            _gpsElement.gsmCellID = 0;
            _gpsElement.gsmAreaCode = 0;
            _gpsElement.batteryVoltage = 0;
            _gpsElement.batteryCurrent = 0;
            _gpsElement.AIN1 = 0;
            _gpsElement.averageFuelUse = 0;
            _gpsElement.xaxis = 0;
            _gpsElement.yaxis = 0;
            _gpsElement.zaxis = 0;
            _gpsElement.ecoScore = 0;
            _gpsElement.bleTemp1 = 0;
            _gpsElement.bleTemp2 = 0;
            _gpsElement.bleTemp3 = 0;
            _gpsElement.bleTemp4 = 0;
            _gpsElement.bleHumidity1 = 0;
            _gpsElement.bleHumidity2 = 0;
            _gpsElement.bleHumidity3 = 0;
            _gpsElement.bleHumidity4 = 0;

            foreach (KeyValuePair<byte, short> _2B in _gpsData.IO_Elements_2B)
            {
                switch (_2B.Key)
                {
                    case 181:
                        _gpsElement.PDOP = _2B.Value;
                        break;
                    case 182:
                        _gpsElement.HDOP = _2B.Value;
                        break;
                    case 66:
                        _gpsElement.extVolt = _2B.Value;
                        break;
                    case 24:
                        _gpsElement.speed = _2B.Value;
                        break;
                    case 205:
                        _gpsElement.gsmCellID = _2B.Value;
                        break;
                    case 206:
                        _gpsElement.gsmAreaCode = _2B.Value;
                        break;
                    case 67:
                        _gpsElement.batteryVoltage = _2B.Value;
                        break;
                    case 68:
                        _gpsElement.batteryCurrent = _2B.Value;
                        break;
                    case 9:
                        _gpsElement.AIN1 = _2B.Value;
                        break;
                    case 13:
                        _gpsElement.averageFuelUse = _2B.Value;
                        break;
                    case 17:
                        _gpsElement.xaxis = _2B.Value;
                        break;
                    case 18:
                        _gpsElement.yaxis = _2B.Value;
                        break;
                    case 19:
                        _gpsElement.zaxis = _2B.Value;
                        break;
                    case 15:
                        _gpsElement.ecoScore = _2B.Value;
                        break;
                    case 25:
                        _gpsElement.bleTemp1 = _2B.Value;
                        break;
                    case 26:
                        _gpsElement.bleTemp2 = _2B.Value;
                        break;
                    case 27:
                        _gpsElement.bleTemp3 = _2B.Value;
                        break;
                    case 28:
                        _gpsElement.bleTemp4 = _2B.Value;
                        break;
                    case 86:
                        _gpsElement.bleHumidity1 = _2B.Value;
                        break;
                    case 104:
                        _gpsElement.bleHumidity2 = _2B.Value;
                        break;
                    case 106:
                        _gpsElement.bleHumidity3 = _2B.Value;
                        break;
                    case 108:
                        _gpsElement.bleHumidity4 = _2B.Value;
                        break;

                }
            }
        }



        public void Store4B()
        {

            _gpsElement.gsmOperator = 0;
            _gpsElement.tripOdoMeter = 0;
            _gpsElement.totalOdoMeter = 0;
            _gpsElement.fuelUsedGPS = 0;

            foreach (KeyValuePair<byte, int> _4B in _gpsData.IO_Elements_4B)
            {
                switch (_4B.Key)
                {
                    case 241:
                        _gpsElement.gsmOperator = _4B.Value;
                        break;
                    case 199:
                        _gpsElement.tripOdoMeter = _4B.Value;
                        break;
                    case 16:
                        _gpsElement.totalOdoMeter = _4B.Value;
                        break;
                    case 12:
                        _gpsElement.fuelUsedGPS = _4B.Value;
                        break;


                }
            }
        }


        public void Store8B()
        {
            _gpsElement.ICCID1 = 0;
            _gpsElement.ICCID2 = 0;
            _gpsElement.userID = 0;

            foreach (KeyValuePair<byte, long> _8B in _gpsData.IO_Elements_8B)
            {
                switch (_8B.Key)
                {
                    case 11:
                        _gpsElement.ICCID1 = _8B.Value;
                        break;
                    case 14:
                        _gpsElement.ICCID2 = _8B.Value;
                        break;
                    case 238:
                        _gpsElement.userID = _8B.Value;
                        break;
                }
            }
        }



    }
}
