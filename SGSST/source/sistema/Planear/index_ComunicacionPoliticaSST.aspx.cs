﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_ComunicacionPoliticaSST : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0, IdSucursalEsp = 0, IdSucursalSub = 0;
        private static int IdTrabajador = 0, IdTrabajadorEsp = 0, IdTrabajadorSub = 0;
        private static int IdPuesto = 0, IdPuestoEsp = 0, IdPuestoSub = 0;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;
            phSucursalSubir.Visible = BoolEmpSuc.Item2;


            if (!IsPostBack)
            {
                //LlenarGridView();
                CargarListas();
            }
        }
        private void CargarListas()
        {

            if (!BoolEmpSuc.Item1)
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalGral, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalSubir, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                IdSucursal = Convert.ToInt32(ObjUsuario.Id_sucursal);
                IdSucursalEsp = Convert.ToInt32(ObjUsuario.Id_sucursal);
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Comunicado_PoliticaSST(
                GridView1,
                IdEmpresa,
                IdSucursal,
                Convert.ToInt32(string.Empty + ViewState["trabajador"]),
                string.Empty + ViewState["sWhere"]);
        }
        #endregion

        #region registrar modales
        protected void btnAgregarEsp_Onclick(object sender, EventArgs e)
        {
            phEspecifico.Visible = true;
            phGeneral.Visible = false;
            phSubir.Visible = false;
        }
        protected void btnAgregarGral_Onclick(object sender, EventArgs e)
        {
            phGeneral.Visible = true;
            phEspecifico.Visible = false;
            phSubir.Visible = false;
        }
        protected void btnSubir_Onclick(object sender, EventArgs e)
        {
            phSubir.Visible = true;
            phEspecifico.Visible = false;
            phGeneral.Visible = false;
        }
        protected void btnComunicado_Onclick(object sender, EventArgs e)
        {
            Modal.registrarModal("IndexAddModal", "AddModalScript", this);
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                string valor = Utilidades_GridView.DevolverIdRow(e, GridView1);
                hdfIDDel.Value = valor;

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        #endregion


        protected void crearlistaGral(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalGral);
            int idPolitica = GetterMax.PoliticaSST(ObjUsuario.Id_empresa);

            List<politica_sst> ListaPolitica = new List<politica_sst>();
            ListaPolitica = Getter.PoliticaSST(idPolitica);

            string Compromisos = string.Empty;
            string Objetivos = string.Empty;
            string Anho = string.Empty;

            if (ListaPolitica.Count == 0)
            {
                Compromisos = "No existen compromisos agregados";
                Objetivos = "No existen objetivos agregados";
                Anho = "Sin anño";
            }
            else
            {
                foreach (var item in ListaPolitica)
                {
                    if (item.compromiso != null) { Compromisos = item.compromiso; }
                    else { Compromisos = "No existen compromisos agregados"; }

                    if (item.objetivos != null) { Objetivos = item.objetivos; }
                    else { Objetivos = "No existen objetivos agregados"; }

                    Anho = Convert.ToString(item.anho);
                }
            }


            List<sucursal> ListaSucursal = new List<sucursal>();
            List<trabajador> ListaTrabajador = new List<trabajador>();

            ListaSucursal = Getter.Sucursal(ObjUsuario.Id_sucursal);
            ListaTrabajador = Getter.Trabajador(0, 0, ObjUsuario.Id_sucursal);

            string[] valores = {
                string.Empty + IdSucursal,
                Anho,
                Compromisos,
                Objetivos,
            }; 

            PrintFile.PrintComunicacionPoliticaSST2(valores, ListaTrabajador, this);
        }

        protected void Guardar(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalAdd);
            int idPolitica = GetterMax.PoliticaSST(ObjUsuario.Id_empresa);
            List<politica_sst> ListaPolitica = new List<politica_sst>();
            ListaPolitica = Getter.PoliticaSST(idPolitica);

            string Compromisos = string.Empty;
            string Objetivos = string.Empty;
            string Anho = string.Empty;

            if (ListaPolitica.Count == 0)
            {
                Compromisos = "No existen compromisos agregados";
                Objetivos = "No existen objetivos agregados";
                Anho = "Sin anño";
            }
            else
            {
                foreach (var item in ListaPolitica)
                {
                    if (item.compromiso != null) { Compromisos = item.compromiso; }
                    else { Compromisos = "No existen compromisos agregados"; }

                    if (item.objetivos != null) { Objetivos = item.objetivos; }
                    else { Objetivos = "No existen objetivos agregados"; }

                    Anho = Convert.ToString(item.anho);
                }
            }
 
            String[] valores = {
                string.Empty + IdSucursal,
                Anho,
                Compromisos,
                Objetivos,
                txtTrabajadorEsp.Text
            };
            PrintFile.PrintComunicacionPoliticaSST(valores, this);

        }

        protected void btnSubirComunicado_OnClick(object sender, EventArgs e)
        {
            int IdEmpresa = ObjUsuario.Id_empresa;
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalSubir);

            string _ruta = Utilidades.GuardarArchivo(
                flpArchivo,
                IdEmpresa + txtNombreSubir.Text,
                "~/source/archivos/comunicado_politicasst/");

            documento nuevo = new documento()
            {
                nombre = txtNombreSubir.Text,
                id_tabla = IdTrabajadorSub,
                ruta = _ruta,
                tipo = "ComunicacionPolitica"
            };

            ObjUsuario.Error = CRUD.Add_Fila(
                nuevo,
                ObjUsuario.Id_usuario,
                HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            documento tabla = new documento();

            ObjUsuario.Error = CRUD.Delete_Fila(tabla,
                Convert.ToInt32(hdfIDDel.Value),
                ObjUsuario.Id_usuario,
                HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }

        #region filtros
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                txtTrabajador.Text = "";
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            //LlenarGridView();
        }
        protected void ddlTrabajador_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void hdnValue_ValueChanged(object sender, EventArgs e)
        {
            ViewState["trabajador"] = IdTrabajador.ToString();
            LlenarGridView();
        }

        protected void ddlSucursalAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalAdd.SelectedValue != string.Empty)
            {
                IdSucursalEsp = Convert.ToInt32(ddlSucursalAdd.SelectedValue);
                txtTrabajadorEsp.Text = "";
            }
        }
        protected void ddlSucursalSubir_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalSubir.SelectedValue != string.Empty)
            {
                IdSucursalSub = Convert.ToInt32(ddlSucursalSubir.SelectedValue);
            }
        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtBuscar.Text != string.Empty)
            {
                ViewState["sWhere"] = txtBuscar.Text;
            }
            else
            {
                ViewState["sWhere"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion

        #region AutoCompletar
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal, ref IdTrabajador, IdPuesto);
            return listTrabajadores;
        }

        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajadorEsp(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursalEsp, ref IdTrabajadorEsp, IdPuestoEsp);
            return listTrabajadores;
        }
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajadorSub(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursalSub, ref IdTrabajadorSub, IdPuestoSub);
            return listTrabajadores;
        }
        #endregion
    }
}