using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataConnection
{
    public class DBUtilities
    {
        private SqlConnection _cn;
        private SqlCommand _cmd;
        private SqlDataAdapter _adp;
        public string conStrSql { get { return "Data Source=DESKTOP-U9NBOQE;Initial Catalog=RentACar; Integrated Security=SSPI"; } }
        public SqlCommand cmd { get { return _cmd; } }
        public SqlDataAdapter adp { get { return _adp; } }
        public SqlConnection cn { get { return _cn; } }
        public DBUtilities()
        {
            _cn = new SqlConnection(conStrSql);
            _cmd = new SqlCommand();
            _cmd.CommandType = System.Data.CommandType.StoredProcedure;
            _cmd.Connection = _cn;

        }

        /// </summary>
        public void endC()
        {
            this.cn.Close();
            this.cmd.Parameters.Clear();
            this.cmd.Dispose();
            this.cn.Dispose();
        }
    }
}
