<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ComunicacionPoliticaSST.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_ComunicacionPoliticaSST" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Planear</a></li>
                <li><a href="#">Comunicado de Politica SST</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Comunicado de Politica SST</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <asp:TextBox ID="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el comunicado a buscar"></asp:TextBox>
                </div>

                <div class="col-md-2">
                    <asp:Button ID="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro" />
                </div>
            </div>
            <br />

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <div class="col-md-4">
                    <h4 class="text-center">Trabajador</h4>
                    <asp:TextBox ID="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:hiddenfield id="hdnValue" onvaluechanged="hdnValue_ValueChanged" runat="server"/>
                    <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1"
                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                        TargetControlID="txtTrabajador" ID="AutoCompleteExtender1" runat="server"
                        FirstRowSelected="false"
                        CompletionListCssClass="completionList"
                        CompletionListItemCssClass="listItem"
                        OnClientItemSelected="OnContactSelected"
                        CompletionListHighlightedItemCssClass="itemHighlighted">
                    </cc1:AutoCompleteExtender>
                </div>
            </div>

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
                            EmptyDataText="No existen Registros">
                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Eval("id_comunicado") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Trabajador" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="NomTrabajador" runat="server" Text='<%# Eval("NomTrabajador") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="sucursal" runat="server" Text='<%# Eval("sucursal") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Consultar" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ImageUrl="~\ico\view.png" NavigateUrl='<%# Eval("ruta") %>' Target="_blank">Descargar</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>

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
                <div class="col-md-4 col-md-offset-4">
                    <asp:ImageButton alt="-" ID="btnComunicado" runat="server" ImageUrl="~\ico\agregar.png"
                        OnClick="btnComunicado_Onclick" />
                    <h4>Crear Comunicado</h4>
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
                                    <h3 class="text-center">Tipo de Comunicado</h3>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnEntrega" runat="server" Text="Por Sucursal" class="btn btn-block btn-success" OnClick="btnAgregarGral_Onclick"></asp:Button>
                                </div>
                            </div>
                            <br />
                            <asp:PlaceHolder runat="server" ID="phGeneral" Visible="false">
                                <div class="modal-body form-group">

                                    <asp:PlaceHolder runat="server" ID="phSucursal3">
                                        <div class="row">
                                            <div>
                                                <label class="col-md-4 control-label">Sucursal: </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlSucursalGral" runat="server" ClientIDMode="Static"
                                                        CssClass="form-control">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                        Font-Bold="true" ControlToValidate="ddlSucursalGral" runat="server"
                                                        ValidationGroup="ValidationAdd1" />
                                                </div>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                    <br />

                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-4">
                                            <asp:Button ID="btnGeneral" runat="server" Text="Crear" class="btn btn-block btn-info" OnClick="crearlistaGral" ValidationGroup="ValidationAdd1" />
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="Button2" runat="server" Text="Por Trabajador" class="btn btn-block btn-warning" OnClick="btnAgregarEsp_Onclick"></asp:Button>
                                </div>
                            </div>
                            <br />
                            <asp:PlaceHolder runat="server" ID="phEspecifico" Visible="false">
                                <div class="modal-body form-group">

                                    <asp:PlaceHolder runat="server" ID="phSucursalAdd">
                                        <div class="row">
                                            <div>
                                                <label class="col-md-4 control-label">Sucursal: </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlSucursalAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                                        CssClass="form-control" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlSucursalAdd_SelectedIndexChanged">
                                                    </asp:DropDownList>

                                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                        Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server"
                                                        ValidationGroup="ValidationAdd" />
                                                </div>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>

                                    <div class="row">
                                        <div>
                                            <label class="col-md-4 control-label">Trabajador: </label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtTrabajadorEsp" runat="server" CssClass="form-control"></asp:TextBox>
                                                <div ID="ListDivisor">
                                                    <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajadorEsp" MinimumPrefixLength="1"
                                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                        TargetControlID="txtTrabajadorEsp" ID="AutoCompleteExtender2" runat="server"
                                                        FirstRowSelected="false"
                                                        CompletionListCssClass="completionList"
                                                        CompletionListItemCssClass="listItem"
                                                        CompletionListElementID="ListDivisor" 
                                                        CompletionListHighlightedItemCssClass="itemHighlighted">
                                                    </cc1:AutoCompleteExtender>
                                                </div>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="txtTrabajadorEsp" runat="server"
                                                    ValidationGroup="ValidationAdd" />
                                            </div>
                                        </div>

                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-4">
                                            <asp:Button ID="btnEspecifico" runat="server" Text="Crear" class="btn btn-block btn-info" OnClick="Guardar" ValidationGroup="ValidationAdd" />
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="Button1" runat="server" Text="Subir Comunicado" class="btn btn-block btn-danger" OnClick="btnSubir_Onclick"></asp:Button>
                                </div>
                            </div>
                            <br />

                            <asp:PlaceHolder runat="server" ID="phSubir" Visible="false">
                                <div class="modal-body form-group">

                                    <div class="row">
                                        <div>
                                            <label class="col-md-4 control-label">Nombre: </label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtNombreSubir" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="txtNombreSubir" runat="server"
                                                    ValidationGroup="ValidationAdd" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <asp:PlaceHolder runat="server" ID="phSucursalSubir">
                                        <div class="row">
                                            <div>
                                                <label class="col-md-4 control-label">Sucursal: </label>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlSucursalSubir" runat="server" ClientIDMode="Static"
                                                        CssClass="form-control" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlSucursalSubir_SelectedIndexChanged">
                                                    </asp:DropDownList>

                                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                        Font-Bold="true" ControlToValidate="ddlSucursalSubir" runat="server"
                                                        ValidationGroup="ValidationAdd" />
                                                </div>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                    <br />

                                    <div class="row">
                                        <div>
                                            <label class="col-md-4 control-label">Trabajador: </label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtTrabajadorSub" runat="server" CssClass="form-control"></asp:TextBox>
                                                <div ID="ListDivisor3">
                                                    <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajadorSub" MinimumPrefixLength="1"
                                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                                        TargetControlID="txtTrabajadorSub" ID="AutoCompleteExtender3" runat="server"
                                                        FirstRowSelected="false"
                                                        CompletionListCssClass="completionList"
                                                        CompletionListItemCssClass="listItem"
                                                        CompletionListElementID="ListDivisor3" 
                                                        CompletionListHighlightedItemCssClass="itemHighlighted">
                                                    </cc1:AutoCompleteExtender>
                                                </div>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="txtTrabajadorSub" runat="server"
                                                    ValidationGroup="ValidationAdd" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div>
                                            <label class="col-md-4 control-label">Archivo: </label>
                                            <div class="col-md-6">
                                                <asp:FileUpload ID="flpArchivo" runat="server" ClientIDMode="Static" ></asp:FileUpload>
                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                                    SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                    Font-Bold="true" ControlToValidate="flpArchivo" runat="server"
                                                    ValidationGroup="ValidationAdd" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-4">
                                            <asp:Button ID="btnSubirComunicado" runat="server" Text="Crear"
                                                class="btn btn-block btn-info" OnClick="btnSubirComunicado_OnClick"
                                                ValidationGroup="ValidationAdd" />
                                        </div>
                                    </div>

                                </div>
                            </asp:PlaceHolder>

                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnEspecifico" />
                        <asp:PostBackTrigger ControlID="btnGeneral" />
                        <asp:PostBackTrigger ControlID="btnSubirComunicado" />
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

    <script>
        function OnContactSelected(source, eventArgs) {
        
            var hdnValueID = "<%= hdnValue.ClientID %>";

            document.getElementById(hdnValueID).value = eventArgs.get_value();
            __doPostBack(hdnValueID, "");
        } 
    </script>


</asp:Content>
