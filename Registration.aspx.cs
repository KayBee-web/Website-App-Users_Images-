﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // used to check if the user exist already or not.
        if (IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();
            string checkuser = "select count(*) from UserData where UserName = '" + Usernametxt.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (temp == 1)
            {
                Response.Write("User already exist!");
            }

            con.Close();
        }

        }

        protected void Button1_Click(object sender, EventArgs e)
    {
        
        
        Guid newguid = Guid.NewGuid();   //generate values automatically.

        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();

            string register = "insert into UserData(ID,UserName,Email,Password) values(@id,@username,@email,@pass)";
            SqlCommand com = new SqlCommand(register, con);

            com.Parameters.AddWithValue("@id", newguid.ToString());
            com.Parameters.AddWithValue("@username", Usernametxt.Text);
            com.Parameters.AddWithValue("@email", Emailtxt.Text);
            com.Parameters.AddWithValue("@pass", Passwordtxt.Text);

            com.ExecuteNonQuery();

            Response.Redirect("Log_In.aspx");
            Response.Write("registration successful!");


            con.Close();

        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex.ToString());
        }

    }
}