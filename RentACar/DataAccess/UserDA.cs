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
    public class UserDA
    {
        public UserDM LoginControl(string Username, string Password)
        {

            UserDM udt = new UserDM();

            DBUtilities utility = new DBUtilities();
            utility.cn.Open();
            utility.cmd.CommandText = "sp_Login";
            utility.cmd.Parameters.Add("Username", Username);
            utility.cmd.Parameters.Add("Password", Password);
            SqlDataReader dr = utility.cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr["Username"].ToString().Trim() == Username && dr["Password"].ToString().Trim() == Password)
                {
                    udt.Username = dr["Username"].ToString().Trim();
                    udt.Password = dr["Password"].ToString().Trim();
                }


            }

            

            dr.Close();
            utility.endC();
            return udt;
        }
    }
}
