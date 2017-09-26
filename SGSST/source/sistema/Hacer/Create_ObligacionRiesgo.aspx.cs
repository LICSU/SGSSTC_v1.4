using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_ObligacionRiesgo : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private int idRiesgo;
        private string medida;
        private int IdSucursal = 0;
        private int IdEmpresa;
        private  Utilidades objUtilidades = new Utilidades();


        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            idRiesgo = objUtilidades.descifrarCadena(Request.QueryString["id"]);
            IdSucursal = objUtilidades.descifrarCadena(Request.QueryString["suc"]);

            List<sucursal> ListaSucursal = new List<sucursal>();
            ListaSucursal = Getter.Sucursal(Convert.ToInt32(IdSucursal),0,"");
            foreach (var item in ListaSucursal)
            {
                IdEmpresa = Convert.ToInt32(item.id_empresa);
            }

            medida = objUtilidades.descifrarCadena2(Request.QueryString["med"]);

            lbAnho.Text = DateTime.Now.Year.ToString();

            if (!IsPostBack)
            {
                CargarDatos();
                CargarListas();
            }
        }

        private void CargarDatos()
        {
            List<identificacion_peligro> ListaRiesgos = new List<identificacion_peligro>();
            ListaRiesgos = Getter.IdentificacionPeligro(Convert.ToInt32(idRiesgo));

            foreach (var itemRiesgos in ListaRiesgos)
            {
                foreach (var itemIdeFactor in itemRiesgos.factor_identificacion)
                {
                    lbTipoRiesgo.Text = itemIdeFactor.factor_riesgo.tipo_riesgo.nombre;
                    lbFactorRiesgo.Text = itemIdeFactor.factor_riesgo.nombre;
                }

                foreach (var itemIdePuestos in itemRiesgos.identificacion_puesto)
                {
                    foreach (var itemEvaRiesgo in itemIdePuestos.evaluacion_riesgo)
                    {
                        if (medida == "Ambiente") { lbMedida.Text = itemEvaRiesgo.control_medio; }
                        else if (medida == "Fuente") { lbMedida.Text = itemEvaRiesgo.control_fuente; }
                        else if (medida == "Trabajador") { lbMedida.Text = itemEvaRiesgo.control_individuo; }
                    }
                }

            }


        }

        private void CargarListas()
        {
            Listas.Frecuencia(ddlFrecuencia);
            Listas.Categorias(ddlCategoria, IdEmpresa);
            Listas.Usuario_Sucursal(ddlResponsable, Convert.ToInt32(IdSucursal));
            Listas.Actividades_Sucursal(ddlActividad, Convert.ToInt32(IdSucursal), DateTime.Now.Year);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            DateTime fechaActual = DateTime.Now;
            obligacion nuevo = new obligacion()
            {
                id_medida_sucursal = 0,
                fecha_creacion = fechaActual,
                fecha_entrega = Convert.ToDateTime(txtFechaFin.Text),
                id_responsable = Convert.ToInt32(ddlResponsable.SelectedValue),
                id_categorias = Convert.ToInt32(ddlCategoria.SelectedValue),
                prioridad = ddlPrioridad.SelectedValue,
                id_frecuencia_con = Convert.ToInt32(ddlFrecuencia.SelectedValue),
                descripcion = txtDesc.Text,
                acciones = txtAcciones.Text,
                estatus_obl = ddlEstatus.SelectedValue,
                id_identificacion_peligro = Convert.ToInt32(idRiesgo),
                id_actividad = Convert.ToInt32(ddlActividad.SelectedValue)
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtFechaFin);

            int IdUsuario = Convert.ToInt32(ddlResponsable.SelectedValue);

            if (ObjUsuario.Error)
            {
                alarma nuevoalarma = new alarma()
                {
                    descripcion = "Entrega de la obligacion  de la fecha: " + txtFechaFin.Text,
                    fecha = fechaActual,
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevoalarma);
            }
        }

        protected void Volver(object sender, EventArgs e)
        {
            string id_Riesgos = objUtilidades.cifrarCadena(idRiesgo.ToString());
            string Id_Sucursal = objUtilidades.cifrarCadena(IdSucursal.ToString());
            Response.Redirect(Paginas.Update_MedidasMatrizRiesgos.Value + "?id=" + id_Riesgos + "&suc=" + Id_Sucursal);
        }

    }
}