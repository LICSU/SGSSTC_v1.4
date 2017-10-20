using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Alarma
{
    public class Mgr_Alarma
    {
        //------------getter

        public static List<alarma> Alarma(int _id_alarma)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<alarma>();
            consulta = contexto.alarma.Where(x => x.id_alarmas == _id_alarma).ToList();
            return consulta;
        }

        //------------grid
        public static void Alarma(GridView GridView1, string _prioridad = "", string _id_categorias = "", string _fechaIni = "", string _fechaFin = "", string _descripcion = "", int _id_empresa = 0, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AL in contexto.alarma
                    orderby AL.fecha
                    select new
                    {
                        AL.id_alarmas,
                        AL.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        AL.usuario.trabajador.puesto_trabajo.area.id_sucursal,
                        AL.id_categorias,
                        AL.prioridad,
                        AL.id_usuario,
                        AL.descripcion,
                        AL.fecha,
                        categoria_id = AL.categoria.id_categorias,
                        categoria = AL.categoria.nombre
                    }).ToList();

            if (_prioridad != string.Empty) { query = query.Where(x => x.prioridad == _prioridad).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_categorias != string.Empty) { query = query.Where(x => x.id_categorias == Convert.ToInt32(_id_categorias)).ToList(); }
            if (_fechaIni != string.Empty) { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fechaIni)).ToList(); }
            if (_fechaFin != string.Empty) { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fechaFin)).ToList(); }
            if (_descripcion != string.Empty) { query = query.Where(x => x.descripcion.ToLower().Contains(_descripcion.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

    }
}
