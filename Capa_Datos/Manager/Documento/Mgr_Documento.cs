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
    }
}
