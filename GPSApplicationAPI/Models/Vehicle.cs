using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GPSApplicationAPI.Models
{
    public class Vehicle
    {
        public int ID { get; set; }
        public string VehicleName { get; set; }
        public string RegistrationNumber { get; set; }
        public DateTime InsuranceDate { get; set; }
        public DateTime FCDate { get; set; }
        public float MileagPerLitre { get; set; }
        public string Model { get; set; }
        public int Year { get; set; }
        public string Color { get; set; }
        public string IMEI { get; set; }
        public Int64 SIMNumber { get; set; }
        public string Operator { get; set; }
        public int UserID { get; set; }
        public bool Isenabled { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }
    }
}