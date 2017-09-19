<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_ReporteTrabajadoresC.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_ReporteTrabajadoresC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral,PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../Hacer/index_ReporteTrabajadores.aspx">Reporte de Trabajadores</a></li>
        <li><a href="#">Crear Reporte de Condiciones de Trabajo</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Reporte De Condiciones De Trabajo</h1>
    </div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <div class="row form-group">

        <asp:PlaceHolder runat="server" ID="phEmpresa">
            <div class="col-md-4">
                <h4 class="text-center">Empresa</h4>
                <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="phSucursal">
            <div class="col-md-3 col-md-offset-4">
                <h4 class="text-center">Sucursal</h4>
                <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                </asp:DropDownList>

                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                    Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                    ControlToValidate="ddlSucursal" runat="server" ValidationGroup="ValidationAdd" />
            </div>
        </asp:PlaceHolder>
    </div>

    <div class="row text-center">
        <div class="box">
            <div class="box-body no-padding">
                <table class="table table-condensed">
                    <tbody>

                        <!-- fila 1 -->
                        <tr class="bg-aqua color-palette">
                            <th class="col-md-12  text-left">DATOS DEL TRABAJADOR</th>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-2 col-md-offset-3" runat="server" Text="TRABAJADOR" Font-Bold="True"></asp:Label>

                                <div class="col-md-4">
                                    <asp:TextBox ID="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:hiddenfield id="hdnValue" onvaluechanged="hdnValue_ValueChanged" runat="server"/>
                                    <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1"
                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                        TargetControlID="txtTrabajador" ID="AutoCompleteExtender1" runat="server"
                                        FirstRowSelected="false"
                                        CompletionListCssClass="completionList"
                                        OnClientItemSelected="OnContactSelected"
                                        CompletionListItemCssClass="listItem"
                                        CompletionListHighlightedItemCssClass="itemHighlighted">
                                    </cc1:AutoCompleteExtender>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-3" runat="server" Text="PRIMER APELLIDO" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-3" runat="server" Text="SEGUNDO APELLIDO" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-3" runat="server" Text="NOMBRES" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-3" runat="server" Text="N° IDENTIFICACIÓN" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbPrimerApellido" class="col-md-3" runat="server" Text="---"></asp:Label>
                                <asp:Label ID="lbSegundoApellido" class="col-md-3" runat="server" Text="---"></asp:Label>
                                <asp:Label ID="lbNombres" class="col-md-3" runat="server" Text="---"></asp:Label>
                                <asp:Label ID="lbCedula" class="col-md-3" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-2" runat="server" Text="SEXO" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-2" runat="server" Text="EDAD" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-2" runat="server" Text="EDO CIVIL" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-6" runat="server" Text="CCF" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbSexo" class="col-md-2" runat="server" Text="---"></asp:Label>
                                <asp:Label ID="lbEdad" class="col-md-2" runat="server" Text="---"></asp:Label>
                                <asp:Label ID="lbEdoCivil" class="col-md-2" runat="server" Text="---"></asp:Label>
                                <asp:Label ID="lbCCF" class="col-md-6" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <asp:Label class="col-md-6" runat="server" Text="AREA" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-6" runat="server" Text="PUESTO DE TRABAJO" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbArea" class="col-md-6" runat="server" Text="---"></asp:Label>
                                <asp:Label ID="lbPuesto" class="col-md-6" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-12  text-left" runat="server" Text="¿Qué equipos opera?" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox1" runat="server" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-12  text-left" runat="server" Text="¿Actualmente presenta alguna enfermedad o esta en tratamiento médico? Explique" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox2" runat="server" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-12  text-left" runat="server" Text="Describa que síntoma(s) físico(s) o emocional(es) percibe y el tiempo de evolución" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox3" runat="server" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-12  text-left" runat="server" Text="¿Considera que tiene alguna relación estos síntomas con su trabajo? Explique" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox4" runat="server" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-12  text-left" runat="server" Text="¿Considera que tiene alguna relación éste síntoma con sus actividades fuera del trabajo? Explique" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox5" runat="server" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-5  text-left" runat="server" Text="¿Ha consultado a su servicio de salud por estos síntomas?" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-1 text-center" runat="server" Text="Si" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-1 text-center" runat="server" Text="No" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-5  text-left" runat="server" Text="¿Porqué?" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox6" runat="server" TextMode="multiline" class="col-md-5  text-left" Rows="3"></asp:TextBox>
                                <input id="radio1" type="radio" name="rbf1" value="1" runat="server" class="col-md-1 text-center">
                                <input id="radio2" type="radio" name="rbf1" value="2" runat="server" class="col-md-1 text-center">
                                <asp:TextBox ID="Textbox9" runat="server" TextMode="multiline" class="col-md-5  text-left" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-5  text-left" runat="server" Text="¿Durante el último año ha sido incapacitado por esta causa?" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-1 text-center" runat="server" Text="Si" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-1 text-center" runat="server" Text="No" Font-Bold="True"></asp:Label>
                                <asp:Label class="col-md-5  text-left" runat="server" Text="¿Porqué?" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox7" runat="server" TextMode="multiline" class="col-md-5  text-left" Rows="3"></asp:TextBox>
                                <input id="radio3" type="radio" name="rbf2" value="1" runat="server" class="col-md-1 text-center">
                                <input id="radio4" type="radio" name="rbf2" value="2" runat="server" class="col-md-1 text-center">
                                <asp:TextBox ID="Textbox8" runat="server" TextMode="multiline" class="col-md-5  text-left" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-12  text-left" runat="server" Text="¿Cuantos días de incapacidad médica?" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox10" runat="server" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label class="col-md-12  text-left" runat="server" Text="¿Tiene Ud. algún hobbie, o practica algún deporte? ¿Cual(es)? ¿Qué tiempo le dedica a cada uno?" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox11" runat="server" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                        <!-- fila 2 -->
                        <tr class="bg-aqua color-palette">
                            <th class="col-md-12  text-left">SUGERENCIAS Y RECOMENDACIONES PARA EL MEJORAMIENTO DE LAS CONDICIONES DE SALUD</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="Textbox12" runat="server" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="row text-center">

        <div class="col-md-4">
            <asp:ImageButton alt="-" runat="server" ImageUrl="~\ico\descargar.png" OnClick="GenerarDocumentoGeneral"
                ValidationGroup="ValidationAdd" />
            <h4>Descargar Formato</h4>
        </div>

        <asp:PlaceHolder ID="phBtnPrint" runat="server">
            <div class="col-md-4">
                <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento"
                    ValidationGroup="ValidationAdd" />
                <h4>Generar Documento</h4>
            </div>
        </asp:PlaceHolder>

    </div>

    <script>
        function OnContactSelected(source, eventArgs) {
        
            var hdnValueID = "<%= hdnValue.ClientID %>";

            document.getElementById(hdnValueID).value = eventArgs.get_value();
            __doPostBack(hdnValueID, "");
        } 
    </script>

</asp:Content>
