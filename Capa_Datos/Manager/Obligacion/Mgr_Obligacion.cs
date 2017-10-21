using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Obligacion
{
    public class Mgr_Obligacion
    {
        //----------FUNCIONES DE CONSULTAR
        public static List<obligacion> Get_Obligacion(int _id_obligacion)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<obligacion> consulta = new List<obligacion>();
            consulta = contexto.obligacion.Where(x => x.id_obligacion == _id_obligacion).ToList();
            return consulta;
        }

        //----------FUNCIONES DE LLENAR LISTAS
        public static void Lista_Frecuencia(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.frecuencia_control
                            select new { c.id_frec_con, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_frec_con";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la frecuencia", ""));
        }

        //----------FUNCIONES DE LLENAR GRID
        public static void Grid_Obligaciones(GridView GridView1, int _id_empresa = 0, int _id_responsable = 0, int _id_categoria = 0, string _prioridad = "",string _estatus = "", string _fecha_ini = "", string _fecha_fin = "", string _descripcion = "", int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                    from OB in contexto.obligacion
                    select new
                    {
                        OB.acciones,
                        id_estatus = OB.estatus_obl,
                        id_frecuencia = OB.id_frecuencia_con,
                        OB.prioridad,
                        id_categoria = OB.id_categorias,
                        OB.usuario.trabajador.puesto_trabajo.area.id_sucursal,
                        OB.id_obligacion,
                        OB.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        OB.id_responsable,
                        empresa = OB.usuario.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                        OB.descripcion,
                        OB.fecha_entrega,
                        responsable = OB.usuario.login,
                        estatus = OB.estatus_obl,
                        categoria = OB.categoria.nombre
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_responsable != 0) { query = query.Where(x => x.id_responsable == Convert.ToInt32(_id_responsable)).ToList(); }
            if (_id_categoria != 0) { query = query.Where(x => x.id_categoria == Convert.ToInt32(_id_categoria)).ToList(); }
            if (_prioridad != string.Empty) { query = query.Where(x => x.prioridad == _prioridad).ToList(); }
            if (_estatus != string.Empty) { query = query.Where(x => x.id_estatus == _estatus).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha_entrega >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_entrega <= Convert.ToDateTime(_fecha_fin)).ToList(); }
            if (_descripcion != string.Empty) { query = query.Where(x => x.descripcion.ToLower().Contains(_descripcion.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        
    }
}
