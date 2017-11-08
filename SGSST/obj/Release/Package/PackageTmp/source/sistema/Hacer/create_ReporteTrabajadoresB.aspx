<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_ReporteTrabajadoresB.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_ReporteTrabajadoresB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral,  PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="panel1" runat="server">

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
                    <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
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

                    <!-- Panel JORNADA LABORAL-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">JORNADA LABORAL</a></h4>
                        </div>

                        <div id="collapse1" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 1 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">JORNADA LABORAL</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr class="text-center">
                                            <td class="text-left">¿Consideras adecuada la distribución de:
                                            </td>

                                            <td>
                                                <input id="radio1" type="radio" visible="false" name="rbf1" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio2" type="radio" visible="false" name="rbf1" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" Visible="false" ID="txtf1" class="col-md-12"></asp:TextBox>
                                            </td>
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
                                        <tr>
                                            <td class="text-left">¿De las pausas?
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtJornada" placeholder="Otra condición por reportar;"></asp:TextBox>

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

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel INFORMACIÓN GENERAL-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">INFORMACIÓN GENERAL</a></h4>
                        </div>

                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 2 -->
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
                                            <td class="text-left">¿El COPASST conoce las estadísticas de ausentismo, accidente de trabajo y enfermedades profesionales?

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
                                            <td class="text-left">¿Se reúnen de acuerdo a lo establecido en las normas?
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
                                            <td class="text-left">¿Se realizan exámenes médicos pre empleo, periódicos y post empleo?
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
                                        <tr>
                                            <td class="text-left">¿Se informa al trabajador de los resultados de los exámenes médicos?
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
                                            <td class="text-left">¿Se investigan los accidentes de trabajo?
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
                                            <td class="text-left">¿La empresa tiene servicio medico?
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
                                            <td class="text-left">¿Hay botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?
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
                                            <td class="text-left">¿Se ha conformado la brigada de emergencia?
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtInfGral" placeholder="Otra condición por reportar;"></asp:TextBox>
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

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel MÁQUINAS Y EQUIPOS-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">MÁQUINAS Y EQUIPOS</a></h4>
                        </div>

                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 3 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">MÁQUINAS Y EQUIPOS</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Los elementos de transmisión de las máquinas están protegidos?
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
                                            <td class="text-left">¿Las máquinas  están provistas de resguardo en sus partes móviles para disminuir posibilidades de corte, atrapamientos o amputaciones?
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
                                            <td class="text-left">¿Las guardas de Protección poseen un color que contrasta con las bases estacionarias de la máquina,  para alertar al personal?
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
                                            <td class="text-left">¿Las máquinas tienen aislamiento térmico en caso de ser necesario? 
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
                                            <td class="text-left">¿Disponen las  máquinas de interruptores u otros sistemas de parada de emergencia?
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
                                        <tr>
                                            <td class="text-left">¿ El cableado de la Maquinaria está en condiciones óptimas ( sin defectos de aislamiento "rupturas en la capa externa")
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
                                            <td class="text-left">¿los Tomacorrientes son de tres espigas planas ( Polo vivo, neutro y tierra)?
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtMaqEqui" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel HERRAMIENTAS-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">HERRAMIENTAS</a></h4>
                        </div>

                        <div id="collapse4" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 4 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">HERRAMIENTAS</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Las herramientas que utiliza están fabricadas del material adecuado?
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
                                            <td class="text-left">¿Están bien pulimentadas? (no tienen rebordes)
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
                                            <td class="text-left">¿Están bien afiladas?
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
                                        <tr>
                                            <td class="text-left">¿Dispone de una caja o sitio fijo para guardar y ordenar sus herramientas?
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
                                            <td class="text-left">¿Si las Herramientas son eléctricas, tienen doble aislamiento o tensión de seguridad?
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
                                            <td class="text-left">¿Dispone de todas las Herramientas necesarias para efectuar la operación? 
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtHerr" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel ESPACIOS, SEÑALIZACIÓN-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">ESPACIOS, SEÑALIZACIÓN</a></h4>
                        </div>

                        <div id="collapse5" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 5 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">ESPACIOS, SEÑALIZACIÓN</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿La distancia entre las maquinas es la adecuada?, ¿no obstaculiza el proceso de trabajo de la maquinaria adjunta?
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
                                        <tr>
                                            <td class="text-left">¿El espacio de trabajo no le permite libre movimiento?
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
                                            <td class="text-left">¿Existe un lugar destinado para el almacenamiento de los materiales?
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
                                            <td class="text-left">¿Están los suelos limpios de grasa y son antideslizantes?
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
                                            <td class="text-left">¿Las condiciones del suelo son óptimas? ¿no presentan irregularidades que puedan ocasionar caídas o representen mayor esfuerzo para movilizar una carga?  
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
                                        <tr>
                                            <td class="text-left">¿Existen Señales de uso de Equipos de Protección Personal?
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
                                            <td class="text-left">¿Existen Señales de Indicaciones para una correcta manipulación de carga?
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
                                            <td class="text-left">¿Existen señalizaciones sobre los diferentes riesgos existentes en la áreas? (Riesgo físico, Eléctrico, Químico, Biológico, Mecánico)
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
                                            <td class="text-left">¿Existe una ruta señalizada para el transporte del Montacargas y/o los Operarios?
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
                                            <td class="text-left">¿ Existe a su alcance equipos para combatir incendios?
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
                                            <td class="text-left">¿Los sectores de cada máquina están delimitadas por zonas de riesgo? (alrededor de cada máquina está demarcado con pintura amarilla en el piso)
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
                                            <td class="text-left">¿Existen salidas de emergencia señalizadas?
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
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtEspSen" placeholder="Otra condición por reportar;"></asp:TextBox>
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

                    <!-- Panel MANIPULACIÓN Y TRANSPORTE-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">MANIPULACIÓN Y TRANSPORTE</a></h4>
                        </div>

                        <div id="collapse6" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 6 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">MANIPULACIÓN Y TRANSPORTE</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Si existen aparatos de elevación, están dotados de interruptores o señales visuales o acústicas contra exceso de carga?
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
                                            <td class="text-left">¿Tienen los ganchos pestillos de seguridad?
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
                                            <td class="text-left">¿El sistema de frenado impide el deslizamiento vertical de la carga?
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
                                            <td class="text-left">¿Se realizan revisiones y pruebas periódicas de los cables?
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
                                            <td class="text-left">Hay normas dictadas por la empresa sobre:
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
                                            <td class="text-left">¿Situación bajo carga suspendida?
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
                                            <td class="text-left">¿Carga y descarga de materiales?
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
                                        <tr>
                                            <td class="text-left">¿Están claramente marcados los pesos máximos que pueden ser transportados?
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
                                            <td class="text-left">¿Si hay Montacargas, lo conduce únicamente el personal autorizado y capacitado?
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
                                            <td class="text-left">¿El Conductor del Montacargas lo conduce a la velocidad permitida y con la alarma indicadora de movimiento?
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
                                            <td class="text-left">¿Sus frenos funcionan bien y son potentes?
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
                                            <td class="text-left">¿El asiento del conductor es cómodo y tiene buena visibilidad?
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
                                        <tr>
                                            <td class="text-left">¿Si usted emplea Carretillas para el traslado de cargas, la misma se encuentra en optimas condiciones?
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
                                            <td class="text-left">¿Se realiza un mantenimiento paródico a las carretillas?
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
                                            <td class="text-left">¿Se sustituyen las ruedas de la carretilla que se encuentran desgastadas?
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
                                            <td class="text-left">¿En el caso de que haya cintas transportadoras, tienen resguardo el motor, rodillo, etc.?
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
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtManTrans" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel VIBRACIONES-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">VIBRACIONES</a></h4>
                        </div>

                        <div id="collapse7" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 7 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">VIBRACIONES</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Si usted utiliza herramientas que produzcan vibraciones (martillo neumático, buril, pulidora, etc.), están dotados de sistemas de amortiguación?
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
                                            <td class="text-left">¿Están aisladas las maquinas que producen vibraciones?
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
                                        <tr>
                                            <td class="text-left">¿Si usted opera en una máquina que genera vibraciones, tiene su puesto de trabajo una alfombra anti fatiga?
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtVibraciones" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel ILUMINACIÓN-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">ILUMINACIÓN</a></h4>
                        </div>

                        <div id="collapse8" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 8 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">ILUMINACIÓN</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Dispone el local de trabajo de la iluminación general suficiente?
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
                                            <td class="text-left">¿Esta situada la luz de forma que impida deslumbramiento y reflejos?
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
                                            <td class="text-left">¿Usted Considera que la iluminación del puesto de trabajo es correcta?
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
                                            <td class="text-left">¿Se mantienen limpias las lámparas y ventanas?
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
                                        <tr>
                                            <td class="text-left">¿Se realizan mediciones del nivel de luz?
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
                                            <td class="text-left">¿Las lámparas fundidas son sustituidas rápidamente?
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
                                            <td class="text-left">¿Disponen los distintos lugares del centro de trabajo de los niveles de iluminación mínimos establecidos?
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtIluminacion" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel CONDICIONES TERMOHIGROMÉTRICAS-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse9">CONDICIONES TERMOHIGROMÉTRICAS</a></h4>
                        </div>

                        <div id="collapse9" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 9 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">CONDICIONES TERMOHIGROMÉTRICAS</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Los focos de calor (hornos, calderas, etc.) están aislados convenientemente?
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
                                            <td class="text-left">¿Dispone el local de ventilación general?
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
                                        <tr>
                                            <td class="text-left">¿Cuándo se genera vapor de agua, hay un sistema de extracción localizada u otros que eviten el exceso de humedad?
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
                                            <td class="text-left">¿La temperatura del local de trabajo es la adecuada al tipo de actividad?
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
                                            <td class="text-left">¿La ropa de trabajo utilizada es adecuada al tipo de trabajo y a la temperatura ambiental?
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
                                        <tr>
                                            <td class="text-left">¿se realiza un mantenimiento a los sistemas de ventilación?
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtTermohigro" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel RADIACIONES-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse10">RADIACIONES</a></h4>
                        </div>

                        <div id="collapse10" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 10 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">RADIACIONES</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Están señalizados los locales en que hay radiaciones ionizantes, de ser el caso?
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
                                            <td class="text-left">¿Si Usted está en un puesto de trabajo con radiaciones ionizantes ¿Le han informado de los riesgos a que esta sometido y las medidas preventivas a tomar?
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
                                        <tr>
                                            <td class="text-left">¿Le hacen revisiones médicas periódicas?
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
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtRadiaciones" placeholder="Otra condición por reportar;"></asp:TextBox>
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

                    <!-- Panel CONTAMINANTES QUÍMICOS (Si no se emplean productos químicos abstenerse de responder estas preguntas)-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse11">CONTAMINANTES QUÍMICOS (Si no se emplean productos químicos abstenerse de responder estas preguntas)</a></h4>
                        </div>

                        <div id="collapse11" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 11 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">CONTAMINANTES QUÍMICOS (Si no se emplean productos químicos abstenerse de responder estas preguntas)</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Se utilizan productos químicos en su área de trabajo, sabe que productos son?.
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
                                            <td class="text-left">¿Están los productos claramente etiquetados?
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
                                            <td class="text-left">En el local de trabajo, ¿Conoce la existencia de algún contaminante químico?
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
                                            <td class="text-left">¿Existen normas establecidas para la utilización de productos químicos peligrosos?
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
                                            <td class="text-left">¿Se realizan mediciones periódicas de la concentración del contaminante?
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
                                            <td class="text-left">¿Se realizan revisiones periódicas a los trabajadores?
                                            </td>

                                            <td>
                                                <input id="radio183" type="radio" name="rbf92" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio184" type="radio" name="rbf92" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf92" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿ Si usted emplea productos tóxicos, ¿Mantiene condiciones mínimas de higiene personal? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)
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
                                            <td class="text-left">¿ Antes de incorporar al proceso productivo una sustancia química, ¿le informan sobre la hoja de datos de seguridad del producto? ( donde el proveedor detalla los datos del producto, niveles de toxicidad y acciones a seguir en casos de emergencia)
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
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtContQui" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio189" type="radio" name="rbf95" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio190" type="radio" name="rbf95" value="2" runat="server">
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

                    <!-- Panel CONTAMINANTES BIOLÓGICOS-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse12">CONTAMINANTES BIOLÓGICOS</a></h4>
                        </div>

                        <div id="collapse12" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 12 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">CONTAMINANTES BIOLÓGICOS</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">Solo si usted trabaja en: cría y cuidado de animales, manipulación de productos origen animal, laboratorios biológicos y clínicos, hospitales, sanitarios, etc.: ¿Están los aseos, los comedores etc., aislados de la zona de trabajo?
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
                                            <td class="text-left">¿Se mantienen los lugares de trabajo, vestuarios, baños, comedores, etc., en perfectas condiciones de limpieza y desinfección?
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
                                            <td class="text-left">¿Mantiene condiciones mínimas de higiene personal? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.) 
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtContBio" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel FATIGA FÍSICA-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse13">FATIGA FÍSICA</a></h4>
                        </div>

                        <div id="collapse13" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 13 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">FATIGA FÍSICA</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">Los esfuerzos realizados en el desarrollo de la labor están adecuados a: 
                                            </td>

                                            <td>
                                                <input id="radio199" type="radio" name="rbf100" value="1" visible="false" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio200" type="radio" name="rbf100" value="2" visible="false" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf100" Visible="false" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Su capacidad física?
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
                                            <td class="text-left">¿ A la temperatura ambiental?
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
                                            <td class="text-left">¿ A su edad?
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
                                            <td class="text-left">¿ A su entrenamiento?
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
                                            <td class="text-left">Si usted realiza un trabajo muy pesado ¿Le hacen revisiones para controlar la frecuencia cardiaca?
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
                                            <td class="text-left">¿Se ha realizado alguna evaluación de consumo metabólico con respecto a la actividad que realiza?
                                            </td>

                                            <td>
                                                <input id="radio211" type="radio" name="rbf106" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio212" type="radio" name="rbf106" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf106" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtFatFis" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel DAÑOS A LA SALUD-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse14">DAÑOS A LA SALUD</a></h4>
                        </div>

                        <div id="collapse14" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 14 -->
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
                                            <td class="text-left">¿Está enterado de los accidentes de trabajo ocurridos en el último año?
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
                                            <td class="text-left">¿Conoce las causas?
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
                                            <td class="text-left">¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?
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
                                            <td class="text-left">¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?
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
                                            <td class="text-left">Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?
                                            </td>

                                            <td>
                                                <input id="radio225" type="radio" name="rbf113" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio226" type="radio" name="rbf113" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf113" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">Ante los Accidentes Laborales ¿Se realiza la investigación del evento?
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtDanSalud" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel EQUIPOS DE PROTECCIÓN PERSONAL-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse15">EQUIPOS DE PROTECCIÓN PERSONAL</a></h4>
                        </div>

                        <div id="collapse15" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 15 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">EQUIPOS DE PROTECCIÓN PERSONAL</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Se dota al personal de Equipos de Protección Personal?
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
                                            <td class="text-left">¿Son adecuados al riesgo que deben proteger?
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
                                            <td class="text-left">¿Son de uso personal?
                                            </td>

                                            <td>
                                                <input id="radio235" type="radio" name="rbf118" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio236" type="radio" name="rbf118" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf118" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Se revisan periódicamente?
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
                                            <td class="text-left">¿Se exige su uso obligatorio?
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
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtEPP" placeholder="Otra condición por reportar;"></asp:TextBox>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Panel CAPACITACIÓN E INFORMACIÓN-->
                    <div class="panel panel-default">

                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse16">CAPACITACIÓN E INFORMACIÓN</a></h4>
                        </div>

                        <div id="collapse16" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 16 -->
                                        <tr class="bg-aqua color-palette">
                                            <th class="col-md-5 text-center">CAPACITACIÓN E INFORMACIÓN</th>
                                            <th class="col-md-1 text-center">SI</th>
                                            <th class="col-md-1 text-center">NO</th>
                                            <th class="col-md-5 text-center">OBSERVACIONES</th>
                                        </tr>

                                        <tr>
                                            <td class="text-left">¿Se realizan simulacros de evacuación?
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
                                            <td class="text-left">¿La empresa cumple son las señalizaciones de rutas de evacuación?
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
                                            <td class="text-left">¿Conoce el plan de evacuación?
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
                                            <td class="text-left">¿Tiene conocimiento de cuales son los puntos de reunión ante una evacuación?
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
                                            <td class="text-left">¿Se capacita al personal sobre el manejo correcto de maquinaria?
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
                                            <td class="text-left">¿Se capacita al personal sobre el uso correcto de herramientas?
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
                                        <tr>
                                            <td class="text-left">¿Conoce donde están ubicados los extintores?
                                            </td>

                                            <td>
                                                <input id="radio255" type="radio" name="rbf128" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio256" type="radio" name="rbf128" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf128" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Conoce donde están ubicadas las tomas de manguera para incendio?
                                            </td>

                                            <td>
                                                <input id="radio257" type="radio" name="rbf129" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio258" type="radio" name="rbf129" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf129" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtCapInf" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio259" type="radio" name="rbf130" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio260" type="radio" name="rbf130" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf130" class="col-md-12"></asp:TextBox>
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
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse17">OTRAS CONDICIONES</a></h4>
                        </div>

                        <div id="collapse17" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table class="table table-condensed">
                                    <tbody class="text-center">
                                        <!-- fila 17 -->
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
                                                <input id="radio261" type="radio" name="rbf131" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio262" type="radio" name="rbf131" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf131" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Se encuentran en estado óptimo de limpieza?
                                            </td>

                                            <td>
                                                <input id="radio263" type="radio" name="rbf132" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio264" type="radio" name="rbf132" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf132" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?
                                            </td>

                                            <td>
                                                <input id="radio265" type="radio" name="rbf133" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio266" type="radio" name="rbf133" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf133" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Los espacios sanitarios son adecuados?
                                            </td>

                                            <td>
                                                <input id="radio267" type="radio" name="rbf134" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio268" type="radio" name="rbf134" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf134" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Existen filtros de agua potable en la empresa?
                                            </td>

                                            <td>
                                                <input id="radio269" type="radio" name="rbf135" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio270" type="radio" name="rbf135" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf135" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Posee la empresa áreas para el descanso y recreación?
                                            </td>

                                            <td>
                                                <input id="radio271" type="radio" name="rbf136" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio272" type="radio" name="rbf136" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf136" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Existe señalización por medio de rayados?
                                            </td>

                                            <td>
                                                <input id="radio273" type="radio" name="rbf137" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio274" type="radio" name="rbf137" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf137" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Las áreas de deposito de materiales peligrosos están señalizadas?
                                            </td>

                                            <td>
                                                <input id="radio275" type="radio" name="rbf138" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio276" type="radio" name="rbf138" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf138" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">¿Las áreas de desecho están alejadas de donde se realizan las actividades laborales?
                                            </td>

                                            <td>
                                                <input id="radio277" type="radio" name="rbf139" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio278" type="radio" name="rbf139" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf139" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">
                                                <asp:TextBox class="col-md-12" runat="server" ID="txtOtrasCond" placeholder="Otra condición por reportar;"></asp:TextBox>
                                            </td>

                                            <td>
                                                <input id="radio279" type="radio" name="rbf140" value="1" runat="server">
                                            </td>

                                            <td>
                                                <input id="radio280" type="radio" name="rbf140" value="2" runat="server">
                                            </td>

                                            <td>
                                                <asp:TextBox runat="server" ID="txtf140" class="col-md-12"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <div class="box-body no-padding">
            <table class="table table-condensed">
                <tbody class="text-center">
                    <!-- fila 18 -->
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

        <div class="row text-center">
            <div class="col-md-3 col-md-offset-1">
                <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\calculator.png" OnClick="Guardar" />
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
