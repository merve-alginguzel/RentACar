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
    public class CustomerDA
    {

        public void AddCustomer(CustomerDM customer)
        {
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_InsertCustomer";

            utility.cmd.Parameters.Add("Name", customer.Name);
            utility.cmd.Parameters.Add("Surname", customer.Surname);
            utility.cmd.Parameters.Add("Title", customer.Title);
            utility.cmd.Parameters.Add("Gender", customer.Gender);
            utility.cmd.Parameters.Add("DateOfBirth", customer.DateOfBirth);
            utility.cmd.Parameters.Add("TCNo", customer.TCNo);
            utility.cmd.Parameters.Add("TaxNo", customer.TaxNo);
            utility.cmd.Parameters.Add("TaxAdministration", customer.TaxAdministration);
            utility.cmd.Parameters.Add("City", customer.City);
            utility.cmd.Parameters.Add("Town", customer.Town);
            utility.cmd.Parameters.Add("Address", customer.Address);
            utility.cmd.Parameters.Add("HomePhone", customer.HomePhone);
            utility.cmd.Parameters.Add("BusinessPhone", customer.BusinessPhone);
            utility.cmd.Parameters.Add("CepPhone", customer.CepPhone);
            utility.cmd.ExecuteScalar();

            utility.endC();
        }

        public List<CustomerDM> getCustomerList()
        {
            List<CustomerDM> customerList = new List<CustomerDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_getCustomer";
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                CustomerDM cdm = new CustomerDM();
                cdm.ID = Convert.ToInt32(dr["ID"]);
                cdm.Name = dr["Name"].ToString();
                cdm.Surname = dr["Surname"].ToString();
                customerList.Add(cdm);
            }

            dr.Close();
            utility.endC();
            return customerList;
        }


        public List<CityDM> getCityList()
        {
            List<CityDM> cityList = new List<CityDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_getCity";
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                CityDM bdm = new CityDM();
                bdm.ID = Convert.ToInt32(dr["ID"]);
                bdm.CityName = dr["Name"].ToString();
                cityList.Add(bdm);
            }

            dr.Close();
            utility.endC();
            return cityList;
        }

        public List<Town> getTownList(string ID)
        {

            int CityID = Convert.ToInt32(ID);
            List<Town> modelList = new List<Town>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_getTown";
            utility.cmd.Parameters.Add("CityID", CityID);
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                Town tdm = new Town();
                tdm.ID = Convert.ToInt32(dr["ID"]);
                tdm.TownName = dr["Name"].ToString();
                modelList.Add(tdm);
            }

            dr.Close();
            utility.endC();
            return modelList;
        }
    }
}
