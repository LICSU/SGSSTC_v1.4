<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" EnableEventValidation = "false" CodeBehind="index_Area.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Area" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="#">Área</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Área</h1>
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

            <br />

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" 
                            title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <h4 class="text-center">Nivel del Area</h4>
                    <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlNivelArea" class="form-control"
                        OnSelectedIndexChanged="ddlNivelArea_SelectedIndexChanged"
                        data-toggle="tooltip" data-placement="bottom" title="Seleccione una Nivel de Área">
                        <asp:ListItem Text="Todos los Niveles" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nivel 1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Nivel 2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Nivel 3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Nivel 4" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-3">
                    <h4 class="text-center">N° Trabajadores</h4>
                    <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlTrabajadores" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Trabajador" CssClass="form-control" OnSelectedIndexChanged="ddlTrabajadores_SelectedIndexChanged">
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
                        <asp:GridView
                            ID="GridView1"
                            class="table table-bordered table-hover dataTable"
                            runat="server"
                            AutoGenerateColumns="false"
                            AllowPaging="true"
                            PageSize="10"
                            OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            OnRowCreated="GridView1_RowCreated"
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_area") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("Nombre_Area") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area Superior" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombreSup" runat="server" Text='<%# Eval("Area_Padre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area Nivel 1" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbArea1" runat="server" Text='<%# Eval("nivel1") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area Nivel 2" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("nivel2") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area Nivel 3" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("nivel3") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area Nivel 4" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("nivel4") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="empresa" runat="server" Text='<%# Eval("empresa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nro Trab" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="ntrabajadores" runat="server" Text='<%# Eval("NumTrab") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="sucursal" runat="server" Text='<%# Eval("sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Acciones" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
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
                <div class="col-md-3 col-md-offset-3">
                    <asp:PlaceHolder Visible="true" ID="phAgregar" runat="server">
                        <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                            OnClick="AgregarRegistroModal"
                            data-toggle="tooltip" data-placement="bottom" title="Presione para Registrar un Área" />
                        <h4>Nueva Área</h4>
                    </asp:PlaceHolder>
                </div>

                <div class="col-md-3">
                    <asp:ImageButton alt="-" ID="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png"
                        OnClick="MostrarModalImprimir"
                        data-toggle="tooltip" data-placement="bottom" title="Presione para Imprimir la lista de Áreas" />
                    <h4>Descargar Lista</h4>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar Área</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Área</h4>

                                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="50" ClientIDMode="Static"
                                        CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese el nombre del Área"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombre" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                            <div class="row">
                                <asp:PlaceHolder runat="server" Visible="false" ID="phEmpresaAdd">
                                    <div class="col-md-6">
                                        <h4>Empresa</h4>

                                        <asp:DropDownList ID="ddlEmpresaAdd" data-toggle="tooltip" data-placement="bottom"
                                            title="Seleccione una Empresa" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd" />
                                    </div>
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" Visible="false" ID="phSucursalAdd">
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
                                </asp:PlaceHolder>
                            </div>

                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <h4>Tipo de Área</h4>

                                    <asp:DropDownList runat="server" ID="ddlTipoAreaAdd" class="form-control"
                                        data-toggle="tooltip" data-placement="bottom" title="Seleccione un Tipo de Área">
                                        <asp:ListItem Text="Administrativa" Value="Administrativa"></asp:ListItem>
                                        <asp:ListItem Text="Operativa" Value="Operativa"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-md-4">
                                    <h4>Marque si pertenece a otra Área</h4>

                                    <asp:CheckBox ID="chkAreaPadre" runat="server" ClientIDMode="Static" CssClass="checkbox text-center"
                                        AutoPostBack="true" OnCheckedChanged="chkAreaPadre_CheckedChanged"></asp:CheckBox>
                                </div>
                            </div>

                            <asp:PlaceHolder ID="phAreaPadre" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Seleccione el Área Superior</h4>

                                        <asp:DropDownList ID="ddlAreasAdd" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                            title="Seleccione el Área al cual pertenece">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlAreasAdd" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                            </asp:PlaceHolder>
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
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                    </Triggers>
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
                    <h3>Editar Área</h3>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">
                            <asp:HiddenField ID="hdfAreaID" runat="server" />

                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Área</h4>

                                    <asp:TextBox ID="txtNombreEdit" MaxLength="50" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                        title="Ingrese el nombre del Área"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtNombreEdit" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <asp:PlaceHolder runat="server" Visible="false" ID="phEmpresaEdit">
                                    <div class="col-md-6">
                                        <h4>Empresa</h4>

                                        <asp:DropDownList ID="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom"
                                            title="Seleccione una empresa" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlEmpresaEdit_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlEmpresaEdit" runat="server" ValidationGroup="ValidationEdit" />

                                    </div>
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" Visible="false" ID="phSucursalEdit">
                                    <div class="col-md-6">
                                        <h4>Sucursal</h4>

                                        <asp:DropDownList ID="ddlSucursalEdit" data-toggle="tooltip" data-placement="bottom"
                                            title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSucursalEdit_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlSucursalEdit" runat="server" ValidationGroup="ValidationEdit" />
                                    </div>
                                </asp:PlaceHolder>
                            </div>

                            <br />

                            <asp:PlaceHolder ID="phAreasEditChk" runat="server">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4>Tipo de Área</h4>

                                        <asp:DropDownList runat="server" ID="ddlTipoAreaEdit" class="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione un Tipo de Área">
                                            <asp:ListItem Text="Seleccione el Tipo de Área" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Administrativa" Value="Administrativa"></asp:ListItem>
                                            <asp:ListItem Text="Operativa" Value="Operativa"></asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlTipoAreaEdit" runat="server" ValidationGroup="ValidationEdit" />
                                    </div>

                                    <div class="col-md-6">
                                        <h4>Marque si pertenece a otra Área</h4>

                                        <asp:CheckBox ID="chkAreaEdit" runat="server" ClientIDMode="Static"
                                            CssClass="checkbox text-center"
                                            AutoPostBack="true" OnCheckedChanged="chkAreaEdit_CheckedChanged"></asp:CheckBox>
                                    </div>
                                </div>

                                <asp:PlaceHolder runat="server" ID="phSeleccion">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>Seleccione el Área Superior</h4>

                                            <asp:DropDownList ID="ddlAreasEdit" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                                                title="Seleccione el Área al cual pertenece">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlAreasEdit" runat="server"
                                                ValidationGroup="ValidationEdit" />
                                        </div>
                                    </div>

                                </asp:PlaceHolder>
                            </asp:PlaceHolder>
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
                    <Triggers>
                    </Triggers>
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
                            <asp:HiddenField ID="hdfAreaIDDel" runat="server" />

                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro? Esto eliminara los registros asociados al área 
                                    (Puestos de trabajo, Trabajadores, y Accidentes Laborales)
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

    <!-- Print Modal -->
    <div id="printModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Descargar Lista</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <div class="row">

                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnPrintWord" runat="server" Text="Imprimir en Word" class="btn btn-block btn-primary"
                                        OnClick="btnExportWord_Click"></asp:Button>
                                </div>
                            </div>
                            <br />

                            <div class="row">

                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnPrintExcel" runat="server" Text="Imprimir en Excel"
                                        class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
                                </div>
                            </div>
                            <br />

                            <div class="row">

                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnPrintPdf" runat="server" Text="Imprimir en PDF" class="btn btn-block btn-danger"
                                        OnClick="btnExportPDF_Click"></asp:Button>
                                </div>
                            </div>
                            <br />

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
                        <asp:PostBackTrigger ControlID="btnPrintWord" />
                        <asp:PostBackTrigger ControlID="btnPrintExcel" />
                        <asp:PostBackTrigger ControlID="btnPrintPdf" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>

</asp:Content>