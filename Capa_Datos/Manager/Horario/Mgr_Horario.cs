using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Horario
{
    public class Mgr_Horario
    {
        //------------crud
        public static bool Add_Horario_Sucursal(String[] valores)
        {
            horario nuevo = new horario()
            {
                nombre = "Horario Default " + valores[0],
                id_empresa = Mgr_Empresa.get_max_Empresas(),
                fecha_inicio = "12:00",
                fecha_fin = "01:00",
                fecha_creacion = DateTime.Today
            };
            return CRUD.Add_Fila(nuevo);
        }
        
        //--------------getter
        public static int Horario()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new horario();
            int id = contexto.horario.Max(x => x.id_horario);
            return id;
        }
        public static horario Horario(int _id_horario)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            horario consulta = new horario();
            consulta = contexto.horario.Where(x => x.id_horario == _id_horario).SingleOrDefault();
            return consulta;
        }
        public static List<horario> ListHorario(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<horario> consulta = new List<horario>();

            consulta = contexto.horario.Where(x => x.id_empresa == _id_empresa).ToList();

            return consulta;
        }

        //---------horario
        public static void Horario_Empresa(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            #region codigo
            var Consulta = (from c in contexto.horario.Where(x => x.id_empresa == _id_empresa)
                            select new { c.id_horario, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_horario";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Horario", ""));
            #endregion
        }

        //----------grid

        public static void Horario(GridView GridView1, int _id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                from CT in contexto.horario
                select new
                {
                    CT.fecha_inicio,
                    CT.fecha_fin,
                    CT.id_horario,
                    CT.id_empresa,
                    horario = CT.fecha_inicio + " - " + CT.fecha_fin,
                    empresa = CT.empresa.nombre,
                    CT.nombre,
                    num_trab = (from TB in contexto.trabajador where TB.id_horario == CT.id_horario select TB.id_trabajador).Count()
                }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

    }
}
