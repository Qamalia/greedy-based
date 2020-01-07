<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cocoActivity.aspx.cs" Inherits="cocoActivity" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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

/* Add styles to the form container */
.form-container {
  max-width: 50%;
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
  width: 100%;
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
			<h1><a href="#" style="color: #FFFFFF">Semester Planner</a></h1>
		</div>
	</div>
	<div id="menu">
            <ul>
			<li><a href="hobbyActivity.aspx">Hobby</a></li>
			<li><a href="#">Extracurricular</a></li>
			<li><a href="subject.aspx">Subject</a></li>
            <li><a href="user.aspx">User Activity</a></li>
            <li><a href="planner.aspx">Planner</a></li>
			<li><a href="index.aspx">Logout</a></li>
		</ul>
	</div>
</div>
<!-- end #header -->
<div style="background-color:Gray";>
<div id="wrapper" >
	<div id=""><br />
		<div id="poptrox" class="form-container">
            <center><h1>Extracurricular</h1></center>
                <b><asp:Label ID="Label2" runat="server" Text="List of Current Extracurricular"></asp:Label></b>
                <asp:Label ID="Label1" runat="server" Visible="False" ForeColor="Red"></asp:Label>
            <br />
            <asp:ListBox ID="ListBox1" runat="server" Width="207px"></asp:ListBox>
            <br />
            <br />
                <label for="id"><b>Add New Extracurricular</b></label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   ControlToValidate="TextBox1" ErrorMessage=" *Please Enter Your Activity "   ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox1" runat="server" type="text" style="text-transform:capitalize;"></asp:TextBox>
                <label for="username"><b>Focus Scale</b></label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"   ControlToValidate="TextBox2" ErrorMessage=" *Please Enter Your Focus Scale "   ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <cc1:SliderExtender ID="SliderExtender1" runat="server" Maximum="10" Steps="10" BoundControlID="TextBox4" TargetControlID = "TextBox2"  TooltipText="Move Slider" Length="700" />
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <pre class="tab" style="color: #FF0000">Least Focus                                                                      Most Focus</pre>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <label ><b>Number of hours to finish this Extracurricular in a day</b></label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"   ControlToValidate="TextBox3" ErrorMessage=" *Please Enter Your Complete Time "   ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox3" runat="server" type="text"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" class="btn"/><asp:Button
                    ID="Button2" runat="server" Text="Clear form" class="btn" 
                onclick="Button2_Click" />
                <input type="button" class= "btn reg" onclick="location.href='subject.aspx';" value="Next" />
             <br />
            </div>
       </div>
       <br />
      </div>
     </div>
<!-- end #footer -->
    </form>
</body>
</html>