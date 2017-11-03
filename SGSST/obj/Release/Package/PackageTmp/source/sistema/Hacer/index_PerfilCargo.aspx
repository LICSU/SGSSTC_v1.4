<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PerfilCargo.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_PerfilCargo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="index_PerfilCargo.aspx">index Perfil de Cargo</a></li>
                <li><a href="#">Perfil de Cargo</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Perfil de Cargo</h1>
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
                        runat="server" class="form-control" PlaceHolder="Ingrese el perfil a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar"
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
                        
                        <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  OnRowCreated="GridView1_RowCreated"
                            OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging" 
                            EmptyDataText="No existen Registros">
                            
                            <Columns>
                                <asp:TemplateField HeaderText="Id Categoria" Visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_perfil_cargo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Ocupación" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="ocupacion" runat="server" Text='<%# Eval("ocupacion") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="empresa" runat="server" Text='<%# Eval("empresa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Acciones" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png"
                                    HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png"
                                    HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center"></asp:ButtonField>

                            </Columns>

                        </asp:GridView>

                    </div>
                </div>
            </div>

            <br />

            <asp:PlaceHolder runat="server" ID="phAgregarPerfil">
                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-4 text-center">
                        <asp:ImageButton AlternateText="-" ID="btnAgregar" runat="server" 
                            ImageUrl="~\ico\agregar.png" OnClick="AgregarRegistro"/>
                        <h4>Nuevo Perfil</h4>
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
