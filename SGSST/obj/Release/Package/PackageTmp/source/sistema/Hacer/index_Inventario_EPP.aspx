<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Inventario_EPP.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Inventario_EPP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="#">Inventario de EPP</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Inventario de EPP</h1>
    </div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="cantEquipos" Value="0"></asp:HiddenField>
            <div class="row form-group">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
            </div>

            <asp:PlaceHolder runat="server" ID="phInformacion" Visible="false">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#ingresos">Ingresos</a></li>
                    <li><a data-toggle="tab" href="#egresos">Egresos</a></li>
                    <li><a data-toggle="tab" href="#existencia">Existencia</a></li>
                </ul>
                <div class="tab-content">
                    <div id="ingresos" class="tab-pane fade in active">
                        <asp:Panel runat="server" ID="pnIngresos">
                            <asp:Table runat="server" ID="tb_ingresos" CssClass="table">
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell>Equipos</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Unidad</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Fecha</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Cantidad</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Proveedor</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </asp:Panel>
                    </div>
                    <div id="egresos" class="tab-pane fade">
                        <asp:Panel runat="server" ID="pnEgresos">
                            <asp:Table runat="server" ID="tb_egresos" CssClass="table">
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell>Equipos</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Cantidad</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Solicitante</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Fecha</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </asp:Panel>
                    </div>
                    <div id="existencia" class="tab-pane fade">
                        <asp:Panel runat="server" ID="pnExistencia">
                            <asp:Table runat="server" ID="tb_existencia" CssClass="table">
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell>Equipos</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Unidad</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Existencia</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </asp:Panel>
                    </div>
                </div>
                <!--  Fin de Informacion -->
                <div class="row">
                    <div class="col-md-3 col-md-offset-3">
                        <asp:Button ID="btnCalcular" runat="server" Text="CalcularInventario" Enabled="False"
                            CssClass="btn btn-block btn-info" OnClick="btnCalcular_Click" />
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="btnDocumento" runat="server" Text="Generar Documento" Enabled="False"
                            CssClass="btn btn-block btn-info" OnClick="GenerarDocumento" />
                    </div>

                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="phNoRegistros" Visible="false">
                <div class="row form-group">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <strong>
                            <label>No existen registros para ese puesto de trabajo.</label></strong>
                    </div>
                </div>
            </asp:PlaceHolder>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDocumento" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
