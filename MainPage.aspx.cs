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

public partial class View_n_Share : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        postback();
    }
    private void postback()
    {
        string sqlmain = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        SqlConnection con = new SqlConnection(sqlmain);

        con.Open();

        string view = "select * from ImageData where UserName = " + Session["Username"].ToString();

        SqlCommand com = new SqlCommand(view, con);
        SqlDataAdapter info = new SqlDataAdapter(com);
        info.SelectCommand = com;
        DataTable ds = new DataTable();
        info.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();

        con.Close();
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton download = sender as LinkButton;
        GridViewRow gridrow = download.NamingContainer as GridViewRow;
        string downloadimage = GridView1.DataKeys[gridrow.RowIndex].Value.ToString();
        Response.ContentType = "application/octect-stream";
        Response.AddHeader("Content-Disposition", "filename=\"" + downloadimage + "\"");
        Response.TransmitFile(Server.MapPath(downloadimage));
        Response.End();

    
    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        
        LinkButton delete = sender as LinkButton;
        GridViewRow deleterow = delete.NamingContainer as GridViewRow;

        
        string deleteimage = GridView1.DataKeys[deleterow.RowIndex].Value.ToString();

        string sqlmain1 = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        SqlConnection constr = new SqlConnection(sqlmain1);
        constr.Open();
        SqlCommand com = new SqlCommand("delete from ImageData where ImagePath = '"+ deleteimage + "'",constr);
        File.Delete(Server.MapPath(deleteimage));
        com.ExecuteNonQuery();

        Response.Write("Image and its Metadata is deleted successfully!");
        constr.Close();

        postback();
    }



    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        LinkButton property = sender as LinkButton;
        GridViewRow propertyrow = property.NamingContainer as GridViewRow;


        string propertyimage = GridView1.DataKeys[propertyrow.RowIndex].Value.ToString();

        string sqlmain1 = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        SqlConnection constr = new SqlConnection(sqlmain1);
        constr.Open();
        SqlCommand com = new SqlCommand("select * from ImageData where ImagePath = '" + propertyimage + "'", constr);

        SqlDataAdapter prop = new SqlDataAdapter(com);
        prop.SelectCommand = com;
        DataTable ds = new DataTable();
        prop.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
       
        constr.Close();

        Response.Redirect("UserMetaData.aspx");
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        //this method is used to share images.
        string imageshared = "SharedImage.jpg";
        LinkButton share = sender as LinkButton;
        GridViewRow sharerow = share.NamingContainer as GridViewRow;


        string shareimage = GridView1.DataKeys[sharerow.RowIndex].Value.ToString();

        string sqlmain1 = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        SqlConnection constr = new SqlConnection(sqlmain1);

        constr.Open();

        string sqlimg = "update ImageData set SharedImage = @shared where ImagePath = '"+shareimage+ "'";
        SqlCommand com = new SqlCommand(sqlimg, constr);

        com.Parameters.AddWithValue("@shared",imageshared);
        com.ExecuteNonQuery();

        Response.Write("Image and it path is shared successfully!");

        constr.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SharedImages.aspx");
    }
}