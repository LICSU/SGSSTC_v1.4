using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class index_Inventario_EPP : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;
		private int cantiEpp = 0;
        private List<Model_CEPP> epps;

		#region Index
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

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
								epps = Getter.Epp(0, Convert.ToInt32(ddlSucursal.SelectedValue));
								cantiEpp = epps.Count;
								agregar_ingresos(epps);
								agregar_egresos(epps);
								agregar_existencia(epps);
							}
							else if (c.ClientID.Contains("btnCalcular"))
							{
								epps = Getter.Epp(0, Convert.ToInt32(ddlSucursal.SelectedValue));
								cantiEpp = epps.Count;
								agregar_ingresos(epps);
								agregar_egresos(epps);
								agregar_existencia(epps);
							}
						}
					}
				}
			}
		}
		private void CargarListas()
		{
			Listas.Empresa(ddlEmpresa);

			if (!BoolEmpSuc.Item1)
			{
				Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
			}

		}
		#endregion

		#region filtro
		protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlEmpresa.SelectedValue != string.Empty)
			{
				ViewState["empresa"] = ddlEmpresa.SelectedValue;
				Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
				epps = Getter.Epp(0, Convert.ToInt32(ddlSucursal.SelectedValue));
				cantiEpp = epps.Count;
				if (cantiEpp > 0)
				{
					agregar_ingresos(epps);
					agregar_egresos(epps);
					agregar_existencia(epps);
					btnCalcular.Enabled = true;
					phInformacion.Visible = true;
					phNoRegistros.Visible = false;
				}
				else
				{
					phInformacion.Visible = false;
					phNoRegistros.Visible = true;
				}
			}
			else
			{
				ViewState["sucursal"] = "0";
			}
		}
		#endregion

		#region Imprimir
		protected void GenerarDocumento(object sender, EventArgs e)
		{
			genereDocumento();
		}
		protected void btnCalcular_Click(object sender, EventArgs e)
		{
			calcular();
		}
		protected void genereDocumento()
		{
			Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
			String[] valores = {
				string.Empty + IdEmpSuc.Item2,
				string.Empty + IdEmpSuc.Item1,
			};
			PrintFile.PrintInventarioEPP(valores, pnExistencia, pnIngresos, pnEgresos, epps, this);
		}		
		private void agregar_ingresos(List<Model_CEPP> epps)
		{
			RegularExpressionValidator _validator;
			TableCell _cell;
			TableRow _row;
			Label _label;
			TextBox _textbox;
			int cont_epp = 0;

			foreach (var epp in epps)
			{
				_row = new TableRow();
				_cell = new TableCell();
				_label = new Label();
				_label.ID = "Ilbl" + cont_epp;
				_label.Text = epp.nombre;
				_cell.Controls.Add(_label);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "ItxtUni" + cont_epp;
				_textbox.CssClass = "form-control";
				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);


				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "ItxtFech" + cont_epp;
				_textbox.CssClass = "form-control";
				_textbox.Text = DateTime.Now.ToString("yyyy-MM-dd");
				_textbox.TextMode = TextBoxMode.Date;
				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "ItxtCant" + cont_epp;
				_textbox.CssClass = "form-control";
				_textbox.TextMode = TextBoxMode.Number;
				_textbox.Text = "0";
				_validator = new RegularExpressionValidator();
				_validator.ID = "IVal" + cont_epp;
				_validator.ErrorMessage = "El valor debe ser mayor a 0";
				_validator.ControlToValidate = "ItxtCant" + cont_epp;
				_validator.ValidationExpression = "^\\d+$";
				_cell.Controls.Add(_textbox);
				_cell.Controls.Add(_validator);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "ItxtProv" + cont_epp;
				_textbox.CssClass = "form-control";
				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);

				tb_ingresos.Controls.Add(_row);
				cont_epp++;
			}
		}
		private void agregar_egresos(List<Model_CEPP> epps)
		{
			TableCell _cell;
			TableRow _row;
			Label _label;
			TextBox _textbox;
			int cont_epp = 0;
			RegularExpressionValidator _validator;

			foreach (var epp in epps)
			{
				_row = new TableRow();
				_cell = new TableCell();
				_label = new Label();
				_label.ID = "Elbl" + cont_epp;
				_label.Text = epp.nombre;
				_cell.Controls.Add(_label);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "EtxtCant" + cont_epp;
				_textbox.CssClass = "form-control";
				_textbox.TextMode = TextBoxMode.Number;
				_textbox.Text = "0";
				_validator = new RegularExpressionValidator();
				_validator.ID = "EVal" + cont_epp;
				_validator.ErrorMessage = "El valor debe ser mayor a 0";
				_validator.ControlToValidate = "EtxtCant" + cont_epp;
				_validator.ValidationExpression = "^\\d+$";
				_cell.Controls.Add(_textbox);
				_cell.Controls.Add(_validator);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "EtxtSol" + cont_epp;
				_textbox.CssClass = "form-control";
				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "EtxtFech" + cont_epp;
				_textbox.CssClass = "form-control";
				_textbox.Text = DateTime.Now.ToString("yyyy-MM-dd");
				_textbox.TextMode = TextBoxMode.Date;
				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);

				tb_egresos.Controls.Add(_row);
				cont_epp++;
			}
		}
		private void agregar_existencia(List<Model_CEPP> epps)
		{
			RegularExpressionValidator _validator;
			TableCell _cell;
			TableRow _row;
			Label _label;
			TextBox _textbox;
			int cont_epp = 0;

			foreach (var epp in epps)
			{
				_row = new TableRow();
				_cell = new TableCell();
				_label = new Label();
				_label.Text = epp.nombre;
				_cell.Controls.Add(_label);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "lblUniExi" + cont_epp;
				_textbox.CssClass = "form-control";
				_textbox.Enabled = false;
				_cell.Controls.Add(_textbox);
				_row.Controls.Add(_cell);

				_cell = new TableCell();
				_textbox = new TextBox();
				_textbox.ID = "txtCantExi" + cont_epp;
				_textbox.CssClass = "form-control";
				_textbox.TextMode = TextBoxMode.Number;
				_textbox.Text = "0";

				_validator = new RegularExpressionValidator();
				_textbox.Enabled = false;
				_validator.ID = "ExVal" + cont_epp;
				_validator.ErrorMessage = "El valor debe ser mayor a 0";
				_validator.ControlToValidate = "txtCantExi" + cont_epp;
				_validator.ValidationExpression = "^\\d+$";
				_cell.Controls.Add(_textbox);
				_cell.Controls.Add(_validator);
				_row.Controls.Add(_cell);

				tb_existencia.Controls.Add(_row);
				cont_epp++;
			}
		}
		protected void calcular()
		{
			TextBox _textbox;
			int cont_epp = 0;
			foreach (var epp in epps)
			{
				_textbox = (TextBox)pnIngresos.FindControl("ItxtCant" + cont_epp);
				string ingreso = _textbox.Text;

				_textbox = (TextBox)pnEgresos.FindControl("EtxtCant" + cont_epp);
				string egreso = _textbox.Text;

				_textbox = (TextBox)pnIngresos.FindControl("ItxtUni" + cont_epp);
				string unidad = _textbox.Text;

				int ingresoInt = Convert.ToInt32(ingreso);
				int egresoInt = Convert.ToInt32(egreso);
				int existencia = 0;

				if (egresoInt >= ingresoInt)
				{
					existencia = 0;
				}
				else
				{
					existencia = ingresoInt - egresoInt;
				}
				_textbox = (TextBox)pnExistencia.FindControl("txtCantExi" + cont_epp);
				_textbox.Text = "" + existencia;
				_textbox = (TextBox)pnExistencia.FindControl("lblUniExi" + cont_epp);
				_textbox.Text = "" + unidad;
				cont_epp++;
			}
			btnDocumento.Enabled = true;
		}
		#endregion
	}
}