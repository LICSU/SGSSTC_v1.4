<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_AutoEvaluacion.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_AutoEvaluacion" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">

        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Evaluación Inicial</a></li>
                <li><a href="../EvaluacionInicial/index_AutoEvaluacion.aspx">Documento Auto-Evaluación</a></li>
                <li><a href="#">Crear Documento Auto-Evaluación</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Crear Documento de Evaluación Inicial</h1>
            </div>

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                            ControlToValidate="ddlSucursal" runat="server" ValidationGroup="ValidationAdd" />
                    </div>
                </asp:PlaceHolder>
            </div>
            <br />

            <div class="row text-center">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-body no-padding">
                            <table class="table table-condensed">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-2 text-center">FASE DEL SISTEMA CICLO PHVA</th>
                                        <th class="col-md-2 text-center">CRITERIO A REVISAR</th>
                                        <th class="col-md-4 text-center">ESTADO DE IMPLEMENTACIÓN DEL SG-SST<br />
                                            <div class="col-md-4  bg-red color-palette">NINGUNO</div>
                                            <div class="col-md-4  bg-yellow color-palette">PARCIAL%</div>
                                            <div class="col-md-4  bg-green color-palette">TOTAL</div>
                                        </th>
                                        <th class="col-md-4 text-center">EVIDENCIA ACTUAL</th>
                                    </tr>

                                    <!-- filas Planear -->
                                    <tr>
                                        <td>PLANEAR</td>
                                        <td>Aspectos legales</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio1" type="radio" name="rbf1" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number1" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio2" type="radio" name="rbf1" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Matriz legal actualizada y acorde a la naturaleza de la organización</td>
                                    </tr>
                                    <tr>
                                        <td>PLANEAR</td>
                                        <td>Política de Seguridad y Salud en el Trabajo</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio3" type="radio" name="rbf2" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number2" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio4" type="radio" name="rbf2" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Existencia de la Política de seguridad y Salud en el Trabajo, documentada y publicada a todos los níveles de la organización</td>
                                    </tr>

                                    <tr>
                                        <td>PLANEAR</td>
                                        <td>Identificación de los peligros, evaluación y valoración de los riesgos (el cual debe ser anual)</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio5" type="radio" name="rbf3" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number3" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio6" type="radio" name="rbf3" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Panorama de Factores de Riesgo o la herramienta que haya empleado el servicio de seguridad</td>
                                    </tr>

                                    <tr>
                                        <td>PLANEAR</td>
                                        <td>Cumplimiento del programa de capacitación anual</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio7" type="radio" name="rbf4" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number4" maxlength="2" min="1" max="99" class="form-control"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %"
                                                    placeholder="%" type="number" step="0.01" runat="server">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio8" type="radio" name="rbf4" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Evidenciar el porcentaje de cumplimiento del plan de capacitación anual,
                                                      comprobando por medio de planillas de registro la asistencia de los 
                                                     trabajadores a las charlas respectivas y el estatus de su ausencia si es
                                                      el caso (justificado o injustificado)</td>
                                    </tr>

                                    <tr>
                                        <td>PLANEAR</td>
                                        <td>Plan de Trabajo Anual</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio9" type="radio" name="rbf5" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number5" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio10" type="radio" name="rbf5" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Plan de Trabajo Anual para alcanzar cada uno de los objetivos del SG-SST,
                                                     firmado por el empleador; éste debe contener los objetivos, metas, actividades,
                                                     responsables, cronograma y recursos del Sistema de Gestión de la Seguridad y Salud 
                                                     en el Trabajo (SG-SST).</td>
                                    </tr>

                                    <tr>
                                        <td>PLANEAR</td>
                                        <td>Indicadores de estructura, proceso y resultado</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio11" type="radio" name="rbf6" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number6" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio12" type="radio" name="rbf6" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Registro de indicadores de estructura, proceso y resultado</td>
                                    </tr>

                                    <!-- filas Hacer -->
                                    <tr>
                                        <td>HACER</td>
                                        <td>El plan de Prevención, preparación y respuesta ante emergencias, análisis de vulnerabilidad de la empresa  (el cual debe ser anual)</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio13" type="radio" name="rbf7" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number7" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio14" type="radio" name="rbf7" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Plan de prevención, preparación y respuesta ante emergencias ( en físico o digital),
                                                      que incluya la identificación de amenazas y vulnerabilidad, demostrar los recursos 
                                                     destinados para su implementación. </td>
                                    </tr>

                                    <tr>
                                        <td>HACER</td>
                                        <td>Conformación de las Brigadas de Emergencias </td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio15" type="radio" name="rbf8" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number8" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio16" type="radio" name="rbf8" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Registro de conformación y capacitación de la brigada de emergencias, 
                                                     registros de simulacros.</td>
                                    </tr>

                                    <tr>
                                        <td>HACER</td>
                                        <td>Sistemas de vigilancia epidemiológica</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio17" type="radio" name="rbf9" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number9" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio18" type="radio" name="rbf9" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Documentación y registro de la morbilidad de los trabajadores (reposos por 
                                                     enfermedades comunes y/o ocupacionales, durante el mes en curso), registro de 
                                                     evaluaciones de ingreso y egreso, registro de evaluaciones pre y post vacacionales); 
                                                     la caracterización de sus condiciones de salud; así como, la evaluación y análisis 
                                                     de las estadísticas sobre la enfermedad y la accidentalidad</td>
                                    </tr>

                                    <tr>
                                        <td>HACER</td>
                                        <td>Descripción sociodemográfica</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio19" type="radio" name="rbf10" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number10" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio20" type="radio" name="rbf10" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Registrar La descripción sociodemográfica de los trabajadores y la caracterización 
                                                     de sus condiciones de salud</td>
                                    </tr>

                                    <tr>
                                        <td>HACER</td>
                                        <td>Medidas de prevención y control</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio21" type="radio" name="rbf11" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number11" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio22" type="radio" name="rbf11" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Estándares de seguridad y demás medidas de prevención y control acordes al esquema
                                                      de jerarquización (eliminación, sustitución, control de ingeniería, controles 
                                                     administrativos, equipos y elementos de protección personal y colectivo); es decir 
                                                     hacer seguimiento a las medidas o intervenciones para minimizar los reisgos, 
                                                     aplicadas  en la fuente de orígen, en el medio o en el individuo</td>
                                    </tr>

                                    <!-- filas Verificar -->
                                    <tr>
                                        <td>VERIFICAR</td>
                                        <td>Evaluación de la efectividad de las medidas implementadas, para controlar los 
                                                     peligros, riesgos y amenazas; hacer evaluación y seguimiento a las medidas de 
                                                     prevención y control de los peligros y riesgos de la empresa </td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio23" type="radio" name="rbf12" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number12" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio24" type="radio" name="rbf12" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Las investigaciones de accidentes de trabajo, inspecciones de seguridad,
                                                      análisis de vulnerabilidad y el plan de trabajo anual; verificando 
                                                     con ellas si en el año en curso, éstas permitieron reducir, entre otros,
                                                      los índices de frecuencia y severidad por ausentismo, accidentes de 
                                                     trabajo, vulnerabilidad</td>
                                    </tr>

                                    <tr>
                                        <td>VERIFICAR</td>
                                        <td>Indicadores de estructura, proceso y resultado</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio25" type="radio" name="rbf13" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number13" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio26" type="radio" name="rbf13" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Seguimiento a los resultados de los indicadores definidos en el SGSST 
                                                     de la empresa del año inmediatamente anterior</td>
                                    </tr>

                                    <!-- filas Actuar -->
                                    <tr>
                                        <td>ACTUAR</td>
                                        <td>Acciones preventivas y correctivas</td>
                                        <td>
                                            <div class="col-md-4">
                                                <input id="radio27" type="radio" name="rbf14" value="1" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 0%">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="Number14" maxlength="2" min="1" max="99" class="form-control"
                                                    placeholder="%" type="number" step="0.01" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Ingrese el porcentaje de implementación (1 a 99) %">
                                            </div>

                                            <div class="col-md-4">
                                                <input id="radio28" type="radio" name="rbf14" value="2" runat="server"
                                                    data-toggle="tooltip" data-placement="bottom"
                                                    title="Seleccione si el porcentaje de implementación es 100%">
                                            </div>
                                        </td>
                                        <td>Divulgación a los niveles de la organización pertinentes al sistema, informándoles 
                                                     de las acciones preventivas y correctivas, con responsables y fechas de cumplimiento.</td>
                                    </tr>

                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row text-center">
                <div class="col-md-4 col-md-offset-4">
                    <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento"
                        ValidationGroup="ValidationAdd" data-toggle="tooltip" data-placement="bottom"
                        title="Presione para generar el documento de Auto-Evaluación" />
                    <h4>Generar Documento</h4>
                </div>
            </div>

        </ContentTemplate>

        <Triggers>
            <asp:PostBackTrigger ControlID="btnGuardar" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
