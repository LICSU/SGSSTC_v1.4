<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_PlanillaEntregaEpp.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.create_PlanillaEntregaEpp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../Hacer/index_PlanillaEntregaEpp.aspx">Planilla de Entrega de EPP</a></li>
        <li><a href="#">Crear Planilla de Entrega de EPP</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Planilla de Entrega de EPP</h1>
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
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <h4 class="text-center">Trabajador</h4>
                    <asp:TextBox ID="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>
                    <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1"
                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                        TargetControlID="txtTrabajador" ID="AutoCompleteExtender1" runat="server"
                        FirstRowSelected="false"
                        CompletionListCssClass="completionList"
                        CompletionListItemCssClass="listItem"
                        CompletionListHighlightedItemCssClass="itemHighlighted">
                    </cc1:AutoCompleteExtender>
                </div>

                <div class="col-md-3">
                    <h4 class="text-center">&nbsp;</h4>
                    <asp:Button runat="server" ID="btnBuscar" data-toggle="tooltip" data-placement="bottom" 
                        title="Presione para buscar" Text="Generar" CssClass="btn btn-primary" 
                        OnClick="btnGenerar_OnClick" />
                </div>
            </div>

            <asp:PlaceHolder runat="server" ID="phInformacion" Visible="False">

                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel runat="server" ID="pnDatos">
                            <asp:Table runat="server" ID="tb_datos" CssClass="table">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell CssClass="col-md-2">Dotación Entregada</asp:TableHeaderCell>
                                    <asp:TableHeaderCell CssClass="col-md-7">Detalles de la Dotación</asp:TableHeaderCell>
                                    <asp:TableHeaderCell CssClass="col-md-1">Cantidad</asp:TableHeaderCell>
                                    <asp:TableHeaderCell CssClass="col-md-2">Fecha de Entrega</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:Button ID="btnDocumento" runat="server" Text="Generar Documento"
                            OnClick="GenerarDocumento" CssClass="btn btn-block btn-info" />
                    </div>
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder runat="server" ID="phNoRegistros" Visible="false">
                <div class="row form-group">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <strong>
                            <label>No existen registros para ese puesto de trabajo.</label>
                        </strong>
                    </div>
                </div>
            </asp:PlaceHolder>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDocumento" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>