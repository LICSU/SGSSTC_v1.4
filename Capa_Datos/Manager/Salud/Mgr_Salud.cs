using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Salud
{
    public class Mgr_Salud
    {
        //------------FUNCIONES DE CONSULTAR
        public static int Get_HistoriaClinica()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int id = 0;
            var count = (from hco in contexto.historia_clinica_ocupacional
                         select hco).Count();

            if (Convert.ToInt32(count) > 0)
            {
                var consulta = new historia_clinica_ocupacional();
                id = contexto.historia_clinica_ocupacional.Max(x => x.id_his_cli_ocu);
            }
            return id;
        }
        public static List<enfermedadLaboral> Get_MatrizRiesgosByEnfermedadLaboral(int _id_EnfLab)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<enfermedadLaboral> consulta = new List<enfermedadLaboral>();
            consulta = contexto.enfermedadLaboral.Where(
                x => x.id_enfermedadLaboral == _id_EnfLab).ToList();
            return consulta;
        }
        public static int Get_EvaluacionesClinicas(int _anho, int id_empresa = 0, int id_sucursal = 0)
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
        public static int Get_Enfermedades(int _anho, string tipo, int id_empresa = 0, int id_sucursal = 0)
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
        public static int Get_EvaluacionesByTipo(int _anho, string tipo, int id_empresa = 0, int id_sucursal = 0)
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
        public static List<Model_Enfermedad_Sistema> Get_CantSistemas(int _anho, int id_empresa = 0, int id_sucursal = 0)
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
        public static List<Model_Enfermedad_Sistema> Get_CantDiagnosticos(int _anho, int id_empresa = 0, int id_sucursal = 0)
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

        //----------FUNCIONES DE LLENAR LISTAS
        public static void Lista_Sistema(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.sistema
                            select new { c.id_sistemas, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_sistemas";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Sistema", ""));
            #endregion
        }
        public static void Lista_TipoExamen(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.tipo_examen
                            select new { c.id_tipo_exa, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_tipo_exa";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Tipo de Examen", ""));
            #endregion
        }
        public static void Lista_EnfermedadComun(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.enfermedad.Where(x => x.tipo == 0)
                            select new { c.id_enfermedad, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_enfermedad";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Enfermedad Común", ""));
            #endregion
        }
        public static void Lista_EnfermedadLaboral(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.enfermedad.Where(x => x.tipo == 1)
                            select new { c.id_enfermedad, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_enfermedad";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Enfermedad Laboral", ""));
            #endregion
        }

        //-----------FUNCIONES DE LLENAR GRID
        public static void Grid_HC_Trabajador(GridView GridView1, string _id_trabajador = "", int _id_empresa = 0, string _id_tipo = "", string _fecha_inicio = "", string _fecha_fin = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from HC in contexto.historia_clinica_ocupacional
                    select new
                    {
                        HC.id_his_cli_ocu,
                        HC.fecha,
                        HC.id_trabajador,
                        Empresa = HC.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                        id_empresa = HC.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa,
                        HC.diagnostico,
                        HC.recomendaciones,
                        HC.doc_esc_medico,
                        HC.doc_esc_paciente,
                        HC.id_tipo_exa,
                        trabajador = HC.trabajador.primer_nombre + " " + HC.trabajador.primer_apellido,
                        tipo_exa = HC.tipo_examen.nombre,
                        id_tipo = HC.tipo_examen.id_tipo_exa,
                        fecha_exa = HC.fecha
                    }).ToList();

            if (_id_trabajador != string.Empty) { query = query.Where(x => x.id_trabajador == Convert.ToInt32(_id_trabajador)).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_tipo != string.Empty) { query = query.Where(x => x.id_tipo == Convert.ToInt32(_id_tipo)).ToList(); }
            if (_fecha_inicio != string.Empty) { query = query.Where(x => x.fecha_exa >= Convert.ToDateTime(_fecha_inicio)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_exa <= Convert.ToDateTime(_fecha_fin)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Grid_HC_HistoriaClinica(GridView GridView1, string tabla, int _id_empresa = 0, string _id_tipo_exa = "", string _fecha_ini = "", string _fecha_fin = "", string _trabajador = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from HC in contexto.historia_clinica_ocupacional
                    select new
                    {
                        Empresa = HC.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa,
                        HC.diagnostico,
                        HC.recomendaciones,
                        HC.doc_esc_medico,
                        HC.doc_esc_paciente,
                        HC.id_tipo_exa,
                        trabajador = HC.trabajador.primer_nombre + " " + HC.trabajador.primer_apellido,
                        tipo_exa = HC.tipo_examen.nombre,
                        fecha_exa = HC.fecha
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.Empresa == _id_empresa).ToList(); }
            if (_id_tipo_exa != string.Empty) { query = query.Where(x => x.id_tipo_exa == Convert.ToInt32(_id_tipo_exa)).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha_exa >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_exa <= Convert.ToDateTime(_fecha_fin)).ToList(); }
            if (_trabajador != string.Empty) { query = query.Where(x => x.trabajador.Contains(_trabajador)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        
    }
}