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

public partial class UserImages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
    string date = DateTime.Now.ToString();
         if (UpLoadImage.HasFile )
         {
            string imageextension = System.IO.Path.GetExtension(UpLoadImage.FileName);
            if(imageextension.ToLower() == ".jpg" || imageextension.ToLower() == ".bmp" || imageextension.ToLower() == ".gif" || imageextension.ToLower() == ".png")
            {
                string savedimage = UpLoadImage.FileName;
                UpLoadImage.PostedFile.SaveAs(Server.MapPath("~/images/" + savedimage));
                string imagepath = "~/images/" + savedimage.ToString();

                string sqlmain = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
                SqlConnection con = new SqlConnection(sqlmain);

                con.Open();

                string sqlimg = "insert into ImageData([UserName],[ImageName],[ImagePath],[Date&Time]) values(@User,@name,@path,@date)";
                SqlCommand com = new SqlCommand(sqlimg, con);
                
                    com.Parameters.AddWithValue("@User", Session["Username"].ToString());
                    com.Parameters.AddWithValue("@name", savedimage);
                    com.Parameters.AddWithValue("@path", imagepath);
                    com.Parameters.AddWithValue("@date", date);
                



                com.ExecuteNonQuery();

                Response.Write("Image and it path is saved successfully!");

                con.Close();

            }
            else
            {
                Response.Write("File uploaded is not imagine!");
            }
        }
            
         else
         {
             Response.Write("Image and path is not successful!");
         }
           
    }
}