using Capa_Datos.Manager.Area;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.PuestoTrabajo
{
    public class Mgr_PuestoTrabajo
    {
        //------------------CRUD
        public static bool Add_PuestoTrabajo_Sucursal(String[] valores)
        {
            puesto_trabajo nuevo = new puesto_trabajo()
            {
                nombre = "Puesto de Trabajo Default " + valores[0],
                descripcion = "Descripcion del Puesto Default",
                id_area = Mgr_Area.Areas()
            };
            return CRUD.Add_Fila(nuevo);
        }
        public static bool Add_PuestoTrabajo(Model_UsuarioSistema ObjUsuario, String[] valores, FileUpload fuAnexo, ListBox ddlEpp)
        {
            string ruta = Utilidades.GuardarImagen(fuAnexo, valores[0] + "PuestoTrabajo", Paginas.Archivos_PuestoTrabajo.Value);

            puesto_trabajo nuevo = new puesto_trabajo()
            {
                nombre = valores[0],
                descripcion = valores[1],
                recurso_humano = valores[2],
                objeto_trabajo = valores[3],
                insumos = valores[4],
                maquinas = valores[5],
                herramientas = valores[6],
                emisiones = valores[7],
                productos = valores[8],
                desechos = valores[9],
                foto = ruta,
                id_area = Convert.ToInt32(valores[10])
            };


            int IdUsuario = ObjUsuario.Id_usuario;
            DateTime fechaActual = DateTime.Now;
            Boolean bError = false;

            if (CRUD.Add_Fila(nuevo))
            {
                if (ddlEpp.SelectedValue != string.Empty)
                {
                    foreach (ListItem li in ddlEpp.Items)
                    {
                        if (li.Selected)
                        {
                            puesto_trabajo_epp nuevopuestoEpp = new puesto_trabajo_epp()
                            {
                                id_puesto_trabajo = Convert.ToInt32(PuestoTrabajo()),
                                id_epp = Convert.ToInt32(li.Value)
                            };
                            bError = CRUD.Add_Fila(nuevopuestoEpp);

                            if (!bError)
                            {
                                return bError;
                            }
                        }
                    }
                }
            }

            return bError;


        }

        //------------GETTER
        public static List<puesto_trabajo_epp> PuestoEpp(int id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<puesto_trabajo_epp>();
            consulta = contexto.puesto_trabajo_epp.Where(x => x.id_puesto_trabajo == id_puesto).ToList();
            return consulta;
        }
        public static int idPuestoTrabajador(int _id_trabajador)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from e in contexto.trabajador
                    where (e.id_trabajador == _id_trabajador)
                    select new
                    {
                        e.id_puesto_trabajo
                    }
                ).ToList();

            return query.ElementAt(0).id_puesto_trabajo;
        }
        public static int PuestoEppValue(int id_puesto, int id_epp)
        {
            int valor = 0;
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from e in contexto.puesto_trabajo_epp
                    where (e.id_puesto_trabajo == id_puesto && e.id_epp == id_epp)
                    select new
                    {
                        e.id_puesto_trabajo_epp
                    }
                ).ToList();

            if (query.Count > 0)
                valor = 1;
            else if (query.Count == 0)
                valor = 0;
            return valor;
        }
        public static int PuestoTrabajo()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new puesto_trabajo();
            int id = contexto.puesto_trabajo.Max(x => x.id_puesto_trabajo);
            return id;
        }
        public static List<puesto_trabajo> PuestoTrabajo(int _id_puesto = 0, int _id_empresa = 0, string tipoArea = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<puesto_trabajo> consulta = new List<puesto_trabajo>();

            if (_id_empresa != 0 && tipoArea != "")
            {
                consulta = contexto.puesto_trabajo.Where(x => x.area.tipo == tipoArea &&
                x.area.sucursal.id_empresa == _id_empresa).ToList();
            }
            else if (_id_puesto != 0)
            {
                consulta = contexto.puesto_trabajo.Where(x => x.id_puesto_trabajo == _id_puesto).ToList();
            }

            return consulta;
        }
        public static List<puesto_trabajo> PuestoTrabajo_Nom_Suc(string _nombre, int _sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<puesto_trabajo> consulta = new List<puesto_trabajo>();

            consulta = contexto.puesto_trabajo.Where(
                x => x.nombre.ToUpper().Equals(_nombre.ToUpper()) &&
                x.area.id_sucursal == _sucursal).ToList();

            return consulta;
        }
        //-----------DropddownList
        public static void PuestoTrabajo(DropDownList DropDownList1, string filtro, int _id = 0, string valor = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            if (filtro == "idArea")
            {
                var Consulta = (
                    from c in contexto.puesto_trabajo.Where(x => x.id_area == _id)
                    select new { c.id_puesto_trabajo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_puesto_trabajo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                DropDownList1.DataBind();
                if (valor != string.Empty)
                {
                    DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
                    DropDownList1.Items.Insert(1, new ListItem("Ninguno", "0"));
                }
                else
                {
                    DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
                }

            }
            else if (filtro == "Sucursal")
            {
                var Consulta = (
                    from c in contexto.puesto_trabajo.Where(x => x.area.id_sucursal == _id)
                    select new { c.id_puesto_trabajo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_puesto_trabajo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                DropDownList1.DataBind();
                if (valor != string.Empty)
                {
                    DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
                    DropDownList1.Items.Insert(1, new ListItem("Ninguno", "0"));
                }
                else
                {
                    DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
                }
            }
            else if (filtro == "Empresa")
            {
                var Consulta = (
                    from c in contexto.puesto_trabajo.Where(x => x.area.sucursal.id_empresa == _id)
                    select new { c.id_puesto_trabajo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_puesto_trabajo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
            }
        }

        //-----------GRID
        public static void PuestoTrabajo(GridView GridView1, int empresa = 0, int sucursal = 0, string area = "0", string num1 = "", string num2 = "", string sWhere = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.puesto_trabajo
                    orderby CT.area.id_sucursal, CT.id_puesto_trabajo
                    select new
                    {
                        CT.id_puesto_trabajo,
                        CT.nombre,
                        CT.descripcion,
                        id_sucursal = CT.area.sucursal.id_sucursal,
                        id_area = CT.id_area,
                        Empresa = CT.area.sucursal.empresa.nombre,
                        id_empresa = CT.area.sucursal.empresa.id_empresa,
                        Area = CT.area.nombre,
                        Num = (from TB in contexto.trabajador
                               where TB.id_puesto_trabajo == CT.id_puesto_trabajo
                               && TB.id_estatus_actual == 1
                               select TB.id_trabajador).Count(),
                        Sucursal = CT.area.sucursal.nombre
                    }).ToList();

            if (empresa != 0) { query = query.Where(x => x.id_empresa == empresa).ToList(); }
            if (sucursal != 0) { query = query.Where(x => x.id_sucursal == sucursal).ToList(); }
            if (area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(area)).ToList(); }
            if (num1 != string.Empty) { query = query.Where(x => x.Num >= Convert.ToInt32(num1) && x.Num < Convert.ToInt32(num2)).ToList(); }
            if (sWhere != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(sWhere.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

    }
}
