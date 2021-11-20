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

public partial class SharedImages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlmain1 = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        SqlConnection con1 = new SqlConnection(sqlmain1);

        con1.Open();

        string view = "select count(*) from ImageData where SharedImage is not null";

        SqlCommand com = new SqlCommand(view, con1);
        SqlDataAdapter info = new SqlDataAdapter(com);
        info.SelectCommand = com;
        DataTable ds = new DataTable();
        info.Fill(ds);
        con1.Close();
    }

}