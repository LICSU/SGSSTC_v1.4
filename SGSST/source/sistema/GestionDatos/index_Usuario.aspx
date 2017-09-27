<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Usuario.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Usuario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="#">Usuario</a></li>

            </ol>

            <div class="page-header">
                <h1 class="text-center">Usuario</h1>
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
                        runat="server" class="form-control" PlaceHolder="Ingrese el Usuario a buscar"></asp:TextBox>
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

                <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                    <div class="col-md-3 col-md-offset-3">
                        <h4 class="text-center">Sucursal</h4>

                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlSucursal" data-toggle="tooltip"
                            data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phRol" Visible="false">
                    <div class="col-md-3">
                        <h4 class="text-center">Rol</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlRol1" CssClass="form-control"
                            OnSelectedIndexChanged="ddlRol_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
            </div>

            <br />

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
                            OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging" 
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>

                                <asp:TemplateField HeaderText="ID" Visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_usuario") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Usuario" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="login" runat="server" Text='<%# Eval("login") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Rol" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="rol" runat="server" Text='<%# Eval("rol") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="sucursal" runat="server" Text='<%# Eval("Sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="empresa" runat="server" Text='<%# Eval("Empresa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Acciones" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
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
                    <div class="col-md-4 col-md-offset-4 text-center">
                        <asp:ImageButton AlternateText="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                            OnClick="AgregarRegistroModal" />
                        <h4>Nuevo Usuario</h4>
                    </div>
                </div>
            </asp:PlaceHolder>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar Usuario</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">
                            <asp:PlaceHolder runat="server" Visible="true" ID="phEmpresaAdd">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Empresa</h4>

                                        <asp:DropDownList ID="ddlEmpresaAdd" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                            title="Seleccione una Empresa" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>

                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" Visible="true" ID="phSucursalAdd">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Sucursal</h4>

                                        <asp:DropDownList ID="ddlSucursalAdd" data-toggle="tooltip" data-placement="bottom"
                                            title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSucursalAdd_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlSucursalAdd" runat="server" ValidationGroup="ValidationAdd" />
                                    </div>

                                </div>
                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Trabajador</h4>

                                   <asp:TextBox ID="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>

                                    <div ID="ListDivisor">
                                        <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1"
                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                            TargetControlID="txtTrabajador" ID="AutoCompleteExtender2" runat="server"
                                            FirstRowSelected="false"
                                            CompletionListCssClass="completionList"
                                            CompletionListItemCssClass="listItem"
                                            CompletionListElementID="ListDivisor" 
                                            CompletionListHighlightedItemCssClass="itemHighlighted">
                                        </cc1:AutoCompleteExtender>
                                    </div>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtTrabajador" runat="server" ValidationGroup="ValidationAdd" />

                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Rol</h4>

                                    <asp:DropDownList ID="ddlRolAdd" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom"
                                        title="Seleccione el rol que tendrá el usuario">
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="ddlRolAdd" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Login</h4>

                                    <asp:TextBox ID="txtLogin" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        MaxLength="500" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese el nombre de usuario"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtLogin" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Clave</h4>

                                    <asp:TextBox ID="txtClave" TextMode="Password" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese la contraseña del usuario, La Contraseña solo debe contener Letras Minúsculas,
                                        Mayúsculas y Números, debe contener de 4 a 16 caracteres"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtClave" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Confirmar Clave</h4>

                                    <asp:TextBox ID="txtClaveConf" TextMode="Password" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese de nuevo la contraseña"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtClaveConf" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                        OnClick="AgregarRegistro" ValidationGroup="ValidationAdd" />
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
                    <h3>Editar Usuario</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">
                            <asp:HiddenField ID="hdfUsuarioID" runat="server" />

                            <asp:PlaceHolder runat="server" Visible="true" ID="phEmpresaEdit">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Empresa</h4>

                                        <asp:DropDownList ID="ddlEmpresaEdit" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" AutoPostBack="true" data-toggle="tooltip" data-placement="bottom"
                                            title="Seleccione una empresa" OnSelectedIndexChanged="ddlEmpresaEdit_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlEmpresaEdit" runat="server" ValidationGroup="ValidationEdit" />

                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" Visible="true" ID="phSucursalEdit">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Sucursal</h4>

                                        <asp:DropDownList ID="ddlSucursalEdit" runat="server" ClientIDMode="Static"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal"
                                            CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSucursalEdit_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlSucursalEdit" runat="server" ValidationGroup="ValidationEdit" />
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Trabajador</h4>

                                    <asp:TextBox ID="txtTrabajadorEsp" runat="server" CssClass="form-control"></asp:TextBox>
                                    <div ID="ListDivisor2">
                                        <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajadorEsp" MinimumPrefixLength="1"
                                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                            TargetControlID="txtTrabajadorEsp" ID="AutoCompleteExtender1" runat="server"
                                            FirstRowSelected="false"
                                            CompletionListCssClass="completionList"
                                            CompletionListItemCssClass="listItem"
                                            CompletionListElementID="ListDivisor2" 
                                            CompletionListHighlightedItemCssClass="itemHighlighted">
                                        </cc1:AutoCompleteExtender>
                                    </div>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtTrabajadorEsp" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Rol</h4>

                                    <asp:DropDownList ID="ddlRolEdit" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom"
                                        title="Seleccione el rol que tendrá el usuario">
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="ddlRolEdit" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Login</h4>

                                    <asp:TextBox ID="txtLoginEdit" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        MaxLength="500" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese el nombre de usuario"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" runat="server"
                                        ControlToValidate="txtLoginEdit" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Clave Actual</h4>

                                    <asp:TextBox ID="txtClaveActual" Style="width: 100%;" TextMode="Password" runat="server"
                                        ClientIDMode="Static" MaxLength="500" CssClass="form-control" autocomplete="off"
                                        autocorrect="off" autocapitalize="off" spellcheck="false"
                                        class="login-field login-field-password" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese la contraseña actual del usuario"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtClaveActual" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Clave</h4>

                                    <asp:TextBox ID="txtClaveEdit" TextMode="Password" runat="server" ClientIDMode="Static"
                                        MaxLength="500" CssClass="form-control" autocomplete="off" autocorrect="off"
                                        autocapitalize="off" spellcheck="false" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese la contraseña del usuario, La Contraseña solo debe contener Letras Minúsculas,
                                        Mayúsculas y Números, debe contener de 4 a 16 caracteres"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtClaveEdit" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Confirmar Clave</h4>

                                    <asp:TextBox ID="txtClaveEditConf" TextMode="Password" runat="server" ClientIDMode="Static" MaxLength="500"
                                        CssClass="form-control" autocomplete="off" autocorrect="off" autocapitalize="off"
                                        spellcheck="false" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese de nuevo la contraseña"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtClaveEditConf" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>
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
                            <asp:HiddenField ID="hdfUsuarioIDDel" runat="server" />
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