<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Enviando.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Enviando" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        function DeleteKartItems() {
            $.ajax(
                {
                    type: "POST",
                    url: 'Enviando.aspx/SaveData',
                    data: "",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        alert(msg.d);
                        window.location = "index_Sucursal.aspx";
                    },
                    error: function (e) { }
                });
        }
        window.onload = DeleteKartItems;
    </script>

    <div class="page-header">
        <h1 class="text-center">Enviando Información ...</h1>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <hr />
            <br />

            <div class="box box-warning box-solid">
                <div class="box-header">
                    <h3 class="box-title">Enviando Datos...</h3>
                </div>

                <div class="box-body">
                    <h4>Por favor espere mientras guardamos la informacion!</h4>
                    <br />
                    <h4>Generando Puestos de Trabajos y Areas...</h4>
                    <br />
                    <h4>Generando Matriz legal para esta sucursal...</h4>
                    <br />
                    <h4>Generando Matriz de riesgos para esta sucursal...</h4>
                    <br />
                    <h5>Este proceso puede durar varios minutos.</h5>
                </div>

                <div class="overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
