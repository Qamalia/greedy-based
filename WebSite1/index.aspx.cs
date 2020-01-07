using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Text;
using System.IO;
using System.Security.Cryptography;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      if(!Page.IsPostBack)
          Session.Remove("id");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MySqlConnection con = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        con.Open();

        MySqlCommand cmd = new MySqlCommand();
        string hash = @"sqbtxsple@rn"; string pass = null;

        byte[] data = UTF8Encoding.UTF8.GetBytes(TextBox2.Text);
        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
        {
            byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
            using (TripleDESCryptoServiceProvider tripleDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
            {
                ICryptoTransform transform = tripleDes.CreateEncryptor();
                byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                pass = Convert.ToBase64String(results);
            }
        }

        cmd.CommandText = "select * from user where id = '" + TextBox1.Text + "' and password = '" + pass + "'";
        cmd.Connection = con;

        MySqlDataReader reader = cmd.ExecuteReader();

        if (reader.Read() == true)
        {
            Session["id"] = TextBox1.Text;
            Response.Redirect("hobbyActivity.aspx");
            con.Close();
            
        }

        else
        {
            Label1.Text = "*Failed to login";
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Red;
            con.Close();

        }
        con.Close();
           


    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
}





   