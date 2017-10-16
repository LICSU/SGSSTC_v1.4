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

        #region modulos accidentes laborales
        public static void Accidente_General(
            GridView GridView1,
            int _id_empresa = 0,
            int _id_sucursal = 0,
            string _id_area = "0",
            string _search = "",
            string _fecha_ini = "",
            string _fecha_fin = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AC in contexto.at_it_el_pa
                    where AC.tipo_evento == "1"
                    select new
                    {
                        AC.id_at_it_el_pa,
                        AC.id_area,
                        fecha_acc = AC.fecha_accidente,
                        AC.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        Afectado = AC.trabajador.primer_nombre + " " + AC.trabajador.primer_apellido,
                        area = AC.area.nombre != "0" ? "Ninguna" : " " + AC.area.nombre,
                        id_sucursal = AC.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                        consulta = AC.num_consultas != null ? "Con Consulta" : "Sin Consulta",
                        AC.reporte_accidente,
                        AC.documento_comunicado,
                        posee = AC.investigacion_ac_in.Count != 0 ? "SI" : "NO"
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(_id_area)).ToList(); }
            if (_search != string.Empty) { query = query.Where(x => x.Afectado == _search).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha_acc >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_acc <= Convert.ToDateTime(_fecha_fin)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void Incidente_General(
            GridView GridView1,
            int _id_empresa = 0,
            int _id_sucursal = 0,
            string _id_area = "0",
            string _search = "",
            string _fecha_ini = "",
            string _fecha_fin = "")
        {

            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AC in contexto.at_it_el_pa
                    where AC.tipo_evento == "2"
                    select new
                    {
                        AC.id_at_it_el_pa,
                        AC.id_area,
                        fecha_acc = AC.fecha_accidente,
                        AC.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        Afectado = AC.trabajador.primer_nombre + " " + AC.trabajador.primer_apellido,
                        area = AC.area.nombre != "0" ? "Ninguna" : " " + AC.area.nombre,
                        id_sucursal = AC.trabajador.puesto_trabajo.area.sucursal.id_sucursal,
                        consulta = AC.num_consultas != null ? "Con Consulta" : "Sin Consulta",
                        AC.reporte_accidente,
                        AC.documento_comunicado,
                        posee = AC.investigacion_ac_in.Count != 0 ? "SI" : "NO"
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(_id_area)).ToList(); }
            if (_search != string.Empty) { query = query.Where(x => x.Afectado == _search).ToList(); }
            if (_fecha_ini != string.Empty) { query = query.Where(x => x.fecha_acc >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != string.Empty) { query = query.Where(x => x.fecha_acc <= Convert.ToDateTime(_fecha_fin)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region alarma
        public static void Alarma(
            GridView GridView1,
            string _prioridad = "",
            string _id_categorias = "",
            string _fechaIni = "",
            string _fechaFin = "",
            string _descripcion = "",
            int _id_empresa = 0,
            int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AL in contexto.alarma
                    orderby AL.fecha
                    select new
                    {
                        AL.id_alarmas,
                        AL.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        AL.usuario.trabajador.puesto_trabajo.area.id_sucursal,
                        AL.id_categorias,
                        AL.prioridad,
                        AL.id_usuario,
                        AL.descripcion,
                        AL.fecha,
                        categoria_id = AL.categoria.id_categorias,
                        categoria = AL.categoria.nombre
                    }).ToList();

            if (_prioridad != string.Empty) { query = query.Where(x => x.prioridad == _prioridad).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_categorias != string.Empty) { query = query.Where(x => x.id_categorias == Convert.ToInt32(_id_categorias)).ToList(); }
            if (_fechaIni != string.Empty) { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fechaIni)).ToList(); }
            if (_fechaFin != string.Empty) { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fechaFin)).ToList(); }
            if (_descripcion != string.Empty) { query = query.Where(x => x.descripcion.ToLower().Contains(_descripcion.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        #endregion

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
        public static void Area_General(
            GridView GridView1,
            int _id_empresa = 0,
            int _id_sucursal = 0,
            string _nivel = "",
            string _NumTrab_ini = "",
            string _NumTrab_fin = "",
            string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AR in contexto.area
                    orderby AR.id_sucursal, AR.id_area
                    select new
                    {
                        AR.id_area,
                        AR.id_area_padre,
                        Nombre_Area = AR.nombre,
                        Area_Padre = AR.id_area_padre == 0 ? "Ninguno" : (from AR1 in contexto.area where AR1.id_area == AR.id_area_padre select AR1.nombre).FirstOrDefault(),
                        nivel1 = AR.nivel == 1 ? "" + AR.nivel : "---",
                        nivel2 = AR.nivel == 2 ? "" + AR.nivel : "---",
                        nivel3 = AR.nivel == 3 ? "" + AR.nivel : "---",
                        nivel4 = AR.nivel == 4 ? "" + AR.nivel : "---",
                        AR.nivel,
                        AR.id_sucursal,
                        AR.sucursal.empresa.id_empresa,
                        empresa = AR.sucursal.empresa.nombre,
                        empresa_id = AR.sucursal.empresa.id_empresa,
                        sucursal = (from EM in contexto.sucursal where EM.id_sucursal == AR.id_sucursal select EM.nombre).FirstOrDefault(),
                        NumTrab = (from TB in contexto.trabajador where TB.puesto_trabajo.id_area == AR.id_area select TB.id_trabajador).Count()
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_nivel != string.Empty) { query = query.Where(x => x.nivel == Convert.ToInt32(_nivel)).ToList(); }
            if (_NumTrab_ini != string.Empty) { query = query.Where(x => x.NumTrab >= Convert.ToInt32(_NumTrab_ini) && x.NumTrab < Convert.ToInt32(_NumTrab_fin)).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.Nombre_Area.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void Rol(GridView GridView1, int id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from RO in contexto.rol
                select new
                {
                    RO.id_rol,
                    RO.nombre,
                    RO.id_empresa,
                    empresa = RO.empresa.nombre
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }

        public static void Categorias(GridView GridView1, int id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CA in contexto.categoria
                select new
                {
                    CA.id_categorias,
                    CA.nombre,
                    CA.id_empresa,
                    CA.descripcion,
                    empresa = CA.empresa.nombre
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }

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

        public static void Empresa(GridView GridView1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            GridView1.DataSource = contexto.empresa.ToList();
            GridView1.DataBind();
        }

        public static void Senalizacion(GridView GridView1)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            GridView1.DataSource = contexto.senalizacion.ToList();
            GridView1.DataBind();
        }

        public static void Estatus(
            GridView GridView1,
            int _id_sucursal = 0,
            string _id_area = "0",
            string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.puesto_trabajo
                    select new
                    {
                        CT.id_puesto_trabajo,
                        CT.nombre,
                        CT.descripcion,
                        CT.area.sucursal.id_sucursal,
                        CT.id_area,
                        Area = CT.area.nombre,
                        Num = (from TB in contexto.trabajador where TB.id_puesto_trabajo == CT.id_puesto_trabajo select TB.id_trabajador).Count(),
                        Sucursal = CT.area.sucursal.nombre
                    }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(_id_area)).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void Estatus(GridView GridView1, int id_empresa = 0, string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.estatus
                    select new
                    {
                        CT.id_empresa,
                        CT.id_estatus,
                        CT.nombre,
                        CT.descripcion,
                        Empresa = CT.empresa.nombre == null ? "GrupoLi" : CT.empresa.nombre
                    }).ToList();

            if (nombre != string.Empty)
            {
                query = query.Where(x => x.nombre.ToLower().Contains(nombre.ToLower())
                || x.descripcion.ToLower().Contains(nombre.ToLower())).ToList();
            }

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa || x.id_empresa == 1).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }
        public static void Horario(GridView GridView1, int _id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                from CT in contexto.horario
                select new
                {
                    CT.fecha_inicio,
                    CT.fecha_fin,
                    CT.id_horario,
                    CT.id_empresa,
                    horario = CT.fecha_inicio + " - " + CT.fecha_fin,
                    empresa = CT.empresa.nombre,
                    CT.nombre,
                    num_trab = (from TB in contexto.trabajador where TB.id_horario == CT.id_horario select TB.id_trabajador).Count()
                }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void PuestoTrabajo(
            GridView GridView1,
            int empresa = 0,
            int sucursal = 0,
            string area = "0",
            string num1 = "",
            string num2 = "",
            string sWhere = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.puesto_trabajo
                    orderby CT.area.id_sucursal, CT.id_puesto_trabajo
                    select new
                    {
                        CT.id_puesto_trabajo,
                        CT.nombre,
                        CT.descripcion,
                        id_sucursal = CT.area.sucursal.id_sucursal,
                        id_area = CT.id_area,
                        Empresa = CT.area.sucursal.empresa.nombre,
                        id_empresa = CT.area.sucursal.empresa.id_empresa,
                        Area = CT.area.nombre,
                        Num = (from TB in contexto.trabajador
                               where TB.id_puesto_trabajo == CT.id_puesto_trabajo
                               && TB.id_estatus_actual == 1
                               select TB.id_trabajador).Count(),
                        Sucursal = CT.area.sucursal.nombre
                    }).ToList();

            if (empresa != 0) { query = query.Where(x => x.id_empresa == empresa).ToList(); }
            if (sucursal != 0) { query = query.Where(x => x.id_sucursal == sucursal).ToList(); }
            if (area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(area)).ToList(); }
            if (num1 != string.Empty) { query = query.Where(x => x.Num >= Convert.ToInt32(num1) && x.Num < Convert.ToInt32(num2)).ToList(); }
            if (sWhere != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(sWhere.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void Sucursal(
            GridView GridView1,
            int miSucursal,
            int id_empresa = 0,
            int id_sucursal = 0,
            string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                from SC in contexto.sucursal
                where SC.id_sucursal != miSucursal
                select new
                {
                    SC.id_sucursal,
                    SC.nombre,
                    SC.id_empresa,
                    empresa = SC.empresa.nombre,
                    NumTrab = (from TB in contexto.trabajador where TB.puesto_trabajo.area.id_sucursal == SC.id_sucursal select TB.id_trabajador).Count()
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal != 0) { query = query.Where(x => x.id_sucursal == id_sucursal).ToList(); }
            if (nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void Trabajador(
            GridView GridView1,
            int MiTrabajador = 0,
            int _id_empresa = 0,
            string _id_area = "0",
            string _id_estatus_actual = "",
            string buscar = "",
            int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.trabajador
                    where CT.id_trabajador != MiTrabajador
                    join ES in contexto.estatus on CT.id_estatus_actual equals ES.id_estatus
                    select new
                    {
                        CT.id_trabajador,
                        CT.puesto_trabajo.area.id_sucursal,
                        CT.cedula,
                        CT.id_estatus_actual,
                        nombres = CT.primer_nombre + " " + CT.segundo_nombre,
                        apellidos = CT.primer_apellido + " " + CT.segundo_apellido,
                        CT.puesto_trabajo.id_area,
                        area = CT.puesto_trabajo.area.nombre,
                        empresa = CT.puesto_trabajo.area.sucursal.empresa.id_empresa,
                        Nomestatus = CT.id_estatus_actual == 0 ? "Sin estatus" : "" + ES.nombre,
                        estatus = CT.id_estatus_actual,
                        sucursal = CT.puesto_trabajo.area.sucursal.nombre
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.empresa == _id_empresa).ToList(); }

            if (_id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(_id_area)).ToList(); }

            if (_id_estatus_actual != string.Empty) { query = query.Where(x => x.id_estatus_actual == Convert.ToInt32(_id_estatus_actual)).ToList(); }

            if (buscar != string.Empty)
            {
                query = query.Where(x => x.nombres.ToLower().Contains(buscar.ToLower())
                || x.apellidos.ToLower().Contains(buscar.ToLower()) || x.cedula.ToLower().Contains(buscar.ToLower())).ToList();
            }

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void Usuario(
            GridView GridView1,
            int _empresa = 0,
            string _rol = "",
            int _sucursal = 0,
            string _where = "",
            int miUsuario = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.usuario
                    where CT.id_usuario != miUsuario
                    join RL in contexto.rol on CT.id_rol equals RL.id_rol
                    join EM in contexto.trabajador on CT.id_trabajador equals EM.id_trabajador
                    select new
                    {
                        CT.id_usuario,
                        CT.login,
                        CT.clave,
                        CT.id_rol,
                        rol_id = RL.id_rol,
                        rol = RL.nombre,
                        Empresa = EM.puesto_trabajo.area.sucursal.empresa.nombre,
                        Sucursal = EM.puesto_trabajo.area.sucursal.nombre,
                        empresa_id = EM.puesto_trabajo.area.sucursal.empresa.id_empresa,
                        sucursal_id = EM.puesto_trabajo.area.id_sucursal,
                        trabajador_id = EM.id_trabajador
                    }).ToList();

            if (_empresa != 0) { query = query.Where(x => x.empresa_id == Convert.ToInt32(_empresa)).ToList(); }
            if (_rol != string.Empty) { query = query.Where(x => x.rol_id == Convert.ToInt32(_rol)).ToList(); }
            if (_sucursal != 0) { query = query.Where(x => x.sucursal_id == _sucursal).ToList(); }
            if (_where != string.Empty) { query = query.Where(x => x.login.Contains(_where)).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }

        #endregion

        #region gestion laboral
        public static void GestionLaboral(
            GridView GridView1,
            int _id_empresa = 0,
            int _id_sucursal = 0,
            int _tipo_gestion = 0,
            string _fecha_ini = "",
            string _fecha_fin = "",
            string _descripcion = "",
            int _id_usuario = 0)
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

        public static void TrabajadorGestion(GridView GridView1, string _id_trabajador = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from TG in contexto.trabajador_gestion
                    where TG.gestion_laboral.tipo_gestion == 1
                    select new
                    {
                        tipo = TG.gestion_laboral.tipo_gestion,
                        TG.id_trabajador,
                        TG.gestion_laboral.fecha
                    }).ToList();

            if (_id_trabajador != string.Empty) { query = query.Where(x => x.id_trabajador == Convert.ToInt32(_id_trabajador)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region indicadores
        public static void Indicadores(
            GridView GridView1,
            string tabla,
            string par1 = "",
            string par2 = "",
            string par3 = "",
            string par4 = "",
            string par5 = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region general
            if (tabla == "NumArea_Emp_General")
            {
                #region codigo
                var query = (
                    from AR in contexto.area
                    group AR by AR.sucursal.empresa.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumArea_Emp")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.area
                    where AR.sucursal.id_empresa == idEmpresa
                    group AR by AR.sucursal.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumArea_Suc")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.area
                    where AR.id_sucursal == idSucursal
                    group AR by AR.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from TB in contexto.trabajador
                    where TB.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                    group TB by TB.puesto_trabajo.area.sucursal.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            #endregion
            //--------------------------------------------
            #region trabajadores
            else if (tabla == "NumTrab_Suc")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from TB in contexto.trabajador
                    where TB.puesto_trabajo.area.id_sucursal == idSucursal
                    group TB by TB.puesto_trabajo.area.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp_Sexo")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                     from TB in contexto.trabajador
                     where TB.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                     group TB by TB.sexo into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Suc_Sexo")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from TB in contexto.trabajador
                    where TB.puesto_trabajo.area.id_sucursal == idSucursal
                    group TB by TB.sexo into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp_Disc")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                     from TB in contexto.trabajador
                     where TB.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                     group TB by TB.es_discapacitado into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Suc_Disc")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from TB in contexto.trabajador
                    where TB.puesto_trabajo.area.id_sucursal == idSucursal
                    group TB by TB.es_discapacitado into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp_Mcpio")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                     from TB in contexto.trabajador
                     where TB.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                     group TB by TB.municipio.nombre into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Suc_Mcpio")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from TB in contexto.trabajador
                    where TB.puesto_trabajo.area.id_sucursal == idSucursal
                    group TB by TB.municipio.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp_Dpto")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                     from TB in contexto.trabajador
                     where TB.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                     group TB by TB.municipio.departamento.nombre into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Suc_Dpto")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from TB in contexto.trabajador
                    where TB.puesto_trabajo.area.id_sucursal == idSucursal
                    group TB by TB.municipio.departamento.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp_Reg")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                     from TB in contexto.trabajador
                     where TB.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                     group TB by TB.municipio.departamento.Region.nombre into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Suc_Reg")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from TB in contexto.trabajador
                    where TB.puesto_trabajo.area.id_sucursal == idSucursal
                    group TB by TB.municipio.departamento.Region.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp_Est")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                     from TB in contexto.trabajador
                     join ES in contexto.estatus on TB.id_estatus_actual equals ES.id_estatus
                     where TB.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                     group TB by ES.nombre into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Suc_Est")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from TB in contexto.trabajador
                    join ES in contexto.estatus on TB.id_estatus_actual equals ES.id_estatus
                    where TB.puesto_trabajo.area.id_sucursal == idSucursal
                    group TB by ES.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp_Hor")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                     from TB in contexto.trabajador
                     join HR in contexto.horario on TB.id_horario equals HR.id_horario
                     where TB.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                     group TB by HR.nombre into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Suc_Hor")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                     from TB in contexto.trabajador
                     join HR in contexto.horario on TB.id_horario equals HR.id_horario
                     where TB.puesto_trabajo.area.id_sucursal == idSucursal
                     group TB by HR.nombre into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Emp_Estr")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from DC in contexto.desc_socio
                    where DC.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                    group DC by DC.estrato into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumTrab_Suc_Estr")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from DC in contexto.desc_socio
                    where DC.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                    group DC by DC.estrato into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            #endregion
            //--------------------------------------------
            #region puestos de trabajo
            else if (tabla == "NumPue_Emp_Are")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from PU in contexto.puesto_trabajo
                    where PU.area.sucursal.id_empresa == idEmpresa
                    group PU by PU.area.sucursal.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumPue_Suc_Are")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from PU in contexto.puesto_trabajo
                    where PU.area.sucursal.id_sucursal == idSucursal
                    group PU by PU.area.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumPue_Emp_Trab")
            {
                #region codigo
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from PU in contexto.puesto_trabajo
                    where PU.area.sucursal.id_empresa == idEmpresa
                    group PU by PU.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumPue_Suc_Trab")
            {
                #region codigo
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from PU in contexto.puesto_trabajo
                    where PU.area.id_sucursal == idSucursal
                    group PU by PU.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;
                #endregion
            }
            else if (tabla == "NumPue_Emp_Acc")
            {
                #region codigo
                /*int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from AC in contexto.acc_inc_lab
                    where AC.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                    && AC.tipo_acci_inci == 1 && AC.id_puesto_trabajo != 0
                    group AC by AC.puesto_trabajo.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;*/
                #endregion
            }
            else if (tabla == "NumPue_Suc_Acc")
            {
                #region codigo
                /*int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AC in contexto.acc_inc_lab
                    where AC.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                    && AC.tipo_acci_inci == 1 && AC.id_puesto_trabajo != 0
                    group AC by AC.puesto_trabajo.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;*/
                #endregion
            }
            else if (tabla == "NumPue_Emp_Inc")
            {
                #region codigo
                /*int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from AC in contexto.acc_inc_lab
                    where AC.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                    && AC.tipo_acci_inci == 2 && AC.id_puesto_trabajo != 0
                    group AC by AC.puesto_trabajo.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;*/
                #endregion
            }
            else if (tabla == "NumPue_Suc_Inc")
            {
                #region codigo
                /*int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AC in contexto.acc_inc_lab
                    where AC.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                    && AC.tipo_acci_inci == 2 && AC.id_puesto_trabajo != 0
                    group AC by AC.puesto_trabajo.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;*/
                #endregion
            }
            #endregion
            //---------------------------------
            #region area
            else if (tabla == "NumAcc_Emp_Are")
            {
                #region codigo
                /* int idEmpresa = Convert.ToInt32(par1);
                 var query = (
                     from AC in contexto.acc_inc_lab
                     where AC.area.sucursal.id_empresa == idEmpresa
                     && AC.tipo_acci_inci == 1 && AC.id_area != 0
                     group AC by AC.area.nombre into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()

                     }).ToList();

                 GridView1.DataSource = query;*/
                #endregion
            }
            else if (tabla == "NumAcc_Suc_Are")
            {
                #region codigo
                /*int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AC in contexto.acc_inc_lab
                    where AC.area.id_sucursal == idSucursal
                    && AC.tipo_acci_inci == 1 && AC.id_area != 0
                    group AC by AC.area.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;*/
                #endregion
            }
            else if (tabla == "NumInc_Emp_Are")
            {
                #region codigo
                /*int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from AC in contexto.acc_inc_lab
                    where AC.area.sucursal.id_empresa == idEmpresa
                    && AC.tipo_acci_inci == 2 && AC.id_area != 0
                    group AC by AC.area.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;*/
                #endregion
            }
            else if (tabla == "NumInc_Suc_Are")
            {
                #region codigo
                /*int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AC in contexto.acc_inc_lab
                    where AC.area.id_sucursal == idSucursal
                    && AC.tipo_acci_inci == 2 && AC.id_area != 0
                    group AC by AC.area.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()

                    }).ToList();

                GridView1.DataSource = query;*/
                #endregion
            }
            #endregion
            //---------------------------------
            #region gestion laboral
            else if (tabla == "NumGes_Emp")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                     from GS in contexto.gestion_laboral
                     where GS.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                     group GS by (GS.tipo_gestion == 1 ? "Entrega de Equipos" :
                     GS.tipo_gestion == 2 ? "Capacitacion" :
                     GS.tipo_gestion == 3 ? "Jornada de Examenes" : "Act Recreativas") into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()
                     }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "NumGes_Suc")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                     from GS in contexto.gestion_laboral
                     where GS.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                     group GS by (GS.tipo_gestion == 1 ? "Entrega de Equipos" :
                     GS.tipo_gestion == 2 ? "Capacitacion" :
                     GS.tipo_gestion == 3 ? "Jornada de Examenes" : "Act Recreativas") into g
                     select new
                     {
                         name = g.Key,
                         count = g.Count()
                     }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "Asis_Ent_NumGes_Emp")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                      from GS in contexto.trabajador_gestion
                      where GS.gestion_laboral.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                      && GS.gestion_laboral.tipo_gestion == 1
                      group GS by (GS.asistencia == "Si" ? "Si Asistieron" :
                      GS.asistencia == "No" ? "NO Asistieron" : "Sin asignar") into g
                      select new
                      {
                          name = g.Key,
                          count = g.Count()
                      }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "Asis_Ent_NumGes_Suc")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                      from GS in contexto.trabajador_gestion
                      where GS.gestion_laboral.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                      && GS.gestion_laboral.tipo_gestion == 1
                      group GS by (GS.asistencia == "Si" ? "Si Asistieron" :
                      GS.asistencia == "No" ? "NO Asistieron" : "Sin asignar") into g
                      select new
                      {
                          name = g.Key,
                          count = g.Count()
                      }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "Asis_Cap_NumGes_Emp")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                      from GS in contexto.trabajador_gestion
                      where GS.gestion_laboral.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                      && GS.gestion_laboral.tipo_gestion == 2
                      group GS by (GS.asistencia == "Si" ? "Si Asistieron" :
                      GS.asistencia == "No" ? "NO Asistieron" : "Sin asignar") into g
                      select new
                      {
                          name = g.Key,
                          count = g.Count()
                      }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "Asis_Cap_NumGes_Suc")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                      from GS in contexto.trabajador_gestion
                      where GS.gestion_laboral.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                      && GS.gestion_laboral.tipo_gestion == 2
                      group GS by (GS.asistencia == "Si" ? "Si Asistieron" :
                      GS.asistencia == "No" ? "NO Asistieron" : "Sin asignar") into g
                      select new
                      {
                          name = g.Key,
                          count = g.Count()
                      }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "Asis_Jor_NumGes_Emp")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                      from GS in contexto.trabajador_gestion
                      where GS.gestion_laboral.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                      && GS.gestion_laboral.tipo_gestion == 3
                      group GS by (GS.asistencia == "Si" ? "Si Asistieron" :
                      GS.asistencia == "No" ? "NO Asistieron" : "Sin asignar") into g
                      select new
                      {
                          name = g.Key,
                          count = g.Count()
                      }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "Asis_Jor_NumGes_Suc")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                      from GS in contexto.trabajador_gestion
                      where GS.gestion_laboral.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                      && GS.gestion_laboral.tipo_gestion == 3
                      group GS by (GS.asistencia == "Si" ? "Si Asistieron" :
                      GS.asistencia == "No" ? "NO Asistieron" : "Sin asignar") into g
                      select new
                      {
                          name = g.Key,
                          count = g.Count()
                      }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "Asis_Act_NumGes_Emp")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                      from GS in contexto.trabajador_gestion
                      where GS.gestion_laboral.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                      && GS.gestion_laboral.tipo_gestion == 4
                      group GS by (GS.asistencia == "Si" ? "Si Asistieron" :
                      GS.asistencia == "No" ? "NO Asistieron" : "Sin asignar") into g
                      select new
                      {
                          name = g.Key,
                          count = g.Count()
                      }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "Asis_Act_NumGes_Suc")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                      from GS in contexto.trabajador_gestion
                      where GS.gestion_laboral.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                      && GS.gestion_laboral.tipo_gestion == 4
                      group GS by (GS.asistencia == "Si" ? "Si Asistieron" :
                      GS.asistencia == "No" ? "NO Asistieron" : "Sin asignar") into g
                      select new
                      {
                          name = g.Key,
                          count = g.Count()
                      }).ToList();

                GridView1.DataSource = query;
            }
            #endregion
            //---------------------------------
            #region obligaciones
            else if (tabla == "NumObli_Emp_Cat")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.obligacion
                    where AR.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                    group AR by AR.categoria.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()
                    }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "NumObli_Suc_Cat")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.obligacion
                    where AR.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                    group AR by AR.categoria.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()
                    }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "NumObli_Emp_Est")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.obligacion
                    where AR.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                    group AR by AR.estatus_obl into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()
                    }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "NumObli_Suc_Est")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.obligacion
                    where AR.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                    group AR by AR.estatus_obl into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()
                    }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "NumObli_Emp_Frec")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.obligacion
                    where AR.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                    group AR by AR.frecuencia_control.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()
                    }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "NumObli_Suc_Frec")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.obligacion
                    where AR.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                    group AR by AR.frecuencia_control.nombre into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()
                    }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "NumObli_Emp_Prio")
            {
                int idEmpresa = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.obligacion
                    where AR.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa == idEmpresa
                    group AR by AR.prioridad into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()
                    }).ToList();

                GridView1.DataSource = query;
            }
            else if (tabla == "NumObli_Suc_Prio")
            {
                int idSucursal = Convert.ToInt32(par1);
                var query = (
                    from AR in contexto.obligacion
                    where AR.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                    group AR by AR.prioridad into g
                    select new
                    {
                        name = g.Key,
                        count = g.Count()
                    }).ToList();

                GridView1.DataSource = query;
            }
            #endregion

            GridView1.DataBind();
        }
        #endregion

        #region mapa de riesgos
        public static void MapaRiesgos(GridView GridView1, int _id_sucursal = 0, string _buscar = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from PM in contexto.documento
                    where PM.tipo == "MapaRiesgos"
                    select new
                    {
                        PM.id_documento,
                        PM.nombre,
                        PM.ruta,
                        PM.sucursal.id_empresa,
                        PM.sucursal.id_sucursal,
                        Empresa = PM.sucursal.empresa.nombre,
                        Sucursal = PM.sucursal.nombre,
                        PM.id_tabla,
                        PM.fecha_subida
                    }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }
            if (_buscar != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_buscar.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region matriz legal

        public static void MatrizLegal(
            GridView GridView1,
            int _id_sucursal = 0,
            string _tipoMatriz = "",
            string _anho = "",
            string _buscar = "",
            int _id_empresa = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from NS in contexto.norma_sucursal
                select new
                {
                    NS.id_sucursal,
                    NS.id_normas,
                    NS.sucursal.id_empresa,
                    estatus = NS.estatus_norma,
                    Empresa = NS.sucursal.empresa.nombre,
                    Sucursal = NS.sucursal.nombre,
                    NS.norma.documento,
                    NS.norma.literal,
                    NS.norma.anho,
                    NS.norma.tema_especifico,
                    NS.norma.obligaciones,
                    NS.norma.articulo,
                    NS.norma.tipo_matriz
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_tipoMatriz != string.Empty) { query = query.Where(x => x.tipo_matriz.Contains(_tipoMatriz)).ToList(); }
            if (_anho != string.Empty) { query = query.Where(x => x.anho == _anho).ToList(); }
            if (_buscar != string.Empty)
            {
                query = query.Where(x => x.documento.ToLower().Contains(_buscar.ToLower())
                || x.obligaciones.ToLower().Contains(_buscar.ToLower())
                || x.tema_especifico.ToLower().Contains(_buscar.ToLower())
                || x.articulo.ToLower().Contains(_buscar.ToLower())).ToList();
            }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        #endregion

        #region MatrizRiesgos
        public static void MatrizRiesgo(GridView GridView1, int _id_sucursal = 0, int _id_empresa = 0, string _tipo_riesgo = "", string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                from IP in contexto.identificacion_puesto
                join PT in contexto.puesto_trabajo on IP.id_puesto equals PT.id_puesto_trabajo
                join IR in contexto.identificacion_peligro on IP.id_identificacion equals IR.id_identificacion_peligro
                join FI in contexto.factor_identificacion on IR.id_identificacion_peligro equals FI.id_identificacion
                where IR.matriz_riesgo == 1
                select new
                {
                    PT.area.id_sucursal,
                    Sucursal = PT.area.sucursal.nombre,
                    PT.area.sucursal.id_empresa,
                    IR.fecha_identificacion,
                    Medidas = IR.medidas_control_existentes == "" ? "Sin Asignar" : IR.medidas_control_existentes,
                    Observaciones = IR.observaciones == "" ? "Sin Asignar" : IR.observaciones,
                    IR.id_identificacion_peligro,
                    Evaluacion = IP.evaluacion_riesgo.Count == 0 ? "Sin Evaluación" : "Con Evaluación",
                    FactorRiesgo = FI.factor_riesgo.nombre,
                    FI.factor_riesgo.id_factor_riesgo,
                    tipoRiesgo = FI.factor_riesgo.tipo_riesgo.nombre,
                    FI.factor_riesgo.id_tipo_riesgo,
                    PT.nombre,
                    IR.estatus,
                    IP.id_ide_puesto,
                    porc_estatus = (from EV in contexto.evaluacion_riesgo
                                    where EV.id_ide_puesto == IP.id_ide_puesto
                                    select EV.porc_estatus).FirstOrDefault() != null ?
                    "" + (from EV in contexto.evaluacion_riesgo where EV.id_ide_puesto == IP.id_ide_puesto select EV.porc_estatus).FirstOrDefault()
                    : "0"
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_tipo_riesgo != string.Empty) { query = query.Where(x => x.tipoRiesgo.ToLower().Contains(_tipo_riesgo.ToLower())).ToList(); }
            if (nombre != string.Empty) { query = query.Where(x => x.FactorRiesgo.ToLower().Contains(nombre.ToLower())).ToList(); }

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

        #region riesgos
        public static void FactorRiesgo(GridView GridView1, string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from FR in contexto.factor_riesgo
                select new
                {
                    FR.id_factor_riesgo,
                    FR.nombre,
                    tipoRiesgo = FR.tipo_riesgo.nombre
                }).ToList();

            if (nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void IdentificacionPeligro(GridView GridView1, int _id_sucursal, string _fecha = "")
        {
            if (_id_sucursal != 0)
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                var query = (
                    from IPT in contexto.identificacion_peligro
                    where (
                        (from PT in contexto.puesto_trabajo
                         where PT.area.id_sucursal == _id_sucursal
                         select new
                         {
                             PT.area.id_sucursal
                         }).FirstOrDefault().id_sucursal
                        ) == _id_sucursal
                    orderby IPT.fecha_identificacion descending
                    select new
                    {
                        IPT.id_identificacion_peligro,
                        IPT.fecha_identificacion,
                        NumPuestos = IPT.identificacion_puesto.Count
                    }).ToList();

                if (_fecha != string.Empty) { query = query.Where(x => x.fecha_identificacion <= Convert.ToDateTime(_fecha)).ToList(); }

                GridView1.DataSource = query;
                GridView1.DataBind();
            }
        }
        public static void EvaluacionRiesgo(GridView GridView1, int _id_sucursal)
        {
            if (_id_sucursal != 0)
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                var query = (
                    from IPT in contexto.identificacion_puesto
                    where IPT.puesto_trabajo.area.id_sucursal == _id_sucursal
                    select new
                    {
                        IPT.id_ide_puesto,
                        IPT.id_puesto,
                        Puesto = IPT.puesto_trabajo.nombre,
                        Evaluacion = IPT.evaluacion_riesgo.Count == 0 ? "Sin Evaluación" : "Con Evaluación",
                        Num_Evaluacion = IPT.evaluacion_riesgo.Count
                    }).ToList();

                GridView1.DataSource = query;
                GridView1.DataBind();
            }
        }
        public static void EvaluacionPuesto(GridView GridView1, int _id_puesto, string _fecha = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                from ER in contexto.evaluacion_riesgo
                where ER.identificacion_puesto.id_puesto == _id_puesto
                select new
                {
                    ER.id_evaluacion_riesgo,
                    ER.fecha_evaluacion,
                    ER.nivel_riesgo,
                    ER.aceptabilidad_riesgo
                }).ToList();

            if (_fecha != string.Empty) { query = query.Where(x => x.fecha_evaluacion <= Convert.ToDateTime(_fecha)).ToList(); }
            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        #endregion

        #region autoevaluacion
        public static void autoevaluacion(
            GridView GridView1,
            int _id_sucursal = 0,
            int _id_empresa = 0,
            string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from AT in contexto.documento
                where AT.tipo == "AutoEvaluacion"
                select new
                {
                    AT.id_documento,
                    AT.id_tabla,
                    AT.sucursal.id_empresa,
                    Sucursal = AT.sucursal.nombre,
                    Empresa = AT.sucursal.empresa.nombre,
                    anho = AT.fecha_subida.Value.Year,
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

        #region inspecciones
        public static void inspecciones(GridView GridView1, string _tipo, int _id_sucursal = 0, int _id_empresa = 0, string nombre = "")
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

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_tipo != "Insp") { query = query.Where(x => x.tipo.Contains(_tipo)).ToList(); }
            if (nombre != "") { query = query.Where(x => x.nombre.ToUpper().Contains(nombre.ToUpper())).ToList(); }

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

        #region TipoDocumento
        public static void TipoDocumento(GridView GridView1, int _id_sucursal = 0, int _id_empresa = 0, string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.tipo_documento
                select new
                {
                    I.id_tipo_documento,
                    I.id_sucursal,
                    I.sucursal.id_empresa,
                    sucursal = I.sucursal.nombre,
                    I.nombre,
                    I.dirigida,
                    I.modalidad,
                    fecha = I.fecha == null ? "Sin fecha" : "" + I.fecha,
                    I.responsable,
                    I.aprobado,
                    I.archivado,
                    I.estatus
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (nombre != "") { query = query.Where(x => x.nombre.ToUpper().Contains(nombre.ToUpper())).ToList(); }

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
            consulta = Getter.CodigoCiiu_Empresa(Id_empresa);

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

        #region Estructura de Riesgos
        public static void EstructuraRiesgos(GridView GridView1, int _id_empresa, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.sucursal.id_empresa == _id_empresa && I.tipo == "EstructuraRiesgos"
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
    }
}