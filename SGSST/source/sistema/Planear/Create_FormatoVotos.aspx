<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_FormatoVotos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_FormatoVotos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35"    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_ActaCopasst.aspx">Actas Copasst</a></li>
		<li><a href="#">Crear Formato de Votos</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Votos por candidatos individuales</h1>
	</div>

	<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
		<div id="divAlerta" runat="server">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
		</div>
	</asp:PlaceHolder>

	<div class="row">
		<asp:PlaceHolder runat="server" ID="phEmpresa">
			<div class="col-md-4">
				<h4 class="text-center">Empresa</h4>
				<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
					OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
				</asp:DropDownList>
			</div>
		</asp:PlaceHolder>

		<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
			<div class="col-md-4 col-md-offset-4">
				<h4 class="text-center">Sucursal</h4>
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
					OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
				</asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>
	<br />
	<br />

	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<asp:Panel runat="server" ID="pnDatos">
				<table class="table table-condensed">

					<tr class="bg-aqua color-palette">
						<th class="col-md-5 text-center">TRABAJADOR</th>
						<th class="col-md-5 text-center">FOTO</th>
						<th class="col-md-2 text-center">CAMPO VOTAR</th>
					</tr>

					<tr>
						<td>
                            <asp:TextBox ID="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:hiddenfield id="hdnValue" onvaluechanged="hdnValue_ValueChanged" runat="server"/>
                            <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtTrabajador" ID="AutoCompleteExtender1" runat="server"
                                FirstRowSelected="false"
                                CompletionListCssClass="completionList"
                                OnClientItemSelected="OnContactSelected"
                                CompletionListItemCssClass="listItem"
                                CompletionListHighlightedItemCssClass="itemHighlighted">
                            </cc1:AutoCompleteExtender>
						</td>

						<td>
							<asp:Image alt="-" runat="server" ID="Image1" class="img-circle" Width="128" Height="128" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="txtTrabajador2" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:hiddenfield id="hdnValue2" onvaluechanged="hdnValue2_ValueChanged" runat="server"/>
                            <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador2" MinimumPrefixLength="1"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtTrabajador2" ID="AutoCompleteExtender2" runat="server"
                                FirstRowSelected="false"
                                CompletionListCssClass="completionList"
                                OnClientItemSelected="OnContactSelected2"
                                CompletionListItemCssClass="listItem"
                                CompletionListHighlightedItemCssClass="itemHighlighted">
                            </cc1:AutoCompleteExtender>
						</td>

						<td>
							<asp:Image alt="-" runat="server" ID="Image2" class="img-circle" Width="128" Height="128" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="txtTrabajador3" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:hiddenfield id="hdnValue3" onvaluechanged="hdnValue3_ValueChanged" runat="server"/>
                            <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador3" MinimumPrefixLength="1"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtTrabajador3" ID="AutoCompleteExtender3" runat="server"
                                FirstRowSelected="false"
                                CompletionListCssClass="completionList"
                                OnClientItemSelected="OnContactSelected3"
                                CompletionListItemCssClass="listItem"
                                CompletionListHighlightedItemCssClass="itemHighlighted">
                            </cc1:AutoCompleteExtender>
						</td>

						<td>
							<asp:Image alt="-" runat="server" ID="Image3" class="img-circle" Width="128" Height="128" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="txtTrabajador4" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:hiddenfield id="hdnValue4" onvaluechanged="hdnValue4_ValueChanged" runat="server"/>
                            <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador4" MinimumPrefixLength="1"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtTrabajador4" ID="AutoCompleteExtender4" runat="server"
                                FirstRowSelected="false"
                                CompletionListCssClass="completionList"
                                OnClientItemSelected="OnContactSelected4"
                                CompletionListItemCssClass="listItem"
                                CompletionListHighlightedItemCssClass="itemHighlighted">
                            </cc1:AutoCompleteExtender>
						</td>

						<td>
							<asp:Image alt="-" runat="server" ID="Image4" class="img-circle" Width="128" Height="128" />
						</td>
						<td></td>
					</tr>

				</table>
			</asp:Panel>
		</div>
	</div>
	<br />

	<div class="row text-center">
		<div class="col-md-4 col-md-offset-4">
			<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento" 
				ValidationGroup="ValidationAdd" />
			<h4>Generar Documento</h4>
		</div>
	</div>
     <script>
        function OnContactSelected(source, eventArgs) {
        
            var hdnValueID = "<%= hdnValue.ClientID %>";

            document.getElementById(hdnValueID).value = eventArgs.get_value();
            __doPostBack(hdnValueID, "");
         }  
         function OnContactSelected2(source, eventArgs) {

             var hdnValueID = "<%= hdnValue2.ClientID %>";

             document.getElementById(hdnValueID).value = eventArgs.get_value();
             __doPostBack(hdnValueID, "");
         }  
         function OnContactSelected3(source, eventArgs) {

             var hdnValueID = "<%= hdnValue3.ClientID %>";

             document.getElementById(hdnValueID).value = eventArgs.get_value();
             __doPostBack(hdnValueID, "");
         }  
         function OnContactSelected4(source, eventArgs) {

             var hdnValueID = "<%= hdnValue4.ClientID %>";

             document.getElementById(hdnValueID).value = eventArgs.get_value();
             __doPostBack(hdnValueID, "");
         }  
    </script>
</asp:Content>
