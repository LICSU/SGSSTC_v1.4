<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" EnableEventValidation = "false" CodeBehind="index_GestionLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_GestionLaboral" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Gestión Laboral</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Gestión Laboral</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese la Gestión Laboral a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
                </div>
            </div>
            <br />

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-4">
                        <label>Empresa: </label>
                        <asp:DropDownList ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3">
                        <label>Sucursal: </label>
                        <asp:DropDownList ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <label>Tipo de gestión: </label>

                    <asp:DropDownList runat="server" ID="ddlTipoGestion" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlTipoGestion_SelectedIndexChanged">

                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Entrega de equipos" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Capacitación" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Jornadas de Exámenes" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Actividades Recreativas" Value="4"></asp:ListItem>
                    </asp:DropDownList>

                </div>

                <div class="col-md-3">
                    <label>Fecha inicio: </label>
                    <asp:TextBox ID="txtFechaInicio" AutoPostBack="true" runat="server" class="col-md-10"
                        CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>

                <div class="col-md-3">
                    <label>Fecha fin: </label>
                    <asp:TextBox ID="txtFechaFin" AutoPostBack="true" runat="server" class="col-md-10"
                        CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                </div>

            </div>
            <br />


            <div class="row" style="overflow: auto;">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        

                        <asp:GridView ID="GridView1"
                            class="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="id_empresa" Visible="false" Value='<%# Eval("id_empresa") %>' />
                                        <asp:Label ID="empresa" runat="server" Text='<%# Eval("empresa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField Visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_ges_lab") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Fecha de la Actividad" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="fecha" runat="server" Text='<%# Eval("fecha","{0:dd/MM/yyyy}") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Descripcion" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="descripcion" runat="server" Text='<%# Eval("descripcion") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Tipo de Gestión" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="tipo" runat="server" Text='<%# Eval("tipo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Responsable" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Responsable" runat="server" Text='<%# Eval("Responsable") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Subir<br />Escaneado" 
                                    CommandName="Upload" ButtonType="Image" ImageUrl="~\ico\upload.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:TemplateField HeaderText="Ver Escaneado" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlEscaneado" runat="server" ImageUrl="~\ico\viewFile.png" Target="_blank"
                                            NavigateUrl='<%# Eval("soporte") %>'>Ver Archivo </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Editar" HeaderStyle-CssClass="text-center" 
                                    CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Consultar"  HeaderStyle-CssClass="text-center" 
                                    CommandName="Consultar" ButtonType="Image" ImageUrl="~\ico\view.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" 
                                    CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderStyle-CssClass="text-center" ButtonType="Image" 
                                    CommandName="Imprimir" ImageUrl="~\ico\print.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Asistencia" HeaderStyle-CssClass="text-center" 
                                    CommandName="Asistencia" ButtonType="Image" ImageUrl="~\ico\checklist.png">
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
                        data-toggle="modal" data-target="#IndexAddModal" />
                    <h4>Nueva Gestión Laboral</h4>
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

    <!-- IndexAddModal -->
    <div id="IndexAddModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Agregar Gestión Laboral</h3>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">

                            <div class="row">
                                <div class="col-md-12">
                                    <h3 class="text-center">Tipo de Gestión Laboral</h3>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnEntrega" runat="server" Text="Entrega de Equipos"
                                        class="btn btn-block btn-success" data-toggle="modal" data-target="#AddEntrega" OnClick="cerrarModalIndex"></asp:Button>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="Button2" runat="server" Text="Capacitación"
                                        class="btn btn-block btn-warning" data-toggle="modal" data-target="#AddCapacitacion" OnClick="cerrarModalIndex"></asp:Button>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnJornada" runat="server" Text="Jornada de Examenes"
                                        class="btn btn-block btn-primary" data-toggle="modal" data-target="#AddJornada" OnClick="cerrarModalIndex"></asp:Button>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnActividad" runat="server" Text="Actividad Recreativa"
                                        class="btn btn-block btn-danger" data-toggle="modal" data-target="#AddActividad" OnClick="cerrarModalIndex"></asp:Button>
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

    <!-- Entrega de equipos y materiales -->
    <div>
        <!-- AddEntrega -->
        <div id="AddEntrega" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Agregar Entrega de Equipos y Materiales</h3>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <br />

                                <asp:PlaceHolder runat="server" ID="phEmpAddEnt">
                                    <div class="row">
                                        <div>
                                            <div class="col-md-6 control-label">
                                                <label>Empresa: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlEmpAddEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpAddEnt_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlEmpAddEnt" runat="server"
                                                    ValidationGroup="ValidationAddEnt" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucAddEnt">
                                    <div class="row">
                                        <div>
                                            <div class="col-md-6 control-label">
                                                <label>Sucursal: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSucAddEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucAddEnt_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlSucAddEnt" runat="server"
                                                    ValidationGroup="ValidationAddEnt" />

                                            </div>

                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phUsuAddEnt">
                                    <div class="row">
                                        <div>
                                            <div class="col-md-6 control-label">
                                                <label>Responsable: </label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlUsuAddEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlUsuAddEnt" runat="server"
                                                    ValidationGroup="ValidationAddEnt" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">
                                            Fecha de la Actividad: 

                                        </label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtFechaEntrega" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtFechaEntrega" runat="server"
                                                ValidationGroup="ValidationAddEnt" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">Descripción: </label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDescEntrega" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtDescEntrega" runat="server"
                                                ValidationGroup="ValidationAddEnt" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <asp:PlaceHolder runat="server" ID="phAsisAddEnt">
                                    <div class="row">
                                        <div>
                                            <label class="col-md-6 control-label">Seleccione los trabajadores que asistiran a la Actividad: </label>
                                            <div class="col-md-6">
                                                <asp:Button ID="Button1" runat="server" Text="Lista de Trabajadores"
                                                    class="btn btn-block btn-success" data-toggle="modal" data-target="#listaModal" />
                                            </div>

                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="btnAddEntrega" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="InsertarEntrega" ValidationGroup="ValidationAddEnt" /></div>
                                    <div class="col-md-4">
                                        <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers></Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <!-- Edit Entrega Modal -->
        <div id="EditEntrega" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Editar Entrega de Equipos y Materiales</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <asp:HiddenField ID="hdfEditEntregaID" runat="server" />
                                <br />

                                <asp:PlaceHolder runat="server" ID="phEmpEditEnt">
                                    <div class="row">
                                        <div>
                                            <div class="col-md-6 control-label">
                                                <label>Empresa: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlEmpEditEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpEditEnt_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlEmpEditEnt" runat="server"
                                                    ValidationGroup="ValidationEditEnt" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucEditEnt">
                                    <div class="row">
                                        <div>
                                            <div class="col-md-6 control-label">
                                                <label>Sucursal: </label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSucEditEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucEditEnt_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlSucEditEnt" runat="server"
                                                    ValidationGroup="ValidationEditEnt" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phUsuEditEnt">
                                    <div class="row">
                                        <div>
                                            <div class="col-md-6 control-label">
                                                <label>Responsable: </label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlUsuEditEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlUsuEditEnt" runat="server"
                                                    ValidationGroup="ValidationEditEnt" />
                                            </div>

                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">Fecha de la Actividad: </label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtFechaEditEntrega" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtFechaEditEntrega" runat="server"
                                                ValidationGroup="ValidationEditEnt" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">Descripción: </label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDescEditEntrega" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtDescEditEntrega" runat="server"
                                                ValidationGroup="ValidationEditEnt" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <asp:PlaceHolder runat="server" ID="phAsisEditEnt">
                                    <div class="row">
                                        <div>
                                            <label class="col-md-6 control-label">Seleccione los trabajadores que asistiran a la Actividad: </label>
                                            <div class="col-md-6">
                                                <asp:Button ID="Button8" runat="server" Text="Lista de Trabajadores" class="btn btn-block btn-success"
                                                    data-toggle="modal" data-target="#listaModal" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>

                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" class="btn btn-block btn-info" OnClick="btnEditarEntrega_Click" ValidationGroup="ValidationEditEnt" /></div>
                                    <div class="col-md-4">
                                        <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers></Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <!-- Capacitacion -->
    <div>
        <!-- AddCapacitacion -->
        <div id="AddCapacitacion" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Agregar Capacitación</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <br />

                                <asp:PlaceHolder runat="server" ID="phEmpAddCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Empresa: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlEmpAddCap" AutoPostBack="true" runat="server"
                                                ClientIDMode="Static" CssClass="form-control"
                                                OnSelectedIndexChanged="ddlEmpAddCap_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlEmpAddCap" runat="server"
                                                ValidationGroup="ValidationAddCap" />
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucAddCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Sucursal: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlSucAddCap" AutoPostBack="true" runat="server"
                                                ClientIDMode="Static" CssClass="form-control"
                                                OnSelectedIndexChanged="ddlSucAddCap_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlSucAddCap" runat="server"
                                                ValidationGroup="ValidationAddCap" />
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phUsuAddCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Responsable: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlUsuAddCap" AutoPostBack="true" runat="server"
                                                ClientIDMode="Static" CssClass="form-control">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128"
                                                Font-Size="10" Font-Bold="true" ControlToValidate="ddlUsuAddCap"
                                                runat="server" ValidationGroup="ValidationAddCap" />
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div class="col-md-6 control-label">
                                        <label>Fecha de la Capacitación: </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtFechaCapacitacion" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" TextMode="Date"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtFechaCapacitacion" runat="server"
                                            ValidationGroup="ValidationAddCap" />
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-6 control-label">
                                        <label>Descripción de la capacitacion:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtDescCapAdd" runat="server" TextMode="multiline"
                                            class="form-control" Rows="3" ClientIDMode="Static" CssClass="form-control">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtDescCapAdd" runat="server"
                                            ValidationGroup="ValidationAddCap" />
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-6 control-label">
                                        <label>Objetivo de la capacitacion:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtObjCapAdd" runat="server" TextMode="multiline"
                                            class="form-control" Rows="3" ClientIDMode="Static" CssClass="form-control">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtObjCapAdd" runat="server"
                                            ValidationGroup="ValidationAddCap" />
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-6 control-label">
                                        <label>Cantidad de Horas:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtHoras" type="number" step="0.01" runat="server" ClientIDMode="Static"
                                            CssClass="form-control"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtHoras" runat="server"
                                            ValidationGroup="ValidationAddCap" />
                                    </div>
                                </div>
                                <br />

                                <asp:PlaceHolder runat="server" ID="phAsisAddCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Seleccione los trabajadores que asistiran a la Actividad: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Button runat="server" Text="Lista de Trabajadores"
                                                class="btn btn-block btn-success" data-toggle="modal" data-target="#listaModal" />
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            </div>

                            <div class="modal-footer">
                                <div class="row">

                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                            OnClick="InsertarCapacitacion" ValidationGroup="ValidationAddCap" />
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

        <!-- EditCapacitacion -->
        <div id="EditCapacitacion" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Editar Capacitación</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <asp:HiddenField ID="hdfEditCapacitacionID" runat="server" />
                                <br />

                                <asp:PlaceHolder runat="server" ID="phEmpEditCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Empresa: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlEmpEditCap" AutoPostBack="true" runat="server"
                                                ClientIDMode="Static" CssClass="form-control"
                                                OnSelectedIndexChanged="ddlEmpEditCap_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlEmpEditCap" runat="server"
                                                ValidationGroup="ValidationEditCap" />
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucEditCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Sucursal: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlSucEditCap" AutoPostBack="true" runat="server"
                                                ClientIDMode="Static" CssClass="form-control"
                                                OnSelectedIndexChanged="ddlSucEditCap_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlSucEditCap" runat="server"
                                                ValidationGroup="ValidationEditCap" />
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phUsuEditCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Responsable: </label>
                                        </div>

                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlUsuEditCap" AutoPostBack="true" runat="server"
                                                ClientIDMode="Static" CssClass="form-control">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlUsuEditCap" runat="server"
                                                ValidationGroup="ValidationEditCap" />
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <label class="col-md-6 control-label">Fecha de la Capacitación: </label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtFechaEditCapacitacion" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" TextMode="Date"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtFechaEditCapacitacion" runat="server"
                                            ValidationGroup="ValidationEditCap" />
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <label class="col-md-6 control-label">Descripción de la capacitacion: </label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtDesCapEdit" runat="server" TextMode="multiline"
                                            class="form-control" Rows="3" ClientIDMode="Static"
                                            CssClass="form-control">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtDesCapEdit" runat="server"
                                            ValidationGroup="ValidationEditCap" />
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <label class="col-md-6 control-label">Objetivos de la capacitacion: </label>
                                    <div class="col-md-6">

                                        <asp:TextBox ID="txtObjCapEdit" runat="server" TextMode="multiline"
                                            class="form-control" Rows="3" ClientIDMode="Static" CssClass="form-control">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtObjCapEdit" runat="server"
                                            ValidationGroup="ValidationEditCap" />
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <label class="col-md-6 control-label">Cantidad de Horas: </label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtHorasEditCapacitacion" type="number" step="0.01" runat="server"
                                            ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtHorasEditCapacitacion" runat="server"
                                            ValidationGroup="ValidationEditCap" />
                                    </div>
                                </div>
                                <br />

                                <asp:PlaceHolder runat="server" ID="phAsisEditCap" Visible="false">
                                    <div class="row">
                                        <label class="col-md-6 control-label">
                                            Seleccione los trabajadores que asistiran a la Capacitación: 
                                        </label>
                                        <div class="col-md-6">
                                            <asp:Button ID="Button15" runat="server" Text="Lista de Trabajadores"
                                                class="btn btn-block btn-success" data-toggle="modal" data-target="#listaModal" />
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="Button4" runat="server" Text="Editar" class="btn btn-block btn-info"
                                            OnClick="btnEditarCapacitacion_Click" ValidationGroup="ValidationEditCap" />
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
    </div>

    <!-- Actividades Recreativas -->
    <div>
        <!-- Add Actividad Modal-->
        <div id="AddActividad" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Agregar Actividad Recreativa</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <br />

                                <asp:PlaceHolder runat="server" ID="phEmpAddAct">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Empresa: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlEmpAddAct" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlEmpAddAct_SelectedIndexChanged">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlEmpAddAct" runat="server"
                                                    ValidationGroup="ValidationAddAct" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucAddAct">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Sucursal: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSucAddAct" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlSucAddAct_SelectedIndexChanged">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlSucAddAct" runat="server"
                                                    ValidationGroup="ValidationAddAct" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phUsuAddAct">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Responsable: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlUsuAddAct" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlUsuAddAct" runat="server"
                                                    ValidationGroup="ValidationAddAct" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">Fecha de la Actividad Recreativa: </label>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtFechaActividad" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" TextMode="Date"></asp:TextBox>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtFechaActividad" runat="server"
                                                ValidationGroup="ValidationAddAct" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">Descripción: </label>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDescActividad" TextMode="multiline" class="form-control" Rows="3"
                                                runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtDescActividad" runat="server"
                                                ValidationGroup="ValidationAddAct" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <asp:PlaceHolder runat="server" ID="phAsisAddAct">
                                    <div class="row">
                                        <div>
                                            <label class="col-md-6 control-label">
                                                Seleccione los trabajadores que asistiran a la Actividad:
                                            </label>

                                            <div class="col-md-4">
                                                <asp:Button ID="Button6" runat="server" Text="Lista de Trabajadores"
                                                    class="btn btn-block btn-success" data-toggle="modal" data-target="#listaModal" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>

                            </div>

                            <div class="modal-footer">
                                <div class="row">

                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="Button16" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                            OnClick="InsertarActividad" ValidationGroup="ValidationAddAct" />
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

        <!-- Edit Actividad Modal -->
        <div id="EditActividad" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Editar Actividad Recreativa</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                        <ContentTemplate>

                            <div class="modal-body form-group">
                                <asp:HiddenField ID="hdfEditActividadID" runat="server" />
                                <br />

                                <asp:PlaceHolder runat="server" ID="phEmpEditAct">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Empresa: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlEmpEditAct" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlEmpEditAct_SelectedIndexChanged">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlEmpEditAct" runat="server"
                                                    ValidationGroup="ValidationEditAct" />
                                            </div>

                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucEditAct">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Sucursal: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSucEditAct" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlSucEditAct_SelectedIndexChanged">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlSucEditAct" runat="server"
                                                    ValidationGroup="ValidationEditAct" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phUsuEditAct">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Responsable: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlUsuEditAct" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlUsuEditAct" runat="server"
                                                    ValidationGroup="ValidationEditAct" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">Fecha de la Actividad Recreativa: </label>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtFechaEditActividad" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" TextMode="Date"></asp:TextBox>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtFechaEditActividad" runat="server"
                                                ValidationGroup="ValidationEditAct" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">Descripción: </label>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDescEditActividad" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtDescEditActividad" runat="server"
                                                ValidationGroup="ValidationEditAct" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <asp:PlaceHolder runat="server" ID="phAsisEditAct">
                                    <div class="row">
                                        <div>
                                            <label class="col-md-6 control-label">
                                                Seleccione los trabajadores que asistiran a la Actividad Recreativa:
                                            </label>

                                            <div class="col-md-6">
                                                <asp:Button ID="Button13" runat="server" Text="Lista de Trabajadores"
                                                    class="btn btn-block btn-success" data-toggle="modal" data-target="#listaModal" />
                                            </div>

                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="Button7" runat="server" Text="Editar" class="btn btn-block btn-info"
                                            OnClick="btnEditarActividad_Click" ValidationGroup="ValidationEditAct" />
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
    </div>

    <!-- Jornada Examenes -->
    <div>
        <!-- Add Jornada Modal -->
        <div id="AddJornada" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Agregar Jornada de examenes</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <br />

                                <asp:PlaceHolder runat="server" ID="phEmpAddJor">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Empresa: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlEmpAddJor" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlEmpAddJor_SelectedIndexChanged">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlEmpAddJor" runat="server"
                                                    ValidationGroup="ValidationAddJor" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucAddJor">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Sucursal: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSucAddJor" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlSucAddJor_SelectedIndexChanged">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlSucAddJor" runat="server"
                                                    ValidationGroup="ValidationAddJor" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phUsuAddJor">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Responsable: </label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlUsuAddJor" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlUsuAddJor" runat="server"
                                                    ValidationGroup="ValidationAddJor" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div>

                                        <label class="col-md-6 control-label">Fecha de la Jornada: </label>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtFechaJornada" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" TextMode="Date"></asp:TextBox>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtFechaJornada" runat="server"
                                                ValidationGroup="ValidationAddJor" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div>
                                        <label class="col-md-6 control-label">Descripción: </label>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDescJornada" runat="server" TextMode="multiline"
                                                class="form-control" Rows="3" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtDescJornada" runat="server"
                                                ValidationGroup="ValidationAddJor" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <asp:PlaceHolder runat="server" ID="phAsisAddJor">
                                    <div class="row">
                                        <div>
                                            <label class="col-md-6 control-label">
                                                Seleccione los trabajadores que asistiran a la Actividad:
                                            </label>
                                            <div class="col-md-4">
                                                <asp:Button ID="Button3" runat="server" Text="Lista de Trabajadores"
                                                    class="btn btn-block btn-success" data-toggle="modal" data-target="#listaModal" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="Button14" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                            OnClick="InsertarJornada" ValidationGroup="ValidationAddJor" />
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

        <!-- Edit Jornada Modal -->
        <div id="EditJornada" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Editar Jornada de Examenes</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <asp:HiddenField ID="hdfEditJornadaID" runat="server" />
                                <br />

                                <asp:PlaceHolder runat="server" ID="phEmpEditJor">
                                    <div class="row">
                                        <div>

                                            <div class="col-md-6 control-label">
                                                <label>Empresa: </label>
                                            </div>

                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlEmpEditJor" AutoPostBack="true" runat="server"
                                                    ClientIDMode="Static" CssClass="form-control"
                                                    OnSelectedIndexChanged="ddlEmpEditJor_SelectedIndexChanged">
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlEmpEditJor" runat="server"
                                                    ValidationGroup="ValidationEditJor" />
                                            </div>

                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucEditJor">
                                    <div class="row">
                                        <div>
                                            <div class="col-md-6 control-label">
                                                <label>Empresa: </label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSucEditJor" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucEditJor_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlSucEditJor" runat="server"
                                                    ValidationGroup="ValidationEditJor" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phUsuEditJor">
                                    <div class="row">
                                        <div>
                                            <div class="col-md-6 control-label">
                                                <label>Empresa: </label>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlUsuEditJor" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpEditJor_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="ddlUsuEditJor" runat="server"
                                                    ValidationGroup="ValidationEditJor" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div>

                                        <label class="col-md-6 control-label">Fecha de la Jornada: </label>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtFechaEditJornada" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" TextMode="Date"></asp:TextBox>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtFechaEditJornada" runat="server"
                                                ValidationGroup="ValidationEditJor" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div>

                                        <label class="col-md-6 control-label">Descripción: </label>

                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDescEditJornada" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtDescEditJornada" runat="server"
                                                ValidationGroup="ValidationEditJor" />
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <asp:PlaceHolder runat="server" ID="phAsisEditJor">
                                    <div class="row">
                                        <div>

                                            <label class="col-md-6 control-label">
                                                Seleccione los trabajadores que asistiran a la Jornada:
                                            </label>

                                            <div class="col-md-4">
                                                <asp:Button ID="Button9" runat="server" Text="Lista de Trabajadores"
                                                    class="btn btn-block btn-success" data-toggle="modal" data-target="#listaModal" />
                                            </div>
                                        </div>

                                    </div>
                                </asp:PlaceHolder>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="Button5" runat="server" Text="Editar" class="btn btn-block btn-info"
                                            OnClick="btnEditarJornada_Click" ValidationGroup="ValidationEditJor" />
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
    </div>

    <!-- otros  modales  -->
    <div>
        <!-- Delete Record Modal-->
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
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button ID="btnDelete" runat="server" Text="Eliminar"
                                            class="btn btn-block btn-info" OnClick="EliminarRegistro" />
                                    </div>

                                    <div class="col-md-4">
                                        <button class="btn btn-block btn-default" data-dismiss="modal"
                                            aria-hidden="true">
                                            Cerrar</button>
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

        <!-- print lista Modal-->
        <div id="PrintListaModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Imprimir Registro</h3>
                    </div>
                    <div class="modal-body form-group">
                        <asp:HiddenField ID="hImprimir" runat="server" />

                        <div class="row">
                            <h4 class="text-center">¿Seguro desea imprimir este registro?</h4>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-2">
                                <asp:Button ID="btPrint" runat="server" Text="Imprimir" AutoPostBack="true"
                                    class="btn btn-block btn-info" OnClick="btPrint_Click" />
                            </div>

                            <div class="col-md-4">
                                <button class="btn btn-block btn-default" data-dismiss="modal"
                                    aria-hidden="true">
                                    Cerrar</button>
                            </div>
                        </div>
                    </div>
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
                                        <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
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

        <!-- lista trabajadores  -->
        <div id="listaModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Seleccione Trabajadores</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>

                            <div class="modal-body form-group">
                                <asp:CheckBoxList ID="chkTrabajadores" runat="server"></asp:CheckBoxList>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-4">
                                        <button class="btn btn-block btn-info" data-dismiss="modal" aria-hidden="true">Aceptar</button>
                                    </div>
                                </div>
                            </div>

                        </ContentTemplate>
                        <Triggers></Triggers>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>

        <!-- Escaneado Modal -->
        <div id="EscaneadoModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Subir Archivo Escaneado</h3>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                        <ContentTemplate>

                            <div class="modal-body form-group">
                                <asp:HiddenField ID="hdfIDEsc" runat="server" />

                                <div class="row form-group">
                                    <label class="col-md-2 control-label">Archivo: </label>
                                    <div class="col-md-10">
                                        <asp:FileUpload ID="flEscaneado" runat="server" ClientIDMode="Static" ></asp:FileUpload>

                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-3"></div>

                                    <div class="col-md-3">
                                        <asp:Button ID="btnEscaneado" runat="server" Text="Subir" OnClick="btnSubirArchivo"
                                            class="btn btn-block btn-info" />
                                    </div>

                                    <div class="col-md-3">
                                        <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                    </div>
                                </div>
                            </div>

                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnEscaneado" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
