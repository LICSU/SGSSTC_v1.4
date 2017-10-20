using Capa_Datos.Manager.CodigoCiiu;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos
{
    public class Tabla
    {
        public Tabla()
        {
            //
            // TODO: Add constructor logic here
            //
        }





        #region acta reunion copasst
        public static void ReunionCopasst(GridView GridView1, int _id_empresa, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.sucursal.id_empresa == _id_empresa && I.tipo == "ReunionCopasst"
                select new
                {
                    I.id_documento,
                    I.ruta,
                    I.id_tabla,
                    sucursal = I.sucursal.nombre,
                    archivo = I.nombre == null ? "No se ha subido" : "" + I.nombre
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region objetivos sg-sst
        public static void objetivosSgsst(GridView GridView1, int _id_empresa, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.sucursal.id_empresa == _id_empresa && I.tipo == "ObjetivosSGSST"
                select new
                {
                    I.id_documento,
                    I.ruta,
                    I.id_tabla,
                    sucursal = I.sucursal.nombre,
                    archivo = I.nombre == null ? "No se ha subido" : "" + I.nombre
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region modulo desc socio
        public static void DescSocio(GridView GridView1, string _where = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from DS in contexto.desc_socio
                    select new
                    {
                        DS.trabajador.cedula,
                        DS.id_desc_socio,
                        empresa = DS.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                        nombres = DS.trabajador.primer_nombre + " " + DS.trabajador.primer_apellido
                    }).ToList();

            if (_where != string.Empty) { query = query.Where(x => x.cedula.Contains(_where)).ToList(); }
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region examen laboral
        public static void HC_Trabajador(
            GridView GridView1,
            string _id_trabajador = "",
            int _id_empresa = 0,
            string _id_tipo = "",
            string _fecha_inicio = "",
            string _fecha_fin = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from HC in contexto.historia_clinica_ocupacional
                    select new
                    {
                        HC.id_his_cli_ocu,
                        HC.fecha,
                        HC.id_trabajador,
                        Empresa = HC.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                        id_empresa = HC.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa,
                        HC.diagnostico,
                        HC.recomendaciones,
                        HC.doc_esc_medico,
                        HC.doc_esc_paciente,
                        HC.id_tipo_exa,
                        trabajador = HC.trabajador.primer_nombre + " " + HC.trabajador.primer_apellido,
                        tipo_exa = HC.tipo_examen.nombre,
                        id_tipo = HC.tipo_examen.id_tipo_exa,
                        fecha_exa = HC.fecha
                    }).ToList();

            if (_id_trabajador != string.Empty) { query = query.Where(x => x.id_trabajador == Convert.ToInt32(_id_trabajador)).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_tipo != string.Empty) { query = query.Where(x => x.id_tipo == Convert.ToInt32(_id_tipo)).ToList(); }
            if (_fecha_inicio != string.Empty) { query = query.Where(x => x.fecha_exa >= Convert.ToDateTime(_fecha_inicio)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_exa <= Convert.ToDateTime(_fecha_fin)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void HC_HistoriaClinica(
            GridView GridView1,
            string tabla,
            int _id_empresa = 0,
            string _id_tipo_exa = "",
            string _fecha_ini = "",
            string _fecha_fin = "",
            string _trabajador = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from HC in contexto.historia_clinica_ocupacional
                    select new
                    {
                        Empresa = HC.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa,
                        HC.diagnostico,
                        HC.recomendaciones,
                        HC.doc_esc_medico,
                        HC.doc_esc_paciente,
                        HC.id_tipo_exa,
                        trabajador = HC.trabajador.primer_nombre + " " + HC.trabajador.primer_apellido,
                        tipo_exa = HC.tipo_examen.nombre,
                        fecha_exa = HC.fecha
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.Empresa == _id_empresa).ToList(); }
            if (_id_tipo_exa != string.Empty) { query = query.Where(x => x.id_tipo_exa == Convert.ToInt32(_id_tipo_exa)).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha_exa >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_exa <= Convert.ToDateTime(_fecha_fin)).ToList(); }
            if (_trabajador != string.Empty) { query = query.Where(x => x.trabajador.Contains(_trabajador)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        #endregion

        #region gestion de datos
        
        public static void Extintores(GridView GridView1, int id_empresa = 0, int id_sucursal = 0, string id_area = "0", string buscar = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
            from E in contexto.extintor
            select new
            {
                E.id_extintor,
                E.serial_extintor,
                E.fecha_proxima_recarga,
                E.fecha_ultima_recarga,
                area = E.area.nombre,
                E.area.sucursal.empresa.id_empresa,
                E.area.sucursal.id_sucursal,
                E.id_area,
                E.nombre_empresa
            }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal != 0) { query = query.Where(x => x.id_sucursal == id_sucursal).ToList(); }
            if (id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(id_area)).ToList(); }
            if (buscar != string.Empty) { query = query.Where(x => x.serial_extintor.ToLower().Contains(buscar.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();

        }
        public static void Senalizacion(GridView GridView1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            GridView1.DataSource = contexto.senalizacion.ToList();
            GridView1.DataBind();
        }

        #endregion

        #region gestion laboral
        public static void GestionLaboral(GridView GridView1,int _id_empresa = 0,int _id_sucursal = 0,int _tipo_gestion = 0,string _fecha_ini = "",string _fecha_fin = "",string _descripcion = "",int _id_usuario = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from GL in contexto.gestion_laboral
                    orderby GL.fecha
                    select new
                    {
                        GL.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        empresa = GL.usuario.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                        GL.id_ges_lab,
                        GL.fecha,
                        GL.descripcion,
                        soporte = GL.soporte == "" ? "Sin Comunicado" : GL.soporte,
                        GL.id_usuario,
                        GL.usuario.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                        Responsable = (from US in contexto.usuario where US.id_usuario == GL.id_usuario select US.login).FirstOrDefault(),
                        tipo = GL.tipo_gestion
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_usuario != 0) { query = query.Where(x => x.id_usuario == _id_usuario).ToList(); }
            if (_tipo_gestion != 0) { query = query.Where(x => x.tipo == _tipo_gestion).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fecha_fin)).ToList(); }
            if (_descripcion != string.Empty) { query = query.Where(x => x.descripcion.ToLower().Contains(_descripcion.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region obligaciones
        public static void Obligaciones(
            GridView GridView1, int _id_empresa = 0, int _id_responsable = 0, int _id_categoria = 0, string _prioridad = "",
            string _estatus = "", string _fecha_ini = "", string _fecha_fin = "", string _descripcion = "", int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                    from OB in contexto.obligacion
                    select new
                    {
                        OB.acciones,
                        id_estatus = OB.estatus_obl,
                        id_frecuencia = OB.id_frecuencia_con,
                        OB.prioridad,
                        id_categoria = OB.id_categorias,
                        OB.usuario.trabajador.puesto_trabajo.area.id_sucursal,
                        OB.id_obligacion,
                        OB.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        OB.id_responsable,
                        empresa = OB.usuario.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                        OB.descripcion,
                        OB.fecha_entrega,
                        responsable = OB.usuario.login,
                        estatus = OB.estatus_obl,
                        categoria = OB.categoria.nombre
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_responsable != 0) { query = query.Where(x => x.id_responsable == Convert.ToInt32(_id_responsable)).ToList(); }
            if (_id_categoria != 0) { query = query.Where(x => x.id_categoria == Convert.ToInt32(_id_categoria)).ToList(); }
            if (_prioridad != string.Empty) { query = query.Where(x => x.prioridad == _prioridad).ToList(); }
            if (_estatus != string.Empty) { query = query.Where(x => x.id_estatus == _estatus).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha_entrega >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_entrega <= Convert.ToDateTime(_fecha_fin)).ToList(); }
            if (_descripcion != string.Empty) { query = query.Where(x => x.descripcion.ToLower().Contains(_descripcion.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }


        #endregion

        #region plan trabajo
        public static void PlanTrabajo(GridView GridView1, int _id_sucursal, int _anho = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CA in contexto.plan_trabajo
                where CA.usuario.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal
                orderby CA.semana_ini
                select new
                {
                    CA.id_plan_trabajo,
                    CA.usuario.trabajador.puesto_trabajo.area.id_sucursal,
                    CA.anho,
                    actividad = CA.nombre,
                    objetivo = CA.objetivos,
                    nombreResp = CA.usuario.login,
                    CA.recursos_aprobados,
                    sem1 = (CA.semana_ini <= 1 && CA.semana_fin >= 1) ? " " : "",
                    sem2 = (CA.semana_ini <= 2 && CA.semana_fin >= 2) ? " " : "",
                    sem3 = (CA.semana_ini <= 3 && CA.semana_fin >= 3) ? " " : "",
                    sem4 = (CA.semana_ini <= 4 && CA.semana_fin >= 4) ? " " : "",
                    sem5 = (CA.semana_ini <= 5 && CA.semana_fin >= 5) ? " " : "",
                    sem6 = (CA.semana_ini <= 6 && CA.semana_fin >= 6) ? " " : "",
                    sem7 = (CA.semana_ini <= 7 && CA.semana_fin >= 7) ? " " : "",
                    sem8 = (CA.semana_ini <= 8 && CA.semana_fin >= 8) ? " " : "",
                    sem9 = (CA.semana_ini <= 9 && CA.semana_fin >= 9) ? " " : "",
                    sem10 = (CA.semana_ini <= 10 && CA.semana_fin >= 10) ? " " : "",
                    sem11 = (CA.semana_ini <= 11 && CA.semana_fin >= 11) ? " " : "",
                    sem12 = (CA.semana_ini <= 12 && CA.semana_fin >= 12) ? " " : "",
                    sem13 = (CA.semana_ini <= 13 && CA.semana_fin >= 13) ? " " : "",
                    sem14 = (CA.semana_ini <= 14 && CA.semana_fin >= 14) ? " " : "",
                    sem15 = (CA.semana_ini <= 15 && CA.semana_fin >= 15) ? " " : "",
                    sem16 = (CA.semana_ini <= 16 && CA.semana_fin >= 16) ? " " : "",
                    sem17 = (CA.semana_ini <= 17 && CA.semana_fin >= 17) ? " " : "",
                    sem18 = (CA.semana_ini <= 18 && CA.semana_fin >= 18) ? " " : "",
                    sem19 = (CA.semana_ini <= 19 && CA.semana_fin >= 19) ? " " : "",
                    sem20 = (CA.semana_ini <= 20 && CA.semana_fin >= 20) ? " " : "",
                    sem21 = (CA.semana_ini <= 21 && CA.semana_fin >= 21) ? " " : "",
                    sem22 = (CA.semana_ini <= 22 && CA.semana_fin >= 22) ? " " : "",
                    sem23 = (CA.semana_ini <= 23 && CA.semana_fin >= 23) ? " " : "",
                    sem24 = (CA.semana_ini <= 24 && CA.semana_fin >= 24) ? " " : "",
                    sem25 = (CA.semana_ini <= 25 && CA.semana_fin >= 25) ? " " : "",
                    sem26 = (CA.semana_ini <= 26 && CA.semana_fin >= 26) ? " " : "",
                    sem27 = (CA.semana_ini <= 27 && CA.semana_fin >= 27) ? " " : "",
                    sem28 = (CA.semana_ini <= 28 && CA.semana_fin >= 28) ? " " : "",
                    sem29 = (CA.semana_ini <= 29 && CA.semana_fin >= 29) ? " " : "",
                    sem30 = (CA.semana_ini <= 30 && CA.semana_fin >= 30) ? " " : "",
                    sem31 = (CA.semana_ini <= 31 && CA.semana_fin >= 31) ? " " : "",
                    sem32 = (CA.semana_ini <= 32 && CA.semana_fin >= 32) ? " " : "",
                    sem33 = (CA.semana_ini <= 33 && CA.semana_fin >= 33) ? " " : "",
                    sem34 = (CA.semana_ini <= 34 && CA.semana_fin >= 34) ? " " : "",
                    sem35 = (CA.semana_ini <= 35 && CA.semana_fin >= 35) ? " " : "",
                    sem36 = (CA.semana_ini <= 36 && CA.semana_fin >= 36) ? " " : "",
                    sem37 = (CA.semana_ini <= 37 && CA.semana_fin >= 37) ? " " : "",
                    sem38 = (CA.semana_ini <= 38 && CA.semana_fin >= 38) ? " " : "",
                    sem39 = (CA.semana_ini <= 39 && CA.semana_fin >= 39) ? " " : "",
                    sem40 = (CA.semana_ini <= 40 && CA.semana_fin >= 40) ? " " : "",
                    sem41 = (CA.semana_ini <= 41 && CA.semana_fin >= 41) ? " " : "",
                    sem42 = (CA.semana_ini <= 42 && CA.semana_fin >= 42) ? " " : "",
                    sem43 = (CA.semana_ini <= 43 && CA.semana_fin >= 43) ? " " : "",
                    sem44 = (CA.semana_ini <= 44 && CA.semana_fin >= 44) ? " " : "",
                    sem45 = (CA.semana_ini <= 45 && CA.semana_fin >= 45) ? " " : "",
                    sem46 = (CA.semana_ini <= 46 && CA.semana_fin >= 46) ? " " : "",
                    sem47 = (CA.semana_ini <= 47 && CA.semana_fin >= 47) ? " " : "",
                    sem48 = (CA.semana_ini <= 48 && CA.semana_fin >= 48) ? " " : "",
                    sem49 = (CA.semana_ini <= 49 && CA.semana_fin >= 49) ? " " : "",
                    sem50 = (CA.semana_ini <= 50 && CA.semana_fin >= 50) ? " " : "",
                    sem51 = (CA.semana_ini <= 51 && CA.semana_fin >= 51) ? " " : "",
                    sem52 = (CA.semana_ini <= 52 && CA.semana_fin >= 52) ? " " : ""
                }).ToList();

            if (_anho != 0) { query = query.Where(x => x.anho == Convert.ToInt32(_anho)).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }
        #endregion

        #region vigilancia epidemiologica
        public static void vigilancia_epidemiologica(
            GridView GridView1,
            int _id_empresa = 0,
            int _id_sucursal = 0,
            string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from AT in contexto.documento
                where AT.tipo == "VigilanciaEpidemiologica"
                select new
                {
                    AT.id_documento,
                    AT.id_tabla,
                    AT.sucursal.id_empresa,
                    Sucursal = AT.sucursal.nombre,
                    Empresa = AT.sucursal.empresa.nombre,
                    AT.ruta,
                    AT.nombre
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_nombre != "") { query = query.Where(x => x.nombre.ToUpper().Contains(_nombre.ToUpper())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region analisis vulnerabilidad
        public static void analisis_vulnerabilidad(GridView GridView1, int _id_empresa = 0, int _id_sucursal = 0, string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                    from AT in contexto.documento
                    where AT.tipo == "AnalisisVulnerabilidad"
                    select new
                    {
                        AT.id_documento,
                        AT.id_tabla,
                        Sucursal = AT.sucursal.nombre,
                        Empresa = AT.sucursal.empresa.nombre,
                        AT.sucursal.id_empresa,
                        AT.ruta,
                        AT.nombre
                    }).ToList();


            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (nombre != "") { query = query.Where(x => x.nombre.ToLower().Contains(nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();

        }
        #endregion

        #region reportes
        public static void reportes(
            GridView GridView1,
            string _tipo = "Rep",
            int _id_empresa = 0,
            int _id_sucursal = 0,
            string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.tipo.Contains(_tipo)
                select new
                {
                    I.id_documento,
                    I.id_tabla,
                    sucursal = I.sucursal.nombre,
                    empresa = I.sucursal.empresa.nombre,
                    I.sucursal.id_empresa,
                    I.ruta,
                    I.nombre,
                    I.fecha_subida,
                    I.tipo
                }).ToList();

            if (_tipo != "Rep") { query = query.Where(x => x.tipo.ToLower().Contains(_tipo.ToLower())).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (nombre != "") { query = query.Where(x => x.nombre.ToUpper().Contains(nombre.ToUpper())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region epp
        public static void TipoEpp(GridView GridView1, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CT in contexto.tipo_epp
                select new
                {
                    CT.nombre,
                    CT.id_tipo_epp,
                    CT.nombre_senal,
                    CT.url_senal
                }).ToList();

            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void Epp(GridView GridView1,string _id_tipo = "",string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from _EPP in contexto.epp
                orderby _EPP.nombre
                select new
                {
                    _EPP.id_epp,
                    nombre = _EPP.nombre.ToUpper(),
                    _EPP.id_tipo_epp,
                    tipo = _EPP.tipo_epp.nombre,
                    _EPP.marca_modelo,
                    _EPP.uso,
                    _EPP.url_imagen
                }).ToList();

            if (_id_tipo != string.Empty) { query = query.Where(x => x.id_tipo_epp == Convert.ToInt32(_id_tipo)).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region politica sst
        public static void PoliticaSST_empresa(GridView GridView1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.politica_sst
                where I.id_empresa == _id_empresa
                select new
                {
                    I.id_politica,
                    I.ruta,
                    I.anho,
                    archivo = I.nombre_archivo == null ? "No se ha subido" : "" + I.nombre_archivo,
                    empresa = I.empresa.nombre
                }).ToList();

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void PoliticaSST_todos(GridView GridView1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.politica_sst
                select new
                {
                    I.id_politica,
                    I.ruta,
                    I.anho,
                    I.nombre_archivo,
                    empresa = I.empresa.nombre
                }).ToList();

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Encuesta_PoliticaSST(
            GridView GridView1,
            int _id_empresa,
            int _id_sucursal = 0,
            int _id_trabajador = 0,
            string tipo = "",
            string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CT in contexto.encuesta_politica
                select new
                {
                    CT.id_encuesta,
                    CT.id_trabajador,
                    NomTrabajador = CT.trabajador.primer_nombre + " " + CT.trabajador.primer_apellido,
                    CT.trabajador.puesto_trabajo.area.id_sucursal,
                    CT.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                    sucursal = CT.trabajador.puesto_trabajo.area.sucursal.nombre,
                    CT.si,
                    CT.no,
                    archivo = CT.ruta == null ? "No Tiene Soporte" : "Si tiene Soporte",
                    CT.ruta,
                    CT.tipo
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_trabajador != 0) { query = query.Where(x => x.id_trabajador == _id_trabajador).ToList(); }
            if (nombre != "") { query = query.Where(x => x.NomTrabajador.ToUpper().Contains(nombre.ToUpper())).ToList(); }
            if (tipo != "") { query = query.Where(x => x.tipo == tipo).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void Comunicado_PoliticaSST(
            GridView GridView1,
            int _id_empresa,
            int _id_sucursal = 0,
            int _id_trabajador = 0,
            string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CT in contexto.documento
                where CT.tipo == "ComunicacionPolitica"
                select new
                {
                    CT.id_documento,
                    CT.nombre,
                    CT.id_tabla,
                    NomTrabajador = CT.trabajador.primer_nombre + " " + CT.trabajador.primer_apellido,
                    CT.trabajador.puesto_trabajo.area.id_sucursal,
                    CT.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                    sucursal = CT.trabajador.puesto_trabajo.area.sucursal.nombre,
                    CT.ruta
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_trabajador != 0) { query = query.Where(x => x.id_tabla == _id_trabajador).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        #endregion
        

        #region recursos economicos
        public static void RecursosEconomicos(GridView GridView1, int _id_empresa, int _id_sucursal = 0, string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.sucursal.id_empresa == _id_empresa && I.tipo == "RecursosEconomicos"
                select new
                {
                    I.id_documento,
                    I.ruta,
                    I.id_tabla,
                    sucursal = I.sucursal.nombre,
                    archivo = I.nombre == null ? "No se ha subido" : "" + I.nombre,
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }
            if (nombre != "") { query = query.Where(x => x.archivo.ToUpper().Contains(nombre.ToUpper())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region entrega epp
        public static void entrega_epp(GridView GridView1, string _id_empresa = "", string _id_sucursal = "", string _nombre = "", int _id_trabajador = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.tipo == "EntregaEpp"
                select new
                {
                    I.id_documento,
                    I.id_tabla,
                    I.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa,
                    I.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                    sucursal = I.trabajador.puesto_trabajo.area.sucursal.nombre,
                    empresa = I.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                    I.ruta,
                    I.nombre,
                    trabajador = I.trabajador.primer_nombre + " " + I.trabajador.primer_apellido,
                    id_trabajador = I.trabajador.id_trabajador,
                    I.fecha_subida
                }).ToList();

            if (_id_sucursal != "") { query = query.Where(x => x.id_sucursal == Convert.ToInt32(_id_sucursal)).ToList(); }
            if (_id_empresa != "") { query = query.Where(x => x.id_empresa == Convert.ToInt32(_id_empresa)).ToList(); }
            if (_nombre != "") { query = query.Where(x => x.nombre.ToUpper().Contains(_nombre.ToUpper())).ToList(); }
            if (_id_trabajador != 0) { query = query.Where(x => x.id_trabajador == _id_trabajador).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region preguntas y respuestas

        public static void MisPreguntas(GridView GridView1, int _id_usuario, string _fecha_ini = "", string _fecha_fin = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from PR in contexto.Pregunta
                where PR.id_usuario == _id_usuario
                select new
                {
                    PR.id_pregunta,
                    PR.titulo,
                    PR.cuerpo_pregunta,
                    PR.id_usuario,
                    PR.fecha
                }).ToList();

            if (_fecha_ini != "") { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != "") { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fecha_fin)).ToList(); }


            GridView1.DataSource = query;

            GridView1.DataBind();
        }

        public static void SusPreguntas(GridView GridView1, int Id_empresa, string _fecha_ini = "", string _fecha_fin = "",
            int _id_rol = 0, int _id_clase = 0, int _id_division = 0,int _id_seccion = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<empresa_itemdivision> consulta = new List<empresa_itemdivision>();
            consulta = Mgr_CodigoCiiu.CodigoCiiu_Empresa(Id_empresa);

            int act1 = 0, act2 = 0, act3 = 0, cont = 0;
            foreach (var item in consulta)
            {
                cont++;
                if (cont == 1) { act1 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 2) { act2 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 3) { act3 = Convert.ToInt32(item.id_clase_ciiu); }
            }


            var query = (
                from PR in contexto.Pregunta
                join EC in contexto.empresa_itemdivision
                on PR.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa equals EC.id_empresa
                where EC.id_clase_ciiu == act1 || EC.id_clase_ciiu == act2 || EC.id_clase_ciiu == act3

                select new
                {
                    PR.id_pregunta,
                    PR.titulo,
                    PR.cuerpo_pregunta,
                    PR.id_usuario,
                    PR.usuario.id_rol,
                    EC.id_clase_ciiu,
                    EC.claseCiiu.grupoCiiu.id_division,
                    EC.claseCiiu.grupoCiiu.divisionCiiu.id_seccion,
                    PR.fecha
                }).ToList();

            if (_fecha_ini != "") { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != "") { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fecha_fin)).ToList(); }
            if (_id_rol != 0) { query = query.Where(x => x.id_rol == _id_rol).ToList(); }
            if (_id_clase != 0) { query = query.Where(x => x.id_clase_ciiu == _id_clase).ToList(); }
            if (_id_division != 0) { query = query.Where(x => x.id_division == _id_division).ToList(); }
            if (_id_seccion != 0) { query = query.Where(x => x.id_seccion == _id_seccion).ToList(); }

            var Distinto = query.Distinct().ToList();

            GridView1.DataSource = Distinto;
            GridView1.DataBind();
        }


        #endregion

        #region PerfilCargo
        public static void PerfilCargo(GridView GridView1, int id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CA in contexto.perfil_cargo
                select new
                {
                    CA.id_perfil_cargo,
                    CA.nombre,
                    CA.id_empresa,
                    CA.descripcion,
                    empresa = CA.empresa.nombre,
                    ocupacion = CA.cno.ocupacion
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region PerfilMedico
        public static void PerfilMedico(GridView GridView1, int id_empresa = 0, int id_cargo = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from PM in contexto.perfil_medico
                select new
                {
                    PM.id_perfil_medico,
                    PM.nombre,
                    PM.id_empresa,
                    PM.descripcion,
                    PM.id_cargo,
                    PM.ruta,
                    empresa = PM.perfil_cargo.empresa.nombre,
                    cargo = PM.perfil_cargo.nombre
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_cargo != 0) { query = query.Where(x => x.id_cargo == id_cargo).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion
        

    }
}