using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Epp
{
    public class Mgr_Epp
    {
        //---------------crud
        public static bool AddSenalizacion(String[] valores, FileUpload fuImagen)
        {
            string ruta = Utilidades.GuardarImagen(fuImagen, valores[0], Paginas.Archivos_Senalizacion.Value);

            if (!ruta.Contains("ERR-"))
            {
                senalizacion nuevo = new senalizacion()
                {
                    nombre = valores[0],
                    descripcion = valores[1],
                    url_imagen = ruta
                };

                return CRUD.Add_Fila(nuevo);
            }
            else
            {
                return false;
            }
        }

        //---------------getter
        public static List<senalizacion> Senalizacion(int _id_senal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<senalizacion> consulta = contexto.senalizacion.Where(x => x.id_senalizacion == _id_senal).ToList();
            return consulta;
        }
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


        //---------------listas
        public static void TipoEpp(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.tipo_epp
                select new { c.id_tipo_epp, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_tipo_epp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Tipo de EPP", ""));
        }
        public static void Epp(ListBox DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (from c in contexto.epp select new { c.id_epp, c.nombre }).ToList();
            DropDownList1.DataValueField = "id_epp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
        }
        public static void Epp(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (from c in contexto.epp select new { c.id_epp, c.nombre }).ToList();
            DropDownList1.DataValueField = "id_epp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
        }
        public static void EppPuesto(DropDownList DropDownList1, string _id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int idPuesto = Convert.ToInt32(_id_puesto);
            var Consulta = (from c in contexto.puesto_trabajo_epp.Where(x => x.id_puesto_trabajo == idPuesto)
                            select new { c.id_epp, c.epp.nombre }).ToList();
            DropDownList1.DataValueField = "id_epp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
        }

        //---------------grid
        public static void entrega_epp(GridView GridView1, string _id_empresa = "", string _id_sucursal = "", string _nombre = "", int _id_trabajador = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.tipo == "EntregaEpp"
                select new
                {
                    I.id_documento,
                    I.id_tabla,
                    I.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa,
                    I.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                    sucursal = I.trabajador.puesto_trabajo.area.sucursal.nombre,
                    empresa = I.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                    I.ruta,
                    I.nombre,
                    trabajador = I.trabajador.primer_nombre + " " + I.trabajador.primer_apellido,
                    id_trabajador = I.trabajador.id_trabajador,
                    I.fecha_subida
                }).ToList();

            if (_id_sucursal != "") { query = query.Where(x => x.id_sucursal == Convert.ToInt32(_id_sucursal)).ToList(); }
            if (_id_empresa != "") { query = query.Where(x => x.id_empresa == Convert.ToInt32(_id_empresa)).ToList(); }
            if (_nombre != "") { query = query.Where(x => x.nombre.ToUpper().Contains(_nombre.ToUpper())).ToList(); }
            if (_id_trabajador != 0) { query = query.Where(x => x.id_trabajador == _id_trabajador).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void TipoEpp(GridView GridView1, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CT in contexto.tipo_epp
                select new
                {
                    CT.nombre,
                    CT.id_tipo_epp,
                    CT.nombre_senal,
                    CT.url_senal
                }).ToList();

            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Epp(GridView GridView1, string _id_tipo = "", string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from _EPP in contexto.epp
                orderby _EPP.nombre
                select new
                {
                    _EPP.id_epp,
                    nombre = _EPP.nombre.ToUpper(),
                    _EPP.id_tipo_epp,
                    tipo = _EPP.tipo_epp.nombre,
                    _EPP.marca_modelo,
                    _EPP.uso,
                    _EPP.url_imagen
                }).ToList();

            if (_id_tipo != string.Empty) { query = query.Where(x => x.id_tipo_epp == Convert.ToInt32(_id_tipo)).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Senalizacion(GridView GridView1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            GridView1.DataSource = contexto.senalizacion.ToList();
            GridView1.DataBind();
        }
    }
}
