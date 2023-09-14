<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactDetails.aspx.cs" Inherits="ContactList.ContactDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />
    <title></title>
</head>
<body class="bg-dark">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center text-light">
                    <h2>Dettagli contatto:</h2>
                    <a href="Default.aspx" class="btn btn-primary"><i class="bi bi-house"></i>Torna alla lista</a>
                </div>
                <div class="col-12 d-flex justify-content-center mt-5">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <asp:Image ID="profileImg" CssClass="img-fluid rounded-start" runat="server" />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body d-flex justify-content-between">
                                    <div>
                                        <h5 id="name" runat="server" class="card-title"></h5>
                                        <h5 id="surname" runat="server" class="card-text"></h5>
                                        <p id="email" runat="server" class="card-text"></p>
                                        <p id="phone" runat="server" class="card-text"></p>
                                        <p id="address" runat="server" class="card-text"></p>
                                    </div>
                                    <div>
                                        <a id="modify" runat="server"><i class="bi bi-pencil fs-2"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
