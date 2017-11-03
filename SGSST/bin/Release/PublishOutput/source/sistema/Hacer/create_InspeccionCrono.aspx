<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionCrono.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionCrono" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../Hacer/index_Inspecciones.aspx">Inspecciones</a></li>
        <li><a href="#">Crear Cronograma de Inspecciones</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Cronograma de Inspecciones</h1>
    </div>


    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <asp:HiddenField runat="server" ID="cantInspecciones" Value="0"></asp:HiddenField>

    <div class="row form-group">

        <asp:PlaceHolder runat="server" ID="phEmpresa">
            <div class="col-md-4">
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

        <div class="row">
            <div class="col-md-12">
                <table class="table table-condensed">
                    <tbody>
                        <tr class="bg-aqua color-palette">
                            <th class="col-md-2 text-center">Area</th>
                            <th class="col-md-2 text-center">Tipo de Inspección</th>
                            <th class="col-md-2 text-center">Fecha Inspección</th>
                            <th class="col-md-2 text-center">Responsables</th>
                            <th class="col-md-4 text-center">Objetivo</th>
                        </tr>

                        <asp:Panel ID="pTabla" runat="server">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlArea0" CssClass="form-control" runat="server"></asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlArea0" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTipo0" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Extintores" Value="Extintores"></asp:ListItem>
                                        <asp:ListItem Text="Areas" Value="Areas"></asp:ListItem>
                                        <asp:ListItem Text="Medios de Escape" Value="MediosEscape"></asp:ListItem>
                                        <asp:ListItem Text="Puesto de Trabajo Operativo" Value="PuestoOperativo"></asp:ListItem>
                                        <asp:ListItem Text="Puesto de Trabajo Administrativo" Value="PuestoAdministrativo"></asp:ListItem>
                                        <asp:ListItem Text="Inspección de Equipos de Protección" Value="InspeccionEpp"></asp:ListItem>
                                        <asp:ListItem Text="Cronograma de Inspecciones" Value="CronogramaInspecciones"></asp:ListItem>
                                        <asp:ListItem Text="Inspección uso de EPP" Value="UsoEpp"></asp:ListItem>
                                        <asp:ListItem Text="Inspección Botiquín de Primeros Auxilios" Value="PrimAux"></asp:ListItem>

                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlTipo0" runat="server"
                                        ValidationGroup="ValidationAdd" />

                                </td>
                                <td>
                                    <asp:TextBox ID="txtFecha0" type="date" CssClass="form-control" runat="server"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFecha0" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtResp0" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtResp0" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtObj0" CssClass="form-control" runat="server" TextMode="MultiLine"
                                        Rows="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtObj0" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </td>
                            </tr>
                        </asp:Panel>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2 col-md-offset-10 text-right">
                <asp:Button runat="server" ID="btnAgregar" Text="Agregar otra fila" ValidationGroup="ValidationAdd"
                    CssClass="btn btn-block btn-info" OnClick="Guardar" />
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-2 col-md-offset-5">
                <asp:Button runat="server" ID="btnDocumento" Text="Generar Documento"
                    CssClass="btn btn-block btn-info" OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />

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

</asp:Content>
