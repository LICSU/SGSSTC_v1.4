<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_MatrizRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_MatrizRiesgos" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Planear</a></li>
                <li><a href="#">Matriz de Riesgos</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Matriz de Riesgos</h1>
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
                        runat="server" class="form-control" PlaceHolder="Ingrese el Factor de riesgo a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"
                        data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" />
                </div>
            </div>

            <br />

            <div class="row">

                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" class="form-control" AutoPostBack="true"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" class="form-control" AutoPostBack="true"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <h4 class="text-center">Tipo de Riesgo</h4>
                    <asp:DropDownList runat="server" ID="ddlTipoRiesgo" class="form-control" AutoPostBack="true"
                        data-toggle="tooltip" data-placement="bottom" title="Seleccione un tipo de riesgo"
                        OnSelectedIndexChanged="ddlTipoRiesgo_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

            </div>
            <br />

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">Estatus de cumplimiento de la matriz = <% =CalcularEstatus()%>%</h3>
                        </div>
                        <div class="box-body">
                            <div class="progress">
                                <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="barraEstatus" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <% =CalcularEstatus()%>%">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        

                        <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
                            OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound"
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />
                            <Columns>

                                <asp:TemplateField HeaderText="ID" Visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="id_identificacion_peligro" runat="server" Text='<%# Eval("id_identificacion_peligro") %>' />
                                        <asp:Label ID="id_ide_puesto" runat="server" Text='<%# Eval("id_ide_puesto") %>' />
                                        <asp:Label ID="id_sucursal" runat="server" Text='<%# Eval("id_sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbempresa" runat="server" Text='<%# Eval("Sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Tipo de Riesgo" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="tipo_riesgo" runat="server" Text='<%# Eval("tipoRiesgo") %>' />
                                        <asp:HiddenField runat="server" ID="id_tipo_riesgo" Value='<%# Eval("id_tipo_riesgo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Factor de Riesgo" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="factor_riesgo" runat="server" Text='<%# Eval("factorRiesgo") %>' />
                                        <asp:HiddenField runat="server" ID="id_factor_riesgo" Value='<%# Eval("id_factor_riesgo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Medidas Existentes" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Medidas" runat="server" Text='<%# Eval("Medidas") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Fecha Identificacion" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="fecha_identificacion" runat="server" Text='<%# Eval("fecha_identificacion") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Evaluacion" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Evaluacion" runat="server" Text='<%# Eval("Evaluacion") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Asignar Evaluación" HeaderStyle-CssClass="text-center" CommandName="asignar" ButtonType="Image" ImageUrl="~\ico\agregar.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Medidas a Cumplir" HeaderStyle-CssClass="text-center" CommandName="seguimiento" ButtonType="Image" ImageUrl="~\ico\seguimiento.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:TemplateField HeaderText="Porcentaje Cumplimiento" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="porc_estatus" runat="server" Text='<%# Eval("porc_estatus") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <br />

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>
