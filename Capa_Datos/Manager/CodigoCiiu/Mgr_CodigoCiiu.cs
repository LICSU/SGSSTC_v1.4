using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.CodigoCiiu
{
    public class Mgr_CodigoCiiu
    {
        //-----------CRUD
        public static bool AddCodigoCiiu_Empresa(String[] valores)
        {
            empresa_itemdivision nuevo;
            Boolean berror = false;

            #region se guarda la actividad principal
            nuevo = new empresa_itemdivision()
            {
                id_empresa = Convert.ToInt32(valores[0]),
                id_clase_ciiu = Convert.ToInt32(valores[1]),
                num_actividad = "Actividad Principal"
            };
            berror = CRUD.Add_Fila(nuevo);
            #endregion

            #region se guarda la actividad secundaria
            if (valores[2] != string.Empty)
            {
                nuevo = new empresa_itemdivision()
                {
                    id_empresa = Convert.ToInt32(valores[0]),
                    id_clase_ciiu = Convert.ToInt32(valores[2]),
                    num_actividad = "Actividad Secundaria"
                };
                berror = CRUD.Add_Fila(nuevo);
            }
            #endregion

            #region se guarda la tercera actividad
            if (valores[3] != string.Empty)
            {
                nuevo = new empresa_itemdivision()
                {
                    id_empresa = Convert.ToInt32(valores[0]),
                    id_clase_ciiu = Convert.ToInt32(valores[3]),
                    num_actividad = "Otras Actividades"
                };
                berror = CRUD.Add_Fila(nuevo);
            }
            #endregion

            return berror;
        }

        //-----------getter
        public static List<empresa_itemdivision> CodigoCiiu_Empresa(int _id_empresa)
        {
            GrupoLiEntities contextoCod = new GrupoLiEntities();

            List<empresa_itemdivision> consulta = new List<empresa_itemdivision>();
            consulta = contextoCod.empresa_itemdivision.Where(x => x.id_empresa == _id_empresa).ToList();
            return consulta;
        }
        public static List<empresa_itemdivision> EmpresaItemDivison(int _id_empresa, int act1, int act2, int act3 = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<empresa_itemdivision> consulta = contexto
                .empresa_itemdivision
                .Where(
                    x => x.id_empresa == _id_empresa &&
                    (x.id_clase_ciiu == act1 || x.id_clase_ciiu == act2 || x.id_clase_ciiu == act3)
                ).ToList();
            return consulta;
        }
        public static List<claseCiiu> CodigoCiiu(int _id_item_division)
        {
            GrupoLiEntities contextoCod = new GrupoLiEntities();

            List<claseCiiu> consulta = new List<claseCiiu>();
            consulta = contextoCod.claseCiiu.Where(x => x.id_clase_ciiu == _id_item_division).ToList();
            return consulta;
        }

        //------------listas
        public static void Codciiu_Div_item(DropDownList DropDownList1, string tabla, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            if (tabla == "SeccionCiiu")
            {
                var Consulta = (from c in contexto.seccionCiiu
                                select new { c.id_seccion, nombre = c.nombre + " " + c.descripcion }).ToList();

                DropDownList1.DataValueField = "id_seccion";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "DivisionCiiu")
            {
                var Consulta = (from c in contexto.divisionCiiu
                                where c.id_seccion == id
                                select new { c.id_division, nombre = c.nombre + " " + c.descripcion }).ToList();

                DropDownList1.DataValueField = "id_division";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "GrupoCiiu")
            {
                var Consulta = (from c in contexto.grupoCiiu
                                where c.id_division == id
                                select new { c.id_grupo, nombre = c.nombre + " " + c.descripcion }).ToList();

                DropDownList1.DataValueField = "id_grupo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "ClaseCiiu")
            {
                var Consulta = (from c in contexto.claseCiiu
                                where c.id_grupo == id
                                select new { c.id_clase_ciiu, nombre = c.nombre + " " + c.descripcion })
                                .ToList();

                DropDownList1.DataValueField = "id_clase_ciiu";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "claseCiiu_Empresa")
            {
                var Consulta = (
                    from c in contexto.empresa_itemdivision
                    where c.id_empresa == id
                    select new
                    {
                        c.id_clase_ciiu,
                        nombre = c.claseCiiu.nombre + " " + c.claseCiiu.descripcion
                    }).ToList();

                DropDownList1.DataValueField = "id_clase_ciiu";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }

            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar..", ""));

            foreach (ListItem myItem in DropDownList1.Items)
            {
                try
                {
                    if (myItem.Text.Length > 80)
                        myItem.Text = myItem.Text.Substring(0, 80) + "...";
                }
                catch (ArgumentOutOfRangeException ex)
                {

                    Utilidades.LogMessage("Execpción: " + ex);
                }
            }
        }
        public static void Codciiu_Usuario(DropDownList DropDownList1, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.empresa_itemdivision
                where c.id_empresa == id
                select new
                {
                    c.id_clase_ciiu,
                    nombre = c.claseCiiu.nombre + " " + c.claseCiiu.descripcion
                }).ToList();

            var Distinto = Consulta.Distinct().ToList();

            DropDownList1.DataValueField = "id_clase_ciiu";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Distinto;


            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar..", ""));

            foreach (ListItem myItem in DropDownList1.Items)
            {
                try
                {
                    if (myItem.Text.Length > 80)
                        myItem.Text = myItem.Text.Substring(0, 80) + "...";
                }
                catch (ArgumentOutOfRangeException ex)
                {

                    Utilidades.LogMessage("Execpción: " + ex);
                }
            }
        }
        public static void Division_Usuario(DropDownList DropDownList1, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.empresa_itemdivision
                where c.id_empresa == id
                select new
                {
                    c.claseCiiu.grupoCiiu.id_division,
                    nombre = c.claseCiiu.grupoCiiu.divisionCiiu.nombre + " " + c.claseCiiu.grupoCiiu.divisionCiiu.descripcion
                }).ToList();

            var Distinto = Consulta.Distinct().ToList();

            DropDownList1.DataValueField = "id_division";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Distinto;


            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar..", ""));

            foreach (ListItem myItem in DropDownList1.Items)
            {
                try
                {
                    if (myItem.Text.Length > 80)
                        myItem.Text = myItem.Text.Substring(0, 80) + "...";
                }
                catch (ArgumentOutOfRangeException ex)
                {

                    Utilidades.LogMessage("Execpción: " + ex);
                }
            }
        }
        public static void Seccion_Usuario(DropDownList DropDownList1, int id = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var Consulta = (
                from c in contexto.empresa_itemdivision
                where c.id_empresa == id
                select new
                {
                    c.claseCiiu.grupoCiiu.divisionCiiu.id_seccion,
                    nombre = c.claseCiiu.grupoCiiu.divisionCiiu.seccionCiiu.nombre + " " + c.claseCiiu.grupoCiiu.divisionCiiu.seccionCiiu.descripcion
                }).ToList();

            var Distinto = Consulta.Distinct().ToList();

            DropDownList1.DataValueField = "id_seccion";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Distinto;


            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccionar..", ""));

            foreach (ListItem myItem in DropDownList1.Items)
            {
                try
                {
                    if (myItem.Text.Length > 80)
                        myItem.Text = myItem.Text.Substring(0, 80) + "...";
                }
                catch (ArgumentOutOfRangeException ex)
                {

                    Utilidades.LogMessage("Execpción: " + ex);
                }
            }
        }
    }
}
