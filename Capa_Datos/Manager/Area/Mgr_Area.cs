using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Area
{
    public class Mgr_Area
    {
        //-------------FUNCIONES DE CONSULTAR
        public static int Get_Area()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new area();
            int id = contexto.area.Max(x => x.id_area);
            return id;
        }
        public static List<extintor> Get_Extintor(int _idExtintor)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<extintor> consulta = new List<extintor>();
            consulta = contexto.extintor.Where(x => x.id_extintor == _idExtintor).ToList();

            return consulta;
        }
        public static List<usuario> Get_AreaByUsuario(int _id_usuario)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.usuario.Where(x => x.id_usuario == _id_usuario).ToList();
            return consulta;
        }
        public static int Get_AreaByNombre(string nombre, int id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.area.Where(x => x.nombre.ToUpper().Equals(nombre.ToUpper()) && x.id_sucursal == id_sucursal).ToList();
            if (consulta.Count == 0)
                return 0;
            else
                return 1;
        }
        public static List<area> Get_Area(int _id_empresa = 0, int _id_area = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<area>();

            if (_id_empresa != 0) { consulta = contexto.area.Where(x => x.sucursal.id_empresa == _id_empresa).ToList(); }
            else if (_id_area != 0) { consulta = contexto.area.Where(x => x.id_area == _id_area).ToList(); }
            else if (_nombre != string.Empty) { consulta = contexto.area.Where(x => x.nombre == _nombre).ToList(); }

            return consulta;
        }

        //---------------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Add_Area(CheckBox chkAreaPadre, String[] valores)
        {
            int id_area_padre = 0;

            if (!chkAreaPadre.Checked || (valores[0] == string.Empty))
            {
                valores[1] = "1";
            }
            else
            {
                id_area_padre = Convert.ToInt32(valores[0]);

                List<area> ListaArea = new List<area>();
                ListaArea = Get_Area(0, Convert.ToInt32(valores[0]), "");

                foreach (var item in ListaArea)
                {
                    valores[1] = item.nivel.ToString();
                }

                if (valores[1] == "1") { valores[1] = "2"; }
                else if (valores[1] == "2") { valores[1] = "3"; }
                else if (valores[1] == "3") { valores[1] = "4"; }
            }

            area nuevo = new area()
            {
                nombre = valores[2],
                id_sucursal = Convert.ToInt32(valores[3]),
                id_area_padre = id_area_padre,
                nivel = Convert.ToInt32(valores[1]),
                tipo = valores[4]
            };

            return CRUD.Add_Fila(nuevo);

        }
        public static bool Add_Area_Sucursal(String[] valores)
        {
            area nuevo = new area()
            {
                nombre = valores[0],
                id_sucursal = Convert.ToInt32(valores[1]),
                id_area_padre = 0,
                nivel = 1,
                tipo = "Administrativa"
            };

            return CRUD.Add_Fila(nuevo);
        }

        //---------------FUNCIONES DE LLENAR LISTAS
        public static void List_Area_Sucursal(DropDownList DropDownList1, int _id_sucursal, string valor = "", string tipo = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.area.Where(x => x.sucursal.id_sucursal == _id_sucursal)
                select new { c.id_area, c.nombre, c.tipo }).ToList();
            if (tipo == "Operativa")
            {
                Consulta = Consulta.Where(x => x.tipo == "Operativa").ToList();
            }

            if (tipo == "Administrativa")
            {
                Consulta = Consulta.Where(x => x.tipo == "Administrativa").ToList();
            }

            DropDownList1.DataValueField = "id_area";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();

            if (valor != string.Empty)
            {
                DropDownList1.Items.Insert(0, new ListItem("Seleccione el Area", ""));
                DropDownList1.Items.Insert(1, new ListItem("Ninguna", "0"));
            }
            else
            {
                DropDownList1.Items.Insert(0, new ListItem("Seleccione el Area", ""));
            }

        }
        public static void List_Extintor_Area(DropDownList DropDownList1, int _id_area)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.extintor.Where(x => x.area.id_area == _id_area)
                            select new { c.id_extintor, c.serial_extintor }).ToList();

            DropDownList1.DataValueField = "id_extintor";
            DropDownList1.DataTextField = "serial_extintor";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Extintor", ""));
            #endregion
        }

        //----------------FUNCIONES DE LLENAR GRID
        public static void Grid_Area_General(GridView GridView1, int _id_empresa = 0, int _id_sucursal = 0, string _nivel = "", string _NumTrab_ini = "", string _NumTrab_fin = "", string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AR in contexto.area
                    orderby AR.id_sucursal, AR.id_area
                    select new
                    {
                        AR.id_area,
                        AR.id_area_padre,
                        Nombre_Area = AR.nombre,
                        Area_Padre = AR.id_area_padre == 0 ? "Ninguno" : (from AR1 in contexto.area where AR1.id_area == AR.id_area_padre select AR1.nombre).FirstOrDefault(),
                        nivel1 = AR.nivel == 1 ? "" + AR.nivel : "---",
                        nivel2 = AR.nivel == 2 ? "" + AR.nivel : "---",
                        nivel3 = AR.nivel == 3 ? "" + AR.nivel : "---",
                        nivel4 = AR.nivel == 4 ? "" + AR.nivel : "---",
                        AR.nivel,
                        AR.id_sucursal,
                        AR.sucursal.empresa.id_empresa,
                        empresa = AR.sucursal.empresa.nombre,
                        empresa_id = AR.sucursal.empresa.id_empresa,
                        sucursal = (from EM in contexto.sucursal where EM.id_sucursal == AR.id_sucursal select EM.nombre).FirstOrDefault(),
                        NumTrab = (from TB in contexto.trabajador where TB.puesto_trabajo.id_area == AR.id_area select TB.id_trabajador).Count()
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_nivel != string.Empty) { query = query.Where(x => x.nivel == Convert.ToInt32(_nivel)).ToList(); }
            if (_NumTrab_ini != string.Empty) { query = query.Where(x => x.NumTrab >= Convert.ToInt32(_NumTrab_ini) && x.NumTrab < Convert.ToInt32(_NumTrab_fin)).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.Nombre_Area.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Grid_Extintores(GridView GridView1, int id_empresa = 0, int id_sucursal = 0, string id_area = "0", string buscar = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
            from E in contexto.extintor
            select new
            {
                E.id_extintor,
                E.serial_extintor,
                E.fecha_proxima_recarga,
                E.fecha_ultima_recarga,
                area = E.area.nombre,
                E.area.sucursal.empresa.id_empresa,
                E.area.sucursal.id_sucursal,
                E.id_area,
                E.nombre_empresa
            }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal != 0) { query = query.Where(x => x.id_sucursal == id_sucursal).ToList(); }
            if (id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(id_area)).ToList(); }
            if (buscar != string.Empty) { query = query.Where(x => x.serial_extintor.ToLower().Contains(buscar.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();

        }
        
    }
}
