using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class View_PuestoTrabajo : System.Web.UI.Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);
            phEmpresa1.Visible = BoolEmpSuc.Item1;
            phSucursal1.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            int idPuestos = 0;
            idPuestos = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            List<puesto_trabajo> ListaPuestos = new List<puesto_trabajo>();
            ListaPuestos = Getter.PuestoTrabajo(idPuestos, 0, "");

            foreach (var itemPuestos in ListaPuestos)
            {
                txtNombre.Text = itemPuestos.nombre;
                txtDescripcion.Text = itemPuestos.descripcion;

                txtRecursoHumano.Text = itemPuestos.recurso_humano == null ? "Sin Información" : itemPuestos.recurso_humano;
                txtObjetoTrabajo.Text = itemPuestos.objeto_trabajo == null ? "Sin Información" : itemPuestos.objeto_trabajo;
                txtInsumos.Text = itemPuestos.insumos == null ? "Sin Información" : itemPuestos.insumos;
                txtMaquinas.Text = itemPuestos.maquinas == null ? "Sin Información" : itemPuestos.maquinas;
                txtHerramientas.Text = itemPuestos.herramientas == null ? "Sin Información" : itemPuestos.herramientas;
                txtEmisiones.Text = itemPuestos.emisiones == null ? "Sin Información" : itemPuestos.emisiones;
                txtProductos.Text = itemPuestos.productos == null ? "Sin Información" : itemPuestos.productos;
                txtDesechos.Text = itemPuestos.desechos == null ? "Sin Información" : itemPuestos.desechos;

                ImgFoto.ImageUrl = itemPuestos.foto;
                ddlArea.Text = itemPuestos.area.nombre;
                ddlEmpresa.Text = itemPuestos.area.sucursal.empresa.nombre;
                ddlSucursal.Text = itemPuestos.area.sucursal.nombre;

                List<puesto_trabajo_epp> ListaPuestoTrabajo_Epp = new List<puesto_trabajo_epp>();
                ListaPuestoTrabajo_Epp = new List<puesto_trabajo_epp>();
                ListaPuestoTrabajo_Epp = Mgr_PuestoTrabajo.PuestoEpp(idPuestos);
                string items = string.Empty;
                foreach (var li in ListaPuestoTrabajo_Epp)
                {
                    items += " " + li.epp.nombre + ",";
                }
                if (items.Length == 0)
                    txtEquipos.Text = "Ningun equipo de Protección.";
                else
                {
                    items = items.TrimEnd(',');
                    txtEquipos.Text = items + ".";
                }
            }
        }
    }
}