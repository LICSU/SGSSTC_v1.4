<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EvaluacionPeligros.aspx.cs" Inherits="SGSST.source.sistema.Planear.Create_EvaluacionPeligros" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Planear</a></li>
		<li><a href="../Planear/index_EvaluacionRiesgos.aspx">Formato para modelo de procesos</a></li>
		<li><a href="#">Peligros</a></li>
	</ol>

	<div class="page-header">
		<h1 class="text-center">Formato para Clasificación de Peligros</h1>
	</div>

	<asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
		<div id="divAlerta" runat="server">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
		</div>
	</asp:PlaceHolder>

	<div class="row">
		<asp:PlaceHolder runat="server" ID="phEmpresa">
			<div class="col-md-4 col-md-offset-2">
				<h4 class="text-center">Empresa</h4>
				<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
					OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
				</asp:DropDownList>
			</div>
		</asp:PlaceHolder>

		<asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
			<div class="col-md-4 ">
				<h4 class="text-center">Sucursal</h4>
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>
	<br />
   
    <div class="row">
		<div class="col-md-8 col-md-offset-2">
             <CKEditor:CKEditorControl ID="txtPeligros" BasePath="/ckeditor/" runat="server">
                 <table border="1">
					<tr>
						<td colspan="8" style="text-align:center; background-color:#308194; color:#000;">CLASIFICACIÓN DE PELIGROS</td>
					</tr>
					<tr>
						<td rowspan="10" style="background-color:#308194; color:#000;" >DESCRIPCIÓN</td>
					</tr>
					<tr style="background-color:#308194; color:#FFF;">
						<td  style="text-align:center;">Biológico</td>
						<td  style="text-align:center;">Físico </td>
						<td  style="text-align:center;">Químico</td>
						<td  style="text-align:center;">Psicosocial</td>
						<td  style="text-align:center;">Biomecánicos</td>
						<td  style="text-align:center;">Condiciones de seguridad</td>
						<td  style="text-align:center;">Fenómenos naturales*</td>
					</tr>
					<tr>
						<td>Virus</td>
						<td>Ruido (de impacto, intermitente o continuo)</td>
						<td>Polvos orgánicos inorgánicos</td>
						<td>
							Gestión organizacional (estilo de mando, pago, contratación, participación, 
							inducción y capacitación, bienestar social, evaluación del desempeño, manejo de cambios).
						</td>
						<td>
							Postura (prolongada, mantenida, forzada, anti gravitacional).
						</td>
						<td>
							Mecánico (elementos o partes de máquinas, herramientas, equipos, piezas a trabajar, materiales proyectados solidos o fluidos).
						</td>
						<td>Sismo</td>
					</tr>
					<tr>
						<td>Bacterias</td>
						<td>Iluminación (luz visible por exceso o deficiencia)</td>
						<td>Fibras</td>
						<td>
							Características de la organización del trabajo (comunicación, tecnología, organización del trabajo, 
							demandas cualitativas y cuantitativas de la labor).
						</td>
						<td>
							Esfuerzo
						</td>
						<td>
							Eléctrico (alta y baja tensión, estática)
						</td>
						<td>Terremoto</td>
					</tr>
					<tr>
						<td>Hongos</td>
						<td>Vibración (cuerpo entero, segmentaria)</td>
						<td>Líquidos (nieblas y rocíos)</td>
						<td>
							Características del grupo social de trabajo (relaciones, cohesión, calidad de interacciones, 
							trabajo en equipo).
						</td>
						<td>
							Movimiento repetitivo
						</td>
						<td>
							Locativo (sistemas y medios de almacenamiento) superficies de trabajo (irregulares, deslizantes, 
							con diferencia del nivel) condiciones de orden y aseo (caídas de objeto)
						</td>
						<td>Vendaval</td>
					</tr>
					<tr>
						<td>Ricketsias</td>
						<td>Temperaturas extremas (calor y frio)</td>
						<td>Gases y vapores</td>
						<td>
							Condiciones de la tarea (carga mental, contenidos de la tarea, demandas emocionales, sistema de control, 
							definición de roles, monotonía, etc.).
						</td>
						<td>
							Manipulación manual de cargas
						</td>
						<td>
							Tecnológico (explosión, fuga, derrame, incendio).
						</td>
						<td>Inundación</td>
					</tr>
					<tr>
						<td>Parásitos</td>
						<td>Presión atmosférica (normal y ajustada)</td>
						<td>Humos metálicos no metálicos</td>
						<td>
							Interface persona-tarea (conocimientos, habilidades en relación con la demanda de la tarea, iniciativa, autonomía y reconocimiento, 
							identificación de la persona con la tarea y la organización).
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							Accidentes de tránsito
						</td>
						<td>Derrumbe</td>
					</tr>
					<tr>
						<td>Picaduras</td>
						<td>Radiaciones ionizantes (rayos X, gama, beta y alfa)</td>
						<td>Material particulado</td>
						<td>
							Jornada de trabajo (pausas, trabajo nocturno, rotación, horas extras, descansos)
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							Público (robos, asaltos, atracos, atentados, de orden público, etc.).
						</td>
						<td>Precipitaciones (lluvias, granizadas, heladas).</td>
					</tr>
					<tr>
						<td>Mordeduras</td>
						<td>Radiaciones no ionizantes (láser, ultravioleta, infrarroja, radiofrecuencia, microondas)</td>
						<td>&nbsp;</td>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							Trabajo en alturas
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>Fluidos o excrementos</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							Espacios confinados
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>
             </CKEditor:CKEditorControl>
        </div>
    </div>
    <br />

	<div class="row text-center">

		<div class="col-md-4 col-md-offset-4">
			<asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
				OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
			<h4>Generar Documento</h4>
		</div>

	</div>





</asp:Content>
