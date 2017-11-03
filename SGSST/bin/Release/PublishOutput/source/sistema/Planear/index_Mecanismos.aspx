<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Mecanismos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Mecanismos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">

        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Planear</a></li>
                <li><a href="#">Mecanismos</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Mecanismo para recibir, documentar y responder a las comunicaciones</h1>
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
                        runat="server" class="form-control" PlaceHolder="Ingrese el mecanismo a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"
                        data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" />
                </div>
            </div>

            <br />

            <asp:PlaceHolder runat="server" ID="phSucursal">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
            </asp:PlaceHolder>

            <div class="row" style="overflow: auto;">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">


                        <asp:GridView ID="GridView1"
                            class="table table-bordered table-hover dataTable"
                            runat="server"
                            AutoGenerateColumns="false"
                            AllowPaging="true"
                            PageSize="5"
                            OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField HeaderText="Id Categoria" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_tipo_documento") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="TIPO DE DOCUMENTACIÓN" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="COMUNICACIÓN DIRIGIDA A" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="dirigida" runat="server" Text='<%# Eval("dirigida") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="MODALIDAD DE COMUNICACIÓN" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="modalidad" runat="server" Text='<%# Eval("modalidad") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="FECHA" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="fecha" runat="server" Text='<%# Eval("fecha") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="RESPONSABLE" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="responsable" runat="server" Text='<%# Eval("responsable") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="APROBADO POR" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("aprobado") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="ARCHIVADO O ALMACENADO" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("archivado") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="ESTATUS" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="estatus" runat="server" Text='<%# Eval("estatus") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
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
            <br />

            <div class="row text-center">
                <div class="col-md-4 col-md-offset-4">
                    <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                        data-toggle="addModal" data-target="#EscaneadoModal" />
                    <h4>Nuevo Tipo de Documento</h4>
                </div>
            </div>
        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>


    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Agregar Registro</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <div class="row">

                                <div class="col-md-4">
                                    <h4 class="text-center">Nombre</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtNombreAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombreAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Comunicación dirigida a</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtDirigidaAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtDirigidaAdd" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Modalidad de comunicación</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtModalidadAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtModalidadAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Fecha</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtFechaAdd" runat="server" type="date" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Responsable</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtResponsableAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtResponsableAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Aprobado por</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtAprobadoAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtAprobadoAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Archivado o almacenado</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtArchivadoAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtArchivadoAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Estatus</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlEstatusAdd" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Cumplido" Value="Cumplido"></asp:ListItem>
                                        <asp:ListItem Text="No Cumplido" Value="No Cumplido"></asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlEstatusAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <asp:PlaceHolder runat="server" ID="phSucursalAdd">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Sucursal</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:DropDownList ID="ddlSucursalAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                            CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

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
                    <Triggers></Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Registro</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfEditID" runat="server" />

                            <div class="row">

                                <div class="col-md-4">
                                    <h4 class="text-center">Nombre</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtNombreEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombreEdit" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>

                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Comunicación dirigida a</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtDirigidaEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtDirigidaEdit" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Modalidad de comunicación</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtModalidadEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtModalidadEdit" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Fecha</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtFechaEdit" runat="server" TextMode="Date" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaEdit" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Responsable</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtResponsableEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtResponsableEdit" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Aprobado por</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtAprobadoEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtAprobadoEdit" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Archivado o almacenado</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox ID="txtArchivadoEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtArchivadoEdit" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Estatus</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlEstatusEdit" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Cumplido" Value="Cumplido"></asp:ListItem>
                                        <asp:ListItem Text="No Cumplido" Value="No Cumplido"></asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlEstatusEdit" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <asp:PlaceHolder runat="server" ID="phSucursalEdit">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Sucursal</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:DropDownList ID="ddlSucursalEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                            CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucursalEdit" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" OnClick="EditarRegistro" ValidationGroup="ValidationEdit" />
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
                                    <asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro" />
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
