using System;

namespace Capa_Datos
{
    /// <summary>
    /// Es la clase que hace las operaciones de Agregar, eliminar y editar del sistema a la bd
    /// </summary>
    public class CRUD
    {
        /// <summary>
        /// constructor de la clase
        /// </summary>
        public CRUD()
        {
            //
            // TODO: Agregar aquí la lógica del constructor
            //
        }

        /// <summary>
        /// añade una registro a una tabla de la base de datos
        /// </summary>
        public static bool Add_Fila(dynamic _nuevo)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            bool bError = true;

            try
            {
                if (_nuevo.GetType() == typeof(lista_actividad)) { contexto.lista_actividad.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(alarma)) { contexto.alarma.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(at_it_el_pa)) { contexto.at_it_el_pa.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(Pregunta)) { contexto.Pregunta.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(perfil_cargo)) { contexto.perfil_cargo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(Respuesta)) { contexto.Respuesta.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(area)) { contexto.area.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(brigada_emergencia)) { contexto.brigada_emergencia.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(categoria)) { contexto.categoria.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(documento)) { contexto.documento.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(desc_socio)) { contexto.desc_socio.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(empleo_anterior)) { contexto.empleo_anterior.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(empresa)) { contexto.empresa.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(empresa_itemdivision)) { contexto.empresa_itemdivision.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(encuesta_politica)) { contexto.encuesta_politica.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(epp)) { contexto.epp.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(estatus)) { contexto.estatus.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(extintor)) { contexto.extintor.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(factor_riesgo)) { contexto.factor_riesgo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(gestion_laboral)) { contexto.gestion_laboral.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(historia_clinica_ocupacional)) { contexto.historia_clinica_ocupacional.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(horario)) { contexto.horario.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(investigacion_ac_in)) { contexto.investigacion_ac_in.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(matriz_responsabilidad)) { contexto.matriz_responsabilidad.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(medida_sucursal)) { contexto.medida_sucursal.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(norma_sucursal)) { contexto.norma_sucursal.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(obligacion)) { contexto.obligacion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(plan)) { contexto.plan.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(plan_trabajo)) { contexto.plan_trabajo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(politica_sst)) { contexto.politica_sst.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(procedimiento_comunicacion)) { contexto.procedimiento_comunicacion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(puesto_trabajo)) { contexto.puesto_trabajo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(puesto_trabajo_epp)) { contexto.puesto_trabajo_epp.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(sucursal)) { contexto.sucursal.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(tipo_documento)) { contexto.tipo_documento.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(tipo_epp)) { contexto.tipo_epp.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(trabajador)) { contexto.trabajador.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(trabajador_estatus)) { contexto.trabajador_estatus.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(trabajador_gestion)) { contexto.trabajador_gestion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(usuario)) { contexto.usuario.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(soporte)) { contexto.soporte.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(identificacion_peligro)) { contexto.identificacion_peligro.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(identificacion_puesto)) { contexto.identificacion_puesto.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(factor_identificacion)) { contexto.factor_identificacion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(evaluacion_riesgo)) { contexto.evaluacion_riesgo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(senalizacion)) { contexto.senalizacion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(rol)) { contexto.rol.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(perfil_medico)) { contexto.perfil_medico.Add(_nuevo); }

                contexto.SaveChanges();
            }
            catch (Exception e)
            {
                bError = false;
                Utilidades.LogMessage("Execpción: " + e);
            }

            return bError;
        }

        /// <summary>
        /// edita una registro de una tabla de la base de datos
        /// </summary>
        public static bool Edit_Fila(GrupoLiEntities contexto)
        {
            bool bError = true;

            try
            {
                contexto.SaveChanges();
            }
            catch (Exception e)
            {
                bError = false; Utilidades.LogMessage("Execpción: " + e);
            }

            return bError;
        }

        /// <summary>
        /// elimina una registro de una tabla de la base de datos
        /// </summary>
        public static bool Delete_Fila(dynamic tabla, int _id)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            bool bError = true;

