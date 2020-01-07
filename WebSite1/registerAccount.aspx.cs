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

public partial class registerAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MySqlConnection con = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        con.Open();

        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "select * from user where id = '" + TextBox1.Text + "' or email = '" + TextBox5.Text + "'";
        cmd.Connection = con;
        MySqlDataReader reader = cmd.ExecuteReader();


        if (reader.Read())
        {
            
            Label1.Text = "*User is Already Exist";
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Red;
            con.Close();

        }
        else
        {
            string hash = @"sqbtxsple@rn"; string pass = null;
            byte[] data = UTF8Encoding.UTF8.GetBytes(TextBox4.Text);
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

            reader.Close();
            MySqlCommand cmd1 = new MySqlCommand();
            cmd1.CommandText = "insert into user (id,username,password,email) values ('" + TextBox1.Text + "','" + TextBox2.Text + "','"+ pass +"','" + TextBox5.Text + "')";
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
            Label1.Text = "*Successfully added";
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Red;
            con.Close();
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            TextBox4.Enabled = false;
            TextBox5.Enabled = false;
            //Response.Redirect("index.aspx");
            
        }
       
    }
}