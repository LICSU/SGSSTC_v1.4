﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace SGSST.source.sistema.Planear
{
    public partial class Create_EvaluacionModelo : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
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

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            String[] valores = {
                string.Empty + IdSucursal,
                ddlPuesto.SelectedItem.Text,
                ddlArea.SelectedItem.Text,
                txtModelo.Text
            };

            PrintFile.PrintEvaluacionModelo(valores, this);
            
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
                Listas.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
            }
        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArea.SelectedValue != string.Empty)
            {
                Listas.PuestoTrabajo(ddlPuesto, "idArea", Convert.ToInt32(ddlArea.SelectedValue));
            }
        }
    }
}