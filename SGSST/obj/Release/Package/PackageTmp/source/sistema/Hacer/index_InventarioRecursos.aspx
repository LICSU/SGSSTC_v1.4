<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_InventarioRecursos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_InventarioRecursos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel runat="server" ID="panel1">

        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="#">Inventario De Recursos</a></li>
        </ol>

        <div class="page-header">
            <h1 class="text-center">Inventario De Recursos</h1>
            <br />
            Consiste en un listado ordenado de personas y de elementos necesarios para atender con eficiencia una situación de Emergencia
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
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
                        runat="server" ValidationGroup="ValidationAdd" />
                </div>
            </asp:PlaceHolder>
        </div>

        <div class="panel panel-default">

            <!-- Panel RECURSOS HUMANOS -->
            <div class="panel-heading bg-aqua color-palette">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">RECURSOS HUMANOS</a>
                </h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse">
                <div class="panel-body">
                    <table class="table table-condensed">
                        <tbody>

                            <!-- fila 1 -->
                            <tr class="bg-aqua color-palette">
                                <th class="col-md-10 text-center">RECURSOS HUMANOS</th>
                                <th class="col-md-2 text-center">¿EXISTE?<br />
                                    <div class="col-md-6  bg-green color-palette">SI</div>
                                    <div class="col-md-6  bg-red color-palette">NO</div>
                                </th>
                            </tr>

                            <tr>
                                <td class="text-left">Coordinador del Plan de Emergencias
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio1" type="radio" name="rbf1" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio2" type="radio" name="rbf1" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Director del Comité Operativo de Emergencias
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio3" type="radio" name="rbf2" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio4" type="radio" name="rbf2" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Director de Seguridad Física
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio5" type="radio" name="rbf3" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio6" type="radio" name="rbf3" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Director de Logística
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio7" type="radio" name="rbf4" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio8" type="radio" name="rbf4" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Director de Comunicaciones
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio9" type="radio" name="rbf5" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio10" type="radio" name="rbf5" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Jefe de Brigada
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio11" type="radio" name="rbf6" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio12" type="radio" name="rbf6" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Coordinador de la Unidad de prevención y control de incendios
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio13" type="radio" name="rbf7" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio14" type="radio" name="rbf7" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Coordinador de la Unidad de evacuación
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio15" type="radio" name="rbf8" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio16" type="radio" name="rbf8" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Coordinador de Primeros Auxilios
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio17" type="radio" name="rbf9" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio18" type="radio" name="rbf9" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Coordinador de la Unidad Especial (si aplica)
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio19" type="radio" name="rbf10" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio20" type="radio" name="rbf10" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Brigadistas
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio21" type="radio" name="rbf11" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio22" type="radio" name="rbf11" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Entidades de Socorro Externas (personal de la Cruz Roja, Defensa Civil o Bomberos)
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio23" type="radio" name="rbf12" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio24" type="radio" name="rbf12" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Panel RECURSOS FÍSICOS O TÉCNICOS -->
            <div class="panel-heading bg-aqua color-palette">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">RECURSOS FÍSICOS O TÉCNICOS</a>
                </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
                <div class="panel-body">
                    <table class="table table-condensed">
                        <tbody>

                            <!-- fila 1 -->
                            <tr class="bg-aqua color-palette">
                                <th class="col-md-10 text-center">RECURSOS FÍSICOS O TÉCNICOS</th>
                                <th class="col-md-2 text-center">¿EXISTE?<br />
                                    <div class="col-md-6  bg-green color-palette">SI</div>
                                    <div class="col-md-6  bg-red color-palette">NO</div>
                                </th>
                            </tr>

                            <tr>
                                <td class="text-left">Medios de primeros auxilios y salvamento (Botiquines, Camillas, Sillas de rueda, Equipos de rescate)
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio25" type="radio" name="rbf13" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio26" type="radio" name="rbf13" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Equipos de protección individual
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio27" type="radio" name="rbf14" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio28" type="radio" name="rbf14" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Señales de Alarma
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio29" type="radio" name="rbf15" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio30" type="radio" name="rbf15" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Sistemas de detección 
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio31" type="radio" name="rbf16" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio32" type="radio" name="rbf16" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Sistemas de alerta
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio33" type="radio" name="rbf17" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio34" type="radio" name="rbf17" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Sistemas de comunicación
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio35" type="radio" name="rbf18" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio36" type="radio" name="rbf18" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Sistemas de Iluminación de Emergencia
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio37" type="radio" name="rbf19" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio38" type="radio" name="rbf19" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Sistemas Contra Incendios
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio39" type="radio" name="rbf20" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio40" type="radio" name="rbf20" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Extintores Contra Incendios
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio41" type="radio" name="rbf21" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio42" type="radio" name="rbf21" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Señalización adecuada de vías y salidas
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio43" type="radio" name="rbf22" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio44" type="radio" name="rbf22" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Salidas de Emergencia
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio45" type="radio" name="rbf23" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio46" type="radio" name="rbf23" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Salidas de Emergencia
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio47" type="radio" name="rbf24" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio48" type="radio" name="rbf24" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Vías de acceso suficientes y adecuadas para la evacuación
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio49" type="radio" name="rbf25" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio50" type="radio" name="rbf25" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Escaleras para incendios
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio51" type="radio" name="rbf26" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio52" type="radio" name="rbf26" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Diques, puertas, muros cortafuego
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio53" type="radio" name="rbf27" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio54" type="radio" name="rbf27" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Drenajes adecuados
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio55" type="radio" name="rbf28" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio56" type="radio" name="rbf28" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Materiales peligrosos (control, ubicación y almacenamiento)
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio57" type="radio" name="rbf29" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio58" type="radio" name="rbf29" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Sismo resistencia
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio59" type="radio" name="rbf30" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio60" type="radio" name="rbf30" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Regaderas automáticas
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio61" type="radio" name="rbf31" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio62" type="radio" name="rbf31" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td class="text-left">Sistemas de iluminación autónoma
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio63" type="radio" name="rbf32" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio64" type="radio" name="rbf32" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Panel RECURSOS FINANCIEROS -->
            <div class="panel-heading bg-aqua color-palette">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">RECURSOS FINANCIEROS</a>
                </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
                <div class="panel-body">
                    <table class="table table-condensed">
                        <tbody>

                            <!-- fila 1 -->
                            <tr class="bg-aqua color-palette">
                                <th class="col-md-10 text-center">RECURSOS FINANCIEROS</th>
                                <th class="col-md-2 text-center">¿EXISTE?<br />
                                    <div class="col-md-6  bg-green color-palette">SI</div>
                                    <div class="col-md-6  bg-red color-palette">NO</div>
                                </th>
                            </tr>

                            <tr>
                                <td class="text-left">Recursos financieros aprobados para la prevención o el control de Emergencias Empresariales
                                </td>

                                <td>
                                    <div class="col-md-6">
                                        <input id="radio65" type="radio" name="rbf33" value="1" runat="server">
                                    </div>
                                    <div class="col-md-6">
                                        <input id="radio66" type="radio" name="rbf33" value="2" runat="server">
                                    </div>
                                </td>

                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <div class="box-body no-padding">
            <table class="table table-condensed">
                <tbody>
                    <tr class="bg-aqua color-palette">
                        <th class="col-md-10 text-center">TOTAL DE RESPUESTAS</th>
                        <th class="col-md-1 text-center">SI</th>
                        <th class="col-md-1 text-center">NO</th>
                    </tr>

                    <tr class="text-center">
                        <td class="text-left">Sumatoria del total de respuestas
                        </td>

                        <td>
                            <asp:Label ID="lbTotalSI" runat="server" Text="---"></asp:Label>
                        </td>

                        <td>
                            <asp:Label ID="lbTotalNO" runat="server" Text="---"></asp:Label>
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
                <asp:Image AlternateText="-" ID="ImgChart" runat="server" />
            </asp:PlaceHolder>

            <asp:HiddenField ID="rutaImg" runat="server"></asp:HiddenField>
        </div>

        <div class="row text-center">
            <div class="col-md-4 col-md-offset-2">
                <asp:ImageButton alt="-" ID="btnCalculate" runat="server" ImageUrl="~\ico\calculator.png"
                    OnClick="btnCalculate_Onclick" />
                <h4>Calcular Resultados</h4>
            </div>

            <asp:PlaceHolder ID="phBtnPrint" runat="server" Visible="false">
                <div class="col-md-4">
                    <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png" ValidationGroup="ValidationAdd"
                        OnClick="GenerarDocumento" />
                    <h4>Generar Documento</h4>
                </div>
            </asp:PlaceHolder>
        </div>
    </asp:Panel>

</asp:Content>
