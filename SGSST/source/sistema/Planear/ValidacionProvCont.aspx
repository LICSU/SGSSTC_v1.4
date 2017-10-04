<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ValidacionProvCont.aspx.cs" Inherits="SGSST.source.sistema.Planear.ValidacionProvCont" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="#">Validacion de Proveedores y Contratistas</a></li>
    </ol>
    
    <div class="page-header">
        <h1 class="text-center">Validacion de Proveedores y Contratistas</h1>
    </div>
    
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
        <CKEditor:CKEditorControl ID="txtValProvCont" BasePath="/ckeditor/" runat="server" Height="500px">
                <div class=WordSection1>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><span lang=ES
                                style='font-family:"Arial",sans-serif'>&nbsp;</span></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><b><span
                                lang=ES style='font-family:"Arial",sans-serif'>Objetivos Generales</span></b></p>

                                <p class=MsoNormal style='margin-left:7.1pt;text-align:justify;line-height:
                                150%'><span lang=ES style='font-family:"Arial",sans-serif'>Establecer los
                                requerimientos en Seguridad y Salud en el Trabajo para contratistas, subcontratistas
                                y proveedores, las adquisiciones deben realizarse en el marco del cumplimiento
                                de los requisitos en materia de Seguridad y Salud en el Trabajo, en base a esto
                                la Organización define un procedimiento que garantice la identificación y
                                evaluación en las especificaciones relativas a  las compras o adquisiciones de
                                productos y servicios, en relación con las disposiciones adscritas al Sistema
                                de Gestión de Seguridad y Salud en el Trabajo de la Empresa</span></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><span lang=ES
                                style='font-family:"Arial",sans-serif'>&nbsp;</span></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><b><span
                                lang=ES style='font-family:"Arial",sans-serif'>Objetivos Específicos</span></b></p>

                                <p class=MsoListParagraphCxSpFirst style='margin-left:21.3pt;text-align:justify;
                                text-indent:-14.2pt;line-height:150%'><span lang=ES style='font-family:Wingdings'>ü<span
                                style='font:7.0pt "Times New Roman"'> </span></span><span lang=ES
                                style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Explicar
                                las directrices y los requisitos de Seguridad y Salud en el Trabajo, que deben
                                cumplir los Proveedores, para cada una de las actividades realizadas en la
                                Organización, con el fin  de promover y garantizar la ejecución de las
                                actividades dentro de ambientes de trabajos seguros y saludables</span><span
                                lang=ES style='font-family:"Arial",sans-serif'>.</span></p>

                                <p class=MsoListParagraphCxSpLast style='margin-left:21.3pt;text-align:justify;
                                text-indent:-14.2pt;line-height:150%'><span lang=ES style='font-size:12.0pt;
                                line-height:150%;font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Promover el trabajo en equipo y garantizar una
                                comunicación oportuna y abierta entre  la Organización y los Proveedores, para
                                asegurar la aplicación de los requisitos y los estándares básicos de seguridad
                                y salud en el trabajo mediante una retroalimentación requerida para alcanzar
                                los resultados deseados</span></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><b><span
                                lang=ES style='font-family:"Arial",sans-serif'>Alcance</span></b></p>

                                <p class=MsoNormal style='margin-left:7.1pt;text-align:justify;line-height:
                                150%'><span lang=ES style='font-family:"Arial",sans-serif'>La Organización ha
                                adoptado un programa de selección, evaluación y Calificación de Proveedores de
                                forma que pueda darse preferencia a aquellos proveedores que implementen un
                                Sistema de Gestión de conformidad con la materia legal vigente.</span></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><span lang=ES
                                style='font-family:"Arial",sans-serif'>&nbsp;</span></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><b><span
                                lang=ES style='font-family:"Arial",sans-serif'>Responsabilidades de la
                                Organización  </span></b></p>

                                <p class=MsoListParagraphCxSpFirst style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Verificar
                                que los proveedores o contratistas tengan documentado e implementado el Sistema
                                de Gestión de Seguridad y Salud en el Trabajo y que conocen los
                                peligros/riesgos y la forma de controlarlos al ejecutar el servicio por
                                realizar en la empresa dónde prestan el servicio</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Verificar
                                previo al inicio del trabajo y periódicamente, el cumplimiento de la obligación
                                de afiliación al Sistema General de Riesgos Laborales considerando la rotación
                                del personal por parte de los proveedores</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Solicitar
                                a los Proveedores y Contratistas el certificado expedido por la ARL a la que se
                                encuentren afiliados, donde informe el porcentaje de implementación del Sistema
                                de Gestión de la Seguridad y Salud en el Trabajo en su empresa.</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Incluir
                                la solicitud de certificaciones de seguridad, componentes, guardas y límites
                                permisibles de peligros tales como ruido, vibraciones, exposición a químicos,
                                hojas de seguridad o fichas técnicas, estándares de seguridad en instalación,
                                manipulación, mantenimiento, dispositivos de protección, manual de
                                instrucciones y sistemas de seguridad.</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Procurar
                                canales de comunicación para la gestión de Seguridad y Salud en el Trabajo con
                                los proveedores, trabajadores cooperados y contratistas</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Informar
                                a los proveedores y contratistas al igual que a los trabajadores de este
                                último, previo al inicio del contrato, los peligros y riesgos generales y
                                específicos de su zona de trabajo y las medidas de prevención </span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Instruir
                                a los proveedores, trabajadores cooperados, contratistas y sus trabajadores o
                                subcontratistas, sobre el deber de informar acerca de los presuntos accidentes
                                de trabajo y  enfermedades laborales ocurridos durante el periodo de vigencia
                                del contrato </span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Verificar
                                periódicamente y durante el desarrollo de las actividades objeto del contrato,
                                el cumplimiento de la normatividad en Seguridad y Salud en el Trabajo por parte
                                de los proveedores, trabajadores cooperados, contratistas y sus trabajadores o
                                subcontratistas</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Revisar
                                y retroalimentar la información de los requisitos de seguridad y salud en el
                                trabajo entregados por los Proveedores y solicitar los cambios necesarios en
                                dichos requisitos para dar cumplimiento a la normativa</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Comunicar
                                la aprobación de los requisitos de seguridad y salud en el trabajo necesarios
                                para la ejecución de las actividades</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Autorizar
                                el ingreso del personal a los sitios de trabajo asignados, cuando se evidencie
                                cumplimiento de requisitos de seguridad y salud en el trabajo exigidos.    </span></p>

                                <p class=MsoListParagraphCxSpLast style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:Wingdings'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Hacer
                                inspecciones en los sitios de trabajo, con el propósito de evaluar el
                                cumplimiento de los requisitos de seguridad y salud en el trabajo exigidos para
                                las actividades realizadas  y en el caso de algún incumplimiento, definir el
                                plan de acción  requerido para lograr la conformidad en la aplicación de las
                                buenas prácticas de seguridad y salud en el trabajo durante la prestación del
                                servicio</span><span lang=ES style='font-family:"Arial",sans-serif'>.                                                      </span></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><b><span
                                lang=ES style='font-family:"Arial",sans-serif'>&nbsp;</span></b></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><b><span
                                lang=ES style='font-family:"Arial",sans-serif'>Responsabilidades de los
                                Proveedores</span></b></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><span lang=ES
                                style='font-family:"Arial",sans-serif'>&nbsp;</span></p>

                                <p class=MsoListParagraphCxSpFirst style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>1.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Conocer y aplicar las directrices de seguridad
                                y salud en el trabajo definidas en la política de la Organización para orientar
                                la toma de decisiones en el control de las condiciones de riesgo presentes
                                durante la prestación del servicio.</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>2.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Identificar  y controlar los peligros que se
                                puedan presentar durante la prestación del servicio </span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>3.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Definir el plan de acción para controlar los
                                peligros durante la prestación del servicio</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>4.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Entregar y asegurar el cumplimiento de los
                                requisitos de seguridad y salud en el trabajo solicitados por  la Organización
                                para la ejecución de las actividades, dentro de los tiempos definidos.      </span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>5.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Asistir a las inducciones, reuniones y
                                evaluaciones programadas por la Organización para garantizar la aplicación de
                                las buenas prácticas de seguridad y salud en el trabajo durante la prestación
                                de los servicios. </span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>6.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Disponer de los recursos humanos, técnicos y
                                financieros para la ejecución de las actividades de seguridad y salud en el
                                trabajo durante la prestación del servicio</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>7.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Realizar actividades de capacitación y
                                entrenamiento en seguridad y salud en el trabajo a su personal.       </span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>8.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>Responder a las solicitudes de mejoramiento
                                requeridas por la organización producto de los resultados obtenidos en las
                                auditorías o inspecciones.</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>9.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
                                </span></span><span lang=ES style='font-family:"Arial",sans-serif'> </span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Informar,
                                oportunamente, a la Organización sobre la ocurrencia de incidentes, accidentes
                                de trabajo, no conformidades y situaciones de seguridad y salud  en el trabajo
                                que puedan causar perjuicio al proveedor o a las instalaciones</span></p>

                                <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>10.<span style='font:7.0pt "Times New Roman"'> </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Realizar
                                la investigación de los accidentes de trabajo propios y de sus subcontratistas
                                e implementar los planes de intervención para el control de las causas.</span></p>

                                <p class=MsoListParagraphCxSpLast style='text-align:justify;text-indent:-18.0pt;
                                line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
                                font-family:"Arial",sans-serif'>11.<span style='font:7.0pt "Times New Roman"'> </span></span><span
                                lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Conocer
                                y cumplir todos los estándares de trabajo seguro publicado en cada sitio de
                                trabajo y presentados por la Organización                                                        </span></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><b><span
                                lang=ES style='font-family:"Arial",sans-serif'>&nbsp;</span></b></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><b><span
                                lang=ES style='font-family:"Arial",sans-serif'>Mecanismos  de Selección y
                                Evaluación de Proveedores</span></b></p>

                                <p class=MsoNormal style='text-align:justify;line-height:150%'><span lang=ES
                                style='font-family:"Arial",sans-serif'>&nbsp;</span></p>

                                <p class=MsoNormal style='margin-left:35.45pt;text-align:justify;text-indent:
                                -14.15pt;line-height:150%'><span lang=ES style='font-family:"Arial",sans-serif'>1.  El
                                responsable del SG-SST entrega al área de compras los requisitos mínimos en
                                seguridad y salud en trabajo, basados en la normatividad legal vigente en temas
                                de seguridad y salud en el trabajo y en el SG-SST de la organización.</span></p>

                                <p class=MsoNormal style='margin-left:35.45pt;text-align:justify;text-indent:
                                -14.15pt;line-height:150%'><span lang=ES style='font-family:"Arial",sans-serif'>2.  El
                                área de compras realiza la solicitud de dichos requisitos a los proveedores, la
                                información es revisada por el responsable del SG-SST de la organización, quien
                                aprueba el cumplimiento o no de los requerimientos solicitados</span></p>

                                <p class=MsoNormal style='margin-left:35.45pt;text-align:justify;text-indent:
                                -14.15pt;line-height:150%'><span lang=ES style='font-family:"Arial",sans-serif'>3.  El
                                área de compras selecciona los contratistas que cumplan con los requerimientos
                                anteriormente mencionados, tomando la decisión de contratación del proveedor
                                con base a las necesidades propias de la organización</span></p>

                                <p class=MsoNormal style='margin-left:35.45pt;text-align:justify;text-indent:
                                -14.15pt;line-height:150%'><span lang=ES style='font-family:"Arial",sans-serif'>4.  El
                                responsable del SG-SST informa al contratista y lo capacita en el cumplimiento
                                de estándares y procedimientos de seguridad al igual que en la identificación y
                                el control de los peligros y riesgos en su trabajo, en la prevención de
                                accidentes de trabajo y enfermedades laborales.</span></p>

                                <p class=MsoNormal style='margin-left:35.45pt;text-align:justify;text-indent:
                                -14.15pt;line-height:150%'><span lang=ES style='font-family:"Arial",sans-serif'>5.  El
                                responsable del SG-SST realiza el seguimiento al cumplimiento de las medidas de
                                SST por parte de la contratista y de forma anual revisará la actualización del
                                SG-SST del contratista </span></p>

                                </div>
        </CKEditor:CKEditorControl>
    </div>

    <hr /><br />
    <div class="row text-center">
        <div class="col-md-4 col-md-offset-4">
            <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
            <h4>Generar Documento</h4>
        </div>
    </div>


</asp:Content>
