using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
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
    public partial class create_InspeccionEPP : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones

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
                        if (c is DropDownList)
                        {
                            if (c.ClientID.Contains("ddlPuesto"))
                            {
                                crearTabla();
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
                Mgr_Area.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
            }
        }

        private void crearTabla()
        {
            ControlesDinamicos.Crear_Tabla_InspeccionEpp(pnEpp, ddlArea, ddlPuesto);

            ViewState["controlsadded"] = true;
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            PrintFile.PrintDocumento_InspeccionEPP(pnEpp, ddlArea, ddlPuesto);           

            Imprimir();
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            RadioButton _radio;
            Table _table;
            int contFal = 0;
            TableRow row = new TableRow();
            row = (TableHeaderRow)pnEpp.FindControl("EPPFaltante");
            row.Visible = false;
            row = (TableHeaderRow)pnEpp.FindControl("SenalFaltante");
            row.Visible = false;
            int i = 0;
            _table = (Table)pnEpp.FindControl("tblEPP");
            List<Model_CEPP> epp_datos = Mgr_Epp.Epp(Convert.ToInt32(ddlPuesto.SelectedValue));
            foreach (var dato in epp_datos)
            {
                _radio = (RadioButton)pnEpp.FindControl("eppNo" + i);
                if (_radio.Checked)
                {
                    row = new TableRow();
                    TableCell cell = new TableCell();
                    cell.Text = " " + dato.nombre;
                    row.Controls.Add(cell);
                    _table.Controls.Add(row);
                    row = (TableHeaderRow)pnEpp.FindControl("EPPFaltante");
                    row.Visible = true;
                    contFal++;
                }
                i++;
            }
            ViewState["EppFalt"] = contFal;
            contFal = 0;
            List<Model_CEPP> tipo_epp_datos = Mgr_Epp.TipoEpp(Convert.ToInt32(ddlPuesto.SelectedValue));
            i = 0;
            Table _table2 = new Table();
            _table2 = (Table)pnEpp.FindControl("tblSenal");
            foreach (var dato in tipo_epp_datos)
            {
                _radio = (RadioButton)pnEpp.FindControl("tpoNo" + i);
                if (_radio.Checked)
                {
                    row = new TableRow();
                    TableCell cell = new TableCell();
                    cell.Text = " " + dato.nombre;
                    row.Controls.Add(cell);
                    _table2.Controls.Add(row);
                    row = (TableHeaderRow)pnEpp.FindControl("SenalFaltante");
                    row.Visible = true;
                    contFal++;
                }
                i++;
            }
            ViewState["SenalFalt"] = contFal;
            contFal = 0;
            phinicial.Visible = false;
            phGenerarDocumento.Visible = true;
        }

        private void Imprimir()
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                "Área: " + ddlArea.SelectedItem.Text,
                ddlPuesto.SelectedValue,
                ViewState["EppFalt"].ToString(),
                ViewState["SenalFalt"].ToString()
            };

            PrintFile.PrintInspeccionEpp(valores, this, pnEpp);            
        }

        #endregion

        #region filtro
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            TextBox txtBuscar = new TextBox();
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
        }

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
                Mgr_Area.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
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
                Mgr_PuestoTrabajo.PuestoTrabajo(ddlPuesto, "idArea", Convert.ToInt32(ddlArea.SelectedValue));
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

                List<Model_CEPP> epp = Mgr_Epp.Epp(Convert.ToInt32(ddlPuesto.SelectedValue));
                if (epp.Count > 0)
                {
                    phInformacion.Visible = true;
                }
                else
                {
                    phNoRegistros.Visible = true;
                }
            }
            else
            {
                ViewState["puesto"] = "0";
            }
        }
        #endregion
        
    }
}