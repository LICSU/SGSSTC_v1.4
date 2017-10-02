<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Alarmas.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Alarmas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Alarmas</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Alarmas</h1>
            </div>

            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese la alarma a buscar"></asp:TextBox>
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
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>

                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-2"></div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Prioridad</h4>
                    <asp:DropDownList ID="ddlPrioridadIndex" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlPrioridadIndex_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <h4>Categoria</h4>
                    <asp:DropDownList ID="ddlCategoriaIndex" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlCategoriaIndex_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Fecha inicio</h4>
                    <asp:TextBox ID="txtFechaInicio" runat="server" AutoPostBack="true" class="col-md-10" CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <h4>Fecha fin</h4>
                    <asp:TextBox ID="txtFechaFin" runat="server" AutoPostBack="true" class="col-md-10" CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">


                        <asp:GridView ID="GridView1"
                            class="table table-bordered table-hover dataTable"
                            runat="server"
                            AutoGenerateColumns="false"
                            AllowPaging="true"
                            PageSize="10"
                            OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField HeaderText="Id Alarma" HeaderStyle-CssClass="text-center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_alarmas") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Descripcion" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="descripcion" runat="server" Text='<%# Eval("descripcion") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Fecha" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="fecha" runat="server" Text='<%# Eval("fecha","{0:dd/MM/yyyy}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Prioridad" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="prioridad" runat="server" Text='<%# Eval("prioridad") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Categoria" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="categoria" runat="server" Text='<%# Eval("categoria") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" Visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="id_usuario" Visible="false" Value='<%# Eval("id_usuario") %>' />
                                        <asp:Label ID="usuario" runat="server" Text='<%# Eval("id_usuario") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Acciones" HeaderStyle-CssClass="text-center" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
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
                    <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                        OnClick="MostrarModalAgregar" data-toggle="modal" data-target="#addModal" />
                    <h4>Nueva Alarma</h4>
                </div>
                <div class="col-md-3">
                    <asp:ImageButton alt="-" ID="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png"
                        data-toggle="modal" data-target="#printModal" />
                    <h4>Descargar Lista</h4>
                </div>
            </div>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Agregar Registro</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">
                            <br />

                            <asp:PlaceHolder runat="server" ID="phEmpAdd">
                                <div class="row form-group">
                                    <div class="col-md-4 control-label">
                                        <label>Empresa: </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlEmpAdd" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpAdd_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpAdd" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phSucAdd">
                                <div class="row form-group">
                                    <div class="col-md-4 control-label">
                                        <label>Sucursal: </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlSucAdd" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucAdd_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucAdd" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phUsuAdd">
                                <div class="row form-group">
                                    <div class="col-md-4 control-label">
                                        <label>Responsable: </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlUsuAdd" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlUsuAdd" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <div class="row form-group">
                                <label class="col-md-4 control-label">Descripcion: </label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtDescripcion" runat="server" ClientIDMode="Static" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtDescripcion" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row form-group">
                                <label class="col-md-4 control-label">Fecha: </label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFecha" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row form-group">
                                <label class="col-md-4 control-label">Prioridad: </label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlPrioridadAdd" runat="server" ClientIDMode="Static" CssClass="form-control">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Alta" Value="Alta"></asp:ListItem>
                                        <asp:ListItem Text="Media" Value="Media"></asp:ListItem>
                                        <asp:ListItem Text="Baja" Value="Baja"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlPrioridadAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                            <br />

                            <div class="row form-group">
                                <label class="col-md-4 control-label">Categoria: </label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCategoriaAdd" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlCategoriaAdd_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlCategoriaAdd" runat="server"
                                        ValidationGroup="ValidationAdd" />

                                    <asp:PlaceHolder runat="server" ID="phCatAddOtro" Visible="false">
                                        <asp:TextBox ID="txtCatAddOtro" runat="server" placeholder="Ingrese categoria..." MaxLength="100" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtCatAddOtro" runat="server"
                                            ValidationGroup="ValidationAdd" />
                                    </asp:PlaceHolder>
                                </div>
                            </div>
                            <br />

                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="Guardar" ValidationGroup="ValidationAdd" />
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnAdd" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal fade">
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
                            <br />

                            <asp:PlaceHolder runat="server" ID="phEmpEdit">
                                <div class="row">
                                    <div class="col-md-4 control-label">
                                        <label>Empresa: </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlEmpEdit" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpEdit_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpEdit" runat="server"
                                            ValidationGroup="ValidationAEdit" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phSucEdit">
                                <div class="row">
                                    <div class="col-md-4 control-label">
                                        <label>Sucursal: </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlSucEdit" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucEdit_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucEdit" runat="server"
                                            ValidationGroup="ValidationAEdit" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phUsuEdit">
                                <div class="row">
                                    <div class="col-md-4 control-label">
                                        <label>Responsable: </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlUsuEdit" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlUsuEdit" runat="server"
                                            ValidationGroup="ValidationAEdit" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <div class="row">
                                <label class="col-md-4 control-label">Descripcion: </label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtDescripcionEdit" runat="server" ClientIDMode="Static" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtDescripcionEdit" runat="server"
                                        ValidationGroup="ValidationAEdit" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <label class="col-md-4 control-label">Fecha: </label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtFechaEdit" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaEdit" runat="server"
                                        ValidationGroup="ValidationAEdit" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <label class="col-md-4 control-label">Prioridad: </label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlPrioridadEdit" runat="server" ClientIDMode="Static" CssClass="form-control">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Alta" Value="Alta"></asp:ListItem>
                                        <asp:ListItem Text="Media" Value="Media"></asp:ListItem>
                                        <asp:ListItem Text="Baja" Value="Baja"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlPrioridadEdit" runat="server"
                                        ValidationGroup="ValidationAEdit" />
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <label class="col-md-4 control-label">Categoria: </label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlCategoriaEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlCategoriaEdit" runat="server"
                                        ValidationGroup="ValidationAEdit" />
                                </div>
                            </div>
                            <br />
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" OnClick="EditarRegistro" ValidationGroup="ValidationAEdit" />
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnEditar" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div id="deleteModal" class="modal fade">
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
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro" />
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                                <div class="col-md-2"></div>
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

                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnPrintWord" runat="server" Text="Imprimir en Word" class="btn btn-block btn-primary" OnClick="btnExportWord_Click"></asp:Button>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnPrintExcel" runat="server" Text="Imprimir en Excel" class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnPrintPdf" runat="server" Text="Imprimir en PDF" class="btn btn-block btn-danger" OnClick="btnExportPDF_Click"></asp:Button>
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