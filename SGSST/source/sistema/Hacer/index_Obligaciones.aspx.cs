using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Usuario;
using Capa_Datos.Manager.Categoria;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Obligaciones : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;

		#region metodos index
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;
			phSucursal.Visible = BoolEmpSuc.Item2;

			DateTime fechaActual = DateTime.Now;
			ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
			ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");

			if (!IsPostBack)
			{
				txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
				txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");

				ViewState["responsable"] = "0";
				ViewState["Categoria"] = "0";

				LlenarGridView();
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
				Mgr_Usuario.Usuario_Empresa(ddlResponsable, ObjUsuario.Id_empresa);
				Mgr_Usuario.Usuario_Empresa(ddlResponsableEdit, ObjUsuario.Id_empresa);

				Mgr_Categoria.Categorias(ddlCategoria, ObjUsuario.Id_empresa);
				Mgr_Categoria.Categorias(ddlCategoriaEdit, ObjUsuario.Id_empresa);
			}

			if (!BoolEmpSuc.Item2)
			{
				Mgr_Usuario.Usuario_Sucursal(ddlResponsable, ObjUsuario.Id_sucursal);
				Mgr_Usuario.Usuario_Sucursal(ddlResponsableEdit, ObjUsuario.Id_sucursal);
			}

			Listas.Frecuencia(ddlFrecuenciaEdit);
		}
		private void LlenarGridView()
		{
			int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
			int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

			Tabla.Obligaciones(
				GridView1,
				IdEmpresa,
				Convert.ToInt32(string.Empty + ViewState["responsable"]),
				Convert.ToInt32(string.Empty + ViewState["Categoria"]),
				string.Empty + ViewState["Prioridad"],
				string.Empty + ViewState["Estatus"],
				string.Empty + ViewState["FechaInicio"],
				string.Empty + ViewState["FechaFin"],
				string.Empty + ViewState["buscar"],
				IdSucursal);
		}
		protected void EditarRegistro(object sender, EventArgs e)
		{
			GrupoLiEntities contexto = new GrupoLiEntities();
			int idObli = Convert.ToInt32(hdfObligacionID.Value);
			obligacion Edit = contexto.obligacion.SingleOrDefault(b => b.id_obligacion == idObli);
			if (Edit != null)
			{
				Edit.fecha_entrega = Convert.ToDateTime(txtFechaEdit.Text);
				Edit.id_responsable = Convert.ToInt32(ddlResponsableEdit.SelectedValue);
				Edit.id_categorias = Convert.ToInt32(ddlCategoriaEdit.SelectedValue);
				Edit.prioridad = ddlPrioridadEdit.SelectedValue;
				Edit.id_frecuencia_con = Convert.ToInt32(ddlFrecuenciaEdit.SelectedValue);
				Edit.descripcion = txtDescEdit.Text;
				Edit.acciones = txtAccionesEdit.Text;
				Edit.estatus_obl = ddlEstatusEdit.SelectedValue;
			}

			ObjUsuario.Error = CRUD.Edit_Fila(contexto);

			Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
			LlenarGridView();

		}
		protected void EliminarRegistro(object sender, EventArgs e)
		{
			obligacion tabla = new obligacion();

			ObjUsuario.Error = CRUD.Delete_Fila(
				tabla,
				Convert.ToInt32(hdfObligacionIDDel.Value));
				
			Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
			Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
			LlenarGridView();
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
			if (e.CommandName.Equals(ComandosGrid.Editar.Value))
			{
				int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
				GridViewRow gvrow = GridView1.Rows[RowIndex];

				hdfObligacionID.Value = (gvrow.FindControl("id_obligacion") as Label).Text;

				List<obligacion> ListaObligacion = new List<obligacion>();
				ListaObligacion = Getter.Obligacion(Convert.ToInt32(hdfObligacionID.Value));
				foreach (var item in ListaObligacion)
				{
					DateTime fechaEva = Convert.ToDateTime(Convert.ToString(item.fecha_creacion));
					txtFechaEdit.Text = fechaEva.ToString("yyyy-MM-dd");

					Mgr_Usuario.Usuario_Sucursal(ddlResponsableEdit, Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.id_sucursal));
					ddlResponsableEdit.SelectedValue = Convert.ToString(item.id_responsable);

					Mgr_Categoria.Categorias(ddlCategoriaEdit, Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa));
					ddlCategoriaEdit.SelectedValue = Convert.ToString(item.id_categorias);

					ddlPrioridadEdit.SelectedValue = item.prioridad;
					ddlFrecuenciaEdit.SelectedValue = Convert.ToString(item.id_frecuencia_con);

					ddlEstatusEdit.SelectedValue = item.estatus_obl;

					txtDescEdit.Text = Convert.ToString(item.descripcion);
					txtAccionesEdit.Text = Convert.ToString(item.acciones);
				}

				Modal.registrarModal("editModal", "EditModalScript", this);
			}
			else if (e.CommandName.Equals("Ver"))
			{
				int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
				GridViewRow gvrow = GridView1.Rows[RowIndex];

				hdfObligacionID.Value = (gvrow.FindControl("id_obligacion") as Label).Text;

				List<obligacion> ListaObligacion = new List<obligacion>();
				ListaObligacion = Getter.Obligacion(Convert.ToInt32(hdfObligacionID.Value));

				foreach (var item in ListaObligacion)
				{
					DateTime fechaEva = Convert.ToDateTime(Convert.ToString(item.fecha_creacion));
					txtViewFecha.Text = fechaEva.ToString("yyyy-MM-dd");

					if (Convert.ToString(item.id_medida_sucursal) != "0")
					{
						lbMedida.InnerHtml = "Medida";
						txtViewMedida.Text = Convert.ToString(item.medida_sucursal.descripcion);
					}
					else if (Convert.ToString(item.identificacion_peligro) != "0")
					{
						lbMedida.InnerHtml = "Riesgo";
						txtViewMedida.Text = Convert.ToString(item.identificacion_peligro.observaciones);
					}

					txtViewResp.Text = Convert.ToString(item.usuario.login);

					Mgr_Categoria.Categorias(ddlCategoriaEdit, Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa));
					ddlCategoriaEdit.SelectedValue = Convert.ToString(item.id_categorias);
					txtViewCategoria.Text = ddlCategoriaEdit.SelectedItem.ToString();

					ddlPrioridadEdit.SelectedValue = item.prioridad;
					txtViewPrioridad.Text = ddlPrioridadEdit.SelectedItem.ToString();

					ddlFrecuenciaEdit.SelectedValue = Convert.ToString(item.id_frecuencia_con);
					txtViewFrecuencia.Text = ddlFrecuenciaEdit.SelectedItem.ToString();

					ddlEstatusEdit.SelectedValue = item.estatus_obl;
					txtViewEstatus.Text = ddlEstatusEdit.SelectedItem.ToString();

					txtViewDesc.Text = Convert.ToString(item.descripcion);
					txtViewAcciones.Text = Convert.ToString(item.acciones);

					Modal.registrarModal("viewModal", "viewModalScript", this);
				}

			}
			else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
			{
				int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
				GridViewRow gvrow = GridView1.Rows[RowIndex];

				hdfObligacionIDDel.Value = (gvrow.FindControl("id_obligacion") as Label).Text;
				Modal.registrarModal("deleteModal", "DeleteModalScript", this);
			}
		}
		protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
		{
		}
		#endregion

		#region filtros
		protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlEmpresa.SelectedValue != string.Empty)
			{
				ViewState["empresa"] = ddlEmpresa.SelectedValue;
				Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));

				Mgr_Usuario.Usuario_Empresa(ddlResponsable, Convert.ToInt32(ddlEmpresa.SelectedValue));
				Mgr_Usuario.Usuario_Empresa(ddlResponsableEdit, Convert.ToInt32(ddlEmpresa.SelectedValue));
				Mgr_Categoria.Categorias(ddlCategoria, Convert.ToInt32(ddlEmpresa.SelectedValue));
				Mgr_Categoria.Categorias(ddlCategoriaEdit, Convert.ToInt32(ddlEmpresa.SelectedValue));
			}
			else
			{
				ViewState["empresa"] = "0";
			}
			LlenarGridView();
		}
		protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlSucursal.SelectedValue != string.Empty)
			{
				ViewState["sucursal"] = ddlSucursal.SelectedValue;
				Mgr_Usuario.Usuario_Sucursal(ddlResponsable, Convert.ToInt32(ddlSucursal.SelectedValue));
				Mgr_Usuario.Usuario_Sucursal(ddlResponsableEdit, Convert.ToInt32(ddlSucursal.SelectedValue));
			}
			else
			{
				ViewState["sucursal"] = "0";
			}
			LlenarGridView();
		}

		protected void ddlResponsable_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlResponsable.SelectedValue != string.Empty)
			{
				ViewState["responsable"] = ddlResponsable.SelectedValue;
			}
			else
			{
				ViewState["responsable"] = "0";
			}
			LlenarGridView();
		}
		protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlCategoria.SelectedValue != string.Empty)
			{
				ViewState["Categoria"] = ddlCategoria.SelectedValue;
			}
			else
			{
				ViewState["Categoria"] = "0";
			}
			LlenarGridView();

		}
		protected void ddlPrioridad_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlPrioridad.SelectedValue != string.Empty)
			{
				ViewState["Prioridad"] = ddlPrioridad.SelectedValue;
			}
			else
			{
				ViewState["Prioridad"] = string.Empty;
			}
			LlenarGridView();
		}
		protected void ddlEstatus_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlEstatus.SelectedValue != string.Empty)
			{
				ViewState["Estatus"] = ddlEstatus.SelectedValue;
			}
			else
			{
				ViewState["Estatus"] = string.Empty;
			}
			LlenarGridView();

		}
		protected void txtFechaInicio_TextChanged(object sender, EventArgs e)
		{
			if (txtFechaInicio.Text != string.Empty)
			{
				ViewState["FechaInicio"] = txtFechaInicio.Text;
			}
			else
			{
				ViewState["FechaInicio"] = string.Empty;
			}
			LlenarGridView();
		}
		protected void txtFechaFin_TextChanged(object sender, EventArgs e)
		{
			if (txtFechaFin.Text != string.Empty)
			{
				ViewState["FechaFin"] = txtFechaFin.Text;
			}
			else
			{
				ViewState["FechaFin"] = string.Empty;
			}
			LlenarGridView();
		}
		protected void BuscarRegistro(object sender, EventArgs e)
		{
			if (txtBuscar.Text != string.Empty)
			{
				ViewState["buscar"] = txtBuscar.Text;
			}
			else
			{
				ViewState["buscar"] = string.Empty;
			}
			LlenarGridView();
		}
		#endregion
	}
}