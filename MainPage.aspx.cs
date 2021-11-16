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

        GridView1.Visible = false;
        DropDownList1.Focus();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlmain = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        SqlConnection con = new SqlConnection(sqlmain);

        con.Open();

        string view = "select * from ImageData";

        SqlCommand com = new SqlCommand(view, con);
        SqlDataAdapter info = new SqlDataAdapter(com);
        info.SelectCommand = com;
        DataTable ds = new DataTable();
        info.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        GridView1.Visible = true;
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
        
    }


}