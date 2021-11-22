using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.DataAccess;
using System.Configuration;
using System.IO;

public partial class UserMetaData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         try { 
        string sqlmain = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        SqlConnection con = new SqlConnection(sqlmain);

        con.Open();

        string view = "select * from ImageData where UserName = " + Session["Username"].ToString();

        SqlCommand com = new SqlCommand(view, con);
        SqlDataAdapter info = new SqlDataAdapter(com);
        info.SelectCommand = com;
        DataTable ds = new DataTable();
        info.Fill(ds);
        con.Close();
    } 
        catch(SqlException error)
        {
            Response.Write(error.Message);
        }
    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            string sqlmain1 = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
            SqlConnection constr = new SqlConnection(sqlmain1);

            constr.Open();

            string sqlimg = "update ImageData set ImageName = @image where ImageID = @id";
            SqlCommand com = new SqlCommand(sqlimg, constr);

            com.Parameters.AddWithValue("@id", ImageIdtxt.Text);
            com.Parameters.AddWithValue("@image", Txtusername.Text);

            com.ExecuteNonQuery();

            Response.Write("Image and it path is updated successfully!");


            constr.Close();
        }
        catch (SqlException error)
        {
            Response.Write(error.Message);
        }

    }
}