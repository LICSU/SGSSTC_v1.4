<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="source_sistema_Mensajes_Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SGSST</title>
    <meta charset="utf-8" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../../../resources/bootstrap/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../resources/dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../../resources/dist/css/skins/_all-skins.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="../../../resources/plugins/iCheck/flat/blue.css" />
    <!-- Morris chart -->
    <link rel="stylesheet" href="../../../resources/plugins/morris/morris.css" />
    <!-- jvectormap -->
    <link rel="stylesheet" href="../../../resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css" />
    <!-- Date Picker -->
    <link rel="stylesheet" href="../../../resources/plugins/datepicker/datepicker3.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../../resources/plugins/daterangepicker/daterangepicker-bs3.css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="../../../resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../resources/plugins/datatables/dataTables.bootstrap.css" />
    <!-- Necesario para los modales-->
    <link rel="stylesheet" href="../../../resources/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../../resources/bootstrap/css/custom.css" />
    <!-- End -->
    <style>
        body {
            background: url(../../../ico/chrome.jpg) no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container" style="width: 100%;">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">

                    <br />
                    <!-- Horizontal Form -->
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">Debe usar el navegador Google Chrome para poder usar el sistema</h3>
                            <br />
                            <hr />
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.google.com.co/chrome/browser/desktop/"><h3 class="text-center">Descargar</h3></asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
