using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using Capa_Datos.Manager.Documento;

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

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
                if (BoolEmpSuc.Item1)
                {
                    Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                }
                else if (BoolEmpSuc.Item2)
                {
                    Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
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
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            }
            else
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }
        private void cargarPlan()
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            int idPlan = Mgr_Documento.Get_Plan(IdSucursal);

            if (idPlan != 0)
            {
                List<plan> consulta = new List<plan>();
                consulta = Mgr_Documento.Get_Planes(idPlan);

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
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                txtPlanInduccion.Text
            };

            PrintFile.PrintPlanInduccion(valores, this);
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            plan tabla = new plan();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Mgr_Documento.Get_Plan(IdSucursal));

            plan nuevo = new plan()
            {
                id_sucursal = IdSucursal,
                nombre = txtPlanInduccion.Text
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            if (ObjUsuario.Error)
            {
                cargarPlan();
            }

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtPlanInduccion);
        }
    }
}