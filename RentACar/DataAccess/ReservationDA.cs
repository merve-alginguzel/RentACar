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
    public class ReservationDA
    {

        public void AddReservation(ReservationDM reservation)
        {
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_InsertReservation";

            utility.cmd.Parameters.Add("Date", reservation.Date);
            utility.cmd.Parameters.Add("Day", reservation.Day);
            utility.cmd.Parameters.Add("EndDate", reservation.EndDate);
            utility.cmd.Parameters.Add("Amount", reservation.Amount);
            utility.cmd.Parameters.Add("Customer", reservation.Customer);
            utility.cmd.Parameters.Add("Car", reservation.Car);
            utility.cmd.ExecuteScalar();

            utility.endC();
        }

        public List<ReservationDM> GetReservationList()
        {
            List<ReservationDM> reservationList = new List<ReservationDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_getReservation";
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                ReservationDM cdm = new ReservationDM();
                cdm.ID = Convert.ToInt32(dr["ID"]);
                cdm.Day = Convert.ToInt32(dr["Day"]);
                cdm.Date = Convert.ToDateTime(dr["Date"]);
                cdm.EndDate = Convert.ToDateTime(dr["EndDate"]);
                cdm.Amount= Convert.ToInt32(dr["Amount"]);
                reservationList.Add(cdm);
            }

            dr.Close();
            utility.endC();
            return reservationList;
        }


        public List<CarDM> getStatusControlCar(int ID,DateTime StartDate,DateTime EndDate)
        {
            List<CarDM> carList = new List<CarDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_StatusControl";
            utility.cmd.Parameters.Add("CarID", ID);
            utility.cmd.Parameters.Add("StartDate", StartDate);
            utility.cmd.Parameters.Add("EndDate", EndDate);
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                CarDM cdm = new CarDM();
                cdm.ID = Convert.ToInt32(dr["ID"]);
                cdm.status = dr["Status"].ToString();
                carList.Add(cdm);
            }

            dr.Close();
            utility.endC();
            return carList;
        }

        
        public List<ReservationDM> ReservationDetail(int ID)
        {
            List<ReservationDM> carList = new List<ReservationDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_ReservationDetail";
            utility.cmd.Parameters.Add("ID", ID);
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                ReservationDM cdm = new ReservationDM();
                cdm.ID = Convert.ToInt32(dr["ID"]);
                cdm.Date = Convert.ToDateTime(dr["Date"]);
                cdm.EndDate = Convert.ToDateTime(dr["EndDate"]);
                cdm.Amount = Convert.ToInt32(dr["Amount"]);
                cdm.CustomerName = dr["CustomerName"].ToString();
                cdm.CustomerSurname = dr["CustomerSurname"].ToString();
                cdm.CustomerPhone = dr["CustomerPhone"].ToString();
                cdm.LicensePlate = dr["LicensePlate"].ToString();
                cdm.ChassisNumber = dr["ChassisNumber"].ToString();
                cdm.Marka = dr["BrandName"].ToString();
                carList.Add(cdm);
            }

            dr.Close();
            utility.endC();
            return carList;
        }

        

        public void DeleteReservation(int ID)
        {
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_DeleteReservation";
            utility.cmd.Parameters.Add("ID", ID);
            utility.cmd.ExecuteScalar();
            utility.endC();
        }

    }
}
