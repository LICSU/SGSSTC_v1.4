<%@ Page Language="C#" Async="true" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Enviando.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Enviando" %>

<%@ Import Namespace="System.Threading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script>

        $(document).ready(function () {
            $("#ContentPlaceHolder1_Button1").click(function () {
                $("#ContentPlaceHolder1_Button1").hide();
            });
        });

	</script>

	<div class="page-header">
		<h1 class="text-center">Enviando Información ...</h1>
	</div>
    
	<asp:Button ID="Button1" runat="server" Text="Button1" OnClick="llamarwebserviceAsync1" />

	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<hr />
			<br />

			<div class="box box-warning box-solid">
				<div class="box-header">
					<h3 class="box-title">Enviando Datos...</h3>
				</div>
				<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
