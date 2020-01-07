<%@ Page Title="Semester Planner" Language="C#" AutoEventWireup="true" CodeFile="planner.aspx.cs" Inherits="planner" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 3.0 License

Name       : FullyCharge 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120604

-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Semester Planner</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="jquery.poptrox-1.0.js"></script>
<style type="text/css">
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.form-popup {
  position: fixed;
  border: 3px solid #f1f1f1;
  z-index: 9;
}
table {
  border-collapse: collapse;
  width:79%;
  height: 30%;
  background-color: white;
}

th,td {
  text-align: left;
  border: 1px solid #ddd;
  padding: 8px;
  font-weight:bold;
}

tr:nth-child(even){background-color: rgb(180, 180, 180)}

th {
  text-align: center; 
  border: 1px solid #ddd;
  padding: 8px;
  font-weight:bold;
  background-color: #006666;
  color: white;
}

/* Add styles to the form container */
.form-container {
  max-width: 50%;
  padding: 5px;
  background-color: Gray;
  
}
/* Set a style for the submit/login button */
.form-container .btn {
  background-color: Orange;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 50%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .reg {
  background-color: red;
  width: 50%;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
</head>
<body >
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#" style="color: #FFFFFF">Semester Planner</a></h1>
		</div>
	</div>
	<div id="menu">
		<ul>
			<li><a href="hobbyActivity.aspx">Hobby</a></li>
			<li><a href="cocoActivity.aspx">Extracurricular</a></li>
			<li><a href="subject.aspx">Subject</a></li>
            <li><a href="user.aspx">User Activity</a></li>
            <li><a href="#">Planner</a></li>
			<li><a href="index.aspx">Logout</a></li>
		</ul>
	</div>
</div>
<!-- end #header -->
<div style="background-color:Gray";>
<div id="wrapper" ><br/>
	<div id="">
		<center>
		    <form id="form1" runat="server">
            <center><asp:Button ID="Button1" runat="server" class= "btn" Text="Generate Planner" 
                    onclick="Button1_Click1" />
                <asp:Button ID="Button2" runat="server" Text="Print Planner" 
                    onclick="Button2_Click" />
            </center>
            <br />
            <table>
            <tr><th bgcolor="#006666">Focus Scale</th><th class="style1" bgcolor="#006666">Complete Time</th>
                <th bgcolor="#006666" >Priority</th>
            </tr>
            <tr>
               <td class="style1"><asp:ListBox ID="ListBox1" runat="server" Rows="10" 
                       CssClass="style2" Width="247px"></asp:ListBox></td>
               <td class="style1"><asp:ListBox ID="ListBox2" runat="server" Rows="10" 
                       CssClass="style3" Width="260px"></asp:ListBox></td>
               <td colspan = "2"><asp:ListBox ID="ListBox3" runat="server" Rows="10" 
                       CssClass="style4" Width="259px"></asp:ListBox></td> 
            </tr>         
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <br />
            <br />
            
            </form>
		</center>
	</div>
</div>
</div>
<!-- end #footer -->
</body>
</html>
