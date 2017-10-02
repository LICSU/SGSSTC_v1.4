<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Trabajador.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Trabajador" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="upTrabajador1" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="#">Trabajador</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Trabajador</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox ID="txtBuscar" runat="server" class="form-control" PlaceHolder="Ingrese el trabajador a buscar"
                        data-toggle="tooltip" data-placement="bottom" title="Ingrese el texto a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar"
                        runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
                </div>
            </div>

            <br />

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3 text-center">
                        <label>Filtrar por empresa</label>
                        <asp:DropDownList runat="server" ID="ddlEmpresasFiltro" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresasFiltro_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                    <div class="col-md-3 col-md-offset-1 text-center">
                        <label>Filtrar por sucursal</label>
                        <asp:DropDownList runat="server" ID="ddlSucursalFiltro" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursalFiltro_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-3 text-center">
                    <label>Filtrar por area</label>
                    <asp:DropDownList runat="server" ID="ddlAreaFiltro" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlAreaFiltro_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="col-md-3 text-center">
                    <label>Filtrar por Estatus</label>
                    <asp:DropDownList runat="server" ID="ddlEstatusFiltro" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlEstatusFiltro_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        

                        <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated"
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField HeaderText="Cédula" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="id_empresa" runat="server" Visible="false" Value='<%# Eval("empresa") %>' />
                                        <asp:Label ID="id" runat="server" Visible="false" Text='<%# Eval("id_trabajador") %>' />
                                        <asp:Label ID="cedula" runat="server" Text='<%# Eval("cedula") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre(s)" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombres" runat="server" Text='<%# Eval("nombres") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Apellido(s)" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="apellidos" runat="server" Text='<%# Eval("apellidos") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="sucursal" runat="server" Text='<%# Eval("sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="id_area" runat="server" Visible="false" Value='<%# Eval("id_area") %>'></asp:HiddenField>
                                        <asp:Label ID="area" runat="server" Text='<%# Eval("area") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Estatus" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="estatus" runat="server" Text='<%# Eval("Nomestatus") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField  HeaderText="Agregar Reposo" CommandName="AddReposo" ButtonType="Image"
                                    ImageUrl="~\ico\checklist.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Consultar" CommandName="Consultar" ButtonType="Image"
                                    ImageUrl="~\ico\view.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image"
                                    ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
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
                    <div class="col-md-4 col-md-offset-2">
                        <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                            OnClick="AgregarRegistro" />
                        <h4>Nuevo Trabajador</h4>
                    </div>

                    <div class="col-md-4 ">
                        <asp:ImageButton alt="-" ID="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png"
                            OnClick="btDescargar_Click" />
                        <h4>Descargar Lista</h4>
                    </div>
                </div>
            </asp:PlaceHolder>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Agregar Reposo Modal -->
    <div id="agregarReposo" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button id="Button1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Carga de Constancias</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>

                        <div class="modal-body  form-group">
                            <asp:HiddenField ID="hdfTrabajadorEstID" runat="server" />

                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <h4>¿Tuvo reposo?</h4>
                                    <asp:RadioButtonList ID="rblReposo" RepeatColumns="2" AutoPostBack="true" runat="server"
                                        data-toggle="tooltip" data-placement="bottom" title="Seleccione si hubo reposo"
                                        OnSelectedIndexChanged="rblReposo_SelectedIndexChanged">
                                        <asp:ListItem Text="Si" Value="Si" style="margin-right: 10px;"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="col-md-4">
                                    <asp:PlaceHolder runat="server" ID="phDiasReposo" Visible="false">
                                        <h4>Días de Reposo</h4>
                                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" min="1" Text="1"
                                            ID="txtDiasReposo"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese los numeros de dias de reposo"></asp:TextBox>
                                    </asp:PlaceHolder>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Motivo</h4>
                                    <asp:DropDownList ID="rblDiagnostico" CssClass="form-control"
                                        OnSelectedIndexChanged="rblDiagnostico_SelectedIndexChanged" AutoPostBack="true" runat="server"
                                        data-toggle="tooltip" data-placement="bottom" title="Seleccione el motivo del reposo">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Accidente Comun" Value="AC"></asp:ListItem>
                                        <asp:ListItem Text="Accidente Laboral" Value="AL"></asp:ListItem>
                                        <asp:ListItem Text="Enfermedad Laboral" Value="EL"></asp:ListItem>
                                        <asp:ListItem Text="Enfermedad Comun" Value="EC"></asp:ListItem>
                                        <asp:ListItem Text="Posible Enfermedad Laboral" Value="PEL"></asp:ListItem>
                                        <asp:ListItem Text="Otro" Value="O"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <asp:PlaceHolder runat="server" ID="phOtroDiagnostico" Visible="false">
                                        <h4>Causa</h4>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtOtroDiagnostico" MaxLength="300"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese la causa del reposo"></asp:TextBox>
                                    </asp:PlaceHolder>
                                </div>
                            </div>

                            <br />

                            <asp:PlaceHolder runat="server" ID="phAccidenteComun" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>
                                            <asp:Label runat="server" ID="lbAcc" Text=""></asp:Label></h4>
                                        <asp:TextBox TextMode="Multiline" Rows="2" runat="server" CssClass="form-control"
                                            ID="txtAccidenteComun"></asp:TextBox>
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phEnfermedadLaboral" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>
                                            <asp:Label runat="server" ID="lblEnfermedad" Text=""></asp:Label></h4>
                                        <asp:DropDownList ID="ddlEnfermedadReposo" CssClass="form-control" runat="server"
                                            ClientIDMode="Static" AutoPostBack="true">
                                        </asp:DropDownList><br />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Seleccione el Sistema Afectado</h4>
                                        <asp:DropDownList ID="ddlSistemaReposo" CssClass="form-control" runat="server" AutoPostBack="true" ClientIDMode="Static"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el Sistema Afectado">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phPEE" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>
                                            <asp:Label runat="server" ID="lbll"
                                                Text="Posible Enfermedad Laboral"></asp:Label></h4>
                                        <asp:DropDownList ID="ddlEnfermedadLaboral" CssClass="form-control" runat="server"
                                            ClientIDMode="Static"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione la posible enfermedad laboral">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Fecha de la Constancia</h4>

                                    <asp:TextBox ID="txtFechaConstancia" CssClass="form-control" TextMode="Date" runat="server"
                                        ClientIDMode="Static"
                                        data-toggle="tooltip" data-placement="bottom" title="Ingrese la Fecha de la Constancia"></asp:TextBox>
                                </div>

                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Motivo</h4>

                                    <asp:TextBox ID="txtMotivoRep" CssClass="form-control" MaxLength="300" TextMode="Multiline" Rows="2"
                                        runat="server" ClientIDMode="Static"
                                        data-toggle="tooltip" data-placement="bottom" title="Ingrese el motivo del reposo"></asp:TextBox>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Agregar Constancia</h4>
                                    <asp:FileUpload ID="fuConstancia" runat="server"
                                        data-toggle="tooltip" data-placement="bottom" title="Seleccione el soporte fotográfico de la constancia" />
                                </div>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2 text-center">
                                    <asp:Button ID="btnGuardarReposo" Text="Guardar" runat="server" OnClick="btnGuardarReposo_Click"
                                        class="btn btn-block btn-info"
                                        data-toggle="tooltip" data-placement="bottom" title="Presione para guardar el reposo" />
                                </div>

                                <div class="col-md-4 text-center">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnGuardarReposo" />
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
                    <h3>Ver Trabajador</h3>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-body text-left">
                            <asp:HiddenField ID="hdfIdTrabajadorView" runat="server" />

                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <asp:Image alt="-" runat="server" ID="imgLogo" CssClass="thumbnail"
                                        ImageUrl="~/archivos/LogosEmpresas/LICSU.jpg" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Nombre y Apellido</h4>
                                    <asp:Label ID="txtNombres" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Cédula</h4>
                                    <asp:Label ID="txtCedula" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Email</h4>

                                    <asp:Label ID="txtEmail" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Fecha de Nacimiento</h4>

                                    <asp:Label ID="txtFechaN" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Estado Civil</h4>
                                    <asp:Label ID="txtEdoCivil" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Sexo</h4>

                                    <asp:Label ID="txtSexo" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Teléfono</h4>

                                    <asp:Label ID="txtTelefono" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Celular</h4>

                                    <asp:Label ID="txtCelular" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>CCF</h4>
                                    <asp:Label ID="txtCcf" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Dirección</h4>
                                    <asp:Label ID="txtDireccion" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Región</h4>

                                    <asp:Label ID="txtRegion" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Departamento</h4>

                                    <asp:Label ID="txtDepartamento" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Municipio</h4>

                                    <asp:Label ID="txtMunicipio" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Empresa</h4>

                                    <asp:Label ID="txtEmpresa" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Sucursal</h4>

                                    <asp:Label ID="txtSucursal" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Puesto de Trabajo</h4>

                                    <asp:Label ID="txtPuesto" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <button class="btn btn-block btn-primary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
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
                            <asp:HiddenField ID="hdfTrabajadorIDDel" runat="server" />

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

    <!-- Descargar -->
    <div id="modalDescargar" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Descargar Trabajador</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfTrabajadorIDDesc" runat="server" />

                            <div class="row">
                                <h4 class="text-center">¿Desea Descargar este registro?</h4>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btDescargar" runat="server" Text="Descargar" class="btn btn-block btn-info"
                                        OnClick="btDescargar_Click" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btDescargar" />
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