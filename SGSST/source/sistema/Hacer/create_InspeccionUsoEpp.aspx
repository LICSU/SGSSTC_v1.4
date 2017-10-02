<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionUsoEpp.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionUsoEpp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../Hacer/index_Inspecciones.aspx">Inspecciones</a></li>
        <li><a href="#">Crear Inspección de Uso de EPP</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Inspección de Uso de EPP</h1>
    </div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="cantInspecciones" Value="0"></asp:HiddenField>

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <h4 class="text-center">Área</h4>
                    <asp:DropDownList runat="server" ID="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <h4 class="text-center">Puesto de Trabajo</h4>
                    <asp:DropDownList runat="server" ID="ddlPuesto" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Puesto de Trabajo" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPuesto_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <h4 class="text-center">Trabajador</h4>
                    <asp:DropDownList ID="ddlTrabajador" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-2 col-md-offset-5">
                    <h4 class="text-center">&nbsp;</h4>
                    <asp:Button runat="server" ID="btnBuscar" data-toggle="tooltip" data-placement="bottom" 
                        title="Presione para buscar" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_OnClick" />
                </div>
            </div>

            <hr />

            <asp:PlaceHolder runat="server" ID="phInformacion" Visible="False">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel runat="server" ID="pnDatos">
                            <asp:Table runat="server" ID="tb_datos" CssClass="table">
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell RowSpan="2">EQUIPO DE PROTECCION PERSONAL</asp:TableHeaderCell>
                                    <asp:TableHeaderCell CssClass="text-center" ColumnSpan="2">USO</asp:TableHeaderCell>
                                    <asp:TableHeaderCell CssClass="text-center" ColumnSpan="2">ESTADO</asp:TableHeaderCell>
                                    <asp:TableHeaderCell RowSpan="2">OBSERVACIONES</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                    <asp:TableHeaderCell CssClass="text-center">APTO</asp:TableHeaderCell>
                                    <asp:TableHeaderCell CssClass="text-center">NO APTO</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2 col-md-offset-5">
                        <asp:Button runat="server" ID="btnDocumento" Text="Generar Documento"
                            CssClass="btn btn-block btn-info" OnClick="GenerarDocumento" />
                    </div>
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder runat="server" ID="phNoRegistros" Visible="false">
                <div class="row form-group">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <h4><strong>No existen registros para ese puesto de trabajo.</strong></h4>
                    </div>
                </div>
            </asp:PlaceHolder>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDocumento" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>