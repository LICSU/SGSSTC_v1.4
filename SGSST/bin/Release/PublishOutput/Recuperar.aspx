<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recuperar.aspx.cs" Inherits="SGSSTC.Recuperar" %>


<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="resources/dist/css/skins/_all-skins.min.css" />
    <!-- Necesario para los modales-->
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resources/bootstrap/css/custom.css" />

    <title>SGSST</title>

    <style>
        body {
            background: url(ico/fondo2.jpg) no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>

<body>

    <div class="container">
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="row">
            <h1 class="text-gray text-center">Sistema de Gestion de Seguridad y Salud en el Trabajo</h1>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="box box-warning">
                    <div class="box-header with-border">
                        <h3 class="box-title">Recuperar Contraseña</h3>
                    </div>

                    <form id="form2" runat="server" class="form-signin">
                        <asp:ScriptManager runat="server" ID="ScriptManager1" />
                        <asp:UpdatePanel ID="MyUpdatePanel" runat="server">
                            <ContentTemplate>

                                <span id="reauth-email" class="reauth-email"></span>
                                <asp:HiddenField runat="server" ID="hfUsuarioActual" />
                                <asp:HiddenField runat="server" ID="hfClaveActual" />

                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-10">
                                                <label for="inputEmail3" class="control-label">Email del Usuario</label>
                                            </div>
                                            <div class="col-md-1"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-10">
                                                <asp:TextBox type="email" ID="txtEmail" runat="server" TextMode="SingleLine" ClientIDMode="Static" CssClass="form-control" placeholder="micorreo@correo.com"></asp:TextBox>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="txtEmail" runat="server"
                                                    ValidationGroup="ValidationAdd" />
                                            </div>
                                            <div class="col-md-1"></div>
                                        </div>

                                    </div>
                                </div>

                                <asp:Literal ID="Msj" runat="server"></asp:Literal>

                                <div class="box-footer">
                                    <div class="row">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-2">
                                            <asp:Button ID="Button1" runat="server" Text="Cancelar" class="btn btn-primary" OnClick="bVolver_Click" /></div>
                                        <div class="col-md-4">
                                            <asp:Button ID="bAceptar" runat="server" Text="Enviar contraseña" class="btn btn-warning" OnClick="bAceptar_Click" ValidationGroup="ValidationAdd" /></div>

                                    </div>

                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="bAceptar" />
                            </Triggers>
                        </asp:UpdatePanel>


                        <div class="modal fade" id="Msjmodal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                        <h4 class="modal-title">
                                            <label id="lblMsjTitle1"></label>
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-1">
                                                <span id="icoModal1" class="fa fa-times fa-2x text-danger"></span>
                                            </div>
                                            <div class="col-md-11">
                                                <label id="lblMsjModal1"></label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <!-- /modal-body -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
                        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
                        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
                        <script type="text/javascript">
                            function MostrarMsjModal1(message, title, ccsclas) {
                                var vIcoModal = document.getElementById("icoModal1");
                                vIcoModal.className = ccsclas;
                                $('#lblMsjTitle1').html(title);
                                $('#lblMsjModal1').html(message);
                                $('#Msjmodal1').modal('show');
                                return true;
                            }
                        </script>

                    </form>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
    <!-- jQuery 2.1.4 -->
    <script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>

    <!-- Bootstrap 3.3.5 -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
