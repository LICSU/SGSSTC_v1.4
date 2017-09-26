using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Update_AsistenciaCapacitacion : Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            if (!IsPostBack)
            {
                CargarAsistencia();
            }
            else
            {
                foreach (var ctlID in Page.Request.Form.AllKeys)
                {
                    if (ctlID != null)
                    {
                        Control c = Page.FindControl(ctlID) as Control;
                        if (c is Button)
                        {
                            if (c.ClientID.Contains("btPrintSave"))
                            {
                                CargarAsistencia();
                            }
                        }
                    }
                }
            }

        }
        private void CargarAsistencia()
        {
            ListItem itemAsis;
            ListItem itemJust;
            ListItem itemInjust;
            ListItem item;
            RadioButtonList miRadio;

            ViewState["Id_gestion"] = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            itemAsis = new ListItem();
            itemJust = new ListItem();
            itemInjust = new ListItem();

            List<trabajador_gestion> ListaTrabajadorGest = new List<trabajador_gestion>();

            ListaTrabajadorGest = Getter.TrabajadorInGestion(0, Convert.ToInt32(string.Empty + ViewState["Id_gestion"]));

            chkAsistencia.Items.Clear();

            int contador = 0;

            foreach (var ItemTrabajador in ListaTrabajadorGest)
            {
                miRadio = new RadioButtonList();
                contador++;

                #region lista trabajadores
                item = new ListItem();
                item.Text = " " + contador + ") " + ItemTrabajador.trabajador.primer_nombre + " " + ItemTrabajador.trabajador.primer_apellido;
                chkAsistencia.Items.Add(item);
                #endregion

                #region lista justificacion
                miRadio.ID = "rblAsis" + contador;

                itemAsis = new ListItem();
                itemJust = new ListItem();
                itemInjust = new ListItem();

                itemAsis.Text = "SI  .";
                itemAsis.Value = "SI  .";

                itemJust.Text = "NO-Justificada .";
                itemJust.Value = "NO-Justificada .";

                itemInjust.Text = "NO-Injustificada .";
                itemInjust.Value = "NO-Injustificada .";

                miRadio.Items.Add(itemAsis);
                miRadio.Items.Add(itemJust);
                miRadio.Items.Add(itemInjust);
                miRadio.RepeatColumns = 3;

                if (ItemTrabajador.asistencia == null)
                {
                    miRadio.Items[0].Selected = false;
                    miRadio.Items[1].Selected = false;
                    miRadio.Items[2].Selected = false;
                }
                else
                {
                    if (ItemTrabajador.asistencia.Contains("SI"))
                    {
                        miRadio.Items[0].Selected = true;
                    }
                    else if (ItemTrabajador.asistencia.Contains("Justificada"))
                    {
                        miRadio.Items[1].Selected = true;
                    }
                    else if (ItemTrabajador.asistencia.Contains("Injustificada"))
                    {
                        miRadio.Items[2].Selected = true;
                    }
                }
                panelAsistencia.Controls.Add(miRadio);

                #endregion
            }
        }
        protected void btPrintSave_Click(object sender, EventArgs e)
        {
            int contRadio = 0;
            RadioButtonList miRadio;

            List<trabajador_gestion> ListaTrabajadorGest = new List<trabajador_gestion>();
            ListaTrabajadorGest = Getter.TrabajadorInGestion(0, Convert.ToInt32(string.Empty + ViewState["Id_gestion"]));

            foreach (Control micontrol in panelAsistencia.Controls)
            {
                contRadio++;
                miRadio = (RadioButtonList)panelAsistencia.FindControl("rblAsis" + contRadio);

                Console.WriteLine(string.Empty + miRadio.SelectedIndex);
                Console.WriteLine(string.Empty + miRadio.SelectedItem);
                Console.WriteLine(string.Empty + miRadio.SelectedValue);
                Console.WriteLine(string.Empty + miRadio.Items[0].Selected);
                Console.WriteLine(string.Empty + miRadio.Items[1].Selected);
                Console.WriteLine(string.Empty + miRadio.Items[2].Selected);
                Console.WriteLine(string.Empty + ListaTrabajadorGest[contRadio - 1].id_trabajador);

                string Asistencia = string.Empty;

                if (miRadio.SelectedValue.Contains("SI"))
                {
                    Asistencia = "SI";
                }
                else if (miRadio.SelectedValue.Contains("Justificada"))
                {
                    Asistencia = "Justificada";
                }
                else if (miRadio.SelectedValue.Contains("Injustificada"))
                {
                    Asistencia = "Injustificada";
                }

                GrupoLiEntities contexto = new GrupoLiEntities();
                int idTrabajador = Convert.ToInt32(ListaTrabajadorGest[contRadio - 1].id_trabajador);
                int idGestion = Convert.ToInt32(ViewState["Id_gestion"]);

                trabajador_gestion Edit = contexto.
                    trabajador_gestion.
                    SingleOrDefault(
                    b => b.id_trabajador == idTrabajador
                    && b.id_ges_lab == idGestion
                    );

                if (Edit != null)
                {
                    Edit.asistencia = Asistencia;
                }

                ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            }

            TextBox txtBuscar = new TextBox();
            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

        }
    }
}