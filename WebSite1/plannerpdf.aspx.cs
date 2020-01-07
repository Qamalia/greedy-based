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

public partial class plannerpdf : System.Web.UI.Page
{
    List<timetable> Timetable; List<hobby> Hobby; List<extraCoco> Extracoco; List<plan> Planner; List<student> Student;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            DBConnectedTimetable();
            DBConnectedHobby();
            DBConnectedExtraCoco();
            DBConnectedPlanner();
            DBConnectedStudent();

            //get current user
            List<double> FocusScale = new List<double>();
            List<double> CompleteTime = new List<double>();
            List<String> Name = new List<String>();

            //get current user - hobby
            for (int i = 0; i < Hobby.Count; i++)
            {
                if (Hobby[i].user_id.ToString().Equals(Session["id"]))
                {
                    Name.Add(Hobby[i].name);
                    FocusScale.Add(double.Parse(Hobby[i].focus_scale.ToString()));
                    CompleteTime.Add(double.Parse(Hobby[i].complete_time.ToString()));
                }
            }
            //get current user - coco
            for (int i = 0; i < Extracoco.Count; i++)
            {
                if (Extracoco[i].user_id.ToString().Equals(Session["id"]))
                {
                    Name.Add(Extracoco[i].name);
                    FocusScale.Add(double.Parse(Extracoco[i].focus_scale.ToString()));
                    CompleteTime.Add(double.Parse(Extracoco[i].complete_time.ToString()));
                }
            }
            //get current user - subject
            for (int i = 0; i < Timetable.Count; i++)
            {
                if (Timetable[i].user_id.ToString().Equals(Session["id"]))
                {
                    Name.Add(Timetable[i].subject);
                    FocusScale.Add(double.Parse(Timetable[i].focus_scale.ToString()));
                    CompleteTime.Add(double.Parse(Timetable[i].complete_time.ToString()));
                }
            }


            //key value pair between priority, complete time and algorithm result sequence
            List<KeyValuePair<double, string>> priority = new List<KeyValuePair<double, string>>();
            List<KeyValuePair<double, string>> focus = new List<KeyValuePair<double, string>>();
            List<KeyValuePair<double, string>> time = new List<KeyValuePair<double, string>>();

            double[] f = FocusScale.ToArray();
            double[] t = CompleteTime.ToArray();
            string[] n = Name.ToArray();

            for (int i = 0; i < Name.Count; i++)
            {
                priority.Add(new KeyValuePair<double, string>(Math.Round(f[i] / t[i], 3), n[i]));
                time.Add(new KeyValuePair<double, string>(t[i], n[i]));
                focus.Add(new KeyValuePair<double, string>(f[i], n[i]));

            }

            //Sort key value pair
            focus = focus.OrderBy(o => o.Key).ToList();
            focus.Reverse();


            time = time.OrderBy(o => o.Key).ToList();
            time.Reverse();


            priority = priority.OrderBy(o => o.Key).ToList();
            priority.Reverse();


            //Create dictionary for planner
            Dictionary<int, string[]> planner = new Dictionary<int, string[]>();

            planner.Add(0, new string[15]);
            planner.Add(1, new string[15]);
            planner.Add(2, new string[15]);
            planner.Add(3, new string[15]);
            planner.Add(4, new string[15]);
            planner.Add(5, new string[15]);
            planner.Add(6, new string[15]);

            int j = 0;
            int full = 0;
            planner[0][0] = "Monday";
            planner[1][0] = "Tuesday";
            planner[2][0] = "Wednesday";
            planner[3][0] = "Thursday";
            planner[4][0] = "Friday";
            planner[5][0] = "Saturday";
            planner[6][0] = "Sunday";


