using Capa_Datos;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Calendario : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private  Utilidades objUtilidades = new Utilidades();

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            List<documento> ListaDocumento = new List<documento>();
            List<trabajador> ListTrabajador = new List<trabajador>();


            int Anho = DateTime.Now.Year;

            string valor = Convert.ToString(Request.QueryString["date"]);
            if (valor != null)
            {
                ViewState["FechaAlarma"] = Convert.ToDateTime(Request.QueryString["date"]);
            }
            else
            {
                ViewState["FechaAlarma"] = string.Empty + DateTime.Now.ToShortDateString();
            }

            AlarmasDia();
        }

        protected void PrettyCalendar_OnDayRender(object Sender, DayRenderEventArgs e)
        {
            DateTime fechaAlarma = DateTime.Now;

            GrupoLiEntities contexto = new GrupoLiEntities();
            List<alarma> ListaAlarmas = new List<alarma>();
            ListaAlarmas = contexto.alarma.Where(x => x.id_usuario == ObjUsuario.Id_usuario).ToList();
            var distinctList = ListaAlarmas.GroupBy(x => x.fecha).ToList();

            foreach (var item in distinctList)
            {
                int CantAlarmas = item.Count();

                foreach (var item1 in item)
                {
                    fechaAlarma = Convert.ToDateTime(item1.fecha);
                }

                if (e.Day.Date == fechaAlarma)
                {
                    e.Cell.Controls.Add(new LiteralControl("<br/>" +
                        "<a href='index_Calendario.aspx?date=" + fechaAlarma + "'>" +
                        "<span class='badge bg-green'>Alarmas = " + CantAlarmas + "</span>" +
                        "</a>"));
                }

            }
        }

        private void AlarmasDia()
        {
            DateTime fechaBuscar = Convert.ToDateTime(ViewState["FechaAlarma"]);

            ControlesDinamicos.AlarmasDia(ObjUsuario, pAlarmas, fechaBuscar);
        }
    }
}