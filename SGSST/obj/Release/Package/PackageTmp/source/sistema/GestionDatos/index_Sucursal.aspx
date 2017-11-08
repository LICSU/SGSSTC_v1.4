<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Sucursal.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Sucursal" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Gestión de Datos</a></li>
        <li><a href="#">Sucursal</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Sucursal</h1>
    </div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <asp:PlaceHolder ID="phSucursal1" runat="server" Visible="false">
        <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">

            <ContentTemplate>
                <div class="row">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar"
                            runat="server" class="form-control" PlaceHolder="Ingrese la sucursal a buscar"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
                    </div>
                </div>

                <br />
                <div class="row">
                    <asp:PlaceHolder runat="server" ID="phEmpresa">
                        <div class="col-md-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
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
                                            <asp:Label ID="id" runat="server" Visible="false" Text='<%# Eval("id_sucursal") %>' />
                                            <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="empresa" runat="server" Text='<%# Eval("empresa") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Num de Trabajadores" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="num_trabajadores" runat="server" Text='<%# Eval("NumTrab") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField  HeaderText="Consultar" CommandName="Consultar" ButtonType="Image" ImageUrl="~\ico\view.png" HeaderStyle-CssClass="text-center">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

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

                <asp:PlaceHolder runat="server" ID="phAgregar">
                    <div class="row text-center">
                        <div class="col-md-4 col-md-offset-4">
                            <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                                OnClick="AgregarRegistro" />
                            <h4>Nueva Sucursal</h4>
                        </div>
                    </div>
                </asp:PlaceHolder>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:PlaceHolder>

    <asp:PlaceHolder runat="server" ID="phSucursal2" Visible="false">

        <div class="row text-left">
            <div class="col-md-4">
                <label class="control-label">Nombre</label>
            </div>

            <div class="col-md-8">
                <asp:Label runat="server" ID="txtNombreSucursal" CssClass="control-label"></asp:Label>
            </div>
        </div>

        <br />

        <div class="row text-left">
            <div class="col-md-4">
                <label class="control-label">Dirección</label>
            </div>

            <div class="col-md-8">
                <asp:Label runat="server" ID="txtDirección" CssClass="control-label"></asp:Label>
            </div>
        </div>

        <br />

        <div class="row text-left">
            <div class="col-md-4">
                <label class="control-label">Representante</label>
            </div>

            <div class="col-md-8">
                <asp:Label runat="server" ID="txtRepresentante" CssClass="control-label"></asp:Label>

            </div>
        </div>

        <br />

        <div class="row text-left">
            <div class="col-md-4">
                <label class="control-label">Teléfono Fijo</label>
            </div>

            <div class="col-md-8">

                <asp:Label runat="server" ID="txtTelFijo" CssClass="control-label"></asp:Label>
            </div>
        </div>

        <br />

        <div class="row text-left">
            <div class="col-md-4">
                <label class="control-label">Teléfono Movil</label>
            </div>

            <div class="col-md-8">

                <asp:Label runat="server" ID="txtTelMovil" CssClass="control-label"></asp:Label>
            </div>
        </div>
    </asp:PlaceHolder>


    <!-- View Modal -->
    <div id="viewModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Sucursal</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group text-left">
                            <asp:HiddenField ID="hdfSucursalID" runat="server" />

                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Nombre</label>
                                </div>
                                <div class="col-md-9">
                                    <asp:Label runat="server" ID="lblNombreView" CssClass="control-label"></asp:Label>

                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Región</label>
                                </div>
                                <div class="col-md-9">

                                    <asp:Label runat="server" ID="lbRegionView" CssClass="control-label"></asp:Label>

                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Departamento</label>
                                </div>
                                <div class="col-md-9">

                                    <asp:Label runat="server" ID="lbDptoView" CssClass="control-label"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Municipio</label>
                                </div>
                                <div class="col-md-9">

                                    <asp:Label runat="server" ID="lbMcpioView" CssClass="control-label"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Dirección</label>
                                </div>
                                <div class="col-md-9">

                                    <asp:Label runat="server" ID="lbDireccionView" CssClass="control-label"></asp:Label>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Representante</label>
                                </div>
                                <div class="col-md-9">

                                    <asp:Label runat="server" ID="lblRepreView" CssClass="control-label"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Teléfono Fijo</label>
                                </div>
                                <div class="col-md-9">

                                    <asp:Label runat="server" ID="lblFijoView" CssClass="control-label"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <label class="control-label">Teléfono Movil</label>
                                </div>
                                <div class="col-md-9">
                                    <asp:Label runat="server" ID="lblMovilView" CssClass="control-label"></asp:Label>
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
                    <h3>Editar Sucursal</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">
                            <asp:HiddenField ID="hdfSucursalEditID" runat="server" />

                            <asp:PlaceHolder runat="server" ID="phEmpresaEdit" Visible="false">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>Empresa</h4>

                                        <asp:DropDownList ID="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" runat="server" ClientIDMode="Static"
                                            CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpresaEdit" runat="server"
                                            ValidationGroup="ValidationEdit" />
                                    </div>
                                </div>

                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Sucursal</h4>

                                    <asp:TextBox ID="txtNombreEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtNombreEdit" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                                <div class="col-md-6">
                                    <h4>Región</h4>

                                    <asp:DropDownList ID="ddlRegionEdit" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlRegionEdit_SelectedIndexChanged">
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlRegionEdit" runat="server"
                                        ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Departamento</h4>

                                    <asp:DropDownList ID="ddlDptoEdit" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlDptoEdit_SelectedIndexChanged">
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlDptoEdit" runat="server"
                                        ValidationGroup="ValidationEdit" />
                                </div>
                                <div class="col-md-6">
                                    <h4>Municipio</h4>

                                    <asp:DropDownList ID="ddlMcpioEdit" runat="server" ClientIDMode="Static"
                                        CssClass="form-control">
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlMcpioEdit" runat="server"
                                        ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Dirección</h4>

                                    <asp:TextBox ID="txtDireccionEdit" runat="server" ClientIDMode="Static" MaxLength="100"
                                        CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtDireccionEdit" runat="server"
                                        ValidationGroup="ValidationEdit" />
                                </div>
                                <div class="col-md-6">
                                    <h4>Representante</h4>

                                    <asp:TextBox ID="txtRepresentanteEdit" runat="server" ClientIDMode="Static" MaxLength="100"
                                        CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtRepresentanteEdit" runat="server"
                                        ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Télefono Fijo</h4>

                                    <asp:TextBox ID="txtFijoEdit" TextMode="Number" runat="server" ClientIDMode="Static"
                                        MaxLength="50" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFijoEdit" runat="server"
                                        ValidationGroup="ValidationEdit" />
                                </div>
                                <div class="col-md-6">
                                    <h4>Télefono Movil</h4>

                                    <asp:TextBox ID="txtMovilEdit" TextMode="Number" runat="server" ClientIDMode="Static"
                                        MaxLength="50" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtMovilEdit" runat="server"
                                        ValidationGroup="ValidationEdit" />
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" class="btn btn-block btn-info"
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
                            <asp:HiddenField ID="hdfSucursalIDDel" runat="server" />

                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro? Esto eliminara los registros asociados
                                    a la sucursal (Puestos de trabajo, Trabajadores, Areas, Examenes, etc...)
                                </h4>
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
