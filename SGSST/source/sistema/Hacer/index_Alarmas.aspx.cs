﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Alarmas : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpAdd.Visible = BoolEmpSuc.Item1;
            phEmpEdit.Visible = BoolEmpSuc.Item1;

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucAdd.Visible = BoolEmpSuc.Item2;
            phSucEdit.Visible = BoolEmpSuc.Item2;

            phUsuAdd.Visible = true;
            phUsuEdit.Visible = true;

            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
            }
        }
        private void CargarListas()
        {
            DateTime fechaActual = DateTime.Now;
            ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
            ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");
            txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
            txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");

            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
                Listas.Empresa(ddlEmpAdd);
                Listas.Empresa(ddlEmpEdit);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucAdd, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucEdit, ObjUsuario.Id_empresa);
                Listas.Categorias(ddlCategoriaIndex, ObjUsuario.Id_empresa);
                Listas.Categorias(ddlCategoriaAdd, ObjUsuario.Id_empresa);
                Listas.Categorias(ddlCategoriaEdit, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.Usuario_Sucursal(ddlUsuAdd, ObjUsuario.Id_sucursal);
                Listas.Usuario_Sucursal(ddlUsuEdit, ObjUsuario.Id_sucursal);
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Alarma(
                GridView1,
                string.Empty + ViewState["prioridad"],
                string.Empty + ViewState["categorias"],
                string.Empty + ViewState["FechaInicio"],
                string.Empty + ViewState["FechaFin"],
                string.Empty + ViewState["search"],
                IdEmpresa,
                IdSucursal);

        }
        #endregion

        #region registro de los modales
        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            txtFecha.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtCatAddOtro.Text = string.Empty;
            phCatAddOtro.Visible = false;

            CargarListas();

            //Modal.registrarModal("addModal", "AddModalScript", this);
        }
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }
        #endregion

        #region aciones de editar insertar y eliminar
        protected void Guardar(object sender, EventArgs e)
        {
            int idCategoria = 0;

            if (ddlCategoriaAdd.SelectedValue == "Otro")
            {
                categoria nuevo = new categoria()
                {
                    nombre = txtCatAddOtro.Text,
                    descripcion = txtCatAddOtro.Text,
                    id_empresa = ObjUsuario.Id_empresa
                };

                CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

                List<categoria> ListaCategoria = new List<categoria>();
                ListaCategoria = Getter.Categoria(txtCatAddOtro.Text);

                foreach (var item in ListaCategoria)
                {
                    idCategoria = item.id_categorias;
                }
            }
            else
            {
                idCategoria = Convert.ToInt32(ddlCategoriaAdd.SelectedValue);
            }

            int IdUsuario = 0;
            if (ObjUsuario.isResponsable())
            {
                IdUsuario = ObjUsuario.Id_usuario;
            }
            else
            {
                IdUsuario = Convert.ToInt32(ddlUsuAdd.SelectedValue);
            }

            alarma nuevoAlarma = new alarma()
            {
                descripcion = txtDescripcion.Text,
                fecha = Convert.ToDateTime(txtFecha.Text),
                prioridad = ddlPrioridadAdd.SelectedValue,
                id_categorias = idCategoria,
                id_usuario = IdUsuario
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevoAlarma, IdUsuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            CargarListas();
            LlenarGridView();
        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            int IdUsuario = 0;

            if (ObjUsuario.isResponsable())
            {
                IdUsuario = ObjUsuario.Id_usuario;
            }
            else
            {
                IdUsuario = Convert.ToInt32(ddlUsuEdit.SelectedValue);
            }

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idalarmas = Convert.ToInt32(hdfEditID.Value);
            alarma Edit = contexto.alarma.SingleOrDefault(b => b.id_alarmas == idalarmas);
            if (Edit != null)
            {
                Edit.descripcion = txtDescripcionEdit.Text;
                Edit.fecha = Convert.ToDateTime(txtFechaEdit.Text);
                Edit.prioridad = ddlPrioridadEdit.SelectedValue;
                Edit.id_categorias = Convert.ToInt32(ddlCategoriaEdit.SelectedValue);
                Edit.id_usuario = IdUsuario;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto, IdUsuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            CargarListas();
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            alarma tabla = new alarma();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
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
            GridView1.Columns[5].Visible = false;
            GridView1.Columns[6].Visible = false;
            LlenarGridView();
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "Alarmas", "Lista de Alarmas");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "Alarmas", "Lista de Alarmas");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "Alarmas", "Lista de Alarmas");
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
                hdfEditID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                List<alarma> ListaAlarma = new List<alarma>();
                ListaAlarma = Getter.Alarma(Convert.ToInt32(hdfEditID.Value));

                foreach (var item in ListaAlarma)
                {
                    txtDescripcionEdit.Text = item.descripcion;

                    ddlPrioridadEdit.SelectedValue = item.prioridad;

                    txtFechaEdit.Text = item.fecha.ToString();
                }

                Modal.registrarModal("editModal", "EditModalScript", this);
                
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
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
                Listas.Categorias(ddlCategoriaIndex, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }


        protected void ddlEmpAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpAdd.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucAdd, Convert.ToInt32(ddlEmpAdd.SelectedValue));
                Listas.Categorias(ddlCategoriaAdd, Convert.ToInt32(ddlEmpAdd.SelectedValue));
            }
        }
        protected void ddlSucAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucAdd.SelectedValue != string.Empty)
            {
                Listas.Usuario_Sucursal(ddlUsuAdd, Convert.ToInt32(ddlSucAdd.SelectedValue));
            }
        }

        protected void ddlEmpEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpEdit.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucEdit, Convert.ToInt32(ddlEmpEdit.SelectedValue));
                Listas.Categorias(ddlCategoriaEdit, Convert.ToInt32(ddlEmpEdit.SelectedValue));
            }
        }
        protected void ddlSucEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucEdit.SelectedValue != string.Empty)
            {
                Listas.Usuario_Sucursal(ddlUsuEdit, Convert.ToInt32(ddlSucEdit.SelectedValue));
            }
        }

        protected void ddlPrioridadIndex_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPrioridadIndex.SelectedValue != string.Empty)
            {
                ViewState["prioridad"] = ddlPrioridadIndex.SelectedValue;
            }
            else
            {
                ViewState["prioridad"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void ddlCategoriaIndex_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategoriaIndex.SelectedValue != string.Empty)
            {
                ViewState["categorias"] = ddlCategoriaIndex.SelectedValue;
            }
            else
            {
                ViewState["categorias"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void ddlCategoriaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategoriaAdd.SelectedValue == "Otro")
            {
                phCatAddOtro.Visible = true;
            }
            else
            {
                phCatAddOtro.Visible = false;
            }
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
        #endregion
    }
}