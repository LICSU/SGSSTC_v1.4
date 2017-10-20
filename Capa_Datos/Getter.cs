using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Capa_Datos
{
    /// <summary>
    /// Clase que se usa para obtener informacion de la base de datos
    /// </summary>
    public class Getter
    {
        /// <summary>
        /// constructor de la clase
        /// </summary>
        public Getter()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        #region brigada_emergencia

        public static List<brigada_emergencia> BrigadaEmergencia(int _id_brigada)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<brigada_emergencia> consulta = new List<brigada_emergencia>();
            consulta = contexto.brigada_emergencia.Where(x => x.id_brigada == _id_brigada).ToList();
            return consulta;
        }
        #endregion

        #region C_EPP

        public static List<Model_CEPP> Epp(int _id_puesto = 0, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Model_CEPP> consulta = new List<Model_CEPP>();

            if (_id_puesto != 0)
            {
                consulta = (
                    from E in contexto.epp
                    join PE in contexto.puesto_trabajo_epp on E.id_epp equals PE.id_epp
                    where (PE.id_puesto_trabajo == _id_puesto)
                    select new Model_CEPP
                    {
                        id = E.id_epp,
                        nombre = E.nombre
                    }
               ).ToList();
            }
            else if (_id_sucursal != 0)
            {
                consulta = (
                    from E in contexto.epp
                    join PE in contexto.puesto_trabajo_epp on E.id_epp equals PE.id_epp
                    join PT in contexto.puesto_trabajo on PE.id_puesto_trabajo equals PT.id_puesto_trabajo
                    where (PT.area.sucursal.id_sucursal == _id_sucursal)
                    select new Model_CEPP
                    {
                        id = E.id_epp,
                        nombre = E.nombre
                    }
                    ).ToList();
            }

            return consulta;
        }

        public static List<Model_CEPP> TipoEpp(int _id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Model_CEPP> consulta = new List<Model_CEPP>();

            consulta = (
                from E in contexto.epp
                join PE in contexto.puesto_trabajo_epp on E.id_epp equals PE.id_epp
                where (PE.id_puesto_trabajo == _id_puesto)
                select new Model_CEPP
                {
                    id = E.tipo_epp.id_tipo_epp,
                    nombre = E.tipo_epp.nombre_senal
                }
           ).ToList();

            return consulta;
        }
        #endregion

        #region Descripcion Sociodemografica
        public static List<desc_socio> DescripcionSociodemografica(int _id_desc_socio = 0, int _id_trabajador = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<desc_socio> consulta = new List<desc_socio>();

            if (_id_desc_socio != 0) { consulta = contexto.desc_socio.Where(x => x.id_desc_socio == _id_desc_socio).ToList(); }
            else if (_id_trabajador != 0) { consulta = contexto.desc_socio.Where(x => x.id_trabajador == _id_trabajador).ToList(); }

            return consulta;
        }
        #endregion

        #region extintor

        public static List<extintor> Extintor(int _idExtintor)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<extintor> consulta = new List<extintor>();
            consulta = contexto.extintor.Where(x => x.id_extintor == _idExtintor).ToList();

            return consulta;
        }
        #endregion
        

        #region encuesta_politica

        public static List<encuesta_politica> EncuestaPoliticaSST(int _id_encuesta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<encuesta_politica> consulta = new List<encuesta_politica>();
            consulta = contexto.encuesta_politica.Where(x => x.id_encuesta == _id_encuesta).ToList();
            return consulta;
        }
        #endregion        

        #region gestion_laboral
        public static List<gestion_laboral> GestionLaboral(int _id_ges_lab)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<gestion_laboral> consulta = new List<gestion_laboral>();
            consulta = contexto.gestion_laboral.Where(x => x.id_ges_lab == _id_ges_lab).ToList();
            return consulta;
        }
        public static List<gestion_laboral> GesLabCap(DateTime fechaInicial, DateTime fechaFinal, int _id_empresa = 0, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<gestion_laboral> consulta = new List<gestion_laboral>();
            consulta = contexto.gestion_laboral.Where(
                x => x.tipo_gestion == 2
                && x.fecha >= fechaInicial
                && x.fecha <= fechaFinal).OrderBy(x => x.fecha).ToList();

            if (_id_empresa != 0) { consulta = consulta.Where(x => x.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { consulta = consulta.Where(x => x.usuario.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal).ToList(); }

            return consulta;
        }

        #endregion

        #region horario
        public static horario Horario(int _id_horario)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            horario consulta = new horario();
            consulta = contexto.horario.Where(x => x.id_horario == _id_horario).SingleOrDefault();
            return consulta;
        }
        public static List<horario> ListHorario(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<horario> consulta = new List<horario>();

            consulta = contexto.horario.Where(x => x.id_empresa == _id_empresa).ToList(); 

            return consulta;
        }
        #endregion


        #region ListEnfSis

        public static List<Model_Enfermedad_Sistema> CantDiagnosticos(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Model_Enfermedad_Sistema> query = new List<Model_Enfermedad_Sistema>();
            if (id_empresa > 0)
            {
                query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.enfermedad on TE.id_enfermedad equals E.id_enfermedad
                    where (TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa == id_empresa && TE.fecha_constancia.Value.Year == _anho)
                    group TE by E.nombre into grupo
                    select new Model_Enfermedad_Sistema
                    {
                        nombre = grupo.Key,
                        suma = grupo.Sum(TE => TE.dias_reposo).ToString(),
                        cantidad = grupo.Count()
                    }
               ).ToList();
            }
            else if (id_sucursal > 0)
            {
                query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.enfermedad on TE.id_enfermedad equals E.id_enfermedad
                    where (TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal == id_sucursal && TE.fecha_constancia.Value.Year == _anho)
                    group TE by E.nombre into grupo
                    select new Model_Enfermedad_Sistema
                    {
                        nombre = grupo.Key,
                        suma = grupo.Sum(TE => TE.dias_reposo).ToString(),
                        cantidad = grupo.Count()
                    }
                ).ToList();
            }

            return query;
        }
        public static List<Model_Enfermedad_Sistema> CantSistemas(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Model_Enfermedad_Sistema> query = new List<Model_Enfermedad_Sistema>();
            if (id_empresa > 0)
            {
                query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.sistema on TE.id_sistema equals E.id_sistemas
                    where (TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa == id_empresa && TE.fecha_constancia.Value.Year == _anho)
                    group TE by E.nombre into grupo
                    select new Model_Enfermedad_Sistema
                    {
                        nombre = grupo.Key,
                        suma = grupo.Sum(TE => TE.dias_reposo).ToString(),
                        cantidad = grupo.Count()
                    }
                ).ToList();

                return query;
            }
            else if (id_sucursal > 0)
            {
                query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.sistema on TE.id_sistema equals E.id_sistemas
                    where (TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal == id_sucursal && TE.fecha_constancia.Value.Year == _anho)
                    group TE by E.nombre into grupo
                    select new Model_Enfermedad_Sistema
                    {
                        nombre = grupo.Key,
                        suma = grupo.Sum(TE => TE.dias_reposo).ToString(),
                        cantidad = grupo.Count()
                    }
                ).ToList();
            }
            return query;
        }

        #endregion

        #region matriz_responsabilidad

        public static List<matriz_responsabilidad> MatrizResponsabilidad(int _id_matriz_responsabilidad)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<matriz_responsabilidad> consulta = new List<matriz_responsabilidad>();
            consulta = contexto.matriz_responsabilidad.Where(x => x.id_matriz_responsabilidad == _id_matriz_responsabilidad).ToList();
            return consulta;
        }
        #endregion

        #region enfermedadLaboral
        public static List<enfermedadLaboral> MatRieEnfLab(int _id_EnfLab)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<enfermedadLaboral> consulta = new List<enfermedadLaboral>();
            consulta = contexto.enfermedadLaboral.Where(
                x => x.id_enfermedadLaboral == _id_EnfLab).ToList();
            return consulta;
        }
        #endregion    

        #region Obligacion
        public static List<obligacion> Obligacion(int _id_obligacion)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<obligacion> consulta = new List<obligacion>();
            consulta = contexto.obligacion.Where(x => x.id_obligacion == _id_obligacion).ToList();
            return consulta;
        }
        #endregion

        #region planes
        public static List<plan> Planes(int _id_plan, string _tipo = "", string _nombre ="")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<plan> consulta = new List<plan>();
            consulta = contexto.plan.Where(x => x.id_plan == _id_plan && x.tipo == _tipo
                                            && x.nombre.ToUpper().Contains(_nombre.ToUpper())).ToList();
            return consulta;
        }

        #endregion 

        #region puesto_trabajo_epp

        public static int Trae_ID_PEPP(int id_puesto, int id_epp)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from e in contexto.puesto_trabajo_epp
                    where (e.id_puesto_trabajo == id_puesto && e.id_epp == id_epp)
                    select new
                    {
                        e.id_puesto_trabajo_epp
                    }
                ).ToList();

            return query.ElementAt(0).id_puesto_trabajo_epp;
        }

        #endregion

        #region politica_sst

        public static List<politica_sst> PoliticaSST(int _id_politica_sst)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<politica_sst> consulta = new List<politica_sst>();
            consulta = contexto.politica_sst.Where(x => x.id_politica == _id_politica_sst).ToList();
            return consulta;
        }
        #endregion


        public static List<plan_trabajo> Plan_Trabajo(int _id_sucursal = 0, int _anho = 0, int id_plan = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<plan_trabajo> consulta = new List<plan_trabajo>();

            if (id_plan != 0) { consulta = contexto.plan_trabajo.Where(x => x.id_plan_trabajo == id_plan).ToList(); }
            else if (_id_sucursal != 0 && _anho != 0)
            {
                consulta = contexto.plan_trabajo.Where(x =>
                x.usuario.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal &&
                x.anho == _anho).OrderBy(x => x.semana_ini).ToList();
            }

            return consulta;
        }

        #region procedimiento_comunicacion

        public static List<procedimiento_comunicacion> ProcedimientoComunicacion(int _id_brigada)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<procedimiento_comunicacion> consulta = new List<procedimiento_comunicacion>();
            consulta = contexto.procedimiento_comunicacion.Where(x => x.id_brigada == _id_brigada).ToList();
            return consulta;
        }
        #endregion

        #region Soporte
        public static List<soporte> Soporte(int _id_rec_eco, string tipo)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<soporte> consulta = new List<soporte>();
            consulta = contexto.soporte.Where(
                x => x.id_tabla == _id_rec_eco &&
                x.tabla == tipo
                ).ToList();
            return consulta;
        }
        #endregion        

        #region tipo_documento

        public static List<tipo_documento> TipoDocumento(int _id_tipoDocumento)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<tipo_documento> consulta = new List<tipo_documento>();
            consulta = contexto.tipo_documento.Where(x => x.id_tipo_documento == _id_tipoDocumento).ToList();
            return consulta;
        }
        #endregion              

        #region respuestas y preguntas

        public static List<Pregunta> Pregunta(int _id_pregunta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<Pregunta>();
            consulta = contexto.Pregunta.Where(x => x.id_pregunta == _id_pregunta).ToList();
            return consulta;
        }

        public static List<Respuesta> Respuesta(int _id_respuesta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<Respuesta>();
            consulta = contexto.Respuesta.Where(x => x.id_respuesta == _id_respuesta).ToList();
            return consulta;
        }

        #endregion

        public static perfil_cargo PerfilCargo(int _id_perfil)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            return contexto.perfil_cargo.Where(x => x.id_perfil_cargo == _id_perfil).SingleOrDefault();
        }

        public static List<senalizacion> Senalizacion(int _id_senal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<senalizacion> consulta = contexto.senalizacion.Where(x => x.id_senalizacion == _id_senal).ToList();
            return consulta;
        }
    }
}