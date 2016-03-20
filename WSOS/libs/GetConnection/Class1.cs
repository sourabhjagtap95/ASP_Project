using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

// Used to Get Connection To Database

namespace GetConnection
{
    public class Class1
    {
        public static SqlConnection getConnected()
        {
            SqlConnection conn = new SqlConnection("server=SOURABH\\MYSQLSERVER;initial catalog=aspweb;integrated security=true");
            return conn;
        }
    }
}
