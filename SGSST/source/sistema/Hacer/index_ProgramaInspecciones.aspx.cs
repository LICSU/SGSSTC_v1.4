﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_ProgramaInspecciones : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
                if (BoolEmpSuc.Item2)
                {
                    Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                }
                else
                {
                    cargarPlan();
                }
            }
        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }
        private void cargarPlan()
        {
            int idPlan = GetterMax.Plan(ObjUsuario.Id_sucursal);

            if (idPlan != 0)
            {
                List<plan> ListaPlanes = new List<plan>();
                ListaPlanes = Getter.Planes(idPlan);

                if (ListaPlanes.Count > 0)
                {
                    foreach (var item in ListaPlanes)
                    {
                        txtProgInspecciones.Text = item.nombre;
                    }
                }
            }
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                txtProgInspecciones.Text
            };

            PrintFile.PrintProgramaInspecciones(valores, this);
        }
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            plan nuevo = new plan()
            {
                id_sucursal = ObjUsuario.Id_sucursal,
                nombre = txtProgInspecciones.Text
            };

            ObjUsuario.Error = CRUD.Add_Fila(
                nuevo,
                ObjUsuario.Id_usuario,
                HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtProgInspecciones);
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                phCkeditor.Visible = true;
                phCkeditorno.Visible = false;
                cargarPlan();
            }
        }
    }
}