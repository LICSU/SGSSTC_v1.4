<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_Empresa.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Update_Empresa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<asp:UpdatePanel ID="MyUpdatePanel" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="#">Gestión de Datos</a></li>
				<li><a href="../GestionDatos/index_Empresa.aspx">Empresa</a></li>
				<li><a href="#">Editar empresa</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Editar Empresa</h1>
			</div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

			<div class="row">
				<div class="col-md-4">
					<asp:Image alt="-" runat="server" ID="imgLogo" CssClass="thumbnail"
						ImageUrl="~/source/archivos/LogosEmpresas/LICSU.jpg" />
				</div>
			</div>
			<br />

			<div class="row text-left">
				<div class="col-md-3">
					<h4>Nombre de la Empresa</h4>
				</div>
				<div class="col-md-9">
					<asp:TextBox runat="server" ID="txtNombreEmpresa" MaxLength="50" CssClass="form-control"
						PlaceHolder="Nombre"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="txtNombreEmpresa" runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>
			<br />

			<div class="row text-left">
				<div class="col-md-3">
					<h4>NIT</h4>
				</div>
				<div class="col-md-3">
					<asp:TextBox runat="server" ID="txtNit" MaxLength="50" CssClass="form-control" PlaceHolder="NIT">
					</asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNit"
						runat="server" ValidationGroup="ValidationAdd" />
				</div>

				<div class="col-md-3">
					<h4>Código de la Empresa</h4>
				</div>
				<div class="col-md-3">
					<asp:TextBox runat="server" MaxLength="50" ID="txtCodigoEmpresa" CssClass="form-control"
						PlaceHolder="Código"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="txtCodigoEmpresa" runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>
			<br />

			<style>
				span.valerror[style*="inline"] {
					display: block !Important;
					background-color: #f56954;
					border: 1px solid #f56954;
					font-size: 1em;
				}
			</style>
			<div class="row text-left">
				<div class="col-md-3">
					<h4>Email</h4>
				</div>
				<div class="col-md-3">
					<asp:TextBox runat="server" ID="txtEmail" MaxLength="100" TextMode="Email" CssClass="form-control"
						PlaceHolder="mi_correo@grupoli.com"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="txtEmail" runat="server" ValidationGroup="ValidationAdd" />

					<asp:RegularExpressionValidator ID="regexEmailValid" runat="server" SetFocusOnError="True"
						CssClass="valerror" Display="Dynamic"
						ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"
						ErrorMessage="Email inválido"></asp:RegularExpressionValidator>
				</div>

				<div class="col-md-3">
					<h4>Representante</h4>
				</div>
				<div class="col-md-3">
					<asp:TextBox runat="server" ID="txtRepresentante" MaxLength="100" CssClass="form-control"
						PlaceHolder="Representante"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="txtRepresentante" runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>
			<br />

			<div class="row text-left">
				<div class="col-md-3">
					<h4>Teléfono Fijo</h4>
				</div>
				<div class="col-md-3">
					<asp:TextBox runat="server" ID="txtTelFijo" MaxLength="50" CssClass="form-control" PlaceHolder="Fijo"
						TextMode="Number"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="txtTelFijo" runat="server" ValidationGroup="ValidationAdd" />
				</div>

				<div class="col-md-3">
					<h4>Teléfono Movil</h4>
				</div>
				<div class="col-md-3">
					<asp:TextBox runat="server" ID="txtTelMovil" MaxLength="50" CssClass="form-control"
						PlaceHolder="Movil" TextMode="Number"></asp:TextBox>

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="txtTelMovil" runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>
			<br />

			<div class="row text-left">
				<div class="col-md-3">
					<h4>Logo</h4>
					<asp:HiddenField runat="server" ID="hfLogo" />
				</div>
				<div class="col-md-3">
					<asp:FileUpload runat="server" ID="fuLogoEmpresa" />

					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
						ControlToValidate="fuLogoEmpresa" runat="server" ValidationGroup="ValidationAdd" />
				</div>
			</div>
			<br />

			<div class="row text-center">
				<div class="col-md-4 col-md-offset-4">
					<asp:ImageButton alt="-" ID="btnActualizar" runat="server" ImageUrl="~\ico\editar.png"
						OnClick="EditarRegistro" ValidationGroup="ValidationAdd" />

					<h4>Actualizar</h4>
				</div>
			</div>


		</ContentTemplate>
		<Triggers>
			<asp:PostBackTrigger ControlID="btnActualizar" />
		</Triggers>
	</asp:UpdatePanel>




</asp:Content>
