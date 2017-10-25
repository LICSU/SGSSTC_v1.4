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
                        <asp:DropDownList runat="server" ID="ddlEmpresa" class="form-control" AutoPostBack="true"
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

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">

                                    <tr>
                                        <th>ESTÁNDAR 1 RECURSOS (10%)
                                            <br />
                                            E1.1 Estándar: Recursos financieros, técnicos humanos y de otra índole (4 %)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.1.1
                                                <br />
                                                El diseño del Sistema de Gestión de Seguridad y Salud en el Trabajo, para empresas de 
                                            diez (10) o menos trabajadores clasificadas en Riesgo I, II, III, podrá ser realizado 
                                            por técnicos o tecnólogos en Seguridad y Salud en el Trabajo o en alguna de sus áreas, 
                                            con licencia vigente en Salud Ocupacional o Seguridad y Salud en el Trabajo que acrediten
                                            mínimo dos (2) años de experiencia en el desarrollo de actividades de Seguridad y Salud
                                            en el Trabajo y que acrediten la aprobación del curso de capacitación virtual de 
                                            cincuenta (50) horas.
                                            <br />
                                                Para empresas de diez (10) o menos trabajadores clasificadas en Riesgo IV y V, podrá ser
                                            realizado por un Profesional en Salud Ocupacional o Seguridad y Salud en el Trabajo, 
                                            profesional con posgrado en Seguridad y Salud en el Trabajo, con licencia en Salud 
                                            Ocupacional o Seguridad y Salud en el Trabajo vigente y que acrediten la aprobación 
                                            del curso de capacitación virtual de cincuenta (50) horas.
                                            <br />
                                                La persona que diseñe, ejecute e implemente el Sistema de Gestión de Seguridad y Salud 
                                            en el Trabajo tenga la formación y cursos solicitada en los artículos 5 y 6 de la 
                                            presente resolución.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento1" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion1" runat="server" Text="-"></asp:Label>
                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documento en el que consta la designación del responsable del SG-SST, las 
                                            responsabilidades asignadas que se le asignaron Certificados que lo acrediten como 
                                            responsable del SG-SST :
                                            <br />
                                                <ul>
                                                    <li>Titulo de Formación Académica</li>
                                                    <li>Licencia en SST</li>
                                                    <li>Curso de 50 Horas en SG-SST</li>
                                                </ul>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.1.2
                                                <br />
                                                La empresa asignó y documentó las responsabilidades específicas en el Sistema de 
                                                Gestión de Seguridad y Salud en el Trabajo a todos los niveles de la organización, 
                                                para la implementación y mejora continua del Sistema de Gestión de Seguridad y Salud 
                                                en el Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento2" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion2" runat="server" Text="-"></asp:Label>
                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Matriz de responsabilidades a todos  los niveles de la organización 
                                                (Alta Dirección, Mandos Medios, Trabajadores, Copasst, Brigadistas)
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.1.3
                                                <br />
                                                La empresa define y asigna los recursos financieros, humanos, técnicos y 
                                                tecnológicos, requeridos para la implementación, mantenimiento y continuidad 
                                                del Sistema de Gestión de Seguridad y Salud en el Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento3" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion3" runat="server" Text="-"></asp:Label>
                                        </td>
                                        <td class="text-left">Formato para el registro de los recursos financieros necesarios (Descripción, cantidad, 
                                            proveedor, costos) y montos aprobados por la Empresa para el SG-SST, así como los 
                                            recursos humanos, técnicos y tecnológicos, requeridos para la 
                                            implementación del SG-SST
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.1.4
                                                <br />
                                                Todos los trabajadores, independientemente de su forma de vinculación o contratación
                                                están afiliados al Sistema General de Riesgos Laborales y el pago de los aportes se
                                                realiza conforme a la normativa y en la respectiva clase de riesgo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento4" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion4" runat="server" Text="-"></asp:Label>
                                        </td>
                                        <td class="text-left">Registro de afiliación al Sistema de Gestión de Riesgos Laborales
                                            <br />
                                            Planilla de pago de aportes a la seguridad social de los cuatro (4) meses anteriores a 
                                            la fecha de verificación
                                            <br />
                                            Lista de los trabajadores vinculados por prestación de servicios a la fecha y comparar 
                                            con la última planilla de pago de aportes a la seguridad social suministrada por los 
                                            contratistas                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.1.5
                                                <br />
                                                Si aplica, se tienen plenamente identificados los trabajadores que se dediquen en 
                                                forma permanente al ejercicio de las actividades de alto riesgo establecidas en el
                                                Decreto 2090 de 2003 o de las normas que lo adicionen, modifiquen o complementen y 
                                                se les está cotizando el monto establecido en la norma al Sistema de Pensiones.
                                                <br />
                                                Verificar si la empresa con la asistencia de la Administradora de Riesgos Laborales 
                                                está cumpliendo con lo establecido en la presente resolución para actividades de 
                                                alto riesgo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento5" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion5" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">Establecer el Formato para identificar  los trabajadores que se dediquen en forma 
                                            permanente a las actividades de alto riesgo a las que hace referencia el Decreto 2090 
                                            de 2003 :
                                            <br />
                                            <ul>
                                                <li>Trabajos en minería que impliquen prestar el servicio en socavones o en subterráneos.</li>
                                                <li>Trabajos que impliquen la exposición a altas temperaturas, por encima de los valores límites permisibles, determinados por las normas técnicas de salud de salud ocupacional.</li>
                                                <li>Trabajos con exposición a radiaciones ionizantes.</li>
                                                <li>Trabajos con exposición a sustancias comprobadamente cancerígenas</li>
                                                <li>Controladores de Tráfico aéreo</li>
                                                <li>Bomberos con actuación en extinción de incendios</li>
                                                <li>Personal dedicado a la custodia y vigilancia</li>
                                                <li>Personal del cuerpo técnico de investigación de la Fiscalía</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.1.6
                                                <br />
                                                La empresa cuenta, de acuerdo con el número de trabajadores con:
                                                <br />
                                                Vigía en Seguridad y Salud en el Trabajo para empresas de menos de diez (10) de
                                                trabajadores.
                                                <br />
                                                Comité Paritario en Seguridad y Salud en el Trabajo para empresas de diez (10) o 
                                                más trabajadores.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento6" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion6" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">Soportes de la designación del vigía de seguridad y salud en el trabajo
                                            <br />
                                            Registros del Proceso de convocatoria, elección, conformación del Comité Paritario de
                                            Seguridad y Salud en el Trabajo y el acta de constitución
                                            <br />
                                            Actas de   Reunión del Copasst del último año.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.1.7
                                                <br />
                                                El Vigía en Seguridad y Salud en el Trabajo y los miembros del Comité Paritario en 
                                                Seguridad y Salud en el Trabajo y sus respectivos miembros (Principales y Suplentes)
                                                se encuentran capacitados para poder cumplir las responsabilidades que les asigna 
                                                la ley.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento7" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion7" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Registro de porcentaje de asistencia a las capacitaciones, capacitaciones especificas
                                                en materia de seguridad y salud en el trabajo al vigia y a los miembros del COPASST
                                            </p>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.1.7
                                                <br />
                                                La empresa conformó el Comité de Convivencia Laboral y este funciona de acuerdo 
                                                con la normativa vigente.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento8" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion8" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documento de conformación del Comité de Convivencia Laboral y actas de reuniones
                                                ( como mínimo 1 reunión cada 3 meses)
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E1.2 Estándar: Capacitación en el Sistema de Gestión de Seguridad y Salud en el Trabajo (6 %)</th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.2.1
                                                <br />
                                                Se cuenta con un programa de capacitación anual en promoción y prevención, que 
                                                incluye los peligros/riesgos prioritarios, extensivo a todos los niveles de la 
                                                organización y el mismo se ejecuta.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento9" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion9" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Programa de Capacitación que incluye el compendio de temas alineados a la Matriz de 
                                            Peligros
                                            <br />
                                                Matriz de identificación de peligros
                                            <br />
                                                Programa de Capacitación Anual Aprobado por el Copasst o el Vigía 
                                            <br />
                                                Porcentaje de cumplimiento de asistencia a las capacitaciones
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.2.2
                                                <br />
                                                Todos los trabajadores, independientemente de su forma de vinculación y/o 
                                                contratación y de manera previa al inicio de sus labores, reciben capacitación, 
                                                inducción y reinducción en aspectos generales y específicos de las actividades 
                                                por realizar que incluya entre otros, la identificación de peligros y control de 
                                                los riesgos en su trabajo, y la prevención de accidentes de trabajo y enfermedades 
                                                laborales.
                                                <br />
                                                Asimismo, se proporcionan las capacitaciones en Seguridad y Salud en el Trabajo de
                                                acuerdo con las necesidades identificadas.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento10" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion10" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">Registro de porcentaje de asistencia a las capacitaciones
                                            <br />
                                            Programa de Capacitación (inducción o reinducción)
                                            <br />
                                            Formatos de inducción y reinducción
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 1.2.3
                                                <br />
                                                Los responsables del Sistema de Gestión de Seguridad y Salud en el Trabajo cuentan 
                                                con el certificado de aprobación del curso de capacitación virtual de cincuenta 
                                                (50) horas definido por el Ministerio del Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento11" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion11" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Certificado del Curso de 50 horas definido por el Ministerio de Trabajo, expedido a
                                                nombre del responsable del Sistema de Gestión de Seguridad y Salud en el Trabajo
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>ESTÁNDAR 2 – GESTIÓN INTEGRAL DEL SISTEMA DE LA SEGURIDAD Y SALUD EN EL TRABAJO (15%)
                                            <br />
                                            E2.1 Estándar: Política de Seguridad y Salud en el Trabajo (1 %)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.1.1
                                                <br />
                                                En el Sistema de Gestión de Seguridad y Salud en el Trabajo (SG-SST) se establece 
                                                por escrito la Política de Seguridad y Salud en el Trabajo, es comunicada al Comité 
                                                Paritario de Seguridad y Salud en el Trabajo o al Vigía de Seguridad y Salud en el 
                                                Trabajo.
                                                <br />
                                                La Política es fechada y firmada por el representante legal, expresa el compromiso
                                                de la alta dirección, el alcance sobre todos los centros de trabajo y todos sus 
                                                trabajadores independientemente de su forma vinculación y/o contratación, es 
                                                revisada, como mínimo una vez al año, hace parte de las políticas de gestión 
                                                de la empresa, se encuentra difundida y accesible para todos los niveles de la
                                                organización.
                                                <br />
                                                Incluye como mínimo el compromiso con:
                                                <br />
                                                La identificación de los peligros, evaluación y valoración de los riesgos y establece los respectivos 
                                                controles.
                                                <br />
                                                Proteger la seguridad y salud de todos los trabajadores, mediante la mejora continua
                                                <br />
                                                El cumplimiento de la normativa vigente aplicable en materia de riesgos laborales.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento12" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion12" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documento de Política del SG-SST por escrito, fechada y firmada por el 
                                                representante legal actual y comunicada al COPASST 
                                                <br />
                                                Encuesta para indagar sobre el conocimiento de la Política
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.2 Estándar: Objetivos del Sistema de Gestión de Seguridad y Salud en el Trabajo SG-SST (1 %)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.2.1
                                                <br />
                                                Están definidos los objetivos del Sistema de Gestión de Seguridad y Salud en el 
                                                Trabajo y ellos se expresan de conformidad con la política de Seguridad y Salud 
                                                en el Trabajo, son claros, medibles, cuantificables y tienen metas, coherentes 
                                                con el plan de trabajo anual, compatibles con la normativa vigente, se encuentran 
                                                documentados, son comunicados a los trabajadores, son revisados y evaluados 
                                                mínimo una vez al año, actualizados de ser necesario, están acordes a las 
                                                prioridades definidas y se encuentran firmados por el empleador.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento13" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion13" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Objetivos del SG-SST que cumplan con las condiciones mencionadas en el criterio
                                                <br />
                                                Encuesta para determinar el conocimiento de los objetivos, como evidencia del 
                                                proceso de difusión de los mismos
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.3 Estándar: Evaluación inicial del Sistema de Gestión – Seguridad y Salud en el Trabajo (1%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.3.1
                                                <br />
                                                La empresa realizó la evaluación inicial del Sistema de Gestión de Seguridad y Salud
                                                en el Trabajo, identificando las prioridades para establecer el plan de trabajo 
                                                anual o para la actualización del existente y fue realizada por el responsable 
                                                del Sistema de Gestión de Seguridad y Salud en el Trabajo o si fue contratada, 
                                                por la empresa con personal externo con licencia en Salud Ocupacional o Seguridad
                                                y Salud en el Trabajo o conforme, verificando que la persona que diseñe, ejecute e 
                                                implemente el Sistema de Gestión de Seguridad y Salud en el Trabajo tenga la 
                                                formación y cursos solicitada en los artículos 5° y 6° de la presente resolución.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento14" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion14" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                El sistema en su evaluación inicial presenta: 
                                                <br />
                                                Documento de autoevaluación que comprende : Matriz de peligros, Matriz Legal, 
                                                identificación de amenazas a través del análisis de vulnerabilidad, reporte de los
                                                trabajadores para evaluar la efectividad de las medidas implementadas, inspecciones,
                                                porcentaje de cumplimiento de capacitaciones, listado de asistencia a 
                                                capacitaciones, vigilancia epidemiológica, descripción sociodemográfica, 
                                                indicadores definidos por la empresa, estadística de accidentalidad.
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.4 Estándar: Plan Anual de Trabajo (2%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.4.1
                                                <br />
                                                La empresa diseña y define un plan de trabajo anual para el cumplimiento del Sistema
                                                de Gestión de Seguridad y Salud en el Trabajo, el cual identifica los objetivos, 
                                                metas, responsabilidades, recursos, cronograma de actividades y debe estar firmado 
                                                por el empleador y el responsable del Sistema de Gestión de Seguridad y Salud en el
                                                Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento15" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion15" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Plan de Trabajo Anual el cual identifica metas, responsabilidades, recursos, 
                                                cronograma de actividades, firmado por el empleador y el responsable del SG-SST. 
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.5 Estándar: Conservación de la documentación (2%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.5.1
                                                <br />
                                                La empresa cuenta con un sistema de archivo o retención documental, para los 
                                                registros y documentos que soportan el Sistema de Gestión de Seguridad y Salud 
                                                en el Trabajo
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento16" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion16" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Constatar la existencia de un sistema de archivo o retención documental, para los 
                                                registros y documentos que soportan el Sistema de Gestión de Seguridad y Salud en 
                                                el Trabajo, protegidos contra daño o perdida
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.6 Estándar: Rendición de cuentas (1%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.5.1
                                                <br />
                                                Quienes tengan responsabilidad sobre el Sistema de Gestión de Seguridad y Salud en 
                                                el Trabajo rinden cuentas anualmente sobre su desempeño.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento17" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion17" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documento de Rendición de cuentas anual  aplicable a todos los niveles de la Empresa
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.7 Estándar: Normativa nacional vigente y aplicable en materia de Seguridad y Salud en el Trabajo. (2%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.7.1
                                                <br />
                                                La empresa define la matriz legal actualizada que contemple las normas del Sistema 
                                                General de Riesgos Laborales aplicables a la empresa.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento18" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion18" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Matriz Legal en la cual se contemple la legislación nacional vigente en materia 
                                                de riesgos laborales.
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.8 Estándar: Mecanismos de Comunicación. (1%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.8.1
                                                <br />
                                                La empresa dispone de mecanismos eficaces para recibir y responder las comunicaciones
                                                internas y externas relativas a la Seguridad y Salud en el Trabajo, como por ejemplo
                                                auto reporte de condiciones de trabajo y de salud por parte de los trabajadores o 
                                                contratistas.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento19" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion19" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Registro con los mecanismos para recibir, documentar y responder a las 
                                                comunicaciones, así como los reportes de los trabajadores 
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.9 Estándar: Adquisiciones (1%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.9.1
                                                <br />
                                                La empresa estableció un procedimiento para la identificación y evaluación de las 
                                                especificaciones en Seguridad y Salud en el Trabajo, de las compras y adquisición 
                                                de productos y servicios, como por ejemplo los elementos de protección personal.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento20" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion20" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Matriz de EPP
                                                <br />
                                                Inventario de EPP
                                                <br />
                                                Procedimiento para la identificación y evaluación de las especificaciones en SST
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.10 Estándar: Contratación (2%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.10.1
                                                <br />
                                                La empresa incluye los aspectos de Seguridad y Salud en el Trabajo en la evaluación
                                                y selección de proveedores y contratistas.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento21" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion21" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Manual de validación para seleccionar proveedores y/o contratistas
                                                <br />
                                                Matriz de evaluación de proveedores o contratistas 
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E2.11 Estándar: Gestión del cambio (1%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-aqua color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-aqua color-palette">PLANEAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 2.11.1
                                                <br />
                                                La empresa dispone de un procedimiento para evaluar el impacto sobre la Seguridad y 
                                                Salud en el Trabajo que se pueda generar por cambios internos o externos.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento22" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion22" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Formato de la Gestión del cambio para evaluar el impacto sobre la Seguridad y Salud 
                                                en el Trabajo en cambios internos y externos que se presenten en la entidad.
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>ESTÁNDAR 3 – GESTIÓN DE LA SALUD (20%)
                                            <br />
                                            E3.1 Estándar: Condiciones de salud en el trabajo (9 %)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-green color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.1
                                                <br />
                                                Hay como mínimo, la siguiente información actualizada de todos los trabajadores, 
                                                del último año: la descripción socio demográfica de los trabajadores (edad, sexo, 
                                                escolaridad, estado civil), la caracterización de sus condiciones de salud, la 
                                                evaluación y análisis de las estadísticas sobre la salud de los trabajadores 
                                                tanto de origen laboral como común, y los resultados de las evaluaciones médicas 
                                                ocupacionales.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento23" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion23" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Descripción Sociodemográfica  de los trabajadores
                                                <br />
                                                Evaluaciones médicas ocupacionales
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.2
                                                <br />
                                                Están definidas y se llevaron a cabo las actividades de medicina del trabajo, 
                                                promoción y prevención, de conformidad con las prioridades que se identificaron 
                                                en el diagnóstico de las condiciones de salud de los trabajadores y los 
                                                peligros/riesgos de intervención prioritarios
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento24" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion24" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Programa de Vigilancia Epidemiológica
                                                <br />
                                                Actividades de medicina del trabajo, promoción y prevención
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.3
                                                <br />
                                                Se informa al médico que realiza las evaluaciones ocupacionales los perfiles del 
                                                cargo, con una descripción de las tareas y el medio en el cual se desarrollará la 
                                                labor respectiva.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento25" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion25" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Formato para registra el perfil del cargo de los trabajadores y definir un mecanismo
                                                de entrega de esta documentación al médico.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.4
                                                <br />
                                                Se realizan las evaluaciones médicas de acuerdo con la normativa y los peligros a 
                                                los cuales se encuentre expuesto el trabajador.
                                                <br />
                                                Asimismo, se tiene definida la frecuencia de las evaluaciones médicas ocupacionales 
                                                periódicas según tipo, magnitud, frecuencia de exposición a cada peligro, el estado 
                                                de salud del trabajador, las recomendaciones de los sistemas de vigilancia 
                                                epidemiológica y la legislación vigente.
                                                <br />
                                                Los resultados de las evaluaciones médicas ocupacionales serán comunicados por 
                                                escrito al trabajador y constarán en su historia médica.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento26" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion26" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documento de correspondencia entre las evaluaciones médicas y los peligros a los que se encuentra 
                                                expuesto el trabajador
                                                <br />
                                                Documento para el Registro de las evaluaciones médicas periódicas
                                                <br />
                                                Documento de Registro que haga constar el recibido de los resultados de las evaluaciones médicas por
                                                parte del trabajador
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.5
                                                <br />
                                                La empresa debe tener la custodia de las historias clínicas a cargo de una 
                                                institución prestadora de servicios en Seguridad y Salud en el Trabajo o del médico
                                                que practica los exámenes laborales en la empresa.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento27" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion27" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documentos de soporte para demostrar la custodia de las historias clínicas 
                                                de los trabajadores
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.6
                                                <br />
                                                La empresa acata las restricciones y recomendaciones médico-laborales por parte de 
                                                la Empresa Promotora de Salud (EPS) o Administradora de Riesgos Laborales (ARL) 
                                                prescritas a los trabajadores para la realización de sus funciones.
                                                <br />
                                                Asimismo, y de ser necesario, se adecua el puesto de trabajo, se reubica al 
                                                trabajador o realiza la readaptación laboral.
                                                <br />
                                                Se anexa soportes de entrega a quienes califican en primera oportunidad y/o a las 
                                                Juntas de Calificación de Invalidez los documentos que son responsabilidad del 
                                                empleador que trata la norma para la calificación de origen y porcentaje de la 
                                                pérdida de la capacidad laboral.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento28" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion28" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documento de reubicación laboral
                                                <br />
                                                Documento de readaptación laboral
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.7
                                                <br />
                                                Hay un programa para promover entre los trabajadores estilos de vida y entorno 
                                                saludable, incluyendo campañas específicas tendientes a la prevención y el control 
                                                de la farmacodependencia, el alcoholismo y el tabaquismo, entre otros.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento29" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion29" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Programa para promover estilos de vida y entornos saludables
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.8
                                                <br />
                                                En la sede hay suministro permanente de agua potable, servicios sanitarios y 
                                                mecanismos para disponer excretas y basuras.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento30" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion30" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                En el reporte de los trabajadores se evidencia la existencia de agua potable  y el 
                                                estado de los servicios sanitarios.
                                                <br />
                                                Registros de análisis del agua para consumo humano y pruebas fotográficas o 
                                                fílmicas de las instalaciones sanitarias
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.1.9
                                                <br />
                                                La empresa elimina los residuos sólidos, líquidos o gaseosos que se producen, así 
                                                como los residuos peligrosos de forma que no se ponga en riesgo a los trabajadores.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento31" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion31" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Registros fotográficos probatorios y el documento escaneado del contrato con la 
                                                empresa que elimina y dispone de los residuos peligrosos
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E3.2 Estándar: Registro, reporte e investigación de las enfermedades laborales, incidentes y accidentes del trabajo (5%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-green color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>

                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.2.1
                                                <br />
                                                La empresa reporta a la Administradora de Riesgos Laborales (ARL), a la Entidad 
                                                Promotora de Salud (EPS) todos los accidentes y las enfermedades laborales 
                                                diagnosticadas.
                                                <br />
                                                Asimismo, reportará a la Dirección Territorial el accidente grave y mortal, como las
                                                enfermedades diagnosticadas como laborales
                                                <br />
                                                Estos reportes se realizarán dentro de los dos (2) días hábiles siguientes al 
                                                evento o recibo del diagnóstico de la enfermedad.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento32" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion32" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Registro de accidente y enfermedad laboral 
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.2.2
                                                <br />
                                                La empresa investiga todos los accidentes e incidentes de trabajo y las enfermedades
                                                cuando sean diagnosticadas como laborales, determinando las causas básicas e 
                                                inmediatas y la posibilidad de que se presenten nuevos casos.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento33" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion33" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Formato Investigación de Accidente de Trabajo
                                                <br />
                                                Formato Investigación de Enfermedad laboral
                                                <br />
                                                Constatar que la investigación se haya realizado dentro de los quince (15) días 
                                                siguientes a su ocurrencia a través del equipo investigador y evidenciar que se 
                                                hayan remitido los informes de las investigaciones de accidente de trabajo grave o 
                                                mortal o una enfermedad laboral mortal.
                                                <br />
                                                En caso de haber accidente grave o se produzca la muerte verificar la participación
                                                de un profesional con licencia Salud Ocupacional o en Seguridad y Salud en el Trabajo
                                                en la investigación (propio o contratado), así como del Comité Paritario o Vigía de
                                                Seguridad y Salud en el Trabajo.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.2.3
                                                <br />
                                                Hay un registro estadístico de los incidentes y de los accidentes de trabajo, así 
                                                como de las enfermedades laborales que ocurren; se analiza este registro y las 
                                                conclusiones derivadas del estudio son usadas para el mejoramiento del Sistema
                                                de Gestión de Seguridad y Salud en el Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento34" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion34" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Estadísticas de accidentes, incidentes y enfermedades laborales
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E3.3 Estándar: Mecanismos de vigilancia de las condiciones de salud de los trabajadores (6%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-green color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.3.1
                                                <br />
                                                La empresa mide la severidad de los accidentes de trabajo como mínimo una vez al 
                                                año y realiza la clasificación del origen del peligro/riesgo que los generó 
                                                (físicos, químicos, biológicos, de seguridad, públicos, psicosociales, 
                                                entre otros).
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento35" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion35" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Indicadores de accidentalidad
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.3.2
                                                <br />
                                                La empresa mide la frecuencia de los accidentes e incidentes de trabajo y enfermedad
                                                laboral como mínimo una vez al año y realiza la clasificación del origen del
                                                peligro/riesgo que los generó (físicos, químicos, biológicos, seguridad, públicos, 
                                                psicosociales, entre otros.)
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento36" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion36" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Indicadores de accidentalidad
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.3.3
                                                <br />
                                                La empresa mide la mortalidad por accidentes de trabajo y enfermedades laborales 
                                                como mínimo una vez al año y realiza la clasificación del origen del peligro/riesgo
                                                que los generó (físicos, químicos, biológicos, de seguridad, públicos, psicosociales,
                                                entre otros)
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento37" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion37" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>Indicadores de accidentalidad</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.3.4
                                                <br />
                                                La empresa mide la prevalencia de la enfermedad laboral como mínimo una vez al año
                                                y realiza la clasificación del origen del peligro/riesgo que la generó 
                                                (físico, químico, biológico, ergonómico o biomecánico, psicosocial, entre otros)
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento38" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion38" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Indicadores de enfermedad laboral
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.3.5
                                                <br />
                                                La empresa mide la incidencia de la enfermedad laboral como mínimo una vez al año y 
                                                realiza la clasificación del origen del peligro/riesgo que la generó 
                                                (físicos, químicos, biológicos, ergonómicos o biomecánicos, psicosociales, entre 
                                                otros)
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento39" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion39" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>Indicadores de enfermedad laboral</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 3.3.6
                                                <br />
                                                La empresa mide el ausentismo por enfermedad laboral y común y por accidente de 
                                                trabajo, como mínimo una vez al año y realiza la clasificación del origen del
                                                peligro/riesgo que lo generó (físicos, ergonómicos, o biomecánicos, químicos, de 
                                                seguridad, públicos, psicosociales, entre otros)
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento40" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion40" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Indicadores de enfermedad laboral y accidentalidad
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>ESTÁNDAR 4. GESTIÓN DE PELIGROS Y RIESGOS (30%)
                                            <br />
                                            E4.1 Estándar: Identificación de peligros, evaluación y valoración de los riesgos (15%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-green color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.1.1
                                                <br />
                                                La empresa tiene definida y aplica una metodología para la identificación de peligros
                                                y evaluación y valoración de los riesgos de origen físico, ergonómico o biomecánico,
                                                biológico, químico, de seguridad, público, psicosocial, entre otros, con alcance 
                                                sobre todos los procesos, actividades rutinarias y no rutinarias, maquinaria y 
                                                equipos en todos los centros de trabajo y en todos los trabajadores 
                                                independientemente de su forma de vinculación y/o contratación.
                                                <br />
                                                Identificar con base en la valoración de los riesgos, aquellos que son prioritarios
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento41" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion41" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Matriz de evaluación de Riesgos, identificación de peligros, evaluación y valoración
                                                de los riesgos, con alcance sobre todos los procesos, actividades rutinarias y no
                                                rutinarias y con la participación de los trabajadores
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.1.2
                                                <br />
                                                La identificación de peligros, evaluación y valoración del riesgo se desarrolló con
                                                la participación de trabajadores de todos los niveles de la empresa y es actualizada
                                                como mínimo una vez al año y cada vez que ocurra un accidente de trabajo mortal o un
                                                evento catastrófico en la empresa o cuando se presenten cambios en los procesos, en 
                                                las instalaciones, o maquinaria o equipos.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento42" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion42" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Reporte de los trabajadores de las condiciones de seguridad
                                                <br />
                                                Formato para la identificación de los peligros con la firma de participación 
                                                de los trabajadores
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.1.3
                                                <br />
                                                La empresa donde se procese, manipule o trabaje con agentes o sustancias catalogadas
                                                como carcinógenas o con toxicidad aguda, causantes de enfermedades, incluidas en la
                                                tabla de enfermedades laborales, prioriza los riesgos asociados a estas sustancias
                                                o agentes y realiza acciones de prevención e intervención al respecto.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento43" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion43" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Registros de los datos técnicos de los productos químicos 
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.1.4
                                                <br />
                                                Se realizan mediciones ambientales de los riesgos prioritarios, provenientes de 
                                                peligros químicos, físicos y/o biológicos.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento44" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion44" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Registros de las mediciones ambientales ( Evaluación de niveles de ruido, 
                                                temperatura, ventilación, iluminación, entre otras)
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>E4.2 Estándar: Medidas de prevención y control para intervenir los peligros/riesgos (15%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-green color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.2.1
                                                <br />
                                                Se implementan las medidas de prevención y control con base en el resultado de la
                                                identificación de peligros, la evaluación y valoración de los riesgos (físicos, 
                                                ergonómicos, biológicos, químicos, de seguridad, públicos, psicosociales, entre 
                                                otros), incluidos los prioritarios y éstas se ejecutan acorde con el esquema de 
                                                jerarquización, de ser factible priorizar la intervención en la fuente y en el 
                                                medio.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento45" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion45" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Medidas de prevención y control de conformidad con la identificación de los peligros,
                                                la evaluación y valoración de los riesgos (físicos, ergonómicos, biológicos, 
                                                químicos, de seguridad, públicos, psicosociales, entre otros), y que dichas medidas
                                                se encuentren programadas en el plan anual de trabajo.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.2.2
                                                <br />
                                                Se verifica la aplicación por parte de los trabajadores de las medidas de prevención
                                                y control de los peligros /riesgos (físicos, ergonómicos, biológicos, químicos, de 
                                                seguridad, públicos, psicosociales, entre otros).
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento46" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion46" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Formato de inspección para verificar el cumplimiento de las responsabilidades de los
                                                trabajadores frente a la aplicación de las medidas de prevención y control de los
                                                peligros/riesgos
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.2.3
                                                <br />
                                                La empresa para los peligros identificados ha estructurado programa de prevención y 
                                                protección de la seguridad y salud de las personas (incluye procedimientos,
                                                instructivos, fichas técnicas).
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento47" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion47" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Desarrollar un programa de prevención y protección de la seguridad y salud de las 
                                                personas (incluye procedimientos, instructivos, fichas técnicas).
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.2.4
                                                <br />
                                                Se realizan inspecciones sistemáticas a las instalaciones, maquinaria o equipos, 
                                                incluidos los relacionados con la prevención y atención de emergencias; con la 
                                                participación del Comité Paritario o Vigía de Seguridad y Salud en el Trabajo
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento48" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion48" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Registros de inspecciones por puesto de trabajo, equipos de protección personal, 
                                                medios de escape, extintores, botiquín de primeros auxilios con la participación 
                                                del Comité Paritario o Vigía de Seguridad y Salud en el Trabajo.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.2.5
                                                <br />
                                                Se realiza el mantenimiento periódico de las instalaciones, equipos y herramientas,
                                                de acuerdo con los informes de las inspecciones o reportes de condiciones inseguras.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento49" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion49" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Registros de las actividades de mantenimiento aplicado a las instalaciones y equipos,
                                                informes de inspecciones o reportes de condiciones inseguras

                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 4.2.6
                                                <br />
                                                Se les suministran a los trabajadores que lo requieran los Elementos de Protección
                                                Personal y se les reponen oportunamente conforme al desgaste y condiciones de uso de
                                                los mismos.
                                                <br />
                                                Se verifica que los contratistas y subcontratistas que tengan trabajadores realizando
                                                actividades en la empresa, en su proceso de producción o de prestación de servicios
                                                se les entrega los Elementos de Protección Personal y se hace reposición 
                                                oportunamente conforme al desgaste y condiciones de uso de los mismos.
                                                <br />
                                                Se realiza la capacitación para el uso de los Elementos de Protección Personal
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento50" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion50" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Formato para la inspección de Elementos de Protección Personal por áreas
                                                <br />
                                                Inspección para el control del uso y estado de los Elementos de Protección Personal
                                                <br />
                                                Planilla de Registro para la entrega de los elementos de protección personal 
                                                <br />
                                                Plan de capacitación en Seguridad y Salud en el Trabajo que incluye sugerencia de 
                                                temas en uso y mantenimiento  de equipos de protección personal
                                                <br />
                                                Formato para el registro de asistencia a los talleres de capacitación
                                                <br />
                                                Formato para el registro de inventario de Equipos de Protección Personal 
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>ESTÁNDAR 5. GESTIÓN DE AMENAZAS (10%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-green color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 5.1.1
                                                <br />
                                                Se tiene un plan de prevención, preparación y respuesta ante emergencias que 
                                                identifica las amenazas, evalúa y analiza la vulnerabilidad, incluye planos de las 
                                                instalaciones que identifican áreas y salidas de emergencia, así como la señalización
                                                debida, simulacros como mínimo una vez al año y este es divulgado. Se tienen en 
                                                cuenta todas las jornadas de trabajo en todos los centros de trabajo
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento51" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion51" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Plan de prevención, preparación y respuesta ante emergencias
                                                <br />
                                                Análisis de Vulnerabilidad
                                                <br />
                                                Diseño de Planos
                                                <br />
                                                Señalización
                                                <br />
                                                Simulacros
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-green color-palette">HACER</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 5.1.2
                                                <br />
                                                Se encuentra conformada, capacitada y dotada la brigada de prevención, preparación
                                                y respuesta ante emergencias, organizada según las necesidades y el tamaño de la 
                                                empresa (primeros auxilios, contra incendios, evacuación, etc.).
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento52" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion52" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Conformación de Brigadas de Emergencia (estructura, funciones y actividades)
                                                <br />
                                                Plan de Capacitación
                                                <br />
                                                Formato para el registro de asistencia a los talleres de capacitación
                                                <br />
                                                Registros de Dotación

                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>ESTÁNDAR 6. VERIFICACIÓN DEL SISTEMA DE GESTIÓN EN SEGURIDAD Y SALUD EN EL TRABAJO (5%)
                                            <br />
                                            E6.1 Estándar: Gestión y resultados del Sistema de Gestión de Seguridad y Salud en el Trabajo (5%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-red color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-red color-palette">VERIFICAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 6.1.1
                                                <br />
                                                El empleador tiene definidos los indicadores de estructura, proceso y resultado del
                                                Sistema de Gestión de Seguridad y Salud en el Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento53" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion53" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>Ficha técnica de los indicadores del SG-SST (indicador de estructura, proceso y resultado) </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-red color-palette">VERIFICAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 6.1.2
                                                <br />
                                                El empleador debe realizar una auditoría anual, la cual será planificada con la 
                                                participación del Comité Paritario o Vigía de Seguridad y Salud en el Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento54" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion54" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Programa de auditoria interna anual al SG-SST con la participación del Comité 
                                                Paritario o Vigía de Seguridad y Salud en el Trabajo.
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-red color-palette">VERIFICAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 6.1.3
                                                <br />
                                                Alcance de la auditoría de cumplimiento del Sistema de Gestión de Seguridad y Salud
                                                en el Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento55" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion55" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documentos de registro Listado de Cumplimiento de la realización de actividades y 
                                                obligaciones establecidas en los trece numerales del artículo 2.2.4.6.30 del 
                                                Decreto 1072/2015

                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-red color-palette">VERIFICAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 6.1.4
                                                <br />
                                                La Alta Dirección revisa una vez al año el Sistema de Gestión de Seguridad y Salud
                                                en el Trabajo; sus resultados son comunicados al Comité Paritario de Seguridad y 
                                                Salud en el Trabajo o al Vigía de Seguridad y Salud en el Trabajo y al responsable
                                                del Sistema de Gestión de Seguridad y Salud en el Trabajo.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento56" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion56" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Documento de constancia de revisión anual por la alta dirección, dando cumplimiento
                                                a los 24 puntos del artículo  2.2.4.6.31
                                            </p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table class="table table-condensed bg-info color-palette" style="margin-bottom: 0px;">
                                <tbody class="text-left">
                                    <tr>
                                        <th>ESTÁNDAR 7. MEJORAMIENTO (10%)
                                            <br />
                                            E7.1 Estándar: Acciones preventivas y correctivas con base en los resultados del Sistema de Gestión de Seguridad y Salud en el Trabajo. (10%)
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed" style="margin-bottom: 0px;">
                                <tbody>
                                    <tr class="bg-purple color-palette">
                                        <th class="col-md-1 text-center">CICLO</th>
                                        <th class="col-md-5 text-center">ITEM DEL ESTÁNDAR</th>
                                        <th class="col-md-2 text-center">CUMPLIMIENTO</th>
                                        <th class="col-md-1 text-center">CALIFICACIÓN</th>
                                        <th class="col-md-3 text-center">EVIDENCIA</th>
                                    </tr>
                                    <tr>
                                        <td class="bg-purple color-palette">ACTUAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 7.1.1
                                                <br />
                                                Garantizar que se definan e implementen las acciones preventivas y/o correctivas 
                                                necesarias con base en los resultados de la supervisión, inspecciones, medición de 
                                                indicadores del SG-SST y las recomendaciones del COPASST o Vigía
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento57" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion57" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Formato de registro de las acciones preventivas y correctivas con base en los 
                                                resultados de la supervisión, en base a las inspecciones, la medición de los 
                                                indicadores del Sistema de Gestión de Seguridad y Salud en el Trabajo, 
                                                Recomendaciones del COPASST o Vigía

                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-purple color-palette">ACTUAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 7.1.2
                                                <br />
                                                Cuando después de la revisión por la Alta Dirección del Sistema de Gestión de 
                                                Seguridad y Salud en el Trabajo se evidencia que las medidas de prevención y control
                                                relativas a los peligros y riesgos en Seguridad y Salud en el Trabajo son inadecuadas
                                                o pueden dejar de ser eficaces, la empresa toma las medidas correctivas, preventivas
                                                y/o de mejora para subsanar lo detectado.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento58" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion58" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Formato de registro de las acciones preventivas y correctivas con base a la revisión 
                                                de la alta dirección
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-purple color-palette">ACTUAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 7.1.3
                                                <br />
                                                La empresa ejecuta las acciones preventivas, correctivas y de mejora que se 
                                                plantean como resultado de la investigación de los accidentes y de los incidentes
                                                y la determinación de las causas básicas e inmediatas de las enfermedades laborales.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento59" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion59" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Formato de registro de las acciones preventivas y correctivas con base  a los 
                                                resultado de la investigación de los accidentes y de los incidentes y la
                                                determinación de las causas básicas e inmediatas de las enfermedades laborales.

                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-purple color-palette">ACTUAR</td>
                                        <td class="text-left">
                                            <p>
                                                NÚMERAL 7.1.4
                                                <br />
                                                Se implementan las medidas y acciones correctivas producto de requerimientos o 
                                                recomendaciones de autoridades administrativas, así como de las Administradoras de
                                                Riesgos Laborales.
                                            </p>
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCumplimiento_SelectedIndexChanged" ID="ddlCumplimiento60" CssClass="form-control">
                                                <asp:ListItem Text="Seleccione..." Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                <asp:ListItem Text="No Cumple" Value="No_Cumple"></asp:ListItem>
                                                <asp:ListItem Text="Justifica" Value="Justifica"></asp:ListItem>
                                                <asp:ListItem Text="No Justifica" Value="No_Justifica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lbCalificacion60" runat="server" Text="-"></asp:Label>

                                        </td>
                                        <td class="text-left">
                                            <p>
                                                Plan de acción en base a los requerimientos o recomendaciones de las autoridades 
                                                administrativas ARL
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
                <script type="text/javascript" src="//www.google.com/jsapi"></script>
                <div class="col-md-10 col-md-offset-1">
                    <asp:Literal ID="ltReporte" runat="server"></asp:Literal>
                    <div id="chart_div"></div>
                </div>
                <asp:PlaceHolder runat="server" Visible="false">
                    <asp:Image alt="-" ID="ImgChart" runat="server" />
                </asp:PlaceHolder>
                <asp:HiddenField ID="rutaImg" runat="server"></asp:HiddenField>
                 

            </div>

            <div class="row text-center">
                <div class="col-md-4 col-md-offset-2">
                    <asp:ImageButton alt="-" ID="btnGenerar" runat="server" ImageUrl="~\ico\view.png"
                        OnClick="btnGenerar_Onclick" />
                    <h4>Generar Resultados</h4>
                </div>

                <asp:PlaceHolder ID="phGuardar" runat="server" Visible="false">
                    <div class="col-md-4">
                        <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento"
                            ValidationGroup="ValidationAdd" data-toggle="tooltip" data-placement="bottom"
                            title="Presione para generar el documento de Auto-Evaluación" />
                        <h4>Generar Documento</h4>
                    </div>
                </asp:PlaceHolder>
            </div>

        </ContentTemplate>

        <Triggers>
            <asp:PostBackTrigger ControlID="btnGuardar" />
            <asp:PostBackTrigger ControlID="btnGenerar" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
