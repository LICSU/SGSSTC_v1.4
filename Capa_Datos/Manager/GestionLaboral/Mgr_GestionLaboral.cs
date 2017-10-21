using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.GestionLaboral
{
    public class Mgr_GestionLaboral
    {
        //------------FUNCIONES DE CONSULTAR
        public static List<gestion_laboral> Get_GestionLaboral(int _id_ges_lab)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<gestion_laboral> consulta = new List<gestion_laboral>();
            consulta = contexto.gestion_laboral.Where(x => x.id_ges_lab == _id_ges_lab).ToList();
            return consulta;
        }
        public static int GetId_GestionLaboral
        {
            get
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                var consulta = new gestion_laboral();
                int id = contexto.gestion_laboral.Max(x => x.id_ges_lab);
                return id;
            }
        }
        public static int Get_GestionLaboralByFecha(DateTime fechaInicial, DateTime fechaFinal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (from GL in contexto.gestion_laboral
                         where GL.fecha >= fechaInicial && GL.fecha <= fechaFinal && GL.tipo_gestion == 2
                         select GL).Count();
            return query;
        }
        public static List<gestion_laboral> Get_GestionLaboralByCapacitacion(DateTime fechaInicial, DateTime fechaFinal, int _id_empresa = 0, int _id_sucursal = 0)
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

        //------------FUNCIONES DE LLENAR GRID
        public static void Grid_GestionLaboral(GridView GridView1, int _id_empresa = 0, int _id_sucursal = 0, int _tipo_gestion = 0, string _fecha_ini = "", string _fecha_fin = "", string _descripcion = "", int _id_usuario = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from GL in contexto.gestion_laboral
                    orderby GL.fecha
                    select new
                    {
                        GL.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        empresa = GL.usuario.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                        GL.id_ges_lab,
                        GL.fecha,
                        GL.descripcion,
                        soporte = GL.soporte == "" ? "Sin Comunicado" : GL.soporte,
                        GL.id_usuario,
                        GL.usuario.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                        Responsable = (from US in contexto.usuario where US.id_usuario == GL.id_usuario select US.login).FirstOrDefault(),
                        tipo = GL.tipo_gestion
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_usuario != 0) { query = query.Where(x => x.id_usuario == _id_usuario).ToList(); }
            if (_tipo_gestion != 0) { query = query.Where(x => x.tipo == _tipo_gestion).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fecha_fin)).ToList(); }
            if (_descripcion != string.Empty) { query = query.Where(x => x.descripcion.ToLower().Contains(_descripcion.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

    }
}
