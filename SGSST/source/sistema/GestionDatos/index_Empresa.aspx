<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Empresa.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Empresa" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:PlaceHolder ID="phEmpresa1" runat="server">
        <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
            <ContentTemplate>

                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="#">Empresas</a></li>
                </ol>

                <div class="page-header">
                    <h3 class="text-center">Empresa</h3>
                </div>

                <div class="row">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            

                            <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10" HorizontalAlign="Center"
                                OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging"
                                OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                                <RowStyle HorizontalAlign="Center" />

                                <Columns>
                                    <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("id_empresa") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contacto" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="contacto" runat="server" Text='<%# Eval("representante") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField CommandName="Ver" HeaderText="Acciones" ButtonType="Image" ImageUrl="~\ico\view.png" HeaderStyle-CssClass="text-center">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <br />

                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                            OnClick="AgregarRegistro" />
                        <h4>Nueva Empresa</h4>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:PlaceHolder>

    <asp:PlaceHolder runat="server" ID="phEmpresa">

        <ol class="breadcrumb">
            <li><a href="../MenuPrincipal/index.aspx">Menu Principal</a></li>
            <li><a href="../GestionDatos/index_Empresa.aspx">Empresas</a></li>
        </ol>

        <div class="page-header">
            <h1 class="text-center">Empresa</h1>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <asp:Image alt="-" runat="server" ID="imgLogo" CssClass="thumbnail"
                    ImageUrl="~/source/archivos/LogosEmpresas/LICSU.jpg" />
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <div class="row text-left">

                    <div class="col-md-3">
                        <label class="control-label">Nombre</label>
                    </div>

                    <div class="col-md-9">
                        <asp:Label runat="server" ID="txtNombreEmpresa" CssClass="control-label"></asp:Label>
                    </div>
                </div>

                <br />

                <div class="row text-left">

                    <div class="col-md-3">
                        <label class="control-label">NIT</label>
                    </div>

                    <div class="col-md-9">
                        <asp:Label runat="server" ID="txtNit" CssClass="control-label"></asp:Label>
                    </div>
                </div>

                <br />

                <div class="row text-left">
                    <div class="col-md-3">
                        <label class="control-label">Email</label>
                    </div>
                    <div class="col-md-9">
                        <asp:Label runat="server" ID="txtEmail" CssClass="control-label"></asp:Label>
                    </div>
                </div>

                <br />

                <div class="row text-left">
                    <div class="col-md-3">
                        <label class="control-label">Representante</label>
                    </div>
                    <div class="col-md-9">
                        <asp:Label runat="server" ID="txtRepresentante" CssClass="control-label"></asp:Label>
                    </div>
                </div>

                <br />

                <div class="row text-left">
                    <div class="col-md-3">
                        <label class="control-label">Teléfono Fijo</label>
                    </div>
                    <div class="col-md-9">
                        <asp:Label runat="server" ID="txtTelFijo" CssClass="control-label"></asp:Label>
                    </div>
                </div>

                <br />

                <div class="row text-left">
                    <div class="col-md-3">
                        <label class="control-label">Teléfono Movil</label>
                    </div>
                    <div class="col-md-9">
                        <asp:Label runat="server" ID="txtTelMovil" CssClass="control-label"></asp:Label>
                    </div>
                </div>

                <br />
            </div>
        </div>
    </asp:PlaceHolder>

    <!-- Delete Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Eliminar Registro</h3>
                </div>

                <asp:UpdatePanel ID="upDel" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfEmpresaIDDel" runat="server" />

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

    <!-- View Modal -->
    <div id="viewModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Empresa</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfEmpresaID" runat="server" />

                            <div class="row">

                                <div class="col-md-10 col-md-offset-1">

                                    <div class="row text-left">
                                        <div class="col-md-4">
                                            <label class="control-label">Nombre</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lblNombreEmpresa" CssClass="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row text-left">
                                        <div class="col-md-4">
                                            <label class="control-label">NIT</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lblNIT" CssClass="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row text-left">
                                        <div class="col-md-4">
                                            <label class="control-label">Email</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lblEmail" CssClass="control-label"></asp:Label>
                                        </div>

                                    </div>
                                    <br />

                                    <div class="row text-left">
                                        <div class="col-md-4">
                                            <label class="control-label">Representante</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lblRepresentante" CssClass="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row text-left">
                                        <div class="col-md-4">
                                            <label class="control-label">Teléfono Fijo</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lblFijo" CssClass="control-label"></asp:Label>
                                        </div>

                                    </div>
                                    <br />

                                    <div class="row text-left">
                                        <div class="col-md-4">
                                            <label class="control-label">Teléfono Movil</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lblMovil" CssClass="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>