<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_AnalisisVulnerabilidad.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.create_AnalisisVulnerabilidad" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../EvaluacionInicial/index_AnalisisVulnerabilidad.aspx">Análisis de Vulnerabilidad</a></li>
        <li><a href="#">Crear Análisis de Vulnerabilidad</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Matriz de Evaluación del Grado de Vulnerabilidad</h1>
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
            <div class="col-md-4 col-md-offset-4">
                <h4 class="text-center">Sucursal</h4>
                <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                    ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" runat="server"
                    ValidationGroup="ValidationAdd" />
            </div>
        </asp:PlaceHolder>
    </div>

    <div class="row text-center">
        <div class="box">
            <div class="panel-group" id="accordion">

                <!-- Primer Panel -->
                <div class="panel panel-default">
                    <div class="panel-heading bg-aqua color-palette">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">ÁREA DE EVALUACIÓN</a></h4>
                    </div>

                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="txtArea" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </div>

                <!-- Segundo Panel -->
                <div class="panel panel-default">
                    <div class="panel-heading bg-aqua color-palette">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">OBJETIVO DE LA EVALUACIÓN</a></h4>
                    </div>

                    <div id="collapse2" class="panel-collapse collapse">
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="txtObjetivo" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </div>

                <!-- Tercer Panel -->
                <div class="panel panel-default">
                    <div class="panel-heading bg-aqua color-palette">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">ALCANCE DE LA EVALUACIÓN</a></h4>
                    </div>

                    <div id="collapse3" class="panel-collapse collapse">
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="txtAlcance" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </div>

                <!-- Cuarto Panel -->
                <div class="panel panel-default">
                    <div class="panel-heading bg-aqua color-palette">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">RESULTADOS DE LA EVALUACIÓN INTERNA</a></h4>
                    </div>

                    <div id="collapse4" class="panel-collapse collapse">
                        <div class="panel-body">


                            <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">
                                <ContentTemplate>

                                    <div class="box-body no-padding">
                                        <table class="table table-condensed">
                                            <tbody>

                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">Nº</td>
                                                    <td class="col-md-11 text-center">ASPECTO A EVALUAR</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>

                                                <!-- 1 Ruta de evacuacion-->
                                                <tr class="bg-aqua color-palette text-center">
                                                    <td class="col-md-1 text-center">1</td>
                                                    <td class="col-md-7 text-left" colspan="3">RUTA DE EVACUACIÒN</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Existe una ruta exclusiva de evacuación, iluminada, señalizada con pasa manos</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList1" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF1" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Presenta deficiencia en alguno de los aspectos anteriores.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList2" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF2" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No hay ruta exclusiva de evacuación</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList3" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF3" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 2 LOS VISITANTES DEL EDIFICIO CONOCEN LAS RUTAS DE EVACUACIÓN-->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">2</td>
                                                    <td class="col-md-7 text-left" colspan="3">LOS VISITANTES DEL EDIFICIO CONOCEN LAS RUTAS DE EVACUACIÓN</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Fácil y rápidamente gracias a la señalización visible desde todos los ángulos</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList4" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF4" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Difícilmente por la poca señalización u orientación al respecto.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList5" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF5" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No las reconocerían fácilmente.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList6" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF6" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 3 LOS PUNTOS DE REUNION EN UNA EVACUACIÓN -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">3</td>
                                                    <td class="col-md-7  text-left" colspan="3">LOS PUNTOS DE REUNION EN UNA EVACUACIÓN</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Se han establecido claramente y los conocen todos los ocupantes del edificio.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList7" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF7" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Existen varios sitios posibles, pero ninguno se ha delimitado con claridad y nadie sabría hacia donde evacuar exactamente.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList8" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF8" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existen puntos óptimos donde evacuar.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList9" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF9" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 4 LOS PUNTOS DE REUNION EN UNA EVACUACIÓN -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">4</td>
                                                    <td class="col-md-7  text-left" colspan="3">LOS PUNTOS DE REUNION EN UNA EVACUACIÓN</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Son amplios y seguros</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList10" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF10" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Son amplios pero con algunos riesgos.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList11" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF11" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">Son realmente pequeños para el número de personas a evacuar y realmente peligrosos.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList12" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF12" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 5 LA SEÑALIZACIÓN PARA EVACUACIÓN -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">5</td>
                                                    <td class="col-md-7  text-left" colspan="3">LA SEÑALIZACIÓN PARA EVACUACIÓN</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Se visualiza e identifica plenamente en todas las áreas del edificio</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList13" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF13" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Esta muy oculta y apenas se observa en algunos sitios. </td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList14" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF14" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existen flechas o croquis de evacuación en ninguna parte visible.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList15" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF15" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 6 LAS RUTAS DE EVACUACIÓN SON -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">6</td>
                                                    <td class="col-md-7  text-left" colspan="3">LAS RUTAS DE EVACUACIÓN SON</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Antideslizantes y seguras en todo recorrido</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList16" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF16" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Con obstáculos y tramos resbalosos.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList17" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF17" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">Altamente resbalosos, utilizados como bodegas o intransitables en algunos tramos.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList18" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF18" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 7 LA RUTA PRINCIPAL DE EVACUACIÓN -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">7</td>
                                                    <td class="col-md-7  text-left" colspan="3">LA RUTA PRINCIPAL DE EVACUACIÓN</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Tiene ruta alterna optima y conocida</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList19" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF19" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Tiene una ruta alterna pero deficiente.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList20" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF20" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No posee ninguna ruta alterna o no se conoce </td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList21" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF21" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 8 LA SEÑAL DE ALARMA -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">8</td>
                                                    <td class="col-md-7  text-left" colspan="3">LA SEÑAL DE ALARMA</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Se encuentra o se ve claramente en todos los sitios</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList22" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF22" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Algunas veces no se escuchan ni se ven claramente. Los ocupante no la conocen</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList23" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF23" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">Usualmente no se escucha ni se ve.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList24" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF24" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 9 SISTEMA DE DETECCIÓN -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">9</td>
                                                    <td class="col-md-7  text-left" colspan="3">SISTEMA DE DETECCIÓN</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">El edificio posee sistemas de detección de incendio, revisado el último trimestre en todas las áreas.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList25" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF25" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Solo existen algunos detectores sin revisión y no en todas las áreas.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList26" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF26" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existe ningún tipo de detector.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList27" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF27" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 10 EL SISTEMA DE ILUMINACIÓN DE EMERGENCIA. -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">10</td>
                                                    <td class="col-md-7  text-left" colspan="3">EL SISTEMA DE ILUMINACIÓN DE EMERGENCIA.</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Es óptimo de día y noche (siempre se ve claramente, aun de noche)</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList28" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF28" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Es optimo solo en el día (En la noche no se ve con claridad )</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList29" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF29" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">Deficiente día y noche</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList30" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF30" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 11 EL SISTEMA DE ILUMINACION DE EMERGENCIA. -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">11</td>
                                                    <td class="col-md-7  text-left" colspan="3">EL SISTEMA DE ILUMINACION DE EMERGENCIA.</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Es de encendido automático en caso de corte de energía.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList31" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF31" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Es de encendido manual en caso de corte de energía.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList32" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF32" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existe.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList33" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF33" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 12 EL SISTEMA CONTRA INCENDIO. -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">12</td>
                                                    <td class="col-md-7  text-left" colspan="3">EL SISTEMA CONTRA INCENDIO.</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Es funcional.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList34" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF34" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Funciona parcialmente.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList35" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF35" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existe o no funciona.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList36" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF36" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 13 LOS EXTINTORES PARA INCENDIO. -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">13</td>
                                                    <td class="col-md-7  text-left" colspan="3">LOS EXTINTORES PARA INCENDIO</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Están ubicados en las áreas críticas y son funcionales</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList37" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF37" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Existen pero no en número suficiente</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList38" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF38" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existen o no funcionan.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList39" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF39" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 14 DIVULGACIÓN DEL PLAN DE EMERGENCIA A LOS EMPLEADOS. -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">14</td>
                                                    <td class="col-md-7  text-left" colspan="3">DIVULGACIÓN DEL PLAN DE EMERGENCIA A LOS EMPLEADOS</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Se ha desarrollado mínimo una por semestre</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList40" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF40" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Esporádicamente se ha divulgado para algunas áreas.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList41" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF41" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No se ha divulgado.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList42" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF42" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 15 COORDINADOR DEL PLAN DE EMERGENCIA. -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">15</td>
                                                    <td class="col-md-7  text-left" colspan="3">COORDINADOR DEL PLAN DE EMERGENCIA</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Existe y está capacitado</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList43" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF43" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Existe pero no está capacitado.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList44" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF44" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existe.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList45" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF45" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 16 LA BRIGADA DE EMERGENCIA -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">16</td>
                                                    <td class="col-md-7  text-left" colspan="3">LA BRIGADA DE EMERGENCIA</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Existe y está capacitada.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList46" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF46" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Existe pero no está capacitada.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList47" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF47" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existe.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList48" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF48" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 17 SE HAN REALIZADO SIMULACROS -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">17</td>
                                                    <td class="col-md-7  text-left" colspan="3">SE HAN REALIZADO SIMULACROS</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Un simulacro en el último año</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList49" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF49" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Un simulacro en los dos últimos años</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList50" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF50" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">Ningún simulacro</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList51" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF51" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 18 ENTIDADES DE SOCORRO EXTERNAS -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">18</td>
                                                    <td class="col-md-7  text-left" colspan="3">ENTIDADES DE SOCORRO EXTERNAS</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Conocen y participan activamente en el plan de emergencia de la empresa.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList52" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF52" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Están identificadas las entidades de socorro pero no conocen el plan de emergencia de la empresa</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList53" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF53" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No se tienen en cuenta.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList54" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF54" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 19 LOS OCUPANTES DEL EDIFICIO SON -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">19</td>
                                                    <td class="col-md-7  text-left" colspan="3">LOS OCUPANTES DEL EDIFICIO SON</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Siempre los mismos con muy poco s visitantes</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList55" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF55" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Con un 10 a 20% de visitantes nuevos cada día</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList56" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF56" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">El 90% de los ocupantes son visitantes </td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList57" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF57" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 20 EN LA ENTRADA DEL EDIFICIO O EN CADA PISO -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">20</td>
                                                    <td class="col-md-7  text-left" colspan="3">EN LA ENTRADA DEL EDIFICIO O EN CADA PISO</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Existe y es visible un plano de evacuación en cada piso.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList58" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF58" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existe un plano de evacuación en cada piso, pero alguien daría información.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList59" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF59" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">No existe un plano de evacuación y nadie esta responsabilizado de dar información al respecto.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList60" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF60" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 21 LAS RUTAS DE CIRCULACION. -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">21</td>
                                                    <td class="col-md-7  text-left" colspan="3">LAS RUTAS DE CIRCULACIÓN.</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">En general las rutas de acceso y circulación de los trabajadores y visitantes son amplias y seguras</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList61" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF61" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">En algún punto de las rutas no se circula con facilidad por falta de espacio u obstáculos al paso.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList62" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF62" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">En general las rutas y áreas de circulación son congestionadas y de difícil uso.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList63" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF63" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 22 LAS PUERTAS DE SALIDA DEL EDIFICO. -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">22</td>
                                                    <td class="col-md-7  text-left" colspan="3">LAS PUERTAS DE SALIDA DEL EDIFICIO.</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">Las puertas cumplen con las medidas mínimas reglamentarias y de uso de cerraduras de seguridad</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList64" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF64" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Solo algunas puertas permiten una salida rápida y poseen cerraduras de seguridad</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList65" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF65" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">Ninguna puerta es lo suficientemente amplia o brinda garantías para salida segura</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList66" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF66" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <!-- 23 ESTRUCTURA Y TIPO DE CONSTRUCCIÓN -->
                                                <tr class="bg-aqua color-palette">
                                                    <td class="col-md-1 text-center">23</td>
                                                    <td class="col-md-7  text-left" colspan="3">ESTRUCTURA Y TIPO DE CONSTRUCCIÓN</td>
                                                    <td class="col-md-3">OPCIONES</td>
                                                    <td class="col-md-1 text-center">PUNTAJE</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">A</td>
                                                    <td class="col-md-7  text-left" colspan="3">La estructura del edificio se soporta por estructuras de concreto y no presenta deterioro en paredes, columnas, techos o aditamentos internos.</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList67" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF67" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">B</td>
                                                    <td class="col-md-7  text-left" colspan="3">Presenta deterioro observables en paredes y techos que hagan pensar en daños estructurales</td>
                                                    <td class="col-md-3 text-center">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList68" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF68" runat="server" Text="---"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-1 text-center">C</td>
                                                    <td class="col-md-7  text-left" colspan="3">La estructura no posee cimentación ni soportes de concreto y presenta deterioros estructurales observables en progreso durante los últimos seis meses.</td>
                                                    <td class="col-md-3">
                                                        <asp:RadioButtonList class="col-md-12" runat="server" ID="RadioButtonList69" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                            <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="col-md-1 text-center">
                                                        <asp:Label ID="PuntajeF69" runat="server" Text="---"></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td class="bg-aqua color-palette col-md-12 text-center" colspan="6">PUNTAJE TOTAL</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-12  text-left" colspan="6">Total ítems con respuesta según la valoración A= 
                                                            <asp:Label ID="puntajeA1" class="bg-red color-palette" runat="server" Text="___"></asp:Label>
                                                        x  4.0 =                                                  
                                                            <asp:Label ID="puntajeA2" class="bg-red color-palette" runat="server" Text="___"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-12  text-left" colspan="6">Total ítems con respuesta según la valoración B= 
                                                            <asp:Label ID="puntajeB1" class="bg-yellow color-palette" runat="server" Text="___"></asp:Label>
                                                        x  2.0 =                                                  
                                                            <asp:Label ID="puntajeB2" class="bg-yellow color-palette" runat="server" Text="___"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-12  text-left" colspan="6">Total ítems con respuesta según la valoración C= 
                                                            <asp:Label ID="puntajeC1" class="bg-green color-palette" runat="server" Text="___"></asp:Label>
                                                        x  0.4 =                                                  
                                                            <asp:Label ID="puntajeC2" class="bg-green color-palette" runat="server" Text="___"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-12  text-left" colspan="6">PUNTAJE TOTAL =                                               
                                                            <asp:Label ID="puntajeABC" runat="server" Text="___" class="bg-aqua color-palette"></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="bg-aqua color-palette col-md-12 text-center" colspan="6">ACCIONES A SEGUIR</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-12  text-left" colspan="6">
                                                        <asp:Label ID="txtAcciones" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="bg-aqua color-palette col-md-12  text-left" colspan="6">CONCLUSIONES</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-12" colspan="6">
                                                        <textarea rows="4" id="txtConclusiones" maxlength="1000" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td class="bg-aqua color-palette col-md-12  text-left" colspan="6">FORTALEZAS</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-12" colspan="6">
                                                        <textarea rows="4" id="txtFortalezas" maxlength="1000" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="bg-aqua color-palette col-md-12  text-left" colspan="6">DEBILIDADES</td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-12" colspan="6">
                                                        <textarea rows="4" id="txtDebilidades" maxlength="1000" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnGuardar" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="col-md-4 col-md-offset-4">
            <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
            <h4>Generar Documento</h4>
        </div>
    </div>




</asp:Content>
