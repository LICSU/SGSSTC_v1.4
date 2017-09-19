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


        public static int AccidentesLaboral(int _anho, int _id_empresa = 0, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.at_it_el_pa
                where TE.fecha_accidente.Value.Year == _anho
                select new
                {
                    TE.id_trabajador,
                    TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                    TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (_id_empresa > 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal > 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }

            return query.Count();
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

        public static int UsuarioTrabajador(int _id_usuario)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from e in contexto.usuario
                    where (e.id_usuario == _id_usuario)
                    select new
                    {
                        e.id_trabajador
                    }
                ).ToList();

            return Convert.ToInt32(query.ElementAt(0).id_trabajador);
        }

        public static int TrabPuesto(int _id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AC in contexto.trabajador
                    where (AC.id_puesto_trabajo == _id_puesto)
                    select new
                    {
                        AC.id_trabajador
                    }
            ).ToList();

            return query.Count();
        }
        public static int Trabajadores_CantidadesByCapacidad(int id_sucursal, DateTime fechaIni, DateTime fechaFin)
        {
            GrupoLiEntities contexto1 = new GrupoLiEntities();

            var query = (
                from T in contexto1.trabajador
                join TG in contexto1.trabajador_gestion on T.id_trabajador equals TG.id_trabajador
                join PT in contexto1.puesto_trabajo on T.id_puesto_trabajo equals PT.id_puesto_trabajo
                join A in contexto1.area on PT.id_area equals A.id_area
                join SU in contexto1.sucursal on A.id_sucursal equals SU.id_sucursal
                join GL in contexto1.gestion_laboral on TG.id_ges_lab equals GL.id_ges_lab
                where (TG.gestion_laboral.tipo_gestion == 2 && GL.fecha >= fechaIni && GL.fecha <= fechaFin && SU.id_sucursal == id_sucursal)
                select new
                {
                    T.id_trabajador
                }
            ).ToList();

            return query.Distinct().Count();
        }
        public static int Trabajadores(int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from SC in contexto.sucursal
                select new
                {
                    SC.id_sucursal,
                    SC.nombre,
                    SC.id_empresa,
                    empresa = SC.empresa.nombre,
                    NumTrab = (
                        from TB in contexto.trabajador
                        where TB.puesto_trabajo.area.id_sucursal == SC.id_sucursal
                        select TB.id_trabajador).Count()
                }).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.ElementAt(0).NumTrab;
        }
        public static int Trabajadores_Empresa(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int query = (
                from SC in contexto.trabajador
                where SC.puesto_trabajo.area.sucursal.id_empresa == _id_empresa
                select new
                {
                    SC.id_trabajador
                }).Count();

            return query;
        }
        public static int TrabajadoresDiscapacitados(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from T in contexto.trabajador
                where  T.es_discapacitado.ToUpper() == "SI"
                select new
                {
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa,
                }).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
        public static int TrabEnfermedad(int _anho, string enfermedad, int id_empresa, int id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int cantidad = 0;
            if (id_sucursal > 0)
            {
                var query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.enfermedad on TE.id_enfermedad equals E.id_enfermedad
                    where (TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal == id_sucursal
                           && TE.fecha_constancia.Value.Year == _anho
                           && E.nombre.ToUpper().Equals(enfermedad.ToUpper())
                           && TE.dias_reposo > 0)
                    select new
                    {
                        TE.id_trabajador_estatus
                    }
                    ).ToList();
                cantidad = Convert.ToInt32(query.Count());
            }
            if (id_empresa > 0)
            {
                var query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.enfermedad on TE.id_enfermedad equals E.id_enfermedad
                    where (TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa == id_empresa
                           && TE.fecha_constancia.Value.Year == _anho
                           && E.nombre.ToUpper().Equals(enfermedad.ToUpper())
                           && TE.dias_reposo > 0)
                    select new
                    {
                        TE.id_trabajador_estatus
                    }
                    ).ToList();
                cantidad = Convert.ToInt32(query.Count());
            }

            return cantidad;
        }
        public static int TrabSistemas(int _anho, string sistema, int id_empresa, int id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int cantidad = 0;
            if (id_sucursal > 0)
            {
                var query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.sistema on TE.id_sistema equals E.id_sistemas
                    where (TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal == id_sucursal
                           && TE.fecha_constancia.Value.Year == _anho
                           && E.nombre.ToUpper().Equals(sistema.ToUpper())
                           && TE.dias_reposo > 0)
                    select new
                    {
                        TE.id_trabajador_estatus
                    }
                    ).ToList();
                cantidad = Convert.ToInt32(query.Count());
            }
            if (id_empresa > 0)
            {
                var query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.sistema on TE.id_sistema equals E.id_sistemas
                    where (TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa == id_empresa
                           && TE.fecha_constancia.Value.Year == _anho
                           && E.nombre.ToUpper().Equals(sistema.ToUpper())
                           && TE.dias_reposo > 0)
                    select new
                    {
                        TE.id_trabajador_estatus
                    }
                    ).ToList();
                cantidad = Convert.ToInt32(query.Count());
            }

            return cantidad;
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

        public static int Inspecciones(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from IN in contexto.documento
                where IN.sucursal.id_empresa== _id_empresa &&
                (IN.tipo == "Insp_Ext" || IN.tipo == "Insp_Areas" || IN.tipo == "Insp_MedEsc" || IN.tipo == "Insp_PuesOpe" || 
                IN.tipo == "Insp_PuesAdmin" || IN.tipo == "Insp_Epp" || IN.tipo == "Insp_UsoEpp" || IN.tipo == "Insp_PrimAux" || 
                IN.tipo == "Insp_CronInsp")
                select new
                {
                    IN.tipo
                }
            ).ToList();

            return query.Count();
        }
    }
}
