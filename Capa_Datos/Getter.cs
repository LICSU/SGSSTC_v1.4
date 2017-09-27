using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Capa_Datos
{
    /// <summary>
    /// Clase que se usa para obtener informacion de la base de datos
    /// </summary>
    public class Getter
    {
        /// <summary>
        /// constructor de la clase
        /// </summary>
        public Getter()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static Tuple<int, int> Get_IdEmpresa_IdSucursal(Model_UsuarioSistema ObjUsuario, DropDownList ddlEmpresa, DropDownList ddlSucursal)
        {
            int IdSucursal = 0;
            int IdEmpresa = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdEmpresa = Convert.ToInt32(ddlEmpresa.SelectedValue);
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else if (ObjUsuario.isAdm_Empresa() || ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdmEmp_DptoSalud())
            {
                IdEmpresa = ObjUsuario.Id_empresa;
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else
            {
                IdEmpresa = ObjUsuario.Id_empresa;
                IdSucursal = ObjUsuario.Id_sucursal;
            }

            return Tuple.Create(IdEmpresa, IdSucursal);
        }

        public static Tuple<bool, bool> Get_Empresa_Sucursal(Model_UsuarioSistema ObjUsuario)
        {
            bool Sucursal = true;
            bool Empresa = true;

            if (ObjUsuario.isAdm_Grupoli())
            {
                Sucursal = true;
                Empresa = true;
            }
            else if (ObjUsuario.isAdm_Empresa() || ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdmEmp_DptoSalud())
            {
                Sucursal = true;
                Empresa = false;
            }
            else
            {
                Sucursal = false;
                Empresa = false;
            }

            return Tuple.Create(Empresa, Sucursal);
        }

        public static int Set_IdEmpresaDDl(Model_UsuarioSistema ObjUsuario, DropDownList ddlEmpresa)
        {
            int IdEmpresa = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdEmpresa = Convert.ToInt32(ddlEmpresa.SelectedValue);
            }
            else
            {
                IdEmpresa = ObjUsuario.Id_empresa;
            }

            return IdEmpresa;
        }

        public static int Set_IdSucursalDDl(Model_UsuarioSistema ObjUsuario, DropDownList ddlSucursal)
        {
            int IdSucursal = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else if (ObjUsuario.isAdm_Empresa() || ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdmEmp_DptoSalud())
            {
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else
            {
                IdSucursal = ObjUsuario.Id_sucursal;
            }

            return IdSucursal;
        }

        public static int Set_IdUsuarioDDl(Model_UsuarioSistema ObjUsuario, DropDownList ddlUsuario)
        {
            int IdUsuario = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdUsuario = Convert.ToInt32(ddlUsuario.SelectedValue);
            }
            else
            {
                IdUsuario = ObjUsuario.Id_usuario;
            }

            return IdUsuario;
        }

        public static int Set_IdEmpresa(Model_UsuarioSistema ObjUsuario, int valor)
        {
            int IdEmpresa = 0;

            if (ObjUsuario.isAdm_Grupoli())
            {
                IdEmpresa = valor;
            }
            else
            {
                IdEmpresa = ObjUsuario.Id_empresa;
            }

            return IdEmpresa;
        }

        public static int Set_IdSucursal(Model_UsuarioSistema ObjUsuario, int valor)
        {
            int IdSucursal = 0;

            if (ObjUsuario.isAdm_Sucursal() || ObjUsuario.isAdm_SucSeg() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isResponsable())
            {
                IdSucursal = ObjUsuario.Id_sucursal;
            }
            else
            {
                IdSucursal = valor;
            }

            return IdSucursal;
        }

        #region Avg
        public static Double AvgEstatusNorma(int _idSucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var objeto = contexto.norma_sucursal.Where(x => x.id_sucursal == _idSucursal);

            var querySelect = new
            {
                promedio = objeto.Average(x => x.estatus_norma)
            };

            return Math.Round(Convert.ToDouble(querySelect.promedio), 3);
        }
        public static Double AvgEstNorEmp(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var objeto = contexto.norma_sucursal.Where(x => x.sucursal.id_empresa == _id_empresa);

            var querySelect = new
            {
                promedio = objeto.Average(x => x.estatus_norma)
            };

            return Math.Round(Convert.ToDouble(querySelect.promedio), 3);
        }

        public static Double AvgPorcEstRieSuc(int _idSucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<puesto_trabajo> puestos = contexto.puesto_trabajo.Where(x => x.area.id_sucursal == _idSucursal).ToList();
            List<evaluacion_riesgo> evaluaciones = new List<evaluacion_riesgo>();

            double total = 0;
            double acumulado = 0;
            foreach (var itemPuestos in puestos)
            {
                foreach (var itemIdePuesto in itemPuestos.identificacion_puesto)
                {
                    total++;
                    foreach (var itemEvaRiesgo in itemIdePuesto.evaluacion_riesgo)
                    {
                        acumulado = acumulado + Convert.ToDouble(itemEvaRiesgo.porc_estatus);
                    }
                }
            }

            double promedio = acumulado / total;

            return Math.Round(promedio, 3);
        }
        public static Double AvgPorcEstRieEmp(int _idEmpresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<puesto_trabajo> puestos = contexto.puesto_trabajo.Where(x => x.area.sucursal.id_empresa == _idEmpresa).ToList();
            List<evaluacion_riesgo> evaluaciones = new List<evaluacion_riesgo>();

            double total = 0;
            double acumulado = 0;
            foreach (var itemPuestos in puestos)
            {
                foreach (var itemIdePuesto in itemPuestos.identificacion_puesto)
                {
                    total++;
                    foreach (var itemEvaRiesgo in itemIdePuesto.evaluacion_riesgo)
                    {
                        acumulado = acumulado + Convert.ToDouble(itemEvaRiesgo.porc_estatus);
                    }
                }
            }

            double promedio = acumulado / total;

            return Math.Round(promedio, 3);
        }
        #endregion

        #region Area
        public static List<area> Area(int _id_empresa = 0, int _id_area = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<area>();

            if (_id_empresa != 0) { consulta = contexto.area.Where(x => x.sucursal.id_empresa == _id_empresa).ToList(); }
            else if (_id_area != 0) { consulta = contexto.area.Where(x => x.id_area == _id_area).ToList(); }
            else if (_nombre != string.Empty) { consulta = contexto.area.Where(x => x.nombre == _nombre).ToList(); }

            return consulta;
        }

        public static int AreaByNombre(string nombre, int id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.area.Where(x => x.nombre.ToUpper().Equals(nombre.ToUpper()) && x.id_sucursal == id_sucursal).ToList();
            if (consulta.Count == 0)
                return 0;
            else
                return 1;
        }

        public static List<usuario> AreaByUsuario(int _id_usuario)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.usuario.Where(x => x.id_usuario == _id_usuario).ToList();
            return consulta;
        }
        #endregion

        #region Alarmas

        public static List<alarma> Alarma(int _id_alarma)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<alarma>();
            consulta = contexto.alarma.Where(x => x.id_alarmas == _id_alarma).ToList();
            return consulta;
        }
        #endregion

        #region Accidentes
        public static List<at_it_el_pa> Accidente(int _id_accidente)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<at_it_el_pa>();
            consulta = contexto.at_it_el_pa.Where(x => x.id_at_it_el_pa == _id_accidente).ToList();
            return consulta;
        }
        public static List<investigacion_ac_in> InvestigacionAccidente(int _id_accidente)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<investigacion_ac_in> consulta = new List<investigacion_ac_in>();
            consulta = contexto.investigacion_ac_in.Where(x => x.id_at_it_el_pa == _id_accidente).ToList();
            return consulta;
        }

        public static List<at_it_el_pa> Accidente_Empresa_Reportes(int _id_empresa, DateTime fechainicio, DateTime fechafin)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<at_it_el_pa>();
            consulta = contexto.at_it_el_pa.Where(x =>
                x.trabajador.puesto_trabajo.area.sucursal.id_empresa == _id_empresa &&
                x.fecha_accidente >= fechainicio && x.fecha_accidente <= fechafin).ToList();
            return consulta;
        }

        #endregion

        #region brigada_emergencia

        public static List<brigada_emergencia> BrigadaEmergencia(int _id_brigada)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<brigada_emergencia> consulta = new List<brigada_emergencia>();
            consulta = contexto.brigada_emergencia.Where(x => x.id_brigada == _id_brigada).ToList();
            return consulta;
        }
        #endregion

        #region Categorias
        public static List<categoria> Categoria(string nombre)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<categoria> consulta = new List<categoria>();
            consulta = contexto.categoria.Where(x => x.nombre == nombre).ToList();
            return consulta;
        }

        public static categoria Categoria(int _idCategoria)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            categoria consulta = new categoria();
            consulta = contexto.categoria.Where(x => x.id_categorias == _idCategoria).SingleOrDefault();
            return consulta;
        }

        public static rol Rol(int _idRol)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            rol consulta = new rol();
            consulta = contexto.rol.Where(x => x.id_rol == _idRol).SingleOrDefault();
            return consulta;
        }
        #endregion

        #region C_EPP

        public static List<Model_CEPP> Epp(int _id_puesto = 0, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Model_CEPP> consulta = new List<Model_CEPP>();

            if (_id_puesto != 0)
            {
                consulta = (
                    from E in contexto.epp
                    join PE in contexto.puesto_trabajo_epp on E.id_epp equals PE.id_epp
                    where (PE.id_puesto_trabajo == _id_puesto)
                    select new Model_CEPP
                    {
                        id = E.id_epp,
                        nombre = E.nombre
                    }
               ).ToList();
            }
            else if (_id_sucursal != 0)
            {
                consulta = (
                    from E in contexto.epp
                    join PE in contexto.puesto_trabajo_epp on E.id_epp equals PE.id_epp
                    join PT in contexto.puesto_trabajo on PE.id_puesto_trabajo equals PT.id_puesto_trabajo
                    where (PT.area.sucursal.id_sucursal == _id_sucursal)
                    select new Model_CEPP
                    {
                        id = E.id_epp,
                        nombre = E.nombre
                    }
                    ).ToList();
            }

            return consulta;
        }

        public static List<Model_CEPP> TipoEpp(int _id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Model_CEPP> consulta = new List<Model_CEPP>();

            consulta = (
                from E in contexto.epp
                join PE in contexto.puesto_trabajo_epp on E.id_epp equals PE.id_epp
                where (PE.id_puesto_trabajo == _id_puesto)
                select new Model_CEPP
                {
                    id = E.tipo_epp.id_tipo_epp,
                    nombre = E.tipo_epp.nombre_senal
                }
           ).ToList();

            return consulta;
        }
        #endregion

        #region Descripcion Sociodemografica
        public static List<desc_socio> DescripcionSociodemografica(int _id_desc_socio = 0, int _id_trabajador = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<desc_socio> consulta = new List<desc_socio>();

            if (_id_desc_socio != 0) { consulta = contexto.desc_socio.Where(x => x.id_desc_socio == _id_desc_socio).ToList(); }
            else if (_id_trabajador != 0) { consulta = contexto.desc_socio.Where(x => x.id_trabajador == _id_trabajador).ToList(); }

            return consulta;
        }
        #endregion

        #region documentos

        public static List<documento> Documentos(int _anho, string _tipo, int _id_empresa = 0, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<documento> consulta = new List<documento>();

            if (_id_sucursal != 0)
            {
                consulta = contexto.documento.Where(x =>
               x.id_tabla == _id_sucursal &&
               x.tipo == _tipo &&
               x.fecha_subida.Value.Year == _anho).ToList();
            }
            else if (_id_empresa != 0)
            {
                consulta = contexto.documento.Where(x =>
                x.sucursal.id_empresa == _id_empresa &&
                x.tipo == _tipo &&
                x.fecha_subida.Value.Year == _anho).ToList();
            }


            return consulta;
        }
        #endregion

        #region extintor

        public static List<extintor> Extintor(int _idExtintor)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<extintor> consulta = new List<extintor>();
            consulta = contexto.extintor.Where(x => x.id_extintor == _idExtintor).ToList();

            return consulta;
        }
        #endregion

        #region Empresa
        public static List<empresa> Empresa(int _id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<empresa> consulta = new List<empresa>();

            if (_id_empresa != 0) { consulta = contexto.empresa.Where(x => x.id_empresa == _id_empresa).ToList(); }
            else if (_nombre != string.Empty) { consulta = contexto.empresa.Where(x => x.nombre == _nombre).ToList(); }

            return consulta;
        }
        #endregion

        #region empresa_itemdivision
        public static List<empresa_itemdivision> CodigoCiiu_Empresa(int _id_empresa)
        {
            GrupoLiEntities contextoCod = new GrupoLiEntities();

            List<empresa_itemdivision> consulta = new List<empresa_itemdivision>();
            consulta = contextoCod.empresa_itemdivision.Where(x => x.id_empresa == _id_empresa).ToList();
            return consulta;
        }
        public static List<empresa_itemdivision> EmpresaItemDivison(int _id_empresa, int act1, int act2, int act3 = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<empresa_itemdivision> consulta = contexto
                .empresa_itemdivision
                .Where(
                    x => x.id_empresa == _id_empresa &&
                    (x.id_clase_ciiu == act1 || x.id_clase_ciiu == act2 || x.id_clase_ciiu == act3)
                ).ToList();
            return consulta;
        }
        #endregion

        #region encuesta_politica

        public static List<encuesta_politica> EncuestaPoliticaSST(int _id_encuesta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<encuesta_politica> consulta = new List<encuesta_politica>();
            consulta = contexto.encuesta_politica.Where(x => x.id_encuesta == _id_encuesta).ToList();
            return consulta;
        }
        #endregion

        #region factor_riesgo
        public static List<factor_riesgo> FactorRiesgo(int id_factor_riesgo = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<factor_riesgo> consulta = new List<factor_riesgo>();

            if (_nombre != string.Empty)
            {
                consulta = contexto.factor_riesgo.Where(x => x.nombre.Contains(_nombre)).ToList();
            }

            if (id_factor_riesgo != 0)
            {
                consulta = contexto.factor_riesgo.Where(x => x.id_factor_riesgo == id_factor_riesgo).ToList();
            }

            return consulta;
        }
        #endregion

        #region gestion_laboral
        public static List<gestion_laboral> GestionLaboral(int _id_ges_lab)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<gestion_laboral> consulta = new List<gestion_laboral>();
            consulta = contexto.gestion_laboral.Where(x => x.id_ges_lab == _id_ges_lab).ToList();
            return consulta;
        }
        public static List<gestion_laboral> GesLabCap(DateTime fechaInicial, DateTime fechaFinal, int _id_empresa = 0, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<gestion_laboral> consulta = new List<gestion_laboral>();
            consulta = contexto.gestion_laboral.Where(
                x => x.tipo_gestion == 2
                && x.fecha >= fechaInicial
                && x.fecha <= fechaFinal).OrderBy(x => x.fecha).ToList();

            if (_id_empresa != 0) { consulta = consulta.Where(x => x.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { consulta = consulta.Where(x => x.usuario.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal).ToList(); }

            return consulta;
        }

        #endregion

        #region horario
        public static horario Horario(int _id_horario)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            horario consulta = new horario();
            consulta = contexto.horario.Where(x => x.id_horario == _id_horario).SingleOrDefault();
            return consulta;
        }
        public static List<horario> ListHorario(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<horario> consulta = new List<horario>();

            consulta = contexto.horario.Where(x => x.id_empresa == _id_empresa).ToList(); 

            return consulta;
        }
        #endregion

        #region items_division
        public static List<claseCiiu> CodigoCiiu(int _id_item_division)
        {
            GrupoLiEntities contextoCod = new GrupoLiEntities();

            List<claseCiiu> consulta = new List<claseCiiu>();
            consulta = contextoCod.claseCiiu.Where(x => x.id_clase_ciiu == _id_item_division).ToList();
            return consulta;
        }
        #endregion

        #region ListEnfSis

        public static List<Model_Enfermedad_Sistema> CantDiagnosticos(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Model_Enfermedad_Sistema> query = new List<Model_Enfermedad_Sistema>();
            if (id_empresa > 0)
            {
                query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.enfermedad on TE.id_enfermedad equals E.id_enfermedad
                    where (TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa == id_empresa && TE.fecha_constancia.Value.Year == _anho)
                    group TE by E.nombre into grupo
                    select new Model_Enfermedad_Sistema
                    {
                        nombre = grupo.Key,
                        suma = grupo.Sum(TE => TE.dias_reposo).ToString(),
                        cantidad = grupo.Count()
                    }
               ).ToList();
            }
            else if (id_sucursal > 0)
            {
                query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.enfermedad on TE.id_enfermedad equals E.id_enfermedad
                    where (TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal == id_sucursal && TE.fecha_constancia.Value.Year == _anho)
                    group TE by E.nombre into grupo
                    select new Model_Enfermedad_Sistema
                    {
                        nombre = grupo.Key,
                        suma = grupo.Sum(TE => TE.dias_reposo).ToString(),
                        cantidad = grupo.Count()
                    }
                ).ToList();
            }

            return query;
        }
        public static List<Model_Enfermedad_Sistema> CantSistemas(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Model_Enfermedad_Sistema> query = new List<Model_Enfermedad_Sistema>();
            if (id_empresa > 0)
            {
                query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.sistema on TE.id_sistema equals E.id_sistemas
                    where (TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa == id_empresa && TE.fecha_constancia.Value.Year == _anho)
                    group TE by E.nombre into grupo
                    select new Model_Enfermedad_Sistema
                    {
                        nombre = grupo.Key,
                        suma = grupo.Sum(TE => TE.dias_reposo).ToString(),
                        cantidad = grupo.Count()
                    }
                ).ToList();

                return query;
            }
            else if (id_sucursal > 0)
            {
                query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.sistema on TE.id_sistema equals E.id_sistemas
                    where (TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal == id_sucursal && TE.fecha_constancia.Value.Year == _anho)
                    group TE by E.nombre into grupo
                    select new Model_Enfermedad_Sistema
                    {
                        nombre = grupo.Key,
                        suma = grupo.Sum(TE => TE.dias_reposo).ToString(),
                        cantidad = grupo.Count()
                    }
                ).ToList();
            }
            return query;
        }

        #endregion

        #region matriz_responsabilidad

        public static List<matriz_responsabilidad> MatrizResponsabilidad(int _id_matriz_responsabilidad)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<matriz_responsabilidad> consulta = new List<matriz_responsabilidad>();
            consulta = contexto.matriz_responsabilidad.Where(x => x.id_matriz_responsabilidad == _id_matriz_responsabilidad).ToList();
            return consulta;
        }
        #endregion

        #region enfermedadLaboral
        public static List<enfermedadLaboral> MatRieEnfLab(int _id_EnfLab)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<enfermedadLaboral> consulta = new List<enfermedadLaboral>();
            consulta = contexto.enfermedadLaboral.Where(
                x => x.id_enfermedadLaboral == _id_EnfLab).ToList();
            return consulta;
        }
        #endregion

        #region medidas
        public static List<medida> Medidas(int idNorma)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<medida> consulta = contexto.medida.Where(x => x.id_normas == idNorma).ToList();
            return consulta;
        }
        #endregion

        #region medidas_sucursal
        public static List<medida_sucursal> Medidas_Sucursal(int _id_medidas_sucursal)
        {
            GrupoLiEntities contexto2 = new GrupoLiEntities();

            List<medida_sucursal> consulta = new List<medida_sucursal>();
            consulta = contexto2.medida_sucursal.Where(
                x => x.id_medidas_sucursal == _id_medidas_sucursal
                ).ToList();
            return consulta;
        }
        #endregion

        #region normas
        public static List<norma> Norma(int _id_norma = 0, string _tipo = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<norma> consulta = new List<norma>();

            if (_id_norma != 0) { consulta = contexto.norma.Where(x => x.id_normas == _id_norma).ToList(); }
            if (_tipo == "General") { consulta = contexto.norma.Where(x => x.tipo_matriz.Contains("General")).ToList(); }

            return consulta;
        }
        #endregion

        #region normas_sucursal
        public static List<norma_sucursal> Normas_Sucursal(int idSucursal, int _id_normas = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<norma_sucursal> consulta = new List<norma_sucursal>();

            if (_id_normas != 0)
            {
                consulta = contexto.norma_sucursal.Where(x => x.id_normas == _id_normas && x.id_sucursal == idSucursal).ToList();
            }
            else
            {
                consulta = contexto.norma_sucursal.Where(x => x.id_sucursal == idSucursal).ToList();
            }


            return consulta;
        }
        #endregion

        #region Obligacion
        public static List<obligacion> Obligacion(int _id_obligacion)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<obligacion> consulta = new List<obligacion>();
            consulta = contexto.obligacion.Where(x => x.id_obligacion == _id_obligacion).ToList();
            return consulta;
        }
        #endregion

        #region planes
        public static List<plan> Planes(int _id_plan, string _tipo = "", string _nombre ="")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<plan> consulta = new List<plan>();
            consulta = contexto.plan.Where(x => x.id_plan == _id_plan && x.tipo == _tipo
                                            && x.nombre.ToUpper().Contains(_nombre.ToUpper())).ToList();
            return consulta;
        }

        #endregion

        #region Plan_Trabajo
        public static List<plan_trabajo> Plan_Trabajo(int _id_sucursal = 0, int _anho = 0, int id_plan = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<plan_trabajo> consulta = new List<plan_trabajo>();

            if (id_plan != 0) { consulta = contexto.plan_trabajo.Where(x => x.id_plan_trabajo == id_plan).ToList(); }
            else if (_id_sucursal != 0 && _anho != 0)
            {
                consulta = contexto.plan_trabajo.Where(x =>
                x.usuario.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal &&
                x.anho == _anho).OrderBy(x => x.semana_ini).ToList();
            }

            return consulta;
        }
        #endregion

        #region puesto_trabajo_epp

        public static int idPuestoTrabajador(int _id_trabajador)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from e in contexto.trabajador
                    where (e.id_trabajador == _id_trabajador)
                    select new
                    {
                        e.id_puesto_trabajo
                    }
                ).ToList();

            return query.ElementAt(0).id_puesto_trabajo;
        }
        public static int PuestoEppValue(int id_puesto, int id_epp)
        {
            int valor = 0;
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from e in contexto.puesto_trabajo_epp
                    where (e.id_puesto_trabajo == id_puesto && e.id_epp == id_epp)
                    select new
                    {
                        e.id_puesto_trabajo_epp
                    }
                ).ToList();

            if (query.Count > 0)
                valor = 1;
            else if (query.Count == 0)
                valor = 0;
            return valor;
        }
        public static int Trae_ID_PEPP(int id_puesto, int id_epp)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from e in contexto.puesto_trabajo_epp
                    where (e.id_puesto_trabajo == id_puesto && e.id_epp == id_epp)
                    select new
                    {
                        e.id_puesto_trabajo_epp
                    }
                ).ToList();

            return query.ElementAt(0).id_puesto_trabajo_epp;
        }

        public static List<puesto_trabajo_epp> PuestoEpp(int id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<puesto_trabajo_epp>();
            consulta = contexto.puesto_trabajo_epp.Where(x => x.id_puesto_trabajo == id_puesto).ToList();
            return consulta;
        }
        #endregion

        #region politica_sst

        public static List<politica_sst> PoliticaSST(int _id_politica_sst)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<politica_sst> consulta = new List<politica_sst>();
            consulta = contexto.politica_sst.Where(x => x.id_politica == _id_politica_sst).ToList();
            return consulta;
        }
        #endregion

        #region puesto_trabajo
        public static List<puesto_trabajo> PuestoTrabajo(int _id_puesto = 0, int _id_empresa = 0, string tipoArea = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<puesto_trabajo> consulta = new List<puesto_trabajo>();

            if (_id_empresa != 0 && tipoArea != "")
            {
                consulta = contexto.puesto_trabajo.Where(x => x.area.tipo == tipoArea &&
                x.area.sucursal.id_empresa == _id_empresa).ToList();
            }
            else if (_id_puesto != 0)
            {
                consulta = contexto.puesto_trabajo.Where(x => x.id_puesto_trabajo == _id_puesto).ToList();
            }

            return consulta;
        }

        public static List<puesto_trabajo> PuestoTrabajo_Nom_Suc(string _nombre, int _sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<puesto_trabajo> consulta = new List<puesto_trabajo>();

            consulta = contexto.puesto_trabajo.Where(
                x => x.nombre.ToUpper().Equals(_nombre.ToUpper()) &&
                x.area.id_sucursal == _sucursal).ToList();

            return consulta;
        }
        #endregion

        #region procedimiento_comunicacion

        public static List<procedimiento_comunicacion> ProcedimientoComunicacion(int _id_brigada)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<procedimiento_comunicacion> consulta = new List<procedimiento_comunicacion>();
            consulta = contexto.procedimiento_comunicacion.Where(x => x.id_brigada == _id_brigada).ToList();
            return consulta;
        }
        #endregion

        #region Sucursal
        public static List<sucursal> Sucursal(int _id_sucursal = 0, int _id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<sucursal> consulta = new List<sucursal>();

            if (_id_sucursal != 0) { consulta = contexto.sucursal.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            else if (_id_empresa != 0) { consulta = contexto.sucursal.Where(x => x.id_empresa == _id_empresa).ToList(); }
            else if (_nombre != "") { consulta = contexto.sucursal.Where(x => x.nombre == _nombre).ToList(); }

            return consulta;
        }

        public static sucursal Sucursal(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            sucursal consulta = new sucursal();

            consulta = contexto.sucursal.Where(x => x.id_sucursal == _id_sucursal).SingleOrDefault(); 

            return consulta;
        }

        public static int SucursalByNombre(string nombre, int id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.sucursal.Where(x => x.nombre.ToUpper().Equals(nombre.ToUpper()) && x.id_empresa == id_empresa).ToList();
            if (consulta.Count == 0)
                return 0;
            else
                return 1;
        }

        public static List<empresa> EmpresaEmail(int id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            //List<empresa> consulta = from US in contexto.empresa where (US.id_empresa == id_empresa) select new { correo = US.email, empresa = US.nombre };
            List<empresa> consulta = contexto.empresa.Where(x => x.id_empresa == id_empresa).ToList();
            return consulta;
        }
        #endregion

        #region Soporte
        public static List<soporte> Soporte(int _id_rec_eco, string tipo)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<soporte> consulta = new List<soporte>();
            consulta = contexto.soporte.Where(
                x => x.id_tabla == _id_rec_eco &&
                x.tabla == tipo
                ).ToList();
            return consulta;
        }
        #endregion

        #region Trabajador

        public static List<trabajador> Trabajador(
            int _id_trabajador = 0,
            int _id_empresa = 0,
            int _id_sucursal = 0,
            int _id_puesto_trabajo = 0
            )
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<trabajador> consulta = new List<trabajador>();

            if (_id_trabajador != 0)
            {
                consulta = contexto.trabajador.Where(x => x.id_trabajador == _id_trabajador).OrderBy(y => y.primer_nombre).ToList();
            }
            else if (_id_empresa != 0)
            {
                consulta = contexto.trabajador.Where(x => x.puesto_trabajo.area.sucursal.id_empresa == _id_empresa).OrderBy(y => y.primer_nombre).ToList();
            }
            else if (_id_sucursal != 0)
            {
                consulta = contexto.trabajador.Where(x => x.puesto_trabajo.area.id_sucursal == _id_sucursal).OrderBy(y => y.primer_nombre).ToList();
            }
            else if (_id_puesto_trabajo != 0)
            {
                consulta = contexto.trabajador.Where(x => x.id_puesto_trabajo == _id_puesto_trabajo).OrderBy(y => y.primer_nombre).ToList();
            }

            return consulta;
        }

        public static List<trabajador_gestion> Trabajadores_Capacitacion(int _id_trabajador, DateTime fechaIni, DateTime fechaFin)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<trabajador_gestion> consulta = new List<trabajador_gestion>();
            consulta = contexto.trabajador_gestion.Where(x =>
            x.id_trabajador == _id_trabajador &&
            x.gestion_laboral.fecha >= fechaIni &&
            x.gestion_laboral.fecha <= fechaFin &&
            x.gestion_laboral.tipo_gestion == 2
            ).ToList();

            return consulta;
        }

        public static int TrabajadorByCedula(string cedula)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.trabajador.Where(x => x.cedula == cedula).ToList();
            if (consulta.Count == 0)
                return 0;
            else
                return 1;
        }

        public static int TrabajadorAutocomplete(string valor)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.trabajador.Where(c => c.primer_nombre + " " + c.primer_apellido + " " + c.cedula == valor).SingleOrDefault();
            return consulta.id_trabajador;
        }

        #endregion

        #region trabajador_gestion

        public static List<trabajador_gestion> TrabajadorInGestion(int id_trabajador = 0, int _id_ges_lab = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<trabajador_gestion>();

            if (_id_ges_lab != 0)
            {
                consulta = contexto.trabajador_gestion.Where(x => x.id_ges_lab == _id_ges_lab).ToList();
            }
            else if (id_trabajador != 0 && _id_ges_lab != 0)
            {
                consulta = contexto.trabajador_gestion.
                    Where(x => x.id_trabajador == id_trabajador && x.id_ges_lab == _id_ges_lab)
                    .ToList();
            }

            return consulta;
        }

        #endregion

        #region trabajador_estatus
        public static estatus Estatus(int _idEstatus)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            estatus consulta = new estatus();

            consulta = contexto.estatus.Where(x => x.id_estatus == _idEstatus).SingleOrDefault();

            return consulta;
        }

        public static List<trabajador_estatus> HistorialTrabajador(int _id_trabajador)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<trabajador_estatus> consulta = new List<trabajador_estatus>();
            consulta = contexto.trabajador_estatus.Where(x => x.id_trabajador == _id_trabajador).ToList();
            return consulta;
        }
        public static List<trabajador_estatus> TrabajadorReposo(int _id_trabajador, DateTime fechaInicio, DateTime fechaFin)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<trabajador_estatus> consulta = new List<trabajador_estatus>();
            consulta = contexto.trabajador_estatus.Where(
                x => x.id_trabajador == _id_trabajador &&
                (x.fecha_constancia >= fechaInicio && x.fecha_constancia <= fechaFin)
            ).ToList();
            return consulta;
        }

        #endregion

        #region tipo_documento

        public static List<tipo_documento> TipoDocumento(int _id_tipoDocumento)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<tipo_documento> consulta = new List<tipo_documento>();
            consulta = contexto.tipo_documento.Where(x => x.id_tipo_documento == _id_tipoDocumento).ToList();
            return consulta;
        }
        #endregion

        #region Usuario
        public static List<usuario> Usuario(int _id_usuario = 0, int _idSucursal = 0,
            string email = "", string _login = "", string _clave = "")
        {
            Utilidades objUtilidades = new Utilidades();
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<usuario> consulta = new List<usuario>();

            if (_id_usuario != 0)
            {
                consulta = contexto.usuario.Where(x => x.id_usuario == _id_usuario).ToList();
            }
            else if (_idSucursal != 0)
            {
                consulta = contexto.usuario.Where(x => x.trabajador.puesto_trabajo.area.id_sucursal == _idSucursal && x.id_rol == 3).ToList();
            }
            else if (email != "")
            {
                consulta = contexto.usuario.Where(x => x.trabajador.email.ToLower() == email.ToLower()).ToList();
            }
            else if (_login != "" && _clave != "")
            {
                _clave = objUtilidades.cifrarCadena(Convert.ToString(_clave));
                consulta = contexto.usuario.Where(x => x.login.ToLower() == _login.ToLower() && x.clave == _clave).ToList();
            }


            return consulta;
        }

        public static string ValidarUsuario(string login, string clave)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            Utilidades objUtilidades = new Utilidades();
            clave = objUtilidades.cifrarCadena(Convert.ToString(clave));

            var resultado = "";
            var consulta = from US in contexto.usuario where (US.login == login && US.clave == clave) select new { _id_rol = US.id_rol };

            foreach (var datos in consulta)
            {
                if (datos._id_rol == 1)
                {
                    var consulta1 = from US in contexto.usuario
                                    where (US.login == login && US.clave == clave)
                                    select new
                                    {
                                        _id_usuario = US.id_usuario,
                                        _id_rol = US.id_rol
                                    };

                    foreach (var datos1 in consulta1)
                    {
                        resultado = string.Concat(datos1._id_usuario, "|", datos1._id_rol);
                    }
                }
                else
                {
                    var consulta1 = from US in contexto.usuario
                                    where (US.login == login && US.clave == clave)
                                    select new
                                    {
                                        _id_usuario = US.id_usuario,
                                        _id_empresa = US.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                                        _id_sucursal = US.trabajador.puesto_trabajo.area.id_sucursal,
                                        _id_rol = US.id_rol
                                    };
                    foreach (var datos1 in consulta1) { resultado = string.Concat(datos1._id_usuario, "|", datos1._id_rol, "|", datos1._id_empresa, "|", datos1._id_sucursal); }
                }
            }
            return resultado;
        }

        public static bool ExisteUsuario(FormsIdentity _fIdentity)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            bool error = false;

            if (_fIdentity != null)
            {
                string[] aUsuario = _fIdentity.Name.Split('|');
                int _id_usuario = Convert.ToInt32(aUsuario[0]);

                var consulta = new usuario();
                int cantidad = contexto.usuario.Where(x => x.id_usuario == _id_usuario).Count();

                if (cantidad > 0)
                {
                    error = true;
                }
            }

            return error;
        }
        #endregion

        #region riesgos
        public static List<identificacion_peligro> IdentificacionPeligro(int _id_identificacion_peligro)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<identificacion_peligro> consulta = new List<identificacion_peligro>();
            consulta = contexto.identificacion_peligro.Where(x => x.id_identificacion_peligro == _id_identificacion_peligro).ToList();

            return consulta;
        }
        public static List<identificacion_puesto> IdentificacionPuesto(int _id_ide_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<identificacion_puesto> consulta = new List<identificacion_puesto>();
            consulta = contexto.identificacion_puesto.Where(x => x.id_ide_puesto == _id_ide_puesto).ToList();

            return consulta;
        }
        public static List<evaluacion_riesgo> EvaluacionRiesgo(int _id_eva_riesgo)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<evaluacion_riesgo> consulta = new List<evaluacion_riesgo>();
            consulta = contexto.evaluacion_riesgo.Where(x => x.id_evaluacion_riesgo == _id_eva_riesgo).ToList();

            return consulta;
        }
        #endregion

        #region respuestas y preguntas

        public static List<Pregunta> Pregunta(int _id_pregunta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<Pregunta>();
            consulta = contexto.Pregunta.Where(x => x.id_pregunta == _id_pregunta).ToList();
            return consulta;
        }

        public static List<Respuesta> Respuesta(int _id_respuesta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<Respuesta>();
            consulta = contexto.Respuesta.Where(x => x.id_respuesta == _id_respuesta).ToList();
            return consulta;
        }

        #endregion

        public static perfil_cargo PerfilCargo(int _id_perfil)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            return contexto.perfil_cargo.Where(x => x.id_perfil_cargo == _id_perfil).SingleOrDefault();
        }
    }
}