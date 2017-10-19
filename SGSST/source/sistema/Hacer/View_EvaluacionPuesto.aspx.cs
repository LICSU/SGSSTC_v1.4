using Capa_Datos;using Capa_Datos.Manager.Trabajador;using Capa_Datos.Manager.Area;using Capa_Datos.Manager.Sucursal;using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class View_EvaluacionPuesto : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private  Utilidades objUtilidades = new Utilidades();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            int id_EvaRiesgo = objUtilidades.descifrarCadena(Request.QueryString["id"]);
            List<evaluacion_riesgo> Lista_EvaRiesgo = new List<evaluacion_riesgo>();
            Lista_EvaRiesgo = Getter.EvaluacionRiesgo(id_EvaRiesgo);

            foreach (var itemEvaRiesgo in Lista_EvaRiesgo)
            {
                ViewState["id_Puesto"] = Convert.ToInt32(itemEvaRiesgo.identificacion_puesto.id_puesto);

                txtSucursal.Text = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.sucursal.nombre;
                txtPuestos.Text = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.nombre;
                txtArea.Text = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.nombre;
                txtDescripcionPuesto.Text = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.descripcion;

                foreach (var itemFactor in itemEvaRiesgo.identificacion_puesto.identificacion_peligro.factor_identificacion)
                {
                    txtTipoRiesgo.Text = itemFactor.factor_riesgo.tipo_riesgo.nombre;
                    txtFactorRiesgo.Text = itemFactor.factor_riesgo.nombre;
                    txtConsecuencias.Text = itemFactor.consecuencias;
                    txtTiempoExposicion.Text = itemFactor.tiempo_exposicion;
                }

                txtControlFuente.Text = itemEvaRiesgo.control_fuente;
                txtControlMedio.Text = itemEvaRiesgo.control_medio;
                txtControlIndividuo.Text = itemEvaRiesgo.control_individuo;
                txtResponsableSGSST.Text = itemEvaRiesgo.nombre_responsable;
                txtFechaEvaluacion.Text = Convert.ToDateTime(itemEvaRiesgo.fecha_evaluacion).ToString("yyyy-MM-dd");

                if (itemEvaRiesgo.nivel_deficiencia == "10")
                {
                    txtNivelDeficiencia.Text = "Muy alto";
                    txtInterpretacionNivelDeficiencia.Text = "Se ha(n) detectado peligro(s) que determina(n) como posible la generación de incidentes, o la eficacia del conjunto de medidas preventivas existentes respecto al riesgo es nula no existe, o ambos";
                }
                else if (itemEvaRiesgo.nivel_deficiencia == "6")
                {
                    txtNivelDeficiencia.Text = "Alto";
                    txtInterpretacionNivelDeficiencia.Text = "Se ha(n) detectado algún(os) peligro(s) que puede(n) dar lugar a consecuencias significativa(s) o la eficacia del conjunto de medidas preventivas existentes es baja, o ambos";
                }
                else if (itemEvaRiesgo.nivel_deficiencia == "2")
                {
                    txtNivelDeficiencia.Text = "Medio";
                    txtInterpretacionNivelDeficiencia.Text = "Se han detectado peligros que pueden dar lugar a consecuencias poco significativa(s) o de menor importancia, o la eficacia del conjunto de medidas preventivas existentes es moderada, o ambos.";
                }
                else if (itemEvaRiesgo.nivel_deficiencia == "0")
                {
                    txtNivelDeficiencia.Text = "Bajo";
                    txtInterpretacionNivelDeficiencia.Text = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado.";
                }

                if (itemEvaRiesgo.nivel_exposicion == "4")
                {
                    txtNivelExposicion.Text = "Continua";
                    txtInterpretacionNivelExposicion.Text = "La situación de exposición se presenta sin interrupción o varias veces con tiempo prolongado durante la jornada laboral.";
                }
                else if (itemEvaRiesgo.nivel_exposicion == "3")
                {
                    txtNivelExposicion.Text = "Frecuente";
                    txtInterpretacionNivelExposicion.Text = "La situación de exposición se presenta varias veces durante la jornada laboral por tiempos cortos.";
                }
                else if (itemEvaRiesgo.nivel_exposicion == "2")
                {
                    txtNivelExposicion.Text = "Ocasional";
                    txtInterpretacionNivelExposicion.Text = "La situación de exposición se presenta alguna vez durante la jornada laboral y por un periodo de tiempo corto.";
                }
                else if (itemEvaRiesgo.nivel_exposicion == "1")
                {
                    txtNivelExposicion.Text = "Esporádica";
                    txtInterpretacionNivelExposicion.Text = "La situación de exposición se presenta de manera eventual.";
                }

                txtNivelProbabilidad.Text = itemEvaRiesgo.nivel_probabilidad;
                int probabilidad = Convert.ToInt32(txtNivelProbabilidad.Text);

                if (probabilidad >= 24 && probabilidad <= 40) { txtInterpretacionNivelProbabilidad.Text = "Situación deficiente con exposición continua.Normalmente la materialización del riesgo ocurre con frecuencia"; }
                else if (probabilidad >= 10 && probabilidad <= 20) { txtInterpretacionNivelProbabilidad.Text = "Situación deficiente con exposición frecuente u ocasional, o bien situación muy deficiente con exposición ocasional o esporádica.La materialización del riesgo es posible que suceda varias veces durante la vida laboral "; }
                else if (probabilidad >= 6 && probabilidad <= 8) { txtInterpretacionNivelProbabilidad.Text = "Situación deficiente con exposición esporádica, o bien situación mejorable con exposición continuada o frecuente. Es posible que suceda el daño alguna vez."; }
                else if (probabilidad >= 2 && probabilidad <= 4) { txtInterpretacionNivelProbabilidad.Text = "Situación mejorable con exposición ocasional o esporádica, o situación sin anomalía destacable con cualquier nivel de exposición.No es esperable que se materialice el riesgo, aunque puede ser concebible."; }
                else if (probabilidad == 0) { txtInterpretacionNivelProbabilidad.Text = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado."; }

                if (itemEvaRiesgo.nivel_consecuencia == "100")
                {
                    txtNivelConsecuencia.Text = "Mortal o catastrófico(M)";
                    txtInterpretacionNivelConsecuencia.Text = "Muerte(s)";
                }
                else if (itemEvaRiesgo.nivel_consecuencia == "60")
                {
                    txtNivelConsecuencia.Text = "Muy grave (MG)";
                    txtInterpretacionNivelConsecuencia.Text = "Lesiones o enfermedades graves irreparables (incapacidad permanente, parcial o invalidez).";
                }
                else if (itemEvaRiesgo.nivel_consecuencia == "25")
                {
                    txtNivelConsecuencia.Text = "Grave (G)";
                    txtInterpretacionNivelConsecuencia.Text = "Lesiones o enfermedades con incapacidad laboral temporal (ILT).";
                }
                else if (itemEvaRiesgo.nivel_consecuencia == "10")
                {
                    txtNivelConsecuencia.Text = "Leve (L)";
                    txtInterpretacionNivelConsecuencia.Text = "Lesiones o enfermedades que no requieren incapacidad.";
                }

                txtNivelRiesgo.Text = itemEvaRiesgo.nivel_riesgo;
                txtInterpretacionNivelRiesgo.Text = itemEvaRiesgo.interpretacion_nivel_riesgo;
                txtAceptabilidadRiesgo.Text = itemEvaRiesgo.aceptabilidad_riesgo;
                txtPlanta.Text = string.Empty + itemEvaRiesgo.planta;
                txtContratistas.Text = string.Empty + itemEvaRiesgo.contratistas;
                txtVisitantes.Text = string.Empty + itemEvaRiesgo.visitantes;
                txtTotalPersonalExpuesto.Text = string.Empty + itemEvaRiesgo.total;
                txtPeorConsecuencia.Text = string.Empty + itemEvaRiesgo.peor_consecuencia;
                txtEliminación.Text = string.Empty + itemEvaRiesgo.eliminación;
                txtSustitución.Text = string.Empty + itemEvaRiesgo.sustitución;
                txtIngenieria.Text = string.Empty + itemEvaRiesgo.controles_ingenieria;
                txtAdministrativos.Text = string.Empty + itemEvaRiesgo.controles_administrativos;
                txtFechaEjecucion.Text = Convert.ToDateTime(itemEvaRiesgo.fecha_ejecucion).ToString("yyyy-MM-dd");



                int contadorEpp = 1;
                foreach (var itemEpp in itemEvaRiesgo.identificacion_puesto.puesto_trabajo.puesto_trabajo_epp)
                {
                    txtEpp.Text = txtEpp.Text +
                        "<div class='col-md-4'>" +
                        "<strong>Epp N°</strong>  " + contadorEpp + "<br/>" +
                        "<strong>Nombre:</strong>  " + itemEpp.epp.nombre + "<br/>" +
                        "<strong>Tipo de Epp:</strong>  " + itemEpp.epp.tipo_epp.nombre +
                        "</div>";
                    contadorEpp++;
                }


            }

        }

        protected void Volver(object sender, EventArgs e)
        {
            string IdPuesto = objUtilidades.cifrarCadena(string.Empty + ViewState["id_Puesto"]);
            
            Response.Redirect(Paginas.index_EvaluacionesPuestos.Value+"?id=" + IdPuesto);
        }

    }
}