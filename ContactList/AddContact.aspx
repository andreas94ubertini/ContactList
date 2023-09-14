<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddContact.aspx.cs" Inherits="ContactList.AddContact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="bg-dark text-light">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mt-4">
                    <h2>Inserisci un nuovo contatto nella tua lista</h2>
                </div>
                <div class="col-12 mt-5 d-flex flex-column align-items-center">
                    <p class="h5 m-0">Nome</p>
                    <asp:TextBox ID="NameBox" runat="server" CssClass="form-control w-50"></asp:TextBox>
                </div>
                <div class="col-12 mt-5 d-flex flex-column align-items-center">
                    <p class="h5 m-0">Surname</p>
                    <asp:TextBox ID="SurnameBox" runat="server" CssClass="form-control w-50"></asp:TextBox>
                </div>
                <div class="col-12 mt-5 d-flex flex-column align-items-center">
                    <p class="h5 m-0">Indirizzo</p>
                    <asp:TextBox ID="AddressBox" runat="server" CssClass="form-control w-50"></asp:TextBox>
                </div>
                <div class="col-12 mt-5 d-flex flex-column align-items-center">
                    <p class="h5 m-0">Email</p>
                    <asp:TextBox ID="EmailBox" runat="server" CssClass="form-control w-50"></asp:TextBox>
                </div>
                <div class="col-12 mt-5 d-flex flex-column align-items-center">
                    <p class="h5 m-0">Telefono</p>
                    <asp:TextBox ID="PhoneBox" runat="server" CssClass="form-control w-50"></asp:TextBox>
                </div>
                <div class="col-12 mt-5 d-flex flex-column align-items-center">
                    <p class="h5 m-0">Carica un immagine</p>
                    <asp:FileUpload ID="ImgUpload" runat="server" CssClass="form-control w-50" />
                </div>
                <div class="col-12 mt-5 d-flex flex-column align-items-center">
                    <asp:Button ID="ButtonCreate" runat="server" Text="Conferma" CssClass="btn btn-success w-50" OnClick="ButtonCreate_Click"/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
