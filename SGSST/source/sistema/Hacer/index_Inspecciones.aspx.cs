﻿using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Inspeccion;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class index_Inspecciones : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = true;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                ViewState["tipo"] = "Insp";
                ViewState["buscar"] = "";
                LlenarGridView();
                CargarListas();
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                Mgr_Empresa.Lista_Empresa(ddlEmpresaAdd);
            }
            else
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));
            string tipo = string.Empty + ViewState["tipo"];

            Mgr_Inspeccion.Grid_Inspecciones(GridView1, tipo, IdSucursal, IdEmpresa, string.Empty + ViewState["buscar"]);
        }
        #endregion

        #region registrar modales
        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            //Modal.registrarModal("addModal", "AddModalScript", this);
        }

        protected void MostrarModalCrear(object sender, EventArgs e)
        {
            //Modal.registrarModal("createModal", "CreateModalScript", this);
        }
        #endregion

        #region crear
        protected void btnCrearInsExt_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionExtintores.Value);
        }
        protected void btnCrearInsArea_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionAreas.Value);
        }
        protected void btnCrearInsMedios_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionMediosEscape.Value);
        }
        protected void btnCrearInsPuestos_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionPuestos.Value);
        }
        protected void btnCrearInsPuestosAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionPuestosAdmin.Value);
        }
        protected void btnCrearInsEquipoProt_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionEPP.Value);
        }
        protected void btnCrearInsCrono_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionCrono.Value);
        }
        protected void btnCrearInsUsoEpp_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionUsoEpp.Value);
        }
        protected void btnCrearInsPrimAux_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_InspeccionPrimAux.Value);
        }
        #endregion

        #region acciones
        protected void Guardar(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursalAdd);

            String[] valores = {
                txtNombre.Text,
                ddlTipoInspeccionAdd.SelectedValue
            };

            ObjUsuario.Error = Mgr_Inspeccion.Add_Inspeccion(IdEmpSuc,  valores, flpArchivo);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            documento tabla = new documento();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }

        protected void btnCrear_Onclick(object sender, EventArgs e)
        {
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                string valor = (GridView1.Rows[RowIndex].FindControl("id_documento") as Label).Text;
                hdfIDDel.Value = valor;

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        #endregion

        #region filtro
        protected void ddlTipoInspeccion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoInspeccion.SelectedValue != string.Empty)
            {
                ViewState["tipo"] = ddlTipoInspeccion.SelectedValue;
            }
            else
            {
                ViewState["tipo"] = string.Empty;

            }
            LlenarGridView();
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }

        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
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