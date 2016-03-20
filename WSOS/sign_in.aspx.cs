using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using GetConnection;
using System.Data;
public partial class sign_in : System.Web.UI.Page
{
    Class1 newConnection = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }
    protected void login_Click(object sender, EventArgs e)
    {
        try
        {
            /*Get Connection*/
            SqlConnection con = GetConnection.Class1.getConnected();
            /*Take User Inputs*/
            string username = String.Format("{0}", Request.Form["username"]);        //take UserName from User
            string password = String.Format("{0}", Request.Form["password"]);        //take Password from User
            con.Open();                                                              //make connection Open

            //Response.Write("SELECT Roles FROM login_user1 WHERE Username='" + username + "' && Password='" + password + "'");
            SqlDataAdapter da = new SqlDataAdapter("SELECT Roles FROM login_users1 WHERE Username='" + username + "' AND Password=CONVERT(VARCHAR(32), HashBytes('MD5','" + password + "'),2)", con);

            //DataSet represents a complete set of data that includes tables
            DataSet ds = new DataSet();
            //The Fill method of the DataAdapter is used to populate a DataSet with the results of the SelectCommand of the DataAdapter
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script>alert('Check Your Username and Password Again');</script>");
            }
            else 
            { 
                Response.Write("<script>alert('Successfull !! Role is "+ds.Tables[0].Rows[0]["Roles"]+"');</script>"); 
            }
        }
        catch (Exception ee) { Response.Write(ee.StackTrace); }
    }
}