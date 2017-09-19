using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_PlanInduccion : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
            phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
                if (BoolEmpSuc.Item1)
                {
                    Listas.Empresa(ddlEmpresa);
                }
                else if (BoolEmpSuc.Item2)
                {
                    Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                }
                else
                {
                   // cargarPlan();
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
        private void cargarPlan()
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            int idPlan = GetterMax.Plan(IdSucursal);

            if (idPlan != 0)
            {
                List<plan> consulta = new List<plan>();
                consulta = Getter.Planes(idPlan);

                if (consulta.Count > 0)
                {
                    foreach (var item in consulta)
                    {
                        txtPlanInduccion.Text = item.nombre;
                    }
                }
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
                phCkeditor.Visible = true;
                phCkeditorno.Visible = false;
                //cargarPlan();
            }
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                txtPlanInduccion.Text
            };

            PrintFile.PrintPlanInduccion(valores, this);
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            plan tabla = new plan();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, GetterMax.Plan(IdSucursal), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            plan nuevo = new plan()
            {
                id_sucursal = IdSucursal,
                nombre = txtPlanInduccion.Text
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                cargarPlan();
            }

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtPlanInduccion);
        }
    }
}