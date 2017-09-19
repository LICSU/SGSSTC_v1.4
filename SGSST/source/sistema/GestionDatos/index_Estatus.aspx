﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Estatus.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Estatus" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="#">Estatus</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Estatus de los Trabajadores</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese el texto a buscar"
                        runat="server" class="form-control" PlaceHolder="Ingrese el Categoria a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar"
                        runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
                </div>
            </div>

            <br />

            <asp:PlaceHolder runat="server" ID="phEmpresa">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlEmpresa" data-toggle="tooltip"
                            data-placement="bottom" title="Seleccione una Empresa" class="form-control"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>

                <br />
            </asp:PlaceHolder>

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        
                        <asp:GridView ID="GridView1"
                            class="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated"
                            EmptyDataText="No existen Registros" OnRowDataBound="GridView1_RowDataBound">

                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_estatus") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripcion" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="descripcion" runat="server" Text='<%# Eval("descripcion") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Empresa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image"
                                    ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image"
                                    ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <br />

            <asp:PlaceHolder runat="server" ID="phAgregar">
                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:ImageButton AlternateText="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                            data-toggle="modal" data-target="#addModal" />
                        <h4>Nuevo Estatus</h4>
                    </div>
                </div>
            </asp:PlaceHolder>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar Estatus</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <asp:PlaceHolder runat="server" ID="phEmpresaAdd" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Empresa</h4>

                                        <asp:DropDownList ID="ddlEmpresaAdd" data-toggle="tooltip" data-placement="bottom"
                                            title="Seleccione una Empresa" runat="server" ClientIDMode="Static"
                                            CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Nombre</h4>

                                    <asp:TextBox ID="txtNombreAdd" MaxLength="100" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese el nombre del estatus"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtNombreAdd" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Descripcion</h4>

                                    <asp:TextBox ID="txtDescripcionAdd" MaxLength="100" TextMode="MultiLine" Rows="3" runat="server"
                                        ClientIDMode="Static" CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese la descripción del estatus"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtDescripcionAdd" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnGuardar" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                        OnClick="GuardarRegistro" ValidationGroup="ValidationAdd" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Estatus</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfEstatusID" runat="server" />

                            <asp:PlaceHolder runat="server" ID="phEmpresaEdit" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Empresa</h4>

                                        <asp:DropDownList ID="ddlEmpresaEdit"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa"
                                            runat="server" ClientIDMode="Static" CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlEmpresaEdit" runat="server" ValidationGroup="ValidationEdit" />
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Nombre</h4>

                                    <asp:TextBox ID="txtNombreEdit" MaxLength="100" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese el nombre del estatus"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtNombreEdit" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Descripcion</h4>

                                    <asp:TextBox ID="txtDescripcionEdit" MaxLength="100" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese la descripción del estatus"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtDescripcionEdit" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>
                            <br />
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info"
                                        OnClick="EditarRegistro" ValidationGroup="ValidationEdit" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
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
                            <asp:HiddenField ID="hdfEstatusIDDel" runat="server" />

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
