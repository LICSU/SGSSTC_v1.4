<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_AsignacionResponsable.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_AsignacionResponsable" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="#">Actas de Asignación del Responsable</a></li>
    </ol>

    <div class="page-header">
        <h3 class="text-center">Acta de asignación del responsable del SGSST</h3>
    </div>

    <div class="row">

        <asp:PlaceHolder runat="server" ID="phEmpresa">
            <div class="col-md-3">
                <h4 class="text-center">Empresa</h4>
                <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
            <div class="col-md-3 col-md-offset-1">
                <h4 class="text-center">Sucursal</h4>
                <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" AutoPostBack="true" class="form-control"
                    OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                </asp:DropDownList>

                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                    Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
                    runat="server" ValidationGroup="ValidationAdd" />
            </div>
        </asp:PlaceHolder>

        <div class="col-md-3">
            <h4 class="text-center">Trabajador</h4>
            <asp:DropDownList ID="ddlTrabajador" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

    </div>

    <div class="row form-group">
        <asp:PlaceHolder runat="server" ID="phActa" Visible="false">

            <div class="col-lg-6 col-md-offset-3">
                <p class="text-right" style="padding-bottom: 30px;">
                    <strong>
                        <asp:Label runat="server" ID="lblFecha"></asp:Label></strong>
                </p>
                <h4 class="text-center" style="padding-bottom: 30px;">ASIGNACION DEL RESPONSABLE DEL SGSST</h4>
                <p class="text-justify" style="padding-bottom: 50px;">
                    La gerencia de la empresa
                    <asp:Label runat="server" ID="lblEmpresaSel"></asp:Label>, en cumplimiento 
                            con el artículo 8, numerales 2 y 10 del Decreto 1443 del 2012, delega para el 
                            desarrollo del sistema de gestión de seguridad y salud en el trabajo al 
                            empleado
                    <asp:Label runat="server" ID="lblEmpleado"></asp:Label>
                    identificado con la CC N°
                    <asp:Label runat="server" ID="lblCedula"></asp:Label>, 
                            asignando la responsabilidad ejecutiva de asegurar la implementación y el mantenimiento de dicho sistema, 
                            para lo cual deberá planificar, organizar, dirigir, desarrollar y aplicar el SG-SST y como mínimo una vez 
                            al año realizar su evaluación, informar a la alta dirección sobre el funcionamiento y los resultados del SG-SST 
                            además será el responsable de coordinar con los jefes de las áreas la elaboración y actualización de la matriz 
                            de identificación de peligros, evaluación y valoración de riesgos y hacer la priorización para focalizar la intervención.
                </p>
                <p class="text-center" style="padding-bottom: 50px;">
                    __________________________<br />
                    Gerente<br />
                    <asp:Label runat="server" ID="lblEmpresa"></asp:Label>
                </p>
            </div>

        </asp:PlaceHolder>
    </div>

    <br />
    <br />

    <div class="row text-center">

        <div class="col-md-4 col-md-offset-2">
            <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
                OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
            <h4>Generar Documento</h4>
        </div>

        <div class="col-md-4">
            <asp:Button runat="server" ID="btnGenerar" Text="Generar Acta" CssClass="btn btn-primary"
                OnClick="btnGenerarActa_OnClick" />
        </div>

    </div>

</asp:Content>
