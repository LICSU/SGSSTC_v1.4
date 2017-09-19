using System;
using Capa_Datos;
using System.Web;
using System.Web.UI;
using System.Web.Security;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class create_AutoEvaluacion : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);
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
                Listas.Empresa(ddlEmpresa);
            }
            else if (BoolEmpSuc.Item2)
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            String[] valores =
                {
                string.Empty + IdEmpSuc.Item2,
                PrintFile.GetInputValue(Number1),
                PrintFile.GetRadioValue(radio1),
                PrintFile.GetRadioValue(radio2),
                PrintFile.GetRadioValue(radio3),
                PrintFile.GetInputValue(Number2),
                PrintFile.GetRadioValue(radio4),
                PrintFile.GetRadioValue(radio5),
                PrintFile.GetInputValue(Number3),
                PrintFile.GetRadioValue(radio6),
                PrintFile.GetRadioValue(radio7),
                PrintFile.GetInputValue(Number4),
                PrintFile.GetRadioValue(radio8),
                PrintFile.GetRadioValue(radio9),
                PrintFile.GetInputValue(Number5),
                PrintFile.GetRadioValue(radio10),
                PrintFile.GetRadioValue(radio11),
                PrintFile.GetInputValue(Number6),
                PrintFile.GetRadioValue(radio12),
                PrintFile.GetRadioValue(radio13),
                PrintFile.GetInputValue(Number7),
                PrintFile.GetRadioValue(radio14),
                PrintFile.GetRadioValue(radio15),
                PrintFile.GetInputValue(Number8),
                PrintFile.GetRadioValue(radio16),
                PrintFile.GetRadioValue(radio17),
                PrintFile.GetInputValue(Number9),
                PrintFile.GetRadioValue(radio18),
                PrintFile.GetRadioValue(radio19),
                PrintFile.GetInputValue(Number10),
                PrintFile.GetRadioValue(radio20),
                PrintFile.GetRadioValue(radio21),
                PrintFile.GetInputValue(Number11),
                PrintFile.GetRadioValue(radio22),
                PrintFile.GetRadioValue(radio23),
                PrintFile.GetInputValue(Number12),
                PrintFile.GetRadioValue(radio24),
                PrintFile.GetRadioValue(radio25),
                PrintFile.GetInputValue(Number13),
                PrintFile.GetRadioValue(radio26),
                PrintFile.GetRadioValue(radio27),
                PrintFile.GetInputValue(Number14),
                PrintFile.GetRadioValue(radio28)
            };

            PrintFile.PrintAutoevaluacion(valores, this);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }

    }
}