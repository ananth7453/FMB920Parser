using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GPSApplicationAPI.Models
{
    public class rspLocation
    {
        public int Status { get; set; }
        public string Message { get; set; }
        public List<LocationHistory> LocationHistory { get; set; }
    }

    public class rspUser
    {
        public int Status { get; set; }
        public string Message { get; set; }
        public List<Users> Users { get; set; }
    }

    public class rspVehicle
    {
        public int Status { get; set; }
        public string Message { get; set; }
        public List<Vehicle> Vehicle { get; set; }
    }
}