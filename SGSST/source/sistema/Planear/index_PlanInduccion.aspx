<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PlanInduccion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_PlanInduccion" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="#">Plan de Inducción</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Plan de Inducción</h1>
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
            <div class="col-md-4 col-md-offset-4">
                <h4 class="text-center">Sucursal</h4>
                <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                </asp:DropDownList>

                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                    Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
                    runat="server" ValidationGroup="ValidationAdd" />
            </div>
        </asp:PlaceHolder>
    </div>

    <asp:PlaceHolder runat="server" ID="phCkeditor" Visible="false">
        <div class="row">

            <CKEditor:CKEditorControl Height="1000" ID="txtPlanInduccion" BasePath="~/ckeditor/" runat="server">
					<h3>Meta </h3>
					<br />
					Realizar inducción a la persona seleccionada para desempeñar un cargo en la organización, informándole con carácter previo al inicio de sus labores; 
					las actividades a realizar y las condiciones en que ésta se va a desarrollar, los riesgos a los que estará expuestos y las medidas de prevención. 
					
					<h3>Objetivos </h3>
					<br />
					<ul>
						<li>Definir las actividades y criterios necesarios para facilitar la integración del 
							nuevo trabajador a la cultura de prevención de la organización. </li>
						<li>Dar a conocer al trabajador las instalaciones de la empresa así como su proceso productivo o servicio.</li>
						<li>Habituar al trabajador de nuevo ingreso o reubicado de su actividad laboral, con el puesto donde desarrollará las nuevas actividades de trabajo, 
							indicándole los riesgos a los cuales se expone y la manera segura de desarrollar sus labores.</li>
						<li>Informar al trabajador sobre sus deberes y derechos dentro de la organización e indicarle la 
							existencia del Comité Paritario de Seguridad y Salud en el Trabajo.</li>
						<li>Asegurar el adiestramiento práctico al trabajo, sobre las máquinas y/o equipos a operar durante sus actividades laborales.</li>
					</ul>
					<a style="opacity:1;">#NOBORRAR#</a>
					<h3>Plan Inducción</h3><br/>
					
					<h3> Alcance. </h3><br/>
					Aplica a todo el personal que ingrese a la organización, a los trabajadores antiguos que presenten 
					cambios en sus actividades laborales, contratistas, cooperados y en misión.
					
					<h3>Frecuencia. </h3><br/>
					Al momento de ingresar un trabajador a la organización, así como  también al realizarse algún cambio de puesto de trabajo; 
					el entrenamiento debe ser suficiente, adecuado y periódico con la finalidad de que progresivamente el trabajador adquiera conocimientos 
					y destrezas aplicables a su trabajo y sea capaz de ejercer sus funciones de manera más eficiente y segura, minimizando la probabilidad 
					de ocurrencia de accidentes y enfermedades ocupacionales. 

					<h3>Responsabilidad. </h3><br/>
					<ul>
						<li>Es responsabilidad del empleador asegurar el talento humano encargado de la inducción al trabajador. </li>
						<li>Es responsabilidad  de los supervisores, mantener una adecuada rotación del personal, instruyendo de manera práctica a los 
							trabajadores en materia de seguridad, en el uso de los medios de trabajo, y objetos de trabajo propios de la actividad a ejecutar, 
							dejando constancia por escrito de esta.</li>
						<li>Le corresponde al responsable del Sistema de Gestión de Seguridad y Salud en el Trabajo SG-SST hacer entrega de información, 
							verbal y escrita sobre la empresa, su proceso productivo, el proceso de trabajo a desarrollar, de los riesgos y su prevención</li>
					</ul>
					
					<h3>Explicación del plan. </h3><br/>
					Es un procedimiento desarrollado con la finalidad de brindar las herramientas necesarias para una fácil adaptación e integración de los 
					nuevos trabajadores a la organización y a su puesto de trabajo mediante una inducción a la organización, a los métodos, los equipos de trabajo y 
					al puesto que va a ocupar en la organización, El plan de inducción comprende:<br/>
					
					<ul>
						<li>
							<strong>Inducción a la organización</strong><br />
							Se debe dar a conocer una breve reseña histórica de la organización, su misión, visión, valores, descripción del  proceso productivo, 
							políticas, beneficios, normas y cualquier otra información que impulse al trabajador a identificarse con la organización y alinear sus 
							objetivos con los de la empresa.
						</li>
						<li>
							<strong>Información </strong><br />
							El responsable de impartir la inducción se encargará de hacerle entrega personalmente al trabajador de material escrito, 
							el cual contiene información relativa a: 
							<ul>
								<li>Horizonte institucional: Misión, Visión, Valores y principios.</li>
								<li>Horarios laborales, días de descanso, días de pago, prestaciones, historia de la empresa, servicios al personal, entre otros beneficios</li>
								<li>Organigrama,  Mapa de procesos, Política y objetivos de calidad</li>
								<li>Descripción del Cargo</li>
								<li>Exposición a Condiciones Inseguras para el Cargo.</li>
								<li>Información de los Procedimientos Seguros de Trabajo</li>
								<li>Normas de Higiene y Seguridad en el Trabajo </li>
								<li>Información contentiva a aspectos relacionados con la seguridad y salud en el trabajo dependiendo del cargo a ocupar</li>
								<li>Manual de Convivencia Laboral</li>
								<li>Nombre y funciones del resto del personal Administrativo, Docente y de Servicios Generales</li>
							</ul>
							Se explicará el contenido del material entregado y su importancia, incluyendo una explicación teórico-práctica acerca del uso de los equipos de 
							protección personal a ser utilizados según el cargo a ocupar. Concluida la explicación, se le otorgará al trabajador un tiempo prudencial para 
							que aclare las dudas que posea respecto a la información dada.
						</li>
						<li>
							<strong>Archivo de Expediente</strong><br />
							Una vez concluida la entrega de material, se le indica al trabajador que debe colocar su huella digital, firma, cédula y fecha en los lugares 
							señalados en cada documento, el cual contiene copia exacta del material entregado al trabajador, así como también posee la constancia de inducción 
							en seguridad y salud laboral. Consecutivamente el expediente es guardado en los archivos de la empresa.
						</li>
						<li>
							<strong>Recorrido por las instalaciones </strong><br />
							Se realiza con la finalidad de mostrar las diferentes áreas de la empresa al nuevo trabajador, mientras se realiza el recorrido se debe describir 
							las actividades que se realizan, indicar las medidas de seguridad a seguir en cada una de las áreas y presentar algunos compañeros de trabajo, 
							delegados de prevención.
						</li>
						<li>
							<strong>Inducción en el puesto de trabajo</strong><br />
							El supervisor inmediato da al nuevo trabajador instrucciones específicas sobre las actividades que va a realizar dando oportunidad de expresar 
							cualquier duda, así mismo debe indicar los riesgos a los cuales se expone con la realización de su labor y explicar las medidas preventivas que 
							debe seguir para evitar la ocurrencia de accidentes o la aparición de enfermedades producto de las actividades realizadas. <br />

							Este proceso de adaptación interviene en el trabajador para adoptar las pautas de conducta que rigen en la empresa y lograr que el mismo tenga 
							actitudes favorables hacia las políticas y niveles de relación entre jefes y su equipo de trabajo.
						</li>
						<li>
							<strong>Introducción a la actividad Laboral</strong><br />
							La persona de nuevo ingreso es presentada con el trabajador experto o el operador maestro en el trabajo a desempeñar, para que le dé el entrenamiento 
							necesario en base a su experiencia y le induzca en conjunto con el responsable del SG.SST en las medidas de prevención a aplicar en cada paso de la 
							actividad, con un enfoque dirigido a evitar accidentes ocurridos en ese puesto de trabajo, mediante la identificación de peligros y control de los 
							riesgos establecidos en la organización para la prevención de accidentes de trabajo y enfermedades laborales.
						</li>
						<li>
							<strong>Culminación de la Inducción</strong><br />
							Para finalizar la inducción se procederá a aclarar todas las dudas surgidas durante el proceso, invitándolo a que se incorpore a iniciar sus 
							actividades el día que le sea asignado, fecha en la cual se le hará entrega de su respectivo uniforme y equipos de protección personal, dejando 
							constancia escrita de dicha entrega, la cual será archivada en el expediente personal del trabajador.
						</li>
						<li>
							<strong>Personal Externo</strong><br />
							Al ingreso de personal externo (contratistas, cooperados y en misión),  a las áreas de la organización, el responsable de atenderla velará el 
							cumplimiento de lo siguiente: <br />
							<ul>
								<li>Realizar dotación de EPP básico requerido, acompañamiento permanente e información general de riesgos y medidas preventivas.</li>
								<li>Se aplican las políticas al proceso de inicio de obras de empresas contratistas, intermediarias y cooperativas.</li>
								<li>Se aplican las políticas relativas a la ejecución de la obra.</li>
								<li>Se aplican las políticas relativas al personal ayudante de transporte.</li>
								<li>Se realizan los recorridos de observaciones de comportamiento</li>
							</ul>
						</li>
					</ul><br />
					<h3>Proceso de Reinducción</h3><br />
					El objetivo está dirigido a reorientar la integración del empleado a la cultura organizacional en virtud de los procesos propios de la actividad o a los 
					cambios producidos en cualquiera de los asuntos de la organización; Asegurando de esta manera el adiestramiento práctico al trabajo, sobre las máquinas y/o 
					equipos a operar durante sus actividades laborales.<br />
					Los programas de reinducción se impartirán a todos los empleados por lo menos en el momento en que se produzcan cambios, e incluirán un proceso de actualización 
					acerca de las normas de seguridad y salud en el trabajo, para garantizar a través del seguimiento del comportamiento,  la retroalimentación por parte del nuevo trabajador. 
					Empleando para ello el formato que se anexa a continuación:
            </CKEditor:CKEditorControl>

        </div>
        <br />

        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-success"
                    OnClick="GenerarDocumento" Text="Generar Documento" ValidationGroup="ValidationAdd" />
            </div>

            <div class="col-md-4">
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary"
                    OnClick="btnGuardar_Click" Text="Guardar y/o Actualizar Datos" ValidationGroup="ValidationAdd" />
            </div>

        </div>
    </asp:PlaceHolder>

    <asp:PlaceHolder runat="server" ID="phCkeditorno">
        <div class="row">
            <h4 class="text-center">Debe seleccionar la empresa y sucursal.</h4>
        </div>
    </asp:PlaceHolder>

</asp:Content>
