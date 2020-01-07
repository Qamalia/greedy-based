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

public partial class cocoActivity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
            Response.Redirect("index.aspx");
        else
        {
            if (!IsPostBack)
            {
                MySqlConnection con = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
                con.Open();

                MySqlCommand cmd = new MySqlCommand("select * from extracoco where user_id = '" + Session["id"] + "'", con);
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    ListBox1.Items.Add(reader["name"].ToString());
                }
                con.Close();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MySqlConnection con = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        con.Open();

        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "select * from extracoco where user_id = '" + Session["id"] + "' and name = '" + TextBox1.Text + "'";
        cmd.Connection = con;
        MySqlDataReader reader = cmd.ExecuteReader();

        if (reader.Read())
        {
            
            Label1.Text = "*Activity Already Exist";
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Red;
            con.Close();

        }
        else
        {
            reader.Close();
            MySqlCommand cmd1 = new MySqlCommand();
            cmd1.CommandText = "insert into extracoco (user_id,name,focus_scale,complete_time) values ('" + Session["id"] + "','" + TextBox1.Text + "','" + TextBox4.Text + "','" + TextBox3.Text + "')";
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
            Label1.Text = "*successfully added";
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Red;
            con.Close();
            TextBox1.Enabled = false;
            TextBox4.Enabled = false;
            TextBox3.Enabled = false;
            TextBox2.Enabled = false;
            ListBox1.Items.Add(TextBox1.Text);
        }
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Enabled = true;
        TextBox4.Enabled = true;
        TextBox3.Enabled = true;
        TextBox2.Enabled = true;
        Label1.Text = null;
        TextBox1.Text = null;
        TextBox4.Text = null;
        TextBox3.Text = null;
        TextBox2.Text = null;
    }
}