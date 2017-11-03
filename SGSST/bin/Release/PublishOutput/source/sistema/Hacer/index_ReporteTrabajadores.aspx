﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ReporteTrabajadores.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.index_ReporteTrabajadores" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Reportes de Trabajadores</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Reportes de Trabajadores</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>
            
            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar"
                        runat="server" class="form-control" PlaceHolder="Ingrese el reporte a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"
                        data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" />
                </div>
            </div>

            <br />

            <div class="row">

                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-4">
                    <h4 class="text-center">Tipo de Reporte</h4>
                    <asp:DropDownList runat="server" ID="ddlTipoReporte" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoReporte_SelectedIndexChanged">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Trabajadores (Area Administrativa)" Value="Rep_TrabArAdm"></asp:ListItem>
                        <asp:ListItem Text="Trabajadores (Area Operativa)" Value="Rep_TrabArOpe"></asp:ListItem>
                        <asp:ListItem Text="Reporte de Condiciones de Salud" Value="Rep_CondSal"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        
                        <asp:GridView
                            ID="GridView1"
                            class="table table-bordered table-hover dataTable"
                            runat="server"
                            AutoGenerateColumns="false"
                            AllowPaging="true"
                            PageSize="10"
                            OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_documento") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Fecha de Subida" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("fecha_subida") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="empresa" runat="server" Text='<%# Eval("empresa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="sucursal" runat="server" Text='<%# Eval("sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Tipo de Reporte" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("tipo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Consultar" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ImageUrl="~\ico\view.png" NavigateUrl='<%# Eval("ruta") %>' Target="_blank">Descargar</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <br />

            <div class="row text-center">
                <div class="col-md-4 col-md-offset-2">
                    <asp:PlaceHolder Visible="true" ID="phAgregar" runat="server">
                        <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                            data-toggle="modal" data-target="#createModal" />
                        <h4>Crear Documento</h4>
                    </asp:PlaceHolder>
                </div>

                <div class="col-md-4">
                    <asp:PlaceHolder Visible="true" ID="PlaceHolder1" runat="server">
                        <asp:ImageButton alt="-" runat="server" ImageUrl="~\ico\upload.png"
                            data-toggle="modal" data-target="#addModal" />
                        <h4>Subir Documento</h4>
                    </asp:PlaceHolder>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Subir Documento</h3>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <div class="row">
                                <label class="col-md-4 control-label">Nombre: </label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombre" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <asp:PlaceHolder runat="server" ID="phEmpresaAdd">
                                <div class="row form-group">
                                    <label class="col-md-4 control-label">Empresa: </label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlEmpresaAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phSucursalAdd">
                                <div class="row form-group">
                                    <label class="col-md-4 control-label">Sucursal: </label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlSucursalAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                            CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <div class="row">
                                <label class="col-md-4 control-label">Tipo de Reporte: </label>
                                <div class="col-md-6">

                                    <asp:DropDownList ID="ddlTipoReporteAdd" runat="server" ClientIDMode="Static"
                                        CssClass="form-control">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Trabajadores (Area Administrativa)" Value="Rep_TrabArAdm"></asp:ListItem>
                                        <asp:ListItem Text="Trabajadores (Area Operativa)" Value="Rep_TrabArOpe"></asp:ListItem>
                                        <asp:ListItem Text="Reporte de Condiciones de Salud" Value="Rep_CondSal"></asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <label class="col-md-4 control-label">Archivo: </label>
                                <div class="col-md-6">
                                    <asp:FileUpload ID="flpArchivo" runat="server" ClientIDMode="Static"
                                        ></asp:FileUpload>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="flpArchivo" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                        OnClick="Guardar" ValidationGroup="ValidationAdd" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>

                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnAdd" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Create Modal -->
    <div id="createModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button id="Button1" type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Crear Inspeccion</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <div class="row form-group">
                                <div class="col-md-8 col-md-offset-2">
                                    <asp:Button ID="btnCrearRepTrab1" runat="server"
                                        Text="Reporte de Trabajadores (Area Administrativa)"
                                        class="btn btn-block btn-primary"
                                        OnClick="btnCrearRepTrab1_Click"></asp:Button>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-8 col-md-offset-2">
                                    <asp:Button ID="btnCrearRepTrab2" runat="server"
                                        Text="Reporte de Trabajadores (Area Operativa)"
                                        class="btn btn-block btn-primary"
                                        OnClick="btnCrearRepTrab2_Click"></asp:Button>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-8 col-md-offset-2">
                                    <asp:Button ID="btnCrearRepTrab3" runat="server"
                                        Text="Reporte de Condiciones de Salud" class="btn btn-block btn-primary"
                                        OnClick="btnCrearRepTrab3_Click"></asp:Button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div id="deleteModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Eliminar Registro</h3>
                </div>

                <asp:UpdatePanel ID="upDel" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfIDDel" runat="server" />
                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro?</h4>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info"
                                        OnClick="EliminarRegistro" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>

                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
