using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GetConnection;
using System.Data.SqlClient;
using System.Data;
public partial class student_home : System.Web.UI.Page
{
    SqlConnection con = GetConnection.Class1.getConnected();
    int msg_count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        /* Check For Inbox */
        try
        {
            con.Open();
            /*Check for My User ID*/
            SqlDataAdapter da1 = new System.Data.SqlClient.SqlDataAdapter("select userID from user_info where First_Name = '"+Session["user"].ToString()+"'", con);
            
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            //Response.Write("<script>alert('"+ds1.Tables[0].Rows[0][0]+"');</script>");

            /*Check for My User ID in Messages Table */
            SqlDataAdapter da2 = new System.Data.SqlClient.SqlDataAdapter("select * from messages where to_userID = '" + ds1.Tables[0].Rows[0][0] + "'", con);

            DataSet ds2 = new DataSet();
            da2.Fill(ds2);

             msg_count = ds2.Tables[0].Rows.Count;
            //Response.Write(message_count);
            Session.Add("message_count", msg_count);
        }
        catch (Exception ee) { }


        if (User.Identity.IsAuthenticated) // if the user is already logged in
        {
            Response.Redirect("AccessDenied.aspx");
        }


        if (!IsPostBack)                 //if page is not refreshed
        {

            SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter("select * from user_info", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            
            for (int row = 0; row < ds.Tables[0].Rows.Count; row++)
            {
                /*If the option is itself User then do not display*/
                if (ds.Tables[0].Rows[row]["First_Name"].ToString().Equals(Session["user"].ToString()))
                { }
                else
                {
                    Users.Items.Add(new ListItem(ds.Tables[0].Rows[row]["First_Name"].ToString()));
                }
            }

           

        }
    }
    protected void logout_button(object sender, EventArgs e)
    {
        //Response.Write("<script>alert('logout')</script>");
        Session.Clear();     //Clearing the Session or kicking the user out. X-D
        Response.Redirect("index.aspx");
    }

    protected void send_msg_Click(object sender, EventArgs e)
    {
        string to_user = Users.Text;            //To whom the message may go
        string msg = message.Text;              //the message
        
        try
        {
            //con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO messages(from_userID,to_userID,message,date_n_time) values((SELECT userID from user_info WHERE User_Name='" + Session["user"].ToString() + "'),(SELECT userID from user_info WHERE User_Name='" + to_user + "'),'" + msg + "','" + DateTime.Now + "')", con);
            //Response.Write("INSERT INTO messages(from_userID,to_userID,message,date_n_time) values((SELECT userID from user_info WHERE User_Name='" + Session["user"].ToString() + "'),(SELECT userID from user_info WHERE User_Name='" + to_user + "'),'" + msg + "','" + DateTime.Now + "')");
            //Response.Write(cmd.ExecuteNonQuery());
            if (cmd.ExecuteNonQuery() > 0)
            {
                //Response.Write("<script>alert('Sent');</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Message Sent !!!')", true);
            }
            else
                Response.Write("<script>alert('Not Sent');</script>");

        }
        catch (Exception ee) { Response.Write("<script>alert('Not Sent Exception');</script>"); }

    }
}