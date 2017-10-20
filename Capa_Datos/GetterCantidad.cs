using System;
using System.Linq;

namespace Capa_Datos
{
    /// <summary>
    /// Descripción breve de GetterCantidad
    /// </summary>
    public class GetterCantidad
    {
        public GetterCantidad()
        {
            //
            // TODO: Agregar aquí la lógica del constructor
            //
        }

        public static int Constancias(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.url_constancia != string.Empty
                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
        public static int EvaluacionesCli(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from HC in contexto.historia_clinica_ocupacional
                join T in contexto.trabajador on HC.id_trabajador equals T.id_trabajador
                join PT in contexto.puesto_trabajo on T.id_puesto_trabajo equals PT.id_puesto_trabajo
                join A in contexto.area on PT.id_area equals A.id_area
                join SU in contexto.sucursal on A.id_sucursal equals SU.id_sucursal
                join TE in contexto.tipo_examen on HC.id_tipo_exa equals TE.id_tipo_exa
                where HC.fecha.Value.Year == _anho && (
                      TE.nombre.ToUpper().Equals("EVALUACIÓN PRE EMPLEO") ||
                      TE.nombre.ToUpper().Equals("EVALUACIÓN PRE VACACIONAL") ||
                      TE.nombre.ToUpper().Equals("EVALUACIÓN POST VACACIONAL") ||
                      TE.nombre.ToUpper().Equals("EVALUACIÓN PERIÓDICA") ||
                      TE.nombre.ToUpper().Equals("EVALUACIÓN ESPECIAL") ||
                      TE.nombre.ToUpper().Equals("EVALUACIÓN POST EMPLEO") ||
                      TE.nombre.ToUpper().Equals("EVALUACIÓN ASISTENCIAL O CURATIVA"))

                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Distinct().Count();
        }
        public static int EvaluacionesPorTipo(int _anho, string tipo, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from HC in contexto.historia_clinica_ocupacional
                join T in contexto.trabajador on HC.id_trabajador equals T.id_trabajador
                join PT in contexto.puesto_trabajo on T.id_puesto_trabajo equals PT.id_puesto_trabajo
                join A in contexto.area on PT.id_area equals A.id_area
                join SU in contexto.sucursal on A.id_sucursal equals SU.id_sucursal
                join TE in contexto.tipo_examen on HC.id_tipo_exa equals TE.id_tipo_exa
                where HC.fecha.Value.Year == _anho && (TE.nombre.ToUpper().Equals(tipo))

                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Distinct().Count();
        }
        public static int Enfermedades(int _anho, string tipo, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.tpo_enfermedad == tipo
                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
        public static int DiasReposo(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.url_constancia != string.Empty && TE.dias_reposo > 0
                select new
                {
                    T.id_trabajador,
                    TE.dias_reposo,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            int suma = Convert.ToInt32(query.Sum(x => x.dias_reposo));
            return suma;
        }
        public static int GestionLaboralByFecha(DateTime fechaInicial, DateTime fechaFinal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (from GL in contexto.gestion_laboral
                         where GL.fecha >= fechaInicial && GL.fecha <= fechaFinal && GL.tipo_gestion == 2
                         select GL).Count();
            return query;
        }
        public static int Reposos(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.dias_reposo > 0
                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
        public static int RepososPorNombre(int _anho, string tipo, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.tpo_enfermedad == tipo && TE.dias_reposo > 0
                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
    }
}
