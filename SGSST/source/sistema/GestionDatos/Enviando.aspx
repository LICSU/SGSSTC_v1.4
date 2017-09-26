<%@ Page Language="C#" Async="true" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Enviando.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Enviando" %>

<%@ Import Namespace="System.Threading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script>

		$(document).ready(function () {
			$("#ContentPlaceHolder1_Button2").hide();

			$("#ContentPlaceHolder1_Button1").click(function () {
				$("#ContentPlaceHolder1_Button1").hide();

				$("#ContentPlaceHolder1_Button2").show();
			});
		});

	</script>
		

	<div class="jumbotron">
		<h1>Matriz de Riesgos y Matriz Legal...</h1>
		<hr />
		<p>
			Debido a la gran cantidad de infomración que se tiene que generar, este proceso puede durar varios minutos,
			se le notificara mediante correo electronico, cuando ya se haya generado la matriz legal y la matriz de riesgos, para la sucursal
			creada.
			<br /><br />
			Puede seguir usando el sistema con total normalidad.
			<br /><br />
			Muchas gracias por su paciencia.
		</p>
		
		<asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Generar Matrices" OnClick="llamarwebserviceAsync1" />
		<asp:Button ID="Button2" CssClass="btn btn-success" runat="server" Text="Volver al Menu principal" OnClick="Button2_Click"/>
	</div>

</asp:Content>