            try
            {
                if (tabla.GetType() == typeof(alarma))
                {
                    var Eliminar = new alarma { id_alarmas = _id };
                    contexto.alarma.Attach(Eliminar);
                    contexto.alarma.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(at_it_el_pa))
                {
                    var Eliminar = new at_it_el_pa { id_at_it_el_pa = _id };
                    contexto.at_it_el_pa.Attach(Eliminar);
                    contexto.at_it_el_pa.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(area))
                {
                    var Eliminar = new area { id_area = _id };
                    contexto.area.Attach(Eliminar);
                    contexto.area.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(categoria))
                {
                    var Eliminar = new categoria { id_categorias = _id };
                    contexto.categoria.Attach(Eliminar);
                    contexto.categoria.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(documento))
                {
                    var Eliminar = new documento { id_documento = _id };
                    contexto.documento.Attach(Eliminar);
                    contexto.documento.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(desc_socio))
                {
                    var Eliminar = new desc_socio { id_desc_socio = _id };
                    contexto.desc_socio.Attach(Eliminar);
                    contexto.desc_socio.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(encuesta_politica))
                {
                    var Eliminar = new encuesta_politica { id_encuesta = _id };
                    contexto.encuesta_politica.Attach(Eliminar);
                    contexto.encuesta_politica.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(epp))
                {
                    var Eliminar = new epp { id_epp = _id };
                    contexto.epp.Attach(Eliminar);
                    contexto.epp.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(estatus))
                {
                    var Eliminar = new estatus { id_estatus = _id };
                    contexto.estatus.Attach(Eliminar);
                    contexto.estatus.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(extintor))
                {
                    var Eliminar = new extintor { id_extintor = _id };
                    contexto.extintor.Attach(Eliminar);
                    contexto.extintor.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(factor_riesgo))
                {
                    var Eliminar = new factor_riesgo { id_factor_riesgo = _id };
                    contexto.factor_riesgo.Attach(Eliminar);
                    contexto.factor_riesgo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(gestion_laboral))
                {
                    var Eliminar = new gestion_laboral { id_ges_lab = _id };
                    contexto.gestion_laboral.Attach(Eliminar);
                    contexto.gestion_laboral.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(historia_clinica_ocupacional))
                {
                    var Eliminar = new historia_clinica_ocupacional { id_his_cli_ocu = _id };
                    contexto.historia_clinica_ocupacional.Attach(Eliminar);
                    contexto.historia_clinica_ocupacional.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(horario))
                {
                    var Eliminar = new horario { id_horario = _id };
                    contexto.horario.Attach(Eliminar);
                    contexto.horario.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(matriz_responsabilidad))
                {
                    var Eliminar = new matriz_responsabilidad { id_matriz_responsabilidad = _id };
                    contexto.matriz_responsabilidad.Attach(Eliminar);
                    contexto.matriz_responsabilidad.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(obligacion))
                {
                    var Eliminar = new obligacion { id_obligacion = _id };
                    contexto.obligacion.Attach(Eliminar);
                    contexto.obligacion.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(plan))
                {
                    var Eliminar = new plan { id_plan = _id };
                    contexto.plan.Attach(Eliminar);
                    contexto.plan.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(plan_trabajo))
                {
                    var Eliminar = new plan_trabajo { id_plan_trabajo = _id };
                    contexto.plan_trabajo.Attach(Eliminar);
                    contexto.plan_trabajo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(Pregunta))
                {
                    var Eliminar = new Pregunta { id_pregunta = _id };
                    contexto.Pregunta.Attach(Eliminar);
                    contexto.Pregunta.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(perfil_cargo))
                {
                    var Eliminar = new perfil_cargo { id_perfil_cargo = _id };
                    contexto.perfil_cargo.Attach(Eliminar);
                    contexto.perfil_cargo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(politica_sst))
                {
                    var Eliminar = new politica_sst { id_politica = _id };
                    contexto.politica_sst.Attach(Eliminar);
                    contexto.politica_sst.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(puesto_trabajo))
                {
                    var Eliminar = new puesto_trabajo { id_puesto_trabajo = _id };
                    contexto.puesto_trabajo.Attach(Eliminar);
                    contexto.puesto_trabajo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(puesto_trabajo_epp))
                {
                    var Eliminar = new puesto_trabajo_epp { id_puesto_trabajo_epp = _id };
                    contexto.puesto_trabajo_epp.Attach(Eliminar);
                    contexto.puesto_trabajo_epp.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(sucursal))
                {
                    var Eliminar = new sucursal { id_sucursal = _id };
                    contexto.sucursal.Attach(Eliminar);
                    contexto.sucursal.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(tipo_documento))
                {
                    var Eliminar = new tipo_documento { id_tipo_documento = _id };
                    contexto.tipo_documento.Attach(Eliminar);
                    contexto.tipo_documento.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(tipo_epp))
                {
                    var Eliminar = new tipo_epp { id_tipo_epp = _id };
                    contexto.tipo_epp.Attach(Eliminar);
                    contexto.tipo_epp.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(trabajador))
                {
                    var Eliminar = new trabajador { id_trabajador = _id };
                    contexto.trabajador.Attach(Eliminar);
                    contexto.trabajador.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(trabajador_gestion))
                {
                    //contexto.trabajador_gestion.RemoveRange(contexto.trabajador_gestion.Where(x => x.id_ges_lab == _id));
                }
                else if (tabla.GetType() == typeof(usuario))
                {
                    var Eliminar = new usuario { id_usuario = _id };
                    contexto.usuario.Attach(Eliminar);
                    contexto.usuario.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(investigacion_ac_in))
                {
                    var Eliminar = new investigacion_ac_in { id_inv_ac_in = _id };
                    contexto.investigacion_ac_in.Attach(Eliminar);
                    contexto.investigacion_ac_in.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(identificacion_peligro))
                {
                    var Eliminar = new identificacion_peligro { id_identificacion_peligro = _id };
                    contexto.identificacion_peligro.Attach(Eliminar);
                    contexto.identificacion_peligro.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(evaluacion_riesgo))
                {
                    var Eliminar = new evaluacion_riesgo { id_evaluacion_riesgo = _id };
                    contexto.evaluacion_riesgo.Attach(Eliminar);
                    contexto.evaluacion_riesgo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(empresa))
                {
                    var Eliminar = new empresa { id_empresa = _id };
                    contexto.empresa.Attach(Eliminar);
                    contexto.empresa.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(rol))
                {
                    var Eliminar = new rol { id_rol = _id };
                    contexto.rol.Attach(Eliminar);
                    contexto.rol.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(senalizacion))
                {
                    var Eliminar = new senalizacion { id_senalizacion = _id };
                    contexto.senalizacion.Attach(Eliminar);
                    contexto.senalizacion.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(perfil_medico))
                {
                    var Eliminar = new perfil_medico { id_perfil_medico = _id };
                    contexto.perfil_medico.Attach(Eliminar);
                    contexto.perfil_medico.Remove(Eliminar);
                }

                contexto.SaveChanges();
            }
            catch (Exception e)
            {
                bError = false; Utilidades.LogMessage("Execpción: " + e);
            }


            return bError;
        }

    }
}