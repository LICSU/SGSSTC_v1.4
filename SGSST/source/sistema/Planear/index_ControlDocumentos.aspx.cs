using System;
using Capa_Datos;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_ControlDocumentos : Page
	{
		private Model_UsuarioSistema ObjUsuario;

		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
		}		

		protected void GenerarDocumento(object sender, EventArgs e)
		{
			int IdSucursal = ObjUsuario.Id_sucursal;
			string[] valores = {
				 IdSucursal.ToString()
			}; 
			string[] tipoDoc = {
			"Política y Objetivos del SG-SST",
			"Documentos para la divulgación de la Política ( Trípticos, Publicaciones en Carteleras o cualquier otro medio informativo)",
			"Encuestas para validar que el personal haya conocido y comprendido la Política del SG-SST",
			"Evaluación Inicial del SG-SST",
			"Descripción del Alcance del SG-SST",
			"Objetivos de Seguridad y Salud en el Trabajo",
			"Descripción de la Estructura  PHVA del SG-SST ",
			"Caracterización de Procesos del SG-SST",
			"Inspecciones de Seguridad",
			"Acciones preventivas, correctivas y de mejoras generadas en las inspecciones de seguridad.",
			"Establecimiento de Indicadores de Medición del SG-SST",
			"Normas y Reglamentos Internos de la Organización",
			"Plan de Trabajo Anual",
			"No conformidades detectadas en el seguimiento al plan de trabajo anual en Seguridad y Salud en el Trabajo",
			"Matriz Legal Actualizada en relación a toda la normatividad legal vigente aplicable en materia de SST",
			"Documentar los Requisitos concretos que hay que cumplir ( Generales y Específicos)",
			"Actualización de la Normativa que Sustituye, Reemplaza o Corrige la Existente",
			"Matriz de Peligros, Evaluación y Valoración de los riesgos Actualizada acorde a los peligros y priorización de riesgos de la organización",
			"Resultados de las Evaluaciones de Riesgo ",
			"Medidas de Seguimiento y Control de Riesgos",
			"Reportes de las Condiciones de Trabajo peligrosas realizadas por los trabajadores",
			"Plan de Acción ( Recursos y Plazos para alcanzar los objetivos planteados)",
			"Manual y Programas de Seguridad y Salud en el Trabajo",
			"Plan de Inducción ",
			"Constancia de Registro de la Inducción ( información de de las condiciones inseguras o insalubres y riesgos a los que estará expuesto el trabajador  y los daños que puede causar a la salud",
			"Plan para la Prevención y Atención de Emergencias en la organización",
			"Mapas de Riesgo Actualizados",
			"Registro de Mapas de Ubicación de Extintores, Lámparas de Emergencia  y Sistemas de Alarma contra Incendio, Planos de Evacuación",
			"Plan de Capacitación en Seguridad y Salud en el Trabajo",
			"Registro de Capacitaciones",
			"Reporte e investigación de los incidentes, accidentes de trabajo ",
			"Registro estadístico de  accidentes e incidentes de trabajo",
			"Investigación de Accidentes e Incidentes",
			"Acciones preventivas, correctivas y de mejora, generadas en las investigaciones de los incidentes, accidentes y enfermedades laborales",
			"Actas de reunión mensual  del Comité Paritario de Seguridad y Salud en el Trabajo acorde al tamaño de la organización",
			"Programas de Vigilancia Epidemiológica de acuerdo con el análisis de las condiciones de salud y de trabajo y a los riesgos priorizados",
			"Plan de Equipos de Protección Personal ( Selección y Dotación de Epp)",
			"Evidencias del Registro de Entrega de Equipos de Protección Personal",
			"Programación de Selección y Evaluador de Proveedores",
			"Auditoria y Revisión por la Alta Dirección al SG-SST"
		};
			string[] Responsable = {
			Textbox1.Text,
			Textbox3.Text,
			Textbox5.Text,
			Textbox7.Text,
			Textbox9.Text,
			Textbox11.Text,
			Textbox13.Text,
			Textbox15.Text,
			Textbox17.Text,
			Textbox19.Text,
			Textbox21.Text,
			Textbox23.Text,
			Textbox25.Text,
			Textbox27.Text,
			Textbox29.Text,
			Textbox31.Text,
			Textbox33.Text,
			Textbox35.Text,
			Textbox37.Text,
			Textbox39.Text,
			Textbox41.Text,
			Textbox43.Text,
			Textbox45.Text,
			Textbox47.Text,
			Textbox49.Text,
			Textbox51.Text,
			Textbox53.Text,
			Textbox55.Text,
			Textbox57.Text,
			Textbox59.Text,
			Textbox61.Text,
			Textbox63.Text,
			Textbox65.Text,
			Textbox67.Text,
			Textbox69.Text,
			Textbox71.Text,
			Textbox73.Text,
			Textbox75.Text,
			Textbox77.Text,
			Textbox79.Text,

		};
			string[] Revisado = {
			Textbox2.Text,
			Textbox4.Text,
			Textbox6.Text,
			Textbox8.Text,
			Textbox10.Text,
			Textbox12.Text,
			Textbox14.Text,
			Textbox16.Text,
			Textbox18.Text,
			Textbox20.Text,
			Textbox22.Text,
			Textbox24.Text,
			Textbox26.Text,
			Textbox28.Text,
			Textbox30.Text,
			Textbox32.Text,
			Textbox34.Text,
			Textbox36.Text,
			Textbox38.Text,
			Textbox40.Text,
			Textbox42.Text,
			Textbox44.Text,
			Textbox46.Text,
			Textbox48.Text,
			Textbox50.Text,
			Textbox52.Text,
			Textbox54.Text,
			Textbox56.Text,
			Textbox58.Text,
			Textbox60.Text,
			Textbox62.Text,
			Textbox64.Text,
			Textbox66.Text,
			Textbox68.Text,
			Textbox70.Text,
			Textbox72.Text,
			Textbox74.Text,
			Textbox76.Text,
			Textbox78.Text,
			Textbox80.Text

		};
			string[] Aprobado = {
			Checkbox1.Checked ? "X" : "",
			Checkbox2.Checked ? "X" : "",
			Checkbox3.Checked ? "X" : "",
			Checkbox4.Checked ? "X" : "",
			Checkbox5.Checked ? "X" : "",
			Checkbox6.Checked ? "X" : "",
			Checkbox7.Checked ? "X" : "",
			Checkbox8.Checked ? "X" : "",
			Checkbox9.Checked ? "X" : "",
			Checkbox10.Checked ? "X" : "",
			Checkbox11.Checked ? "X" : "",
			Checkbox12.Checked ? "X" : "",
			Checkbox13.Checked ? "X" : "",
			Checkbox14.Checked ? "X" : "",
			Checkbox15.Checked ? "X" : "",
			Checkbox16.Checked ? "X" : "",
			Checkbox17.Checked ? "X" : "",
			Checkbox18.Checked ? "X" : "",
			Checkbox19.Checked ? "X" : "",
			Checkbox20.Checked ? "X" : "",
			Checkbox21.Checked ? "X" : "",
			Checkbox22.Checked ? "X" : "",
			Checkbox23.Checked ? "X" : "",
			Checkbox24.Checked ? "X" : "",
			Checkbox25.Checked ? "X" : "",
			Checkbox26.Checked ? "X" : "",
			Checkbox27.Checked ? "X" : "",
			Checkbox28.Checked ? "X" : "",
			Checkbox29.Checked ? "X" : "",
			Checkbox30.Checked ? "X" : "",
			Checkbox31.Checked ? "X" : "",
			Checkbox32.Checked ? "X" : "",
			Checkbox33.Checked ? "X" : "",
			Checkbox34.Checked ? "X" : "",
			Checkbox35.Checked ? "X" : "",
			Checkbox36.Checked ? "X" : "",
			Checkbox37.Checked ? "X" : "",
			Checkbox38.Checked ? "X" : "",
			Checkbox39.Checked ? "X" : "",
			Checkbox40.Checked ? "X" : "",
		};

			PrintFile.PrintCrontolDocumentos(valores, tipoDoc, Responsable, Revisado, Aprobado, this);
		}
	}
}