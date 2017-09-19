<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PlanCapacitacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_PlanCapacitacion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="#">Plan de Capacitación</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Plan de Capacitación</h1>
    </div>


    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="row form-group">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom"
                            title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom"
                            title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
            </div>

            <asp:PlaceHolder runat="server" ID="phInformacion" Visible="False">
                <div class="row table-responsive" style="width:2000px;overflow: auto;">
                    <div class="col-md-12">
                        <asp:Panel runat="server" ID="pnDatos">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading bg-aqua color-palette bg-aqua color-palette">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">TIPO DE RIESGO: Mecánicos</a>
                                        </h4>
                                    </div>
                                    <div id="collapse1" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <!-- Mecanicos -->
                                            <asp:Table runat="server" ID="tb_datos" CssClass="table">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>1</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg1" Text="Riesgos Mecánicos y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP1"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP1"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP1"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP1"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP1" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP1" GroupName="p1"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP1" GroupName="p1"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP1"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP1"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>2</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg2" Text="Almacenamiento adecuado (Pasillos Libres)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP2"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP2"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP2"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP2"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP2" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP2" GroupName="p2"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP2" GroupName="p2"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP2"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP2"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>3</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg3" Text="Guardas protectoras"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP3"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP3"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP3"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP3"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP3" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP3" GroupName="p3"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP3" GroupName="p3"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP3"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP3"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>4</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg4" Text="Organización y Técnicas de Manejo de Almacenes"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP4"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP4"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP4"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP4"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP4" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP4" GroupName="p4"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP4" GroupName="p4"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP4"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP4"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>5</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg5" Text="Prevención en el Uso de Escaleras Fijas y Portátiles"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP5"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP5"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP5"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP5"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP5" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP5" GroupName="p5"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP5" GroupName="p5"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP5"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP5"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>6</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg6" Text="Primera norma de prevención 'Trabaje Correctamente'"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP6"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP6"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP6"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP6"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP6" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP6" GroupName="p6"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP6" GroupName="p6"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP6"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP6"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>7</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg7" Text="Manejo adecuado de Herramientas 'Trabaje Correctamente'"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP7"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP7"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP7"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP7"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP7" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP7" GroupName="p7"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP7" GroupName="p7"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP7"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP7"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>8</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg8" Text="Riesgos Mecánicos y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP8"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP8"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP8"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP8"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP8" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP8" GroupName="p8"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP8" GroupName="p8"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP8"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP8"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>9</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg9" Text="Riesgos presentados en las Oficinas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP9"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP9"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP9"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP9"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP9" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP9" GroupName="p9"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP9" GroupName="p9"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP9"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP9"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>10</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg10" Text="Seguridad y Protección Personal en el Ámbito Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP10"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP10"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP10"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP10"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP10" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP10" GroupName="p10"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP10" GroupName="p10"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP10"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP10"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>11</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg11" Text="Trabajo en Alturas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP11"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP11"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP11"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP11"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP11" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP11" GroupName="p11"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP11" GroupName="p11"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP11"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP11"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>12</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg12" Text="Seguridad en el Manejo del Montacargas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP12"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP12"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP12"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP12"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP12" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP12" GroupName="p12"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP12" GroupName="p12"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP12"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP12"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>13</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg13" Text="Diseño de un Plan de Orden y Limpieza en la Empresa según la  Implementación de la metodología de las 5S"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP13"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP13"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP13"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP13"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP13" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP13" GroupName="p13"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP13" GroupName="p13"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP13"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP13"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading bg-aqua color-palette">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">TIPO DE RIESGO: Físicos</a>
                                        </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <!-- Fisicos -->
                                            <asp:Table runat="server" ID="Table2" CssClass="table">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>14</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg14" Text="El Ruido y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP14"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP14"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP14"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP14"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP14" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP14" GroupName="p14"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP14" GroupName="p14"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP14"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP14"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>15</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg15" Text="Radiaciones Ionizantes"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP15"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP15"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP15"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP15"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP15" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP15" GroupName="p15"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP15" GroupName="p15"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP15"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP15"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>16</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg16" Text="Radiaciones No Ionizantes"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP16"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP16"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP16"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP16"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP16" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP16" GroupName="p16"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP16" GroupName="p16"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP16"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP16"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>17</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg17" Text="Temperaturas Extremas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP17"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP17"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP17"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP17"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP17" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP17" GroupName="p17"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP17" GroupName="p17"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP17"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP17"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>18</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg18" Text="Vibraciones"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP18"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP18"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP18"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP18"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP18" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP18" GroupName="p18"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP18" GroupName="p18"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP18"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP18"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading bg-aqua color-palette">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">TIPO DE RIESGO: Disergonómicos</a>
                                        </h4>
                                    </div>
                                    <div id="collapse3" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <!-- Disergonómicos -->
                                            <asp:Table runat="server" ID="Table1" CssClass="table">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>19</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg19" Text="Manejo  manual de cargas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP19"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP19"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP19"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP19"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP19" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP19" GroupName="p19"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP19" GroupName="p19"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP19"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP19"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>20</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg20" Text="Condiciones Disergonómicas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP20"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP20"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP20"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP20"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP20" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP20" GroupName="p20"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP20" GroupName="p20"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP20"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP20"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>21</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg21" Text="Ergonomía en la Oficina"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP21"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP21"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP21"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP21"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP21" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP21" GroupName="p21"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP21" GroupName="p21"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP21"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP21"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>22</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg22" Text="Higiene Postural"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP22"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP22"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP22"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP22"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP22" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP22" GroupName="p22"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP22" GroupName="p22"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP22"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP22"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>23</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg23" Text="Ergonomía de Levantar y Bajar Cargas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP23"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP23"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP23"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP23"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP23" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP23" GroupName="p23"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP23" GroupName="p23"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP23"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP23"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>24</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg24" Text="Biomecánica aplicada a la Ergonomía"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP24"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP24"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP24"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP24"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP24" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP24" GroupName="p24"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP24" GroupName="p24"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP24"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP24"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>25</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg25" Text="Biomecánica aplicada a la Ergonomía "></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP25"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP25"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP25"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP25"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP25" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP25" GroupName="p25"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP25" GroupName="p25"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP25"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP25"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>26</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg26" Text="Evaluación Metabólica de la Actividad Física"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP26"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP26"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP26"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP26"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP26" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP26" GroupName="p26"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP26" GroupName="p26"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP26"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP26"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>27</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg27" Text="Gimnasia Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP27"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP27"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP27"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP27"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP27" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP27" GroupName="p27"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP27" GroupName="p27"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP27"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP27"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>28</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg28" Text="Lumbagos y el Cuidado de la Columna"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP28"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP28"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP28"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP28"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP28" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP28" GroupName="p28"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP28" GroupName="p28"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP28"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP28"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>29</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg29" Text="Síndrome del Túnel Carpiano"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP29"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP29"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP29"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP29"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP29" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP29" GroupName="p29"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP29" GroupName="p29"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP29"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP29"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>30</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg30" Text="Problemas Ergonómicos asociados al Diseño de Mobiliario"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP30"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP30"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP30"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP30"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP30" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP30" GroupName="p30"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP30" GroupName="p30"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP30"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP30"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>31</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg31" Text="Trastornos Musculo Esqueléticos de origen laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP31"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP31"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP31"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP31"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP31" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP31" GroupName="p31"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP31" GroupName="p31"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP31"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP31"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>32</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg32" Text="Pausas Activas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP32"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP32"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP32"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP32"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP32" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP32" GroupName="p32"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP32" GroupName="p32"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP32"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP32"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading bg-aqua color-palette">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">TIPO DE RIESGO: Químicos</a>
                                        </h4>
                                    </div>
                                    <div id="collapse4" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <!-- Químicos -->
                                            <asp:Table runat="server" ID="Table3" CssClass="table">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>33</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg33" Text="Riesgos Químicos y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP33"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP33"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP33"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP33"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP33" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP33" GroupName="p33"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP33" GroupName="p33"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP33"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP33"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>34</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg34" Text="Prevención en el Uso de la Gasolina"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP34"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP34"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP34"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP34"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP34" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP34" GroupName="p34"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP34" GroupName="p34"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP34"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP34"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>35</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg35" Text="Prevención en el Uso de la Soda Caustica"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP35"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP35"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP35"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP35"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP35" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP35" GroupName="p35"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP35" GroupName="p35"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP35"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP35"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>36</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg36" Text="Efectos De Productos Químicos En La Salud"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP36"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP36"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP36"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP36"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP36" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP36" GroupName="p36"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP36" GroupName="p36"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP36"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP36"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>37</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg37" Text="Factores de Riesgo Químico"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP37"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP37"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP37"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP37"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP37" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP37" GroupName="p37"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP37" GroupName="p37"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP37"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP37"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>38</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg38" Text="Prácticas para el Almacenamiento de Productos Químicos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP38"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP38"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP38"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP38"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP38" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP38" GroupName="p38"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP38" GroupName="p38"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP38"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP38"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>39</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg39" Text="¿La Seguridad en el transporte de Sustancias Peligrosas?"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP39"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP39"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP39"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP39"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP39" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP39" GroupName="p39"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP39" GroupName="p39"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP39"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP39"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>40</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg40" Text="¿Que Hacer en caso de un derrame?"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP40"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP40"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP40"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP40"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP40" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP40" GroupName="p40"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP40" GroupName="p40"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP40"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP40"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>41</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg41" Text="Instrucciones para el uso, almacenado y conservación de Respiración semi-facial"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP41"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP41"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP41"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP41"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP41" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP41" GroupName="p41"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP41" GroupName="p41"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP41"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP41"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>42</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg42" Text="Incendios en Líquidos y Gases y sus Riesgos Asociados"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP42"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP42"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP42"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP42"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP42" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP42" GroupName="p42"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP42" GroupName="p42"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP42"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP42"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>43</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg43" Text="Almacenamiento de Inflamables y Combustibles"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP43"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP43"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP43"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP43"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP43" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP43" GroupName="p43"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP43" GroupName="p43"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP43"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP43"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading bg-aqua color-palette">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">TIPO DE RIESGO: Eléctricos</a>
                                        </h4>
                                    </div>
                                    <div id="collapse5" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <!-- Eléctricos -->
                                            <asp:Table runat="server" ID="Table4" CssClass="table">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>44</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg44" Text="Riesgos Eléctricos y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP44"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP44"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP44"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP44"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP44" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP44" GroupName="p44"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP44" GroupName="p44"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP44"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP44"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>45</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg45" Text="Peligros de Choque en Circuitos de Baja Tensión"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP45"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP45"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP45"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP45"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP45" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP45" GroupName="p45"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP45" GroupName="p45"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP45"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP45"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>46</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg46" Text="Trabajo con Herramientas Eléctricas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP46"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP46"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP46"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP46"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP46" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP46" GroupName="p46"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP46" GroupName="p46"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP46"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP46"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>47</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg47" Text="Sistemas a Tierra"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP47"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP47"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP47"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP47"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP47" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP47" GroupName="p47"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP47" GroupName="p47"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP47"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP47"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading bg-aqua color-palette">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">TIPO DE RIESGO: Psicosocial Desarrollo Conductual</a>
                                        </h4>
                                    </div>
                                    <div id="collapse6" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <!-- Psicosocial Desarrollo Conductual -->
                                            <asp:Table runat="server" ID="Table5" CssClass="table">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>48</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg48" Text="Calidad de Vida en el Trabajo"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP48"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP48"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP48"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP48"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP48" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP48" GroupName="p48"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP48" GroupName="p48"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP48"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP48"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>49</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg49" Text="Gerencia Proactiva"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP49"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP49"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP49"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP49"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP49" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP49" GroupName="p49"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP49" GroupName="p49"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP49"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP49"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>50</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg50" Text="La Desigualdad y Discriminación en el Contexto Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP50"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP50"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP50"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP50"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP50" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP50" GroupName="p50"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP50" GroupName="p50"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP50"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP50"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>51</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg51" Text="La Fisiología y Psicología aplicada a la Ergonomía"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP51"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP51"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP51"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP51"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP51" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP51" GroupName="p51"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP51" GroupName="p51"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP51"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP51"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>52</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg52" Text="Actitud Mental Positiva 'Más Importante es Nuestra Actitud que lo que nos Pasa'"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP52"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP52"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP52"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP52"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP52" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP52" GroupName="p52"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP52" GroupName="p52"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP52"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP52"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>53</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg53" Text="Alcoholismo y daños Generados a la Salud"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP53"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP53"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP53"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP53"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP53" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP53" GroupName="p53"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP53" GroupName="p53"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP53"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP53"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>54</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg54" Text="Drogas y daños Generados a la Salud"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP54"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP54"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP54"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP54"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP54" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP54" GroupName="p54"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP54" GroupName="p54"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP54"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP54"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>55</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg55" Text="Estrés Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP55"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP55"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP55"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP55"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP55" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP55" GroupName="p55"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP55" GroupName="p55"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP55"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP55"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>56</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg56" Text="Obesidad y sus Consecuencias para la Salud"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP56"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP56"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP56"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP56"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP56" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP56" GroupName="p56"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP56" GroupName="p56"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP56"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP56"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>57</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg57" Text="Actitudes Positivas en el Entorno Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP57"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP57"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP57"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP57"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP57" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP57" GroupName="p57"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP57" GroupName="p57"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP57"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP57"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>58</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg58" Text="Administración  de Vida para el Rendimiento y Control Efectivo del Tiempo"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP58"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP58"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP58"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP58"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP58" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP58" GroupName="p58"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP58" GroupName="p58"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP58"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP58"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>59</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg59" Text="Asertividad en el Contexto Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP59"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP59"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP59"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP59"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP59" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP59" GroupName="p59"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP59" GroupName="p59"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP59"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP59"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>60</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg60" Text="Autoestima y Motivación al Logro"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP60"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP60"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP60"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP60"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP60" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP60" GroupName="p60"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP60" GroupName="p60"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP60"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP60"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>61</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg61" Text="Como Ser un Triunfador a través de la Programación Neurolingüística (PNL)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP61"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP61"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP61"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP61"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP61" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP61" GroupName="p61"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP61" GroupName="p61"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP61"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP61"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>62</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg62" Text="Conciencia y Compromiso Organizacional"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP62"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP62"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP62"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP62"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP62" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP62" GroupName="p62"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP62" GroupName="p62"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP62"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP62"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>63</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg63" Text="Conductas Toxicas que Afectan la Vida Personal y Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP63"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP63"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP63"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP63"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP63" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP63" GroupName="p63"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP63" GroupName="p63"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP63"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP63"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>64</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg64" Text="Controlando las Emociones en vez de que ellas te Controlen"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP64"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP64"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP64"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP64"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP64" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP64" GroupName="p64"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP64" GroupName="p64"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP64"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP64"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>65</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg65" Text="Desarrollo del Potencial Humano"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP65"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP65"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP65"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP65"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP65" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP65" GroupName="p65"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP65" GroupName="p65"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP65"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP65"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>66</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg66" Text="Psicología Aplicada a la Supervisión, Manejo del Stress, Control de Situaciones"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP66"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP66"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP66"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP66"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP66" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP66" GroupName="p66"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP66" GroupName="p66"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP66"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP66"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>67</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg67" Text="Sentir Pensar y Actuar."></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP67"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP67"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP67"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP67"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP67" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP67" GroupName="p67"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP67" GroupName="p67"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP67"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP67"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>68</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg68" Text="Desarrollo Personal y Crecimiento Empresarial"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP68"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP68"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP68"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP68"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP68" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP68" GroupName="p68"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP68" GroupName="p68"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP68"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP68"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>69</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg69" Text="'El Modelo de Fluir', la Respuesta a Como Motivar a otros y a Auto motivarse"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP69"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP69"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP69"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP69"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP69" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP69" GroupName="p69"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP69" GroupName="p69"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP69"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP69"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>70</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg70" Text="El Zen del Trabajo en Equipo: Equipos Colaboradores “Altos Niveles de Confianza"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP70"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP70"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP70"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP70"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP70" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP70" GroupName="p70"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP70" GroupName="p70"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP70"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP70"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>71</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg71" Text="Establecimiento de Prioridades"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP71"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP71"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP71"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP71"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP71" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP71" GroupName="p71"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP71" GroupName="p71"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP71"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP71"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>72</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg72" Text="Estrés Ocupacional y Bienestar Integral en la Empresa"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP72"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP72"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP72"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP72"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP72" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP72" GroupName="p72"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP72" GroupName="p72"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP72"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP72"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>73</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg73" Text="Garantizar Bienestar en el Campo Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP73"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP73"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP73"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP73"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP73" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP73" GroupName="p73"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP73" GroupName="p73"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP73"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP73"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>74</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg74" Text="Imagen y Calidad en el Servicio al Cliente"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP74"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP74"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP74"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP74"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP74" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP74" GroupName="p74"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP74" GroupName="p74"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP74"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP74"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>75</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg75" Text="Integración de Equipos de Alto Rendimiento"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP75"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP75"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP75"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP75"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP75" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP75" GroupName="p75"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP75" GroupName="p75"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP75"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP75"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>76</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg76" Text="Inteligencia Emocional en el Contexto Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP76"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP76"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP76"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP76"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP76" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP76" GroupName="p76"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP76" GroupName="p76"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP76"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP76"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>77</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg77" Text="La Manipulación en las Relaciones Humanas (Personales y Laborales)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP77"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP77"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP77"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP77"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP77" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP77" GroupName="p77"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP77" GroupName="p77"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP77"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP77"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>78</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg78" Text="Los Efectos Psicosociales Espirituales de la Queja y la Murmuración"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP78"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP78"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP78"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP78"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP78" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP78" GroupName="p78"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP78" GroupName="p78"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP78"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP78"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>79</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg79" Text="Manejo constructivo del Conflicto"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP79"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP79"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP79"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP79"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP79" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP79" GroupName="p79"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP79" GroupName="p79"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP79"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP79"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>80</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg80" Text="Manejo del Enojo “Las caras de la Ira”"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP80"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP80"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP80"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP80"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP80" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP80" GroupName="p80"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP80" GroupName="p80"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP80"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP80"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>81</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg81" Text="Técnicas Básicas de Supervisión y Gerencia"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP81"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP81"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP81"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP81"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP81" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP81" GroupName="p81"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP81" GroupName="p81"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP81"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP81"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>82</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg82" Text="Toma de Decisiones"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP82"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP82"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP82"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP82"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP82" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP82" GroupName="p82"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP82" GroupName="p82"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP82"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP82"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>83</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg83" Text="Acoso Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP83"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP83"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP83"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP83"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP83" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP83" GroupName="p83"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP83" GroupName="p83"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP83"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP83"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>84</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg84" Text="Atención Al Cliente (Reacción Ante Personas Difíciles, Indecisas O Sumisas)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP84"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP84"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP84"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP84"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP84" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP84" GroupName="p84"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP84" GroupName="p84"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP84"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP84"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>85</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg85" Text="Liderazgo y Trabajo en Equipo"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP85"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP85"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP85"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP85"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP85" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP85" GroupName="p85"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP85" GroupName="p85"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP85"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP85"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>86</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg86" Text="Empleo del Vocabulario adecuado en el trabajo"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP86"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP86"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP86"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP86"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP86" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP86" GroupName="p86"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP86" GroupName="p86"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP86"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP86"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>87</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg87" Text="Creer, crear y crecer. Las tres C de la Excelencia"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP87"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP87"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP87"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP87"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP87" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP87" GroupName="p87"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP87" GroupName="p87"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP87"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP87"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>88</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg88" Text="Manejo del stress, distres y eutres"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP88"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP88"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP88"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP88"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP88" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP88" GroupName="p88"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP88" GroupName="p88"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP88"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP88"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>89</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg89" Text="El Despertar de los Valores"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP89"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP89"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP89"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP89"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP89" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP89" GroupName="p89"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP89" GroupName="p89"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP89"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP89"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>90</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg90" Text="Motivación al Logro 'Alcanzando Metas Profesionales y Personales'"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP90"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP90"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP90"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP90"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP90" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP90" GroupName="p90"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP90" GroupName="p90"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP90"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP90"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>91</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg91" Text="Negociación Ganar/Ganar"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP91"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP91"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP91"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP91"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP91" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP91" GroupName="p91"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP91" GroupName="p91"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP91"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP91"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>92</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg92" Text="Clima y Cultura Organizacional"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP92"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP92"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP92"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP92"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP92" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP92" GroupName="p92"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP92" GroupName="p92"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP92"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP92"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>93</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg93" Text="Desarrollar condiciones y relaciones de trabajo más satisfactorias"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP93"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP93"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP93"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP93"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP93" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP93" GroupName="p93"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP93" GroupName="p93"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP93"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP93"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>94</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg94" Text="Elevar la concepción de valores de ética y moral más el compromiso organizacional"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP94"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP94"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP94"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP94"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP94" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP94" GroupName="p94"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP94" GroupName="p94"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP94"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP94"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>95</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg95" Text="Manejo de conflictos intrapersonales"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP95"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP95"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP95"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP95"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP95" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP95" GroupName="p95"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP95" GroupName="p95"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP95"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP95"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>96</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg96" Text="Trabajo Efectivo en Equipo"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP96"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP96"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP96"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP96"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP96" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP96" GroupName="p96"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP96" GroupName="p96"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP96"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP96"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>97</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg97" Text="Contribuir el mejoramiento humano integral y continuo de cada talento, en lo social, moral,"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP97"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP97"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP97"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP97"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP97" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP97" GroupName="p97"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP97" GroupName="p97"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP97"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP97"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>98</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg98" Text="Calidad De Servicio Aplicado A Las Ventas, Promociones Y Cobranzas (Gerencia, Ventas, Plataforma, Cobranzas, Administración)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP98"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP98"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP98"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP98"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP98" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP98" GroupName="p98"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP98" GroupName="p98"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP98"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP98"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading bg-aqua color-palette">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">TIPO DE RIESGO: Prevención de Emergencias</a>
                                        </h4>
                                    </div>
                                    <div id="collapse7" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <!-- Prevención de Emergencias -->
                                            <asp:Table runat="server" ID="Table6" CssClass="table">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>99</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg99" Text="Uso y manejo de Extintores (Teórico – Práctico)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP99"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP99"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP99"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP99"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP99" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP99" GroupName="p99"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP99" GroupName="p99"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP99"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP99"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>100</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg100" Text="Identificación y Manejo de Materiales y Sustancias Peligrosas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP100"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP100"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP100"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP100"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP100" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP100" GroupName="p100"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP100" GroupName="p100"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP100"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP100"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>101</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg101" Text="Evacuación y Desalojo de Estructuras (Teórico – Práctico)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP101"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP101"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP101"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP101"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP101" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP101" GroupName="p101"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP101" GroupName="p101"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP101"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP101"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>102</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg102" Text="Conformación de Brigadas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP102"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP102"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP102"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP102"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP102" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP102" GroupName="p102"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP102" GroupName="p102"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP102"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP102"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>103</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg103" Text="Nociones Básicas de un Plan de Emergencias"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP103"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP103"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP103"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP103"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP103" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP103" GroupName="p103"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP103" GroupName="p103"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP103"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP103"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>104</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg104" Text="Conocimientos Básicos de Control y Prevención de Incendios"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP104"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP104"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP104"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP104"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP104" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP104" GroupName="p104"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP104" GroupName="p104"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP104"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP104"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>105</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg105" Text="Logística y Planificación Estratégica, Contingencias"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP105"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP105"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP105"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP105"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP105" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP105" GroupName="p105"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP105" GroupName="p105"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP105"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP105"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>106</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg106" Text="Manejo del Plan de Evacuación y Plan de Emergencias"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP106"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP106"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP106"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP106"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP106" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP106" GroupName="p106"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP106" GroupName="p106"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP106"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP106"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>107</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg107" Text="Administración de Emergencias"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP107"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP107"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP107"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP107"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP107" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP107" GroupName="p107"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP107" GroupName="p107"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP107"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP107"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>108</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg108" Text="Articulación de la Brigada con el Cuerpo de Bomberos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP108"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP108"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP108"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP108"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP108" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP108" GroupName="p108"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP108" GroupName="p108"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP108"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP108"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>109</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg109" Text="Gestión para el Control de Emergencias   "></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP109"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP109"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP109"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP109"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP109" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP109" GroupName="p109"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP109" GroupName="p109"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP109"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP109"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>110</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg110" Text="Prevención e Inspección de Incendios"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP110"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP110"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP110"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP110"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP110" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP110" GroupName="p110"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP110" GroupName="p110"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP110"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP110"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>111</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg111" Text="Comportamiento del Fuego"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP111"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP111"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP111"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP111"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP111" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP111" GroupName="p111"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP111" GroupName="p111"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP111"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP111"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>112</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg112" Text="Métodos, Agentes y Equipos de Extinción"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP112"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP112"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP112"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP112"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP112" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP112" GroupName="p112"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP112" GroupName="p112"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP112"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP112"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>113</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg113" Text="Mangueras y Accesorios para Control de Incendios"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP113"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP113"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP113"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP113"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP113" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP113" GroupName="p113"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP113" GroupName="p113"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP113"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP113"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>114</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg114" Text="Chorros para Control de Incendios"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP114"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP114"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP114"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP114"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP114" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP114" GroupName="p114"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP114" GroupName="p114"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP114"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP114"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>115</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg115" Text="Equipos de Respiración Autónoma"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP115"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP115"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP115"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP115"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP115" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP115" GroupName="p115"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP115" GroupName="p115"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP115"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP115"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>116</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg116" Text="Escaleras para Operaciones de Incendios        "></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP116"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP116"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP116"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP116"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP116" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP116" GroupName="p116"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP116" GroupName="p116"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP116"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP116"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>117</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg117" Text="Técnicas de Control de Incendios"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP117"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP117"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP117"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP117"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP117" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP117" GroupName="p117"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP117" GroupName="p117"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP117"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP117"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>118</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg118" Text="Sistemas de Protección Contra incendios"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP118"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP118"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP118"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP118"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP118" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP118" GroupName="p118"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP118" GroupName="p118"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP118"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP118"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>119</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg119" Text="Primer Respondiente en Materiales Peligrosos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP119"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP119"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP119"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP119"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP119" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP119" GroupName="p119"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP119" GroupName="p119"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP119"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP119"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>120</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg120" Text="Simulaciones y Simulacros"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP120"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP120"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP120"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP120"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP120" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP120" GroupName="p120"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP120" GroupName="p120"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP120"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP120"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>121</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg121" Text="Primer Respondiente a Emergencias Médicas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP121"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP121"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP121"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP121"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP121" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP121" GroupName="p121"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP121" GroupName="p121"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP121"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP121"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>122</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg122" Text="Reanimación Cardio Pulmonar (RCP)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP122"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP122"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP122"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP122"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP122" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP122" GroupName="p122"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP122" GroupName="p122"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP122"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP122"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>123</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg123" Text="Primer Respondiente en Rescate"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP123"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP123"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP123"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP123"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP123" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP123" GroupName="p123"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP123" GroupName="p123"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP123"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP123"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>124</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg124" Text="Procedimiento Operativo Normalizado"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP124"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP124"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP124"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP124"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP124" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP124" GroupName="p124"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP124" GroupName="p124"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP124"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP124"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading bg-aqua color-palette">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">TIPO DE RIESGO: Generales</a>
                                        </h4>
                                    </div>
                                    <div id="collapse8" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <!-- Generales -->
                                            <asp:Table runat="server" ID="Table7" CssClass="table">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                                    <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>125</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg125" Text="Herramientas Preventivas en Seguridad y Salud en el Trabajo"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP125"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP125"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP125"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP125"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP125" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP125" GroupName="p125"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP125" GroupName="p125"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP125"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP125"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>126</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg126" Text="Educación Vial"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP126"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP126"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP126"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP126"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP126" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP126" GroupName="p126"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP126" GroupName="p126"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP126"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP126"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>127</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg127" Text="Conocimiento Teórico sobre las Normas de Tránsito y el Comportamiento en la Vía"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP127"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP127"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP127"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP127"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP127" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP127" GroupName="p127"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP127" GroupName="p127"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP127"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP127"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>128</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg128" Text="Cultura de prevención"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP128"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP128"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP128"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP128"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP128" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP128" GroupName="p128"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP128" GroupName="p128"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP128"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP128"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>129</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg129" Text="Accidentes en el Trayecto"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP129"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP129"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP129"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP129"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP129" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP129" GroupName="p129"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP129" GroupName="p129"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP129"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP129"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>130</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg130" Text="Los Incidentes son advertencias"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP130"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP130"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP130"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP130"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP130" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP130" GroupName="p130"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP130" GroupName="p130"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP130"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP130"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>131</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg131" Text="Importancia Y Consecuencias Del Cumplimiento de Lineamientos Seguridad Salud Higiene Y Ambiente"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP131"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP131"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP131"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP131"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP131" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP131" GroupName="p131"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP131" GroupName="p131"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP131"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP131"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>132</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg132" Text="Equipos de Protección Personal"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP132"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP132"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP132"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP132"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP132" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP132" GroupName="p132"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP132" GroupName="p132"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP132"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP132"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>133</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg133" Text="Distracción en el Trabajo"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP133"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP133"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP133"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP133"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP133" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP133" GroupName="p133"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP133" GroupName="p133"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP133"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP133"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>134</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg134" Text="Tipo, Uso  y Mantenimiento de Equipos de Protección Personal"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP134"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP134"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP134"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP134"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP134" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP134" GroupName="p134"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP134" GroupName="p134"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP134"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP134"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>135</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg135" Text="Seguridad Basada en el Comportamiento"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP135"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP135"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP135"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP135"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP135" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP135" GroupName="p135"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP135" GroupName="p135"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP135"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP135"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>136</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg136" Text="Análisis de la Causa Raíz en Incidentes y Accidentes Laborales"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP136"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP136"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP136"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP136"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP136" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP136" GroupName="p136"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP136" GroupName="p136"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP136"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP136"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>137</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg137" Text="Aspectos Humanos en la Prevención de Riesgos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP137"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP137"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP137"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP137"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP137" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP137" GroupName="p137"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP137" GroupName="p137"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP137"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP137"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>138</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg138" Text="Autoprotección"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP138"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP138"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP138"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP138"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP138" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP138" GroupName="p138"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP138" GroupName="p138"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP138"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP138"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>139</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg139" Text="Ecología y Reciclaje"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP139"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP139"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP139"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP139"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP139" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP139" GroupName="p139"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP139" GroupName="p139"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP139"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP139"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>140</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg140" Text="Herramientas de comunicación en Campañas de Seguridad y Salud Laboral"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP140"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP140"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP140"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP140"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP140" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP140" GroupName="p140"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP140" GroupName="p140"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP140"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP140"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>141</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg141" Text="Participación Activa de los Trabajadores en el Desarrollo de Análisis de Riesgo de Trabajo"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP141"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP141"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP141"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP141"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP141" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP141" GroupName="p141"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP141" GroupName="p141"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP141"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP141"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>142</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg142" Text="Prevención de Accidentes en Carretera y otras Instalaciones"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP142"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP142"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP142"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP142"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP142" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP142" GroupName="p142"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP142" GroupName="p142"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP142"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP142"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>143</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg143" Text="Prevención de Accidentes en las Manos y Piel"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP143"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP143"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP143"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP143"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP143" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP143" GroupName="p143"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP143" GroupName="p143"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP143"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP143"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>144</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg144" Text="Prevención en accidentes de motos"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP144"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP144"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP144"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP144"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP144" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP144" GroupName="p144"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP144" GroupName="p144"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP144"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP144"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>145</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg145" Text="Seguridad después del Trabajo y en el Hogar"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP145"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP145"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP145"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP145"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP145" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP145" GroupName="p145"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP145" GroupName="p145"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP145"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP145"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>146</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg146" Text="Alimentación Saludable"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP146"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP146"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP146"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP146"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP146" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP146" GroupName="p146"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP146" GroupName="p146"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP146"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP146"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>147</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg147" Text="Ecología Y Reciclaje En  Las Empresas"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP147"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP147"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP147"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP147"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP147" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP147" GroupName="p147"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP147" GroupName="p147"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP147"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP147"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>148</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg148" Text="Impacto Ambiental"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP148"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP148"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP148"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP148"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP148" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP148" GroupName="p148"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP148" GroupName="p148"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP148"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP148"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>149</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg149" Text="Las 3 R (Recicla, Reduce Y Reutiliza)"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP149"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP149"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP149"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP149"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP149" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP149" GroupName="p149"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP149" GroupName="p149"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP149"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP149"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>150</asp:TableCell>
                                                    <asp:TableCell runat="server" ID="preg150" Text="Señalización de Seguridad y Código de Colores"></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="durP150"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="pobP150"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ponP150"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="docP150"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="fecP150" TextMode="Date"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="siP150" GroupName="p150"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell CssClass="text-center">
                                                        <asp:RadioButton runat="server" ID="noP150" GroupName="p150"></asp:RadioButton>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="lugP150"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="ObsP150"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <!--  Fin de Informacion -->
                <div class="row text-center">

                    <div class="col-md-4 col-md-offset-4">
                        <asp:ImageButton alt="-" ID="btnDocumento" runat="server" ImageUrl="~\ico\print.png"
                            OnClick="GenerarDocumento" />
                        <h4>Generar Documento</h4>
                    </div>

                </div>
            </asp:PlaceHolder>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDocumento" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
