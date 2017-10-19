using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Verificar
{
    public partial class Create_AccidenteLaboral : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0;
        private static int IdTrabajador = 0;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
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
                IdSucursal = Convert.ToInt32(ObjUsuario.Id_sucursal);
                Mgr_Area.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
                Listas.PuestoTrabajo(ddlProcesoTrabajo, "Sucursal", ObjUsuario.Id_sucursal);
                Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, ObjUsuario.Id_sucursal);
            }

        }
        protected void btPrintSave_Click(object sender, EventArgs e)
        {
            DateTime? myDate = null;
            myDate = txtFechaMuerte.Text == string.Empty ? myDate : Convert.ToDateTime(txtFechaMuerte.Text);
            IdTrabajador = Convert.ToInt32(ddlTrabajador.SelectedValue);

            at_it_el_pa nuevo = new at_it_el_pa()
            {
                fecha_accidente = Convert.ToDateTime(txtFechaAcc.Text),
                hora_accidente = Convert.ToDateTime(txtHoraAcc.Text),
                id_trabajador = Convert.ToInt32(ddlTrabajador.SelectedValue),
                id_area = Convert.ToInt32(ddlArea.SelectedValue),
                id_puesto = Convert.ToInt32(ddlProcesoTrabajo.SelectedValue),
                sitio = txtSitioAccidente.Text,
                descripcion = txtDescTarea.Text,
                condiciones_inseguras = txtCondIns.Text,
                actos_inseguros = txtActos.Text,
                factores_inseguros = txtFacTrab.Text,
                factores_personales = txtFactPersonales.Text,
                tipo_evento = "1",
                fecha_muerte = myDate,
                dias_incapacidad = txtDiasIncapacidad.Text == string.Empty ? 0 : Convert.ToInt32(txtDiasIncapacidad.Text),
                dias_cargados = txtDiasCargados.Text == string.Empty ? 0 : Convert.ToInt32(txtDiasCargados.Text),
                dias_perdidos_ausencia = txtDiasPerdidosAusTrab.Text == string.Empty ? 0 : Convert.ToInt32(txtDiasPerdidosAusTrab.Text),
                dias_perdidos_restingido = txtDiasPerdidosctRest.Text == string.Empty ? 0 : Convert.ToInt32(txtDiasPerdidosctRest.Text),
                dias_no_perdidos = chkSinDias.Checked == true ? "true" : "false",
                tipo_enfermedad = ddlTipoEnfermedad.SelectedValue
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            if (ObjUsuario.Error)
            {
                int id_at_it_el_pa = GetterMax.Accidentes();

                #region insertar anexos
                if (fuAnexo.HasFile)
                {
                    int i = 0;
                    foreach (var archivo in fuAnexo.PostedFiles)
                    {
                        i++;
                        string ruta = Utilidades.GuardarArchivo(archivo,
                            "Accidente_" + id_at_it_el_pa + "_" + i, "~/archivos/accidentes/");

                        soporte nuevoFA = new soporte()
                        {
                            url = ruta,
                            id_tabla = id_at_it_el_pa
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoFA);

                    }
                }
                #endregion

                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtFechaAcc);
            }

        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }

        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                Mgr_Area.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue), "Ninguna");
                Listas.PuestoTrabajo(ddlProcesoTrabajo, "Sucursal", Convert.ToInt32(ddlSucursal.SelectedValue), "Ninguno");
                Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, Convert.ToInt32(ddlSucursal.SelectedValue));
            }

        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Button miBoton = (Button)sender;

            if (miBoton.ID == "btnReset")
            {
                txtCondIns.Text = string.Empty;
            }
            else if (miBoton.ID == "btnReset2")
            {
                txtActos.Text = string.Empty;
            }
            else if (miBoton.ID == "btnReset3")
            {
                txtFacTrab.Text = string.Empty;
            }
            else if (miBoton.ID == "btnReset4")
            {
                txtFactPersonales.Text = string.Empty;
            }


        }
        protected void ddlcond_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList miDDl = (DropDownList)sender;

            if (miDDl.SelectedValue != string.Empty)
            {
                if (txtCondIns.Text != string.Empty)
                {
                    txtCondIns.Text = txtCondIns.Text + " - " + miDDl.SelectedValue;
                }
                else
                {
                    txtCondIns.Text = miDDl.SelectedValue + " ";
                }

            }
            miDDl.SelectedValue = string.Empty;

        }
        protected void ddlActos_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList miDDl = (DropDownList)sender;

            if (miDDl.SelectedValue != string.Empty)
            {
                if (txtActos.Text != string.Empty)
                {
                    txtActos.Text = txtActos.Text + " - " + miDDl.SelectedValue;
                }
                else
                {
                    txtActos.Text = miDDl.SelectedValue + " ";
                }

            }
            miDDl.SelectedValue = string.Empty;

        }
        protected void ddlFacTrab_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList miDDl = (DropDownList)sender;

            if (miDDl.SelectedValue != string.Empty)
            {
                if (txtFacTrab.Text != string.Empty)
                {
                    txtFacTrab.Text = txtFacTrab.Text + " - " + miDDl.SelectedValue;
                }
                else
                {
                    txtFacTrab.Text = miDDl.SelectedValue + " ";
                }

            }
            miDDl.SelectedValue = string.Empty;

        }
        protected void ddlFacPers_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList miDDl = (DropDownList)sender;

            if (miDDl.SelectedValue != string.Empty)
            {
                if (txtFactPersonales.Text != string.Empty)
                {
                    txtFactPersonales.Text = txtFactPersonales.Text + " - " + miDDl.SelectedValue;
                }
                else
                {
                    txtFactPersonales.Text = miDDl.SelectedValue + " ";
                }

            }
            miDDl.SelectedValue = string.Empty;

        }

        protected void ddlCondicionesInseguras_SelectedIndexChanged(object sender, EventArgs e)
        {
            phCond1.Visible = false; phCond6.Visible = false;
            phCond2.Visible = false; phCond7.Visible = false;
            phCond3.Visible = false; phCond8.Visible = false;
            phCond4.Visible = false; phCond9.Visible = false;
            phCond5.Visible = false; phCond10.Visible = false;

            if (ddlCondiciones.SelectedValue == "Cond1") { phCond1.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond2") { phCond2.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond3") { phCond3.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond4") { phCond4.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond5") { phCond5.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond6") { phCond6.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond7") { phCond7.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond8") { phCond8.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond9") { phCond9.Visible = true; }
            else if (ddlCondiciones.SelectedValue == "Cond10") { phCond10.Visible = true; }
        }
        protected void ddlActoInseguro_SelectedIndexChanged(object sender, EventArgs e)
        {
            phActIns1.Visible = false; phActIns6.Visible = false; phActIns11.Visible = false;
            phActIns2.Visible = false; phActIns7.Visible = false; phActIns12.Visible = false;
            phActIns3.Visible = false; phActIns8.Visible = false; phActIns13.Visible = false;
            phActIns4.Visible = false; phActIns9.Visible = false; phActIns14.Visible = false;
            phActIns5.Visible = false; phActIns10.Visible = false; phActIns15.Visible = false;

            if (ddlActoInseguro.SelectedValue == "ActIns1") { phActIns1.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns2") { phActIns2.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns3") { phActIns3.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns4") { phActIns4.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns5") { phActIns5.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns6") { phActIns6.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns7") { phActIns7.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns8") { phActIns8.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns9") { phActIns9.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns10") { phActIns10.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns11") { phActIns11.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns12") { phActIns12.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns13") { phActIns13.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns14") { phActIns14.Visible = true; }
            else if (ddlActoInseguro.SelectedValue == "ActIns15") { phActIns15.Visible = true; }
        }
        protected void ddlFactorTrabajo_SelectedIndexChanged(object sender, EventArgs e)
        {
            phFacTrab1.Visible = false; phFacTrab6.Visible = false;
            phFacTrab2.Visible = false; phFacTrab7.Visible = false;
            phFacTrab3.Visible = false; phFacTrab8.Visible = false;
            phFacTrab4.Visible = false;
            phFacTrab5.Visible = false;

            if (ddlFactorTrabajo.SelectedValue == "FacTrab1") { phFacTrab1.Visible = true; }
            else if (ddlFactorTrabajo.SelectedValue == "FacTrab2") { phFacTrab2.Visible = true; }
            else if (ddlFactorTrabajo.SelectedValue == "FacTrab3") { phFacTrab3.Visible = true; }
            else if (ddlFactorTrabajo.SelectedValue == "FacTrab4") { phFacTrab4.Visible = true; }
            else if (ddlFactorTrabajo.SelectedValue == "FacTrab5") { phFacTrab5.Visible = true; }
            else if (ddlFactorTrabajo.SelectedValue == "FacTrab6") { phFacTrab6.Visible = true; }
            else if (ddlFactorTrabajo.SelectedValue == "FacTrab7") { phFacTrab7.Visible = true; }
            else if (ddlFactorTrabajo.SelectedValue == "FacTrab8") { phFacTrab8.Visible = true; }
        }
        protected void ddlFactorPersonal_SelectedIndexChanged(object sender, EventArgs e)
        {
            phFacPer1.Visible = false; phFacPer6.Visible = false;
            phFacPer2.Visible = false; phFacPer7.Visible = false;
            phFacPer3.Visible = false;
            phFacPer4.Visible = false;
            phFacPer5.Visible = false;

            if (ddlFactorPersonal.SelectedValue == "FacPer1") { phFacPer1.Visible = true; }
            else if (ddlFactorPersonal.SelectedValue == "FacPer2") { phFacPer2.Visible = true; }
            else if (ddlFactorPersonal.SelectedValue == "FacPer3") { phFacPer3.Visible = true; }
            else if (ddlFactorPersonal.SelectedValue == "FacPer4") { phFacPer4.Visible = true; }
            else if (ddlFactorPersonal.SelectedValue == "FacPer5") { phFacPer5.Visible = true; }
            else if (ddlFactorPersonal.SelectedValue == "FacPer6") { phFacPer6.Visible = true; }
            else if (ddlFactorPersonal.SelectedValue == "FacPer7") { phFacPer7.Visible = true; }
        }
        #endregion
    }
}