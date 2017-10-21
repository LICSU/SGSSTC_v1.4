using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Estatus
{
    public class Mgr_Estatus
    {
        //---------------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Add_Estatus_Empresa(String[] valores)
        {
            List<estatus> ListaEstatus = new List<estatus>();
            Boolean berror = false;
            for (int i = 0; i < ValoresDefault.Nombre_Estatus.Value.Length; i++)
            {
                estatus ObjEstatus = new estatus();
                ObjEstatus.nombre = ValoresDefault.Nombre_Estatus.Value[i];
                ObjEstatus.descripcion = ValoresDefault.Descripcion_Estatus.Value[i];
                ObjEstatus.id_empresa = Convert.ToInt32(valores[0]);

                ListaEstatus.Add(ObjEstatus);

                berror = CRUD.Add_Fila(ObjEstatus);

                if (!berror)
                {
                    i = valores.Length;
                }
            }

            return berror;
        }

        //---------------FUNCIONES DE LLENAR GRID
        public static void Grid_Estatus(GridView GridView1, int _id_sucursal = 0, string _id_area = "0", string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.puesto_trabajo
                    select new
                    {
                        CT.id_puesto_trabajo,
                        CT.nombre,
                        CT.descripcion,
                        CT.area.sucursal.id_sucursal,
                        CT.id_area,
                        Area = CT.area.nombre,
                        Num = (from TB in contexto.trabajador where TB.id_puesto_trabajo == CT.id_puesto_trabajo select TB.id_trabajador).Count(),
                        Sucursal = CT.area.sucursal.nombre
                    }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(_id_area)).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Grid_Estatus(GridView GridView1, int id_empresa = 0, string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.estatus
                    select new
                    {
                        CT.id_empresa,
                        CT.id_estatus,
                        CT.nombre,
                        CT.descripcion,
                        Empresa = CT.empresa.nombre == null ? "GrupoLi" : CT.empresa.nombre
                    }).ToList();

            if (nombre != string.Empty)
            {
                query = query.Where(x => x.nombre.ToLower().Contains(nombre.ToLower())
                || x.descripcion.ToLower().Contains(nombre.ToLower())).ToList();
            }

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa || x.id_empresa == 1).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }

        //---------------FUNCIONES DE LLENAR LISTAS
        public static void List_Estatus_Empresa(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.estatus.Where(x => x.id_empresa == _id_empresa || x.id_empresa == 1)
                            select new { c.id_estatus, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_estatus";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Estatus", ""));
            #endregion
        }

        //---------------FUNCIONES DE CONSULTAR
        public static estatus Get_Estatus(int _idEstatus)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            estatus consulta = new estatus();

            consulta = contexto.estatus.Where(x => x.id_estatus == _idEstatus).SingleOrDefault();

            return consulta;
        }
        
    }
}
