using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.PlanTrabajo
{
    public class Mgr_PlanTrabajo
    {
        //----------crud
        public static bool Add_Lista_Actividad(int id_sucursal)
        {
            lista_actividad nuevo = new lista_actividad()
            {
                actividad = "Crear Documento de Autoevaluación",
                id_sucursal = id_sucursal,
                estatus = "No",
                fase = "E",
                link = "../EvaluacionInicial/index_AutoEvaluacion.aspx",
                anho = DateTime.Now.Year
            };

            return CRUD.Add_Fila(nuevo);
        }

        //----------getter
        public static List<plan_trabajo> Plan_Trabajo(int _id_sucursal = 0, int _anho = 0, int id_plan = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<plan_trabajo> consulta = new List<plan_trabajo>();

            if (id_plan != 0) { consulta = contexto.plan_trabajo.Where(x => x.id_plan_trabajo == id_plan).ToList(); }
            else if (_id_sucursal != 0 && _anho != 0)
            {
                consulta = contexto.plan_trabajo.Where(x =>
                x.usuario.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal &&
                x.anho == _anho).OrderBy(x => x.semana_ini).ToList();
            }

            return consulta;
        }

        //----------grid
        public static void PlanTrabajo(GridView GridView1, int _id_sucursal, int _anho = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CA in contexto.plan_trabajo
                where CA.usuario.trabajador.puesto_trabajo.area.id_sucursal == _id_sucursal
                orderby CA.semana_ini
                select new
                {
                    CA.id_plan_trabajo,
                    CA.usuario.trabajador.puesto_trabajo.area.id_sucursal,
                    CA.anho,
                    actividad = CA.nombre,
                    objetivo = CA.objetivos,
                    nombreResp = CA.usuario.login,
                    CA.recursos_aprobados,
                    sem1 = (CA.semana_ini <= 1 && CA.semana_fin >= 1) ? " " : "",
                    sem2 = (CA.semana_ini <= 2 && CA.semana_fin >= 2) ? " " : "",
                    sem3 = (CA.semana_ini <= 3 && CA.semana_fin >= 3) ? " " : "",
                    sem4 = (CA.semana_ini <= 4 && CA.semana_fin >= 4) ? " " : "",
                    sem5 = (CA.semana_ini <= 5 && CA.semana_fin >= 5) ? " " : "",
                    sem6 = (CA.semana_ini <= 6 && CA.semana_fin >= 6) ? " " : "",
                    sem7 = (CA.semana_ini <= 7 && CA.semana_fin >= 7) ? " " : "",
                    sem8 = (CA.semana_ini <= 8 && CA.semana_fin >= 8) ? " " : "",
                    sem9 = (CA.semana_ini <= 9 && CA.semana_fin >= 9) ? " " : "",
                    sem10 = (CA.semana_ini <= 10 && CA.semana_fin >= 10) ? " " : "",
                    sem11 = (CA.semana_ini <= 11 && CA.semana_fin >= 11) ? " " : "",
                    sem12 = (CA.semana_ini <= 12 && CA.semana_fin >= 12) ? " " : "",
                    sem13 = (CA.semana_ini <= 13 && CA.semana_fin >= 13) ? " " : "",
                    sem14 = (CA.semana_ini <= 14 && CA.semana_fin >= 14) ? " " : "",
                    sem15 = (CA.semana_ini <= 15 && CA.semana_fin >= 15) ? " " : "",
                    sem16 = (CA.semana_ini <= 16 && CA.semana_fin >= 16) ? " " : "",
                    sem17 = (CA.semana_ini <= 17 && CA.semana_fin >= 17) ? " " : "",
                    sem18 = (CA.semana_ini <= 18 && CA.semana_fin >= 18) ? " " : "",
                    sem19 = (CA.semana_ini <= 19 && CA.semana_fin >= 19) ? " " : "",
                    sem20 = (CA.semana_ini <= 20 && CA.semana_fin >= 20) ? " " : "",
                    sem21 = (CA.semana_ini <= 21 && CA.semana_fin >= 21) ? " " : "",
                    sem22 = (CA.semana_ini <= 22 && CA.semana_fin >= 22) ? " " : "",
                    sem23 = (CA.semana_ini <= 23 && CA.semana_fin >= 23) ? " " : "",
                    sem24 = (CA.semana_ini <= 24 && CA.semana_fin >= 24) ? " " : "",
                    sem25 = (CA.semana_ini <= 25 && CA.semana_fin >= 25) ? " " : "",
                    sem26 = (CA.semana_ini <= 26 && CA.semana_fin >= 26) ? " " : "",
                    sem27 = (CA.semana_ini <= 27 && CA.semana_fin >= 27) ? " " : "",
                    sem28 = (CA.semana_ini <= 28 && CA.semana_fin >= 28) ? " " : "",
                    sem29 = (CA.semana_ini <= 29 && CA.semana_fin >= 29) ? " " : "",
                    sem30 = (CA.semana_ini <= 30 && CA.semana_fin >= 30) ? " " : "",
                    sem31 = (CA.semana_ini <= 31 && CA.semana_fin >= 31) ? " " : "",
                    sem32 = (CA.semana_ini <= 32 && CA.semana_fin >= 32) ? " " : "",
                    sem33 = (CA.semana_ini <= 33 && CA.semana_fin >= 33) ? " " : "",
                    sem34 = (CA.semana_ini <= 34 && CA.semana_fin >= 34) ? " " : "",
                    sem35 = (CA.semana_ini <= 35 && CA.semana_fin >= 35) ? " " : "",
                    sem36 = (CA.semana_ini <= 36 && CA.semana_fin >= 36) ? " " : "",
                    sem37 = (CA.semana_ini <= 37 && CA.semana_fin >= 37) ? " " : "",
                    sem38 = (CA.semana_ini <= 38 && CA.semana_fin >= 38) ? " " : "",
                    sem39 = (CA.semana_ini <= 39 && CA.semana_fin >= 39) ? " " : "",
                    sem40 = (CA.semana_ini <= 40 && CA.semana_fin >= 40) ? " " : "",
                    sem41 = (CA.semana_ini <= 41 && CA.semana_fin >= 41) ? " " : "",
                    sem42 = (CA.semana_ini <= 42 && CA.semana_fin >= 42) ? " " : "",
                    sem43 = (CA.semana_ini <= 43 && CA.semana_fin >= 43) ? " " : "",
                    sem44 = (CA.semana_ini <= 44 && CA.semana_fin >= 44) ? " " : "",
                    sem45 = (CA.semana_ini <= 45 && CA.semana_fin >= 45) ? " " : "",
                    sem46 = (CA.semana_ini <= 46 && CA.semana_fin >= 46) ? " " : "",
                    sem47 = (CA.semana_ini <= 47 && CA.semana_fin >= 47) ? " " : "",
                    sem48 = (CA.semana_ini <= 48 && CA.semana_fin >= 48) ? " " : "",
                    sem49 = (CA.semana_ini <= 49 && CA.semana_fin >= 49) ? " " : "",
                    sem50 = (CA.semana_ini <= 50 && CA.semana_fin >= 50) ? " " : "",
                    sem51 = (CA.semana_ini <= 51 && CA.semana_fin >= 51) ? " " : "",
                    sem52 = (CA.semana_ini <= 52 && CA.semana_fin >= 52) ? " " : ""
                }).ToList();

            if (_anho != 0) { query = query.Where(x => x.anho == Convert.ToInt32(_anho)).ToList(); }

            GridView1.DataSource = query;

            GridView1.DataBind();
        }


        //----------listas
        public static void Actividades_Sucursal(DropDownList DropDownList1, int idSucursal, int _anho)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (
                from c in contexto.plan_trabajo
                where c.usuario.trabajador.puesto_trabajo.area.id_sucursal == idSucursal
                && c.anho == _anho
                select new { c.id_plan_trabajo, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_plan_trabajo";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione la Actividad", ""));
        }

    }
}
