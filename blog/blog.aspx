<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="blog.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	 <link href="Theme/bootstrap-4.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
	    <style>
        .custom-shadow {
            box-shadow: 0 4px 6px 7px rgb(0 0 0 / 75%);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="m-5">
            <div class="container">
                <div class="custom-shadow">
                    <div class="row justify-content-center p-5">
                        <div class="col-md-6">
                            <div class=" m-0 p-3">
                                <h2 class="text-center"><u>Creation</u></h2>
                            </div>
                            <div class="form-group">
                                <asp:Label for="date" runat="server"><b>date</b></asp:Label>
                                <asp:TextBox type="text" ID="date" CssClass="form-control"  runat="server" ReadOnly="true" AutoComplete="off"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label for="text" runat="server"><b>Title</b></asp:Label>
                                <asp:TextBox type="text" ID="title" CssClass="form-control" runat="server" placeholder="Enter your title"  AutoComplete="off"></asp:TextBox>
								
                            </div>
							<div class="from-group">
								<asp:Label for="text" runat="server"><b>Content</b></asp:Label>
								<asp:TextBox type="text" ID="content" CssClass="form-control" TextMode="MultiLine" MaxLength="500" Height="100" runat="server" placeholder="Enter your content"  AutoComplete="off"></asp:TextBox>
							</div>
							<br />
							
                            <div class="text-center">
                                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="view" CssClass="btn btn-primary" OnClick="Button2_Click"/>
								<asp:Button ID="Button3" runat="server" Text="Modify" CssClass="btn btn-danger" OnClick="Button3_Click"/>
								<br />
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
