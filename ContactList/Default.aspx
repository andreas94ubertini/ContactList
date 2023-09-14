<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ContactList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    
    <title></title>
</head>
<body class="bg-dark text-light">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center my-5">
                    <h1>Rubrica Telefonica</h1>
                </div>
                <div class="col-12 d-flex flex-column align-items-center gap-4" id="addIf" runat="server">
                    <p class="h3 m-0">Nessun contatto presente nella tua rubrica, aggiungine uno...</p>
                    <a href="/AddContact" class="btn btn-success w-50">Aggiungi</a>
                </div>
                <div class="col-12 d-flex flex-column align-items-center gap-4" id="existing" runat="server">
                    <a href="/AddContact" class="btn btn-success w-50">Aggiungi contatto</a>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <asp:GridView ID="GridView1" runat="server" ItemType="ContactList.Contact" AutoGenerateColumns="false" CssClass="table mt-4 text-light">
                        <Columns>
                            <asp:TemplateField ControlStyle-CssClass="text-light">
                                <HeaderTemplate>
                                    <strong><a href="#"><i class="bi bi-sort-alpha-down"></i></a></strong>
                                    <asp:Button ID="OrderBy" runat="server" Text="Ordina" CssClass="btn btn-outline-dark" OnClick="OrderBy_Click" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <img src="Content/img/<%#Item.Photo %>" width="150" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <strong>Nome</strong>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Item.Name %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <strong>Cognome</strong>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Item.Surname %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <strong>Telefono</strong>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Item.PhoneNumber %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <strong>Email</strong>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Item.Email %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <strong>Indirizzo</strong>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Item.Address %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <strong>Azioni</strong>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="d-flex gap-1">
                                       <a class="w-50 border text-center p-3" href="ContactDetails.aspx?IdContact=<%#Item.IdContact %>"> <div ><i class="bi bi-person-lines-fill fs-2"></i></div></a>
                                        <a class="w-50 border text-center p-3" href="ModifyContact.aspx?IdContact=<%#Item.IdContact %>" ><div ><i class="bi bi-pencil fs-2"></i></i></div></a>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
