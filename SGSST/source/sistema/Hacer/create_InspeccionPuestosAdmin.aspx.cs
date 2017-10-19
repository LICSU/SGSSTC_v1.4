﻿using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
	public partial class create_InspeccionPuestosAdmin : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;
		private static int IdTrabajador = 0;
		private static int IdSucursal = 0;

		#region Index
		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;
			phSucursal.Visible = BoolEmpSuc.Item2;

			if (!IsPostBack)
			{
				CargarListas();
			}
		}

		private void CargarListas()
		{
			if (BoolEmpSuc.Item1)
			{
				Mgr_Empresa.Lista_Empresa(ddlEmpresa);
			}
			else
			{
				Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
			}

			if (!BoolEmpSuc.Item2)
			{
				Mgr_Area.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
			}
		}
		#endregion

		#region Imprimir
		protected void btnGenerarResultados_Click(object sender, EventArgs e)
		{
			int TotalSi = 0, TotalNo = 0;
			RadioButton[] Radios = {
				chkSi1,
				chkNo1,
				chkSi2,
				chkNo2,
				chkSi3,
				chkNo3,
				chkSi4,
				chkNo4,
				chkSi5,
				chkNo5,
				chkSi6,
				chkNo6,
				chkSi7,
				chkNo7,
				chkSi8,
				chkNo8,
				chkSi9,
				chkNo9,
				chkSi10,
				chkNo10,
				chkSi11,
				chkNo11,
				chkSi12,
				chkNo12,
				chkSi13,
				chkNo13,
				chkSi14,
				chkNo14,
				chkSi15,
				chkNo15,
				chkSi16,
				chkNo16,
				chkSi17,
				chkNo17,
				chkSi18,
				chkNo18,
				chkSi19,
				chkNo19,
				chkSi20,
				chkNo20,
				chkSi21,
				chkNo21,
				chkSi22,
				chkNo22,
				chkSi23,
				chkNo23,
				chkSi24,
				chkNo24,
				chkSi25,
				chkNo25,
				chkSi26,
				chkNo26,
				chkSi27,
				chkNo27,
				chkSi28,
				chkNo28,
				chkSi29,
				chkNo29,
				chkSi30,
				chkNo30,
				chkSi31,
				chkNo31,
				chkSi32,
				chkNo32,
				chkSi33,
				chkNo33,
				chkSi34,
				chkNo34,
				chkSi35,
				chkNo35,
				chkSi36,
				chkNo36,
				chkSi37,
				chkNo37,
				chkSi38,
				chkNo38,
				chkSi39,
				chkNo39,
				chkSi40,
				chkNo40,
				chkSi41,
				chkNo41,
				chkSi42,
				chkNo42,
				chkSi43,
				chkNo43,
				chkSi44,
				chkNo44,
				chkSi45,
				chkNo45,
				chkSi46,
				chkNo46,
				chkSi47,
				chkNo47,
				chkSi48,
				chkNo48,
				chkSi49,
				chkNo49,
				chkSi50,
				chkNo50,
				chkSi51,
				chkNo51,
				chkSi52,
				chkNo52,
				chkSi53,
				chkNo53,
				chkSi54,
				chkNo54,
				chkSi55,
				chkNo55,
				chkSi56,
				chkNo56,
				chkSi57,
				chkNo57,
				chkSi58,
				chkNo58,
				chkSi59,
				chkNo59,
				chkSi60,
				chkNo60,
				chkSi61,
				chkNo61,
				chkSi62,
				chkNo62,
				chkSi63,
				chkNo63,
				chkSi64,
				chkNo64,
				chkSi65,
				chkNo65,
				chkSi66,
				chkNo66,
				chkSi67,
				chkNo67,
				chkSi68,
				chkNo68,
				chkSi69,
				chkNo69,
				chkSi70,
				chkNo70,
				chkSi71,
				chkNo71,
				chkSi72,
				chkNo72,
				chkSi73,
				chkNo73,
				chkSi74,
				chkNo74,
				chkSi75,
				chkNo75,
				chkSi76,
				chkNo76,
				chkSi77,
				chkNo77,
				chkSi78,
				chkNo78,
				chkSi79,
				chkNo79,
				chkSi80,
				chkNo80,
				chkSi81,
				chkNo81,
				chkSi82,
				chkNo82,
				chkSi83,
				chkNo83,
				chkSi84,
				chkNo84,
				chkSi85,
				chkNo85,
				chkSi86,
				chkNo86,
				chkSi87,
				chkNo87,
				chkSi88,
				chkNo88,
				chkSi89,
				chkNo89,
				chkSi90,
				chkNo90,
				chkSi91,
				chkNo91,
				chkSi92,
				chkNo92,
				chkSi93,
				chkNo93,
				chkSi94,
				chkNo94,
				chkSi95,
				chkNo95,
				chkSi96,
				chkNo96,
				chkSi97,
				chkNo97,
				chkSi98,
				chkNo98,
				chkSi99,
				chkNo99,
				chkSi100,
				chkNo100,
				chkSi101,
				chkNo101,
				chkSi102,
				chkNo102,
				chkSi103,
				chkNo103,
				chkSi104,
				chkNo104,
				chkSi105,
				chkNo105,
				chkSi106,
				chkNo106,
				chkSi107,
				chkNo107,
				chkSi108,
				chkNo108,
				chkSi109,
				chkNo109,
				chkSi110,
				chkNo110,
				chkSi111,
				chkNo111,
				chkSi112,
				chkNo112,
				chkSi113,
				chkNo113,
				chkSi114,
				chkNo114,
				chkSi115,
				chkNo115,
				chkSi116,
				chkNo116,
				chkSi117,
				chkNo117,
				chkSi118,
				chkNo118,
				chkSi119,
				chkNo119,
				chkSi120,
				chkNo120,
				chkSi121,
				chkNo121,
				chkSi122,
				chkNo122,
				chkSi123,
				chkNo123,
				chkSi124,
				chkNo124,
				chkSi125,
				chkNo125,
				chkSi126,
				chkNo126
			};

			int[] valores = ControlesDinamicos.GenerarResultados_InspeccionPuestosAdmin(Radios);
			TotalSi = valores[0];
			TotalNo = valores[1];

			generarGrafica(TotalSi, TotalNo);
			lblSumaSi.Text = "" + TotalSi;
			lblSumaNo.Text = "" + TotalNo;
			phDocumento.Visible = true;
			phDocumento1.Visible = false;
			phGrafica.Visible = true;
		}

		private void generarGrafica(int TotalSi, int TotalNo)
		{
			Double[] yAsistencias = { TotalSi, TotalNo };
			String[] xCadenas = { "SI", "NO" };
			//graficaPie.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
			//graficaPie.Series["seriesPie"].Points.DataBindXY(xCadenas, yAsistencias);
			//graficaPie.SaveImage(Server.MapPath("~/archivos/images_graf/graficaInspPA.jpg"));
			StringBuilder str = new StringBuilder();
			str.Append(@"<script type = *text/javascript* >
					   google.load( *visualization*, *1*, {packages:[*corechart*]});
					   google.setOnLoadCallback(drawChart);
						function drawChart()
						{
							var data = google.visualization.arrayToDataTable([
	
							  ['Task', 'Hours per Day'],
	
							  ['SI', " + TotalSi + "],");
			str.Append(@"['NO'," + TotalNo + "]]); ");

			str.Append(@"var options = {
						  title: 'Puestos Administrativos',
						  is3D: true,
						  width: 1000, 
						  height: 350,
						};

						var chart = new google.visualization.PieChart(document.getElementById('piechart'));
						chart.draw(data, options);
						
						$('#ImgChart').attr('src', chart.getImageURI());
						$('#rutaImg').val(chart.getImageURI());

					}
					</script>");

			string Myscript = str.ToString().Replace('*', '"');
			ltReporte.Text = Myscript;
			btnGenerarResultados.Focus();
		}

		protected void GenerarDocumento(object sender, EventArgs e)
		{
			Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
			String[] valores = {
				 string.Empty + IdEmpSuc.Item2,
				 "Área a Inspeccionar: " + ddlArea.SelectedItem.Text,
				 "Fecha: " + DateTime.Today.Date.ToString("yyyy-MM-dd"),
				 "Datos del Trabajador: " + ddlTrabajador.SelectedItem.Text,
				 "Cargo: " + ddlPuesto.SelectedItem.Text,
				 "N°",
				 "Pregunta",
				 "Si",
				 "No",
				 "Observaciones",
				 txtObsGenerales.Text
			};
			String[] encabezados = {
				"Información General",
				"Superficie de Trabajo/ Espacio",
				"Superficie del Asiento",
				"Silla",
				"Condiciones ergonómicas para los Brazos",
				"Condiciones ergonómicas para Piernas y pies",
				"Soporte para los Brazos y Manos",
				"Monitor",
				"Teclado",
				"Mouse",
				"Iluminación",
				"Temperatura",
				"Vibración",
				"Ruido ( En caso de que no exista ruido significativo abstenerse de responder)",
				"Fatiga Física",
				"Visión",
				"Capacitación e información",
				"Daños a la salud",
				"Aspectos Psicosociales",
				"Equipos de Emergencia",
				"Aspectos Locativos",
				"Instalaciones eléctricas",
				"Otras Condiciones"
			};
			String[] valoressi = {
				PrintFile.GetRadioValue(chkSi1),
				PrintFile.GetRadioValue(chkSi2),
				PrintFile.GetRadioValue(chkSi3),
				PrintFile.GetRadioValue(chkSi4),
				PrintFile.GetRadioValue(chkSi5),
				PrintFile.GetRadioValue(chkSi6),
				PrintFile.GetRadioValue(chkSi7),
				PrintFile.GetRadioValue(chkSi8),
				PrintFile.GetRadioValue(chkSi9),
				PrintFile.GetRadioValue(chkSi10),
				PrintFile.GetRadioValue(chkSi11),
				PrintFile.GetRadioValue(chkSi12),
				PrintFile.GetRadioValue(chkSi13),
				PrintFile.GetRadioValue(chkSi14),
				PrintFile.GetRadioValue(chkSi15),
				PrintFile.GetRadioValue(chkSi16),
				PrintFile.GetRadioValue(chkSi17),
				PrintFile.GetRadioValue(chkSi18),
				PrintFile.GetRadioValue(chkSi19),
				PrintFile.GetRadioValue(chkSi20),
				PrintFile.GetRadioValue(chkSi21),
				PrintFile.GetRadioValue(chkSi22),
				PrintFile.GetRadioValue(chkSi23),
				PrintFile.GetRadioValue(chkSi24),
				PrintFile.GetRadioValue(chkSi25),
				PrintFile.GetRadioValue(chkSi26),
				PrintFile.GetRadioValue(chkSi27),
				PrintFile.GetRadioValue(chkSi28),
				PrintFile.GetRadioValue(chkSi29),
				PrintFile.GetRadioValue(chkSi30),
				PrintFile.GetRadioValue(chkSi31),
				PrintFile.GetRadioValue(chkSi32),
				PrintFile.GetRadioValue(chkSi33),
				PrintFile.GetRadioValue(chkSi34),
				PrintFile.GetRadioValue(chkSi35),
				PrintFile.GetRadioValue(chkSi36),
				PrintFile.GetRadioValue(chkSi37),
				PrintFile.GetRadioValue(chkSi38),
				PrintFile.GetRadioValue(chkSi39),
				PrintFile.GetRadioValue(chkSi40),
				PrintFile.GetRadioValue(chkSi41),
				PrintFile.GetRadioValue(chkSi42),
				PrintFile.GetRadioValue(chkSi43),
				PrintFile.GetRadioValue(chkSi44),
				PrintFile.GetRadioValue(chkSi45),
				PrintFile.GetRadioValue(chkSi46),
				PrintFile.GetRadioValue(chkSi47),
				PrintFile.GetRadioValue(chkSi48),
				PrintFile.GetRadioValue(chkSi49),
				PrintFile.GetRadioValue(chkSi50),
				PrintFile.GetRadioValue(chkSi51),
				PrintFile.GetRadioValue(chkSi52),
				PrintFile.GetRadioValue(chkSi53),
				PrintFile.GetRadioValue(chkSi54),
				PrintFile.GetRadioValue(chkSi55),
				PrintFile.GetRadioValue(chkSi56),
				PrintFile.GetRadioValue(chkSi57),
				PrintFile.GetRadioValue(chkSi58),
				PrintFile.GetRadioValue(chkSi59),
				PrintFile.GetRadioValue(chkSi60),
				PrintFile.GetRadioValue(chkSi61),
				PrintFile.GetRadioValue(chkSi62),
				PrintFile.GetRadioValue(chkSi63),
				PrintFile.GetRadioValue(chkSi64),
				PrintFile.GetRadioValue(chkSi65),
				PrintFile.GetRadioValue(chkSi66),
				PrintFile.GetRadioValue(chkSi67),
				PrintFile.GetRadioValue(chkSi68),
				PrintFile.GetRadioValue(chkSi69),
				PrintFile.GetRadioValue(chkSi70),
				PrintFile.GetRadioValue(chkSi71),
				PrintFile.GetRadioValue(chkSi72),
				PrintFile.GetRadioValue(chkSi73),
				PrintFile.GetRadioValue(chkSi74),
				PrintFile.GetRadioValue(chkSi75),
				PrintFile.GetRadioValue(chkSi76),
				PrintFile.GetRadioValue(chkSi77),
				PrintFile.GetRadioValue(chkSi78),
				PrintFile.GetRadioValue(chkSi79),
				PrintFile.GetRadioValue(chkSi80),
				PrintFile.GetRadioValue(chkSi81),
				PrintFile.GetRadioValue(chkSi82),
				PrintFile.GetRadioValue(chkSi83),
				PrintFile.GetRadioValue(chkSi84),
				PrintFile.GetRadioValue(chkSi85),
				PrintFile.GetRadioValue(chkSi86),
				PrintFile.GetRadioValue(chkSi87),
				PrintFile.GetRadioValue(chkSi88),
				PrintFile.GetRadioValue(chkSi89),
				PrintFile.GetRadioValue(chkSi90),
				PrintFile.GetRadioValue(chkSi91),
				PrintFile.GetRadioValue(chkSi92),
				PrintFile.GetRadioValue(chkSi93),
				PrintFile.GetRadioValue(chkSi94),
				PrintFile.GetRadioValue(chkSi95),
				PrintFile.GetRadioValue(chkSi96),
				PrintFile.GetRadioValue(chkSi97),
				PrintFile.GetRadioValue(chkSi98),
				PrintFile.GetRadioValue(chkSi99),
				PrintFile.GetRadioValue(chkSi100),
				PrintFile.GetRadioValue(chkSi101),
				PrintFile.GetRadioValue(chkSi102),
				PrintFile.GetRadioValue(chkSi103),
				PrintFile.GetRadioValue(chkSi104),
				PrintFile.GetRadioValue(chkSi105),
				PrintFile.GetRadioValue(chkSi106),
				PrintFile.GetRadioValue(chkSi107),
				PrintFile.GetRadioValue(chkSi108),
				PrintFile.GetRadioValue(chkSi109),
				PrintFile.GetRadioValue(chkSi110),
				PrintFile.GetRadioValue(chkSi111),
				PrintFile.GetRadioValue(chkSi112),
				PrintFile.GetRadioValue(chkSi113),
				PrintFile.GetRadioValue(chkSi114),
				PrintFile.GetRadioValue(chkSi115),
				PrintFile.GetRadioValue(chkSi116),
				PrintFile.GetRadioValue(chkSi117),
				PrintFile.GetRadioValue(chkSi118),
				PrintFile.GetRadioValue(chkSi119),
				PrintFile.GetRadioValue(chkSi120),
				PrintFile.GetRadioValue(chkSi121),
				PrintFile.GetRadioValue(chkSi122),
				PrintFile.GetRadioValue(chkSi123),
				PrintFile.GetRadioValue(chkSi124),
				PrintFile.GetRadioValue(chkSi125),
				PrintFile.GetRadioValue(chkSi126)
			};
			String[] valoresno = {
				PrintFile.GetRadioValue(chkNo1),
				PrintFile.GetRadioValue(chkNo2),
				PrintFile.GetRadioValue(chkNo3),
				PrintFile.GetRadioValue(chkNo4),
				PrintFile.GetRadioValue(chkNo5),
				PrintFile.GetRadioValue(chkNo6),
				PrintFile.GetRadioValue(chkNo7),
				PrintFile.GetRadioValue(chkNo8),
				PrintFile.GetRadioValue(chkNo9),
				PrintFile.GetRadioValue(chkNo10),
				PrintFile.GetRadioValue(chkNo11),
				PrintFile.GetRadioValue(chkNo12),
				PrintFile.GetRadioValue(chkNo13),
				PrintFile.GetRadioValue(chkNo14),
				PrintFile.GetRadioValue(chkNo15),
				PrintFile.GetRadioValue(chkNo16),
				PrintFile.GetRadioValue(chkNo17),
				PrintFile.GetRadioValue(chkNo18),
				PrintFile.GetRadioValue(chkNo19),
				PrintFile.GetRadioValue(chkNo20),
				PrintFile.GetRadioValue(chkNo21),
				PrintFile.GetRadioValue(chkNo22),
				PrintFile.GetRadioValue(chkNo23),
				PrintFile.GetRadioValue(chkNo24),
				PrintFile.GetRadioValue(chkNo25),
				PrintFile.GetRadioValue(chkNo26),
				PrintFile.GetRadioValue(chkNo27),
				PrintFile.GetRadioValue(chkNo28),
				PrintFile.GetRadioValue(chkNo29),
				PrintFile.GetRadioValue(chkNo30),
				PrintFile.GetRadioValue(chkNo31),
				PrintFile.GetRadioValue(chkNo32),
				PrintFile.GetRadioValue(chkNo33),
				PrintFile.GetRadioValue(chkNo34),
				PrintFile.GetRadioValue(chkNo35),
				PrintFile.GetRadioValue(chkNo36),
				PrintFile.GetRadioValue(chkNo37),
				PrintFile.GetRadioValue(chkNo38),
				PrintFile.GetRadioValue(chkNo39),
				PrintFile.GetRadioValue(chkNo40),
				PrintFile.GetRadioValue(chkNo41),
				PrintFile.GetRadioValue(chkNo42),
				PrintFile.GetRadioValue(chkNo43),
				PrintFile.GetRadioValue(chkNo44),
				PrintFile.GetRadioValue(chkNo45),
				PrintFile.GetRadioValue(chkNo46),
				PrintFile.GetRadioValue(chkNo47),
				PrintFile.GetRadioValue(chkNo48),
				PrintFile.GetRadioValue(chkNo49),
				PrintFile.GetRadioValue(chkNo50),
				PrintFile.GetRadioValue(chkNo51),
				PrintFile.GetRadioValue(chkNo52),
				PrintFile.GetRadioValue(chkNo53),
				PrintFile.GetRadioValue(chkNo54),
				PrintFile.GetRadioValue(chkNo55),
				PrintFile.GetRadioValue(chkNo56),
				PrintFile.GetRadioValue(chkNo57),
				PrintFile.GetRadioValue(chkNo58),
				PrintFile.GetRadioValue(chkNo59),
				PrintFile.GetRadioValue(chkNo60),
				PrintFile.GetRadioValue(chkNo61),
				PrintFile.GetRadioValue(chkNo62),
				PrintFile.GetRadioValue(chkNo63),
				PrintFile.GetRadioValue(chkNo64),
				PrintFile.GetRadioValue(chkNo65),
				PrintFile.GetRadioValue(chkNo66),
				PrintFile.GetRadioValue(chkNo67),
				PrintFile.GetRadioValue(chkNo68),
				PrintFile.GetRadioValue(chkNo69),
				PrintFile.GetRadioValue(chkNo70),
				PrintFile.GetRadioValue(chkNo71),
				PrintFile.GetRadioValue(chkNo72),
				PrintFile.GetRadioValue(chkNo73),
				PrintFile.GetRadioValue(chkNo74),
				PrintFile.GetRadioValue(chkNo75),
				PrintFile.GetRadioValue(chkNo76),
				PrintFile.GetRadioValue(chkNo77),
				PrintFile.GetRadioValue(chkNo78),
				PrintFile.GetRadioValue(chkNo79),
				PrintFile.GetRadioValue(chkNo80),
				PrintFile.GetRadioValue(chkNo81),
				PrintFile.GetRadioValue(chkNo82),
				PrintFile.GetRadioValue(chkNo83),
				PrintFile.GetRadioValue(chkNo84),
				PrintFile.GetRadioValue(chkNo85),
				PrintFile.GetRadioValue(chkNo86),
				PrintFile.GetRadioValue(chkNo87),
				PrintFile.GetRadioValue(chkNo88),
				PrintFile.GetRadioValue(chkNo89),
				PrintFile.GetRadioValue(chkNo90),
				PrintFile.GetRadioValue(chkNo91),
				PrintFile.GetRadioValue(chkNo92),
				PrintFile.GetRadioValue(chkNo93),
				PrintFile.GetRadioValue(chkNo94),
				PrintFile.GetRadioValue(chkNo95),
				PrintFile.GetRadioValue(chkNo96),
				PrintFile.GetRadioValue(chkNo97),
				PrintFile.GetRadioValue(chkNo98),
				PrintFile.GetRadioValue(chkNo99),
				PrintFile.GetRadioValue(chkNo100),
				PrintFile.GetRadioValue(chkNo101),
				PrintFile.GetRadioValue(chkNo102),
				PrintFile.GetRadioValue(chkNo103),
				PrintFile.GetRadioValue(chkNo104),
				PrintFile.GetRadioValue(chkNo105),
				PrintFile.GetRadioValue(chkNo106),
				PrintFile.GetRadioValue(chkNo107),
				PrintFile.GetRadioValue(chkNo108),
				PrintFile.GetRadioValue(chkNo109),
				PrintFile.GetRadioValue(chkNo110),
				PrintFile.GetRadioValue(chkNo111),
				PrintFile.GetRadioValue(chkNo112),
				PrintFile.GetRadioValue(chkNo113),
				PrintFile.GetRadioValue(chkNo114),
				PrintFile.GetRadioValue(chkNo115),
				PrintFile.GetRadioValue(chkNo116),
				PrintFile.GetRadioValue(chkNo117),
				PrintFile.GetRadioValue(chkNo118),
				PrintFile.GetRadioValue(chkNo119),
				PrintFile.GetRadioValue(chkNo120),
				PrintFile.GetRadioValue(chkNo121),
				PrintFile.GetRadioValue(chkNo122),
				PrintFile.GetRadioValue(chkNo123),
				PrintFile.GetRadioValue(chkNo124),
				PrintFile.GetRadioValue(chkNo125),
				PrintFile.GetRadioValue(chkNo126)
			};
			String[] titulos = {
				"¿Esta constituido el COPASST en la Empresa?",
				"¿El Copasst conoce las estadísticas de ausentismo, accidente de trabajo y enfermedades profesionales?",
				"¿El Copasst se reúne por lo menos una vez al mes?",
				"¿Realizan exámenes médicos pre empleo, periódicos y post empleo?",
				"¿Se informa al trabajador de los resultados de los exámenes médicos?",
				"¿Se realiza mantenimiento a los Equipos de Trabajo?",
				"¿Se le realiza inducción al trabajador al ingresar a un puesto de trabajo?",
				"¿Se implementan pausas activas de trabajo?",
				"¿La disposición del puesto de trabajo permite al trabajador laborar sentado y alternar posturas?",
				"¿La superficie de trabajo es estable?",
				"¿Es el ancho de la superficie de trabajo apropiada, de manera que los accesorios o herramientas puedan ser ubicados a un fácil alcance y visualización?",
				"¿La profundidad de la Superficie de Trabajo es la apropiada, de forma tal que el monitor y el teclado se ubican frente al usuario?",
				"¿La superficie de trabajo evita que existan posturas de los miembros superiores en contra de la gravedad?",
				"¿La superficie de trabajo es confortable con respecto a sus dimensiones?",
				"¿Debajo del escritorio, el área es suficientemente amplia para acomodar las piernas del trabajador?",
				"¿El puesto de trabajo cuenta con suficiente espacio para realizar movimientos libremente?",
				"¿La ubicación de los elementos de trabajo permite que no se originen movimientos forzados de espalda o hiperextensiones de los miembros superiores?",
				"¿El área de trabajo no limita el libre movimiento?",
				"¿Existen corredores libres entre los puestos de trabajo?",
				"¿los objetos, muebles, equipos están dispuestos de manera que no dificulten la utilización del espacio libre del puesto de trabajo?",
				"¿Las piezas, documentos, objetos, herramientas, equipos u otros están dispuestos en forma organizada que facilita su utilización?",
				"¿La Superficie de Trabajo es de material mate, para prevenir reflejos?",
				"¿la altura del asiento es ajustable, de tal manera que permite graduar una altura confortable de trabajo?",
				"¿la altura superficie del asiento es apropiada, de tal manera que el ancho y la profundidad permiten alojarse confortablemente?",
				"¿la inclinación del asiento es ajustable? ¿ permite inclinarse hacia adelante o hacia atrás según su conveniencia?",
				"¿El borde frontal del asiento es redondeado? De manera que evite la presión sobre la parte posterior de la rodilla?",
				"¿Es el asiento es confortable en su totalidad?",
				"¿Puede ajustar fácilmente el espaldar para obtener un apoyo lumbar apropiado?",
				"¿Puede ajustar la profundidad del asiento?",
				"¿Es el espaldar de la silla confortable en su totalidad?",
				"¿La silla empleada posee 5 patas y es móvil?",
				"¿Se puede trabajar con una postura adecuada de la cabeza, de tal manera que no produzca estrés en el cuello o en los hombros?",
				"¿Es posible trabajar con la cabeza orientada hacia el frente del plano del pecho, de tal manera que la rotación del cuello sea mínima?",
				"¿Se Puede trabajar con una posición confortable de los brazos?",
				"¿Es posible trabajar con una posición cómoda de los codos?",
				"¿Se Puede trabajar con una postura neutral de los hombros?",
				"¿Se Puede trabajar con una postura neutral de las muñecas?",
				"¿Son mínimas las actividades que requieren extensión del tronco y brazos?",
				"¿Es posible apoyar los pies de manera confortable y totalmente sobre la superficie?",
				"¿El usuario está libre de obstrucciones o puntos de presión molestos en sus piernas?",
				"¿Existe un apoya pies disponible?",
				"¿Se ajusta fácilmente la altura del apoya pies?",
				"¿Se Puede ajustar la inclinación del apoya pies?",
				"¿El ajuste de la altura de la silla permite que las rodillas del usuario no se encuentran por encima o debajo del nivel de la cadera?",
				"¿Se dispone de algún tipo de apoyabrazos en la silla?",
				"¿La persona tiene disponible algún tipo de soporte para sus manos al momento de hacer uso del teclado? ( apoya muñecas)",
				"¿Los soportes empleados como apoyo evitan desviaciones en las manos con relación al eje neutro de la muñeca en procesos de utilización de mouse y digitación?",
				"¿Se dispone de un mouse pad o almohadilla para el mouse, para evitar presión en la base de la muñeca por contacto con la superficie de trabajo?",
				"¿Se Puede ajustar fácilmente la altura del monitor?",
				"¿Es posible ajustar fácilmente la distancia horizontal de ubicación del monitor?",
				"¿Se Puede ajustar fácilmente la inclinación de la pantalla del Monitor?",
				"¿Se ajustar con facilidad la rotación a izquierda o derecha del monitor?",
				"¿Es posible ajustar el ángulo de inclinación?",
				"¿Es posible ajustar la altura del teclado?",
				"¿Es confortable la presión del teclado?",
				"¿Es confortable la Forma y la activación de los botones del mouse?",
				"¿El Mouse es operativo sin necesidad de extender el brazo hacia adelante o hacia el costado del cuerpo de la persona?",
				"¿La ubicación y manipulación del mouse no requieren de movimientos forzados para la muñeca?",
				"¿Al emplear el mouse, el antebrazo queda soportado por la superficie de trabajo?",
				"¿La iluminación en el área del monitor es suficiente?",
				"¿Está el monitor ubicado de tal manera que la iluminación de ventanas o lámparas no crean reflejos en la pantalla?",
				"¿Se emplea algún método para impedir la luz directa de las ventanas y así evitar el deslumbramiento por visión directa a la fuente de luz?",
				"¿Las lámparas fundidas son sustituidas rápidamente?",
				"¿Es confortable la temperatura del ambiente de trabajo?",
				"¿El trabajador (a) Se siente en confort con el frío que genera el aire acondicionado?",
				"¿El trabajador (a) Se siente cómodo con la temperatura cuando el aire no está operativo?",
				"¿El trabajador (a) Se siente bien con la temperatura de la superficie de objetos con los que debe tener contacto durante la jornada?",
				"¿Existen altos niveles de humedad?",
				"¿El equipo de trabajo está libre de vibraciones generadas por el uso del mismo?",
				"¿ha sido eliminada cualquier fuente de vibración en el área de trabajo?",
				"¿El nivel de sonido que se genera habitualmente, permite la conversación entre los compañeros de trabajo sin un esfuerzo significativo o molestia?",
				"¿Existe un ruido constante procedente del exterior, y sin embargo esto permite al trabajador (a) concentrarse?",
				"¿Existe un ruido molesto y constante generado por los compañeros de trabajo, y sin embargo esto le permite concentrarse al trabajador(a)?",
				"¿Se le permite a los trabajadores tomar descansos frecuentes?",
				"¿Se realizan pausas activas durante la jornada laboral?",
				"¿los esfuerzos realizados están de acuerdo al entrenamiento del trabajador?",
				"¿La tarea permite no involucrar movimientos rápidos, fuertes o repentinos de los miembros superiores en posiciones forzadas, especialmente a nivel de manos?",
				"¿Es posible manipular aquellos objetos que requieran ser levantados cerca del cuerpo, de manera que evite la extensión de los brazos, doblarse o girar el torso para su manipulación?",
				"¿El usuario del computador puede ver el texto en el monitor sin necesidad de inclinar la cabeza hacia atrás?",
				"¿Los colores y el tamaño de las letras e imágenes del monitor, son fáciles de ver o leer?",
				"¿Se realizan capacitaciones respecto a temas de Seguridad y Salud en el Trabajo?",
				"¿Se realizan simulacros de evacuación?",
				"¿La empresa cumple con las señalizaciones de rutas de evacuación?",
				"¿Existe definido un plan de evacuación?",
				"¿Están definidos cuales son los puntos de reunión después de una evacuación?",
				"¿Se capacita al personal sobre el uso correcto de los equipos de extinción?",
				"¿El personal conoce donde están ubicados los extintores?",
				"¿Es de conocimiento del personal donde están ubicadas las tomas de manguera para incendio?",
				"¿Se ha conformado la brigada de emergencia?",
				"¿Se le informa al personal sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?",
				"¿Se informa de los accidentes de trabajo ocurridos en el último año?",
				"¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?",
				"¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?",
				"Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?",
				"Ante los Accidentes Laborales ¿Se realiza la investigación del evento?",
				"¿El trabajador tiene algún tipo de control sobre el proceso de trabajo?",
				"¿Los Programas a utilizar en sus tareas diarias son fáciles de utilizar?",
				"¿Se entrena al trabajador (a) para utilizar un nuevo software?",
				"¿Existe comunicación asertiva entre los trabajadores y el supervisor?",
				"¿El trabajo está organizado de manera que no se exija simultáneamente varias tareas?",
				"¿Si la tarea requiere de una elevada concentración, se evitan los agentes distractores en el lugar de trabajo?",
				"¿En la organización se evita laborar horas extras luego de la jornada de trabajo?",
				"¿Existen equipos Extintores?",
				"¿Existe botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?",
				"¿Está señalizada la vía de Evacuación?",
				"¿Existe alumbrado de Emergencia?",
				"¿Son óptimas las condiciones del Techo de la oficina?",
				"¿El piso de la instalación se en encuentra en buenas condiciones?",
				"¿Las paredes del local son óptimas?",
				"¿Las puertas se encuentran en buen estado?",
				"¿Las escaleras tienen pasa manos?",
				"¿las áreas están señalizadas?",
				"¿El sitio de trabajo tiene la ventilación adecuada?",
				"¿Es óptimo el Estado de los Cables (Entubado)?",
				"¿Es óptimo el Estado del toma corriente?",
				"¿Es óptimo el Estado del Tablero eléctrico?",
				"¿Es óptimo el estado de los Bombillos/Tubos Fluorescentes?",
				"¿Las instalaciones usadas para la alimentación son apropiadas?",
				"¿Se encuentran en estado óptimo de limpieza?",
				"¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?",
				"¿Los espacios sanitarios son adecuados?",
				"¿Existe disponibilidad de Jabón en los espacios sanitarios?",
				"¿Existe disponibilidad de papel higiénico en los espacios sanitarios?",
				"¿Existen filtros de agua potable en la empresa?",
				"¿Posee la empresa áreas para el descanso y la recreación?",
				"¿En las instalaciones sanitarias se mantiene el orden y limpieza?"
			};
			String[] textos = {
				txt1.Text,
				txt2.Text,
				txt3.Text,
				txt4.Text,
				txt5.Text,
				txt6.Text,
				txt7.Text,
				txt8.Text,
				txt9.Text,
				txt10.Text,
				txt11.Text,
				txt12.Text,
				txt13.Text,
				txt14.Text,
				txt15.Text,
				txt16.Text,
				txt17.Text,
				txt18.Text,
				txt19.Text,
				txt20.Text,
				txt21.Text,
				txt22.Text,
				txt23.Text,
				txt24.Text,
				txt25.Text,
				txt26.Text,
				txt27.Text,
				txt28.Text,
				txt29.Text,
				txt30.Text,
				txt31.Text,
				txt32.Text,
				txt33.Text,
				txt34.Text,
				txt35.Text,
				txt36.Text,
				txt37.Text,
				txt38.Text,
				txt39.Text,
				txt40.Text,
				txt41.Text,
				txt42.Text,
				txt43.Text,
				txt44.Text,
				txt45.Text,
				txt46.Text,
				txt47.Text,
				txt48.Text,
				txt49.Text,
				txt50.Text,
				txt51.Text,
				txt52.Text,
				txt53.Text,
				txt54.Text,
				txt55.Text,
				txt56.Text,
				txt57.Text,
				txt58.Text,
				txt59.Text,
				txt60.Text,
				txt61.Text,
				txt62.Text,
				txt63.Text,
				txt64.Text,
				txt65.Text,
				txt66.Text,
				txt67.Text,
				txt68.Text,
				txt69.Text,
				txt70.Text,
				txt71.Text,
				txt72.Text,
				txt73.Text,
				txt74.Text,
				txt75.Text,
				txt76.Text,
				txt77.Text,
				txt78.Text,
				txt79.Text,
				txt80.Text,
				txt81.Text,
				txt82.Text,
				txt83.Text,
				txt84.Text,
				txt85.Text,
				txt86.Text,
				txt87.Text,
				txt88.Text,
				txt89.Text,
				txt90.Text,
				txt91.Text,
				txt92.Text,
				txt93.Text,
				txt94.Text,
				txt95.Text,
				txt96.Text,
				txt97.Text,
				txt98.Text,
				txt99.Text,
				txt100.Text,
				txt101.Text,
				txt102.Text,
				txt103.Text,
				txt104.Text,
				txt105.Text,
				txt106.Text,
				txt107.Text,
				txt108.Text,
				txt109.Text,
				txt110.Text,
				txt111.Text,
				txt112.Text,
				txt113.Text,
				txt114.Text,
				txt115.Text,
				txt116.Text,
				txt117.Text,
				txt118.Text,
				txt119.Text,
				txt120.Text,
				txt121.Text,
				txt122.Text,
				txt123.Text,
				txt124.Text,
				txt125.Text,
				txt126.Text
			};

			PrintFile.PrintInspeccionPuestosAdmin(valores, titulos, valoressi, valoresno, textos, encabezados, this);
		}
		#endregion

		#region filtro
		protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlEmpresa.SelectedValue != string.Empty)
			{
				ViewState["empresa"] = ddlEmpresa.SelectedValue;
				Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
				ViewState["sucursal"] = "0";
			}
			else
			{
				ViewState["empresa"] = "0";
			}
		}
		protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlSucursal.SelectedValue != string.Empty)
			{
				ViewState["sucursal"] = ddlSucursal.SelectedValue;
				Mgr_Area.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue), "", "Administrativa");
			}
			else
			{
				ViewState["sucursal"] = "0";
			}
		}

		protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlArea.SelectedValue != string.Empty)
			{
				ViewState["area"] = ddlArea.SelectedValue;
				Listas.PuestoTrabajo(ddlPuesto, "idArea", Convert.ToInt32(ddlArea.SelectedValue));
			}
			else
			{
				ViewState["area"] = "0";
			}
		}

		protected void ddlPuesto_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlPuesto.SelectedValue != string.Empty)
			{
				ViewState["puesto"] = ddlPuesto.SelectedValue;
				if (!BoolEmpSuc.Item2)
				{
					IdSucursal = ObjUsuario.Id_sucursal;
				}
				else
				{
					IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
				}

				Mgr_Trabajador.Trabajadores_Puestos(ddlTrabajador, Convert.ToInt32(ddlPuesto.SelectedValue));
				phInformacion.Visible = true;
				phTrabajdor.Visible = true;
			}
			else
			{
				ViewState["puesto"] = "0";
			}
		}
		#endregion
	}
}