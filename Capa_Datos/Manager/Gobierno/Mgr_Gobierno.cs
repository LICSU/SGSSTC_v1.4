using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Gobierno
{
    public class Mgr_Gobierno
    {
        //------------FUNCIONES DE CONSULTAR
        public static void Get_EPS(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.eps
                            select new { c.id_eps, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_eps";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el EPS", ""));
            #endregion
        }
        public static void Get_AFP(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.afp
                            select new { c.id_afp, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_afp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Fondo", ""));
            #endregion
        }
        public static void Get_ARL(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.arl
                            select new { c.id_arl, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_arl";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Arl", ""));
        }
        public static void Get_CCF(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.ccf
                            select new { c.id_ccf, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_ccf";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el CCF", ""));
        }
        public static void Get_CNO(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.cno
                            select new { c.id_cno, nombre = c.codigo + " - " + c.ocupacion, c.ocupacion }).OrderBy(x => x.ocupacion.Trim()).ToList();

            DropDownList1.DataValueField = "id_cno";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Cargo", ""));
        }
        public static void Get_IPS(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.ips
                            where c.estado == "HABILITADA"
                            select new { c.id_ips, c.beneficiario }).ToList();

            DropDownList1.DataValueField = "id_ips";
            DropDownList1.DataTextField = "beneficiario";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Ips", ""));
            #endregion
        }
        public static void Get_Reg_Dpto_Mcpio(DropDownList DropDownList1, string tabla, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            if (tabla == "Region")
            {
                #region codigo
                var Consulta = (from c in contexto.Region
                                select new { c.id_region, c.nombre }).ToList();
                if (id > 0)
                    Consulta = Consulta.Where(x => x.id_region == id).ToList();
                DropDownList1.DataValueField = "id_region";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                #endregion
            }
            else if (tabla == "RegionDpto")
            {
                #region codigo
                var Consulta = (from c in contexto.departamento
                                where c.id_region == id
                                select new { c.id_departamento, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_departamento";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                #endregion
            }
            else if (tabla == "McpioDpto")
            {
                #region codigo
                var Consulta = (from c in contexto.municipio
                                where c.id_departamento == id
                                select new { c.id_municipio, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_municipio";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                #endregion
            }

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione ...", ""));
        }
    }
}
