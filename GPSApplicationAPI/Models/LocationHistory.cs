using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GPSApplicationAPI.Models
{
    public class LocationHistory
    {
        public int ID { get; set; }
        public DateTime ReceivedOn { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string ModemId { get; set; }
        public float distance { get; set; }
        public string Currenttime { get; set; }
        public string Ignition { get; set; }
        public string Speed { get; set; }
        public string Movement { get; set; }
        public string OdometerKm { get; set; }
        public int VehicleId { get; set; }
        
    }
}