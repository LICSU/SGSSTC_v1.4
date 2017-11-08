<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EstructuraQuimicos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_EstructuraQuimicos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EstructuraRiesgos.aspx">Formato para la identificación de riesgos</a></li>
		<li><a href="#">Químicos</a></li>
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
                    <asp:TableCell>Material Particulado</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt1" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Vapores</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt2" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Gases</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt3" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Humos</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt4" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Polvos</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt5" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Liquidos/ Disolventes</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txts6" CssClass="form-control"></asp:TextBox></asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="txtt6" TextMode="Number" CssClass="form-control"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>

    <div class="row">
		<div class="col-md-8 col-md-offset-2">
            <div class="col-md-4">
                <asp:Table runat="server" ID="Table2"  CssClass="table table-response">
                    <asp:TableHeaderRow CssClass="bg-aqua">
                        <asp:TableHeaderCell ColumnSpan="2">Agente Químico</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>Asbesto</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq1" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Benceno</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq2" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Berilio</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq3" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Bromo</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq4" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Cadmio</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq5" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Carburo</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq6" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Cloro</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq7" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Cromo</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq8" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Flúor</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq9" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Fosforo</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq10" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Hidrocarburos</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq11" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Yodo</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq12" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Manganeso</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq13" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Plomo</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chkq14" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div class="col-md-4">
                <asp:Table runat="server" ID="tbSust"  CssClass="table table-response">
                    <asp:TableHeaderRow CssClass="bg-aqua">
                        <asp:TableHeaderCell ColumnSpan="2">Sustancias Asfixiantes</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>Monóxido de Carbono</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chk1" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Cianuro de Hidrógeno</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chk2" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Sulfuro de Hidrógeno</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chk3" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Silíce libre</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chk4" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Sulfuro de Carbono</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chk5" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div class="col-md-4">
                <asp:Table runat="server" ID="Table1"  CssClass="table table-response">
                    <asp:TableHeaderRow CssClass="bg-aqua">
                        <asp:TableHeaderCell ColumnSpan="2">Otras Sustancias</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>Alquitrán</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chko1" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Brea</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chko2" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Betún</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chko3" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Parafina</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chko4" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Hulla Mineral</asp:TableCell>
                        <asp:TableCell><asp:CheckBox runat="server" ID="chko5" CssClass="check"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            
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
