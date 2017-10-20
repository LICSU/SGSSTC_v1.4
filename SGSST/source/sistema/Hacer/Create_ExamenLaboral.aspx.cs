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

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_ExamenLaboral : Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
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
                LlenarGridView();
            }
        }
        private void LlenarGridView()
        {
            // Tabla.Accidente_General(GridView1, ObjUsuario.Id_empresa);
        }
        private void CargarListas()
        {
            Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            Listas.TipoExamen(ddlTipoExamen);

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

            }

        }
        #endregion

        #region acciones
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            String recomendaciones = txtRecomendaciones.Text;
            String diagnostico = txtDiagnostico.Text;
            String id_trabajador = ddlTrabajador.SelectedValue;
            String id_tipo_exa = ddlTipoExamen.SelectedValue;
            String fecha = txtFecha.Text;

            llenarImprimir();
        }
        private void llenarImprimir()
        {
            #region elementos

            #region bloque1
            lblEmpresa.Text = ddlEmpresa.SelectedValue;
            lblDireccion.Text = lbUbicacion.Text;
            lblNumero.Text = "---";
            lblTipodeExamen.Text = ddlTipoExamen.SelectedValue;
            lblFecha.Text = txtFecha.Text;
            #endregion

            /* Asignar los valores dependiendo de los anteriores*/
            #region bloque2
            txtPeso1.Text = txtPeso.Text;
            txtEstatura1.Text = txtEstatura.Text;
            txtPA11.Text = txtPA1.Text;
            txtPA22.Text = txtPA2.Text;
            txtEstadoGen1.Text = txtEstadoGen.Text;
            ddlDiestro1.Text = ddlDiestro.SelectedValue;
            ddlZurdo1.Text = ddlZurdo.SelectedValue;
            ddlAmbidiestro1.Text = ddlAmbidiestro.SelectedValue;
            txtEstadoMental1.Text = txtEstadoMental.Text;

            rbCraneo1.Text = rbCraneo.SelectedValue;
            txtDescCraneo1.Text = txtDescCraneo.Text;

            rbMucosa1.Text = rbMucosa.SelectedValue;
            txtDescMuco1.Text = txtDescMuco.Text;

            rbParpados1.Text = rbParpados.SelectedValue;
            txtDescPar1.Text = txtDescPar.Text;

            rbSenos1.Text = rbSenos.SelectedValue;
            txtDescSenos1.Text = txtDescSenos.Text;

            rbConjuntiva1.Text = rbConjuntiva.SelectedValue;
            txtDescConjun1.Text = txtDescConjun.Text;

            rbPaladar1.Text = rbPaladar.SelectedValue;
            txtDescPala1.Text = txtDescPala.Text;

            rbEscaleras1.Text = rbEscaleras.SelectedValue;
            txtDescEscl1.Text = txtDescEscl.Text;

            rbMucosaOral1.Text = rbMucosaOral.SelectedValue;
            txtDescMucoOral1.Text = txtDescMucoOral.Text;

            rbCornea1.Text = rbCornea.SelectedValue;
            txtDescCornea1.Text = txtDescCornea.Text;

            rbDentadura1.Text = rbDentadura.SelectedValue;
            txtDescDent1.Text = txtDescDent.Text;

            rbIris1.Text = rbIris.SelectedValue;
            txtDescIris1.Text = txtDescIris.Text;

            rbAmigdalas1.Text = rbAmigdalas.SelectedValue;
            txtDescAmig1.Text = txtDescAmig.Text;

            rbPabellones1.Text = rbPabellones.SelectedValue;
            txtDescPabe1.Text = txtDescPabe.Text;

            rbFaringe1.Text = rbFaringe.SelectedValue;
            txtDescFarin1.Text = txtDescFarin.Text;

            rbConductos1.Text = rbConductos.SelectedValue;
            txtDescConduc1.Text = txtDescConduc.Text;

            rbLengua1.Text = rbLengua.SelectedValue;
            txtDescLengua1.Text = txtDescLengua.Text;

            rbTimpanos1.Text = rbTimpanos.SelectedValue;
            txtDescTimpano1.Text = txtDescTimpano.Text;

            txtODCercana1.Text = txtODCercana.Text;
            txtOICercana1.Text = txtOICercana.Text;
            txtAOCercana1.Text = txtAOCercana.Text;

            txtODLejana1.Text = txtODLejana.Text;
            txtOILejana1.Text = txtOILejana.Text;
            txtAOLejana1.Text = txtAOLejana.Text;

            rbInspeccion1.Text = rbInspeccion.SelectedValue;
            txtDescInsp1.Text = txtDescInsp.Text;

            rbAuscultacion1.Text = rbAuscultacion.SelectedValue;
            txtDescAusc1.Text = txtDescAusc.Text;

            rbPalpacion1.Text = rbPalpacion.SelectedValue;
            txtDescPalp1.Text = txtDescPalp.Text;

            rbrMulloVesicular1.Text = rbrMulloVesicular.SelectedValue;
            txtDescMurmu1.Text = txtDescMurmu.Text;

            rbAdenopatias1.Text = rbAdenopatias.SelectedValue;
            txtDescAdeno1.Text = txtDescAdeno.Text;

            rbRuidosCardiacos1.Text = rbRuidosCardiacos.SelectedValue;
            txtDescRuidos1.Text = txtDescRuidos.Text;

            rbGlandulaTiroides1.Text = rbGlandulaTiroides.SelectedValue;
            txtDescGalnd1.Text = txtDescGalnd.Text;

            rbSoplos1.Text = rbSoplos.SelectedValue;
            txtDescSoplos1.Text = txtDescSoplos.Text;

            txtDescAbdomen1.Text = txtDescAbdomen.Text;

            rbMamas1.Text = rbMamas.SelectedValue;
            txtDescMamas1.Text = txtDescMamas.Text;

            rbPiel1.Text = rbPiel.SelectedValue;
            txtDescPiel1.Text = txtDescPiel.Text;

            rbUnas1.Text = rbUnas.SelectedValue;
            txtDescUnas1.Text = txtDescUnas.Text;

            txtDescHerina1.Text = txtDescHerina.Text;

            rbCicatrices1.Text = rbCicatrices.SelectedValue;
            txtDescCicat1.Text = txtDescCicat.Text;

            rbTatuajes1.Text = rbTatuajes.SelectedValue;
            txtDescTatu1.Text = txtDescTatu.Text;

            rbVarices1.Text = rbVarices.SelectedValue;
            txtDescVarices1.Text = txtDescVarices.Text;
            #endregion

            #region bloque3
            f1111.Checked = f1.Checked;
            f21.Checked = f2.Checked;
            f31.Checked = f3.Checked;
            f41.Checked = f4.Checked;
            f51.Checked = f5.Checked;
            f61.Checked = f6.Checked;
            f71.Checked = f7.Checked;
            f81.Checked = f8.Checked;
            f91.Checked = f9.Checked;
            f101.Checked = f10.Checked;
            f111.Checked = f11.Checked;
            f121.Checked = f12.Checked;
            f131.Checked = f13.Checked;
            f141.Checked = f14.Checked;
            f151.Checked = f15.Checked;
            f161.Checked = f16.Checked;
            e1111.Checked = e1.Checked;
            e21.Checked = e2.Checked;
            e31.Checked = e3.Checked;
            e41.Checked = e4.Checked;
            e51.Checked = e5.Checked;
            e61.Checked = e6.Checked;
            e71.Checked = e7.Checked;
            e81.Checked = e8.Checked;
            e91.Checked = e9.Checked;
            e101.Checked = e10.Checked;
            e111.Checked = e11.Checked;
            e121.Checked = e12.Checked;
            e131.Checked = e13.Checked;
            e141.Checked = e14.Checked;
            e151.Checked = e15.Checked;
            e161.Checked = e16.Checked;
            ab1111.Checked = ab1.Checked;
            ab21.Checked = ab2.Checked;
            ab31.Checked = ab3.Checked;
            ab41.Checked = ab4.Checked;
            ab51.Checked = ab5.Checked;
            ab61.Checked = ab6.Checked;
            ab71.Checked = ab7.Checked;
            ab81.Checked = ab8.Checked;
            ab91.Checked = ab9.Checked;
            ab101.Checked = ab10.Checked;
            ab111.Checked = ab11.Checked;
            ab121.Checked = ab12.Checked;
            ab131.Checked = ab13.Checked;
            ab141.Checked = ab14.Checked;
            ab151.Checked = ab15.Checked;
            ab161.Checked = ab16.Checked;
            ad2111.Checked = ad1.Checked;
            ad21.Checked = ad2.Checked;
            ad31.Checked = ad3.Checked;
            ad41.Checked = ad4.Checked;
            ad51.Checked = ad5.Checked;
            ad61.Checked = ad6.Checked;
            ad71.Checked = ad7.Checked;
            ad81.Checked = ad8.Checked;
            ad91.Checked = ad9.Checked;
            ad101.Checked = ad10.Checked;
            ad111.Checked = ad11.Checked;
            ad121.Checked = ad12.Checked;
            ad131.Checked = ad13.Checked;
            ad141.Checked = ad14.Checked;
            ad151.Checked = ad15.Checked;
            ad161.Checked = ad16.Checked;
            ri1111.Checked = ri1.Checked;
            ri21.Checked = ri2.Checked;
            ri31.Checked = ri3.Checked;
            ri41.Checked = ri4.Checked;
            ri51.Checked = ri5.Checked;
            ri61.Checked = ri6.Checked;
            ri71.Checked = ri7.Checked;
            ri81.Checked = ri8.Checked;
            ri91.Checked = ri9.Checked;
            ri101.Checked = ri10.Checked;
            ri111.Checked = ri11.Checked;
            ri121.Checked = ri12.Checked;
            ri131.Checked = ri13.Checked;
            ri141.Checked = ri14.Checked;
            ri151.Checked = ri15.Checked;
            ri61.Checked = ri16.Checked;
            re1111.Checked = re1.Checked;
            re21.Checked = re2.Checked;
            re31.Checked = re3.Checked;
            re41.Checked = re4.Checked;
            re51.Checked = re5.Checked;
            re61.Checked = re6.Checked;
            re71.Checked = re7.Checked;
            re81.Checked = re8.Checked;
            re91.Checked = re9.Checked;
            re101.Checked = re10.Checked;
            re111.Checked = re11.Checked;
            re121.Checked = re12.Checked;
            re131.Checked = re13.Checked;
            re141.Checked = re14.Checked;
            re151.Checked = re15.Checked;
            re161.Checked = re16.Checked;
            p1111.Checked = p1.Checked;
            p21.Checked = p2.Checked;
            p31.Checked = p3.Checked;
            p41.Checked = p4.Checked;
            p51.Checked = p5.Checked;
            p61.Checked = p6.Checked;
            p71.Checked = p7.Checked;
            p81.Checked = p8.Checked;
            p91.Checked = p9.Checked;
            p101.Checked = p10.Checked;
            p111.Checked = p11.Checked;
            p121.Checked = p12.Checked;
            p131.Checked = p13.Checked;
            p141.Checked = p14.Checked;
            p151.Checked = p15.Checked;
            p161.Checked = p16.Checked;
            s1111.Checked = s1.Checked;
            s21.Checked = s2.Checked;
            s31.Checked = s3.Checked;
            s41.Checked = s4.Checked;
            s51.Checked = s5.Checked;
            s61.Checked = s6.Checked;
            s71.Checked = s7.Checked;
            s81.Checked = s8.Checked;
            s91.Checked = s9.Checked;
            s101.Checked = s10.Checked;
            s111.Checked = s11.Checked;
            s121.Checked = s12.Checked;
            s131.Checked = s13.Checked;
            s141.Checked = s14.Checked;
            s151.Checked = s15.Checked;
            s161.Checked = s16.Checked;
            fm1111.Checked = fm1.Checked;
            fm21.Checked = fm2.Checked;
            fm31.Checked = fm3.Checked;
            fm41.Checked = fm4.Checked;
            fm51.Checked = fm5.Checked;
            fm61.Checked = fm6.Checked;
            fm71.Checked = fm7.Checked;
            fm81.Checked = fm8.Checked;
            fm91.Checked = fm9.Checked;
            fm101.Checked = fm10.Checked;
            fm111.Checked = fm11.Checked;
            fm121.Checked = fm12.Checked;
            fm131.Checked = fm13.Checked;
            fm141.Checked = fm14.Checked;
            fm151.Checked = fm15.Checked;
            fm161.Checked = fm16.Checked;
            #endregion

            #region bloque4
            rbFlexionCervical1.Text = rbFlexionCervical.SelectedValue;
            rbFlexionDorsoLumbar1.Text = rbFlexionDorsoLumbar.SelectedValue;
            rbFlexionDolor1.Text = rbFlexionDolor.SelectedValue;

            rbExtensionCervical1.Text = rbExtensionCervical.SelectedValue;
            rbExtensionDorsoLumbar1.Text = rbExtensionDorsoLumbar.SelectedValue;
            rbExtensionDolor1.Text = rbExtensionDolor.SelectedValue;

            rbRotDerCervical1.Text = rbRotDerCervical.SelectedValue;
            rbRotDerDorsoLumbar1.Text = rbRotDerDorsoLumbar.SelectedValue;
            rbRotDerDolor1.Text = rbRotDerDolor.SelectedValue;

            rbRotIzqCervical1.Text = rbRotIzqCervical.SelectedValue;
            rbRotIzqDorsoLumbar1.Text = rbRotIzqDorsoLumbar.SelectedValue;
            rbRotIzqDolor1.Text = rbRotIzqDolor.SelectedValue;

            rbInlLatDerCervical1.Text = rbInlLatDerCervical.SelectedValue;
            rbInlLatDerDorsoLumbar1.Text = rbInlLatDerDorsoLumbar.SelectedValue;
            rbInlLatDerDolor1.Text = rbInlLatDerDolor.SelectedValue;

            rbInlLatIzqCervical1.Text = rbInlLatIzqCervical.SelectedValue;
            rbInlLatIzqDorsoLumbar1.Text = rbInlLatIzqDorsoLumbar.SelectedValue;
            rbInlLatIzqDolor1.Text = rbInlLatIzqDolor.SelectedValue;

            rbDerCervical1.Text = rbDerCervical.SelectedValue;
            rbDerDorsal1.Text = rbDerDorsal.SelectedValue;
            rbDerLumbar1.Text = rbDerLumbar.SelectedValue;

            rbIzqCervical1.Text = rbIzqCervical.SelectedValue;
            rbIzqDorsal1.Text = rbIzqDorsal.SelectedValue;
            rbIzqLumbar1.Text = rbIzqLumbar.SelectedValue;

            txtDiagnostico1.Text = txtDiagnostico.Text;
            txtRecomendaciones1.Text = txtRecomendaciones.Text;

            ojos1.Text = ddlOjos.SelectedValue;
            oidos1.Text = ddlOjos.SelectedValue;
            cara1.Text = ddlOjos.SelectedValue;
            cabeza1.Text = ddlOjos.SelectedValue;
            respiracion1.Text = ddlOjos.SelectedValue;
            traje1.Text = ddlTraje.SelectedValue;
            otro1.Text = txtOtroElemPro.Text;

            rbElegible1.SelectedValue = rbElegible.SelectedValue;

            rbReubicacion1.SelectedValue = rbReubicacion.SelectedValue;

            txtRestricciones1.Text = txtRestricciones.Text;
            txtFechaExamen1.Text = txtFechaExamen.Text;
            #endregion

            #endregion
            string script = @"<script type='text/javascript'>imprimir();</script>";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "imprimir", script, false);

            historia_clinica_ocupacional nuevo = new historia_clinica_ocupacional()
            {
                id_trabajador = Convert.ToInt32(ddlTrabajador.SelectedValue),
                id_tipo_exa = Convert.ToInt32(ddlTipoExamen.SelectedValue),
                fecha = Convert.ToDateTime(txtFecha.Text),
                doc_esc_paciente = "",
                doc_esc_medico = "",
                diagnostico = txtDiagnostico.Text,
                recomendaciones = txtRecomendaciones.Text
            };

            CRUD.Add_Fila(nuevo);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtFecha);
        }
        #endregion

        #region metodos gridview
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            cargarAccidentesLaborales();
        }
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            cargarHistoriasClinicas();
        }
        protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            cargarEquiposLaborales();
        }
        protected void GridView4_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView4.PageIndex = e.NewPageIndex;
            cargarPuestodeTrabajo();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("verDetalle"))
            {
                string id = Utilidades_GridView.DevolverIdRow(e, GridView1);
                id = objUtilidades.cifrarCadena(id);

                string _open = "window.open('../IncidentesLaborales/ConsultarIncidente.aspx?id=" + id + "', '_blank');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), _open, true);
            }
        }
        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("verDetalle"))
            {
                string id = Utilidades_GridView.DevolverIdRow(e, GridView1);
                string _open = "window.open('../IncidentesLaborales/ConsultarIncidente.aspx?id=" + id + "', '_blank');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), _open, true);
            }
        }
        #endregion

        #region eventos
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<sucursal> ListaSucursal = new List<sucursal>();
            ListaSucursal = Mgr_Sucursal.Sucursal(Convert.ToInt32(ddlSucursal.SelectedValue), 0, "");

            foreach (var item in ListaSucursal)
            {
                lbUbicacion.Text = string.Empty + item.direccion;
            }

            lbNumHistoria.Text = string.Empty + (GetterMax.HistoriaClinica() + 1);
            Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, Convert.ToInt32(ddlSucursal.SelectedValue));
        }
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
        }
        protected void ddlTrabajador_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarTrabajador();

            cargarDescripcion();

            cargarEmpleos();

            cargarPuestodeTrabajo();

            cargarAccidentesLaborales();

            cargarHistoriasClinicas();

            cargarEquiposLaborales();
        }
        #endregion

        #region cargar datos
        private void cargarEquiposLaborales()
        {
            Mgr_Trabajador.TrabajadorGestion(GridView3, ddlTrabajador.SelectedValue);
        }
        private void cargarHistoriasClinicas()
        {
            Tabla.HC_Trabajador(GridView2, ddlTrabajador.SelectedValue);
        }
        private void cargarAccidentesLaborales()
        {
            //Tabla.Accidente_Trabajador(GridView1, Convert.ToInt32(ddlTrabajador.SelectedValue));
        }
        private void cargarPuestodeTrabajo()
        {
            #region Puesto de Trabajo
            List<trabajador> ListaTrabajador = new List<trabajador>();
            ListaTrabajador = Mgr_Trabajador.Trabajador(0, 0, 0, Convert.ToInt32(ViewState["id_puesto_trabajo"]));

            foreach (var item in ListaTrabajador)
            {
                txtNombrePuesto.Text = item.puesto_trabajo.nombre;
                txtDescPuesto.Text = item.puesto_trabajo.descripcion;
                txtAreaPuesto.Text = item.puesto_trabajo.area.nombre;
            }

            #endregion

            //Tabla.PuestodeTrabajo_Riesgo(GridView4);
        }
        private void cargarEmpleos()
        {
            #region Empleos Anteriores

            List<desc_socio> ListaDescSocio = new List<desc_socio>();

            if ("" + ViewState["id_desc_socio"] != string.Empty)
            {
                ListaDescSocio = Getter.DescripcionSociodemografica(Convert.ToInt32(ViewState["id_desc_socio"]));

                foreach (var itemDescSocio in ListaDescSocio)
                {

                    int i = 1;
                    int cant = 0;
                    foreach (var item in itemDescSocio.empleo_anterior)
                    {
                        #region codigo
                        if (txtEmpresa1.Text != string.Empty)
                        {
                            if (i == 1)
                            {
                                txtEmpresa1.Text = item.empresa;
                                txtArea1.Text = item.area;
                                txtCargo1.Text = item.cargo;
                                txtAños1.Text = item.años;
                                txtMeses1.Text = item.meses;
                                txtEnfermedades1.Text = item.enfermedades;
                                cant++;
                            }
                            else if (i == 2)
                            {
                                txtEmpresa2.Text = item.empresa;
                                txtArea2.Text = item.area;
                                txtCargo2.Text = item.cargo;
                                txtAños2.Text = item.años;
                                txtMeses2.Text = item.meses;
                                txtEnfermedades2.Text = item.enfermedades;
                                cant++;
                            }
                            else if (i == 3)
                            {
                                txtEmpresa3.Text = item.empresa;
                                txtArea3.Text = item.area;
                                txtCargo3.Text = item.cargo;
                                txtAños3.Text = item.años;
                                txtMeses3.Text = item.meses;
                                txtEnfermedades3.Text = item.enfermedades;
                                cant++;
                            }
                        }
                        i++;
                        #endregion
                    }

                    {
                        if (cant == 1) { phempleo1.Visible = true; }

                        if (cant == 2) { phempleo1.Visible = true; phempleo2.Visible = true; }

                        if (cant == 3) { phempleo1.Visible = true; phempleo2.Visible = true; phempleo3.Visible = true; }
                    }
                }

            }
            #endregion
        }
        private void cargarDescripcion()
        {
            #region Socio Demografica
            List<desc_socio> ListaDescSocio = new List<desc_socio>();
            ListaDescSocio = Getter.DescripcionSociodemografica(0, Convert.ToInt32(ddlTrabajador.SelectedValue));

            foreach (var itemDescSocio in ListaDescSocio)
            {
                if (itemDescSocio != null)
                {
                    ViewState["id_desc_socio"] = itemDescSocio.id_desc_socio;
                    txtLugarNac.Text = itemDescSocio.lugar_nac;
                    txtNivelEsc.Text = itemDescSocio.nivel_escolaridad;
                    txtAñosAprob.Text = itemDescSocio.años_aprob;
                    txtCabezaFlia.Text = itemDescSocio.cabeza_fam;
                    txtCantHijos.Text = itemDescSocio.num_hijos;
                    txtRespEco.Text = itemDescSocio.repart_resp;
                    txtDependen.Text = itemDescSocio.menores_dep;
                    txtCondSocio.Text = itemDescSocio.cond_social;
                    txtMotivoDespl.Text = itemDescSocio.mot_despl;
                    txtTipoVivienda.Text = itemDescSocio.tipo_vivienda;
                    txtServicioPublico.Text = itemDescSocio.serv_pub;
                    txtCercaIndustria.Text = itemDescSocio.industria;
                    txtVivienda.Text = itemDescSocio.vivienda;
                    txtRuido.Text = itemDescSocio.ruido;
                    txtContaminacion.Text = itemDescSocio.contaminacion;
                    txtDescripcion.Text = itemDescSocio.descripcion;
                    txtAfiliado.Text = itemDescSocio.sist_seg_soc;
                    txtRegimenAfiliacion.Text = itemDescSocio.reg_afiliacion;
                    txtNivelSISBEN.Text = itemDescSocio.nivel_sisben;
                    if (itemDescSocio.id_eps == 0)
                        txtEPS1.Text = "Ninguna";
                    else
                        txtEPS1.Text = itemDescSocio.eps.nombre;
                    txtSistSocial.Text = itemDescSocio.afi_sssp;
                    if (itemDescSocio.id_afp == 0)
                        txtFondoPensiones.Text = "Ninguno";
                    else
                        txtFondoPensiones.Text = itemDescSocio.afp.nombre;
                    txtRiesgosProf.Text = itemDescSocio.afi_riesgo;
                    txtEstrato.Text = itemDescSocio.estrato;
                }
            }

            #endregion
        }
        private void cargarTrabajador()
        {
            #region Datos Trabajador
            List<trabajador> ListaTrabajador = new List<trabajador>();
            ListaTrabajador = Mgr_Trabajador.Trabajador(Convert.ToInt32(ddlTrabajador.SelectedValue));

            foreach (var item in ListaTrabajador)
            {
                ViewState["id_puesto_trabajo"] = item.id_puesto_trabajo;
                txtNombre1.Text = item.primer_nombre;
                txtNombre2.Text = item.segundo_nombre;
                txtApellido1.Text = item.primer_apellido;
                txtApellido2.Text = item.segundo_apellido;
                txtCedula.Text = item.cedula;
                txtFechaNac.Text = Convert.ToString(item.fecha_nacimiento);
                txtEmail.Text = item.email;
                txtSexo.Text = item.sexo;
                txtEdoCivil.Text = item.edo_civil;
                txtTelCasa.Text = item.telefono_casa;
                txtTelCelular.Text = item.telefono_movil;
                txtDireccion.Text = item.direccion;
            }
            #endregion
        }
        #endregion
    }
}