<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyContact.aspx.cs" Inherits="ContactList.ModifyContact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <title></title>
</head>
<body class="bg-dark text-light">
    <form id="form1" runat="server">
        <div class="container">
             <div class="row">
     <div class="col-12 text-center mt-4">
         <h2>Modifica il conttato <span id="name" runat="server"></span></h2>
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
         <p class="h5 m-0">Carica una nuova immagine</p>
         <asp:FileUpload ID="ImgUpload" runat="server" CssClass="form-control w-50" />
     </div>
     <div class="col-12 mt-5 d-flex gap-4 justify-content-center">
         <asp:Button ID="ButtonModify" runat="server" Text="modifica" CssClass="btn btn-success" OnClick="ButtonModify_Click"/>
         <button id="deleteBtn" runat="server" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" >
  Elimina
</button>
     </div>
 </div>
        </div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content bg-dark">
      <div class="modal-header bg-dark">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Elimina Contatto!</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body bg-dark">
        <p id="modalName" runat="server">

        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
          <asp:Button ID="ButtonDlt" runat="server" Text="Elimina" CssClass="btn btn-danger" OnClick="ButtonDlt_Click"/>
      </div>
    </div>
  </div>
</div>
    </form>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
