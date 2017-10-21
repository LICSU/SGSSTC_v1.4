using Capa_Datos.Manager.Trabajador;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Usuario
{
    public class Mgr_Usuario
    {
        //-------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Add_Usuario_Sucursal(String[] valores)
        {
            usuario nuevo = new usuario()
            {
                login = valores[0],
                clave = valores[1],
                id_trabajador = Mgr_Trabajador.Get_Trabajador(),
                id_rol = Convert.ToInt32(valores[2])
            };

            return Capa_Datos.CRUD.Add_Fila(nuevo);
        }

        //----------FUNCIONES DE LLENAR GRID
        public static void Grid_Rol(GridView GridView1, int id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from RO in contexto.rol
                select new
                {
                    RO.id_rol,
                    RO.nombre,
                    RO.id_empresa,
                    empresa = RO.empresa.nombre
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }
        public static void Grid_Usuario(GridView GridView1, int _empresa = 0, string _rol = "", int _sucursal = 0, string _where = "", int miUsuario = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.usuario
                    where CT.id_usuario != miUsuario
                    join RL in contexto.rol on CT.id_rol equals RL.id_rol
                    join EM in contexto.trabajador on CT.id_trabajador equals EM.id_trabajador
                    select new
                    {
                        CT.id_usuario,
                        CT.login,
                        CT.clave,
                        CT.id_rol,
                        rol_id = RL.id_rol,
                        rol = RL.nombre,
                        Empresa = EM.puesto_trabajo.area.sucursal.empresa.nombre,
                        Sucursal = EM.puesto_trabajo.area.sucursal.nombre,
                        empresa_id = EM.puesto_trabajo.area.sucursal.empresa.id_empresa,
                        sucursal_id = EM.puesto_trabajo.area.id_sucursal,
                        trabajador_id = EM.id_trabajador
                    }).ToList();

            if (_empresa != 0) { query = query.Where(x => x.empresa_id == Convert.ToInt32(_empresa)).ToList(); }
            if (_rol != string.Empty) { query = query.Where(x => x.rol_id == Convert.ToInt32(_rol)).ToList(); }
            if (_sucursal != 0) { query = query.Where(x => x.sucursal_id == _sucursal).ToList(); }
            if (_where != string.Empty) { query = query.Where(x => x.login.Contains(_where)).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }
        
        //----------FUNCIONES DE LLENAR LISTAS
        public static void Lista_Rol(DropDownList DropDownList1, int _id_rol = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            DropDownList1.DataValueField = "id_rol";
            DropDownList1.DataTextField = "nombre";

            if (_id_rol == 0)
            {
                var Consulta = (from c in contexto.rol
                                where c.id_rol != 1
                                select new { c.id_rol, c.nombre }).ToList();

                DropDownList1.DataSource = Consulta;
            }
            else
            {
                var Consulta = (from c in contexto.rol
                                where c.id_rol == _id_rol
                                select new { c.id_rol, c.nombre }).ToList();

                DropDownList1.DataSource = Consulta;
            }


            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione ...", ""));
        }
        public static void Lista_Rol_AdmSucursal(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.rol
                            where c.id_rol == 3 || c.id_rol == 5 || c.id_rol == 7 || c.id_rol == 8
                            select new { c.id_rol, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_rol";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione ...", ""));
        }
        public static void Lista_UsuarioByEmpresa(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.usuario
                            where c.trabajador.puesto_trabajo.area.sucursal.id_empresa == _id_empresa
                            select new { c.id_usuario, c.login }).ToList();

            DropDownList1.DataValueField = "id_usuario";
            DropDownList1.DataTextField = "login";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Usuario", ""));
        }
        public static void Lista_UsuarioBySucursal(DropDownList DropDownList1, int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.usuario
                            where c.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal
                            select new { c.id_usuario, c.login }).ToList();

            DropDownList1.DataValueField = "id_usuario";
            DropDownList1.DataTextField = "login";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Usuario", ""));
        }

        //----------FUNCIONES DE CONSULTAR
        public static int Get_Usuario()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new usuario();
            int id = contexto.usuario.Max(x => x.id_usuario);
            return id;
        }
        public static int Get_Roles()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new rol();
            return contexto.rol.Max(x => x.id_rol);
        }
        public static rol Get_Rol(int _idRol)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            rol consulta = new rol();
            consulta = contexto.rol.Where(x => x.id_rol == _idRol).SingleOrDefault();
            return consulta;
        }
        public static int Get_UsuarioTrabajador(int _id_usuario)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from e in contexto.usuario
                    where (e.id_usuario == _id_usuario)
                    select new
                    {
                        e.id_trabajador
                    }
                ).ToList();

            return Convert.ToInt32(query.ElementAt(0).id_trabajador);
        }
        public static bool Get_ExisteUsuario(FormsIdentity _fIdentity)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            bool error = false;

            if (_fIdentity != null)
            {
                string[] aUsuario = _fIdentity.Name.Split('|');
                int _id_usuario = Convert.ToInt32(aUsuario[0]);

                var consulta = new usuario();
                int cantidad = contexto.usuario.Where(x => x.id_usuario == _id_usuario).Count();

                if (cantidad > 0)
                {
                    error = true;
                }
            }

            return error;
        }
        public static string Get_ValidarUsuario(string login, string clave)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            Utilidades objUtilidades = new Utilidades();
            clave = objUtilidades.cifrarCadena(Convert.ToString(clave));

            var resultado = "";
            var consulta = from US in contexto.usuario where (US.login == login && US.clave == clave) select new { _id_rol = US.id_rol };

            foreach (var datos in consulta)
            {
                if (datos._id_rol == 1)
                {
                    var consulta1 = from US in contexto.usuario
                                    where (US.login == login && US.clave == clave)
                                    select new
                                    {
                                        _id_usuario = US.id_usuario,
                                        _id_rol = US.id_rol
                                    };

                    foreach (var datos1 in consulta1)
                    {
                        resultado = string.Concat(datos1._id_usuario, "|", datos1._id_rol);
                    }
                }
                else
                {
                    var consulta1 = from US in contexto.usuario
                                    where (US.login == login && US.clave == clave)
                                    select new
                                    {
                                        _id_usuario = US.id_usuario,
                                        _id_empresa = US.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                                        _id_sucursal = US.trabajador.puesto_trabajo.area.id_sucursal,
                                        _id_rol = US.id_rol
                                    };
                    foreach (var datos1 in consulta1) { resultado = string.Concat(datos1._id_usuario, "|", datos1._id_rol, "|", datos1._id_empresa, "|", datos1._id_sucursal); }
                }
            }
            return resultado;
        }
        public static List<usuario> Get_Usuario(int _id_usuario = 0, int _idSucursal = 0,string email = "", string _login = "", string _clave = "")
        {
            Utilidades objUtilidades = new Utilidades();
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<usuario> consulta = new List<usuario>();

            if (_id_usuario != 0)
            {
                consulta = contexto.usuario.Where(x => x.id_usuario == _id_usuario).ToList();
            }
            else if (_idSucursal != 0)
            {
                consulta = contexto.usuario.Where(x => x.trabajador.puesto_trabajo.area.id_sucursal == _idSucursal && x.id_rol == 3).ToList();
            }
            else if (email != "")
            {
                consulta = contexto.usuario.Where(x => x.trabajador.email.ToLower() == email.ToLower()).ToList();
            }
            else if (_login != "" && _clave != "")
            {
                _clave = objUtilidades.cifrarCadena(Convert.ToString(_clave));
                consulta = contexto.usuario.Where(x => x.login.ToLower() == _login.ToLower() && x.clave == _clave).ToList();
            }


            return consulta;
        }

        //----------FUNCIONES DE SETTER
        public static int Set_IdUsuarioDDl(Model_UsuarioSistema ObjUsuario, DropDownList ddlUsuario)
        {
            int IdUsuario = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdUsuario = Convert.ToInt32(ddlUsuario.SelectedValue);
            }
            else
            {
                IdUsuario = ObjUsuario.Id_usuario;
            }

            return IdUsuario;
        }


    }
}
