using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GetConnection;
using System.Data.SqlClient;
using System.Data;

public partial class inbox : System.Web.UI.Page
{
    SqlConnection con = GetConnection.Class1.getConnected();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            /*Check for My User ID*/
            SqlDataAdapter da1 = new SqlDataAdapter("select userID from user_info where First_Name = '" + Session["user"].ToString() + "'", con);

            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            //Response.Write("<script>alert('"+ds1.Tables[0].Rows[0][0]+"');</script>");

            /*Check for My User ID in Messages Table */
            SqlDataAdapter da2 = new SqlDataAdapter("select from_userID,message from messages where to_userID = '" + ds1.Tables[0].Rows[0][0] + "'", con);

            int my_user_id = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);

            if (ds2.Tables[0].Rows.Count > 0)
            {
                //Response.Write("<script>alert('Kuch to hua !!!');</script>");
                SqlDataAdapter da3 = new SqlDataAdapter("select First_Name from user_info where userID = 1", con);
                //Response.Write("select First_Name from user_info where userID = (select from_userID from messages where to_userID=" + ds1.Tables[0].Rows[0][0] + ")");
                DataSet ds3 = new DataSet();
                da3.Fill(ds3);
                Session.Add("from_user", ds3.Tables[0].Rows[0][0].ToString());
                //Response.Write(ds3.Tables[0].Rows[0][0].ToString());

                SqlDataAdapter da4 = new SqlDataAdapter("select * from messages where from_userID = 1", con);
                DataSet ds4 = new DataSet();
                da4.Fill(ds4);
                Session.Add("msg", ds4.Tables[0].Rows[0][3].ToString());
                Session.Add("date_n_time", ds4.Tables[0].Rows[0][4].ToString());
            }
            else
                Response.Write("Kuch nahi hua !!!");
            //if (ds2.Tables[0].Rows.Count > 0)
            //{

            //}

        }
        catch (Exception ee) { }

    }
    protected void logout_button(object sender, EventArgs e)
    {
        //Response.Write("<script>alert('logout')</script>");
        Session.Clear();     //Clearing the Session or kicking the user out. X-D
        Response.Redirect("index.aspx");
    }
}