using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Epp;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_InspeccionUsoEpp : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private List<Model_CEPP> eppTrab;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0;
        private static int IdTrabajador = 0;
        private static int IdPuesto = 0;

        #region Index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");


            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

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
                                agregar_fila();
                            }
                        }
                        if (c is ImageButton)
                        {

                        }
                    }
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

            if (!BoolEmpSuc.Item2)
            {
                Mgr_Area.List_Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
            }
        }
        #endregion

        #region Imprimir
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            genereDocumento();
        }

        private void genereDocumento()
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                "Área o Sector. " + ddlArea.SelectedItem.Text,
                "Trabajador. " + ddlTrabajador.SelectedItem.Text,
                "Inspector",
                cantInspecciones.Value
            };

            PrintFile.PrintInspeccionUsoEpp(valores, this, pnDatos);
        }

        protected void Guardar(object sender, EventArgs e)
        {

        }

        private void agregar_fila()
        {
            int intContInspecciones = 0;
            intContInspecciones = Convert.ToInt32(cantInspecciones.Value);
            eppTrab = Mgr_Epp.Get_Epp(Convert.ToInt32(ddlPuesto.SelectedValue));
            ControlesDinamicos.Add_Fila_InspeccionUsoEpp(pnDatos, intContInspecciones, eppTrab);
        }

        #endregion

        #region AutoCompletar
  
        protected void btnBuscar_OnClick(object sender, EventArgs e)
        {
            if (ddlTrabajador.SelectedValue != string.Empty)
            {
                ViewState["trabajador"] = ddlTrabajador.SelectedValue;
                eppTrab = Mgr_Epp.Get_Epp(Convert.ToInt32(ddlPuesto.SelectedValue));
                if (eppTrab.Count > 0)
                {
                    phInformacion.Visible = true;
                    cantInspecciones.Value = eppTrab.Count.ToString();
                    agregar_fila();
                }
                else
                {
                    phNoRegistros.Visible = true;
                }
            }
            else
            {
                ViewState["trabajador"] = string.Empty;
            }
        }
        #endregion

        #region filtro
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
                Mgr_Area.List_Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArea.SelectedValue != string.Empty)
            {
                ViewState["area"] = ddlArea.SelectedValue;
                Mgr_PuestoTrabajo.Lista_PuestoTrabajo(ddlPuesto, "idArea", Convert.ToInt32(ddlArea.SelectedValue));
            }
            else
            {
                ViewState["area"] = "0";
            }
        }

        protected void ddlPuesto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPuesto.SelectedValue != string.Empty)
            {
                ViewState["puesto"] = ddlPuesto.SelectedValue;
                if (!BoolEmpSuc.Item2) IdSucursal = ObjUsuario.Id_sucursal;
                else IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                IdPuesto = Convert.ToInt32(ddlPuesto.SelectedValue);
                Mgr_Trabajador.Lista_Trabajadores_Puestos(ddlTrabajador, IdPuesto);
            }
            else
            {
                ViewState["puesto"] = "0";
            }
        }
        #endregion
        
    }
}