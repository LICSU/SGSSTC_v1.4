using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Sucursal
{
    public class Mgr_Sucursal
    {
        //------------FUNCIONES DE CONSULTAR
        public static int Get_Sucursal()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new sucursal();
            int id = contexto.sucursal.Max(x => x.id_sucursal);
            return id;
        }
        public static sucursal Get_Sucursal(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            sucursal consulta = new sucursal();

            consulta = contexto.sucursal.Where(x => x.id_sucursal == _id_sucursal).SingleOrDefault();

            return consulta;
        }
        public static int Get_SucursalByNombre(string nombre, int id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.sucursal.Where(x => x.nombre.ToUpper().Equals(nombre.ToUpper()) && x.id_empresa == id_empresa).ToList();
            if (consulta.Count == 0)
                return 0;
            else
                return 1;
        }
        public static List<sucursal> Get_Sucursal(int _id_sucursal = 0, int _id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<sucursal> consulta = new List<sucursal>();

            if (_id_sucursal != 0)
            {
                consulta = contexto.sucursal.Where(x => x.id_sucursal == _id_sucursal).ToList();
            }
            else if (_id_empresa != 0) { consulta = contexto.sucursal.Where(x => x.id_empresa == _id_empresa).ToList(); }
            else if (_nombre != "") { consulta = contexto.sucursal.Where(x => x.nombre == _nombre).ToList(); }

            return consulta;
        }

        //------------FUNCIONES DE SETTER
        public static int Set_IdSucursalDDl(Model_UsuarioSistema ObjUsuario, DropDownList ddlSucursal)
        {
            int IdSucursal = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else if (ObjUsuario.isAdm_Empresa() || ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdmEmp_DptoSalud())
            {
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else
            {
                IdSucursal = ObjUsuario.Id_sucursal;
            }

            return IdSucursal;
        }
        public static int Set_IdSucursal(Model_UsuarioSistema ObjUsuario, int valor)
        {
            int IdSucursal = 0;

            if (ObjUsuario.isAdm_Sucursal() || ObjUsuario.isAdm_SucSeg() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isResponsable())
            {
                IdSucursal = ObjUsuario.Id_sucursal;
            }
            else
            {
                IdSucursal = valor;
            }

            return IdSucursal;
        }

        //-----------------FUNCIONES DE LLENAR LISTAS
        public static void Lista_Sucursal(DropDownList ddlSucursal, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.sucursal.Where(x => x.id_empresa == _id_empresa)
                            select new { c.id_sucursal, c.nombre }).ToList();

            ddlSucursal.DataValueField = "id_sucursal";
            ddlSucursal.DataTextField = "nombre";
            ddlSucursal.DataSource = Consulta;
            ddlSucursal.DataBind();
            ddlSucursal.Items.Insert(0, new ListItem("Seleccione la Sucursal", ""));
        }
        public static void Lista_SucursalGeneral(DropDownList ddlSucursal, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.sucursal.Where(x => x.id_empresa == _id_empresa)
                            select new { c.id_sucursal, c.nombre }).ToList();

            ddlSucursal.DataValueField = "id_sucursal";
            ddlSucursal.DataTextField = "nombre";
            ddlSucursal.DataSource = Consulta;
            ddlSucursal.DataBind();
            ddlSucursal.Items.Insert(0, new ListItem("Seleccione la Sucursal", ""));
        }

        //-----------------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Add_Sucursal_Empresa(String[] valores)
        {
            string _id_municipio = null;
            if (valores[1] != "0")
                _id_municipio = valores[1];
            sucursal nuevo = new sucursal()
            {
                nombre = valores[0],
                id_municpio = Convert.ToInt32(_id_municipio),
                id_empresa = Convert.ToInt32(valores[2]),
                direccion = valores[3],
                sede_principal = 1,
                representante = valores[4],
                movil = valores[5],
                fijo = valores[6],
                actividad_ppal = Convert.ToInt32(valores[7]),
                actividad_sec = Convert.ToInt32(valores[8]),
                actividad_otra = Convert.ToInt32(valores[9]),
            };

            return CRUD.Add_Fila(nuevo);
        }
        public static bool Add_Sucursal_Empresa_2(String[] valores)
        {
            sucursal nuevo = new sucursal()
            {
                nombre = valores[0],
                id_empresa = Convert.ToInt32(valores[1]),
                direccion = valores[2],
                sede_principal = 1,
                representante = valores[3],
                movil = valores[4],
                fijo = valores[5],
                actividad_ppal = Convert.ToInt32(valores[6]),
                actividad_sec = Convert.ToInt32(valores[7]),
                actividad_otra = Convert.ToInt32(valores[8]),
            };

            return CRUD.Add_Fila(nuevo);
        }
        public static bool Add_Sucursal(String[] valores)
        {
            sucursal nuevo = new sucursal()
            {
                nombre = valores[0],
                id_municpio = Convert.ToInt32(valores[1]),
                id_empresa = Convert.ToInt32(valores[2]),
                direccion = valores[3],
                sede_principal = 0,
                representante = valores[4],
                movil = valores[5],
                fijo = valores[6],
                actividad_ppal = Convert.ToInt32(valores[7]),
                actividad_sec = Convert.ToInt32(valores[8]),
                actividad_otra = Convert.ToInt32(valores[9]),
            };

            return CRUD.Add_Fila(nuevo);
        }
        public static bool Delete_Sucursal(int id_sucursal)
        {
            sucursal tabla = new sucursal();
            return CRUD.Delete_Fila(tabla, id_sucursal);
        }

        //-----------------FUNCIONES DE LLENAR GRID
        public static void Grid_Sucursal(GridView GridView1, int miSucursal, int id_empresa = 0, int id_sucursal = 0, string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                from SC in contexto.sucursal
                where SC.id_sucursal != miSucursal
                select new
                {
                    SC.id_sucursal,
                    SC.nombre,
                    SC.id_empresa,
                    empresa = SC.empresa.nombre,
                    NumTrab = (from TB in contexto.trabajador where TB.puesto_trabajo.area.id_sucursal == SC.id_sucursal select TB.id_trabajador).Count()
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal != 0) { query = query.Where(x => x.id_sucursal == id_sucursal).ToList(); }
            if (nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

    }
}
