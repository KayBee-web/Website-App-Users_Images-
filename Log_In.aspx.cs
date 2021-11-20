using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Log_In : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        usernametxt.Focus();
    }

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    public string Decryption(string encrstring)
    {
        byte[] b;
        string decrypted;
        try
        {
            b = Convert.FromBase64String(encrstring);
            decrypted = System.Text.ASCIIEncoding.ASCII.GetString(b);
        }
        catch(FormatException message)
        {
            decrypted = "";
        }
        return decrypted;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["Username"] = usernametxt.Text;
        con.Open();
        string checkuser = "select count(*) from UserData where UserName = '" + usernametxt.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        con.Close();

        if (temp == 1)
        {
            con.Open();
            string checkpassword = "select Password from UserData where UserName = '" + usernametxt.Text + "'";
            SqlCommand passcom = new SqlCommand(checkpassword, con);
            string password = passcom.ExecuteScalar().ToString().Replace(" ", "");

            if (Decryption(password) == passwordtxt.Text)
            {
                Response.Redirect("UserImages.aspx");
                Response.Write("password is correct!");
                
            }
            else
            {
                Response.Write("incorrect password!");
            }
            con.Close();
        }
        else
        {
            Response.Write("Username not found!");
            usernametxt.Text = "";
        }

    }

    
}