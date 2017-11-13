using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.PoliticaSST
{
    public class Mgr_PoliticaSST
    {
        //-------------FUNCIONES DE CONSULTAR
        public static List<encuesta_politica> Get_EncuestaPoliticaSST(int _id_encuesta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<encuesta_politica> consulta = new List<encuesta_politica>();
            consulta = contexto.encuesta_politica.Where(x => x.id_encuesta == _id_encuesta).ToList();
            return consulta;
        }
        public static List<politica_sst> Get_PoliticaSST(int _id_politica_sst)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<politica_sst> consulta = new List<politica_sst>();
            consulta = contexto.politica_sst.Where(x => x.id_politica == _id_politica_sst).ToList();
            return consulta;
        }
        public static int Get_Politica_SST(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new usuario();
            try
            {
                int id = contexto.politica_sst.Where(x => x.id_empresa == _id_empresa).Max(x => x.id_politica);
                return id;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        //-------------FUNCIONES DE LLENAR GRID
        public static void Grid_ObjetivosSgsst(GridView GridView1, int _id_empresa, int _id_sucursal = 0)
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
        public static void Grid_PoliticaSST_empresa(GridView GridView1, int _id_empresa)
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
        public static void Grid_PoliticaSST(GridView GridView1)
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
        public static void Grid_Encuesta_PoliticaSST(GridView GridView1, int _id_empresa, int _id_sucursal = 0, int _id_trabajador = 0, string tipo = "", string nombre = "")
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
                    archivo = CT.ruta == "" ? "No Tiene Soporte" : "Si tiene Soporte",
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
        public static void Grid_Comunicado_PoliticaSST(GridView GridView1, int _id_empresa, int _id_sucursal = 0, int _id_trabajador = 0, string _nombre = "")
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
        
    }
}
