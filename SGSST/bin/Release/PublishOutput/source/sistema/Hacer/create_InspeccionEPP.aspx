<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionEPP.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionEPP" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>


    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../Hacer/index_Inspecciones.aspx">Inspecciones</a></li>
        <li><a href="#">Crear Inspección de EPP</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Inspección de de Equipos de Protección Personal</h1>
    </div>


    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="row form-group">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <h4 class="text-center">Area</h4>
                    <asp:DropDownList runat="server" ID="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <div class="col-md-3">
                    <h4 class="text-center">Puesto de Trabajo</h4>
                    <asp:DropDownList runat="server" ID="ddlPuesto" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Puesto de Trabajo" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPuesto_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>

            <asp:PlaceHolder runat="server" ID="phInformacion" Visible="False">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <asp:Panel runat="server" ID="pnEpp"></asp:Panel>
                    </div>
                </div>

                <asp:Label runat="server" ID="Label1"></asp:Label>

                <div class="row text-center">

                    <asp:PlaceHolder runat="server" ID="phGenerarDocumento" Visible="False">
                        <div class="col-md-3 col-md-offset-3">
                            <asp:ImageButton alt="-" ID="btnDocumento" runat="server" ImageUrl="~\ico\print.png"
                                OnClick="GenerarDocumento" />
                            <h4>Generar Documento</h4>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" ID="phinicial">
                        <div class="col-md-3"></div>
                    </asp:PlaceHolder>

                    <div class="col-md-3">
                        <asp:ImageButton alt="-" ID="btnGenerar" runat="server" ImageUrl="~\ico\calculator.png"
                            OnClick="btnGenerar_Click" />
                        <h4>Generar Resultados</h4>
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
            <asp:PostBackTrigger ControlID="btnGenerar" />
            <asp:PostBackTrigger ControlID="btnDocumento" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
