using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_GestionLaboral : Page
    {
        private Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            #region plceholders
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpAddAct.Visible = BoolEmpSuc.Item1;
            phEmpEditAct.Visible = BoolEmpSuc.Item1;
            phEmpAddJor.Visible = BoolEmpSuc.Item1;
            phEmpEditJor.Visible = BoolEmpSuc.Item1;
            phEmpAddCap.Visible = BoolEmpSuc.Item1;
            phEmpEditCap.Visible = BoolEmpSuc.Item1;
            phEmpAddEnt.Visible = BoolEmpSuc.Item1;
            phEmpEditEnt.Visible = BoolEmpSuc.Item1;

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucAddEnt.Visible = BoolEmpSuc.Item2;
            phSucEditEnt.Visible = BoolEmpSuc.Item2;
            phSucAddCap.Visible = BoolEmpSuc.Item2;
            phSucEditCap.Visible = BoolEmpSuc.Item2;
            phSucAddAct.Visible = BoolEmpSuc.Item2;
            phSucEditAct.Visible = BoolEmpSuc.Item2;
            phSucAddJor.Visible = BoolEmpSuc.Item2;
            phSucEditJor.Visible = BoolEmpSuc.Item2;

            phAsisAddCap.Visible = !BoolEmpSuc.Item1;
            phAsisEditCap.Visible = !BoolEmpSuc.Item1;
            phAsisAddEnt.Visible = !BoolEmpSuc.Item1;
            phAsisEditEnt.Visible = !BoolEmpSuc.Item1;
            phAsisAddAct.Visible = !BoolEmpSuc.Item1;
            phAsisEditAct.Visible = !BoolEmpSuc.Item1;
            phAsisAddJor.Visible = !BoolEmpSuc.Item1;
            phAsisEditJor.Visible = !BoolEmpSuc.Item1;
            #endregion

            if (!IsPostBack)
            {

                DateTime fechaActual = DateTime.Now;
                ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
                ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");
                ViewState["TipoGestion"] = "0";

                txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
                txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");
                LlenarGridView();
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
                            if (c.ClientID.Contains("btnAsistencia"))
                            {

                            }
                        }
                    }
                }
            }
        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
                Listas.Empresa(ddlEmpAddCap);
                Listas.Empresa(ddlEmpEditCap);
                Listas.Empresa(ddlEmpAddEnt);
                Listas.Empresa(ddlEmpEditEnt);
                Listas.Empresa(ddlEmpAddAct);
                Listas.Empresa(ddlEmpEditAct);
                Listas.Empresa(ddlEmpAddJor);
                Listas.Empresa(ddlEmpEditJor);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucAddEnt, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucEditEnt, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucAddCap, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucEditCap, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucAddAct, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucEditAct, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucAddJor, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucEditJor, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Cargartrabajadores(ObjUsuario.Id_sucursal);
                Listas.Usuario_Sucursal(ddlUsuAddEnt, Convert.ToInt32((ObjUsuario.Id_sucursal)));
                Listas.Usuario_Sucursal(ddlUsuEditEnt, Convert.ToInt32((ObjUsuario.Id_sucursal)));
                Listas.Usuario_Sucursal(ddlUsuAddCap, Convert.ToInt32((ObjUsuario.Id_sucursal)));
                Listas.Usuario_Sucursal(ddlUsuEditCap, Convert.ToInt32((ObjUsuario.Id_sucursal)));
                Listas.Usuario_Sucursal(ddlUsuAddAct, Convert.ToInt32((ObjUsuario.Id_sucursal)));
                Listas.Usuario_Sucursal(ddlUsuEditAct, Convert.ToInt32((ObjUsuario.Id_sucursal)));
                Listas.Usuario_Sucursal(ddlUsuAddJor, Convert.ToInt32((ObjUsuario.Id_sucursal)));
                Listas.Usuario_Sucursal(ddlUsuEditJor, Convert.ToInt32((ObjUsuario.Id_sucursal)));
            }

        }
        private void Cargartrabajadores(int _id_sucursal)
        {
            List<sucursal> ListaSucursal = new List<sucursal>();
            ListaSucursal = Getter.Sucursal(_id_sucursal, 0, "");

            foreach (var itemSucursal in ListaSucursal)
            {
                int contador = 0;
                foreach (var item1 in itemSucursal.area)
                {
                    foreach (var item2 in item1.puesto_trabajo)
                    {
                        foreach (var item3 in item2.trabajador)
                        {
                            contador++;
                            ListItem item = new ListItem();
                            item.Text = " " + contador + ") " + item3.primer_nombre + " " + item3.primer_apellido;
                            item.Value = Convert.ToString(item3.id_trabajador);
                            chkTrabajadores.Items.Add(item);
                        }
                    }
                }
            }

        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));
            int IdUsuario = 0;

            if (ObjUsuario.isResponsable())
            {
                IdUsuario = ObjUsuario.Id_usuario;
            }
            
            Tabla.GestionLaboral(GridView1,
                IdEmpresa,
                IdSucursal,
                Convert.ToInt32("0" +  ViewState["TipoGestion"]),
                string.Empty + ViewState["FechaInicio"],
                string.Empty + ViewState["FechaFin"],
                string.Empty + ViewState["search"],
                IdUsuario);
        }
        #endregion

        #region acciones
        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            string ruta = Utilidades.GuardarArchivo(flEscaneado, hdfIDEsc.Value + "ArchivoGestionLaboral", "~/archivos/gestiones/");

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idGestion = Convert.ToInt32(hdfIDEsc.Value);
            gestion_laboral Edit = contexto.gestion_laboral.SingleOrDefault(b => b.id_ges_lab == idGestion);

            if (Edit != null)
            {
                Edit.soporte = ruta;
            }

            CRUD.Edit_Fila(contexto);
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            gestion_laboral tabla = new gestion_laboral();

            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void btPrint_Click(object sender, EventArgs e)
        {
            String[] valores = {
                ViewState["Imprimir"].ToString()
            };

            PrintFile.PrintGestionLaboral(valores, this);            
        }
        #endregion

        #region  registro de los modales
        protected void cerrarModalIndex(object sender, EventArgs e)
        {            
            Modal.CerrarModal("IndexAddModal", "AddModalScript", this);
        }
        #endregion

        #region entrega de equipos
        protected void InsertarEntrega(object sender, EventArgs e)
        {
            int IdUsuario = Getter.Set_IdUsuarioDDl(ObjUsuario, ddlUsuAddEnt);

            gestion_laboral nuevoGestion = new gestion_laboral()
            {
                fecha = Convert.ToDateTime(txtFechaEntrega.Text),
                descripcion = txtDescEntrega.Text,
                tipo_gestion = 1,
                id_usuario = IdUsuario
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevoGestion);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Entrega de Equipos  " + txtDescEntrega.Text,
                    fecha = Convert.ToDateTime(txtFechaEntrega.Text),
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            }

            if (ObjUsuario.Error)
            {
                string id_ges_lab = Convert.ToString(GetterMax.GestionLaboral());

                foreach (ListItem item in chkTrabajadores.Items)
                {
                    if (item.Selected == true)
                    {
                        trabajador_gestion nuevoTG = new trabajador_gestion()
                        {
                            id_trabajador = Convert.ToInt32(item.Value),
                            id_ges_lab = Convert.ToInt32(id_ges_lab)
                        };

                        ObjUsuario.Error = CRUD.Add_Fila(nuevoTG);
                    }
                }
                Modal.CerrarModal("AddEntrega", "AddModalScript", this);
                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
                LlenarGridView();
            }
        }
        protected void btnEditarEntrega_Click(object sender, EventArgs e)
        {
            int IdUsuario = Getter.Set_IdUsuarioDDl(ObjUsuario, ddlUsuEditEnt);

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idGestion = Convert.ToInt32(hdfEditEntregaID.Value);
            gestion_laboral Edit = contexto.gestion_laboral.SingleOrDefault(b => b.id_ges_lab == idGestion);
            if (Edit != null)
            {
                Edit.fecha = Convert.ToDateTime(txtFechaEditEntrega.Text);
                Edit.descripcion = txtDescEditEntrega.Text;
                Edit.cant_horas = 0;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Entrega de Equipos (Editado) " + txtDescEditEntrega.Text,
                    fecha = Convert.ToDateTime(txtFechaEditEntrega.Text),
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            }

            if (ObjUsuario.Error)
            {
                trabajador_gestion tabla = new trabajador_gestion();
                ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfEditEntregaID.Value));

                foreach (ListItem item in chkTrabajadores.Items)
                {
                    if (item.Selected == true)
                    {
                        trabajador_gestion nuevoTG1 = new trabajador_gestion()
                        {
                            id_trabajador = Convert.ToInt32(item.Value),
                            id_ges_lab = Convert.ToInt32(hdfEditEntregaID.Value)
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoTG1);
                    }
                }
            }

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            Modal.CerrarModal("EditEntrega", "EditModalScript", this);
            LlenarGridView();
        }
        #endregion

        #region Capacitacion
        protected void InsertarCapacitacion(object sender, EventArgs e)
        {
            int IdUsuario = Convert.ToInt32(ddlUsuAddCap.SelectedValue);

            gestion_laboral nuevoGestion = new gestion_laboral()
            {
                fecha = Convert.ToDateTime(txtFechaCapacitacion.Text),
                descripcion = txtDescCapAdd.Text,
                tipo_gestion = 2,
                cant_horas = Convert.ToInt32(txtHoras.Text),
                objetivos = txtObjCapAdd.Text,
                id_usuario = IdUsuario
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevoGestion);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Capacitacion  " + txtDescCapAdd.Text,
                    fecha = Convert.ToDateTime(txtFechaCapacitacion.Text),
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };
                ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            }

            if (ObjUsuario.Error)
            {
                #region trabajador gestion
                string id_ges_lab = Convert.ToString(GetterMax.GestionLaboral());

                foreach (ListItem item in chkTrabajadores.Items)
                {
                    if (item.Selected == true)
                    {
                        trabajador_gestion nuevoTG2 = new trabajador_gestion()
                        {
                            id_trabajador = Convert.ToInt32(item.Value),
                            id_ges_lab = Convert.ToInt32(id_ges_lab),
                            asistencia = "-"
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoTG2);

                    }
                }
                #endregion

                Modal.CerrarModal("AddCapacitacion", "AddModalScript", this);
                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
                LlenarGridView();
            }
        }
        protected void btnEditarCapacitacion_Click(object sender, EventArgs e)
        {
            int IdUsuario = Convert.ToInt32(ddlUsuEditCap.SelectedValue);

            int idGestion = Convert.ToInt32(hdfEditCapacitacionID.Value);

            GrupoLiEntities contexto = new GrupoLiEntities();
            gestion_laboral Edit = contexto.gestion_laboral.SingleOrDefault(b => b.id_ges_lab == idGestion);
            if (Edit != null)
            {
                Edit.fecha = Convert.ToDateTime(txtFechaEditCapacitacion.Text);
                Edit.descripcion = txtDesCapEdit.Text;
                Edit.cant_horas = Convert.ToInt32(txtHorasEditCapacitacion.Text);
                Edit.objetivos = txtObjCapEdit.Text;
                Edit.id_usuario = IdUsuario;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Capacitacion (Editado) " + txtDesCapEdit.Text,
                    fecha = Convert.ToDateTime(txtFechaEditCapacitacion.Text),
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            }

            if (ObjUsuario.Error)
            {
                trabajador_gestion tabla = new trabajador_gestion();
                ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfEditCapacitacionID.Value));

                foreach (ListItem item in chkTrabajadores.Items)
                {
                    if (item.Selected == true)
                    {
                        trabajador_gestion nuevoTG3 = new trabajador_gestion()
                        {
                            id_trabajador = Convert.ToInt32(item.Value),
                            id_ges_lab = Convert.ToInt32(hdfEditCapacitacionID.Value),
                            asistencia = "-"
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoTG3);
                    }
                }
            }

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            Modal.CerrarModal("EditCapacitacion", "EditModalScript", this);
            LlenarGridView();
        }
        #endregion

        #region Actividades Recreativas
        protected void InsertarActividad(object sender, EventArgs e)
        {
            int IdUsuario = Convert.ToInt32(ddlUsuAddAct.SelectedValue);

            gestion_laboral nuevoGestion = new gestion_laboral()
            {
                fecha = Convert.ToDateTime(txtFechaActividad.Text),
                descripcion = txtDescActividad.Text,
                tipo_gestion = 4,
                id_usuario = IdUsuario
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevoGestion);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Actividad Recreativa  " + txtDescActividad.Text,
                    fecha = Convert.ToDateTime(txtFechaActividad.Text),
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            }

            if (ObjUsuario.Error)
            {
                #region trabajador gestion
                string id_ges_lab = Convert.ToString(GetterMax.GestionLaboral());

                foreach (ListItem item in chkTrabajadores.Items)
                {
                    if (item.Selected == true)
                    {
                        trabajador_gestion nuevoTG4 = new trabajador_gestion()
                        {
                            id_trabajador = Convert.ToInt32(item.Value),
                            id_ges_lab = Convert.ToInt32(id_ges_lab)
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoTG4);

                    }
                }
                #endregion

                Modal.CerrarModal("AddActividad", "AddModalScript", this);
                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
                LlenarGridView();
            }

        }
        protected void btnEditarActividad_Click(object sender, EventArgs e)
        {
            int IdUsuario = Convert.ToInt32(ddlUsuEditAct.SelectedValue);

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idGestion = Convert.ToInt32(hdfEditActividadID.Value);
            gestion_laboral Edit = contexto.gestion_laboral.SingleOrDefault(b => b.id_ges_lab == idGestion);
            if (Edit != null)
            {
                Edit.fecha = Convert.ToDateTime(txtFechaEditActividad.Text);
                Edit.descripcion = txtDescEditActividad.Text;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Actividad Recreativa (Editado) " + txtDescEditActividad.Text,
                    fecha = Convert.ToDateTime(txtFechaEditActividad.Text),
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            }

            if (ObjUsuario.Error)
            {
                #region codigo
                gestion_laboral tabla = new gestion_laboral();

                foreach (ListItem item in chkTrabajadores.Items)
                {
                    if (item.Selected == true)
                    {
                        trabajador_gestion nuevoTG5 = new trabajador_gestion()
                        {
                            id_trabajador = Convert.ToInt32(item.Value),
                            id_ges_lab = Convert.ToInt32(hdfEditActividadID.Value)
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoTG5);

                    }
                }
                #endregion
            }

            Modal.CerrarModal("EditActividad", "EditModalScript", this);
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();

        }
        #endregion

        #region jornadas examenes
        protected void InsertarJornada(object sender, EventArgs e)
        {
            int IdUsuario = Convert.ToInt32(ddlUsuAddJor.SelectedValue);

            gestion_laboral nuevoGestion = new gestion_laboral()
            {
                fecha = Convert.ToDateTime(txtFechaJornada.Text),
                descripcion = txtDescJornada.Text,
                tipo_gestion = 3,
                id_usuario = IdUsuario
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevoGestion);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Jornada de Examenes  " + txtDescJornada.Text,
                    fecha = Convert.ToDateTime(txtFechaJornada.Text),
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            }

            if (ObjUsuario.Error)
            {
                #region trabajador gestion
                string id_ges_lab = Convert.ToString(GetterMax.GestionLaboral());

                foreach (ListItem item in chkTrabajadores.Items)
                {
                    if (item.Selected == true)
                    {
                        trabajador_gestion nuevoTG6 = new trabajador_gestion()
                        {
                            id_trabajador = Convert.ToInt32(item.Value),
                            id_ges_lab = Convert.ToInt32(id_ges_lab)
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoTG6);

                    }
                }
                #endregion

                Modal.CerrarModal("AddJornada", "AddModalScript", this);
                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
                LlenarGridView();
            }

        }
        protected void btnEditarJornada_Click(object sender, EventArgs e)
        {
            int IdUsuario = Convert.ToInt32(ddlUsuEditJor.SelectedValue);

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idGestion = Convert.ToInt32(hdfEditJornadaID.Value);
            gestion_laboral Edit = contexto.gestion_laboral.SingleOrDefault(b => b.id_ges_lab == idGestion);
            if (Edit != null)
            {
                Edit.fecha = Convert.ToDateTime(txtFechaEditJornada.Text);
                Edit.descripcion = txtDescEditJornada.Text;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Jornada Examenes (Editado) " + txtDescEditJornada.Text,
                    fecha = Convert.ToDateTime(txtFechaEditJornada.Text),
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            }

            if (ObjUsuario.Error)
            {
                #region codigo
                gestion_laboral tabla = new gestion_laboral();
                //ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfEditJornadaID.Value));

                foreach (ListItem item in chkTrabajadores.Items)
                {
                    if (item.Selected == true)
                    {
                        trabajador_gestion nuevoTG7 = new trabajador_gestion()
                        {
                            id_trabajador = Convert.ToInt32(item.Value),
                            id_ges_lab = Convert.ToInt32(hdfEditJornadaID.Value)
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoTG7);

                    }
                }
                #endregion
            }

            Modal.CerrarModal("EditJornada", "EditModalScript", this);
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region Exportar listas
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        private void incializarExports()
        {
            GridView1.Columns[6].Visible = false;
            GridView1.Columns[7].Visible = false;
            GridView1.Columns[8].Visible = false;
            GridView1.Columns[9].Visible = false;
            GridView1.Columns[10].Visible = false;
            GridView1.Columns[11].Visible = false;
            GridView1.Columns[12].Visible = false;
            LlenarGridView();
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "GestionLaboral", "Lista de Gestiones Laborales");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "GestionLaboral", "Lista de Gestiones Laborales");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "GestionLaboral", "Lista de Gestiones Laborales");
        }
        #endregion

        #region eventos del grid
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
                string tipo = (gvrow.FindControl("tipo") as Label).Text;

                foreach (ListItem item in chkTrabajadores.Items) { item.Selected = false; }

                if (tipo == "1")
                {
                    hdfEditEntregaID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                    List<gestion_laboral> EditCapacitacion = new List<gestion_laboral>();
                    EditCapacitacion = Getter.GestionLaboral(Convert.ToInt32(hdfEditEntregaID.Value));

                    foreach (var item in EditCapacitacion)
                    {
                        int idEmpresa = Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa);
                        int idSucursal = Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.id_sucursal);
                        int idUsuario = Convert.ToInt32(item.id_usuario);
                        ddlEmpEditEnt.SelectedValue = idEmpresa.ToString();

                        Listas.Sucursal(ddlSucEditEnt, idEmpresa);
                        ddlSucEditEnt.SelectedValue = idSucursal.ToString();

                        chkTrabajadores.Items.Clear();
                        Cargartrabajadores(idSucursal);
                        Listas.Usuario_Sucursal(ddlUsuEditEnt, idSucursal);
                        ddlUsuEditEnt.SelectedValue = idUsuario.ToString();

                        DateTime fechaGestion = Convert.ToDateTime(Convert.ToString(item.fecha));
                        txtFechaEditEntrega.Text = fechaGestion.ToString("yyyy-MM-dd");

                        txtDescEditEntrega.Text = item.descripcion;

                        List<trabajador_gestion> _listatrab = Getter.TrabajadorInGestion(0, Convert.ToInt32(hdfEditEntregaID.Value));

                        foreach (var trab in _listatrab)
                        {
                            if (chkTrabajadores.Items.FindByValue(trab.id_trabajador.ToString()) != null)
                            {
                                chkTrabajadores.Items.FindByValue(trab.id_trabajador.ToString()).Selected = true;
                            }
                        }
                    }

                    Modal.registrarModal("EditEntrega", "EditModalScript", this);
                    
                }
                else if (tipo == "3")
                {
                    hdfEditJornadaID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                    List<gestion_laboral> EditJornada = new List<gestion_laboral>();
                    EditJornada = Getter.GestionLaboral(Convert.ToInt32(hdfEditJornadaID.Value));

                    foreach (var item in EditJornada)
                    {
                        int idEmpresa = Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa);
                        int idSucursal = Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.id_sucursal);
                        int idUsuario = Convert.ToInt32(item.id_usuario);
                        ddlEmpEditJor.SelectedValue = idEmpresa.ToString();

                        Listas.Sucursal(ddlSucEditJor, idEmpresa);
                        ddlSucEditJor.SelectedValue = idSucursal.ToString();

                        chkTrabajadores.Items.Clear();
                        Cargartrabajadores(idSucursal);
                        Listas.Usuario_Sucursal(ddlUsuEditJor, idSucursal);
                        ddlUsuEditJor.SelectedValue = idUsuario.ToString();

                        DateTime fechaGestion = Convert.ToDateTime(Convert.ToString(item.fecha));
                        txtFechaEditJornada.Text = fechaGestion.ToString("yyyy-MM-dd");

                        txtDescEditJornada.Text = item.descripcion;

                        List<trabajador_gestion> _listatrab = Getter.TrabajadorInGestion(0, Convert.ToInt32(hdfEditJornadaID.Value));

                        foreach (var trab in _listatrab)
                        {
                            if (chkTrabajadores.Items.FindByValue(trab.id_trabajador.ToString()) != null)
                            {
                                chkTrabajadores.Items.FindByValue(trab.id_trabajador.ToString()).Selected = true;
                            }
                        }
                    }

                    Modal.registrarModal("EditJornada", "EditModalScript", this);
                    
                }
                else if (tipo == "4")
                {
                    hdfEditActividadID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                    List<gestion_laboral> EditActividad = new List<gestion_laboral>();
                    EditActividad = Getter.GestionLaboral(Convert.ToInt32(hdfEditActividadID.Value));

                    foreach (var item in EditActividad)
                    {
                        int idEmpresa = Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa);
                        int idSucursal = Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.id_sucursal);
                        int idUsuario = Convert.ToInt32(item.id_usuario);
                        ddlEmpEditAct.SelectedValue = idEmpresa.ToString();

                        Listas.Sucursal(ddlSucEditAct, idEmpresa);
                        ddlSucEditAct.SelectedValue = idSucursal.ToString();

                        chkTrabajadores.Items.Clear();
                        Cargartrabajadores(idSucursal);
                        Listas.Usuario_Sucursal(ddlUsuEditAct, idSucursal);
                        ddlUsuEditAct.SelectedValue = idUsuario.ToString();

                        DateTime fechaGestion = Convert.ToDateTime(Convert.ToString(item.fecha));
                        txtFechaEditActividad.Text = fechaGestion.ToString("yyyy-MM-dd");

                        txtDescEditActividad.Text = item.descripcion;

                        List<trabajador_gestion> _listatrab = Getter.TrabajadorInGestion(0, Convert.ToInt32(hdfEditActividadID.Value));

                        foreach (var trab in _listatrab)
                        {
                            if (chkTrabajadores.Items.FindByValue(trab.id_trabajador.ToString()) != null)
                            {
                                chkTrabajadores.Items.FindByValue(trab.id_trabajador.ToString()).Selected = true;
                            }
                        }
                    }
                    Modal.registrarModal("EditActividad", "EditModalScript", this);
                    
                }
                else if (tipo == "2")
                {
                    hdfEditCapacitacionID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                    
                    Modal.registrarModal("EditCapacitacion", "EditModalScript", this);
                    

                    List<gestion_laboral> EditCapacitacion = new List<gestion_laboral>();
                    EditCapacitacion = Getter.GestionLaboral(Convert.ToInt32(hdfEditCapacitacionID.Value));

                    foreach (var item in EditCapacitacion)
                    {
                        int idEmpresa = Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa);
                        int idSucursal = Convert.ToInt32(item.usuario.trabajador.puesto_trabajo.area.id_sucursal);
                        int idUsuario = Convert.ToInt32(item.id_usuario);
                        ddlEmpEditCap.SelectedValue = idEmpresa.ToString();

                        Listas.Sucursal(ddlSucEditCap, idEmpresa);
                        ddlSucEditCap.SelectedValue = idSucursal.ToString();

                        chkTrabajadores.Items.Clear();
                        Cargartrabajadores(idSucursal);
                        Listas.Usuario_Sucursal(ddlUsuEditCap, idSucursal);
                        ddlUsuEditCap.SelectedValue = idUsuario.ToString();

                        DateTime fechaGestion = Convert.ToDateTime(Convert.ToString(item.fecha));
                        txtFechaEditCapacitacion.Text = fechaGestion.ToString("yyyy-MM-dd");

                        txtDesCapEdit.Text = item.descripcion;
                        txtObjCapEdit.Text = item.objetivos;
                        txtHorasEditCapacitacion.Text = item.cant_horas.ToString();

                        List<trabajador_gestion> _listatrab = Getter.TrabajadorInGestion(0, Convert.ToInt32(hdfEditCapacitacionID.Value));

                        foreach (var trab in _listatrab)
                        {
                            if (chkTrabajadores.Items.FindByValue(trab.id_trabajador.ToString()) != null)
                            {
                                chkTrabajadores.Items.FindByValue(trab.id_trabajador.ToString()).Selected = true;
                            }
                        }
                    }

                }

            }
            else if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
                
            }
            else if (e.CommandName.Equals(ComandosGrid.Asistencia.Value))
            {
                
                string idGestion = Utilidades_GridView.DevolverIdRow(e, GridView1);
                
                Response.Redirect(Paginas.Update_AsistenciaCapacitacion.Value+"?id=" + objUtilidades.cifrarCadena(idGestion));
            }
            else if (e.CommandName.Equals(ComandosGrid.Upload.Value))
            {
                hdfIDEsc.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                Modal.registrarModal("EscaneadoModal", "EscaneadoModalScript", this);
                
            }
            else if (e.CommandName.Equals(ComandosGrid.Imprimir.Value))
            {
                hImprimir.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                ViewState["Imprimir"] = string.Empty + hImprimir.Value;

                Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);
                

            }
            else if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
            {
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                hdfIDDel.Value = objUtilidades.cifrarCadena(Convert.ToString(hdfIDDel.Value));
                Response.Redirect(Paginas.View_GestionLaboral.Value + "?id=" + hdfIDDel.Value);
            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Comunicado = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "soporte"));

                if (Comunicado == "")
                {
                    e.Row.Cells[7].Controls.Clear();
                }
            }
        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
                Cargartrabajadores(Convert.ToInt32(ddlSucursal.SelectedValue));
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlTipoGestion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoGestion.SelectedValue != string.Empty)
            {
                ViewState["TipoGestion"] = ddlTipoGestion.SelectedValue;
            }
            else
            {
                ViewState["TipoGestion"] = "0";
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
                ViewState["search"] = txtBuscar.Text;
            }
            else
            {
                ViewState["search"] = string.Empty;
            }
            LlenarGridView();
        }

        #region entrega equipos
        protected void ddlEmpAddEnt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpAddEnt.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucAddEnt, Convert.ToInt32(ddlEmpAddEnt.SelectedValue));
            }

        }
        protected void ddlSucAddEnt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucAddEnt.SelectedValue != string.Empty)
            {
                phAsisAddEnt.Visible = true;
                chkTrabajadores.Items.Clear();
                Cargartrabajadores(Convert.ToInt32(ddlSucAddEnt.SelectedValue));
                Listas.Usuario_Sucursal(ddlUsuAddEnt, Convert.ToInt32(ddlSucAddEnt.SelectedValue));
            }
            else
            {
                phAsisAddEnt.Visible = false;
            }
        }
        protected void ddlEmpEditEnt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpEditEnt.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucEditEnt, Convert.ToInt32(ddlEmpEditEnt.SelectedValue));
            }
        }
        protected void ddlSucEditEnt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucEditEnt.SelectedValue != string.Empty)
            {
                phAsisEditEnt.Visible = true;
                chkTrabajadores.Items.Clear();
                Cargartrabajadores(Convert.ToInt32(ddlSucEditEnt.SelectedValue));
                Listas.Usuario_Sucursal(ddlUsuEditEnt, Convert.ToInt32(ddlSucEditEnt.SelectedValue));
            }
            else
            {
                phAsisEditEnt.Visible = false;
            }
        }
        #endregion

        #region Capacitacion
        protected void ddlEmpAddCap_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpAddCap.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucAddCap, Convert.ToInt32(ddlEmpAddCap.SelectedValue));
            }
        }
        protected void ddlSucAddCap_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucAddCap.SelectedValue != string.Empty)
            {
                phAsisAddCap.Visible = true;
                chkTrabajadores.Items.Clear();
                Cargartrabajadores(Convert.ToInt32(ddlSucAddCap.SelectedValue));
                Listas.Usuario_Sucursal(ddlUsuAddCap, Convert.ToInt32(ddlSucAddCap.SelectedValue));
            }
            else
            {
                phAsisAddCap.Visible = false;
            }
        }
        protected void ddlEmpEditCap_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpEditCap.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucEditCap, Convert.ToInt32(ddlEmpEditCap.SelectedValue));
            }
        }
        protected void ddlSucEditCap_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucEditCap.SelectedValue != string.Empty)
            {
                phAsisEditCap.Visible = true;
                chkTrabajadores.Items.Clear();
                Cargartrabajadores(Convert.ToInt32(ddlSucEditCap.SelectedValue));
                Listas.Usuario_Sucursal(ddlUsuEditCap, Convert.ToInt32(ddlSucEditCap.SelectedValue));
            }
            else
            {
                phAsisEditCap.Visible = false;
            }
        }
        #endregion

        #region acividades
        protected void ddlEmpAddAct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpAddAct.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucAddAct, Convert.ToInt32(ddlEmpAddAct.SelectedValue));
            }
        }
        protected void ddlSucAddAct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucAddAct.SelectedValue != string.Empty)
            {
                phAsisAddAct.Visible = true;
                chkTrabajadores.Items.Clear();
                Cargartrabajadores(Convert.ToInt32(ddlSucAddAct.SelectedValue));
                Listas.Usuario_Sucursal(ddlUsuAddAct, Convert.ToInt32(ddlSucAddAct.SelectedValue));
            }
            else
            {
                phAsisAddAct.Visible = false;
            }
        }

        protected void ddlEmpEditAct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpEditAct.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucEditAct, Convert.ToInt32(ddlEmpEditAct.SelectedValue));
            }
        }
        protected void ddlSucEditAct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucEditAct.SelectedValue != string.Empty)
            {
                phAsisEditAct.Visible = true;
                chkTrabajadores.Items.Clear();
                Cargartrabajadores(Convert.ToInt32(ddlSucEditAct.SelectedValue));
                Listas.Usuario_Sucursal(ddlUsuEditAct, Convert.ToInt32(ddlSucEditAct.SelectedValue));
            }
            else
            {
                phAsisEditAct.Visible = false;
            }
        }
        #endregion

        #region jornadas
        protected void ddlEmpAddJor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpAddJor.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucAddJor, Convert.ToInt32(ddlEmpAddJor.SelectedValue));
            }

        }
        protected void ddlSucAddJor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucAddJor.SelectedValue != string.Empty)
            {
                phAsisAddJor.Visible = true;
                chkTrabajadores.Items.Clear();
                Cargartrabajadores(Convert.ToInt32(ddlSucAddJor.SelectedValue));
                Listas.Usuario_Sucursal(ddlUsuAddJor, Convert.ToInt32(ddlSucAddJor.SelectedValue));
            }
            else
            {
                phAsisAddJor.Visible = false;
            }

        }

        protected void ddlEmpEditJor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpEditJor.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucEditJor, Convert.ToInt32(ddlEmpEditJor.SelectedValue));
            }
        }
        protected void ddlSucEditJor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucEditJor.SelectedValue != string.Empty)
            {
                phAsisEditJor.Visible = true;
                chkTrabajadores.Items.Clear();
                Cargartrabajadores(Convert.ToInt32(ddlSucEditJor.SelectedValue));
                Listas.Usuario_Sucursal(ddlUsuEditJor, Convert.ToInt32(ddlSucEditJor.SelectedValue));
            }
            else
            {
                phAsisEditJor.Visible = false;
            }

        }

        #endregion

        #endregion
    }
}