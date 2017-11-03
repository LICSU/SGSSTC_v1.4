<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_InvestigacionAccidente.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.index_InvestigacionAccidente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Investigación de Accidente Laboral</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Investigación de Accidente Laboral</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row text-center">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese nombre o apellido del afectado"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
                </div>
            </div>

            <br />

            <div class="row text-center">

                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <label>Filtrar por Empresa</label>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresas_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                    <div class="col-md-3">
                        <label>Filtrar por Sucursal</label>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <label>Filtrar por Area</label>
                    <asp:DropDownList runat="server" ID="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="col-md-3">
                    <label>Fecha Inicio</label>
                    <asp:TextBox runat="server" ID="txtFechaInicio" CssClass="form-control" TextMode="Date" placeholder="yyyy-MM-dd"
                        AutoPostBack="true" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>

                <div class="col-md-3">
                    <label>Fecha Fin</label>
                    <asp:TextBox runat="server" ID="txtFechaFin" CssClass="form-control" TextMode="Date" placeholder="yyyy-MM-dd"
                        AutoPostBack="true" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                </div>

            </div>

            <br />

            <div class="row" style="overflow: auto;">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        

                        <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
                            OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField HeaderText="Id Accidente" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="id_at_it_el_pa" runat="server" Text='<%# Eval("id_at_it_el_pa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Fecha del Accidente" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="fecha_accidente" runat="server" Text='<%# Eval("fecha_acc", "{0:dd/MM/yyyy}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Afectado" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="afectado" runat="server" Text='<%# Eval("Afectado") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Posee Investigación" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="posee" runat="server" Text='<%# Eval("posee") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Imprimir" CommandName="print" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\print.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Crear Investigacion" CommandName="crear" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\addConsulta.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Ver" CommandName="Ver" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\view.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

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

    <!-- print lista Modal-->
    <div id="PrintListaModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Imprimir Registro</h3>
                </div>
                <div class="modal-body form-group">
                    <asp:HiddenField ID="hImprimir" runat="server" />

                    <div class="row">
                        <h4 class="text-center">¿Seguro desea imprimir este registro?</h4>
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-2">
                            <asp:Button ID="btPrint" runat="server" Text="Imprimir" AutoPostBack="true" class="btn btn-block btn-info"
                                OnClick="btPrint_Click" />
                        </div>

                        <div class="col-md-4">
                            <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>

                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>
</asp:Content>