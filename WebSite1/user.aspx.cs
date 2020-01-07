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

public partial class user : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["id"] != null)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
                conn.Open();

                MySqlCommand cmd = new MySqlCommand("select * from hobby where user_id = '" + Session["id"] + "'", conn);
                MySqlDataReader reader = cmd.ExecuteReader();
                this.GridView1.DataSource = reader;
                this.GridView1.DataBind();
                conn.Close();

                MySqlConnection conn1 = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
                conn1.Open();
                MySqlCommand cmd1 = new MySqlCommand("select * from extracoco where user_id = '" + Session["id"] + "'", conn1);
                MySqlDataReader reader1 = cmd1.ExecuteReader();
                this.GridView2.DataSource = reader1;
                this.GridView2.DataBind();
                conn1.Close();

                MySqlConnection conn2 = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
                conn2.Open();
                MySqlCommand cmd2 = new MySqlCommand("select * from timetable where user_id = '" + Session["id"] + "'", conn2);
                MySqlDataReader reader2 = cmd2.ExecuteReader();
                this.GridView3.DataSource = reader2;
                this.GridView3.DataBind();
                conn2.Close();

            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
        else
            return;
    }


    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();

        MySqlCommand cmd = new MySqlCommand("select * from hobby where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd.ExecuteReader();
 
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = reader;
        GridView1.DataBind();
        Label4.Text = "";
        GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        conn.Close();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();

        MySqlCommand cmd = new MySqlCommand("select * from hobby where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd.ExecuteReader();
        
        GridView1.EditIndex = -1;
        GridView1.DataSource = reader;
        GridView1.DataBind();
        Label4.Text = "";
        conn.Close();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = GridView1.Rows[e.RowIndex].FindControl("Label6") as Label;
        TextBox name = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
        TextBox focus_scale = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
        TextBox complete_time = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;


        String mycon = "server=localhost;username=root;pwd=;database=semester_planner;";
        String updatedata = "Update hobby set name='" + name.Text + "', focus_scale='" + focus_scale.Text + "', complete_time='" + complete_time.Text + "' where id=" + id.Text;
        MySqlConnection con = new MySqlConnection(mycon);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();

        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();
        MySqlCommand cmd1 = new MySqlCommand("select * from hobby where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd1.ExecuteReader();
        GridView1.EditIndex = -1;
        GridView1.DataSource = reader;
        GridView1.DataBind();
        Label4.Text = "*Row Data Has Been Updated Successfully";
        conn.Close();
        
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = GridView1.Rows[e.RowIndex].FindControl("Label5") as Label;
        String mycon = "server=localhost;username=root;pwd=;database=semester_planner;";
        String deletedata = "Delete from hobby where id=" + id.Text;
        MySqlConnection con = new MySqlConnection(mycon);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = deletedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Label4.Text = " *Row Data Has Been Deleted Successfully";

        //view data
        MySqlCommand cmd1 = new MySqlCommand("select * from hobby where user_id = '" + Session["id"] + "'", con);
        MySqlDataReader reader = cmd1.ExecuteReader();
        GridView1.EditIndex = -1;
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
    }
    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();

        MySqlCommand cmd = new MySqlCommand("select * from extracoco where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd.ExecuteReader();

        GridView2.EditIndex = e.NewEditIndex;
        GridView2.DataSource = reader;
        GridView2.DataBind();
        Label12.Text = "";
        GridView2.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        conn.Close();
    }
    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();

        MySqlCommand cmd = new MySqlCommand("select * from extracoco where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd.ExecuteReader();

        GridView2.EditIndex = -1;
        GridView2.DataSource = reader;
        GridView2.DataBind();
        Label12.Text = "";
        conn.Close();
    }
    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = GridView2.Rows[e.RowIndex].FindControl("Label11") as Label;
        TextBox name = GridView2.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
        TextBox focus_scale = GridView2.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
        TextBox complete_time = GridView2.Rows[e.RowIndex].FindControl("TextBox6") as TextBox;


        String mycon = "server=localhost;username=root;pwd=;database=semester_planner;";
        String updatedata = "Update extracoco set name='" + name.Text + "', focus_scale='" + focus_scale.Text + "', complete_time='" + complete_time.Text + "' where id=" + id.Text;
        MySqlConnection con = new MySqlConnection(mycon);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();

        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();
        MySqlCommand cmd1 = new MySqlCommand("select * from extracoco where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd1.ExecuteReader();
        GridView2.EditIndex = -1;
        GridView2.DataSource = reader;
        GridView2.DataBind();
        Label12.Text = "Row Data Has Been Updated Successfully";
        conn.Close();
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = GridView2.Rows[e.RowIndex].FindControl("Label7") as Label;
        String mycon = "server=localhost;username=root;pwd=;database=semester_planner;";
        String deletedata = "Delete from extracoco where id=" + id.Text;
        MySqlConnection con = new MySqlConnection(mycon);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = deletedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Label12.Text = " *Row Data Has Been Deleted Successfully";

        //view data
        MySqlCommand cmd1 = new MySqlCommand("select * from extracoco where user_id = '" + Session["id"] + "'", con);
        MySqlDataReader reader = cmd1.ExecuteReader();
        GridView2.EditIndex = -1;
        GridView2.DataSource = reader;
        GridView2.DataBind();
        con.Close();
    }
    protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
    {
        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();

        MySqlCommand cmd = new MySqlCommand("select * from timetable where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd.ExecuteReader();

        GridView3.EditIndex = e.NewEditIndex;
        GridView3.DataSource = reader;
        GridView3.DataBind();
        Label23.Text = "";
        GridView3.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        conn.Close();
    }
    protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();

        MySqlCommand cmd = new MySqlCommand("select * from timetable where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd.ExecuteReader();

        GridView3.EditIndex = -1;
        GridView3.DataSource = reader;
        GridView3.DataBind();
        Label23.Text = "";
        conn.Close();
    }
    protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = GridView3.Rows[e.RowIndex].FindControl("Label22") as Label;
        TextBox subject = GridView3.Rows[e.RowIndex].FindControl("TextBox7") as TextBox;
        TextBox complete_time = GridView3.Rows[e.RowIndex].FindControl("TextBox8") as TextBox;
        TextBox chapter = GridView3.Rows[e.RowIndex].FindControl("TextBox9") as TextBox;
        TextBox focus_scale = GridView3.Rows[e.RowIndex].FindControl("TextBox13") as TextBox;
        
        String mycon = "server=localhost;username=root;pwd=;database=semester_planner;";
        String updatedata = "Update timetable set subject='" + subject.Text + "', complete_time='" + complete_time.Text + "', focus_scale='" + focus_scale.Text + "', chapter='" + chapter.Text + "' where id=" + id.Text;
        MySqlConnection con = new MySqlConnection(mycon);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();

        MySqlConnection conn = new MySqlConnection("server=localhost;username=root;pwd=;database=semester_planner;");
        conn.Open();
        MySqlCommand cmd1 = new MySqlCommand("select * from timetable where user_id = '" + Session["id"] + "'", conn);
        MySqlDataReader reader = cmd1.ExecuteReader();
        GridView3.EditIndex = -1;
        GridView3.DataSource = reader;
        GridView3.DataBind();
        Label23.Text = "Row Data Has Been Updated Successfully";
        conn.Close();
    }
    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = GridView3.Rows[e.RowIndex].FindControl("Label13") as Label;
        String mycon = "server=localhost;username=root;pwd=;database=semester_planner;";
        String deletedata = "Delete from timetable where id=" + id.Text;
        MySqlConnection con = new MySqlConnection(mycon);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = deletedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Label23.Text = " *Row Data Has Been Deleted Successfully";

        //view data
        MySqlCommand cmd1 = new MySqlCommand("select * from timetable where user_id = '" + Session["id"] + "'", con);
        MySqlDataReader reader = cmd1.ExecuteReader();
        GridView3.EditIndex = -1;
        GridView3.DataSource = reader;
        GridView3.DataBind();
        con.Close();
    }
}