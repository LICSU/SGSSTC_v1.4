using Capa_Datos;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_InspeccionCrono : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region Acciones
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
                            if (c.ClientID.Contains("btnAgregar"))
                            {
                                int fila = Convert.ToInt32(cantInspecciones.Value);
                                fila++;
                                crearCampos(fila);
                            }
                            else if (c.ClientID.Contains("btnDocumento"))
                            {
                                int fila = Convert.ToInt32(cantInspecciones.Value);
                                crearCampos(fila);
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
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            }
            else
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Mgr_Area.Area_Sucursal(ddlArea0, ObjUsuario.Id_sucursal);
                ViewState["sucursal"] = ObjUsuario.Id_sucursal;
                phInformacion.Visible = true;
                Mgr_Area.Area_Sucursal(ddlArea0, Convert.ToInt32(ObjUsuario.Id_sucursal));
            }
        }

        protected void Guardar(object sender, EventArgs e)
        {
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {

            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores ={
                string.Empty + IdEmpSuc.Item2,
                cantInspecciones.Value
            };

            PrintFile.PrintCronogramaInspeccion(valores, this, pTabla);
        }
        #endregion

        #region campos dinamicos
        private void crearCampos(int valor)
        {
            cantInspecciones.Value = valor.ToString();

            for (int i = 1; i <= valor; i++)
            {
                ControlesDinamicos.CrearLiteral("<tr>", pTabla);

                ControlesDinamicos.CrearLiteral("<td>", pTabla);
                CrearDropDownListArea("ddlArea" + i, pTabla);
                //ControlesDinamicos.CrearRequiredFieldValidator("ddlArea" + i, pTabla, "ValidationAdd");
                ControlesDinamicos.CrearLiteral("</td>", pTabla);

                ControlesDinamicos.CrearLiteral("<td>", pTabla);
                CrearDropDownListTipo("ddlTipo" + i, pTabla);
                ControlesDinamicos.CrearRequiredFieldValidator("ddlTipo" + i, pTabla, "ValidationAdd");
                ControlesDinamicos.CrearLiteral("</td>", pTabla);

                ControlesDinamicos.CrearLiteral("<td>", pTabla);
                ControlesDinamicos.CrearTextbox("txtFecha" + i, pTabla, TextBoxMode.Date);
                ControlesDinamicos.CrearRequiredFieldValidator("txtFecha" + i, pTabla, "ValidationAdd");
                ControlesDinamicos.CrearLiteral("</td>", pTabla);

                ControlesDinamicos.CrearLiteral("<td>", pTabla);
                ControlesDinamicos.CrearTextbox("txtResp" + i, pTabla, TextBoxMode.SingleLine);
                ControlesDinamicos.CrearRequiredFieldValidator("txtResp" + i, pTabla, "ValidationAdd");
                ControlesDinamicos.CrearLiteral("</td>", pTabla);

                ControlesDinamicos.CrearLiteral("<td>", pTabla);
                ControlesDinamicos.CrearTextbox("txtObj" + i, pTabla, TextBoxMode.MultiLine);
                ControlesDinamicos.CrearRequiredFieldValidator("txtObj" + i, pTabla, "ValidationAdd");
                ControlesDinamicos.CrearLiteral("</td>", pTabla);

                ControlesDinamicos.CrearLiteral("</tr>", pTabla);

            }

        }

        private void CrearDropDownListArea(string id, Panel _panel)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            DropDownList miDropDownList = new DropDownList();

            miDropDownList.CssClass = "form-control";

            miDropDownList.ID = id;

            ControlesDinamicos.CrearDropDownList(id, _panel, miDropDownList);

            Mgr_Area.Area_Sucursal(miDropDownList, IdSucursal);

            _panel.Controls.Add(miDropDownList);
        }

        private void CrearDropDownListTipo(string id, Panel _panel)
        {
            DropDownList miDropDownList = new DropDownList();

            miDropDownList.CssClass = "form-control";

            miDropDownList.ID = id;

            ControlesDinamicos.CrearDropDownList(id, _panel, miDropDownList);

            ControlesDinamicos.Llenar_DropdownList_Inspecciones(miDropDownList);

            _panel.Controls.Add(miDropDownList);
        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
                phInformacion.Visible = true;
                Mgr_Area.Area_Sucursal(ddlArea0, Convert.ToInt32(ddlSucursal.SelectedValue));
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
        }
        #endregion
        
    }
}