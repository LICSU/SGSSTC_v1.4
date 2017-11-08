<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EstructuraBiologicos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_EstructuraBiologicos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EstructuraRiesgos.aspx">Formato para la identificación de riesgos</a></li>
		<li><a href="#">Biológicos</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato para la identificación de riesgos durante el recorrido en las instalaciones</h1>
	</div>

	<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
		<div id="divAlerta" runat="server">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
		</div>
	</asp:PlaceHolder>

	<div class="row">
		<asp:PlaceHolder runat="server" ID="phEmpresa">
			<div class="col-md-4 col-md-offset-2">
				<h4 class="text-center">Empresa</h4>
				<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
					OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
				</asp:DropDownList>
			</div>
		</asp:PlaceHolder>

		<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
			<div class="col-md-4 ">
				<h4 class="text-center">Sucursal</h4>
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>
	<br />
   
    <div class="row">
		<div class="col-md-8 col-md-offset-2">
            <asp:Table runat="server" ID="tbFactores" CssClass="table table-response">
                <asp:TableHeaderRow CssClass="bg-aqua">
                    <asp:TableHeaderCell>Factor de Riesgo</asp:TableHeaderCell>
                    <asp:TableHeaderCell>SI/NO</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Tiempo de Exposición</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>Microorganismos y parásitos infecciosos vivos </asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt1" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Virus </asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt2" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Hongos</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt3" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Polvos orgánicos (algodón, lino, cañamo, sisal)</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt4" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Contacto con sangre, orina, saliva, vómitos, mucosas</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt5" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Insectos</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts6" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt6" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell> Roedores</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts7" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt7" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Otros  animales (serpientes, perros)</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts8" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt8" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>

	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Medidas de control existentes: </h3>
			<asp:TextBox ID="txtMedidas" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtMedidas"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

    <div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Observaciones: </h3>
			<asp:TextBox ID="txtObservaciones" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>

			<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
				Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtObservaciones"
				runat="server" ValidationGroup="ValidationAdd" />
		</div>
	</div>
	<br />

	<div class="row text-center">

		<div class="col-md-4 col-md-offset-4">
			<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
				OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
			<h4>Generar Documento</h4>
		</div>

	</div>





</asp:Content>
