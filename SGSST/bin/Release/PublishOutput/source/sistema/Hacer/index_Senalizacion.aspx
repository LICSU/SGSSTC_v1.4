<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Senalizacion.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Senalizacion" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:PlaceHolder ID="phEmpresa1" runat="server">
        <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
            <ContentTemplate>

                <ol class="breadcrumb">
                    <li><a href="#">Hacer</a></li>
                    <li><a href="#">Señalización</a></li>
                </ol>

                <div class="page-header">
                    <h3 class="text-center">Señalización</h3>
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
                            runat="server" class="form-control" PlaceHolder="Ingrese el Area a buscar"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"
                            data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" />
                    </div>
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
                                    <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="text-center" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="id" runat="server" Text='<%# Eval("id_senalizacion") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Descripción" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="descripcion" runat="server" Text='<%# Eval("descripcion") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Imagen" HeaderStyle-CssClass="text-center" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="imagen" runat="server" Text='<%# Eval("url_imagen") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField CommandName="Ver" HeaderText="Ver" ButtonType="Image" ImageUrl="~\ico\view.png" HeaderStyle-CssClass="text-center">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:ButtonField CommandName="Editar" HeaderText="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:ButtonField CommandName="Eliminar" HeaderText="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
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
                        <h4>Nueva Señalización</h4>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
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

    <!-- Agregar Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar Señalización</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <div class="row">

                                <div class="col-md-10 col-md-offset-1">

                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Nombre</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:TextBox runat="server" ID="txtNombreAdd" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                   
                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Descripción</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:TextBox runat="server" ID="txtDescripcionAdd" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Imagen</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:FileUpload runat="server" ID="fuImagenAdd" CssClass="control-label"></asp:FileUpload>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnAgregarSenal" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="btnAgregarSenal_Click" /></div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnAgregarSenal" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Ver Modal -->
    <div id="viewModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Señalización</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <div class="row">
                                <asp:HiddenField ID="hdfVerID" runat="server" />
                                <div class="col-md-10 col-md-offset-1">

                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Nombre</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lblNombre" CssClass="control-label"></asp:Label>
                                        </div>
                                    </div>
                                   
                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Descripción</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Label runat="server" ID="lblDescripcion" CssClass="control-label" TextMode="MultiLine"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Imagen</label>
                                        </div>
                                        <div class="col-md-8">
                                           <asp:Image alt="-" runat="server" ID="imgSenal" CssClass="thumbnail"
                                                      ImageUrl="-" />
                                        </div>
                                    </div>
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

     <!-- Editar Modal -->
    <div id="editModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Señalización</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="hdfEditID" runat="server" />
                        <div class="modal-body form-group">
                            <div class="row">

                                <div class="col-md-10 col-md-offset-1">

                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Nombre</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:TextBox runat="server" ID="txtNombreEdit" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                   
                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Descripción</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:TextBox runat="server" ID="txtDescripcionEdit" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row text-left form-group">
                                        <div class="col-md-4">
                                            <label class="control-label">Imagen</label>
                                        </div>
                                        <div class="col-md-8">
                                            <asp:Image alt="-" runat="server" ID="imgFotoEdit" CssClass="img-thumbnail" />
                                            <asp:FileUpload runat="server" ID="fuImagenEdit" CssClass="control-label"></asp:FileUpload>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-block btn-info" OnClick="btnGuardar_Click" /></div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnGuardar" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>