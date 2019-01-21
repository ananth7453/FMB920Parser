using GPSApplicationAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace GPSApplicationAPI.Controllers
{
    public class ValuesController : ApiController
    {
        DAL _data;
        [HttpPost]
        public rspUser Login([FromBody] Users users)
        {
            _data = new DAL();
            if(!string.IsNullOrEmpty(users.UserName) && !string.IsNullOrEmpty(users.Password))
            {
                return _data.login(users);
            }
            return null;
        }

        [HttpPost]
        public rspVehicle VehicleList([FromBody] Users users)
        {
            _data = new DAL();
            if (!string.IsNullOrEmpty(users.ID.ToString()))
            {
                return _data.vehiclelist(users);
            }
            return null;
        }

        [HttpPost]
        public rspLocation GetLocationAll([FromBody]Users users)
        {
            _data = new DAL();
            if (!string.IsNullOrEmpty(users.ID.ToString()))
            {
                return _data.getlocationall(users);
            }
            return null;
        }

        [HttpPost]
        public rspLocation GetLocationByVehicle([FromBody] Vehicle vehicle)
        {
            _data = new DAL();
            if (!string.IsNullOrEmpty(vehicle.ID.ToString()))
            {
                return _data.getlocationbyvehicle(vehicle);
            }
            return null;
        }
    }
}
