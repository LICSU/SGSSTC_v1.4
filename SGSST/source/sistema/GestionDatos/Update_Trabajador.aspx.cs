using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Update_Trabajador : System.Web.UI.Page
    {
        private Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            ViewState["TrabajadorID"] = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            phEmpresa1.Visible = BoolEmpSuc.Item1;
            phSucursal1.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                Listas.Ccf(ddlCcf);
                CargarUsuario();
            }
        }

        private void CargarUsuario()
        {
            int idTrabajador = Convert.ToInt32(ViewState["TrabajadorID"]);
            List<trabajador> ListaTrabajador = new List<trabajador>();
            ListaTrabajador = Getter.Trabajador(idTrabajador);

            foreach (var itemTrabajador in ListaTrabajador)
            {
                Listas.Empresa(ddlEmpresas);
                ddlEmpresas.SelectedValue = Convert.ToString(itemTrabajador.puesto_trabajo.area.sucursal.id_empresa);

                txtCedula.Text = itemTrabajador.cedula;
                txtNombre1.Text = itemTrabajador.primer_nombre;
                txtNombre2.Text = itemTrabajador.segundo_nombre;
                txtApellido1.Text = itemTrabajador.primer_apellido;
                txtApellido2.Text = itemTrabajador.segundo_apellido;
                txtEmail.Text = itemTrabajador.email;
                txtFechadeNacimiento.Text = itemTrabajador.fecha_nacimiento.Value.ToString("yyyy-MM-dd");
                ddlEdoCivil.SelectedValue = itemTrabajador.edo_civil;
                ddlSexo.SelectedValue = itemTrabajador.sexo;
                txtTelCasa.Text = itemTrabajador.telefono_casa;
                txtTelCelular.Text = itemTrabajador.telefono_movil;
                txtDireccion.Text = itemTrabajador.direccion;
                ddlDiscapacitado.SelectedValue = itemTrabajador.es_discapacitado;
                txtDiscapacidad.Text = itemTrabajador.desc_discapacidad; txtFechaIngreso.Text = itemTrabajador.fecha_ingreso.Value.ToString("yyyy-MM-dd");
                ddlTipoVinculacion.SelectedValue = itemTrabajador.tipo_vinculacion;
                ddlTipoHorario.SelectedValue = itemTrabajador.tipo_horario;
                ddlManodominante.SelectedValue = Convert.ToString(itemTrabajador.mano_dominante);
                txtSalario.Text = Convert.ToString(itemTrabajador.salario);

                Listas.Horario_Empresa(ddlHorario, Convert.ToInt32(itemTrabajador.puesto_trabajo.area.sucursal.id_empresa));
                ddlHorario.SelectedValue = Convert.ToString(itemTrabajador.id_horario);

                Listas.Estatus_Empresa(ddlEstatus, Convert.ToInt32(itemTrabajador.puesto_trabajo.area.sucursal.id_empresa));
                ddlEstatus.SelectedValue = Convert.ToString(itemTrabajador.id_estatus_actual);

                Listas.Sucursal(ddlSucursal, Convert.ToInt32(itemTrabajador.puesto_trabajo.area.sucursal.id_empresa));
                ddlSucursal.SelectedValue = Convert.ToString(itemTrabajador.puesto_trabajo.area.id_sucursal);

                Listas.PuestoTrabajo(ddlPuestoTrabajo, "Sucursal", itemTrabajador.puesto_trabajo.area.id_sucursal);
                ddlPuestoTrabajo.SelectedValue = Convert.ToString(itemTrabajador.id_puesto_trabajo);

                Listas.Reg_Dpto_Mcpio(ddlRegion, "Region");
                ddlRegion.SelectedValue = string.Empty + itemTrabajador.municipio.departamento.Region.id_region;

                Listas.Reg_Dpto_Mcpio(ddlDepartamento, "RegionDpto", itemTrabajador.municipio.departamento.Region.id_region);
                ddlDepartamento.SelectedValue = string.Empty + itemTrabajador.municipio.id_departamento;

                Listas.Reg_Dpto_Mcpio(ddlMunicipio, "McpioDpto", itemTrabajador.municipio.id_departamento);
                ddlMunicipio.SelectedValue = string.Empty + itemTrabajador.id_municipio;

                Listas.Ccf(ddlCcf);
                ddlCcf.SelectedValue = string.Empty + itemTrabajador.id_ccf;

                Listas.PerfilCargo(ddlCargo);
                //ddlCargo.SelectedValue = Convert.ToString(itemTrabajador.perfil_cargo.id_cno);

                ImgFoto.ImageUrl = itemTrabajador.foto;
                ImgFoto.Width = 200; ImgFoto.Height = 200;
            }
        }
        #endregion

        #region Acciones
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DateTime fechaActual = DateTime.Now;
            string NombreArchivo = string.Empty;
            string ruta = string.Empty;
            if (fuFoto.HasFile)
            {
                ruta = Utilidades.GuardarImagen(fuFoto, txtCedula.Text + "_foto", Paginas.Archivos_Foto_Perfil.Value);
            }

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idTrabajador = Convert.ToInt32(ViewState["TrabajadorID"]);
            trabajador Edit = contexto.trabajador.SingleOrDefault(b => b.id_trabajador == idTrabajador);

            if (Edit != null)
            {
                Edit.cedula = txtCedula.Text;
                Edit.primer_nombre = txtNombre1.Text;
                Edit.segundo_nombre = txtNombre2.Text;
                Edit.primer_apellido = txtApellido1.Text;
                Edit.segundo_apellido = txtApellido2.Text;
                Edit.email = txtEmail.Text;
                Edit.fecha_nacimiento = Convert.ToDateTime(txtFechadeNacimiento.Text);
                Edit.edo_civil = ddlEdoCivil.SelectedValue;
                Edit.sexo = ddlSexo.SelectedValue;
                if (ruta.Length > 0)
                {
                    Edit.foto = ruta;
                }
                Edit.telefono_casa = txtTelCasa.Text;
                Edit.telefono_movil = txtTelCelular.Text;
                Edit.fecha_registro = Convert.ToDateTime(fechaActual.ToString("dd-MM-yyy"));
                Edit.id_ccf = Convert.ToInt32(ddlCcf.SelectedValue);
                Edit.direccion = txtDireccion.Text;
                Edit.id_municipio = Convert.ToInt32(ddlMunicipio.SelectedValue);
                Edit.id_puesto_trabajo = Convert.ToInt32(ddlPuestoTrabajo.SelectedValue);
                Edit.es_discapacitado = ddlDiscapacitado.SelectedValue;
                Edit.desc_discapacidad = txtDiscapacidad.Text;
                Edit.id_horario = Convert.ToInt32(ddlHorario.SelectedValue);
                Edit.id_estatus_actual = Convert.ToInt32(ddlEstatus.SelectedValue);
                Edit.fecha_ingreso = Convert.ToDateTime(txtFechaIngreso.Text);
                Edit.tipo_vinculacion = ddlTipoVinculacion.SelectedValue;
                Edit.tipo_horario = ddlTipoHorario.SelectedValue;
                Edit.id_perfil_cargo = Convert.ToInt32(ddlCargo.SelectedValue);
                Edit.salario = Convert.ToInt32(txtSalario.Text);
                Edit.mano_dominante = ddlManodominante.SelectedValue;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);


            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtNombre1);
        }
        #endregion

        #region eventos
        protected void ddlEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int _id = 0;
            if (ddlEmpresas.SelectedValue != string.Empty)
                _id = Convert.ToInt32(ddlEmpresas.SelectedValue);
            Listas.Sucursal(ddlSucursal, _id);
            Listas.Estatus_Empresa(ddlEstatus, _id);
            Listas.Horario_Empresa(ddlHorario, _id);
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRegion.SelectedValue != string.Empty)
            {
                Listas.Reg_Dpto_Mcpio(ddlDepartamento, "RegionDpto", Convert.ToInt32(ddlRegion.SelectedValue));
            }
        }

        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartamento.SelectedValue != string.Empty)
            {
                Listas.Reg_Dpto_Mcpio(ddlMunicipio, "McpioDpto", Convert.ToInt32(ddlDepartamento.SelectedValue));
            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
            }
        }
        #endregion
    }
}