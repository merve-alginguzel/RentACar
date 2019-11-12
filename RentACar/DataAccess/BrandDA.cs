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
    public class BrandDA
    {

        public List<BrandDM> getBrandList()
        {
            List<BrandDM> brandList = new List<BrandDM>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_getBrands";
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                BrandDM bdm = new BrandDM();
                bdm.ID = Convert.ToInt32(dr["ID"]);
                bdm.BrandName = dr["Name"].ToString();
                brandList.Add(bdm);
            }

            dr.Close();
            utility.endC();
            return brandList;
        }

        public List<BrandModel> getModelList(string ID)
        {

            int ModelID = Convert.ToInt32(ID);
            List<BrandModel> modelList = new List<BrandModel>();
            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_getBrandModel";
            utility.cmd.Parameters.Add("BrandID", ModelID);
            utility.cmd.ExecuteScalar();
            SqlDataReader dr = utility.cmd.ExecuteReader();

            while (dr.Read())
            {
                BrandModel bdm = new BrandModel();
                bdm.ID = Convert.ToInt32(dr["ID"]);
                bdm.ModelName = dr["Name"].ToString();
                modelList.Add(bdm);
            }

            dr.Close();
            utility.endC();
            return modelList;
        }

    }
}
