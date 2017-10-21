using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_EstructuraDisergonomicos : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            }
            else
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            String[] valores = {
                string.Empty + IdSucursal,
                txtMedidas.Text,
                txtObservaciones.Text
            };

            String[] tabla1 = {
                "Codos por encima del hombro",
                txts1.Text,
                txtt1.Text,
                "Los dos brazos bajos ",
                txts2.Text,
                txtt2.Text,
                "Un brazo bajo y el otro elevado",
                txts3.Text,
                txtt3.Text,
                "Los dos brazos elevados",
                txts4.Text,
                txtt4.Text,
                "Las manos por encima de la cabeza ",
                txts5.Text,
                txtt5.Text,
                "Espalda inclinada hacia adelante más de 30 grados ",
                txts6.Text,
                txtt6.Text,
                "Espalda derecha",
                txts7.Text,
                txtt7.Text,
                "Espalda doblada",
                txts8.Text,
                txtt8.Text,
                "Espalda con giro",
                txts9.Text,
                txtt9.Text,
                "Espalda inclinada hacia adelante más de 30 grados ",
                txts10.Text,
                txtt10.Text,
                "Espalda girada o lateralizada más de 30 grados",
                txts11.Text,
                txtt11.Text,
                "Cuello doblado / girado más de 30 grados ",
                txts12.Text,
                txtt12.Text,
                "Sedestación prolongada",
                txts13.Text,
                txtt13.Text,
                "Bipedestación prolongada",
                txts14.Text,
                txtt14.Text,
                "De pie con una pierna flexionada:",
                txts15.Text,
                txtt15.Text,
                "En cuclillas",
                txts16.Text,
                txtt16.Text,
                "Andando",
                txts17.Text,
                txtt17.Text,
                "Movimiento de región lumbar repetidos con carga y esfuerzo",
                txts18.Text,
                txtt18.Text,
                "Desviación cubital de la muñeca",
                txts19.Text,
                txtt19.Text,
                "Movimientos repetitivos",
                txts20.Text,
                txtt20.Text,
                "Hiperextensión",
                txts21.Text,
                txtt21.Text,
                "Levantamiento de carga",
                txts22.Text,
                txtt22.Text,
                "Empuje de carga",
                txts23.Text,
                txtt23.Text,
                "Arrastre de carga",
                txts24.Text,
                txtt24.Text,
            };

            PrintFile.PrintEstructuraDisergonomica(valores, tabla1,  this);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
    }
}