using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GPSApplicationAPI.Models
{
    public class Users
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModified { get; set; }
        public int OTP { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }
    }
}