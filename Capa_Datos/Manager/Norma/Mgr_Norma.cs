using Capa_Datos.Manager.Sucursal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Norma
{
    public class Mgr_Norma
    {
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

        public static bool Add_Normas_Sucursal(String[] valores)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            #region insertar normas generales
            List<norma> normasGeneral = Norma(0, "General");

            foreach (var item in normasGeneral)
            {
                norma_sucursal nuevo = new norma_sucursal()
                {
                    id_sucursal = Convert.ToInt32(valores[3]),
                    id_normas = item.id_normas,
                    estatus_norma = 0
                };
                contexto.norma_sucursal.Add(nuevo);

            }
            #endregion

            #region insertar normas jurisprudencia y especifica
            List<norma_claseciiu> ListaNormas = new List<norma_claseciiu>();

            int act1 = Convert.ToInt32(valores[0]);
            int act2 = Convert.ToInt32(valores[1]);
            int act3 = Convert.ToInt32(valores[2]);

            ListaNormas = contexto.norma_claseciiu.Where(x =>
                x.id_clase_ciiu == act1 ||
                x.id_clase_ciiu == act2 ||
                x.id_clase_ciiu == act3
                ).ToList();

            var distinctList = ListaNormas
                .GroupBy(x => new { x.norma.documento, x.norma.anho, x.norma.articulo, x.norma.literal })
                .Select(g => g.First()).ToList();

            foreach (var item in distinctList)
            {
                norma_sucursal nuevo = new norma_sucursal()
                {
                    id_sucursal = Convert.ToInt32(valores[3]),
                    id_normas = item.id_normas,
                    estatus_norma = 0
                };
                contexto.norma_sucursal.Add(nuevo);

            }
            #endregion

            try
            {
                contexto.SaveChanges();
            }
            catch
            {
                Mgr_Sucursal.DeleteSucursal(Convert.ToInt32(valores[3]));
                return false;
            }

            return true;
        }

        public static void MatrizLegal(GridView GridView1,int _id_sucursal = 0,string _tipoMatriz = "",string _anho = "",string _buscar = "",int _id_empresa = 0)
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

        //------------getter

        public static List<norma> Norma(int _id_norma = 0, string _tipo = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<norma> consulta = new List<norma>();

            if (_id_norma != 0) { consulta = contexto.norma.Where(x => x.id_normas == _id_norma).ToList(); }
            if (_tipo == "General") { consulta = contexto.norma.Where(x => x.tipo_matriz.Contains("General")).ToList(); }

            return consulta;
        }

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

        //--------------listas

        public static void AnhoNorma(DropDownList DropDownList1, int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (
                from c in contexto.norma_sucursal
                where c.id_sucursal == _id_sucursal
                group c by c.norma.anho into g
                select new
                {
                    name = g.Key,
                    count = g.Count()

                }).ToList();

            Consulta = Consulta.OrderByDescending(x => x.name).ToList();


            DropDownList1.DataValueField = "name";
            DropDownList1.DataTextField = "name";
            DropDownList1.DataSource = Consulta;

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione ...", ""));
        }


    }
}
