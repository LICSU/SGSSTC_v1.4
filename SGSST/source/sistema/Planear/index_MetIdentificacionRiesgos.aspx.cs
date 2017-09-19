using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_MetIdentificacionRiesgos : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
                ViewState["search"] = string.Empty;
                if (BoolEmpSuc.Item2)
                {
                    Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                }
                else
                {
                    cargarPlan();
                }
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
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
                cargarPlan();
            }
        }
        private void cargarPlan()
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            int idPlan = GetterMax.Plan(IdSucursal);

            if (idPlan != 0)
            {
                List<plan> consulta = new List<plan>();
                consulta = Getter.Planes(idPlan, "", string.Empty + ViewState["search"]);

                if (consulta.Count > 0)
                {
                    foreach (var item in consulta)
                    {
                        txtIdentificacionRiesgos.Text = item.nombre;
                    }
                }
            }
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                txtIdentificacionRiesgos.Text
            };

            PrintFile.PrintMetodologiaIR(valores, this);
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            plan tabla = new plan();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, GetterMax.Plan(IdSucursal), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            plan nuevo = new plan()
            {
                id_sucursal = IdSucursal,
                nombre = txtIdentificacionRiesgos.Text
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                cargarPlan();
            }
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
            cargarPlan(); 
        }
    }
}