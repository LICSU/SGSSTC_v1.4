<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionMediosEscape.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionMediosEscape" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../Hacer/index_Inspecciones.aspx">Inspecciones</a></li>
        <li><a href="#">Crear Inspección de Medios de Escape</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Inspección de Medios de Escape</h1>
    </div>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="row form-group">

                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
            </div>

            <asp:PlaceHolder runat="server" ID="phInformacion" Visible="False">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <asp:Table runat="server" ID="tbl_medios_escape" CssClass="table">
                            <asp:TableHeaderRow CssClass="text-center">
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="6">LAMPARAS DE EMERGENCIA</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell>AREA DE UBICACIÓN</asp:TableHeaderCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette">CARATERÍSTICA A INSPECCIONAR</asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-paletter" ColumnSpan="5">OBSERVACIONES</asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Estado de Conservación</asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstadoLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstadoLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstadoLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstadoLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstadoLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Fuentes de iluminación</asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsFuenteLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsFuenteLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsFuenteLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsFuenteLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsFuenteLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Señalización</asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsMarcaLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsMarcaLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsMarcaLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsMarcaLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsMarcaLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Luces de Operación</asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsLucesLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsLucesLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsLucesLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsLucesLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsLucesLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Cajetín</asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsCajetLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsCajetLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsCajetLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsCajetLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsCajetLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableHeaderRow CssClass="text-center">
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="6">SEÑALIZACIÓN DE SEGURIDAD</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell>AREA DE UBICACIÓN</asp:TableHeaderCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtSena1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtSena2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtSena3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtSena4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtSena5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette">CARATERÍSTICA A INSPECCIONAR</asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="5">OBSERVACIONES</asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Existencia </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsExiSena1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsExiSena2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsExiSena3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsExiSena4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsExiSena5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Estado de Conservación </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstSena1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstSena2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstSena3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstSena4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstSena5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Señal </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsSenaSena1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsSenaSena2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsSenaSena3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsSenaSena4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsSenaSena5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableHeaderRow CssClass="text-center">
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="6">PASILLOS Y ESCALERAS</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell>AREA DE UBICACIÓN</asp:TableHeaderCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtPasi1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtPasi2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtPasi3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtPasi4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtPasi5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette">CARATERÍSTICA A INSPECCIONAR</asp:TableHeaderCell>
                                <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="5">OBSERVACIONES</asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Estado de conservación </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstPasi1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstPasi2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstPasi3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstPasi4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsEstPasi5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Accesibilidad </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAccPasi1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAccPasi2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAccPasi3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAccPasi4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAccPasi5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Ausencia de obstáculos </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAusPasi1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAusPasi2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAusPasi3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAusPasi4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" ID="txtObsAusPasi5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>

                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png"
                            OnClick="GenerarDocumento" />
                        <h4>Generar Documento</h4>
                    </div>
                </div>
                <!--  Fin de Informacion -->

            </asp:PlaceHolder>

            <asp:PlaceHolder runat="server" ID="phNoRegistros" Visible="false">
                <div class="row form-group">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <h4><strong>No existen trabajadores con reposos registrados.</strong></h4>
                    </div>
                </div>
            </asp:PlaceHolder>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGuardar" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
