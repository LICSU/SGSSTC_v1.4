using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Empresa
{
    public class Mgr_Empresa
    {
        //-----------------------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Delete_Empresa(int IdEmpresa)
        {
            empresa tabla = new empresa();
            return CRUD.Delete_Fila(tabla, IdEmpresa);
        }
        public static bool Add_EmpresaSimple(String[] valores)
        {

            empresa nuevo = new empresa()
            {
                nombre = valores[0],
                CodEmpresa = valores[1],
                nit = valores[2],
                email = valores[3],
                representante = valores[4],
                movil = valores[5],
                fijo = valores[6],
                logo_url = ""
            };

            return CRUD.Add_Fila(nuevo);

        }
        public static bool Add_Empresa(String[] valores, FileUpload fuLogoEmpresa)
        {
            string ruta = Utilidades.GuardarImagen(fuLogoEmpresa, valores[0], Paginas.Archivos_LogosEmpresas.Value);

            if (!ruta.Contains("ERR-"))
            {
                empresa nuevo = new empresa()
                {
                    nombre = valores[0],
                    CodEmpresa = valores[1],
                    nit = valores[2],
                    email = valores[3],
                    representante = valores[4],
                    movil = valores[5],
                    fijo = valores[6],
                    logo_url = ruta,
                    id_arl = Convert.ToInt32(valores[7]),
                    jornada = Convert.ToInt32(valores[8])
                };

                return CRUD.Add_Fila(nuevo);
            }
            else
            {
                return false;
            }
        }

        //------------------------FUNCIONES DE LLENAR LISTAS
        public static void Lista_Empresa(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.empresa
                            where c.id_empresa != 1
                            select new { c.id_empresa, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_empresa";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Empresa", ""));
        }

        //-----------------------FUNCIONES DE CONSULTAR
        public static int Get_Max_Empresas()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new empresa();
            return contexto.empresa.Max(x => x.id_empresa);
        }
        public static List<empresa> Get_EmpresaEmail(int id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            //List<empresa> consulta = from US in contexto.empresa where (US.id_empresa == id_empresa) select new { correo = US.email, empresa = US.nombre };
            List<empresa> consulta = contexto.empresa.Where(x => x.id_empresa == id_empresa).ToList();
            return consulta;
        }
        public static List<empresa> Get_Empresa(int _id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<empresa> consulta = new List<empresa>();

            if (_id_empresa != 0) { consulta = contexto.empresa.Where(x => x.id_empresa == _id_empresa).ToList(); }
            else if (_nombre != string.Empty) { consulta = contexto.empresa.Where(x => x.nombre == _nombre).ToList(); }

            return consulta;
        }
        public static Tuple<bool, bool> Get_Empresa_Sucursal(Model_UsuarioSistema ObjUsuario)
        {
            bool Sucursal = true;
            bool Empresa = true;

            if (ObjUsuario.isAdm_Grupoli())
            {
                Sucursal = true;
                Empresa = true;
            }
            else if (ObjUsuario.isAdm_Empresa() || ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdmEmp_DptoSalud())
            {
                Sucursal = true;
                Empresa = false;
            }
            else
            {
                Sucursal = false;
                Empresa = false;
            }

            return Tuple.Create(Empresa, Sucursal);
        }
        public static Tuple<int, int> Get_IdEmpresa_IdSucursal(Model_UsuarioSistema ObjUsuario, DropDownList ddlEmpresa, DropDownList ddlSucursal)
        {
            int IdSucursal = 0;
            int IdEmpresa = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdEmpresa = Convert.ToInt32(ddlEmpresa.SelectedValue);
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else if (ObjUsuario.isAdm_Empresa() || ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdmEmp_DptoSalud())
            {
                IdEmpresa = ObjUsuario.Id_empresa;
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else
            {
                IdEmpresa = ObjUsuario.Id_empresa;
                IdSucursal = ObjUsuario.Id_sucursal;
            }

            return Tuple.Create(IdEmpresa, IdSucursal);
        }

        //-----------------------FUNCIONES SET
        public static int Set_IdEmpresa(Model_UsuarioSistema ObjUsuario, int valor)
        {
            int IdEmpresa = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdEmpresa = valor;
            }
            else
            {
                IdEmpresa = ObjUsuario.Id_empresa;
            }

            return IdEmpresa;
        }
        public static int Set_IdEmpresaDDl(Model_UsuarioSistema ObjUsuario, DropDownList ddlEmpresa)
        {
            int IdEmpresa = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdEmpresa = Convert.ToInt32(ddlEmpresa.SelectedValue);
            }
            else
            {
                IdEmpresa = ObjUsuario.Id_empresa;
            }

            return IdEmpresa;
        }

        //-----------------------FUNCIONES DE LLENAR GRID
        public static void Grid_Empresa(GridView GridView1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            GridView1.DataSource = contexto.empresa.ToList();
            GridView1.DataBind();
        }
    }
}
