using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Usuario : Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0, IdSucursalEsp = 0;
        private static int IdTrabajador = 0, IdTrabajadorEsp = 0;
        private static int IdPuesto = 0, IdPuestoEsp = 0;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;
            phSucursalEdit.Visible = BoolEmpSuc.Item2;
            phSucursal.Visible = BoolEmpSuc.Item2;
            phRol.Visible = BoolEmpSuc.Item2;

            if (ObjUsuario.isAdm_Sucursal())
            {
                phAgregar.Visible = true;
            }
            if (!IsPostBack)
            {
                LlenarGridView();
                CargarListas();
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Usuario(GridView1, IdEmpresa, string.Empty + ViewState["rol"], IdSucursal, string.Empty + ViewState["sWhere"],
                ObjUsuario.Id_usuario);
        }
        private void CargarListas()
        {
            Listas.Empresa(ddlEmpresa);
            Listas.Empresa(ddlEmpresaAdd);
            Listas.Empresa(ddlEmpresaEdit);
            Listas.Rol(ddlRol1);
            Listas.Rol(ddlRolAdd);
            Listas.Rol(ddlRolEdit);

            if (!BoolEmpSuc.Item1)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ObjUsuario.Id_empresa));
                Listas.Sucursal(ddlSucursalAdd, Convert.ToInt32(ObjUsuario.Id_empresa));
                Listas.Sucursal(ddlSucursalEdit, Convert.ToInt32(ObjUsuario.Id_empresa));
            }

            if (!BoolEmpSuc.Item2)
            {
                IdSucursal = Convert.ToInt32(ObjUsuario.Id_sucursal);
                Listas.Rol_AdmSucursal(ddlRolAdd);
                Listas.Rol_AdmSucursal(ddlRolEdit);
                Listas.Rol(ddlRol1);
            }

        }
        #endregion

        #region acciones
        protected void AgregarRegistroModal(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#txtClave').hidePassword(true);");
            sb.Append("$('#txtClaveConf').hidePassword(true);");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "claveAdd", sb.ToString(), false);

            Modal.registrarModal("addModal", "AddModalScript", this);
            
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            bool validacion = ValidarContraseña(txtClave.Text, txtClaveConf.Text, txtLogin.Text);
            if (validacion)
            {
                string clave = objUtilidades.cifrarCadena(Convert.ToString(txtClave.Text));

                usuario nuevo = new usuario()
                {
                    login = txtLogin.Text,
                    clave = clave,
                    id_trabajador = IdTrabajador,
                    id_rol = Convert.ToInt32(ddlRolAdd.SelectedValue)
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                List<trabajador> trab = Getter.Trabajador(Convert.ToInt32(IdTrabajador));
                string destino = string.Empty;
                string empresa = string.Empty;
                foreach (var _trabajador in trab)
                {
                    destino = _trabajador.email;
                    empresa = _trabajador.puesto_trabajo.area.sucursal.empresa.nombre;
                }

                if (destino.Length > 0)
                {
                    clave = objUtilidades.descifrarCadena2(clave);
                    if (Utilidades.EmailValido(destino))
                        Utilidades.registroUsuario(destino, empresa, txtTrabajador.Text, txtLogin.Text, clave);
                }
                Modal.CerrarModal("addModal", "AddModalScript", this);
                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
                LlenarGridView();
                CargarListas();
            }


        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            string ResUsuario = Getter.ValidarUsuario(string.Empty + ViewState["txtLogin"], txtClaveActual.Text);

            if (ResUsuario != string.Empty)
            {
                bool validacion = ValidarContraseña(txtClaveEdit.Text, txtClaveEditConf.Text, txtLoginEdit.Text);
                if (validacion)
                {
                    GrupoLiEntities contexto = new GrupoLiEntities();
                    int idUsuario = Convert.ToInt32(hdfUsuarioID.Value);
                    usuario Edit = contexto.usuario.SingleOrDefault(b => b.id_usuario == idUsuario);
                    string clave = objUtilidades.cifrarCadena(Convert.ToString(txtClaveEdit.Text));
                    if (Edit != null)
                    {
                        Edit.login = txtLoginEdit.Text;
                        Edit.clave = clave;
                        Edit.id_trabajador = Convert.ToInt32(IdTrabajadorEsp);
                        Edit.id_rol = Convert.ToInt32(ddlRolEdit.SelectedValue);
                    }
                    ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

                }
                Modal.CerrarModal("editModal", "EditModalScript", this);
                Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

                LlenarGridView();
                CargarListas();
            }
            else
            {
                Modal.MostrarMsjModal("Contraseña Actual es incorrecta", "ERR", this);
            }


        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            usuario tabla = new usuario();
            if (ObjUsuario.Id_usuario != Convert.ToInt32(hdfUsuarioIDDel.Value))
            {
                ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfUsuarioIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
                Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
                LlenarGridView();
            }
            else
            {
                Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
                Modal.MostrarMsjModal("No puede eliminar su propio usuario.", "ERR", this);
            }
        }

        protected bool ValidarContraseña(string clave1, string clave2, string usuario)
        {
            bool bErrorValidacion = true;

            if (usuario.Contains(" "))
            {
                Modal.MostrarMsjModal("El nombre de usuario no debe contener espacios en blanco", "ERR", this);
                bErrorValidacion = false;
            }

            if (clave1 != clave2)
            {
                Modal.MostrarMsjModal("Las contraseñas deben ser iguales", "ERR", this);
                bErrorValidacion = false;
            }

            bool ClaveValidada = Regex.IsMatch(clave1, "^([a-zA-Z0-9]{4,16})$");

            if (!ClaveValidada)
            {
                Modal.MostrarMsjModal("La Contraseña solo debe contener Letras Minúsculas, Mayúsculas y Números, debe contener de 4 a 16 caracteres", "ERR", this);
                bErrorValidacion = false;
            }

            if (clave1 == clave2)
            {
                List<usuario> ListaUsuario = new List<usuario>();
                ListaUsuario = Getter.Usuario(0, 0, "", usuario, clave1);
                if (ListaUsuario.Count > 0)
                {
                    Modal.MostrarMsjModal("Usuario y clave ya Existen!", "ERR", this);
                    bErrorValidacion = false;
                }
            }
            return bErrorValidacion;
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfUsuarioID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);


                List<usuario> ListaUsuarios = new List<usuario>();
                ListaUsuarios = Getter.Usuario(Convert.ToInt32(hdfUsuarioID.Value));

                foreach (var itemUsuarios in ListaUsuarios)
                {
                    ViewState["txtLogin"] = string.Empty + itemUsuarios.login;
                    txtLoginEdit.Text = itemUsuarios.login;
                    ddlRolEdit.SelectedValue = Convert.ToString(itemUsuarios.id_rol);
                    ddlEmpresaEdit.SelectedValue = Convert.ToString(itemUsuarios.trabajador.puesto_trabajo.area.sucursal.id_empresa);
                    string claveA = objUtilidades.descifrarCadena2(itemUsuarios.clave);


                    Listas.Sucursal(ddlSucursalEdit, Convert.ToInt32(ddlEmpresaEdit.SelectedValue));
                    ddlSucursalEdit.SelectedValue = Convert.ToString(itemUsuarios.trabajador.puesto_trabajo.area.id_sucursal);

                    IdSucursalEsp = Convert.ToInt32(ddlSucursalEdit.SelectedValue);
                    IdTrabajadorEsp = Convert.ToInt32(itemUsuarios.id_trabajador);
                    txtTrabajadorEsp.Text = itemUsuarios.trabajador.primer_nombre + ' ' + itemUsuarios.trabajador.primer_apellido + ' ' + itemUsuarios.trabajador.cedula;
                }

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#txtClaveActual').hidePassword(true);");
                sb.Append("$('#txtClaveEdit').hidePassword(true);");
                sb.Append("$('#txtClaveEditConf').hidePassword(true);");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "claveActual", sb.ToString(), false);

                Modal.registrarModal("editModal", "EditModalScript", this);
                
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {

                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfUsuarioIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }

        #endregion

        #region Listados
        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
                Listas.Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
        }
        protected void ddlSucursalAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalAdd.SelectedValue != string.Empty)
                IdSucursal = Convert.ToInt32(ddlSucursalAdd.SelectedValue);
        }

        protected void ddlEmpresaEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaEdit.SelectedValue != string.Empty)
                Listas.Sucursal(ddlSucursalEdit, Convert.ToInt32(ddlEmpresaEdit.SelectedValue));
        }
        protected void ddlSucursalEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalEdit.SelectedValue != string.Empty)
            {
                txtTrabajadorEsp.Text = "";
                IdSucursalEsp = Convert.ToInt32(ddlSucursalEdit.SelectedValue);
            }
                
        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.SucursalGeneral(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlRol_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRol1.SelectedValue != string.Empty)
            {
                ViewState["rol"] = ddlRol1.SelectedValue;
            }
            else
            {
                ViewState["rol"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtBuscar.Text != string.Empty)
            {
                ViewState["sWhere"] = txtBuscar.Text;
            }
            else
            {
                ViewState["sWhere"] = string.Empty;
            }
            LlenarGridView();

        }
        #endregion

        #region AutoCompletar
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal, ref IdTrabajador, IdPuesto);
            return listTrabajadores;
        }

        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajadorEsp(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursalEsp, ref IdTrabajadorEsp, IdPuestoEsp);
            return listTrabajadores;
        }
        #endregion
    }
}