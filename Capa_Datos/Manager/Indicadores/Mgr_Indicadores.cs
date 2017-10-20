using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Indicadores
{
    public class Mgr_Indicadores
    {
        //-------crud
        public static bool AddIndicadores(Tuple<int, int> IdEmpSuc, String[] valores, FileUpload flpArchivo)
        {
            int IdEmpresa = IdEmpSuc.Item1;
            int IdSucursal = IdEmpSuc.Item2;

            string ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + valores[0], Paginas.Archivos_Indicadores.Value);

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

    }
}
