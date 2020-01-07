using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Text;
using System.IO;

public partial class subject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session == null)
            Response.Redirect("index.aspx");
        else
        {
            if (!IsPostBack)
            {
                MySqlConnection con = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
                con.Open();

                MySqlCommand cmd = new MySqlCommand("select * from timetable where user_id = '" + Session["id"] + "'", con);
                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListBox1.Items.Add(reader["subject"].ToString());
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
        cmd.CommandText = "select * from timetable where user_id = '" + Session["id"] + "' and subject = '" + TextBox1.Text + "'";
        cmd.Connection = con;
        MySqlDataReader reader = cmd.ExecuteReader();

        if (reader.Read())
        {
            Label1.Text = "*Subject Already Exits";
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Red;
            con.Close();
        }

        else
        {
            reader.Close();
            //insert view subject detail
            MySqlCommand cmd1 = new MySqlCommand();
            cmd1.CommandText = "insert into timetable (user_id,subject,complete_time,chapter,quiz,test,assignment,focus_scale,day) values (@user_id,@subject,@complete_time,@chapter,@quiz,@test,@assignment,@focus_scale,@day)";
            cmd1.Connection = con;
            //user_id
            cmd1.Parameters.AddWithValue("@user_id", Session["id"]);

            //subject
            cmd1.Parameters.AddWithValue("@subject", TextBox1.Text.ToUpper());

            //complete_time
            cmd1.Parameters.AddWithValue("@complete_time", TextBox2.Text);

            //chapter
            cmd1.Parameters.AddWithValue("@chapter", TextBox3.Text);

            //quiz
            string q = null;
            if (CheckBoxList2.SelectedItem != null)
            {
                for (int i = 0; i < CheckBoxList2.Items.Count; i++)
                {
                    if (CheckBoxList2.Items[i].Selected)//changed 1 to i 
                        q += CheckBoxList2.Items[i].Value.ToString() + "-"; //changed 1 to i
                }
                q = q.TrimEnd('-');
            }
            else q = "-";
            cmd1.Parameters.AddWithValue("@quiz", q);

            //test
            string t = null;
            if (CheckBoxList3.SelectedItem != null)
            {
                for (int i = 0; i < CheckBoxList3.Items.Count; i++)
                {
                    if (CheckBoxList3.Items[i].Selected)//changed 1 to i 
                        t += CheckBoxList3.Items[i].Value.ToString() + "-"; //changed 1 to i
                }
                t = t.TrimEnd('-');
            }
            else t = "-";
            cmd1.Parameters.AddWithValue("@test", t);

            //assignment
            string a = null;
            if (CheckBoxList4.SelectedItem != null)
            {
                for (int i = 0; i < CheckBoxList4.Items.Count; i++)
                {
                    if (CheckBoxList4.Items[i].Selected)//changed 1 to i 
                        a += CheckBoxList4.Items[i].Value.ToString() + "-"; //changed 1 to i
                }
                a = a.TrimEnd('-');
            }
            else a = "-";
            cmd1.Parameters.AddWithValue("@assignment", a);

            //focus_scale
            cmd1.Parameters.AddWithValue("@focus_scale", TextBox4.Text);

            //day
            string d = null;
            if (CheckBoxList1.SelectedItem != null)
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)//changed 1 to i 
                        d += CheckBoxList1.Items[i].Value.ToString() + "-"; //changed 1 to i
                }
                d = d.TrimEnd('-');
            }
            else d = "-";
            cmd1.Parameters.AddWithValue("@day", d);

            cmd1.ExecuteNonQuery();
            Label1.Text = "*Record has been added";
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Red;
            ListBox1.Items.Add(TextBox1.Text);
            con.Close();
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;
            TextBox4.Enabled = false;
            TextBox5.Enabled = false;
            CheckBoxList2.Enabled = false;
            CheckBoxList3.Enabled = false;
            CheckBoxList4.Enabled = false;
            CheckBoxList1.Enabled = false;
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Enabled = true;
        TextBox2.Enabled = true;
        TextBox3.Enabled = true;
        TextBox4.Enabled = true;
        TextBox5.Enabled = true;
        CheckBoxList2.Enabled = true;
        CheckBoxList3.Enabled = true;
        CheckBoxList4.Enabled = true;
        CheckBoxList1.Enabled = true;
        Label1.Text = null;
        TextBox1.Text = null;
        TextBox2.Text = null;
        TextBox3.Text = null;
        TextBox4.Text = null;
        TextBox5.Text = null;
        CheckBoxList2.ClearSelection();
        CheckBoxList3.ClearSelection();
        CheckBoxList4.ClearSelection();
        CheckBoxList1.ClearSelection();

    }
}