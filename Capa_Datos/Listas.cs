using System.Web.UI.WebControls;
using System.Linq;
using System;

namespace Capa_Datos
{
    public class Listas
    {
        public Listas()
        {

        }


        public static void Actividades_Sucursal(DropDownList DropDownList1, int idSucursal, int _anho)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (
                from c in contexto.plan_trabajo
                where c.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                && c.anho == _anho
                select new { c.id_plan_trabajo, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_plan_trabajo";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Actividad", ""));
        }
        public static void AFP(DropDownList DropDownList1)
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
        public static void AnhoNorma(DropDownList DropDownList1, int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (
                from c in contexto.norma_sucursal
                where c.id_sucursal == _id_sucursal
                group c by c.norma.anho into g
                select new
                {
                    name = g.Key,
                    count = g.Count()

                }).ToList();

            Consulta = Consulta.OrderByDescending(x => x.name).ToList();


            DropDownList1.DataValueField = "name";
            DropDownList1.DataTextField = "name";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione ...", ""));
        } 
        public static void Arl(DropDownList DropDownList1)
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
        public static void Ccf(DropDownList DropDownList1)
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
        public static void Cno(DropDownList DropDownList1)
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
        public static void PerfilCargo(DropDownList DropDownList1, int _id_empresa = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.perfil_cargo
                            select new { c.id_perfil_cargo, nombre = c.nombre, c.id_empresa}).OrderBy(x => x.nombre.Trim()).ToList();

            if (_id_empresa > 0)
            {
                Consulta = Consulta.Where(x => x.id_empresa == _id_empresa).ToList();
            }

            DropDownList1.DataValueField = "id_perfil_cargo";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Cargo", ""));
        }
        public static void EnfermedadComun(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.enfermedad.Where(x => x.tipo == 0)
                            select new { c.id_enfermedad, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_enfermedad";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Enfermedad Común", ""));
            #endregion
        }
        public static void EnfermedadLaboral(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.enfermedad.Where(x => x.tipo == 1)
                            select new { c.id_enfermedad, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_enfermedad";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Enfermedad Laboral", ""));
            #endregion
        }
        public static void EPS(DropDownList DropDownList1)
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
        public static void Frecuencia(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.frecuencia_control
                            select new { c.id_frec_con, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_frec_con";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la frecuencia", ""));
        }
        public static void IPS(DropDownList DropDownList1)
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
        public static void Reg_Dpto_Mcpio(DropDownList DropDownList1, string tabla, int id = 0)
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

        public static void Sistema(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.sistema
                            select new { c.id_sistemas, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_sistemas";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Sistema", ""));
            #endregion
        }
        public static void TipoExamen(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.tipo_examen
                            select new { c.id_tipo_exa, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_tipo_exa";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Tipo de Examen", ""));
            #endregion
        }
        public static void Extintor_Area(DropDownList DropDownList1, int _id_area)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.extintor.Where(x => x.area.id_area == _id_area)
                            select new { c.id_extintor, c.serial_extintor }).ToList();

            DropDownList1.DataValueField = "id_extintor";
            DropDownList1.DataTextField = "serial_extintor";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Extintor", ""));
            #endregion
        }
        public static void TipoEpp(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.tipo_epp
                select new { c.id_tipo_epp, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_tipo_epp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Tipo de EPP", ""));
        }
        public static void Epp(ListBox DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (from c in contexto.epp select new { c.id_epp, c.nombre }).ToList();
            DropDownList1.DataValueField = "id_epp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
        }
        public static void Epp(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (from c in contexto.epp select new { c.id_epp, c.nombre }).ToList();
            DropDownList1.DataValueField = "id_epp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
        }
        public static void EppPuesto(DropDownList DropDownList1, string _id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int idPuesto = Convert.ToInt32(_id_puesto);
            var Consulta = (from c in contexto.puesto_trabajo_epp.Where(x => x.id_puesto_trabajo == idPuesto)
                            select new { c.id_epp, c.epp.nombre }).ToList();
            DropDownList1.DataValueField = "id_epp";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
        }
    }
}
