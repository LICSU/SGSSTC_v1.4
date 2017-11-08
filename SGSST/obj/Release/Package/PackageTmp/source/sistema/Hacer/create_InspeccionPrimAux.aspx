<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionPrimAux.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionPrimAux" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../Hacer/index_Inspecciones.aspx">Inspecciones</a></li>
        <li><a href="#">Crear Inspección de Botiquín</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Botiquín de Primeros Auxilios</h1>
    </div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="cantInspecciones" Value="0"></asp:HiddenField>

            <div class="row form-group">

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
                <div class="col-md-4">
                    <h4 class="text-center">Seleccione el Tipo</h4>
                    <asp:DropDownList runat="server" ID="ddlTipo" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Tipo A" Value="a"></asp:ListItem>
                        <asp:ListItem Text="Tipo B" Value="b"></asp:ListItem>
                        <asp:ListItem Text="Tipo C" Value="c"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <!-- TIPO A -->
            <asp:PlaceHolder runat="server" ID="phInformacionTipoA" Visible="false">
                <div class="row form-group text-center">
                    <h4>Hoja de Inventario - Botiquín de Primeros Auxilios(Tipo A)</h4>
                </div>
                <div class="row">
                    <div class="col-md-12  ">
                        <asp:Panel runat="server" ID="pnDatosA">
                            <asp:Table runat="server" ID="tb_datos" CssClass="table">
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell>Insumo</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Cantidad Requerida</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Unidad</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Existencia</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Diferencia</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Reemplazado</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="GASAS LIMPIAS PAQUETE" ID="lblAIns1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 20 Unidades" ID="lblAUni1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp1" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ESPARADRAPO DE TELA ROLLO de 4" ID="lblAIns2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblAUni2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp2" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="BAJALENGUAS" ID="lblAIns3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 20 Unidades" ID="lblAUni3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp3" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="GUANTES DE LATEX PARA EXAMEN" ID="lblAIns4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Caja por 100" ID="lblAUni4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp4" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 2 X 5 YARDAS" ID="lblAIns5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblAUni5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp5" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 3 X 5 YARDAS" ID="lblAIns6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblAUni6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtADif6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp6" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 5 X 5 YARDAS" ID="lblAIns7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblAUni7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtADif7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp7" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA DE ALGODÓN 3 X 5 YARDAS" ID="lblAIns8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblAUni8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp8" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA DE ALGODÓN 3 X 5 YARDAS" ID="lblAIns9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 20 Unidades" ID="lblAUni9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp9" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="YODOPOVIDONA (JABÓN QUIRÚRGICO)" ID="lblAIns10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Frasco x 120 ml" ID="lblAUni10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp10" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="SOLUCIÓN SALINA 250 cc ó 500 cc" ID="lblAIns11"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant11"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblAUni11"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp11" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TERMÓMETRO DE MERCURIO O DIGITAL" ID="lblAIns12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblAUni12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp12" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ALCOHOL ANTISÉPTICO FRASCO POR 275 ml" ID="lblAIns13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblACant13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblAUni13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtAExi13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtADif13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAMot13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlARemp13" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row form-group">
                    <label>Observaciones</label><br />
                    <asp:TextBox class="col-md-12  " runat="server" ID="txtObsA" TextMode="Multiline" Rows="4"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-md-2 col-md-offset-5">
                        <asp:Button runat="server" ID="btnDocumento" Text="Generar Documento" 
                            CssClass="btn btn-block btn-info" OnClick="GenerarDocumento" />
                    </div>
                </div>
            </asp:PlaceHolder>

            <!-- TIPO B -->
            <asp:PlaceHolder runat="server" ID="phInformacionTipoB" Visible="False">
                <div class="row form-group text-center">
                    <h4>Hoja de Inventario - Botiquín de Primeros Auxilios(Tipo B)</h4>

                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel runat="server" ID="pnDatosB">
                            <asp:Table runat="server" ID="Table1" CssClass="table">
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell>Insumo</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Cantidad Requerida</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Unidad</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Existencia</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Diferencia</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Reemplazado</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="GASAS LIMPIAS" ID="lblBIns1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 100" ID="lblBUni1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" CssClass="form-control" ID="txtBExi1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp1" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="GASAS ESTÉRILES" ID="lblBIns2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="20" ID="lblBCant2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 3" ID="lblBUni2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp2" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="APÓSITO ó COMPRESAS NO ESTÉRILES" ID="lblBIns3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp3" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ESPARADRAPO DE TELA ROLLO 4" ID="lblBIns4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblBCant4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp4" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="BAJALENGUAS" ID="lblBIns5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblBCant5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 20" ID="lblBUni5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp5" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 2 X 5 YARDAS" ID="lblBIns6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblBCant6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp6" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 3 X 5 YARDAS" ID="lblBIns7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblBCant7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp7" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 5 X 5 YARDAS" ID="lblBIns8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblBCant8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp8" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="CLORHEXIDINA O YODOPOVIDONA (JABÓN QUIRÚRGICO)" ID="lblBIns9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Galón" ID="lblBUni9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp9" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="SOLUCIÓN SALINA 250 cc ó 500 cc" ID="lblBIns10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="5" ID="lblBCant10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp10" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="GUANTES DE LÁTEX PARA EXAMEN" ID="lblBIns11"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant11"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Caja de 100" ID="Label1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp11" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TERMÓMETRO DE MERCURIO O DIGITAL" ID="lblBIns12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp12" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ALCOHOL ANTISÉPTICO FRASCO POR 275 ml" ID="lblBIns13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp13" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TIJERAS" ID="lblBIns14"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant14"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni14"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi14"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif14"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot14"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp14" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="LINTERNA" ID="lblBIns15"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant15"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni15"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi15"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif15"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot15"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp15" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="PILAS DE REPUESTO" ID="lblBIns16"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblBCant16"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Par" ID="lblBUni16"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi16"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif16"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot16"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp16" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TABLA ESPINAL LARGA" ID="lblBIns17"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant17"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni17"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi17"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif17"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot17"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp17" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="COLLAR CERVICAL" ID="lblBIns18"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblBCant18"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni18"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi18"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif18"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot18"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp18" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="INMOVILIZADORES ó FÉRULA MIEMBROS SUPERIORES" ID="lblBIns19"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant19"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni19"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi19"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif19"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot19"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp19" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VASOS DESECHABLES" ID="lblBIns20"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant20"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 25" ID="lblBUni20"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi20"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif20"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot20"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp20" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TENSIÓMETRO" ID="lblBIns21"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant21"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni21"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi21"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif21"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot21"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp21" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="FONENDOSCOPIO" ID="lblBIns22"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant22"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni22"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi22"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif22"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot22"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp22" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ACETAMINOFÉN TABLETAS POR 500 mg" ID="lblBIns23"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblBCant23"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Sobre de 100" ID="lblBUni23"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi23"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif23"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot23"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp23" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="HIDRÓXIDO DE ALUMINIO TABLETAS" ID="lblBIns24"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant24"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Sobre de 10" ID="lblBUni24"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi24"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif24"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot24"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp24" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ASA TABLETAS POR 100 mg" ID="lblBIns25"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant25"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Sobre de 10" ID="lblBUni25"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi25"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif25"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot25"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp25" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ELEMENTO DE BARRERA ó MÁSCARA PARA RCP" ID="lblBIns26"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblBCant26"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblBUni26"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtBExi26"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtBDif26"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtBMot26"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlBRemp26" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row form-group">
                    <label>Observaciones</label><br />
                    <asp:TextBox class="col-md-12  " runat="server" ID="txtBObse" TextMode="Multiline" Rows="4"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-md-2 col-md-offset-5">
                        <asp:Button runat="server" ID="btnDocumen" Text="Generar Documento"
                            CssClass="btn btn-block btn-info" OnClick="GenerarDocumento" />
                    </div>
                </div>
            </asp:PlaceHolder>

            <!-- TIPO C -->
            <asp:PlaceHolder runat="server" ID="phInformacionTipoC" Visible="False">
                <div class="row form-group text-center">
                    <h4>Hoja de Inventario - Botiquín de Primeros Auxilios(Tipo C)</h4>

                </div>

                <div class="row">
                    <div class="col-md-12  ">
                        <asp:Panel runat="server" ID="pnDatosC">
                            <asp:Table runat="server" ID="Table2" CssClass="table">
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell>Insumo</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Cantidad Requerida</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Unidad</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Existencia</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Diferencia</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Reemplazado</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="GASAS LIMPIAS" ID="lblCIns1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 100" ID="lblCUni1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot1"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp1" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="GASAS ESTÉRILES" ID="lblCIns2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="20" ID="lblCCant2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 3" ID="lblCUni2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot2"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp2" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="APÓSITO ó COMPRESAS NO ESTÉRILES" ID="lblCIns3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="8" ID="lblCCant3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni3"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot3"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp3" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ESPARADRAPO DE TELA ROLLO 4" ID="lblCIns4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni4"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot4"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp4" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="BAJALENGUAS" ID="lblCIns5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 20" ID="lblCUni5"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot5"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp5" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 2 X 5 YARDAS" ID="lblCIns6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni6"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot6"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp6" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 3 X 5 YARDAS" ID="lblCIns7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni7"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot7"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp7" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA ELÁSTICA 5 X 5 YARDAS" ID="lblCIns8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni8"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot8"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp8" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA DE ALGODÓN 3 X 5 YARDAS" ID="lblCIns9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni9"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot9"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp9" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VENDA DE ALGODÓN 5 X 5 YARDAS" ID="lblCIns10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni10"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot10"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp10" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="CLORHEXIDINA O YODOPOVIDONA (JABÓN QUIRÚRGICO)" ID="lblCIns11"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant11"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Galón" ID="Label2"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot11"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp11" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="SOLUCIÓN SALINA 250 cc ó 500 cc" ID="lblCIns12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="10" ID="lblCCant12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni12"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot12"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp12" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="GUANTES DE LÁTEX PARA EXAMEN" ID="lblCIns13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Caja de 100" ID="lblCUni13"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot13"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp13" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TERMÓMETRO DE MERCURIO ó DIGITAL" ID="lblCIns14"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant14"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni14"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi14"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif14"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot14"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp14" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ALCOHOL ANTISÉPTICO FRASCO POR 275 ml" ID="lblCIns15"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant15"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni15"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi15"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif15"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot15"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp15" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TIJERAS" ID="lblCIns16"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant16"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni16"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi16"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif16"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot16"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp16" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="LINTERNA" ID="lblCIns17"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant17"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni17"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi17"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif17"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot17"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp17" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="PILAS DE REPUESTO" ID="lblCIns18"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant18"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Par" ID="lblCUni18"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi18"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif18"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot18"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp18" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TABLA ESPINAL LARGA" ID="lblCIns19"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="1" ID="lblCCant19"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni19"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi19"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif19"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot19"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp19" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="COLLAR CERVICAL" ID="lblCIns20"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant20"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni20"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi20"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif20"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot20"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp20" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="INMOVILIZADORES ó FÉRULA MIEMBROS SUPERIORES" ID="lblCIns21"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant21"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni21"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi21"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif21"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot21"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp21" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="VASOS DESECHABLES" ID="lblCIns22"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant22"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Paquete de 25" ID="lblCUni22"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi22"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif22"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot22"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp22" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="TENSIÓMETRO" ID="lblCIns23"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant23"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni23"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi23"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif23"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot23"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp23" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="FONENDOSCOPIO" ID="lblCIns24"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant24"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni24"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi24"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif24"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot24"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp24" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ACETAMINOFÉN TABLETAS POR 500 mg" ID="lblCIns25"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant25"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Sobre de 10" ID="lblCUni25"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi25"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif25"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot25"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp25" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="HIDRÓXIDO DE ALUMINIO TABLETAS" ID="lblCIns26"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="4" ID="lblCCant26"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Sobre de 10" ID="lblCUni26"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi26"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif26"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot26"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp26" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ASA TABLETAS POR 100 mg" ID="lblCIns27"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant27"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Sobre de 10" ID="lblCUni27"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi27"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif27"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot27"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp27" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="ELEMENTO DE BARRERA ó MÁSCARA PARA RCP" ID="lblCIns28"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="2" ID="lblCCant28"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" Text="Unidad" ID="lblCUni28"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" ID="txtCExi28"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" Enabled="False" CssClass="form-control" ID="txtCDif28"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCMot28"></asp:TextBox>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList runat="server" ID="ddlCRemp28" CssClass="form-control">
                                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row form-group">
                    <label>Observaciones</label><br />
                    <asp:TextBox class="col-md-12  " runat="server" ID="txtObsC" TextMode="Multiline" Rows="4"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-md-2 col-md-offset-5">
                        <asp:Button runat="server" ID="Button1" Text="Generar Documento"
                            CssClass="btn btn-block btn-info" OnClick="GenerarDocumento" />
                    </div>
                </div>
            </asp:PlaceHolder>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDocumento" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>