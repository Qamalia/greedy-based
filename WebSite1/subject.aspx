<%@ Page Language="C#" AutoEventWireup="true" CodeFile="subject.aspx.cs" Inherits="subject" %>
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
table {
  border-collapse: collapse;
  width:80%;
  height: 30%;
  background-color: white;
}

th, td {
  text-align: center;
  border: 1px solid #ddd;
  padding: 8px;
}

tr:nth-child(even){background-color: white}

th {
  text-align: center; 
  border: 1px solid #ddd;
  padding: 8px;
  font-weight:bold;
  background-color: #006666;
  color: white;
}

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
    .style1
    {}
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
			<li><a href="cocoActivity.aspx">Extracurricular</a></li>
			<li><a href="#">Subject</a></li>
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
            <center><h1>Subject</h1></center>
                <b><asp:Label ID="Label2" runat="server" Text="List of Current Subject"></asp:Label></b>
                   <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:ListBox ID="ListBox1" runat="server" CssClass="style1" Width="220px">
            </asp:ListBox>
            <br />
            <br />
                <label><b style="color: #000000">Add New Subject Code </b></label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   ControlToValidate="TextBox1" ErrorMessage=" *Please Enter Your Subject  "   ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox1"  runat="server" type="text" Style="text-transform: uppercase;" ></asp:TextBox>
                <label ><b>Number of hours to study this subject in a day</b></label> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" *Complete time?" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <label><b>No. of Chapter</b></label> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage=" *No. of chapter?" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <label><b>Focus Scale</b></label> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" *Focus Scale?" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <cc1:SliderExtender ID="SliderExtender1" runat="server" 
                BoundControlID="Textbox4" TargetControlID = "TextBox5" Length="700" Maximum="10" Steps="10" 
                TooltipText="Move Slider" />
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <pre class="tab" style="color: #FF0000">Least Focus                                                                      Most Focus</pre>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                <br />
               <label><b>Day</b></label>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatLayout="UnorderedList">
                    <asp:ListItem>Monday</asp:ListItem>
                    <asp:ListItem>Tuesday</asp:ListItem>
                    <asp:ListItem>Wednesday</asp:ListItem>
                    <asp:ListItem>Thursday</asp:ListItem>
                    <asp:ListItem>Friday</asp:ListItem>
                    <asp:ListItem>Saturday</asp:ListItem>
                    <asp:ListItem>Sunday</asp:ListItem>
                </asp:CheckBoxList>
                <center><table>
                <tr>
                  <th colspan="3">SOW</th>
                </tr>
                  <tr>
                    <th >Quiz Week</th>
                    <th >Test Week</th>
                    <th >Assignment Week</th>
                  </tr>
                  <tr>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatLayout="UnorderedList">
                            <asp:ListItem Value="3">Week 3</asp:ListItem>
                            <asp:ListItem Value="4">Week 4</asp:ListItem>
                            <asp:ListItem Value="5">Week 5</asp:ListItem>
                            <asp:ListItem Value="6">Week 6</asp:ListItem>
                            <asp:ListItem Value="7">Week 7</asp:ListItem>
                            <asp:ListItem Value="8">Week 8</asp:ListItem>
                            <asp:ListItem Value="9">Week 9</asp:ListItem>
                            <asp:ListItem Value="10">Week 10</asp:ListItem>
                            <asp:ListItem Value="11">Week 11</asp:ListItem>
                            <asp:ListItem Value="12">Week 12</asp:ListItem>
                            <asp:ListItem Value="13">Week 13</asp:ListItem>
                            <asp:ListItem Value="14">Week 14</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>    
                    <td>
                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" RepeatLayout="UnorderedList">
                            <asp:ListItem Value="3">Week 3</asp:ListItem>
                            <asp:ListItem Value="4">Week 4</asp:ListItem>
                            <asp:ListItem Value="5">Week 5</asp:ListItem>
                            <asp:ListItem Value="6">Week 6</asp:ListItem>
                            <asp:ListItem Value="7">Week 7</asp:ListItem>
                            <asp:ListItem Value="8">Week 8</asp:ListItem>
                            <asp:ListItem Value="9">Week 9</asp:ListItem>
                            <asp:ListItem Value="10">Week 10</asp:ListItem>
                            <asp:ListItem Value="11">Week 11</asp:ListItem>
                            <asp:ListItem Value="12">Week 12</asp:ListItem>
                            <asp:ListItem Value="13">Week 13</asp:ListItem>
                            <asp:ListItem Value="14">Week 14</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>    
                     <td>
                      <asp:CheckBoxList ID="CheckBoxList4" runat="server"  RepeatLayout="UnorderedList">
                            <asp:ListItem Value="2">Week 2</asp:ListItem>
                            <asp:ListItem Value="3">Week 3</asp:ListItem>
                            <asp:ListItem Value="4">Week 4</asp:ListItem>
                            <asp:ListItem Value="5">Week 5</asp:ListItem>
                            <asp:ListItem Value="6">Week 6</asp:ListItem>
                            <asp:ListItem Value="7">Week 7</asp:ListItem>
                            <asp:ListItem Value="8">Week 8</asp:ListItem>
                            <asp:ListItem Value="9">Week 9</asp:ListItem>
                            <asp:ListItem Value="10">Week 10</asp:ListItem>
                            <asp:ListItem Value="11">Week 11</asp:ListItem>
                            <asp:ListItem Value="12">Week 12</asp:ListItem>
                            <asp:ListItem Value="13">Week 13</asp:ListItem>
                            <asp:ListItem Value="14">Week 14</asp:ListItem>
                        </asp:CheckBoxList>
                     </td>  
                    </tr>
                   </table></center><br />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add Subject" class="btn"/><asp:Button ID="Button2" runat="server" Text="Clear Form" class="btn" onclick="Button2_Click" />
                <input type="button" class= "btn reg" onclick="location.href='user.aspx';" value="Next" />
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