using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class create_account : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("server=SOURABH\\MYSQLSERVER;initial catalog=aspweb;integrated security=true");
    protected void Page_Load(object sender, EventArgs e)
    {
        area_hidden.Visible = false;
    }

    /*When User Clicks On Verify Button*/
    protected void verify_Click(object sender, EventArgs e)
    {
        string prn_no = txt_prn.Text.ToString();            //Take PRN Number From Students
        try
        {
            conn.Open();                                        //made Connection open
            //Response.Write("SELECT * FROM user_info WHERE PRN='" + prn_no + "'");
            /*Check For PRN if its existing in Database*/
            SqlCommand c = new SqlCommand("SELECT * FROM user_info WHERE PRN='" + prn_no + "'", conn);
            SqlDataReader r = c.ExecuteReader();
            if (r.Read())
            {
                Response.Write("<script>alert('PRN number already existing ! Please Go To Login Page')</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select PRN from PRN_Table where PRN='" + prn_no + "'", conn);  //check PRN number at Database
                SqlDataReader rd = cmd.ExecuteReader();             //execute command 
                /*  If PRN Number is Right  Make Panel Visible  */
                if (rd.Read())
                {
                    area_hidden.Visible = true;                     //Panel is Visible           
                    submit.Enabled = true;

                }

                /*PRN Number is Wrong*/
                else
                {
                    Response.Write("<script>alert('Check Your PRN again !');</script>");
                }
            }
            conn.Close();
        }
        catch (Exception ee)
        {
            Response.Write(ee.StackTrace);
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();
            string firstname = String.Format("{0}", Request.Form["firstname"]);
            string lastname = String.Format("{0}", Request.Form["lastname"]);
            string username = String.Format("{0}", Request.Form["username"]);
            string password = String.Format("{0}", Request.Form["password"]);
            string date = String.Format("{0}", Request.Form["date"]);
            string month = String.Format("{0}", Request.Form["month"]);
            string year = String.Format("{0}", Request.Form["year"]);
            string classyear = String.Format("{0}", Request.Form["classyear"]);
            string division = String.Format("{0}", Request.Form["division"]);
            string rollno = String.Format("{0}", Request.Form["rollno"]);
            string email = String.Format("{0}", Request.Form["email"]);
            string mobile = String.Format("{0}", Request.Form["mobile"]);
            string address = String.Format("{0}", Request.Form["address"]);
            //Response.Write("INSERT INTO user_info(First_Name,Last_Name,User_Name,DOB,Year,Division,Roll_No,Email_ID,Mobile,Address) values('" + firstname + "','" + lastname + "','" + username + "','" + date + month + year + "','" + classyear + "','" + division + "','" + rollno + "','" + email + "'," + mobile + ",'" + address + "')");
            //Response.Write("INSERT INTO login_users1(userID,Username,Password,Email_ID) values((SELECT userID from user_info WHERE USER_NAME='" + username + "' ),'" + username + "',CONVERT(VARCHAR(32), HashBytes('MD5', '" + password + "'), 2),'" + email + "')");

            /*Check For User Name Existing in Database*/
            SqlCommand cmd0 = new SqlCommand("SELECT * FROM user_info WHERE User_Name='" + username + "'", conn);
            SqlDataReader rd = cmd0.ExecuteReader();
            if (rd.Read())
            {
                Response.Write("<script>alert('User Name Already Taken ! Please Take another')</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO user_info(First_Name,Last_Name,User_Name,DOB,Year,Division,Roll_No,Email_ID,Mobile,Address) values('" + firstname + "','" + lastname + "','" + username + "','" + date + month + year + "','" + classyear + "','" + division + "','" + rollno + "','" + email + "'," + mobile + ",'" + address + "')", conn);
                //SqlDataAdapter cmd = new SqlDataAdapter("INSERT INTO user_table values('" + firstname + "','" + lastname + "','" + username + "','" + date + month + year + "','" + classyear + "','" + division + "','" + rollno + "','" + email + "'," + mobile + ",'" + address + "')",conn)

                /*Data Inserted*/
                if (cmd.ExecuteNonQuery() != 0)
                {
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO login_users1(userID,Username,Password,Email_ID) values((SELECT userID from user_info WHERE USER_NAME='" + username + "' ),'" + username + "',CONVERT(VARCHAR(32), HashBytes('MD5', '" + password + "'), 2),'" + email + "')", conn);
                    if (cmd1.ExecuteNonQuery() != 0)
                        Response.Write("<script>alert('Yeah !! Data Inserted !!')</script>");
                    else
                        Response.Write("<script>alert('Data Inserted only in user_info!!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Nuhhh !! Data Not Inserted !!')</script>");
                }
            }
        }
        catch (Exception ee) { Response.Write(ee.StackTrace); }
    }
}