using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Acc_Inc
{
    public class Mgr_Acc_Inc
    {
        //-------------FUNCIONES DE LLENAR GRID
        public static void Grid_Accidente(GridView GridView1, int _id_empresa = 0, int _id_sucursal = 0, string _id_area = "0", string _search = "", string _fecha_ini = "", string _fecha_fin = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AC in contexto.at_it_el_pa
                    where AC.tipo_evento == "1"
                    select new
                    {
                        AC.id_at_it_el_pa,
                        AC.id_area,
                        fecha_acc = AC.fecha_accidente,
                        AC.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        Afectado = AC.trabajador.primer_nombre + " " + AC.trabajador.primer_apellido,
                        area = AC.area.nombre != "0" ? "Ninguna" : " " + AC.area.nombre,
                        id_sucursal = AC.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                        consulta = AC.num_consultas != null ? "Con Consulta" : "Sin Consulta",
                        AC.reporte_accidente,
                        AC.documento_comunicado,
                        posee = AC.investigacion_ac_in.Count != 0 ? "SI" : "NO"
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(_id_area)).ToList(); }
            if (_search != string.Empty) { query = query.Where(x => x.Afectado == _search).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha_acc >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_acc <= Convert.ToDateTime(_fecha_fin)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Grid_Incidente(GridView GridView1, int _id_empresa = 0, int _id_sucursal = 0, string _id_area = "0", string _search = "", string _fecha_ini = "", string _fecha_fin = "")
        {

            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AC in contexto.at_it_el_pa
                    where AC.tipo_evento == "2"
                    select new
                    {
                        AC.id_at_it_el_pa,
                        AC.id_area,
                        fecha_acc = AC.fecha_accidente,
                        AC.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        Afectado = AC.trabajador.primer_nombre + " " + AC.trabajador.primer_apellido,
                        area = AC.area.nombre != "0" ? "Ninguna" : " " + AC.area.nombre,
                        id_sucursal = AC.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                        consulta = AC.num_consultas != null ? "Con Consulta" : "Sin Consulta",
                        AC.reporte_accidente,
                        AC.documento_comunicado,
                        posee = AC.investigacion_ac_in.Count != 0 ? "SI" : "NO"
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(_id_area)).ToList(); }
            if (_search != string.Empty) { query = query.Where(x => x.Afectado == _search).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha_acc >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_acc <= Convert.ToDateTime(_fecha_fin)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        //-------------FUNCIONES DE CONSULTAR
        public static int Get_Accidente()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new Respuesta();
            int id = contexto.at_it_el_pa.Max(x => x.id_at_it_el_pa);
            return id;
        }
        public static int Get_Accidente(int _anho, int _id_empresa = 0, int _id_sucursal = 0)
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
        public static List<at_it_el_pa> Get_Accidente(int _id_accidente)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<at_it_el_pa>();
            consulta = contexto.at_it_el_pa.Where(x => x.id_at_it_el_pa == _id_accidente).ToList();
            return consulta;
        }
        public static List<investigacion_ac_in> Get_Investigacion_Accidente(int _id_accidente)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<investigacion_ac_in> consulta = new List<investigacion_ac_in>();
            consulta = contexto.investigacion_ac_in.Where(x => x.id_at_it_el_pa == _id_accidente).ToList();
            return consulta;
        }
        public static List<at_it_el_pa> Get_Accidente_Empresa_Reportes(int _id_empresa, DateTime fechainicio, DateTime fechafin)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<at_it_el_pa>();
            consulta = contexto.at_it_el_pa.Where(x =>
                x.trabajador.puesto_trabajo.area.sucursal.id_empresa == _id_empresa &&
                x.fecha_accidente >= fechainicio && x.fecha_accidente <= fechafin).ToList();
            return consulta;
        }
    }
}