            foreach (KeyValuePair<double, string> pair in priority)
            {
                if (j >= 7)
                {
                    j = 0;
                    full = 1;
                }

                for (int i = 1; i < 15; i++)
                {
                    if (full == 0)
                        planner[j][i] = " ~" + pair.Value;
                    else
                        planner[j][i] = planner[j][i] + ", " + "\n" + " ~" + pair.Value;

                    for (int c = 0; c < Timetable.Count; c++)
                    {
                        if (Timetable[c].user_id.ToString().Equals(Session["id"]) && Timetable[c].subject.ToString().Equals(pair.Value))
                        {
                            String[] Wassignment = Timetable[c].assignment; // Split('-')
                            String[] Wquiz = Timetable[c].quiz;
                            String[] Wtest = Timetable[c].test;

                            string str = Convert.ToString(i);

                            for (int a = 0; a < Wassignment.Length; a++)
                            {
                                if (Wassignment[a].Equals(str))
                                    planner[j][i] = planner[j][i] + ", " + "\n" + string.Join(" ", " ~Assignment " + (a + 1) + " " + pair.Value);
                            }
                            for (int a = 0; a < Wquiz.Length; a++)
                            {
                                if (Wquiz[a].Equals(str))
                                    planner[j][i] = planner[j][i] + ", " + "\n" + string.Join(" ", " ~Quiz " + (a + 1) + " " + pair.Value);
                            }
                            for (int a = 0; a < Wtest.Length; a++)
                            {
                                if (Wtest[a].Equals(str))
                                    planner[j][i] = planner[j][i] + ", " + "\n" + string.Join(" ", " ~Test " + (a + 1) + " " + pair.Value);
                            }
                        }
                    }
                }
                j++;
            }


            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[15] { new DataColumn("Day", typeof(string)), new DataColumn("Week 1", typeof(string)), new DataColumn("Week 2", typeof(string)), new DataColumn("Week 3", typeof(string)), new DataColumn("Week 4", typeof(string)), new DataColumn("Week 5", typeof(string)), new DataColumn("Week 6", typeof(string)), new DataColumn("Week 7", typeof(string)), new DataColumn("Week 8", typeof(string)), new DataColumn("Week 9", typeof(string)), new DataColumn("Week 10", typeof(string)), new DataColumn("Week 11", typeof(string)), new DataColumn("Week 12", typeof(string)), new DataColumn("Week 13", typeof(string)), new DataColumn("Week 14", typeof(string)) });

            for (int i = 0; i < planner.Count; i++)
            {
                dt.Rows.Add();

                for (int z = 0; z < 15; z++)
                {
                    if (planner[i][z] == null)
                        dt.Rows[i][z] = "-";
                    else
                        dt.Rows[i][z] = planner[i][z].ToString();
                }
            }

            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();

            MySqlConnection con = new MySqlConnection("server=localhost;uid=root;pwd=;database=semester_planner;");
            con.Open();
            MySqlCommand cmd1 = new MySqlCommand("select * from timetable where user_id = '" + Session["id"] + "'",con);
            MySqlDataReader reader = cmd1.ExecuteReader();
            GridView2.DataSource = reader;
            GridView2.DataBind();
        }

        else
            Response.Redirect("index.aspx");
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("hobbyActivity.aspx");
    }


    private void DBConnectedTimetable()
    {
        MySqlConnection con = new MySqlConnection("server=localhost;uid=root;pwd=;database=semester_planner;");
        con.Open();

        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "select * from timetable ";
        cmd.Connection = con;

        MySqlDataReader reader = cmd.ExecuteReader();

        Timetable = new List<timetable>();

        while (reader.Read())
        {
            int id = reader.GetInt32(0);
            String user_id = reader.GetValue(1) + "";
            String subject = reader.GetValue(2) + "";
            String complete_time = reader.GetValue(3) + "";
            String chapter = reader.GetValue(4) + "";
            String[] quiz = (reader.GetValue(5) + "").Split('-');
            String[] test = (reader.GetValue(6) + "").Split('-');
            String[] assignment = (reader.GetValue(7) + "").Split('-');
            String focus_scale = reader.GetValue(8) + "";
            String[] day = (reader.GetValue(9) + "").Split('-');

            timetable temp = new timetable(id, user_id, subject, complete_time, chapter, quiz, test, assignment, focus_scale, day);
            Timetable.Add(temp);
        }

        con.Close();

    }

    private void DBConnectedHobby()
    {
        MySqlConnection con = new MySqlConnection("server=localhost;uid=root;pwd=;database=semester_planner;");
        con.Open();

        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "select * from hobby";
        cmd.Connection = con;

        MySqlDataReader reader = cmd.ExecuteReader();

        Hobby = new List<hobby>();

        while (reader.Read())
        {
            int a = reader.GetInt32(0);
            String b = reader.GetValue(1) + "";
            String c = reader.GetValue(2) + "";
            String d = reader.GetValue(3) + "";
            String e = reader.GetValue(4) + "";

            hobby temp = new hobby(a, b, c, d, e);
            Hobby.Add(temp);
        }
        con.Close();
    }


    private void DBConnectedExtraCoco()
    {
        MySqlConnection con = new MySqlConnection("server=localhost;uid=root;pwd=;database=semester_planner;");
        con.Open();

        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "select * from extracoco";
        cmd.Connection = con;

        MySqlDataReader reader = cmd.ExecuteReader();

        Extracoco = new List<extraCoco>();

        while (reader.Read())
        {
            int a = reader.GetInt32(0);
            String b = reader.GetValue(1) + "";
            String c = reader.GetValue(2) + "";
            String d = reader.GetValue(3) + "";
            String e = reader.GetValue(4) + "";

            extraCoco temp = new extraCoco(a, b, c, d, e);
            Extracoco.Add(temp);
        }
        con.Close();
    }

    private void DBConnectedPlanner()
    {
        MySqlConnection con = new MySqlConnection("server=localhost;uid=root;pwd=;database=semester_planner;");
        con.Open();

        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "select * from planner";
        cmd.Connection = con;

        MySqlDataReader reader = cmd.ExecuteReader();

        Planner = new List<plan>();

        while (reader.Read())
        {
            String a = reader.GetValue(0) + "";
            String b = reader.GetValue(1) + "";
            String c = reader.GetValue(2) + "";
            String d = reader.GetValue(3) + "";

            plan temp = new plan(a, b, c, d);
            Planner.Add(temp);
        }
        con.Close();

    }

    private void DBConnectedStudent()
    {
        MySqlConnection con = new MySqlConnection("server=localhost;uid=root;pwd=;database=semester_planner;");
        con.Open();

        MySqlCommand cmd = new MySqlCommand();
        cmd.CommandText = "select * from user";
        cmd.Connection = con;

        MySqlDataReader reader = cmd.ExecuteReader();

        Student = new List<student>();

        while (reader.Read())
        {
            String a = reader.GetValue(0) + "";
            String b = reader.GetValue(1) + "";
            String d = reader.GetValue(2) + "";
            String e = reader.GetValue(3) + "";
            student temp = new student(a, b, d, e);
            Student.Add(temp);
        }
        con.Close();
    }

    public class student
    {
        public String id;
        public String username;
        public String password;
        public String email;


        public student(String id, String username, String password, String email)
        {
            this.id = id;
            this.username = username;
            this.password = password;
            this.email = email;
        }
    }

    public class plan
    {
        public String class_id;
        public String user_id;
        public String week;
        public String day;

        public plan(String class_id, String user_id, String week, String day)
        {
            this.class_id = class_id;
            this.user_id = user_id;
            this.week = week;
            this.day = day;
        }
    }
    public class timetable
    {
        public int id;
        public String user_id;
        public String subject;
        public String complete_time;
        public String chapter;
        public String[] quiz;
        public String[] test;
        public String[] assignment;
        public String focus_scale;
        public String[] day;

        public timetable(int id, String user_id, String subject, String complete_time, String chapter, String[] quiz, String[] test, String[] assignment, String focus_scale, String[] day)
        {
            this.id = id;
            this.user_id = user_id;
            this.subject = subject;
            this.complete_time = complete_time;
            this.chapter = chapter;

            this.quiz = new String[quiz.Length];
            for (int i = 0; i < quiz.Length; i++)
                this.quiz[i] = quiz[i];

            this.test = new String[test.Length];
            for (int i = 0; i < test.Length; i++)
                this.test[i] = test[i];

            this.assignment = new String[assignment.Length];
            for (int i = 0; i < assignment.Length; i++)
                this.assignment[i] = assignment[i];

            this.focus_scale = focus_scale;

            this.day = new String[day.Length];
            for (int i = 0; i < day.Length; i++)
                this.day[i] = day[i];

        }
    }

    public class extraCoco
    {
        public int id;
        public String user_id;
        public String name;
        public String focus_scale;
        public String complete_time;

        public extraCoco(int id, String user_id, String name, String focus_scale, String complete_time)
        {
            this.id = id;
            this.user_id = user_id;
            this.name = name;
            this.focus_scale = focus_scale;
            this.complete_time = complete_time;
        }
    }

    public class hobby
    {
        public int id;
        public String user_id;
        public String name;
        public String focus_scale;
        public String complete_time;

        public hobby(int id, String user_id, String name, String focus_scale, String complete_time)
        {
            this.id = id;
            this.user_id = user_id;
            this.name = name;
            this.focus_scale = focus_scale;
            this.complete_time = complete_time;
        }


    }


    
}
