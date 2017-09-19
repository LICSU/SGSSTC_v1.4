using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_PlanTrabajo : Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
            phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;
            phSucursalEdit.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                ListaAnho(ddlYear);
                CargarListas();
                ViewState["anho"] = string.Empty + Convert.ToInt32(DateTime.Now.Year);
            }
        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
                Listas.Empresa(ddlEmpresaAdd);
                Listas.Empresa(ddlEmpresaEdit);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalEdit, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.Usuario_Sucursal(ddlResponsable, ObjUsuario.Id_sucursal);
                Listas.Usuario_Sucursal(ddlResponsableEdit, ObjUsuario.Id_sucursal);
            }

        }
        private void LlenarGridView()
        {
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            if (IdSucursal != 0)
            {
                List<sucursal> ListaSucursal = new List<sucursal>();
                ListaSucursal = Getter.Sucursal(IdSucursal);

                foreach (var item in ListaSucursal)
                {
                    lbSucursal.Text = item.nombre;
                }

                lbAnho.Text = string.Empty + ViewState["anho"];
            }

            Tabla.PlanTrabajo(GridView1, IdSucursal, Convert.ToInt32(string.Empty + ViewState["anho"]));
        }
        #endregion

        #region acciones
        private DropDownList ListaAnho(DropDownList DropDownList1)
        {
            int anhoActual = Convert.ToInt32(DateTime.Now.Year);

            ViewState["anho"] = string.Empty + anhoActual;

            for (int i = (anhoActual + 1); i >= 1950; i--)
            {
                DropDownList1.Items.Add(new ListItem(string.Empty + i, string.Empty + i));
            }

            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Año", ""));

            return DropDownList1;
        }
        protected void Guardar(object sender, EventArgs e)
        {
            string añoIni = TxtSemanaIniAdd.Text.Substring(0, 4);
            string SemIni = TxtSemanaIniAdd.Text.Substring(6, 2);

            string añoFin = TxtSemanaFinAdd.Text.Substring(0, 4);
            string SemFin = TxtSemanaFinAdd.Text.Substring(6, 2);

            if (añoIni != añoFin)
            {
                Modal.MostrarMsjModal(MensajeError.Validacion_Semanas_Año.Value, "ERR", this);
            }
            else if (Convert.ToInt32(SemIni) > Convert.ToInt32(SemFin))
            {
                Modal.MostrarMsjModal(MensajeError.Validacion_SemanaIni_Menor_SemanaFin.Value, "ERR", this);
            }
            else
            {
                plan_trabajo nuevo = new plan_trabajo()
                {
                    nombre = txtActividad.Text,
                    objetivos = txtObjetivos.Text,
                    semana_ini = Convert.ToInt32(SemIni),
                    semana_fin = Convert.ToInt32(SemFin),
                    anho = Convert.ToInt32(añoIni),
                    recursos_aprobados = Convert.ToInt32(txtRecursosAdd.Text),
                    id_responsable = Convert.ToInt32(ddlResponsable.SelectedValue)
                };
                ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

                Modal.CerrarModal("addModal", "AddModalScript", this);

                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

                LlenarGridView();
            }
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            string añoIni = TxtSemanaIniEdit.Text.Substring(0, 4);
            string SemIni = TxtSemanaIniEdit.Text.Substring(6, 2);

            string añoFin = TxtSemanaFinEdit.Text.Substring(0, 4);
            string SemFin = TxtSemanaFinEdit.Text.Substring(6, 2);

            if (añoIni != añoFin)
            {
                Modal.MostrarMsjModal(MensajeError.Validacion_Semanas_Año.Value, "ERR", this);
            }
            else if (Convert.ToInt32(SemIni) > Convert.ToInt32(SemFin))
            {
                Modal.MostrarMsjModal(MensajeError.Validacion_SemanaIni_Menor_SemanaFin.Value, "ERR", this);
            }
            else
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                int idplan_trabajo = Convert.ToInt32(hdfEditID.Value);
                plan_trabajo Edit = contexto.plan_trabajo.SingleOrDefault(b => b.id_plan_trabajo == idplan_trabajo);

                if (Edit != null)
                {
                    Edit.nombre = txtActividadEdit.Text;
                    Edit.objetivos = txtObjetivosEdit.Text;
                    Edit.semana_ini = Convert.ToInt32(SemIni);
                    Edit.semana_fin = Convert.ToInt32(SemFin);
                    Edit.recursos_aprobados = Convert.ToInt32(txtRecursosEdit.Text);
                    Edit.id_responsable = Convert.ToInt32(ddlResponsableEdit.SelectedValue);
                }

                ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

                Modal.CerrarModal("editModal", "EditModalScript", this);

                Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            }
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            plan_trabajo tabla = new plan_trabajo();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);

            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void GenerarDocumentoG(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                ViewState["anho"].ToString()
            };

            PrintFile.PrintPlanTrabajo(valores, this);
        }
        protected void GenerarDocumentoE(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                ViewState["anho"].ToString()
            };

            PrintFile.PrintPlanTrabajoEspecifico(valores, this);
        }
        #endregion

        #region metodos grid
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
			if (ObjUsuario != null)
            {
				
				if (e.Row.RowType == DataControlRowType.Header)
				{
					#region codigo
					GridView HeaderGrid = (GridView)sender;
					GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

					TableCell HeaderCell = new TableCell();
					HeaderCell.Text = string.Empty;
					HeaderCell.ColumnSpan = 7;
					HeaderGridRow.Cells.Add(HeaderCell);
					bool bandera = false;

					for (int i = 1; i <= 52; i++)
					{
						HeaderCell = new TableCell();
						HeaderCell.Text = "SEMANA " + i;
						HeaderGridRow.Cells.Add(HeaderCell);


						if (bandera)
						{
							HeaderCell.HorizontalAlign = HorizontalAlign.Center;
							HeaderCell.BackColor = System.Drawing.ColorTranslator.FromHtml("#00c0ef");
							HeaderCell.ForeColor = System.Drawing.Color.White;
						}
						if (i % 4 == 0)
						{
							bandera = !bandera;
						}

					}

					GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
					#endregion

					Int32 idx = 0;
					foreach (TableCell cell in e.Row.Cells)
					{
						idx++;
						if (idx > 7 && idx < 60)
						{
							DateTime fechaini = FirstDateOfWeekISO8601(Convert.ToInt32(ViewState["anho"]), Convert.ToInt32(cell.Text));
							DateTime fechafin = fechaini.AddDays(6);

							cell.Text = String.Format("{0:m} al {1:m}", fechaini, fechafin);
						}
					}
				}
				
			}
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfEditID.Value = (gvrow.FindControl("id_plan_trabajo") as Label).Text;

                List<plan_trabajo> ListaPlanTrabajo = new List<plan_trabajo>();
                ListaPlanTrabajo = Getter.Plan_Trabajo(0, 0, Convert.ToInt32(hdfEditID.Value));

                foreach (var item in ListaPlanTrabajo)
                {
                    txtActividadEdit.Text = item.nombre;

                    txtObjetivosEdit.Text = item.objetivos;

                    ddlEmpresaEdit.SelectedValue = Convert.ToString(item.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa);

                    Listas.Sucursal(ddlSucursalEdit, Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa));
                    ddlSucursalEdit.SelectedValue = Convert.ToString(item.usuario.trabajador.puesto_trabajo.area.id_sucursal);

                    string formatoIni = DateTime.Now.Year + "-W";
                    string formatoFin = DateTime.Now.Year + "-W";

                    if (item.semana_ini < 10) { formatoIni = DateTime.Now.Year + "-W0"; }
                    if (item.semana_fin < 10) { formatoFin = DateTime.Now.Year + "-W0"; }

                    TxtSemanaIniEdit.Text = formatoIni + Convert.ToString(item.semana_ini);
                    TxtSemanaFinEdit.Text = formatoFin + Convert.ToString(item.semana_fin);

                    txtRecursosEdit.Text = Convert.ToString(item.recursos_aprobados);

                    Listas.Usuario_Sucursal(ddlResponsableEdit, Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.id_sucursal));
                    ddlResponsableEdit.SelectedValue = Convert.ToString(item.id_responsable);
                }

                Modal.registrarModal("editModal", "EditModalScript", this);
                LlenarGridView();
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDDel.Value = (gvrow.FindControl("id_plan_trabajo") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                for (int i = 1; i <= 52; i++)
                {
                    if (Convert.ToString(DataBinder.Eval(e.Row.DataItem, "sem" + i)) != string.Empty)
                    {
                        e.Row.Cells[(i + 6)].BackColor = System.Drawing.Color.CadetBlue;
                    }
                }
            }

            DataRowView drv = e.Row.DataItem as DataRowView;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string idPlanTrabajo = (e.Row.FindControl("id_planTrabajo") as Label).Text;

                List<plan_trabajo> ListaPlanTrabajo = new List<plan_trabajo>();
                ListaPlanTrabajo = Getter.Plan_Trabajo(0, 0, Convert.ToInt32(idPlanTrabajo));

                foreach (var itemPlanTrab in ListaPlanTrabajo)
                {
                    if (itemPlanTrab.obligacion.Count != 0)
                    {
                        Panel p = (Panel)e.Row.FindControl("pnl");

                        p.Controls.Add(
                            new LiteralControl(
                                "<div class='panel'>" +
                                "<div class='panel-heading' style='width: 230px;'>" +
                                    "<a href='#collapse" + e.Row.RowIndex + "' data-parent='#accordion2' data-toggle='collapse' class='accordion-toggle collapsed'>" +
                                        "Ver Obligaciones" +
                                    "</a>" +
                                 "</div>" +
                                 "<div style='height: 0px;width: 230px;' class='panel-collapse collapse' id='collapse" + e.Row.RowIndex + "'>"));

                        foreach (var item in itemPlanTrab.obligacion)
                        {
                            p.Controls.Add(
                                new LiteralControl("<div class='panel-body'>")
                                );

                            string idObligacion = objUtilidades.cifrarCadena(item.id_obligacion.ToString());

                            p.Controls.Add(
                                new LiteralControl("" +
                                "<a href='../Hacer/View_Obligacion.aspx?idO=" + idObligacion + "' target='_blank'>" +
                                "Obligacion N°: " + item.fecha_entrega.Value.ToShortDateString() + "" +
                                "</a>")
                                );

                        }
                        p.Controls.Add(
                            new LiteralControl(
                                "</div>" +
                            "</div>")
                            );
                    }
                    else
                    {
                        Panel p = (Panel)e.Row.FindControl("pnl");
                        p.Controls.Add(new LiteralControl(
                            "<div class='panel'>" +
                                "<div class='panel-heading' style='width: 230px;'>" +
                                    "<a href='#collapse" + e.Row.RowIndex + "' data-parent='#accordion2' data-toggle='collapse' class='accordion-toggle collapsed' style='color:#dd4b39;'>Sin Obligaciones</a>" +
                                 "</div>" +
                                 "<div style='height: 0px;width: 230px;' class='panel-collapse collapse' id='collapse" + e.Row.RowIndex + "'>" +
                                 "</div>" +
                                 "</div>"));
                    }
                }

            }
        }

        public static DateTime FirstDateOfWeekISO8601(int year, int weekOfYear)
        {
            DateTime jan1 = new DateTime(year, 1, 1);
            int daysOffset = DayOfWeek.Thursday - jan1.DayOfWeek;

            DateTime firstThursday = jan1.AddDays(daysOffset);
            var cal = CultureInfo.CurrentCulture.Calendar;
            int firstWeek = cal.GetWeekOfYear(firstThursday, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);

            var weekNum = weekOfYear;
            if (firstWeek <= 1)
            {
                weekNum -= 1;
            }
            var result = firstThursday.AddDays(weekNum * 7);
            return result.AddDays(-3);
        }
        #endregion

        #region filtro
        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlYear.SelectedValue != string.Empty)
            {
                ViewState["anho"] = ddlYear.SelectedValue;
            }
            LlenarGridView();
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }

        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
        }
        protected void ddlSucursalAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalAdd.SelectedValue != string.Empty)
            {
                Listas.Usuario_Sucursal(ddlResponsable, Convert.ToInt32(ddlSucursalAdd.SelectedValue));
            }
        }

        protected void ddlEmpresaEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaEdit.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursalEdit, Convert.ToInt32(ddlEmpresaEdit.SelectedValue));
            }
        }
        protected void ddlSucursalEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalEdit.SelectedValue != string.Empty)
            {
                Listas.Usuario_Sucursal(ddlResponsableEdit, Convert.ToInt32(ddlSucursalEdit.SelectedValue));
            }
        }

        #endregion
    }
}