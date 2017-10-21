using Capa_Datos;
using Capa_Datos.Manager.Medidas;
using Capa_Datos.Manager.Norma;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class Update_MedidasMatrizLegal : Page
	{
		private  Utilidades objUtilidades = new Utilidades();
		private Model_UsuarioSistema ObjUsuario;
		private int idNorma, IdSucursal;

		#region metodos index
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			idNorma = objUtilidades.descifrarCadena(Request.QueryString["id"]);
			IdSucursal = objUtilidades.descifrarCadena(Request.QueryString["suc"]);

			if (!IsPostBack)
			{
				CargarDatos();
			}
		}

		private void CargarDatos()
		{
			//recibo el id de la norma y obtengo el tema especifico
			List<norma> ListaNormas = new List<norma>();
			ListaNormas = Mgr_Norma.Get_Norma(Convert.ToInt32(idNorma));

			foreach (var item in ListaNormas)
			{
				lbTemaEspecifico.Text = item.tema_especifico;
				lbDocumento.Text = item.documento;
			}

			CargarMedidas();
		}

		private void CargarMedidas()
		{
			chkMedidas.Items.Clear();
			chkAplica.Items.Clear();
			listSeg.Items.Clear();

			List<norma_sucursal> ListaNormasSucursal = new List<norma_sucursal>();
			ListaNormasSucursal = Mgr_Norma.Get_Normas_Sucursal(Convert.ToInt32(IdSucursal), Convert.ToInt32(idNorma));

			foreach (var itemNormasSucursal in ListaNormasSucursal)
			{
				lbestatus.Text = string.Empty + Convert.ToString(itemNormasSucursal.estatus_norma);

				int contador = 0;
				foreach (var item1 in itemNormasSucursal.medida_sucursal)
				{
					List<medida_sucursal> ListaMedidasSucursal = new List<medida_sucursal>();
					ListaMedidasSucursal = Mgr_Medidas.Get_MedidasBySucursal(item1.id_medidas_sucursal);

					foreach (var item2 in ListaMedidasSucursal)
					{
						contador++;
						ListItem itemAplica = new ListItem();
						itemAplica.Text = "Marque si NO aplica";
						itemAplica.Value = Convert.ToString(item2.id_medidas_sucursal);
						itemAplica.Selected = VerificarAplica(item2.id_medidas_sucursal);
						chkAplica.Items.Add(itemAplica);
						chkAplica.Attributes.Add("data-toggle", "tooltip");
						chkAplica.Attributes.Add("data-placement", "top");
						chkAplica.Attributes.Add("title", "Marque la casilla si esta medida no aplica para su empresa");


						string var1, var2, var3;
						var1 = objUtilidades.cifrarCadena(Convert.ToString(item2.id_medidas_sucursal));
						var2 = objUtilidades.cifrarCadena(Convert.ToString(IdSucursal));
						var3 = objUtilidades.cifrarCadena(Convert.ToString(idNorma));

						ListItem itemMedida = new ListItem();
						itemMedida.Text = contador + ") " + item2.descripcion + " <hr/>";
						itemMedida.Value = Convert.ToString(item2.id_medidas_sucursal);
						itemMedida.Selected = VerificarMedida(item2.id_medidas_sucursal);
						chkMedidas.Items.Add(itemMedida);
						chkMedidas.Attributes.Add("data-toggle", "tooltip");
						chkMedidas.Attributes.Add("data-placement", "top");
						chkMedidas.Attributes.Add("title", "Marque la casilla si esta medida ya esta cumplida");

						ListItem itemSeguimiento = new ListItem();
						itemSeguimiento.Text = "Crear Obligacion de la Medida(" + contador + ")";
						itemSeguimiento.Value = "../Hacer/Create_ObligacionNorma.aspx?id=" + var1 + "&suc=" + var2 + "&nor=" + var3;
						listSeg.Items.Add(itemSeguimiento);
						listSeg.Attributes.Add("data-toggle", "tooltip");
						listSeg.Attributes.Add("data-placement", "top");
						listSeg.Attributes.Add("title", "Presione para crear una obligación para esta medida");

					}
				}
			}

		}
		#endregion

		#region acciones
		protected bool VerificarAplica(int _idMedida)
		{
			bool bAplica = false;
			List<medida_sucursal> ListaMedidasSucursal = new List<medida_sucursal>();
			ListaMedidasSucursal = Mgr_Medidas.Get_MedidasBySucursal(_idMedida);

			foreach (var item in ListaMedidasSucursal)
			{
				int inAplica = Convert.ToInt32(item.aplica);

				if (inAplica == 1)//SI
				{
					bAplica = false;

				}
				else if (inAplica == 0)//NO
				{
					bAplica = true;
				}
			}

			return bAplica;
		}
		protected bool VerificarMedida(int _idMedida)
		{
			bool bAplica = false;

			List<medida_sucursal> ListaMedidasSucursal = new List<medida_sucursal>();
			ListaMedidasSucursal = Mgr_Medidas.Get_MedidasBySucursal(_idMedida);

			foreach (var item in ListaMedidasSucursal)
			{
				string strAplica = Convert.ToString(item.estatus_medida);

				if (strAplica == "0")
				{
					bAplica = false;

				}
				if (strAplica == "1")
				{
					bAplica = true;
				}
			}
			return bAplica;
		}
		protected void GuardarRegistro(object sender, EventArgs e)
		{
			GrupoLiEntities contextoMedida;

			#region actualizar estatus medida
			foreach (ListItem itemActual in chkMedidas.Items)
			{
				contextoMedida = new GrupoLiEntities();
				int id_Medida = Convert.ToInt32(itemActual.Value);
				int EstatusMedida = 0;

				if (itemActual.Selected == true)
				{
					EstatusMedida = 1;
				}
				if (itemActual.Selected == false)
				{
					EstatusMedida = 0;
				}

				medida_sucursal EditMedida = contextoMedida.medida_sucursal.SingleOrDefault(x => x.id_medidas_sucursal == id_Medida);

				if (EditMedida != null)
				{
					EditMedida.estatus_medida = EstatusMedida;
				}

				ObjUsuario.Error = CRUD.Edit_Fila(contextoMedida);

			}
			#endregion


			int contAplica = 0;

			#region actualizar aplica
			foreach (ListItem itemActual in chkAplica.Items)
			{
				contextoMedida = new GrupoLiEntities();
				int id_Medida = Convert.ToInt32(itemActual.Value);
				medida_sucursal EditMedida = contextoMedida.medida_sucursal.SingleOrDefault(x => x.id_medidas_sucursal == id_Medida);

				if (itemActual.Selected == true)
				{
					if (EditMedida != null)
					{
						EditMedida.aplica = 0;
						EditMedida.estatus_medida = 1;
					}
					contAplica++;
				}
				else if (itemActual.Selected == false)
				{
					if (EditMedida != null)
					{
						EditMedida.aplica = 1;
					}
				}

				ObjUsuario.Error = CRUD.Edit_Fila(contextoMedida);//NO

			}
			#endregion


			int contMedidasTotal = 0;
			int contMedidasAplican = 0;

			CargarMedidas();

			#region  actualizar estatus norma

			contMedidasTotal = chkMedidas.Items.Count;
			contMedidasAplican = contMedidasTotal - contAplica;
			int contMedidasSelec = 0;

			foreach (ListItem itemActual in chkMedidas.Items)
			{
				if (itemActual.Selected == true)
				{
					contMedidasSelec++;
				}
			}

			Double porcentaje_medidas = 1.11;
			Double estatus = 0.0;
			if (contMedidasAplican == 0)
			{
				estatus = 100;
			}
			else
			{
				porcentaje_medidas = Math.Round(Convert.ToDouble((100 / (contMedidasAplican))), 2);
				estatus = (contMedidasSelec - contAplica) * porcentaje_medidas;
				estatus = Math.Round(Convert.ToDouble(estatus), 0);
			}

			lbestatus.Text = string.Empty + estatus;

			GrupoLiEntities contexto = new GrupoLiEntities();
			int id_Sucursal = Convert.ToInt32(IdSucursal);
			int id_Norma = Convert.ToInt32(idNorma);
			norma_sucursal Edit = contexto.norma_sucursal.SingleOrDefault(x => x.id_sucursal == id_Sucursal && x.id_normas == id_Norma);

			if (Edit != null)
			{
				Edit.estatus_norma = Convert.ToInt32(estatus);
			}

			ObjUsuario.Error = CRUD.Edit_Fila(contexto);

			#endregion

		}		
		#endregion
	}
}