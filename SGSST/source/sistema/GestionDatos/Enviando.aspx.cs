using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using SGSST.ServiceReference1;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Enviando : Page
    {
        private static Model_UsuarioSistema ObjUsuario;
        private static Utilidades objUtilidades = new Utilidades();
        private static string act1, act2, act3, IdEmpresa, id_sucursal, nombreSucursal;

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../MenuPrincipal/index.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            if (!IsPostBack)
            {
                id_sucursal = Convert.ToString(objUtilidades.descifrarCadena(Request.QueryString["id"]));
                nombreSucursal = objUtilidades.descifrarCadena2(Request.QueryString["suc"]);
                act1 = Convert.ToString(objUtilidades.descifrarCadena(Request.QueryString["act1"]));
                act2 = Convert.ToString(objUtilidades.descifrarCadena(Request.QueryString["act2"]));
                act3 = Convert.ToString(objUtilidades.descifrarCadena(Request.QueryString["act3"]));
                IdEmpresa = Convert.ToString(objUtilidades.descifrarCadena(Request.QueryString["emp"]));
                
            }
        }

        protected void llamarwebserviceAsync1(object sender, EventArgs e)
        {
            
            var cliente = new Service1Client();
            cliente.InnerChannel.OperationTimeout = new TimeSpan(0, 20, 0);

            var time = new TimeSpan(0, 20, 0);
            cliente.Endpoint.Binding.CloseTimeout = time;
            cliente.Endpoint.Binding.OpenTimeout = time;
            cliente.Endpoint.Binding.ReceiveTimeout = time;
            cliente.Endpoint.Binding.SendTimeout = time;

            cliente.add_Riesgos_DefaultCompleted += msjcompletado;
            cliente.add_Riesgos_DefaultAsync(act1, act2, act3, id_sucursal,ObjUsuario);
        }

        private void msjcompletado(object sender, add_Riesgos_DefaultCompletedEventArgs e)
        {
            Button1.Visible = false;
        }

    }
}