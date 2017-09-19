using System;
using System.Linq;
using System.Web.UI.WebControls;


namespace Capa_Datos
{
    public class Model_Bitacora
    {
        ///<summary>contexto del Entity Framework</summary>
        public static GrupoLiEntities contexto = new GrupoLiEntities();

        public Model_Bitacora()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static bool Add_Registro(DateTime fecha_hora, int _id_usuario, int _id_tipo_evento, string _pagina, string _tabla)
        {
            bool bError = true;

            evento nuevo = new evento()
            {
                fecha_hora = fecha_hora,
                id_usuario = _id_usuario,
                id_tipo_evento = _id_tipo_evento,
                pagina = _pagina,
                tabla = _tabla
            };

            try
            {
                contexto.evento.Add(nuevo);
                contexto.SaveChanges();
            }
            catch (Exception e)
            {

                bError = false; Utilidades.LogMessage("Execpción: " + e);
            }
            return bError;
        }

        public static void CargarGrid(GridView GridView1, int _id_usuario = 0, int _id_sucursal = 0, int _id_empresa = 0,
            string _id_tipo_evento = "", string _fechaIni = "", string _fechaFin = "")
        {
            var query = (
                    from EV in contexto.evento
                    where EV.id_usuario != 1
                    orderby EV.fecha_hora
                    select new
                    {
                        fecha = EV.fecha_hora,
                        tipoEvento = EV.tipo_evento.nombre,
                        EV.id_tipo_evento,
                        EV.pagina,
                        nombreUsuario = EV.usuario.login,
                        EV.id_usuario,
                        EV.usuario.trabajador.puesto_trabajo.area.id_sucursal,
                        nombreSucursal = EV.usuario.trabajador.puesto_trabajo.area.sucursal.nombre,
                        EV.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa,
                        nombreEmpresa = EV.usuario.trabajador.puesto_trabajo.area.sucursal.empresa.nombre
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_id_tipo_evento != string.Empty) { query = query.Where(x => x.id_tipo_evento == Convert.ToInt32(_id_tipo_evento)).ToList(); }
            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_usuario != 0) { query = query.Where(x => x.id_usuario == Convert.ToInt32(_id_usuario)).ToList(); }
            if (_fechaIni != string.Empty) { query = query.Where(x => x.fecha >= Convert.ToDateTime(_fechaIni)).ToList(); }
            if (_fechaFin != string.Empty) { query = query.Where(x => x.fecha <= Convert.ToDateTime(_fechaFin)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        public static void CargarListado_TipoEvento(DropDownList DropDownList1)
        {
            var Consulta = (from c in contexto.tipo_evento
                            select new { c.id_tipo_evento, c.nombre }).ToList();

            DropDownList1.DataValueField = "id_tipo_evento";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Tipo de Evento", ""));
        }
    }
}
