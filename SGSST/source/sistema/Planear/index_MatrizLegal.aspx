<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_MatrizLegal.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_MatrizLegal" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"   Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Planear</a></li>
                <li><a href="#">Matriz Legal</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Matriz Legal</h1>
            </div>

            <!-- Buscar -->
            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox ID="txtBuscar"
                        data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar"
                        runat="server" class="form-control" PlaceHolder="Ingrese la norma a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch"
                        data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar"
                        runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
                </div>
            </div>
            <br />

            <!-- Filtro  -->
            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

            </div>
            <br />

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 col-md-offset-1 text-center">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal"
                            class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3 text-center">
                    <h4 class="text-center">Tipo de Norma</h4>
                    <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" ID="ddlTipoNorma"
                        OnSelectedIndexChanged="ddlTipoNorma_SelectedIndexChanged"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione un tipo de norma">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="General" Value="General"></asp:ListItem>
                        <asp:ListItem Text="Especifico" Value="Especifico"></asp:ListItem>
                        <asp:ListItem Text="Jurisprudencia" Value="Jurisprudencia"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-3 text-center">
                    <h4 class="text-center">Año Norma</h4>
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" ID="ddlAñoNorma"
                        OnSelectedIndexChanged="ddlAñoNorma_SelectedIndexChanged"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione el año de una norma para filtrar la tabla">
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
                        

                        <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable"
                            runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
                            OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="id_norma" runat="server" Visible="false" Text='<%# Eval("id_normas") %>' />
                                        <asp:Label ID="id_sucursal" runat="server" Visible="false" Text='<%# Eval("id_sucursal") %>' />
                                        <asp:HiddenField runat="server" ID="id_empresa" Visible="false" Value='<%# Eval("id_empresa") %>' />

                                        <asp:Label ID="lbempresa" runat="server" Text='<%# Eval("Sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Norma / Tema Especifico" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="documento" runat="server" Text='<%# Eval("documento") +" /<br/> "+Eval("tema_especifico") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Año" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="anho" runat="server" Text='<%# Eval("anho") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Articulo / Literal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="articulo" runat="server" Text='<%# Eval("articulo") +" /  "+ Eval("literal") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Obligaciones" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="obligaciones" runat="server" Text='<%# Eval("obligaciones") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Tipo matriz" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="tipo_matriz" runat="server" Text='<%# Eval("tipo_matriz") %>' /></ItemTemplate>
                                </asp:TemplateField>


                                <asp:ButtonField HeaderText="Medidas a Cumplir" HeaderStyle-CssClass="text-center" CommandName="seguimiento" Text="seguimiento" ButtonType="Image" ImageUrl="~\ico\seguimiento.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:TemplateField HeaderText="Estatus norma" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="estatus_norma" runat="server" Text='<%# Eval("estatus")+" %" %>' /></ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <br />


        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>

</asp:Content>
