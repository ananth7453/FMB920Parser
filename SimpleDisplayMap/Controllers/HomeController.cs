using SimpleDisplayMap.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace SimpleDisplayMap.Controllers
{
    public class HomeController : Controller
    {

        static string baseUri =
  "http://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&sensor=false";
        string location = string.Empty;

        public static string RetrieveFormatedAddress(string lat, string lng)
        {
            string requestUri = string.Format(baseUri, lat, lng);

            using (WebClient wc = new WebClient())
            {
                string result = wc.DownloadString(requestUri);
                var xmlElm = XElement.Parse(result);
                var status = (from elm in xmlElm.Descendants()
                              where
elm.Name == "status"
                              select elm).FirstOrDefault();
                if (status.Value.ToLower() == "ok")
                {
                    var res = (from elm in xmlElm.Descendants()
                               where
elm.Name == "formatted_address"
                               select elm).FirstOrDefault();
                    requestUri = res.Value;
                }
            }
            return requestUri;
        }

        public ActionResult Index()
        {
            string markers = "[";
            string conString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlCommand cmd = new SqlCommand("Sp_GeoLoc");
            List<GPSData> lstGPS = new List<GPSData>();
            using (SqlConnection con = new SqlConnection(conString))
            {
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        GPSData _gps = new GPSData();
                        _gps.Name = sdr["Name"].ToString();
                        _gps.Latitude = sdr["Lat"].ToString();
                        _gps.Longitude = sdr["Long"].ToString();
                        _gps.Speed = Convert.ToString(sdr["Speed"].ToString());
                        _gps.ignition = Convert.ToInt32(sdr["ignition"]);
                        _gps.Location = RetrieveFormatedAddress(_gps.Latitude, _gps.Longitude);
                        lstGPS.Add(_gps);

                        markers += "{";
                        markers += string.Format("'title': '{0} Speed {1} Ignition {2}',", sdr["Name"], sdr["Speed"], sdr["ignition"]);
                        markers += string.Format("'lat': '{0}',", sdr["Lat"]);
                        markers += string.Format("'lng': '{0}',", sdr["Long"]);
                        markers += string.Format("'description': '{0}'", sdr["Speed"]);
                        markers += "},";
                    }
                }
                con.Close();
            }

            markers += "];";
            ViewBag.Markers = markers;
            return View(lstGPS);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}