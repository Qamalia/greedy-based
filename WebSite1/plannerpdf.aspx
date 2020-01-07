<%@ Page Language="C#" AutoEventWireup="true" CodeFile="plannerpdf.aspx.cs" Inherits="plannerpdf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Semester Planner</title>
<link href="style2.css" rel="stylesheet" type="text/css" media="print" />
<script type="text/javascript">
    function PrintDiv() {
        var divToPrint = document.getElementById('divToPrint');
        var popupWin = window.open('', '_blank', 'width=1500,height=700');
        popupWin.document.open();
        popupWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</html>');
        popupWin.document.close();
    }
</script>  
<style type="text/css">
body{background-image: url('');
background-repeat: no-repeat;
background-attachment: fixed;
background-size: auto}



    .style1
    {}



    .style2
    {}



    .style3
    {
        height: 982px;
    }



</style>
</head>
<body onload="PrintDiv();">
    <form id="form1" runat="server">
    <div id="header-wrapper">
     <div id="divToPrint" >
     <div style="background-image: url('images/headerpdf2.jpg');background-repeat: no-repeat;background-size: auto;">
	    <div id="header" class="container">
        
		    <div id="logo">
             
                <center>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                <asp:Label ID="Label2" runat="server" 
                        style="color: #000000; font-family: 'Lucida Calligraphy'; font-size: 100px;" 
                        Text=" Semester Planner " 
                        Height="120px"></asp:Label>
                    <br />
                    <br />
                </center>
               </div>
            </div>
          
          <center>
         <asp:GridView ID="GridView1" runat="server" CellPadding="2" ForeColor="#333333" 
                  GridLines="None" CssClass="poptrox-popup" >
             <AlternatingRowStyle BackColor="White" />
             <EditRowStyle BackColor="#7C6F57" />
             <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#E3EAEB" />
             <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#F8FAFA" />
             <SortedAscendingHeaderStyle BackColor="#246B61" />
             <SortedDescendingCellStyle BackColor="#D4DFE1" />
             <SortedDescendingHeaderStyle BackColor="#15524A" />
         </asp:GridView></center>
         
         <div style="background-image: url('images/headerpdf1.png');background-repeat: no-repeat;background-size: cover;">
         <br /><center class="style3"><br /><br /><br /><br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />

                 <br />
                 <br />

         <asp:Label ID="Label3" runat="server" Text="My Inspirational Quote!" style=" font-family: 'Lucida Calligraphy'; font-size: 60px;"></asp:Label>
             <br />
             <asp:TextBox ID="TextBox1" runat="server" CssClass="style1" Height="252px" 
                     Width="880px" BackColor="#DDDDDD" BorderStyle="Dashed"></asp:TextBox>
            <br /><br /><br />
          <asp:Label ID="Label1" runat="server" Text="Subject Enroll" style=" font-family: 'Lucida Calligraphy'; font-size: 60px;"></asp:Label>
         
         <br />
             <asp:GridView ID="GridView2" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" 
        GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" 
                     BorderWidth="3px" CssClass="style2" Height="270px" Width="1000px">
               <Columns>
                   <asp:TemplateField HeaderText="Subject">
                       <ItemTemplate>
                           <asp:Label ID="Label14" runat="server" Text='<%# Eval("subject") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Complete Time">
                       <ItemTemplate>
                           <asp:Label ID="Label15" runat="server" Text='<%# Eval("complete_time") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Chapter">
                       <ItemTemplate>
                           <asp:Label ID="Label16" runat="server" Text='<%# Eval("chapter") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Quiz Week">
                       <ItemTemplate>
                           <asp:Label ID="Label17" runat="server" Text='<%# Eval("quiz") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Test Week">
                       <ItemTemplate>
                           <asp:Label ID="Label18" runat="server" Text='<%# Eval("test") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Assignment Week">
                       <ItemTemplate>
                           <asp:Label ID="Label19" runat="server" Text='<%# Eval("assignment") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Focus Scale">
                       <ItemTemplate>
                           <asp:Label ID="Label20" runat="server" Text='<%# Eval("focus_scale") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Day">
                       <ItemTemplate>
                           <asp:Label ID="Label21" runat="server" Text='<%# Eval("day") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
                 <FooterStyle BackColor="White" ForeColor="#333333" />
                 <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="White" ForeColor="#333333" />
                 <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#F7F7F7" />
                 <SortedAscendingHeaderStyle BackColor="#487575" />
                 <SortedDescendingCellStyle BackColor="#E5E5E5" />
                 <SortedDescendingHeaderStyle BackColor="#275353" />
           </asp:GridView>    
           </center>
           </div></div>
         </div>
         <br />
    <center>
    <asp:Button ID="Button1" runat="server" Text="Print" BackColor="#006666" 
            BorderColor="White" ForeColor="White" Height="30px" Width="90px" 
            onclientclick="PrintDiv"/>
    <asp:Button ID="Button2" runat="server" Text="Homepage" 
            BackColor="#006666" BorderColor="White" 
            ForeColor="White" Height="30px" Width="90px" onclick="Button2_Click"/>
    </center>
</form>

</body>
</html>
