﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_ObligacionNorma : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private int idMedidasSucursal = 0;
        private int IdSucursal = 0;
        private int IdNorma = 0;
        private int IdEmpresa;
        private  Utilidades objUtilidades = new Utilidades();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            idMedidasSucursal = objUtilidades.descifrarCadena(Request.QueryString["id"]);
            IdSucursal = objUtilidades.descifrarCadena(Request.QueryString["suc"]);
            IdNorma = objUtilidades.descifrarCadena(Request.QueryString["nor"]);
            lbAnho.Text = DateTime.Now.Year.ToString();

            List<sucursal> ListaSucursal = new List<sucursal>();
            ListaSucursal = Getter.Sucursal(Convert.ToInt32(IdSucursal));
            foreach (var item in ListaSucursal)
            {
                IdEmpresa = Convert.ToInt32(item.id_empresa);
            }


            if (!IsPostBack)
            {
                CargarDatos();
                CargarListas();
            }
        }

        private void CargarDatos()
        {
            List<medida_sucursal> ListaMedidasSucursal = new List<medida_sucursal>();
            ListaMedidasSucursal = Getter.Medidas_Sucursal(Convert.ToInt32(idMedidasSucursal));

            foreach (var item in ListaMedidasSucursal)
            {
                lbNorma.Text = item.norma_sucursal.norma.tema_especifico;
                lbMedida.Text = item.descripcion;
            }
        }

        private void CargarListas()
        {
            Listas.Categorias(ddlCategoria, IdEmpresa);
            Listas.Frecuencia(ddlFrecuencia);
            Listas.Usuario_Sucursal(ddlResponsable, Convert.ToInt32(IdSucursal));
            Listas.Actividades_Sucursal(ddlActividad, Convert.ToInt32(IdSucursal), DateTime.Now.Year);
        }

        protected void Volver(object sender, EventArgs e)
        {
            string id_Norma = objUtilidades.cifrarCadena(IdNorma.ToString());
            string Id_Sucursal = objUtilidades.cifrarCadena(IdSucursal.ToString());
            Response.Redirect(Paginas.Update_MedidasMatrizLegal.Value+"?id=" + id_Norma + "&suc=" + Id_Sucursal);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            DateTime fechaActual = DateTime.Now;
            int IdUsuario = Convert.ToInt32(ddlResponsable.SelectedValue);

            obligacion nuevoObli = new obligacion()
            {
                id_medida_sucursal = Convert.ToInt32(idMedidasSucursal),
                fecha_creacion = fechaActual,
                fecha_entrega = Convert.ToDateTime(txtFechaFin.Text),
                id_responsable = Convert.ToInt32(ddlResponsable.SelectedValue),
                id_categorias = Convert.ToInt32(ddlCategoria.SelectedValue),
                prioridad = ddlPrioridad.SelectedValue,
                id_frecuencia_con = Convert.ToInt32(ddlFrecuencia.SelectedValue),
                descripcion = txtDesc.Text,
                acciones = txtAcciones.Text,
                estatus_obl = ddlEstatus.SelectedValue,
                id_identificacion_peligro = 0,
                id_actividad = Convert.ToInt32(ddlActividad.SelectedValue)
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevoObli, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                alarma nuevo = new alarma()
                {
                    descripcion = "Entrega de la obligacion  de la fecha: " + txtFechaFin.Text,
                    fecha = fechaActual,
                    prioridad = "Media",
                    id_categorias = 1,
                    id_usuario = IdUsuario
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            }

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtFechaFin);
            
        }

    }
}