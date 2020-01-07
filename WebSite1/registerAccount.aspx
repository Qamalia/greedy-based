<%@ Page Title="Semester Planner" Language="C#" AutoEventWireup="true" CodeFile="registerAccount.aspx.cs" Inherits="registerAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 3.0 License

Name       : FullyCharge 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120604

-->
<html>
<head runat="server">
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

/* Add styles to the form container */
.form-container {
  max-width: 100%;
  padding: 5px;
  background-color: Gray;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password], .form-container input[type=number], .form-container input[type=email]{
  width: 100%;
  padding: 10px 1px;
  margin: 5px 0 15px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus, .form-container input[type=number]:focus, .form-container input[type=email]:focus{
  background-color: #ddd;
  outline: none;
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
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
</head>
<body >
    <form id="form1" runat="server">
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#" style="color: #FFFFFF">Welcome to Semester Planner</a></h1> <br /><center><h2>
            <a href="#" style="color: #FFFFFF">Sign Up</a></h2></center>
		</div>
	</div>
	<div id="menu" style="color: #000000">
	</div>
</div>
<!-- end #header -->
<div style="background-color:Gray";>
<div id="wrapper" >
	<div id=""><br />
		<div id="poptrox" class="form-container">
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label><br />
                <label for="id"><b>Student Id</b></label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   ControlToValidate="TextBox1" ErrorMessage=" *Please Enter Your Id "   ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox1" runat="server" type="text" MaxLength="10"></asp:TextBox>
                <label for="username"><b>Username</b></label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"   ControlToValidate="TextBox2" ErrorMessage=" *Please Enter Your Username "   ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox2" runat="server" type="text"></asp:TextBox>
                <label for="psw"><b>Password</b></label><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"   ControlToValidate="TextBox4" ErrorMessage=" *Please Enter Your Password "   ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox4" runat="server" type="password"></asp:TextBox>
                <label for="email"><b>Email</b></label><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"   ControlToValidate="TextBox5" ErrorMessage=" *Please Enter Your Email "   ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox5" runat="server" type="email"></asp:TextBox>
                <input type="button" class= "btn reg" onclick="location.href='index.aspx';" 
                    value="Sign In Account" style="color: #0000FF; text-decoration: underline" /><asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit Details" class="btn"/>
             <br />
            </div>
       </div><br />
      </div>
     </div>
<!-- end #footer -->
    </form>
</body>
</html>
