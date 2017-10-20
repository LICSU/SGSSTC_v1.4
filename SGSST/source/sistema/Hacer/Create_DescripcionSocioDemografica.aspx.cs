using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_DescripcionSocioDemografica : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        public static int IdTrabajador = 0;
        public static int IdSucursal = 0;
        private string MotivoDes;
        private string Vivienda;
        private string Servicios;
        private string TipoVivienda;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this); phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
            }

        }

        private void CargarListas()
        {
            if (!BoolEmpSuc.Item1)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                IdSucursal = ObjUsuario.Id_sucursal;
                Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
            }

            Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            Listas.EPS(ddlEps);
            Listas.AFP(ddlFondo);
        }

        private bool validarCampos()
        {
            bool resultado = true;

            if (rblNivel.SelectedValue == "Otro")
            {
                if (txtNivel.Text == string.Empty || txtAnhosApro.Text == string.Empty)
                {
                    resultado = false;
                }
            }
            else if (rblNivel.SelectedValue == "Ninguno")
            {
                txtNivel.Text = "Ninguno";
            }
            else
            {
                txtNivel.Text = rblNivel.SelectedValue;
                if (txtNivel.Text == string.Empty || txtAnhosApro.Text == string.Empty)
                {
                    resultado = false;
                }
            }

            if (rblCondicion.SelectedValue == "Desplazado")
            {
                if (rblMotivo.SelectedValue != "Otro")
                {
                    MotivoDes = rblMotivo.SelectedValue;
                }
                else
                {
                    MotivoDes = txtOtroMotivo.Text;
                    if (txtOtroMotivo.Text == string.Empty)
                    {
                        resultado = false;
                    }
                }
            }

            if (dblVivienda.SelectedValue != "Otro")
            {
                Vivienda = dblVivienda.SelectedValue;
            }
            else
            {
                Vivienda = txtOtroVivienda.Text;
                if (Vivienda == string.Empty)
                {
                    resultado = true;
                }
            }

            for (int i = 0; i < cblServicios.Items.Count; i++)
            {
                if (cblServicios.Items[i].Selected)
                {
                    Servicios += cblServicios.Items[i].Text + ",";
                }
            }

            if (dblSeguridad.SelectedValue == "Si")
            {
                if (ddlEps.SelectedValue == string.Empty)
                {
                    resultado = false;
                }
            }

            TipoVivienda = dblTipoVivienda.SelectedValue;
            if (dblTipoVivienda.SelectedValue == "Otro")
            {
                TipoVivienda = txtTipoVivienda.Text;
                if (TipoVivienda == string.Empty)
                {
                    resultado = false;
                }
            }

            return resultado;
        }

        private void limpiarCampos()
        {
            txtNivel.Text = string.Empty;
            txtAnhosApro.Text = string.Empty;
            ddlEps.SelectedValue = string.Empty;
            ddlFondo.SelectedValue = string.Empty;
        }

        protected void GuardarRegistro(object sender, EventArgs e)
        {
            if (validarCampos() && IdTrabajador != 0)
            {
                int id_fondo = 0, id_eps = 0;
                IdTrabajador = Convert.ToInt32(ddlTrabajador.SelectedValue);

                if (ddlFondo.SelectedValue != string.Empty)
                {
                    id_fondo = Convert.ToInt32(ddlFondo.SelectedValue);
                }
                if (ddlEps.SelectedValue != string.Empty)
                {
                    id_eps = Convert.ToInt32(ddlEps.SelectedValue);
                }

                desc_socio nuevoDesc = new desc_socio()
                {
                    id_trabajador = IdTrabajador,
                    //lugar_nac = txtLugar.Text,
                    nivel_escolaridad = rblNivel.SelectedValue,
                    años_aprob = txtAnhosApro.Text,
                    cabeza_fam = rdlCabeza.SelectedValue,
                    num_hijos = ddlHijos.Text,
                    repart_resp = rblResponsabilidad.SelectedValue,
                    menores_dep = ddlMenores.Text,
                    cond_social = rblCondicion.Text,
                    mot_despl = MotivoDes,
                    tipo_vivienda = Vivienda,
                    serv_pub = Servicios,
                    sist_seg_soc = dblSeguridad.SelectedValue,
                    reg_afiliacion = rblRegimen.SelectedValue,
                    nivel_sisben = rblNivelSisben.SelectedValue,
                    id_eps = id_eps,
                    afi_sssp = rblPensiones.SelectedValue,
                    id_afp = id_fondo,
                    estrato = rblEstrato.SelectedValue,
                    vivienda = TipoVivienda,
                    industria = rblIndustria.SelectedValue,
                    ruido = rblRuido.SelectedValue,
                    contaminacion = rblContaminacion.SelectedValue,
                    descripcion = txtDescripcion.Text
                };

                ObjUsuario.Error = CRUD.Add_Fila(nuevoDesc);

                if (ObjUsuario.Error)
                {
                    #region INSERTAR en Empleos Anteriores
                    if (txtEmpresa1.Text != string.Empty)
                    {
                        empleo_anterior nuevo1 = new empleo_anterior()
                        {
                            empresa = txtEmpresa1.Text,
                            area = txtArea1.Text,
                            cargo = txtCargo1.Text,
                            años = txtAños1.Text,
                            meses = txtMeses1.Text,
                            enfermedades = txtEnfermadades1.Text,
                            id_desc_socio = GetterMax.DescripcionSociodemografica()
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevo1);
                    }
                    if (txtEmpresa2.Text != string.Empty)
                    {
                        empleo_anterior nuevo2 = new empleo_anterior()
                        {
                            empresa = txtEmpresa2.Text,
                            area = txtArea2.Text,
                            cargo = txtCargo2.Text,
                            años = txtAños2.Text,
                            meses = txtMeses2.Text,
                            enfermedades = txtEnfermadades2.Text,
                            id_desc_socio = GetterMax.DescripcionSociodemografica()
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevo2);
                    }
                    if (txtEmpresa3.Text != string.Empty)
                    {
                        empleo_anterior nuevo3 = new empleo_anterior()
                        {
                            empresa = txtEmpresa3.Text,
                            area = txtArea3.Text,
                            cargo = txtCargo3.Text,
                            años = txtAños3.Text,
                            meses = txtMeses3.Text,
                            enfermedades = txtEnfermadades3.Text,
                            id_desc_socio = GetterMax.DescripcionSociodemografica()
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevo3);
                    }
                    #endregion
                }

                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
                limpiarCampos();
                Response.Redirect(Paginas.index_DescripcionSocioDemografica.Value);
            }
        }
        #endregion

        #region eventos
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = 0;
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                id = Convert.ToInt32(ddlEmpresa.SelectedValue);
                Mgr_Sucursal.Sucursal(ddlSucursal, id);
            }

        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                Mgr_Trabajador.Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
            }
        }
        protected void rblNivel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblNivel.SelectedValue == "Otro")
                txtNivel.Visible = true;
            else
                txtNivel.Visible = false;

            if (rblNivel.SelectedValue != "Ninguno")
                txtAnhosApro.Enabled = true;
            else
                txtAnhosApro.Enabled = false;
        }
        protected void rblCondicion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblCondicion.SelectedValue == "Desplazado")
                phDesplazado.Visible = true;
            else
                phDesplazado.Visible = false;
        }
        protected void rblMotivo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblMotivo.SelectedValue == "Otro")
                txtOtroMotivo.Visible = true;
            else
                txtOtroMotivo.Visible = false;
        }
        protected void dblVivienda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dblVivienda.SelectedValue == "Otro")
                txtOtroVivienda.Visible = true;
            else
                txtOtroVivienda.Visible = false;
        }
        protected void dblSeguridad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dblSeguridad.SelectedValue != "Si")
            {
                phRegimen.Visible = false;
            }
            else
            {
                phRegimen.Visible = true;
            }
        }
        protected void rblRegimen_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblRegimen.SelectedValue == "Contributivo")
            {
                phRegimen2.Visible = false;
                phRegimen3.Visible = true;
            }
            else
            {
                phRegimen2.Visible = true;
                phRegimen3.Visible = true;
            }
        }
        protected void rblPensiones_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblPensiones.SelectedValue != "Si")
            {
                phPensiones1.Visible = false;
            }
            else
            {
                phPensiones1.Visible = true;
            }
        }
        protected void dblTipoVivienda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dblTipoVivienda.SelectedValue == "Otro")
            {
                txtTipoVivienda.Visible = true;
            }
            else
            {
                txtTipoVivienda.Visible = false;
            }
        }
        #endregion
    }
}