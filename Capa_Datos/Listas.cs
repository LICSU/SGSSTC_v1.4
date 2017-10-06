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
        public static void Area_Sucursal(DropDownList DropDownList1, int _id_sucursal, string valor = "", string tipo = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.area.Where(x => x.sucursal.id_sucursal == _id_sucursal)
                select new { c.id_area, c.nombre, c.tipo }).ToList();
            if (tipo == "Operativa")
            {
                Consulta = Consulta.Where(x => x.tipo == "Operativa").ToList();
            }

            if (tipo == "Administrativa")
            {
                Consulta = Consulta.Where(x => x.tipo == "Administrativa").ToList();
            }

            DropDownList1.DataValueField = "id_area";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();

            if (valor != string.Empty)
            {
                DropDownList1.Items.Insert(0, new ListItem("Seleccione el Area", ""));
                DropDownList1.Items.Insert(1, new ListItem("Ninguna", "0"));
            }
            else
            {
                DropDownList1.Items.Insert(0, new ListItem("Seleccione el Area", ""));
            }

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
        public static void Categorias(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.categoria
                            where c.id_empresa == _id_empresa
                            select new { c.id_categorias, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_categorias";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Categoria", ""));
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
        public static void Codciiu_Div_item(DropDownList DropDownList1, string tabla, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            if (tabla == "SeccionCiiu")
            {
                var Consulta = (from c in contexto.seccionCiiu
                                select new { c.id_seccion, nombre = c.nombre + " " + c.descripcion }).ToList();

                DropDownList1.DataValueField = "id_seccion";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "DivisionCiiu")
            {
                var Consulta = (from c in contexto.divisionCiiu
                                where c.id_seccion == id
                                select new { c.id_division, nombre = c.nombre + " " + c.descripcion }).ToList();

                DropDownList1.DataValueField = "id_division";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "GrupoCiiu")
            {
                var Consulta = (from c in contexto.grupoCiiu
                                where c.id_division == id
                                select new { c.id_grupo, nombre = c.nombre + " " + c.descripcion }).ToList();

                DropDownList1.DataValueField = "id_grupo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "ClaseCiiu")
            {
                var Consulta = (from c in contexto.claseCiiu
                                where c.id_grupo == id
                                select new { c.id_clase_ciiu, nombre = c.nombre + " " + c.descripcion })
                                .ToList();

                DropDownList1.DataValueField = "id_clase_ciiu";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "claseCiiu_Empresa")
            {
                var Consulta = (
                    from c in contexto.empresa_itemdivision
                    where c.id_empresa == id
                    select new
                    {
                        c.id_clase_ciiu,
                        nombre = c.claseCiiu.nombre + " " + c.claseCiiu.descripcion
                    }).ToList();

                DropDownList1.DataValueField = "id_clase_ciiu";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar..", ""));

            foreach (ListItem myItem in DropDownList1.Items)
            {
                try
                {
                    if (myItem.Text.Length > 80)
                        myItem.Text = myItem.Text.Substring(0, 80) + "...";
                }
                catch (ArgumentOutOfRangeException ex)
                {

                    Utilidades.LogMessage("Execpción: " + ex);
                }
            }
        }
        public static void Empresa(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.empresa
                            where c.id_empresa != 1
                            select new { c.id_empresa, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_empresa";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Empresa", ""));
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
        public static void Estatus_Empresa(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.estatus.Where(x => x.id_empresa == _id_empresa || x.id_empresa == 1)
                            select new { c.id_estatus, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_estatus";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Estatus", ""));
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
        public static void Horario_Empresa(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.horario.Where(x => x.id_empresa == _id_empresa)
                            select new { c.id_horario, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_horario";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Horario", ""));
            #endregion
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
        public static void PuestoTrabajo(DropDownList DropDownList1, string filtro, int _id = 0, string valor = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            if (filtro == "idArea")
            {
                var Consulta = (
                    from c in contexto.puesto_trabajo.Where(x => x.id_area == _id)
                    select new { c.id_puesto_trabajo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_puesto_trabajo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                DropDownList1.DataBind();
                if (valor != string.Empty)
                {
                    DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
                    DropDownList1.Items.Insert(1, new ListItem("Ninguno", "0"));
                }
                else
                {
                    DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
                }

            }
            else if (filtro == "Sucursal")
            {
                var Consulta = (
                    from c in contexto.puesto_trabajo.Where(x => x.area.id_sucursal == _id)
                    select new { c.id_puesto_trabajo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_puesto_trabajo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                DropDownList1.DataBind();
                if (valor != string.Empty)
                {
                    DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
                    DropDownList1.Items.Insert(1, new ListItem("Ninguno", "0"));
                }
                else
                {
                    DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
                }
            }
            else if (filtro == "Empresa")
            {
                var Consulta = (
                    from c in contexto.puesto_trabajo.Where(x => x.area.sucursal.id_empresa == _id)
                    select new { c.id_puesto_trabajo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_puesto_trabajo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Seleccione el Puesto", ""));
            }
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
        public static void Riesgos(DropDownList DropDownList1, string tabla, string _id_tipo = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            if (tabla == "TipoRiesgo")
            {
                var Consulta = (from c in contexto.tipo_riesgo
                                select new { c.id_tipo_riesgo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_tipo_riesgo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "FactorRiesgo")
            {
                #region codigo
                int idtipo = Convert.ToInt32(_id_tipo);


                var Consulta = (from c in contexto.factor_riesgo
                                where c.id_tipo_riesgo == idtipo
                                select new { c.id_factor_riesgo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_factor_riesgo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                #endregion
            }
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione", ""));
        }
        public static void RiesgosSucursal(DropDownList DropDownList1, int idSucursal)
        {
            /*GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.evaluacion_riesgos.Where(x => x.id_sucursal == idSucursal)
                            select new { c.id_riesgos, c.identificacion_riesgo }).ToList();

            DropDownList1.DataValueField = "id_riesgos";
            DropDownList1.DataTextField = "identificacion_riesgo";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Riesgo", "0"));*/
        }

        public static void Rol(DropDownList DropDownList1, int _id_rol = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            DropDownList1.DataValueField = "id_rol";
            DropDownList1.DataTextField = "nombre";

            if (_id_rol == 0)
            {
                var Consulta = (from c in contexto.rol
                                where c.id_rol != 1
                                select new { c.id_rol, c.nombre }).ToList();

                DropDownList1.DataSource = Consulta;
            }
            else
            {
                var Consulta = (from c in contexto.rol
                                where c.id_rol == _id_rol
                                select new { c.id_rol, c.nombre }).ToList();

                DropDownList1.DataSource = Consulta;
            }


            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione ...", ""));
        }

        public static void Rol_AdmSucursal(DropDownList DropDownList1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.rol
                            where c.id_rol == 3 || c.id_rol == 5 || c.id_rol == 7 || c.id_rol == 8
                            select new { c.id_rol, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_rol";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
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
        public static void Sucursal(DropDownList ddlSucursal, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.sucursal.Where(x => x.id_empresa == _id_empresa)
                            select new { c.id_sucursal, c.nombre }).ToList();

            ddlSucursal.DataValueField = "id_sucursal";
            ddlSucursal.DataTextField = "nombre";
            ddlSucursal.DataSource = Consulta;
            ddlSucursal.DataBind();
            ddlSucursal.Items.Insert(0, new ListItem("Seleccione la Sucursal", ""));
        }
        public static void SucursalGeneral(DropDownList ddlSucursal, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.sucursal.Where(x => x.id_empresa == _id_empresa)
                            select new { c.id_sucursal, c.nombre }).ToList();

            ddlSucursal.DataValueField = "id_sucursal";
            ddlSucursal.DataTextField = "nombre";
            ddlSucursal.DataSource = Consulta;
            ddlSucursal.DataBind();
            ddlSucursal.Items.Insert(0, new ListItem("Seleccione la Sucursal", ""));
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
        public static void Trabajadores_Empresa(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.trabajador
                            where c.puesto_trabajo.area.sucursal.empresa.id_empresa == _id_empresa
                            select new { c.id_trabajador, nombre = c.primer_nombre + " " + c.primer_apellido }).ToList();
            DropDownList1.DataValueField = "id_trabajador";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Trabajador", ""));
        }
        public static void Trabajadores_Sucursal(DropDownList DropDownList1, int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.trabajador
                            where c.puesto_trabajo.area.sucursal.id_sucursal == _id_sucursal
                            select new { c.id_trabajador, nombre = c.primer_nombre + " " + c.primer_apellido }).ToList();
            DropDownList1.DataValueField = "id_trabajador";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Trabajador", ""));
        }
        public static void Trabajadores_Area(DropDownList DropDownList1, int _id_area)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.trabajador
                            where c.puesto_trabajo.area.id_area == _id_area
                            select new { c.id_trabajador, nombre = c.primer_nombre + " " + c.primer_apellido }).ToList();
            DropDownList1.DataValueField = "id_trabajador";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Trabajador", ""));
        }
        public static void Trabajadores_Puestos(DropDownList DropDownList1, int _id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.trabajador
                            where c.id_puesto_trabajo == _id_puesto
                            select new
                            {
                                c.id_trabajador,
                                nombre = c.primer_nombre + " " + c.primer_apellido
                            }).ToList();
            DropDownList1.DataValueField = "id_trabajador";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Trabajador", ""));
        }
        public static void Usuario_Empresa(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.usuario
                            where c.trabajador.puesto_trabajo.area.sucursal.id_empresa == _id_empresa
                            select new { c.id_usuario, c.login }).ToList();

            DropDownList1.DataValueField = "id_usuario";
            DropDownList1.DataTextField = "login";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Usuario", ""));
        }
        public static void Usuario_Sucursal(DropDownList DropDownList1, int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.usuario
                            where c.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal
                            select new { c.id_usuario, c.login }).ToList();

            DropDownList1.DataValueField = "id_usuario";
            DropDownList1.DataTextField = "login";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Usuario", ""));
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


        public static void Codciiu_Usuario(DropDownList DropDownList1, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.empresa_itemdivision
                where c.id_empresa == id
                select new
                {
                    c.id_clase_ciiu,
                    nombre = c.claseCiiu.nombre + " " + c.claseCiiu.descripcion
                }).ToList();

            var Distinto = Consulta.Distinct().ToList();

            DropDownList1.DataValueField = "id_clase_ciiu";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Distinto;


            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar..", ""));

            foreach (ListItem myItem in DropDownList1.Items)
            {
                try
                {
                    if (myItem.Text.Length > 80)
                        myItem.Text = myItem.Text.Substring(0, 80) + "...";
                }
                catch (ArgumentOutOfRangeException ex)
                {

                    Utilidades.LogMessage("Execpción: " + ex);
                }
            }
        }

        public static void Division_Usuario(DropDownList DropDownList1, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.empresa_itemdivision
                where c.id_empresa == id
                select new
                {
                    c.claseCiiu.grupoCiiu.id_division,
                    nombre = c.claseCiiu.grupoCiiu.divisionCiiu.nombre + " " + c.claseCiiu.grupoCiiu.divisionCiiu.descripcion
                }).ToList();

            var Distinto = Consulta.Distinct().ToList();

            DropDownList1.DataValueField = "id_division";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Distinto;


            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar..", ""));

            foreach (ListItem myItem in DropDownList1.Items)
            {
                try
                {
                    if (myItem.Text.Length > 80)
                        myItem.Text = myItem.Text.Substring(0, 80) + "...";
                }
                catch (ArgumentOutOfRangeException ex)
                {

                    Utilidades.LogMessage("Execpción: " + ex);
                }
            }
        }

        public static void Seccion_Usuario(DropDownList DropDownList1, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.empresa_itemdivision
                where c.id_empresa == id
                select new
                {
                    c.claseCiiu.grupoCiiu.divisionCiiu.id_seccion,
                    nombre = c.claseCiiu.grupoCiiu.divisionCiiu.seccionCiiu.nombre + " " + c.claseCiiu.grupoCiiu.divisionCiiu.seccionCiiu.descripcion
                }).ToList();

            var Distinto = Consulta.Distinct().ToList();

            DropDownList1.DataValueField = "id_seccion";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Distinto;


            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar..", ""));

            foreach (ListItem myItem in DropDownList1.Items)
            {
                try
                {
                    if (myItem.Text.Length > 80)
                        myItem.Text = myItem.Text.Substring(0, 80) + "...";
                }
                catch (ArgumentOutOfRangeException ex)
                {

                    Utilidades.LogMessage("Execpción: " + ex);
                }
            }
        }
    }
}
