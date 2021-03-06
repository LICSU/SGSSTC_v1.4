﻿using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Documento;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Mecanismos : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
            phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;
            phSucursalEdit.Visible = BoolEmpSuc.Item2;

            

            if (!IsPostBack)
            {
                ViewState["buscar"] = "";
                LlenarGridView();
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Mgr_Sucursal.Lista_Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Mgr_Sucursal.Lista_Sucursal(ddlSucursalEdit, ObjUsuario.Id_empresa);
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));
            Mgr_Documento.Grid_TipoDocumento(GridView1, IdSucursal, IdEmpresa, string.Empty + ViewState["buscar"]);
        }
        #endregion

        #region  aciones de editar insertar y eliminar
        protected void Guardar(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursalAdd);

            tipo_documento nuevo = new tipo_documento()
            {
                nombre = txtNombreAdd.Text,
                id_sucursal = IdSucursal,
                dirigida = txtDirigidaAdd.Text,
                modalidad = txtModalidadAdd.Text,
                fecha = Convert.ToDateTime(txtFechaAdd.Text),
                responsable = txtResponsableAdd.Text,
                aprobado = txtAprobadoAdd.Text,
                archivado = txtArchivadoAdd.Text,
                estatus = ddlEstatusAdd.SelectedValue
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            Modal.CerrarModal("addModal", "AddModalScript", this);
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int idDocumento = Convert.ToInt32(hdfEditID.Value);

            tipo_documento Edit = contexto.tipo_documento.SingleOrDefault(b => b.id_tipo_documento == idDocumento);
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursalEdit);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_sucursal = IdSucursal;
                Edit.dirigida = txtDirigidaEdit.Text;
                Edit.modalidad = txtModalidadEdit.Text;
                Edit.fecha = Convert.ToDateTime(txtFechaEdit.Text);
                Edit.responsable = txtResponsableEdit.Text;
                Edit.aprobado = txtAprobadoEdit.Text;
                Edit.archivado = txtArchivadoEdit.Text;
                Edit.estatus = ddlEstatusEdit.SelectedValue;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            Modal.CerrarModal("editModal", "EditModalScript", this);
            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            tipo_documento tabla = new tipo_documento();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region  eventos del grid
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
                hdfEditID.Value = (GridView1.Rows[RowIndex].FindControl("id") as Label).Text;

                List<tipo_documento> ListaTipoDocumento = new List<tipo_documento>();
                ListaTipoDocumento = Mgr_Documento.Get_TipoDocumento(Convert.ToInt32(hdfEditID.Value));

                Mgr_Sucursal.Lista_Sucursal(ddlSucursalEdit, ObjUsuario.Id_empresa);

                foreach (var item in ListaTipoDocumento)
                {
                    txtNombreEdit.Text = item.nombre;
                    txtDirigidaEdit.Text = item.dirigida;
                    txtModalidadEdit.Text = item.modalidad;
                    if(item.fecha != null)
                        txtFechaEdit.Text = item.fecha.Value.ToString("yyyy-MM-dd"); 
                    txtResponsableEdit.Text = item.responsable;
                    txtAprobadoEdit.Text = item.aprobado;
                    txtArchivadoEdit.Text = item.archivado;
                    ddlEstatusEdit.SelectedValue = item.estatus;
                    ddlSucursalEdit.SelectedValue = Convert.ToString(item.id_sucursal);
                }

                Modal.registrarModal("editModal", "EditModalScript", this);
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                string valor = (GridView1.Rows[RowIndex].FindControl("id") as Label).Text;
                hdfIDDel.Value = valor;

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }
        #endregion

        #region filtros
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