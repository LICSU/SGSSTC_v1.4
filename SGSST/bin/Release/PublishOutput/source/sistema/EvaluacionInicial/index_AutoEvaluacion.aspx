﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_AutoEvaluacion.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.index_AutoEvaluacion" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Evaluación Inicial</a></li>
                <li><a href="#">Auto-Evaluación</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Auto-Evaluación</h1>
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
                        runat="server" class="form-control" PlaceHolder="Ingrese el documento a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"
                        data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" />
                </div>
            </div>

            <br />

            <div class="row">

                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
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

                                <asp:TemplateField HeaderText="Año" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="anho" runat="server" Text='<%# Eval("anho") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre del Plan" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="empresa" runat="server" Text='<%# Eval("Empresa") %>' />
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
                            OnClick="btnCrear_Onclick"
                            data-toggle="tooltip" data-placement="bottom"
                            title="Presione para crear un nuevo documento de Auto-Evaluación" />
                        <h4>Crear Documento</h4>
                    </asp:PlaceHolder>
                </div>
                <div class="col-md-4">
                    <asp:PlaceHolder Visible="true" ID="PlaceHolder1" runat="server">
                        <asp:ImageButton alt="-" runat="server" ImageUrl="~\ico\upload.png" OnClick="MostrarModalAgregar"
                            data-toggle="tooltip" data-placement="bottom"
                            title="Presione para subir un nuevo documento de Auto-Evaluación" />
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
                <asp:UpdatePanel ID="Update" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Nombre: </h4>

                                    <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static"
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese el nombre del documento de Auto-Evaluación"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtNombre" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <asp:PlaceHolder runat="server" ID="phEmpresaAdd">
                                    <div class="col-md-6">
                                        <h4>Empresa: </h4>

                                        <asp:DropDownList ID="ddlEmpresaAdd"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"
                                            runat="server" ClientIDMode="Static"
                                            CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true"
                                            ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd" />
                                    </div>
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucursalAdd">
                                    <div class="col-md-6">
                                        <h4>Sucursal: </h4>

                                        <asp:DropDownList ID="ddlSucursalAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                            CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                    <br />
                                </asp:PlaceHolder>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Año: </h4>

                                    <asp:TextBox ID="txtYearAdd" runat="server" Text="2000" type="number" step="0.01" min="2000" max="2100"
                                        ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom"
                                        title="Seleccione el año en que fue realizada el documento de Auto-Evaluación"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtYearAdd" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                                <div class="col-md-6">
                                    <h4>Archivo: </h4>

                                    <asp:FileUpload ID="flpArchivo" runat="server" ClientIDMode="Static"
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom"
                                        title="Seleccione el PDF creado del documento de Auto-Evaluación"></asp:FileUpload>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="flpArchivo" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                            <br />
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">

                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                        OnClick="Guardar" ValidationGroup="ValidationAdd"
                                        data-toggle="tooltip" data-placement="bottom"
                                        title="Presione para guardar el documento de Auto-Evaluación" />
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
                                    <asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro" /></div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
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