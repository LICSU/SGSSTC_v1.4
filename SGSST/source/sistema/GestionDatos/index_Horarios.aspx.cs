using Capa_Datos;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Horario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Horarios : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;


            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            ddlEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phempresaEdit.Visible = BoolEmpSuc.Item1;
            ddlEmpresaEdit.Visible = BoolEmpSuc.Item1;

            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                Mgr_Empresa.Lista_Empresa(ddlEmpresaAdd);
                Mgr_Empresa.Lista_Empresa(ddlEmpresaEdit);
            }
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            Mgr_Horario.Horario(GridView1, IdEmpresa, string.Empty + ViewState["sWhere"]);
        }
        #endregion

        #region acciones
        protected void AgregarRegistroModal(object sender, EventArgs e)
        {
            Modal.registrarModal("addModal", "AddModalScript", this);

        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);

            horario nuevo = new horario()
            {
                nombre = txtNombreAdd.Text,
                id_empresa = IdEmpresa,
                fecha_inicio = txtFechaIni.Text,
                fecha_fin = txtFechaFin.Text,
                fecha_creacion = DateTime.Today
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);
            Modal.CerrarModal("addModal", "AddModalScript", this);
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaEdit);

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idHorario = Convert.ToInt32(hdfHorarioID.Value);
            horario Edit = contexto.horario.SingleOrDefault(b => b.id_horario == idHorario);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_empresa = IdEmpresa;
                Edit.fecha_inicio = txtFechaIniEdit.Text;
                Edit.fecha_fin = txtFechaFinEdit.Text;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto);
            Modal.CerrarModal("editModal", "EditModalScript", this);
            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            horario tabla = new horario();
            List<usuario> usuarioData = Mgr_Area.AreaByUsuario(ObjUsuario.Id_usuario);
            int IdHorario = 0;
            foreach (var user in usuarioData)
            {
                IdHorario = Convert.ToInt32(user.trabajador.id_horario);
            }

            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfHorarioIDDel.Value));

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region metodos Grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfHorarioIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);

            }
            else if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfHorarioID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                var _Horario = Mgr_Horario.Horario(Convert.ToInt32(hdfHorarioID.Value));

                txtNombreEdit.Text = _Horario.nombre;
                txtFechaIniEdit.Text = _Horario.fecha_inicio;
                txtFechaFinEdit.Text = _Horario.fecha_fin;

                Modal.registrarModal("editModal", "EditModalScript", this);

            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario != null)
            {
                if (ObjUsuario.isAdm_Sucursal() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isAdm_SucSeg() || ObjUsuario.isResponsable())
                {
                    GridView1.Columns[5].Visible = false;
                    GridView1.Columns[6].Visible = false;
                }
            }
        }
        #endregion

        #region filtros
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
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
        #endregion
    }
}