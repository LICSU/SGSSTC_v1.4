<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_ReporteTrabajadoresA.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_ReporteTrabajadoresA" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral,  PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel runat="server" ID="panel1">

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
                    <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlSucursal" runat="server" ValidationGroup="ValidationAdd" />
                </div>
            </asp:PlaceHolder>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel-group" id="accordion">

                    <!-- Panel JORNADA LABORAL -->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">JORNADA LABORAL</a></h4>
                        </div>

                        <div id="collapse1" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody  class="text-center">
                                        <!-- fila 1 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">JORNADA LABORAL</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">
                                                Consideras adecuada la distribución de:
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿El Horario de trabajo?</td>

                                            <td>
                                                <input id="radio3" type="radio" name="rbf2" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio4" type="radio" name="rbf2" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf2" class="col-md-12"></asp:TextBox>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="text-left">¿De los turnos?
                                            </td>

                                            <td>
                                                <input id="radio5" type="radio" name="rbf3" value="1" runat="server">
                                            </td>
                                            <td>
                                                <input id="radio6" type="radio" name="rbf3" value="2" runat="server">
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtf3" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿De las horas de descanso?
                                            </td>

                                            <td>
                                                <input id="radio7" type="radio" name="rbf4" value="1" runat="server">
                                            </td>
                                            <td>
                                                <input id="radio8" type="radio" name="rbf4" value="2" runat="server">
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtf4" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿De las horas extra?
                                            </td>

                                            <td>
                                                <input id="radio9" type="radio" name="rbf5" value="1" runat="server">
                                            </td>
                                            <td>
                                                <input id="radio10" type="radio" name="rbf5" value="2" runat="server">
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtf5" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿El número y la duración total de las pausas dentro de la jornada laboral son suficientes?
                                            </td>

                                            <td>
                                                <input id="radio11" type="radio" name="rbf6" value="1" runat="server">
                                            </td>
                                            <td>
                                                <input id="radio12" type="radio" name="rbf6" value="2" runat="server">
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtf6" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel INFORMACIÓN GENERAL -->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">INFORMACIÓN GENERAL</a>
                            </h4>
                        </div>

                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="panel-body">
                                    <table class="table table-condensed">
                                        <tbody class="text-center">

                                            <tr class="bg-aqua color-palette">
                                                <th class="col-md-5 text-center">INFORMACIÓN GENERAL</th>
                                                <th class="col-md-1 text-center">SI</th>
                                                <th class="col-md-1 text-center">NO</th>
                                                <th class="col-md-5 text-center">OBSERVACIONES</th>

                                            </tr>
                                            <tr>
                                                <td class="text-left">¿Esta constituido el COPASST en la empresa?
                                                </td>

                                                <td>
                                                    <input id="radio13" type="radio" name="rbf7" value="1" runat="server">
                                                </td>

                                                <td>
                                                    <input id="radio14" type="radio" name="rbf7" value="2" runat="server">
                                                </td>

                                                <td>
                                                    <asp:TextBox runat="server" ID="txtf7" class="col-md-12"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-left">¿El COPASST conoce las estadísticas de ausentismo, accidente de trabajo y enfermedades profesionales?
                                                </td>

                                                <td>
                                                    <input id="radio15" type="radio" name="rbf8" value="1" runat="server">
                                                </td>

                                                <td>
                                                    <input id="radio16" type="radio" name="rbf8" value="2" runat="server">
                                                </td>

                                                <td>
                                                    <asp:TextBox runat="server" ID="txtf8" class="col-md-12"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-left">¿Se reúnen de acuerdo a lo establecido en las normas?
                                                </td>

                                                <td>
                                                    <input id="radio17" type="radio" name="rbf9" value="1" runat="server">
                                                </td>

                                                <td>
                                                    <input id="radio18" type="radio" name="rbf9" value="2" runat="server">
                                                </td>

                                                <td>
                                                    <asp:TextBox runat="server" ID="txtf9" class="col-md-12"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-left">¿Se realizan exámenes médicos pre empleo, periódicos y post empleo?
                                                </td>

                                                <td>
                                                    <input id="radio19" type="radio" name="rbf10" value="1" runat="server">
                                                </td>

                                                <td>
                                                    <input id="radio20" type="radio" name="rbf10" value="2" runat="server">
                                                </td>

                                                <td>
                                                    <asp:TextBox runat="server" ID="txtf10" class="col-md-12"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-left">¿Se informa al trabajador de los resultados de los exámenes médicos?
                                                </td>

                                                <td>
                                                    <input id="radio21" type="radio" name="rbf11" value="1" runat="server">
                                                </td>

                                                <td>
                                                    <input id="radio22" type="radio" name="rbf11" value="2" runat="server">
                                                </td>

                                                <td>
                                                    <asp:TextBox runat="server" ID="txtf11" class="col-md-12"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-left">
                                                    <asp:TextBox class="col-md-12" runat="server" ID="txtInfGral" placeholder="Otra condición por reportar;"></asp:TextBox>
                                                </td>

                                                <td>
                                                    <input id="radio23" type="radio" name="rbf12" value="1" runat="server">
                                                </td>

                                                <td>
                                                    <input id="radio24" type="radio" name="rbf12" value="2" runat="server">
                                                </td>

                                                <td>
                                                    <asp:TextBox runat="server" ID="txtf12" class="col-md-12"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Panel SUPERFICIE DE TRABAJO / ESPACIO-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">SUPERFICIE DE TRABAJO / ESPACIO</a></h4>
                        </div>

                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">

                                        <!-- fila 3 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">SUPERFICIE DE TRABAJO / ESPACIO</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿La disposición del puesto de trabajo le permite trabajar sentado y alternar posturas?
                                            </td>

                                            <td>
                                                <input id="radio25" type="radio" name="rbf13" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio26" type="radio" name="rbf13" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf13" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Es el ancho de la superficie de trabajo apropiada, de manera que los accesorios o herramientas puedan ser ubicados a un fácil alcance y visualización?
                                            </td>

                                            <td>
                                                <input id="radio27" type="radio" name="rbf14" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio28" type="radio" name="rbf14" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf14" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ La profundidad de la Superficie de Trabajo es la apropiada, de forma tal que el monitor y el teclado se ubican frente a usted? 
                                            </td>

                                            <td>
                                                <input id="radio29" type="radio" name="rbf15" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio30" type="radio" name="rbf15" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf15" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ La superficie de trabajo es confortable con respecto a sus dimensiones? 
                                            </td>

                                            <td>
                                                <input id="radio31" type="radio" name="rbf16" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio32" type="radio" name="rbf16" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf16" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ debajo de su escritorio el área es suficientemente amplia para acomodar sus piernas? 
                                            </td>

                                            <td>
                                                <input id="radio33" type="radio" name="rbf17" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio34" type="radio" name="rbf17" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf17" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿El puesto de trabajo cuenta con suficiente espacio para realizar movimientos libremente?
                                            </td>

                                            <td>
                                                <input id="radio35" type="radio" name="rbf18" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio36" type="radio" name="rbf18" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf18" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Existen corredores libres entre los puestos de trabajo?
                                            </td>

                                            <td>
                                                <input id="radio37" type="radio" name="rbf19" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio38" type="radio" name="rbf19" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf19" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Hay objetos, muebles, equipos que dificulten la utilización del espacio libre del puesto de trabajo?
                                            </td>

                                            <td>
                                                <input id="radio39" type="radio" name="rbf20" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio40" type="radio" name="rbf20" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf20" class="col-md-12"></asp:TextBox>

                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Las piezas, documentos, objetos, herramientas, equipos u otros están dispuestos en forma organizada que facilita su utilización?
                                            </td>

                                            <td>
                                                <input id="radio41" type="radio" name="rbf21" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio42" type="radio" name="rbf21" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf21" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ La Superficie de Trabajo es de material mate, para prevenir reflejos?
                                            </td>

                                            <td>
                                                <input id="radio43" type="radio" name="rbf22" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio44" type="radio" name="rbf22" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf22" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtSupTrab" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio45" type="radio" name="rbf23" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio46" type="radio" name="rbf23" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf23" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel SUPERFICIE DEL ASIENTO-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">SUPERFICIE DEL ASIENTO</a></h4>
                        </div>

                        <div id="collapse4" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">

                                        <!-- fila 4 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">SUPERFICIE DEL ASIENTO</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ la altura del asiento es ajustable, de tal manera que permite graduar una altura confortable de trabajo?
                                            </td>

                                            <td>
                                                <input id="radio47" type="radio" name="rbf24" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio48" type="radio" name="rbf24" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf24" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ la altura superficie del asiento es apropiada, de tal manera que el ancho y la profundidad le permiten alojarse confortablemente?
                                            </td>

                                            <td>
                                                <input id="radio49" type="radio" name="rbf25" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio50" type="radio" name="rbf25" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf25" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ la inclinación del asiento es ajustable? ¿ le permite inclinarse hacia adelante o hacia atrás según su conveniencia?
                                            </td>

                                            <td>
                                                <input id="radio51" type="radio" name="rbf26" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio52" type="radio" name="rbf26" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf26" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ El borde frontal del asiento es redondeado? De manera que evite la presión sobre la parte posterior de la rodilla?
                                            </td>

                                            <td>
                                                <input id="radio53" type="radio" name="rbf27" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio54" type="radio" name="rbf27" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf27" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Es el asiento confortable en su totalidad?
                                            </td>
                                            <td>
                                                <input id="radio55" type="radio" name="rbf28" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio56" type="radio" name="rbf28" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf28" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtSupAsi" placeholder="Otra condición por reportar;"></asp:TextBox>

                                            </td>

                                            <td>
                                                <input id="radio57" type="radio" name="rbf29" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio58" type="radio" name="rbf29" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf29" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel MONITOR-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">MONITOR</a></h4>
                        </div>

                        <div id="collapse5" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">

                                        <!-- fila 5 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">MONITOR</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Puede ajustar fácilmente la altura del monitor? 
                                            </td>

                                            <td>
                                                <input id="radio59" type="radio" name="rbf30" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio60" type="radio" name="rbf30" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf30" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Puede ajustar fácilmente la distancia horizontal de ubicación del monitor?
                                            </td>

                                            <td>
                                                <input id="radio61" type="radio" name="rbf31" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio62" type="radio" name="rbf31" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf31" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Puede ajustar fácilmente la inclinación de la pantalla del Monitor?
                                            </td>

                                            <td>
                                                <input id="radio63" type="radio" name="rbf32" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio64" type="radio" name="rbf32" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf32" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Puede ajustar fácilmente la rotación a izquierda o derecha del monitor?
                                            </td>

                                            <td>
                                                <input id="radio65" type="radio" name="rbf33" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio66" type="radio" name="rbf33" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf33" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtMonitor" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio67" type="radio" name="rbf34" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio68" type="radio" name="rbf34" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf34" class="col-md-12"></asp:TextBox>
                                            </td>

                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel ESPALDAR DE LA SILLA-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">ESPALDAR DE LA SILLA</a></h4>
                        </div>

                        <div id="collapse6" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 6 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">ESPALDAR DE LA SILLA</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Puede ajustar fácilmente el espaldar para obtener un apoyo lumbar apropiado?
                                            </td>

                                            <td>
                                                <input id="radio69" type="radio" name="rbf35" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio70" type="radio" name="rbf35" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf35" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Puede ajustar la profundidad del asiento?
                                            </td>

                                            <td>
                                                <input id="radio71" type="radio" name="rbf36" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio72" type="radio" name="rbf36" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf36" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Es el espaldar de la silla confortable en su totalidad?
                                            </td>

                                            <td>
                                                <input id="radio73" type="radio" name="rbf37" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio74" type="radio" name="rbf37" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf37" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtEspSilla" placeholder="Otra condición por reportar;"></asp:TextBox>

                                            </td>

                                            <td>
                                                <input id="radio75" type="radio" name="rbf38" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio76" type="radio" name="rbf38" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf38" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel CONDICIONES ERGONÓMICAS PARA LOS BRAZOS-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">CONDICIONES ERGONÓMICAS PARA LOS BRAZOS</a></h4>
                        </div>

                        <div id="collapse7" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 7 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">CONDICIONES ERGONÓMICAS PARA LOS BRAZOS</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Puede trabajar con una postura adecuada de la cabeza, de tal manera que no produzca estrés en el cuello o en los hombros?
                                            </td>

                                            <td>
                                                <input id="radio77" type="radio" name="rbf39" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio78" type="radio" name="rbf39" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf39" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Usted puede trabajar con la cabeza orientada hacia el frente del plano del pecho, de tal manera que la rotación del cuello sea mínima? 
                                            </td>

                                            <td>
                                                <input id="radio79" type="radio" name="rbf40" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio80" type="radio" name="rbf40" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf40" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Puede trabajar con una posición confortable de sus brazos?
                                            </td>

                                            <td>
                                                <input id="radio81" type="radio" name="rbf41" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio82" type="radio" name="rbf41" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf41" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Puede trabajar con una posición cómoda de los codos?
                                            </td>

                                            <td>
                                                <input id="radio83" type="radio" name="rbf42" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio84" type="radio" name="rbf42" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf42" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Puede trabajar con una postura neutral de los hombros?
                                            </td>

                                            <td>
                                                <input id="radio85" type="radio" name="rbf43" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio86" type="radio" name="rbf43" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf43" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Puede trabajar con una postura neutral de las muñecas?
                                            </td>

                                            <td>
                                                <input id="radio87" type="radio" name="rbf44" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio88" type="radio" name="rbf44" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf44" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Son mínimas las actividades que requieren extensión del tronco y brazos?
                                            </td>

                                            <td>
                                                <input id="radio89" type="radio" name="rbf45" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio90" type="radio" name="rbf45" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf45" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtCondErgBrazos" placeholder="Otra condición por reportar;"></asp:TextBox>

                                            </td>

                                            <td>
                                                <input id="radio91" type="radio" name="rbf46" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio92" type="radio" name="rbf46" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf46" class="col-md-12"></asp:TextBox>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel CONDICIONES ERGONÓMICAS PARA PIERNAS Y PIES-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">CONDICIONES ERGONÓMICAS PARA PIERNAS Y PIES</a></h4>
                        </div>

                        <div id="collapse8" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 8 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">CONDICIONES ERGONÓMICAS PARA PIERNAS Y PIES</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Puede apoyar los pies de manera confortable?
                                            </td>

                                            <td>
                                                <input id="radio93" type="radio" name="rbf47" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio94" type="radio" name="rbf47" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf47" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Al estar en posición sedente siente las rodillas en una posición confortable?
                                            </td>

                                            <td>
                                                <input id="radio95" type="radio" name="rbf48" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio96" type="radio" name="rbf48" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf48" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Esta libre de obstrucciones o puntos de presión molestos en sus piernas?
                                            </td>

                                            <td>
                                                <input id="radio97" type="radio" name="rbf49" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio98" type="radio" name="rbf49" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf49" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Usted tiene un apoya pies disponible?
                                            </td>

                                            <td>
                                                <input id="radio99" type="radio" name="rbf50" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio100" type="radio" name="rbf50" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf50" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Puede ajustar fácilmente la altura del apoya pies? 
                                            </td>

                                            <td>
                                                <input id="radio101" type="radio" name="rbf51" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio102" type="radio" name="rbf51" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf51" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Puede ajustar la inclinación del apoya pies?
                                            </td>

                                            <td>
                                                <input id="radio103" type="radio" name="rbf52" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio104" type="radio" name="rbf52" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf52" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtcondErgPiernas" placeholder="Otra condición por reportar;"></asp:TextBox>

                                            </td>

                                            <td>
                                                <input id="radio105" type="radio" name="rbf53" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio106" type="radio" name="rbf53" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf53" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel SOPORTE PARA LOS BRAZOS Y MANOS-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse9">SOPORTE PARA LOS BRAZOS Y MANOS</a></h4>
                        </div>

                        <div id="collapse9" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">

                                        <!-- fila 9 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">SOPORTE PARA LOS BRAZOS Y MANOS</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Usted dispone de algún tipo de apoyabrazos en la silla ?
                                            </td>

                                            <td>
                                                <input id="radio107" type="radio" name="rbf54" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio108" type="radio" name="rbf54" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf54" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Usted dispone de algún tipo de apoyabrazos en la silla ?
                                            </td>

                                            <td>
                                                <input id="radio109" type="radio" name="rbf55" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio110" type="radio" name="rbf55" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf55" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ La persona tiene disponible algún tipo de soporte para sus manos al momento de hacer uso del teclado? ( apoya muñecas)
                                            </td>

                                            <td>
                                                <input id="radio111" type="radio" name="rbf56" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio112" type="radio" name="rbf56" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf56" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Tiene disponible un mouse pad o almohadilla para el mouse?
                                            </td>

                                            <td>
                                                <input id="radio113" type="radio" name="rbf57" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio114" type="radio" name="rbf57" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf57" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtsoporte" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio115" type="radio" name="rbf58" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio116" type="radio" name="rbf58" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf58" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel TECLADO-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse10">TECLADO</a></h4>
                        </div>

                        <div id="collapse10" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">

                                        <!-- fila 10 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">TECLADO</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Es posible ajustar el ángulo de inclinación?
                                            </td>

                                            <td>
                                                <input id="radio117" type="radio" name="rbf59" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio118" type="radio" name="rbf59" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf59" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Es posible ajustar la altura del teclado?
                                            </td>

                                            <td>
                                                <input id="radio119" type="radio" name="rbf60" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio120" type="radio" name="rbf60" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf60" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Es confortable la presión del teclado?
                                            </td>

                                            <td>
                                                <input id="radio121" type="radio" name="rbf61" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio122" type="radio" name="rbf61" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf61" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtTeclado" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio123" type="radio" name="rbf62" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio124" type="radio" name="rbf62" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf62" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel MOUSE-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse11">MOUSE</a></h4>
                        </div>

                        <div id="collapse11" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 11 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">MOUSE</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Es confortable la Forma y la activación de los botones del dispositivo?
                                            </td>

                                            <td>
                                                <input id="radio125" type="radio" name="rbf63" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio126" type="radio" name="rbf63" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf63" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ El Mouse es operativo sin necesidad de extender el brazo hacia adelante o hacia el costado del cuerpo de la persona?
                                            </td>

                                            <td>
                                                <input id="radio127" type="radio" name="rbf64" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio128" type="radio" name="rbf64" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf64" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtMouse" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio129" type="radio" name="rbf65" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio130" type="radio" name="rbf65" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf65" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel ILUMINACIÓN-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse12">ILUMINACIÓN</a></h4>
                        </div>

                        <div id="collapse12" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 12 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">ILUMINACIÓN</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿La  iluminación en el área del monitor es suficiente?
                                            </td>

                                            <td>
                                                <input id="radio131" type="radio" name="rbf66" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio132" type="radio" name="rbf66" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf66" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Está el monitor ubicado de tal manera que la iluminación de ventanas o lámparas no crean reflejos en la pantalla?
                                            </td>

                                            <td>
                                                <input id="radio133" type="radio" name="rbf67" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio134" type="radio" name="rbf67" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf67" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Existe deslumbramiento por visión directa a la fuente de luz?
                                            </td>

                                            <td>
                                                <input id="radio135" type="radio" name="rbf68" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio136" type="radio" name="rbf68" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf68" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Se emplea algún método para evitar la luz directa de las ventanas?
                                            </td>

                                            <td>
                                                <input id="radio137" type="radio" name="rbf69" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio138" type="radio" name="rbf69" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf69" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Las lámparas fundidas son sustituidas rápidamente?
                                            </td>

                                            <td>
                                                <input id="radio139" type="radio" name="rbf70" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio140" type="radio" name="rbf70" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf70" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtIluminacion" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio141" type="radio" name="rbf71" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio142" type="radio" name="rbf71" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf71" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel TEMPERATURA-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse13">TEMPERATURA</a></h4>
                        </div>

                        <div id="collapse13" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 13 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">TEMPERATURA</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Se siente confortable con la temperatura del ambiente de trabajo?
                                            </td>

                                            <td>
                                                <input id="radio143" type="radio" name="rbf72" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio144" type="radio" name="rbf72" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf72" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Se siente en confort con el frío que genera el aire acondicionado?
                                            </td>

                                            <td>
                                                <input id="radio145" type="radio" name="rbf73" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio146" type="radio" name="rbf73" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf73" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Se siente cómodo con la temperatura cuando el aire no está operativo?
                                            </td>

                                            <td>
                                                <input id="radio147" type="radio" name="rbf74" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio148" type="radio" name="rbf74" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf74" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Se siente bien con la temperatura de la superficie de objetos con los que debe tener contacto durante la jornada?
                                            </td>

                                            <td>
                                                <input id="radio149" type="radio" name="rbf75" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio150" type="radio" name="rbf75" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf75" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Existen altos niveles de humedad?
                                            </td>

                                            <td>
                                                <input id="radio151" type="radio" name="rbf76" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio152" type="radio" name="rbf76" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf76" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtTemperatura" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio153" type="radio" name="rbf77" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio154" type="radio" name="rbf77" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf77" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel VIBRACIÓN-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse14">VIBRACIÓN</a></h4>
                        </div>

                        <div id="collapse14" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 14 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">VIBRACIÓN</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ El equipo de trabajo está libre de vibraciones generadas por el uso del mismo?
                                            </td>

                                            <td>
                                                <input id="radio155" type="radio" name="rbf78" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio156" type="radio" name="rbf78" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf78" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ ha sido eliminada cualquier fuente de vibración en el área de trabajo?
                                            </td>

                                            <td>
                                                <input id="radio157" type="radio" name="rbf79" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio158" type="radio" name="rbf79" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf79" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtVibracion" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio159" type="radio" name="rbf80" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio160" type="radio" name="rbf80" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf80" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel RUIDO (en caso de que no exista ruido significativo abstenerse de responder)-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse15">RUIDO (en caso de que no exista ruido significativo abstenerse de responder)</a></h4>
                        </div>

                        <div id="collapse15" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 15 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">RUIDO (en caso de que no exista ruido significativo abstenerse de responder)</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿El nivel de sonido que se genera habitualmente, permite la conversación entre sus compañeros de trabajo sin un esfuerzo significativo o molestia?
                                            </td>

                                            <td>
                                                <input id="radio161" type="radio" name="rbf81" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio162" type="radio" name="rbf81" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf81" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Existe un ruido constante procedente del exterior, y sin embargo esto le permite concentrarse?
                                            </td>

                                            <td>
                                                <input id="radio163" type="radio" name="rbf82" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio164" type="radio" name="rbf82" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf82" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Existe un ruido molesto y constante generado por los compañeros de trabajo,  y sin embargo esto le permite concentrarse?
                                            </td>

                                            <td>
                                                <input id="radio165" type="radio" name="rbf83" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio166" type="radio" name="rbf83" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf83" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtRuido" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio167" type="radio" name="rbf84" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio168" type="radio" name="rbf84" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf84" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel VENTILACIÓN-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse16">VENTILACIÓN</a></h4>
                        </div>

                        <div id="collapse16" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 16 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">VENTILACIÓN</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ La circulación de aire fresco es adecuada?
                                            </td>

                                            <td>
                                                <input id="radio169" type="radio" name="rbf85" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio170" type="radio" name="rbf85" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf85" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtVentilacion" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio171" type="radio" name="rbf86" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio172" type="radio" name="rbf86" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf86" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel FATIGA FÍSICA-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse17">FATIGA FÍSICA</a></h4>
                        </div>

                        <div id="collapse17" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 17 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">FATIGA FÍSICA</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Se le permite tomar descansos frecuentes?
                                            </td>

                                            <td>
                                                <input id="radio173" type="radio" name="rbf87" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio174" type="radio" name="rbf87" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf87" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Usted realiza pausas activas durante la jornada laboral?
                                            </td>

                                            <td>
                                                <input id="radio175" type="radio" name="rbf88" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio176" type="radio" name="rbf88" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf88" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ los esfuerzos realizados están de acuerdo a su capacidad física?
                                            </td>

                                            <td>
                                                <input id="radio177" type="radio" name="rbf89" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio178" type="radio" name="rbf89" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf89" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ los esfuerzos realizados están de acuerdo a su entrenamiento?
                                            </td>

                                            <td>
                                                <input id="radio179" type="radio" name="rbf90" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio180" type="radio" name="rbf90" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf90" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Le es posible manipular aquellos objetos que requieran ser levantados cerca del cuerpo, de manera que evite la extensión de los brazos, doblarse o girar el torso para su manipulación?
                                            </td>

                                            <td>
                                                <input id="radio181" type="radio" name="rbf91" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio182" type="radio" name="rbf91" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf91" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtFatigaFisica" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio183" type="radio" name="txtf92" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio184" type="radio" name="txtf92" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf92" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel VISIÓN-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse18">VISIÓN</a></h4>
                        </div>

                        <div id="collapse18" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 18 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">VISIÓN</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Usted puede ver el texto en el monitor sin necesidad de inclinar la cabeza hacia atrás?
                                            </td>

                                            <td>
                                                <input id="radio185" type="radio" name="rbf93" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio186" type="radio" name="rbf93" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf93" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Los colores y el tamaño de las letras e imágenes del monitor, son fáciles de ver o leer?
                                            </td>

                                            <td>
                                                <input id="radio187" type="radio" name="rbf94" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio188" type="radio" name="rbf94" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf94" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtVision" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio189" type="radio" name="txtf95" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio190" type="radio" name="txtf95" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf95" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel CAPACITACIÓN E INFORMACIÓN-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse19">CAPACITACIÓN E INFORMACIÓN</a></h4>
                        </div>

                        <div id="collapse19" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 19 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">CAPACITACIÓN E INFORMACIÓN</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Se le ha capacitado respecto a temas de Seguridad y Salud en el Trabajo?
                                            </td>

                                            <td>
                                                <input id="radio191" type="radio" name="rbf96" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio192" type="radio" name="rbf96" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf96" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Se realizan simulacros de evacuación?
                                            </td>

                                            <td>
                                                <input id="radio193" type="radio" name="rbf97" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio194" type="radio" name="rbf97" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf97" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿La empresa cumple son las señalizaciones de rutas de evacuación?
                                            </td>

                                            <td>
                                                <input id="radio195" type="radio" name="rbf98" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio196" type="radio" name="rbf98" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf98" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Conoce el plan de evacuación?
                                            </td>

                                            <td>
                                                <input id="radio197" type="radio" name="rbf99" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio198" type="radio" name="rbf99" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf99" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Tiene conocimiento de cuales son los puntos de reunión después de una evacuación?
                                            </td>

                                            <td>
                                                <input id="radio199" type="radio" name="rbf100" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio200" type="radio" name="rbf100" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf100" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Se capacita al personal sobre el uso correcto de los equipos?
                                            </td>

                                            <td>
                                                <input id="radio201" type="radio" name="rbf101" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio202" type="radio" name="rbf101" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf101" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Conoce donde están ubicados los extintores?
                                            </td>

                                            <td>
                                                <input id="radio203" type="radio" name="rbf102" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio204" type="radio" name="rbf102" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf102" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Conoce donde están ubicadas las tomas de manguera para incendio?
                                            </td>

                                            <td>
                                                <input id="radio205" type="radio" name="rbf103" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio206" type="radio" name="rbf103" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf103" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Hay botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?
                                            </td>

                                            <td>
                                                <input id="radio207" type="radio" name="rbf104" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio208" type="radio" name="rbf104" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf104" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Se ha conformado la brigada de emergencia?
                                            </td>

                                            <td>
                                                <input id="radio209" type="radio" name="rbf105" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio210" type="radio" name="rbf105" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf105" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtCapInf" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio211" type="radio" name="txtf106" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio212" type="radio" name="txtf106" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf106" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel DAÑOS A LA SALUD-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse20">DAÑOS A LA SALUD</a></h4>
                        </div>

                        <div id="collapse20" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 20 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">DAÑOS A LA SALUD</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Se le ha informado sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?
                                            </td>

                                            <td>
                                                <input id="radio213" type="radio" name="rbf107" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio214" type="radio" name="rbf107" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf107" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Está enterado de los accidentes de trabajo ocurridos en el último año?
                                            </td>

                                            <td>
                                                <input id="radio215" type="radio" name="rbf108" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio216" type="radio" name="rbf108" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf108" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?
                                            </td>

                                            <td>
                                                <input id="radio217" type="radio" name="rbf109" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio218" type="radio" name="rbf109" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf109" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?
                                            </td>

                                            <td>
                                                <input id="radio219" type="radio" name="rbf110" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio220" type="radio" name="rbf110" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf110" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?
                                            </td>

                                            <td>
                                                <input id="radio221" type="radio" name="rbf111" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio222" type="radio" name="rbf111" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf111" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">Ante los Accidentes Laborales ¿Se realiza la investigación del evento?
                                            </td>

                                            <td>
                                                <input id="radio223" type="radio" name="rbf112" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio224" type="radio" name="rbf112" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf112" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtDañosSalud" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio225" type="radio" name="rbf113" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio226" type="radio" name="rbff113" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf113" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel ASPECTOS PSICOSOCIALES-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse21">ASPECTOS PSICOSOCIALES</a></h4>
                        </div>

                        <div id="collapse21" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 21 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">ASPECTOS PSICOSOCIALES</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿ Usted tiene algún tipo de control sobre el proceso de trabajo?
                                            </td>

                                            <td>
                                                <input id="radio227" type="radio" name="rbf114" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio228" type="radio" name="rbf114" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf114" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Los Programas a utilizar en sus tareas diarias son fáciles de utilizar?
                                            </td>

                                            <td>
                                                <input id="radio229" type="radio" name="rbf115" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio230" type="radio" name="rbf115" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf115" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Se le ha entrenado para utilizar el software?
                                            </td>

                                            <td>
                                                <input id="radio231" type="radio" name="rbf116" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio232" type="radio" name="rbf116" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf116" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Existe buena comunicación con su supervisor?
                                            </td>

                                            <td>
                                                <input id="radio233" type="radio" name="rbf117" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio234" type="radio" name="rbf117" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf117" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtAspPsico" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio235" type="radio" name="rbf118" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio236" type="radio" name="rbff118" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf118" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel OTRAS CONDICIONES-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse22">OTRAS CONDICIONES</a></h4>
                        </div>

                        <div id="collapse22" class="panel-collapse collapse">
                            <div class="panel-body">

                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 22 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">OTRAS CONDICIONES</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Las instalaciones usadas para la alimentación son apropiadas?
                                            </td>

                                            <td>
                                                <input id="radio237" type="radio" name="rbf119" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio238" type="radio" name="rbf119" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf119" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Se encuentran en estado óptimo de limpieza?
                                            </td>

                                            <td>
                                                <input id="radio239" type="radio" name="rbf120" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio240" type="radio" name="rbf120" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf120" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?
                                            </td>

                                            <td>
                                                <input id="radio241" type="radio" name="rbf121" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio242" type="radio" name="rbf121" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf121" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Los espacios sanitarios son adecuados?
                                            </td>

                                            <td>
                                                <input id="radio243" type="radio" name="rbf122" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio244" type="radio" name="rbf122" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf122" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Existen filtros de agua potable en la empresa?
                                            </td>

                                            <td>
                                                <input id="radio245" type="radio" name="rbf123" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio246" type="radio" name="rbf123" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf123" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Posee la empresa áreas para el descanso y la recreación?
                                            </td>

                                            <td>
                                                <input id="radio247" type="radio" name="rbf124" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio248" type="radio" name="rbf124" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf124" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Existe señalización?
                                            </td>

                                            <td>
                                                <input id="radio249" type="radio" name="rbf125" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio250" type="radio" name="rbf125" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf125" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿En las instalaciones sanitarias se mantiene el orden y limpieza?
                                            </td>

                                            <td>
                                                <input id="radio251" type="radio" name="rbf126" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio252" type="radio" name="rbf126" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf126" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtOtraCond" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio253" type="radio" name="rbf127" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio254" type="radio" name="rbf127" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf127" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- Panel TOTAL DE CONDICIONES-->
                    <div class="panel-body">

                        <table class="table table-condensed">
                            <tbody class="text-center">
                                <!-- fila 23 -->
                                <tr class="bg-aqua color-palette">
                                    <th class="col-md-5 text-center">TOTAL DE CONDICIONES</th>
                                    <th class="col-md-1 text-center">SI</th>
                                    <th class="col-md-1 text-center">NO</th>
                                    <th class="col-md-5 text-center">OBSERVACIONES</th>
                                </tr>

                                <tr>
                                    <td class="text-left">Sumatoria del total de respuestas
                                    </td>

                                    <td>
                                        <asp:Label ID="lbTotalSi" runat="server" Text="---"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="lbTotalNo" runat="server" Text="---"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="lbObservaciones" runat="server" Text="---"></asp:Label>
                                    </td>

                                </tr>

                            </tbody>

                        </table>

                    </div>

                    <hr />
                    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
                    <script type="text/javascript" src="//www.google.com/jsapi"></script>

                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <asp:Literal ID="ltReporte" runat="server"></asp:Literal>
                            <div id="piechart"></div>
                        </div>
                        <asp:PlaceHolder runat="server" Visible="false">
                            <asp:Image alt="-" ID="ImgChart" runat="server" />
                        </asp:PlaceHolder>
                        <asp:HiddenField ID="rutaImg" runat="server"></asp:HiddenField>
                    </div>

                </div>
            </div>
        </div>


        <div class="row text-center">


            <div class="col-md-3 col-md-offset-1">
                <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\calculator.png"
                    OnClick="Guardar" />
                <h4>Generar Resultados</h4>
            </div>

            <div class="col-md-3">
                <asp:ImageButton alt="-" runat="server" ImageUrl="~\ico\descargar.png" OnClick="GenerarDocumentoGeneral"
                    ValidationGroup="ValidationAdd" />
                <h4>Descargar Formato</h4>
            </div>

            <asp:PlaceHolder ID="phBtnPrint" runat="server" Visible="false">
                <div class="col-md-3">
                    <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento"
                        ValidationGroup="ValidationAdd" />
                    <h4>Generar Documento</h4>
                </div>
            </asp:PlaceHolder>

        </div>

    </asp:Panel>
</asp:Content>
