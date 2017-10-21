using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Documento
{
    public class Mgr_Documento
    {
        //------crud
        public static bool Add_TipoDocumento_Sucursal(String[] valores)
        {
            List<tipo_documento> ListaTipoDocumento = new List<tipo_documento>();
            Boolean berror = false;

            for (int i = 0; i < 41; i++)
            {
                tipo_documento ObjTipoDocumento = new tipo_documento();
                ObjTipoDocumento.id_sucursal = Convert.ToInt32(valores[0]);
                ObjTipoDocumento.nombre = ValoresDefault.Nombre_TipoDocumento.Value[i];
                ObjTipoDocumento.dirigida = ValoresDefault.Dirigida_TipoDocumento.Value[i];
                ObjTipoDocumento.modalidad = ValoresDefault.Modalidad_TipoDocumento.Value[i];
                ObjTipoDocumento.responsable = ValoresDefault.Responsable_TipoDocumento.Value[i];
                ObjTipoDocumento.aprobado = ValoresDefault.Aprobado_TipoDocumento.Value[i];
                ObjTipoDocumento.archivado = ValoresDefault.Archivado_TipoDocumento.Value[i];
                ObjTipoDocumento.estatus = "No Cumplido";
                ListaTipoDocumento.Add(ObjTipoDocumento);

                berror = CRUD.Add_Fila(ObjTipoDocumento);

                if (!berror)
                {
                    return berror;
                }
            }

            return berror;
        }

        //------getter
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
        public static List<tipo_documento> TipoDocumento(int _id_tipoDocumento)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<tipo_documento> consulta = new List<tipo_documento>();
            consulta = contexto.tipo_documento.Where(x => x.id_tipo_documento == _id_tipoDocumento).ToList();
            return consulta;
        }
        public static List<plan> Planes(int _id_plan, string _tipo = "", string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<plan> consulta = new List<plan>();
            consulta = contexto.plan.Where(x => x.id_plan == _id_plan && x.tipo == _tipo
                                            && x.nombre.ToUpper().Contains(_nombre.ToUpper())).ToList();
            return consulta;
        }
        public static List<procedimiento_comunicacion> ProcedimientoComunicacion(int _id_brigada)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<procedimiento_comunicacion> consulta = new List<procedimiento_comunicacion>();
            consulta = contexto.procedimiento_comunicacion.Where(x => x.id_brigada == _id_brigada).ToList();
            return consulta;
        }
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
        public static List<matriz_responsabilidad> MatrizResponsabilidad(int _id_matriz_responsabilidad)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<matriz_responsabilidad> consulta = new List<matriz_responsabilidad>();
            consulta = contexto.matriz_responsabilidad.Where(x => x.id_matriz_responsabilidad == _id_matriz_responsabilidad).ToList();
            return consulta;
        }
        public static int Matriz_Responsabilidad(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new matriz_responsabilidad();
            int id = 0;

            if (contexto.matriz_responsabilidad.Where(x => x.id_sucursal == _id_sucursal).Count() != 0)
            {
                id = contexto.matriz_responsabilidad.Where(x => x.id_sucursal == _id_sucursal).Max(x => x.id_matriz_responsabilidad);
            }

            return id;
        }
        public static List<brigada_emergencia> BrigadaEmergencia(int _id_brigada)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<brigada_emergencia> consulta = new List<brigada_emergencia>();
            consulta = contexto.brigada_emergencia.Where(x => x.id_brigada == _id_brigada).ToList();
            return consulta;
        }
        public static int BrigadaEmergencias(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new brigada_emergencia();
            int id = 0;

            if (contexto.brigada_emergencia.Where(x => x.id_sucursal == _id_sucursal).Count() != 0)
            {
                id = contexto.brigada_emergencia.Where(x => x.id_sucursal == _id_sucursal).Max(x => x.id_brigada);
            }

            return id;
        }
        public static int Plan(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new plan();
            int id = 0;

            if (contexto.plan.Where(x => x.id_sucursal == _id_sucursal).Count() != 0)
            {
                id = contexto.plan.Where(x => x.id_sucursal == _id_sucursal).Max(x => x.id_plan);
            }

            return id;
        }
        public static int RecursosEconmicos(int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new documento();
            int id = 0;

            if (contexto.documento.Where(x => x.id_tabla == _id_sucursal && x.tipo == "RecursosEconomicos").Count() != 0)
            {
                id = contexto.documento
                    .Where(x => x.id_tabla == _id_sucursal && x.tipo == "RecursosEconomicos")
                    .Max(x => x.id_documento);
            }

            return id;
        }
        
        //------grid
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
        public static void vigilancia_epidemiologica(GridView GridView1, int _id_empresa = 0, int _id_sucursal = 0, string _nombre = "")
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
        public static void reportes(GridView GridView1, string _tipo = "Rep", int _id_empresa = 0, int _id_sucursal = 0, string nombre = "")
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

    }
}
