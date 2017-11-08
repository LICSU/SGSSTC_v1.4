<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ObligacionNorma.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ObligacionNorma" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_Obligaciones.aspx">Obligaciones</a></li>
                <li><a href="#">Crear Obligacion Norma</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Registro de Obligaciones</h1>
            </div>

            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <!-- Norma -->
            <div class="row">
                <h3 class="text-left">Norma:</h3>
                <br />
                <asp:Label runat="server" Text="estatus" ID="lbNorma" />
            </div>
            <br />

            <!-- Medida -->
            <div class="row">
                <h3 class="text-left">Medida:</h3>
                <br />
                <asp:Label runat="server" Text="estatus" ID="lbMedida"></asp:Label>
            </div>
            <br />
            <hr />

            <!-- controles-->
            <div class="row text-center">

                <div class="col-md-3">
                    <h4>Responsable</h4>

                    <asp:DropDownList ID="ddlResponsable" runat="server" CssClass="form-control"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione un responsable para que haga seguimiento de la obligación">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlResponsable" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-3">
                    <h4>Prioridad</h4>

                    <asp:DropDownList runat="server" ID="ddlPrioridad" CssClass="form-control"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione la prioridad que tendrá la obligación">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Baja" Value="Baja"></asp:ListItem>
                        <asp:ListItem Text="Media" Value="Media"></asp:ListItem>
                        <asp:ListItem Text="Alta" Value="Alta"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlPrioridad" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-3">

                    <h4>Fecha Entrega: </h4>
                    <asp:TextBox ID="txtFechaFin" runat="server" class="col-md-10" CssClass="form-control" TextMode="Date"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione la fecha de entrega que tendrá la obligación"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtFechaFin" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-3">
                    <h4>Estatus</h4>

                    <asp:DropDownList runat="server" ID="ddlEstatus" CssClass="form-control"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione el estatus que tendrá la obligación">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Iniciado" Value="Iniciado"></asp:ListItem>
                        <asp:ListItem Text="No Iniciado" Value="No Iniciado"></asp:ListItem>
                        <asp:ListItem Text="En Ejecución" Value="En Ejecución"></asp:ListItem>
                        <asp:ListItem Text="Terminado con Éxito" Value="Terminado con Éxito"></asp:ListItem>
                        <asp:ListItem Text="Terminado con Falla" Value="Terminado con Falla"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlEstatus" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>
            <br />

            <!-- controles-->
            <div class="row text-center">
                <div class="col-md-3">
                    <h4>Categoría</h4>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCategoria"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione una categoría para la obligación">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlCategoria" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-3">
                    <h4>Frecuencia control</h4>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlFrecuencia"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione una frecuencia para la obligación">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlFrecuencia" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-6">
                    <h4>Actividad del Plan de Trabajo del Año 
                            <asp:Label runat="server" ID="lbAnho"></asp:Label>
                    </h4>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlActividad"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione la actividad del plan de trabajo relacionada con esta obligación">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlActividad" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>
            <br />

            <!-- descripcion Acciones-->
            <div class="row">
                <div class="col-md-6">
                    <h4>Descripcion</h4>
                    <asp:TextBox ID="txtDesc" runat="server" TextMode="multiline" Rows="5" class="form-control"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese la descripción de la obligación"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtDesc" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
                <div class="col-md-6">
                    <h4>Acciones</h4>

                    <asp:TextBox ID="txtAcciones" runat="server" TextMode="multiline" Rows="5" class="form-control"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese las acciones a realizar de la obligación"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtAcciones" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>
            <br />

            <!-- guardar-->
            <div class="row">
                <div class="col-md-3 col-md-offset-3">
                    <asp:Button Text="Registrar" ID="btnAgregar" runat="server" class="btn btn-block btn-info"
                        OnClick="AgregarRegistro" ValidationGroup="ValidationAdd"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Presione para registrar la obligación" />
                </div>
                <div class="col-md-3">
                    <asp:Button Text="Cancelar" ID="btnVolver" runat="server" class="btn btn-block btn-default"
                        OnClick="Volver"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Presione para volver a las medidas" />
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>




</asp:Content>
