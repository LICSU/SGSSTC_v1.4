<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PuestoTrabajo.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_PuestoTrabajo" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="#">Puesto Trabajo</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Puesto de trabajo</h1>
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
                        runat="server" class="form-control" PlaceHolder="Ingrese el Puesto de Trabajo a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar"
                        runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
                </div>
            </div>

            <br />

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>

                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlEmpresa" data-toggle="tooltip"
                            data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlSucursal"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal"
                            CssClass="form-control" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phArea">
                    <div class="col-md-3">
                        <h4 class="text-center">Area</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlArea"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área"
                            CssClass="form-control" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <h4 class="text-center">N° Trabajadores</h4>
                    <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlTrabajadores"
                        data-toggle="tooltip" data-placement="bottom" title="Seleccione un Trabajador"
                        CssClass="form-control" OnSelectedIndexChanged="ddlTrabajadores_SelectedIndexChanged">
                        <asp:ListItem Text="Todos los Trabajadores" Value=""></asp:ListItem>
                        <asp:ListItem Text="0 - 10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="10-50" Value="50"></asp:ListItem>
                        <asp:ListItem Text="50-100" Value="100"></asp:ListItem>
                        <asp:ListItem Text="+100" Value="101"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        
                        <asp:GridView ID="GridView1"
                            class="table table-bordered table-hover dataTable"
                            runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
                            OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>

                                <asp:TemplateField HeaderText="id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_puesto_trabajo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="area" runat="server" Text='<%# Eval("Area") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="N° Trabajadores" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="numTrab" runat="server" Text='<%# Eval("Num") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="sucursal" runat="server" Text='<%# Eval("Sucursal") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Editar" HeaderStyle-CssClass="text-center" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Consultar" HeaderStyle-CssClass="text-center" CommandName="Consultar" ButtonType="Image" ImageUrl="~\ico\view.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
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
                        <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                            OnClick="AgregarRegistro" />
                        <h4>Nuevo Puesto de Trabajo</h4>
                    </div>
                </div>
            </asp:PlaceHolder>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>

    <!-- Delete Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
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