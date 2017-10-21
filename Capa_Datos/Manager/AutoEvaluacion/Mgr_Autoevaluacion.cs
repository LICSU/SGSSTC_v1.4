using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.AutoEvaluacion
{
    public class Mgr_Autoevaluacion
    {
        //---------------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Add_AutoEvaluacion(Tuple<int, int> IdEmpSuc, String[] valores, FileUpload flpArchivo)
        {
            int IdEmpresa = IdEmpSuc.Item1;
            int IdSucursal = IdEmpSuc.Item2;
            Boolean berror = false;
            string _ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + valores[0], Paginas.Archivos_Autoevaluacion.Value);

            DateTime fecha = new DateTime(Convert.ToInt32(valores[1]), 1, 1);

            documento nuevo = new documento()
            {
                nombre = valores[2],
                ruta = _ruta,
                fecha_subida = fecha,
                id_tabla = IdSucursal,
                tipo = TipoDocumento.Auto_Evaluacion.Value
            };

            berror = CRUD.Add_Fila(nuevo);

            if (berror)
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                lista_actividad Edit = contexto.lista_actividad.SingleOrDefault(b => b.id_sucursal == IdSucursal);
                if (Edit != null)
                {
                    Edit.estatus = "Si";
                }
                berror = CRUD.Edit_Fila(contexto);

            }

            return berror;
        }
        public static bool Delete_AutoEvaluacion(String idAutoEvaluacion, Model_UsuarioSistema ObjUsuario)
        {
            int idAuto = Convert.ToInt32(idAutoEvaluacion);
            int idSucursal = 0;

            GrupoLiEntities contexto = new GrupoLiEntities();
            List<documento> ListaDocumento = new List<documento>();
            ListaDocumento = contexto.documento.Where(b => b.id_documento == idAuto).ToList();

            foreach (var item in ListaDocumento)
            {
                idSucursal = Convert.ToInt32(item.id_tabla);
            }

            documento tabla = new documento();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, idAuto);

            if (ObjUsuario.Error)
            {
                contexto = new GrupoLiEntities();
                lista_actividad Edit = contexto.lista_actividad.SingleOrDefault(b => b.id_sucursal == idSucursal);
                if (Edit != null)
                {
                    Edit.estatus = "No";
                }
                ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            }

            return ObjUsuario.Error;
        }

        //----------------FUNCIONES DE LLENAR GRID
        public static void Grid_Autoevaluacion(GridView GridView1, int _id_sucursal = 0, int _id_empresa = 0, string nombre = "")
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
    }
}
