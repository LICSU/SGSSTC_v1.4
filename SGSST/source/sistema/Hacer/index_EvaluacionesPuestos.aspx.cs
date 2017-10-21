using Capa_Datos;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Riesgos;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_EvaluacionesPuestos : Page
	{
		private Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;

		#region acciones index
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

			if (!IsPostBack)
			{
				ViewState["sWhere"] = string.Empty;
				LlenarGridView();
			}
		} 

		private void LlenarGridView()
		{
			int id_Puesto = objUtilidades.descifrarCadena(Request.QueryString["id"]);

			Mgr_Riesgos.Grid_EvaluacionPuesto(GridView1, id_Puesto, string.Empty + ViewState["sWhere"]);
		}
		#endregion

		#region acciones
		protected void MostrarModalImprimir(object sender, EventArgs e)
		{
			Modal.registrarModal("printModal", "printModalScript", this);
		}

		protected void btPrint_Click(object sender, EventArgs e)
		{
			String[] valores = {
				"",
				ViewState["Imprimir"].ToString(),
			};
		   
			PrintFile.PrintEvaluacionPuestos(valores, this);
			Modal.CerrarModal("printModal", "printModalScript", this);
			LlenarGridView();
		}

		protected void EliminarRegistro(object sender, EventArgs e)
		{
			evaluacion_riesgo tabla = new evaluacion_riesgo();
			ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));
			LlenarGridView();
			Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
			Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
		}
		
		#endregion

		#region acciones grid
		protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			GridView1.PageIndex = e.NewPageIndex;
			LlenarGridView();
		}
		protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
			{
				

				string id_EvaRiesgo = Utilidades_GridView.DevolverIdRow(e, GridView1);

				id_EvaRiesgo = objUtilidades.cifrarCadena(id_EvaRiesgo);

				Response.Redirect(Paginas.View_EvaluacionPuesto.Value + "?id=" + id_EvaRiesgo);
			}
			else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
			{
				hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

				Modal.registrarModal("deleteModal", "DeleteModalScript", this);
				
			}
			else if (e.CommandName.Equals(ComandosGrid.Imprimir.Value))
			{
				hImprimir.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

				ViewState["Imprimir"] = string.Empty + hImprimir.Value;

				Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);
				

			}

		}
		#endregion

		protected void BuscarRegistro(object sender, EventArgs e)
		{
			if (txtBuscar.Text != string.Empty)
			{
				ViewState["sWhere"] = txtBuscar.Text;
			}
			else
			{
				ViewState["sWhere"] = string.Empty;
			}
			LlenarGridView();
		}
	}
}