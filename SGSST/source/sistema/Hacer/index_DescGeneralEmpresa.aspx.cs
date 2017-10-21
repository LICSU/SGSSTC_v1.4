using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Capa_Datos.Manager.CodigoCiiu;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Horario;
using Capa_Datos.Manager.Gobierno;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_DescGeneralEmpresa : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                cargarDatos();
            }
        }

        private void cargarDatos()
        {
            if (!BoolEmpSuc.Item2)
            {
                Textbox1.Enabled = false;
                Textbox2.Enabled = false;
                Textbox3.Enabled = false;
                Textbox4.Enabled = false;
                Textbox5.Enabled = false;
                ddlNivelClase.Enabled = false;
                ddlArp.Enabled = false;
                Textbox8.Enabled = false;
                Textbox9.Enabled = false;
                Textbox10.Enabled = false;
                Textbox11.Enabled = false;
                Textbox12.Enabled = false;
                Textbox13.Enabled = false;
                Textbox14.Enabled = false;
            }


            List<sucursal> ListaSucursal = new List<sucursal>();
            ListaSucursal = Mgr_Sucursal.Sucursal(0, ObjUsuario.Id_empresa);

            if (ListaSucursal.Count == 0)
            {
                //label2.Text = "No existen compromisos agregados";
            }
            else
            {
                foreach (var item in ListaSucursal)
                {
                    label2.Text = item.empresa.nombre;
                    Textbox1.Text = item.empresa.representante;
                    Textbox2.Text = item.direccion;
                    label6.Text = item.municipio.nombre;
                    Textbox3.Text = item.fijo;
                    Textbox4.Text = item.movil;
                    Textbox5.Text = item.empresa.email;

                    List<puesto_trabajo> ListaPuestoTrabajo = new List<puesto_trabajo>();
                    ListaPuestoTrabajo = Mgr_PuestoTrabajo.PuestoTrabajo(0, ObjUsuario.Id_empresa, "Administrativa");

                    foreach (var item2 in ListaPuestoTrabajo)
                    {
                        ControlesDinamicos.CrearLiteral("<div class='col-md-6 '><label>" + Mgr_Trabajador.TrabPuesto(Convert.ToInt32(item2.id_puesto_trabajo)) + "</label></div>", pAreaAdm);
                        ControlesDinamicos.CrearLiteral("<div class='col-md-6 '><label>" + item2.nombre + "</label></div>", pAreaAdm);
                    }

                    ListaPuestoTrabajo = Mgr_PuestoTrabajo.PuestoTrabajo(0, ObjUsuario.Id_empresa, "Operativa");
                    foreach (var item3 in ListaPuestoTrabajo)
                    {
                        ControlesDinamicos.CrearLiteral("<div class='col-md-6 '><label>" + Mgr_Trabajador.TrabPuesto(Convert.ToInt32(item3.id_puesto_trabajo)) + "</label></div>", pAreaOpe);
                        ControlesDinamicos.CrearLiteral("<div class='col-md-6 '><label>" + item3.nombre + "</label></div>", pAreaOpe);
                    }

                    ddlNivelClase.SelectedValue = item.empresa.clase_riesgo;

                    List<empresa_itemdivision> ListaEmpresaItem = new List<empresa_itemdivision>();
                    ListaEmpresaItem = Mgr_CodigoCiiu.CodigoCiiu_Empresa(ObjUsuario.Id_empresa);

                    int Actividad = 0;
                    string tituloAct = string.Empty;

                    foreach (var item4 in ListaEmpresaItem)
                    {
                        Actividad++;

                        if (Actividad == 1) { tituloAct = "Actividad Prinicpal"; }
                        if (Actividad == 2) { tituloAct = "Actividad Secundaria"; }
                        if (Actividad == 3) { tituloAct = "Otras Actividades"; }

                        ControlesDinamicos.CrearLiteral("<div class='col-md-12 '><label>" + tituloAct + ": " + item4.claseCiiu.nombre + "</label></div>", pCodigoCiiu);
                    }

                    Mgr_Gobierno.Arl(ddlArp);
                    ddlArp.SelectedValue = Convert.ToString(item.empresa.id_arl);

                    List<horario> ListaHorario = new List<horario>();
                    ListaHorario = Mgr_Horario.ListHorario(ObjUsuario.Id_empresa);
                    foreach (var item5 in ListaHorario)
                    {
                        ControlesDinamicos.CrearLiteral("<div class='col-md-6 '><label>" + item5.nombre + "</label></div>", pHorario);
                    }

                    label19.Text = string.Empty + Mgr_Trabajador.Trabajadores_Empresa(ObjUsuario.Id_empresa);

                    Textbox8.Text = item.empresa.tipo_material;
                    Textbox9.Text = item.empresa.dependencias_adm;
                    Textbox10.Text = item.empresa.dependencias_no_adm;
                    Textbox11.Text = string.Empty + item.empresa.personas_transito;
                    Textbox12.Text = item.empresa.vias_acceso;
                    Textbox13.Text = item.empresa.salida_emergencia;
                    Textbox14.Text = item.empresa.senalizacion;

                }
            }
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int IdEmpresa = ObjUsuario.Id_empresa;
            sucursal Edit = contexto.sucursal.SingleOrDefault(b => b.id_empresa == IdEmpresa && b.sede_principal == 1);
            if (Edit != null)
            {
                Edit.empresa.representante = Textbox1.Text;
                Edit.direccion = Textbox2.Text;
                Edit.fijo = Textbox3.Text;
                Edit.movil = Textbox4.Text;
                Edit.empresa.email = Textbox5.Text;
                Edit.empresa.clase_riesgo = ddlNivelClase.SelectedValue;
                Edit.empresa.id_arl = Convert.ToInt32(ddlArp.SelectedValue);
                Edit.empresa.tipo_material = Textbox8.Text;
                Edit.empresa.dependencias_adm = Textbox9.Text;
                Edit.empresa.dependencias_no_adm = Textbox10.Text;
                Edit.empresa.personas_transito = Convert.ToInt32(Textbox11.Text);
                Edit.empresa.vias_acceso = Textbox12.Text;
                Edit.empresa.salida_emergencia = Textbox13.Text;
                Edit.empresa.senalizacion = Textbox14.Text;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, Textbox1);
        }
    }
}