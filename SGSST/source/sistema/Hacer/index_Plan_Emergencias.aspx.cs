﻿using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Capa_Datos.Manager.Documento;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Plan_Emergencias : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                if (BoolEmpSuc.Item1)
                {
                    Mgr_Empresa.Lista_Empresa(ddlEmpresa);
                }
                else if (BoolEmpSuc.Item2)
                {
                    Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                }
                else
                {
                    cargarPlan();
                }
            }
        }
        private void cargarPlan()
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            int idPlan = Mgr_Documento.Get_Plan(IdSucursal);

            if (idPlan != 0)
            {
                List<plan> ListaPlanes = new List<plan>();
                ListaPlanes = Mgr_Documento.Get_Planes(idPlan, "Emergencias");

                if (ListaPlanes.Count > 0)
                {
                    foreach (var item in ListaPlanes)
                    {
                        txtPlanEmergencia.Text = item.nombre;
                    }
                }
            }
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                txtPlanEmergencia.Text
            };

            PrintFile.PrintContingencias(valores, this);
        }
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            plan tabla = new plan();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Mgr_Documento.Get_Plan(IdSucursal));

            plan nuevo = new plan()
            {
                id_sucursal = IdSucursal,
                nombre = txtPlanEmergencia.Text,
                tipo = "Emergencias"
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            if (ObjUsuario.Error)
            {
                cargarPlan();
                Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            }
        }
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                cargarPlan();
                phCkeditor.Visible = true;
                phCkeditorNo.Visible = false;
            }
        }
    }
}