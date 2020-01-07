<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>

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

/* Add styles to the form container */
.form-container {
  max-width: 50%;
  padding: 5px;
  background-color: Gray;
  
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
			<li><a href="cocoActivity.aspx">Extracurricular</a></li>
			<li><a href="subject.aspx">Subject</a></li>
            <li><a href="#">User Activity</a></li>
            <li><a href="planner.aspx">Planner</a></li>
			<li><a href="index.aspx">Logout</a></li>
		</ul>
	</div>
</div>
<!-- end #header -->
<div style="background-color:Gray";>
 <div id="wrapper" >
	<div id=""><br />
		<center>
         <h1>Hobby</h1>
             <center>
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                     onrowcancelingedit="GridView1_RowCancelingEdit" 
                     onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                     onrowupdating="GridView1_RowUpdating">
                     <Columns>
                         <asp:TemplateField HeaderText="Id">
                             <EditItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Hobby">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Focus Scale">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("focus_scale") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("focus_scale") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Complete Time">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("complete_time") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Eval("complete_time") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Action">
                             <EditItemTemplate>
                                 <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update">Update</asp:LinkButton>
                                 &nbsp;||
                                 <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                                 &nbsp;||
                                 <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                </asp:GridView>
                 <br />
                 <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
            </center>
         <br />
       </center>
       <br />
       <center>
         <h1>Extracurricular</h1>
             <center>
                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                     onrowcancelingedit="GridView2_RowCancelingEdit" 
                     onrowdeleting="GridView2_RowDeleting" onrowediting="GridView2_RowEditing" 
                     onrowupdating="GridView2_RowUpdating">
                     <Columns>
                         <asp:TemplateField HeaderText="Id">
                             <EditItemTemplate>
                                 <asp:Label ID="Label11" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label7" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Extracurricular">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label8" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Focus Scale">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("focus_scale") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label9" runat="server" Text='<%# Eval("focus_scale") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Complete Time">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("complete_time") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label10" runat="server" Text='<%# Eval("complete_time") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Action">
                             <EditItemTemplate>
                                 <asp:LinkButton ID="LinkButton7" runat="server" CommandName="update">Update</asp:LinkButton>
                                 &nbsp;||
                                 <asp:LinkButton ID="LinkButton8" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton5" runat="server" CommandName="edit">Edit</asp:LinkButton>
                                 &nbsp;||
                                 <asp:LinkButton ID="LinkButton6" runat="server" CommandName="delete">Delete</asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
             </center>
           <br />
           <asp:Label ID="Label12" runat="server" ForeColor="Red"></asp:Label>
         <br />
       </center>
       <br />
        
       <center>
         <h1>Subject</h1>
           <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
               onrowcancelingedit="GridView3_RowCancelingEdit" 
               onrowdeleting="GridView3_RowDeleting" onrowediting="GridView3_RowEditing" 
               onrowupdating="GridView3_RowUpdating">
               <Columns>
                   <asp:TemplateField HeaderText="Id">
                       <EditItemTemplate>
                           <asp:Label ID="Label22" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label13" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Subject">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("subject") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label14" runat="server" Text='<%# Eval("subject") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Complete Time">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("complete_time") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label15" runat="server" Text='<%# Eval("complete_time") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Chapter">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("chapter") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label16" runat="server" Text='<%# Eval("chapter") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Quiz Week">
                       <EditItemTemplate>
                           <asp:Label ID="Label24" runat="server" Text='<%# Eval("quiz") %>'></asp:Label>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label17" runat="server" Text='<%# Eval("quiz") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Test Week">
                       <EditItemTemplate>
                           <asp:Label ID="Label25" runat="server" Text='<%# Eval("test") %>'></asp:Label>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label18" runat="server" Text='<%# Eval("test") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Assignment Week">
                       <EditItemTemplate>
                           <asp:Label ID="Label26" runat="server" Text='<%# Eval("assignment") %>'></asp:Label>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label19" runat="server" Text='<%# Eval("assignment") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Focus Scale">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox13" runat="server" Text='<%# Eval("focus_scale") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label20" runat="server" Text='<%# Eval("focus_scale") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Day">
                       <EditItemTemplate>
                           <asp:Label ID="Label27" runat="server" Text='<%# Eval("day") %>'></asp:Label>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label21" runat="server" Text='<%# Eval("day") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Action">
                       <EditItemTemplate>
                           <asp:LinkButton ID="LinkButton11" runat="server" CommandName="update">Update</asp:LinkButton>
                           &nbsp;||
                           <asp:LinkButton ID="LinkButton12" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton9" runat="server" CommandName="edit">Edit</asp:LinkButton>
                           &nbsp;||
                           <asp:LinkButton ID="LinkButton10" runat="server" CommandName="delete">Delete</asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
           </asp:GridView>
           <br />
           <asp:Label ID="Label23" runat="server" ForeColor="Red"></asp:Label>
         <br />
       </center> 
       <br />
    </div>
  </div>
</div>
<!-- end #footer -->
<script type="text/javascript">
    function confirmBox() {
        var r = confirm("Are you sure you want to delete this subject?");
        if (r == true) {
            location.href = '';
        } else {
            return false;
        }
    }
</script>
</form>
</body>
</html>
