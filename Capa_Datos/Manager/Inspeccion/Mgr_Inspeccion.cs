using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Inspeccion
{
    public class Mgr_Inspeccion
    {
        //-------------crud
        public static bool AddInspeccion(Tuple<int, int> IdEmpSuc, String[] valores, FileUpload flpArchivo)
        {
            int IdEmpresa = IdEmpSuc.Item1;
            int IdSucursal = IdEmpSuc.Item2;

            string ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + valores[0], Paginas.Archivos_Inspecciones.Value);

            documento nuevo = new documento()
            {
                nombre = valores[0],
                fecha_subida = DateTime.Today.Date,
                id_tabla = IdSucursal,
                tipo = valores[1],
                ruta = ruta
            };

            return CRUD.Add_Fila(nuevo);
        }

        //---------getter
        public static int Inspecciones(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from IN in contexto.documento
                where IN.sucursal.id_empresa == _id_empresa &&
                (IN.tipo == "Insp_Ext" || IN.tipo == "Insp_Areas" || IN.tipo == "Insp_MedEsc" || IN.tipo == "Insp_PuesOpe" ||
                IN.tipo == "Insp_PuesAdmin" || IN.tipo == "Insp_Epp" || IN.tipo == "Insp_UsoEpp" || IN.tipo == "Insp_PrimAux" ||
                IN.tipo == "Insp_CronInsp")
                select new
                {
                    IN.tipo
                }
            ).ToList();

            return query.Count();
        }

        //---------grid
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






    }
}
