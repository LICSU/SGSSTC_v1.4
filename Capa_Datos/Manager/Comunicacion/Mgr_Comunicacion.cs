using Capa_Datos.Manager.CodigoCiiu;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Comunicacion
{
    public class Mgr_Comunicacion
    {
        //----------crud
        public static bool Add_Pregunta(Model_UsuarioSistema ObjUsuario, String[] valores)
        {
            Pregunta nuevo = new Pregunta()
            {
                titulo = valores[0],
                cuerpo_pregunta = valores[1],
                id_usuario = ObjUsuario.Id_usuario,
                estatus = 0,
                fecha = DateTime.Now
            };

            return CRUD.Add_Fila(nuevo);
        }
        public static bool Add_Respuesta(String[] valores)
        {
            Respuesta nuevo = new Respuesta()
            {
                cuerpo_respuesta = valores[0],
                usuario = valores[1],
                id_pregunta = Convert.ToInt32(valores[2]),
                fecha = DateTime.Now,
                calificacion = 0
            };

            return CRUD.Add_Fila(nuevo);
        }

        //----------getter

        public static List<Pregunta> Pregunta(int _id_pregunta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<Pregunta>();
            consulta = contexto.Pregunta.Where(x => x.id_pregunta == _id_pregunta).ToList();
            return consulta;
        }
        public static List<Respuesta> Respuesta(int _id_respuesta)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<Respuesta>();
            consulta = contexto.Respuesta.Where(x => x.id_respuesta == _id_respuesta).ToList();
            return consulta;
        }

        //----------------grid
        public static void MisPreguntas(GridView GridView1, int _id_usuario, string _fecha_ini = "", string _fecha_fin = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from PR in contexto.Pregunta
                where PR.id_usuario == _id_usuario
                select new
                {
                    PR.id_pregunta,
                    PR.titulo,
                    PR.cuerpo_pregunta,
                    PR.id_usuario,
                    PR.fecha
                }).ToList();

            if (_fecha_ini != "") { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != "") { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fecha_fin)).ToList(); }


            GridView1.DataSource = query;

            GridView1.DataBind();
        }
        public static void SusPreguntas(GridView GridView1, int Id_empresa, string _fecha_ini = "", string _fecha_fin = "",
            int _id_rol = 0, int _id_clase = 0, int _id_division = 0, int _id_seccion = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<empresa_itemdivision> consulta = new List<empresa_itemdivision>();
            consulta = Mgr_CodigoCiiu.CodigoCiiu_Empresa(Id_empresa);

            int act1 = 0, act2 = 0, act3 = 0, cont = 0;
            foreach (var item in consulta)
            {
                cont++;
                if (cont == 1) { act1 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 2) { act2 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 3) { act3 = Convert.ToInt32(item.id_clase_ciiu); }
            }


            var query = (
                from PR in contexto.Pregunta
                join EC in contexto.empresa_itemdivision
                on PR.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa equals EC.id_empresa
                where EC.id_clase_ciiu == act1 || EC.id_clase_ciiu == act2 || EC.id_clase_ciiu == act3

                select new
                {
                    PR.id_pregunta,
                    PR.titulo,
                    PR.cuerpo_pregunta,
                    PR.id_usuario,
                    PR.usuario.id_rol,
                    EC.id_clase_ciiu,
                    EC.claseCiiu.grupoCiiu.id_division,
                    EC.claseCiiu.grupoCiiu.divisionCiiu.id_seccion,
                    PR.fecha
                }).ToList();

            if (_fecha_ini != "") { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fecha_ini)).ToList(); }
            if (_fecha_fin != "") { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fecha_fin)).ToList(); }
            if (_id_rol != 0) { query = query.Where(x => x.id_rol == _id_rol).ToList(); }
            if (_id_clase != 0) { query = query.Where(x => x.id_clase_ciiu == _id_clase).ToList(); }
            if (_id_division != 0) { query = query.Where(x => x.id_division == _id_division).ToList(); }
            if (_id_seccion != 0) { query = query.Where(x => x.id_seccion == _id_seccion).ToList(); }

            var Distinto = query.Distinct().ToList();

            GridView1.DataSource = Distinto;
            GridView1.DataBind();
        }


    }
}
