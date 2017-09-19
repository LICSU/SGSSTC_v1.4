using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class Create_Encuesta_ObjPoliticaSST : Page
	{
		protected static Model_UsuarioSistema ObjUsuario;
		static GridView grid = new GridView();
		Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0;
        private static int IdTrabajador = 0;
        private static int IdPuesto = 0;

        protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

			BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

			phSucursal.Visible = BoolEmpSuc.Item2;

			if (!IsPostBack)
			{
				CargarListas();
			}

		}
		protected void CargarListas()
		{
			Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);

			if (!BoolEmpSuc.Item2)
			{
                IdTrabajador = Convert.ToInt32(ObjUsuario.Id_sucursal);
			}
		}
		protected void btnGenerar_Onclick(object sender, EventArgs e)
		{
			phGuardar.Visible = true;

			Double totalSi = 0;
			Double totalNo = 0;

			for (int i = 1; i <= 36; i = i + 2)
			{
				HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)panel1.FindControl("radio" + i);
				HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)panel1.FindControl("radio" + (i + 1));

				if (miradio1.Checked == true) { totalSi++; }
				if (miradio2.Checked == true) { totalNo++; }

			}

			lbTotalSi.Text = "" + totalSi;
			lbTotalNo.Text = "" + totalNo;

			Double[] valores = { totalSi, totalNo };

			Double porcentaje = Math.Round(((totalNo * 100) / (totalSi + totalNo)), 2);

			lbObservaciones.Text = "El porcentaje de riesgo indican condiciones de trabajo que pueden estar asociadas a " +
				"alto riesgo de lesión o enfermedad es de: " + porcentaje + "%";

			StringBuilder str = new StringBuilder();
			str.Append(@"<script type = *text/javascript* >
					   google.load( *visualization*, *1*, {packages:[*corechart*]});
					   google.setOnLoadCallback(drawChart);
						function drawChart()
						{
							var data = google.visualization.arrayToDataTable([
	
							  ['Task', 'Hours per Day'],
	
							  ['SI', " + totalSi + "],");
			str.Append(@"['NO'," + totalNo + "]]); ");

			str.Append(@"var options = {
						  title: 'Porcentaje de riesgo',
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
			btnGenerar.Focus();
		}
		protected void Guardar(object sender, EventArgs e)
		{
			phGuardar.Visible = true;

			Double totalSi = 0;
			Double totalNo = 0;

			for (int i = 1; i <= 36; i = i + 2)
			{
				HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)panel1.FindControl("radio" + i);
				HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)panel1.FindControl("radio" + (i + 1));

				if (miradio1.Checked == true) { totalSi++; }
				if (miradio2.Checked == true) { totalNo++; }

			}

			lbTotalSi.Text = "" + totalSi;
			lbTotalNo.Text = "" + totalNo;

			Double[] valores = { totalSi, totalNo };

			Double porcentaje = Math.Round(((totalNo * 100) / (totalSi + totalNo)), 2);

			lbObservaciones.Text = "El porcentaje de riesgo indican condiciones de trabajo que pueden estar asociadas a " +
				"alto riesgo de lesión o enfermedad es de: " + porcentaje + "%";


			encuesta_politica nuevo = new encuesta_politica()
			{
				id_trabajador = IdTrabajador,
				fecha = DateTime.Now,
				si = (100 - porcentaje),
				no = porcentaje,
				tipo = "Conocimiento Objetivos PoliticaSST"
			};

			ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

			if (ObjUsuario.Error)
			{
				Response.Redirect(Paginas.index_Encuesta_PoliticaSST.Value);
			}
		}
		
		protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlSucursal.SelectedValue != string.Empty)
			{
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
		}

        #region AutoCompletar
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal, ref IdTrabajador, IdPuesto);
            return listTrabajadores;
        }
        #endregion
    }
}