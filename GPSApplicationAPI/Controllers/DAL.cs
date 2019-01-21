using GPSApplicationAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GPSApplicationAPI.Controllers
{
    public class DAL
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        public DAL()
        {
            ds = new DataSet();
        }

        public rspUser login(Users users)
        {

            //Create the procedure

//            create procedure login
//(@username nvarchar(50), @password nvarchar(50))
//as
//begin

//SELECT[ID]
//      ,[FirstName]
//      ,[LastName]
//      ,[Email]
//      ,[Mobile]
//      ,[UserName]
//      ,[Password]
//      ,[IsActive]
//      ,[CreatedOn]
//      ,[LastModified]
//      ,[OTP]
//        FROM[VT_Users] where UserName = @username and[Password] = @password and IsActive = 'true'



//end

            using (con = new SqlConnection(""))
            {
                rspUser _rspUser = new rspUser();
                List<Users> lstusers = new List<Users>();

                try
                {
                    string query = "";
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("username", users.UserName);
                    cmd.Parameters.AddWithValue("password", users.Password);
                    cmd.CommandType = CommandType.StoredProcedure;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds.Tables["Users"]);
                    con.Close();
                    
                    if(ds.Tables.Count > 0)
                        if(ds.Tables["Users"].Rows.Count > 0)
                        {
                            var user = ds.Tables[0].AsEnumerable().Select(dataRow => new Users { ID = dataRow.Field<int>("ID"), FirstName = dataRow.Field<string>("FirstName"),LastName = dataRow.Field<string>("FirstName"),Email = dataRow.Field<string>("Email"),Mobile = dataRow.Field<string>("Mobile") }).ToList();
                            _rspUser.Status = 1;
                            _rspUser.Message = "Logged In Successfully";
                            _rspUser.Users = user;
                            return _rspUser;
                        }

                    _rspUser.Status = 0;
                    _rspUser.Message = "Username or Password is Wrong";
                    _rspUser.Users = null;
                    return _rspUser;

                }
                catch(Exception ex)
                {
                    _rspUser.Status = 0;
                    _rspUser.Message = "Username or Password is Wrong";
                    _rspUser.Users = null;
                    return _rspUser;
                }
            }
        }

        public rspVehicle vehiclelist(Users users)
        {

            //Create the procedure

//            create procedure vehiclelist
//            (@userid int)
//            as
//            begin

//SELECT[ID]
//      ,[VehicleName]
//      ,[RegistrationNumber]
//      ,[InsuranceDate]
//      ,[FCDate]
//      ,[MileagePerLitre]
//      ,[Model]
//      ,[Year]
//      ,[Color]
//      ,[IMEI]
//      ,[SIMNumber]
//      ,[Operator]
//      ,[UserID]
//      ,[Isenabled]
//        FROM[VT_Vehicle] where UserID = @userid and Isenabled = 'true'


//end

            using (con = new SqlConnection(""))
            {
                rspVehicle _vehicle = new rspVehicle();
                List<Users> lstusers = new List<Users>();

                try
                {
                    string query = "";
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("userid", users.ID);
                    cmd.CommandType = CommandType.StoredProcedure;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds.Tables["Users"]);
                    con.Close();

                    if (ds.Tables.Count > 0)
                        if (ds.Tables["Users"].Rows.Count > 0)
                        {
                            var vehicle = ds.Tables[0].AsEnumerable().Select(dataRow => new Vehicle { ID = dataRow.Field<int>("ID"), VehicleName = dataRow.Field<string>("VehicleName")}).ToList();
                            _vehicle.Status = 1;
                            _vehicle.Message = "Vehicle List Found";
                            _vehicle.Vehicle = vehicle;
                            return _vehicle;
                        }

                    _vehicle.Status = 1;
                    _vehicle.Message = "No Vehicles Found";
                    _vehicle.Vehicle = null;
                    return _vehicle;

                }
                catch (Exception ex)
                {
                    _vehicle.Status = 1;
                    _vehicle.Message = "No Vehicles Found";
                    _vehicle.Vehicle = null;
                    return _vehicle;
                }
            }
        }

        public rspLocation getlocationall(Users users)
        {

//           1. Create a View
//                SELECT dbo.VT_LocationHistory.ID, dbo.VT_LocationHistory.ReceivedOn, dbo.VT_LocationHistory.Latitude, dbo.VT_LocationHistory.Longitude, dbo.VT_LocationHistory.ModemId, 
//                      dbo.VT_LocationHistory.distance, dbo.VT_LocationHistory.Currenttime, dbo.VT_LocationHistory.Ignition, dbo.VT_LocationHistory.Speed, dbo.VT_LocationHistory.Movement, 
//                      dbo.VT_LocationHistory.OdometerKm, dbo.VT_LocationHistory.VehicleId, dbo.VT_Users.ID AS UserID
//FROM         dbo.VT_Vehicle INNER JOIN
//                      dbo.VT_Users ON dbo.VT_Vehicle.UserID = dbo.VT_Users.ID LEFT OUTER JOIN
//                      dbo.VT_LocationHistory ON dbo.VT_Vehicle.ID = dbo.VT_LocationHistory.VehicleId
//                2. Create a Procedure
//                create procedure getlocationall
//(@userid int)
//as
//begin

//SELECT tt.*
//FROM View_GetLocationAll tt
//INNER JOIN
//    (SELECT VehicleId, MAX(ID) AS MID
//    FROM View_GetLocationAll
//    GROUP BY VehicleId) groupedtt
//ON tt.VehicleId = groupedtt.VehicleId
//AND tt.ID = groupedtt.MID AND tt.UserID = @userid

//end

            using (con = new SqlConnection("conn"))
            {
                rspLocation _location = new rspLocation();
                List<Users> lstusers = new List<Users>();

                try
                {
                    string query = "getlocationall";
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("userid", users.ID);
                    
                    cmd.CommandType = CommandType.StoredProcedure;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds.Tables["Users"]);
                    con.Close();

                    if (ds.Tables.Count > 0)
                        if (ds.Tables["Users"].Rows.Count > 0)
                        {
                            var location = ds.Tables[0].AsEnumerable().Select(dataRow => new LocationHistory { ID = dataRow.Field<int>("ID"), VehicleId = dataRow.Field<int>("VehicleId"), ReceivedOn = dataRow.Field<DateTime>("ReceivedOn"), Latitude = dataRow.Field<string>("Latitude"), Longitude = dataRow.Field<string>("Longitude"), distance = dataRow.Field<float>("distance"), Speed = dataRow.Field<string>("Speed"), Ignition = dataRow.Field<string>("Ignition"), Movement = dataRow.Field<string>("Movement") }).ToList();
                            _location.Status = 1;
                            _location.Message = "Locations are Listed";
                            _location.LocationHistory = location;
                            return _location;
                        }

                    _location.Status = 0;
                    _location.Message = "No Locations Found";
                    _location.LocationHistory = null;
                    return _location;

                }
                catch (Exception ex)
                {
                    _location.Status = 0;
                    _location.Message = "No Locations Found";
                    _location.LocationHistory = null;
                    return _location;
                }
            }
        }

        public rspLocation getlocationbyvehicle(Vehicle vehicle)
        {


//            1.Create Procedure
//                create procedure getlocationbyvehicle
//(@vehicleid int)
//as
//begin

//SELECT tt.*
//FROM View_GetLocationAll tt
//INNER JOIN
//    (SELECT VehicleId, MAX(ID) AS MID
//    FROM View_GetLocationAll
//    GROUP BY VehicleId) groupedtt
//ON tt.VehicleId = groupedtt.VehicleId
//AND tt.ID = groupedtt.MID AND tt.VehicleId = @vehicleid

//end

            using (con = new SqlConnection("conn"))
            {
                rspLocation _location = new rspLocation();
                List<Users> lstusers = new List<Users>();

                try
                {
                    string query = "getlocationbyvehicle";
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("vehicleid", vehicle.ID);

                    cmd.CommandType = CommandType.StoredProcedure;
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds.Tables["Location"]);
                    con.Close();

                    if (ds.Tables.Count > 0)
                        if (ds.Tables["Users"].Rows.Count > 0)
                        {
                            var location = ds.Tables[0].AsEnumerable().Select(dataRow => new LocationHistory { ID = dataRow.Field<int>("ID"), VehicleId = dataRow.Field<int>("VehicleId"), ReceivedOn = dataRow.Field<DateTime>("ReceivedOn"), Latitude = dataRow.Field<string>("Latitude"), Longitude = dataRow.Field<string>("Longitude"), distance = dataRow.Field<float>("distance"), Speed = dataRow.Field<string>("Speed"), Ignition = dataRow.Field<string>("Ignition"), Movement = dataRow.Field<string>("Movement") }).ToList();
                            _location.Status = 1;
                            _location.Message = "Locations are Listed";
                            _location.LocationHistory = location;
                            return _location;
                        }

                    _location.Status = 0;
                    _location.Message = "No Locations Found";
                    _location.LocationHistory = null;
                    return _location;

                }
                catch (Exception ex)
                {
                    _location.Status = 0;
                    _location.Message = "No Locations Found";
                    _location.LocationHistory = null;
                    return _location;
                }
            }
        }

    }
}