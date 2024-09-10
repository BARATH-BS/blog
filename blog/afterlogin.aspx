<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="afterlogin.aspx.cs" Inherits="blog.afterlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	 <style type="text/css">
            th {
                background: cornflowerblue !important;
                color: white !important;
                position: sticky !important;
                top: 0;
                box-shadow: 0 2px 2px -1px rgba(0, 0, 0, 0.4);
            }

            th, td {
                border: 1px solid black;
                padding: 0.25rem;
                word-wrap: break-word !important;
                padding-left: 2px;
            }

            table {
                table-layout: fixed !important;
            }


            .grid-view-container {
                height: 450px;
                overflow: hidden;
                overflow-y: scroll;
                max-height: 500px;
            }

            .gridviewbox {
                height: 450px;
                overflow: hidden;
                overflow-y: scroll;
                max-height: 500px;
            }
              .custom-label {
        padding-left: 50px;
        font-weight: bold;
        font-size: x-large;
        color: green;
        display: block;
    }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			<asp:label runat="server" id="Label1" class="custom-label"></asp:label> 
			    <center>
                   <asp:label runat="server" id="Label2" class="custom-label"></asp:label> 
               <div id="grid" class="gridviewbox" runat="server">
 <asp:GridView ID="TDG" runat="server"  Width="97%" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="false" class="tdg"  style="overflow-y:scroll;"
 enableEventValidation="true" GridLines="none"  Visible="true" OnRowCommand="TDG_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#b3cceb" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" CssClass="headersticky" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB"/>
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                <Columns>
                    <asp:TemplateField  HeaderText="Date" HeaderStyle-Width="7.3%" ItemStyle-Width="10%" >
                        <ItemTemplate>
                            <asp:label runat="server" id="datebll"  Text='<%# Eval("dates") %>'></asp:label>
                        </ItemTemplate>
						
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="title" HeaderStyle-Width="11.5%" ItemStyle-Width="10%" >
                        <ItemTemplate>
                            <asp:Linkbutton runat="server" id="titlelbl" CommandName="Select"  CommandArgument="<%# Container.DataItemIndex %>"   Text='<%# Eval("title") %>'></asp:Linkbutton>
                        </ItemTemplate>
						
                    </asp:TemplateField>
                  
                  
                         
                    </Columns>
            </asp:GridView>
                    </div>
        </center>
        </div>
    </form>
</body>
</html>
