using Capa_Datos.Manager.Norma;
using Capa_Datos.Manager.Sucursal;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos.Manager.Medidas
{
    public class Mgr_Medidas
    {
        //------------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Add_Medidas_Sucursal(int id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<norma_sucursal> ListaNormasSucursal = Mgr_Norma.Get_Normas_Sucursal(id_sucursal, 0);

            foreach (var item in ListaNormasSucursal)
            {
                foreach (var item1 in item.norma.medida)
                {
                    medida_sucursal nuevo = new medida_sucursal()
                    {
                        id_normas_sucursal = item.id_normas_sucursal,
                        descripcion = item1.descripcion,
                        estatus_medida = 0,
                        aplica = 1
                    };

                    contexto.medida_sucursal.Add(nuevo);
                }
            }

            try
            {
                contexto.SaveChanges();
            }
            catch
            {
                Mgr_Sucursal.Delete_Sucursal(id_sucursal);
                return false;
            }
            return true;
        }

        //------------FUNCIONES DE CONSULTAR
        public static List<medida> Get_Medidas(int idNorma)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<medida> consulta = contexto.medida.Where(x => x.id_normas == idNorma).ToList();
            return consulta;
        }
        public static List<medida_sucursal> Get_MedidasBySucursal(int _id_medidas_sucursal)
        {
            GrupoLiEntities contexto2 = new GrupoLiEntities();

            List<medida_sucursal> consulta = new List<medida_sucursal>();
            consulta = contexto2.medida_sucursal.Where(
                x => x.id_medidas_sucursal == _id_medidas_sucursal
                ).ToList();
            return consulta;
        }
    }
}
