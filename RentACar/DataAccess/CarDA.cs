using DataConnection;
using DataModel;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class CarDA
    {

        public void AddCar(CarDM car)
        {
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_InsertCar";

            utility.cmd.Parameters.Add("brand", car.brand);
            utility.cmd.Parameters.Add("model", car.model);
            utility.cmd.Parameters.Add("model_year", car.model_year);
            utility.cmd.Parameters.Add("LicensePlate", car.licensePlate);
            utility.cmd.Parameters.Add("ChassisNumber", car.chassisNumber);
            utility.cmd.Parameters.Add("color", car.color);
            utility.cmd.Parameters.Add("type", car.type);
            utility.cmd.Parameters.Add("amount", car.amount);
            utility.cmd.Parameters.Add("amountType", car.amountType);
            utility.cmd.Parameters.Add("status", car.status);
            utility.cmd.ExecuteScalar();

            utility.endC();
        }

        public List<CarDM> getCarList()
        {
            List<CarDM> carList = new List<CarDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_getCar";
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                CarDM cdm = new CarDM();
                cdm.ID = Convert.ToInt32(dr["ID"]);
                cdm.brand = dr["BrandName"].ToString();
                cdm.model = dr["ModelName"].ToString();
                cdm.licensePlate = dr["LicensePlate"].ToString();
                cdm.chassisNumber = dr["ChassisNumber"].ToString();
                cdm.color = dr["Color"].ToString();
                cdm.amount = dr["Amount"].ToString();
                carList.Add(cdm);
            }

            dr.Close();
            utility.endC();
            return carList;
        }

        public List<CarDM> getByDateCarList(DateTime StartDate, DateTime EndDate)
        {
            List<CarDM> carList = new List<CarDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_getByDateCar";
            utility.cmd.Parameters.Add("StartDate", StartDate);
            utility.cmd.Parameters.Add("EndDate", EndDate);
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                CarDM cdm = new CarDM();
                cdm.ID = Convert.ToInt32(dr["ID"]);
                cdm.licensePlate = dr["LicensePlate"].ToString();
                cdm.chassisNumber = dr["ChassisNumber"].ToString();
                cdm.amount = dr["ToplamTutar"].ToString();
                cdm.color = dr["Color"].ToString();
                carList.Add(cdm);
            }

            dr.Close();
            utility.endC();
            return carList;
        }


        
        public List<CarDM> popCar()
        {
            List<CarDM> carList = new List<CarDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_popCar";
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                CarDM cdm = new CarDM();
                cdm.ID = Convert.ToInt32(dr["ID"]);
                cdm.licensePlate = dr["LicensePlate"].ToString();
                cdm.chassisNumber = dr["ChassisNumber"].ToString();
                cdm.color = dr["Color"].ToString();
                cdm.amount= dr["Amount"].ToString();
                cdm.brand= dr["BrandName"].ToString();
                cdm.model= dr["ModelName"].ToString();
                cdm.status= dr["Status"].ToString();
                cdm.model_year = dr["ModelYear"].ToString();
                carList.Add(cdm);
            }

            dr.Close();
            utility.endC();
            return carList;
        }
    }
}
