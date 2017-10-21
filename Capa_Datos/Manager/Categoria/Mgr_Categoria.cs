using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Categoria
{
    public class Mgr_Categoria
    {
        //-----------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Add_Categoria_Empresa(String[] valores)
        {
            List<categoria> Listacategoria = new List<categoria>();

            Boolean berror = false;

            for (int i = 0; i < ValoresDefault.Nombre_Categorias.Value.Length; i++)
            {
                categoria ListaCategoria = new categoria();

                string nombreCat = ValoresDefault.Nombre_Categorias.Value[i];

                ListaCategoria.nombre = ValoresDefault.Nombre_Categorias.Value[i];

                ListaCategoria.descripcion = ValoresDefault.Descripcion_Categorias.Value[i];
                ListaCategoria.id_empresa = Convert.ToInt32(valores[0]);

                Listacategoria.Add(ListaCategoria);

                berror = CRUD.Add_Fila(ListaCategoria);

                if (!berror)
                {
                    i = valores.Length;
                }
            }

            return berror;
        }

        //---------FUNCIONES DE CONSULTAR
        public static categoria Get_Categoria(int _idCategoria)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            categoria consulta = new categoria();
            consulta = contexto.categoria.Where(x => x.id_categorias == _idCategoria).SingleOrDefault();
            return consulta;
        }
        public static List<categoria> Get_Categoria(string nombre)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<categoria> consulta = new List<categoria>();
            consulta = contexto.categoria.Where(x => x.nombre == nombre).ToList();
            return consulta;
        }

        //---------FUNCIONES DE LLENAR LISTAS
        public static void List_Categorias(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.categoria
                            where c.id_empresa == _id_empresa
                            select new { c.id_categorias, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_categorias";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Categoria", ""));
        }

        //---------FUNCIONES DE LLENAR GRID
        public static void Grid_Categorias(GridView GridView1, int id_empresa = 0, string _nombre = "")
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


    }
}
