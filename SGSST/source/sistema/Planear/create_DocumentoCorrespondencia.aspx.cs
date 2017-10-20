using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSST.source.sistema.Planear
{
    public partial class create_DocumentoCorrespondencia : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

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
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Listas.PerfilCargo(ddlCargo, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.PerfilCargo(ddlCargo, ObjUsuario.Id_empresa);
            }
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                Listas.PerfilCargo(ddlCargo, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["sucursal"] = "0";
                ViewState["cargo"] = "0";
            }
            else
            {
                ViewState["empresa"] = "0";
            }
        }

        protected void ddlCargo_SelectedIndexChanged(object sender, EventArgs e)
        {
            phInformacion.Visible = true;
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            string Empresa = string.Empty, Sucursal = string.Empty;
            if (BoolEmpSuc.Item1)
            {
                Empresa = ddlEmpresa.SelectedItem.Text;
                Sucursal = ddlSucursal.SelectedItem.Text;
            }
            else
            {
                List<sucursal> lista = Mgr_Sucursal.Sucursal(0, ObjUsuario.Id_empresa);
                foreach (var item in lista) {
                    Empresa = item.empresa.nombre;
                    Sucursal = item.nombre;
                }
            }
            String[] valores = {
                 string.Empty + IdEmpSuc.Item2,
                 "Empresa: " + Empresa,
                 "Sucursal: " + Sucursal,
                 "Cargo: " + ddlCargo.SelectedItem.Text,
                 txtObservaciones.Text
            };

            String[] encabezados1 = {
                "Sexo",
                "Edad",
                "Estatura",
                "Contextura",
                "Audición",
                "Visión"
            };

            String[] valores1 ={
                "Masculino",
                "Mínima",
                 "< 1.60 m",
                 "Delgado",
                 "Optima",
                 "Cercana/ Lejana",
                "Femenino",
                "Máxima",
                "> 1.60 m",
                "Fornido",
                "No relevante",
                "Cromática",
                "No relevante",   
                "No relevante",
                "No relevante",
                "No relevante",
                "",                
                "Uso de lentes"
            };

            String[] tabla1 ={
                PrintFile.GetRadioValue(rdb1),
                PrintFile.GetRadioValue(rdb2),
                PrintFile.GetRadioValue(rdb3),
                PrintFile.GetRadioValue(rdb4),
                PrintFile.GetRadioValue(rdb5),
                PrintFile.GetRadioValue(rdb6),
                PrintFile.GetRadioValue(rdb7),
                PrintFile.GetRadioValue(rdb8),
                PrintFile.GetRadioValue(rdb9),
                PrintFile.GetRadioValue(rdb10),
                PrintFile.GetRadioValue(rdb11),
                PrintFile.GetRadioValue(rdb12),
                PrintFile.GetRadioValue(rdb13),
                PrintFile.GetRadioValue(rdb14),               
                PrintFile.GetRadioValue(rdb15),
                PrintFile.GetRadioValue(rdb16),
                 "",
                PrintFile.GetRadioValue(rdb17),
            };

            String[] encabezados2 = {
                "Funcionalidad de Miembros",
                "Sup.",
                "Inf.",
                "Compatibilidad del Cargo",
                "SI",
                "NO"
            };

            String[] tabla2 = {
                "Integridad de miembros indispensable",
                PrintFile.GetRadioValue(rdb18),
                PrintFile.GetRadioValue(rdb21),
                "Compatible con lesiones de columna",
                 PrintFile.GetRadioValue(rdb24),
                PrintFile.GetRadioValue(rdb27),
                "Compatible con disminución leve",
                PrintFile.GetRadioValue(rdb19),
                PrintFile.GetRadioValue(rdb22),
                "Compatible con limitaciones sensoriales",
                 PrintFile.GetRadioValue(rdb25),
                PrintFile.GetRadioValue(rdb28),
                "Compatible con disminución marcada",
                PrintFile.GetRadioValue(rdb20),
                PrintFile.GetRadioValue(rdb23),
                "Compatible con trastornos neurológicos",
                 PrintFile.GetRadioValue(rdb26),
                PrintFile.GetRadioValue(rdb29),
            };

            String[] tabla3 = {
                "Bipedestación",
                PrintFile.GetRadioValue(rdb30),
                PrintFile.GetRadioValue(rdb37),
                "Movimiento mano-brazo",
                PrintFile.GetRadioValue(rdb44),
                PrintFile.GetRadioValue(rdb51),
                "Sedestación",
                PrintFile.GetRadioValue(rdb31),
                PrintFile.GetRadioValue(rdb38),
                "Posición estática de las piernas",
                PrintFile.GetRadioValue(rdb45),
                PrintFile.GetRadioValue(rdb52),
                "Arrodillarse/agacharse/levantarse",
                PrintFile.GetRadioValue(rdb32),
                PrintFile.GetRadioValue(rdb39),
                "Posición estática de los brazos",
                PrintFile.GetRadioValue(rdb46),
                PrintFile.GetRadioValue(rdb53),
                "Alzar/empujar/halar",
                PrintFile.GetRadioValue(rdb33),
                PrintFile.GetRadioValue(rdb40),
                "Precisión con dedos",
                PrintFile.GetRadioValue(rdb47),
                PrintFile.GetRadioValue(rdb54),
                "Posiciones estáticas",
                PrintFile.GetRadioValue(rdb34),
                PrintFile.GetRadioValue(rdb41),
                "Coordinación oído-mano/pie",
                PrintFile.GetRadioValue(rdb48),
                PrintFile.GetRadioValue(rdb55),
                "Movimientos repetitivos",
                PrintFile.GetRadioValue(rdb35),
                PrintFile.GetRadioValue(rdb42),
                "Movimiento de extremidades",
                PrintFile.GetRadioValue(rdb49),
                PrintFile.GetRadioValue(rdb56),
                "Caminar/correr",
                PrintFile.GetRadioValue(rdb36),
                PrintFile.GetRadioValue(rdb43),
                "Coordinación vista-mano/pie",
                PrintFile.GetRadioValue(rdb50),
                PrintFile.GetRadioValue(rdb57),
            };

            String[] tabla4 = {
                "Actividades repetitivas",
                PrintFile.GetRadioValue(rdb58),
                PrintFile.GetRadioValue(rdb61),
                "Sobre equipos/máquinas",
                PrintFile.GetRadioValue(rdb64),
                PrintFile.GetRadioValue(rdb71),
                "Actividades cíclicas",
                PrintFile.GetRadioValue(rdb59),
                PrintFile.GetRadioValue(rdb62),
                "Sobre materiales/productos",
                PrintFile.GetRadioValue(rdb65),
                PrintFile.GetRadioValue(rdb72),
                "Actividades variadas",
                PrintFile.GetRadioValue(rdb60),
                PrintFile.GetRadioValue(rdb63),
                "Sobre personas",
                PrintFile.GetRadioValue(rdb66),
                PrintFile.GetRadioValue(rdb73),
                " ",
                " ",
                " ",
                "Trabajo en equipo",
                PrintFile.GetRadioValue(rdb67),
                PrintFile.GetRadioValue(rdb74),
                " ",
                " ",
                " ",
                "Esfuerzo mental",
                PrintFile.GetRadioValue(rdb68),
                PrintFile.GetRadioValue(rdb75),
                " ",
                " ",
                " ",
                "Esfuerzo físico",
                PrintFile.GetRadioValue(rdb69),
                PrintFile.GetRadioValue(rdb76),
                " ",
                " ",
                " ",
                "Trabajo en equipo",
                PrintFile.GetRadioValue(rdb70),
                PrintFile.GetRadioValue(rdb77),
            };

            String[] tabla5 = {
                "Ausencia de control sobre proceso",
                PrintFile.GetRadioValue(rdb78),
                "Dispersión de actividades",
                PrintFile.GetRadioValue(rdb79),
                "Condiciones físicas del ambiente",
                PrintFile.GetRadioValue(rdb80),

                "Situaciones imprevistas",
                PrintFile.GetRadioValue(rdb81),
                "Aislamiento del sitio de trabajo",
                PrintFile.GetRadioValue(rdb82),
                "Trabajo monótono",
                PrintFile.GetRadioValue(rdb83),
                "Trabajo bajo presión",
                PrintFile.GetRadioValue(rdb84),
                "Cambios de turno de trabajo",
                PrintFile.GetRadioValue(rdb85),
                "Atención al público",
                PrintFile.GetRadioValue(rdb86),
                "Fatiga",
                PrintFile.GetRadioValue(rdb87),
            };

            String[] tabla6 = {
                "Gases",
                "Baja",
                "Ambiente Seco",
                "Fuerte",
                "Intensa",
                "Continuo",
                "Nieblas",
                "Media",
                "Ambiente Medio",
                "Media",
                "Mediana",
                "Variable",
                "Polvo",
                "Elevada",
                "Ambiente Húmedo"  ,   
                "Escasa",
                "Escasa",
                "Intermitente",
                "Vapores",
                " ",
                " ",
                " ",
                "Contrastes",
                "Impactos",
                "Humos",
                " ",
                " ",
                " ",
                " ",
                " ",
            };

            String[] valores6 = {
                PrintFile.GetRadioValue(rdb88),
                PrintFile.GetRadioValue(rdb89),
                PrintFile.GetRadioValue(rdb90),
                PrintFile.GetRadioValue(rdb91),
                PrintFile.GetRadioValue(rdb92),
                PrintFile.GetRadioValue(rdb93),
                PrintFile.GetRadioValue(rdb94),
                PrintFile.GetRadioValue(rdb95),
                PrintFile.GetRadioValue(rdb96),
                PrintFile.GetRadioValue(rdb97),
                PrintFile.GetRadioValue(rdb98),
                PrintFile.GetRadioValue(rdb99),
                PrintFile.GetRadioValue(rdb100),
                PrintFile.GetRadioValue(rdb101),
                PrintFile.GetRadioValue(rdb102),
                PrintFile.GetRadioValue(rdb103),
                PrintFile.GetRadioValue(rdb104),
                PrintFile.GetRadioValue(rdb105),
                PrintFile.GetRadioValue(rdb106),
                " ",
                " ",
                " ",
                PrintFile.GetRadioValue(rdb107),
                PrintFile.GetRadioValue(rdb108),
                PrintFile.GetRadioValue(rdb109),
                " ",
                " ",
                " ",
                " ",
                " ",
            };

            String[] tabla7 = {
                "Mano-brazo ",
                "Ionizantes",
                "Bajo techo",
                "Microorganismos",
                "Exposición a solventes",
                "Cuerpo entero",
                "No Ionizantes",
                "En alturas",
                "Virus",
                "Contacto con productos cáusticos",
                " ",
                " ",
                "Áreas confinadas",
                "Bacterias",
                "Contacto con productos corrosivos",
                " ",
                " ",
                "Expuesto al sol",
                " ",
                "Exposición a solventes"
            };

            String[] valores7 = {
                PrintFile.GetRadioValue(rdb110),
                PrintFile.GetRadioValue(rdb111),
                PrintFile.GetRadioValue(rdb112),
                PrintFile.GetRadioValue(rdb113),
                PrintFile.GetRadioValue(rdb114),
                PrintFile.GetRadioValue(rdb115),
                PrintFile.GetRadioValue(rdb116),
                PrintFile.GetRadioValue(rdb117),
                PrintFile.GetRadioValue(rdb118),
                PrintFile.GetRadioValue(rdb119),
                " ",
                " ",
                PrintFile.GetRadioValue(rdb120),
                PrintFile.GetRadioValue(rdb121),
                PrintFile.GetRadioValue(rdb122),
                " ",
                " ",
                PrintFile.GetRadioValue(rdb123),
                " ",
                PrintFile.GetRadioValue(rdb124),
            };

            PrintFile.PrintDocCorrespondencia(valores, encabezados1, valores1, tabla1, encabezados2, 
                                              tabla2, tabla3, tabla4, tabla5, tabla6, tabla7, valores6, valores7, this);
        }
    }
}