using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class create_PlanillaEntregaEpp : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;
		private static int IdSucursal = 0;
		private static int IdTrabajador = 0;

		#region Index
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;
			phSucursal.Visible = BoolEmpSuc.Item2;

			if (!IsPostBack)
			{
				CargarListas();
			}
			else
			{
				foreach (var ctlID in Page.Request.Form.AllKeys)
				{
					if (ctlID != null)
					{
						Control c = Page.FindControl(ctlID) as Control;
						if (c is Button)
						{
							if (c.ClientID.Contains("btnDocumento"))
							{
								agregar_fila();
							}

						}
					}
				}
			}
		}

		private void CargarListas()
		{
			Mgr_Empresa.Lista_Empresa(ddlEmpresa);

			if (!BoolEmpSuc.Item1)
			{
				Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
			}
			if (!BoolEmpSuc.Item2)
			{
				Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, ObjUsuario.Id_sucursal);
			}
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
				IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
				Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
			}
			else
			{
				ViewState["sucursal"] = "0";
			}
		}
		protected void ddlTrabajador_SelectedIndexChanged(object sender, EventArgs e)
		{

		}
		#endregion

		#region Imprimir
		protected void GenerarDocumento(object sender, EventArgs e)
		{
			genereDocumento();
		}

		private void genereDocumento()
		{
			Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
			String[] valores = {
				string.Empty + IdEmpSuc.Item2,
				string.Empty + IdEmpSuc.Item1,
				IdTrabajador.ToString(),
				ddlSucursal.SelectedValue,
				ddlTrabajador.SelectedItem.Text
			};
			PrintFile.PrintPlantillaEntregaEPP(valores, pnDatos, this);
		}

		protected void Volver(object sender, EventArgs e)
		{
			Response.Redirect(Paginas.index_PlanillaEntregaEpp.Value);
		}
		
		protected void Guardar(object sender, EventArgs e)
		{
			//agregar_fila();
		}

		private void agregar_fila()
		{
			TableCell _cell;
			TableRow _row;
			Label _label;
			TextBox _textbox;
			int id_puesto_trabajo = Getter.idPuestoTrabajador(Convert.ToInt32(ddlTrabajador.SelectedValue));
			List<Model_CEPP> epps = Getter.Epp(id_puesto_trabajo);
			int cont = 0;

			foreach (var epp in epps)
			{
				_row = new TableRow();

				_cell = new TableCell();
				_label = new Label();
				_label.ID = "lbl" + cont;
				_label.Text = epp.nombre;
				_cell.Controls.Add(_label);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "txtDet" + cont;
				_textbox.CssClass = "form-control";
				_textbox.TextMode = TextBoxMode.MultiLine;
				_textbox.Rows = 2;
				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "txtCant" + cont;
				_textbox.CssClass = "form-control";
				_textbox.TextMode = TextBoxMode.Number;
				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "txtFech" + cont;
				_textbox.CssClass = "form-control";
				_textbox.Text = DateTime.Now.ToString("yyyy-MM-dd");
				_textbox.TextMode = TextBoxMode.Date;

				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);

				tb_datos.Controls.Add(_row);
				cont++;
			}

		}

		#endregion

		#region AutoCompletar
		protected void btnGenerar_OnClick(object sender, EventArgs e)
		{
			if (ddlTrabajador.SelectedValue != string.Empty)
			{
				ViewState["trabajador"] = ddlTrabajador.SelectedValue;
				IdTrabajador = Convert.ToInt32(ddlTrabajador.SelectedValue);

				agregar_fila();
				phInformacion.Visible = true;
			}
			else
			{
				ViewState["trabajador"] = string.Empty;
			}
		}
		#endregion
	}
}