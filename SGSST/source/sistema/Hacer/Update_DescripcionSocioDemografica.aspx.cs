using Capa_Datos;using Capa_Datos.Manager.Trabajador;using Capa_Datos.Manager.Area;using Capa_Datos.Manager.Sucursal;using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Update_DescripcionSocioDemografica : System.Web.UI.Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private int idPerfil;
        private string NivelEscolaridad = string.Empty;
        private string MotivoDes = string.Empty;
        private string Vivienda = string.Empty;
        private string Servicios = string.Empty;
        private string TipoVivienda = string.Empty;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            idPerfil = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            if (!IsPostBack)
            {
                Listas.EPS(ddlEps);
                Listas.AFP(ddlFondo);
                CargarUsuario();
            }
        }

        private void CargarUsuario()
        {
            List<desc_socio> ListaDescSocio = new List<desc_socio>();
            ListaDescSocio = Getter.DescripcionSociodemografica(Convert.ToInt32(idPerfil));

            foreach (var item in ListaDescSocio)
            {
                #region bloque 1
                ddlTrabajador.Text = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
                txtLugar.Text = item.lugar_nac;
                string nivel_escolar = item.nivel_escolaridad;

                if (nivel_escolar != "Ninguno" && nivel_escolar != "Primaria Incompleta" && nivel_escolar != "Primaria Completa"
                    && nivel_escolar != "Secundaria Incompleta" && nivel_escolar != "Secundaria Completa" && nivel_escolar != "Tecnica"
                    && nivel_escolar != "Universitario" && nivel_escolar != "Diplomado" && nivel_escolar != "Especializacion"
                    && nivel_escolar != "Maestria" && nivel_escolar != "Doctorado" && nivel_escolar != "Otro")
                {
                    txtNivel.Text = nivel_escolar;
                    txtNivel.Visible = true;
                    txtAnhosApro.Enabled = true;
                }
                else if (nivel_escolar == "Ninguno")
                {
                    txtAnhosApro.Enabled = false;
                    txtNivel.Visible = false;
                    rblNivel.SelectedValue = nivel_escolar;
                }
                else
                {
                    rblNivel.SelectedValue = nivel_escolar;
                    txtNivel.Visible = false;
                    txtAnhosApro.Enabled = true;
                }

                txtAnhosApro.Text = item.años_aprob;
                rdlCabeza.SelectedValue = item.cabeza_fam;

                ddlHijos.SelectedValue = Convert.ToInt32(item.num_hijos).ToString();

                rblResponsabilidad.SelectedValue = item.repart_resp;

                ddlMenores.SelectedValue = Convert.ToInt32(item.menores_dep).ToString(); ;

                string condicion = item.cond_social;
                rblCondicion.SelectedValue = condicion;
                if (condicion == "Desplazado")
                {
                    phDesplazado.Visible = true;
                    rblMotivo.SelectedValue = item.mot_despl;
                }

                dblVivienda.SelectedValue = item.tipo_vivienda;

                string servicios = item.serv_pub;
                string[] vecServicios = servicios.Split(',');
                for (int i = 0; i < cblServicios.Items.Count; i++)
                {
                    for (int j = 0; j < vecServicios.Length; j++)
                    {
                        if (cblServicios.Items[i].Text == vecServicios[j])
                        {
                            cblServicios.Items[i].Selected = true;
                        }
                    }
                }
                dblTipoVivienda.SelectedValue = item.vivienda.Trim();
                rblIndustria.SelectedValue = item.industria.Trim();
                rblRuido.SelectedValue = item.ruido.Trim();
                rblContaminacion.SelectedValue = item.contaminacion.Trim();
                txtDescripcion.Text = item.descripcion.Trim();
                string seg_social = item.sist_seg_soc;
                dblSeguridad.SelectedValue = seg_social;
                if (seg_social == "Si")
                {
                    phRegimen.Visible = true;
                    string regimen = item.reg_afiliacion;
                    rblRegimen.SelectedValue = regimen;
                    if (regimen == "Subsidiado")
                    {
                        phRegimen2.Visible = true;
                    }
                    phRegimen3.Visible = true;
                    //txtEps.Text = ListaDescSocio.eps.nombre;
                }
                string pensiones = item.afi_sssp;
                rblPensiones.SelectedValue = pensiones;
                if (pensiones == "Si")
                {
                    phPensiones1.Visible = true;
                    //txtFondo.Text = ListaDescSocio.fondo;
                }
                rblEstrato.SelectedValue = item.estrato.Trim();
                #endregion

                #region bloque2
                int contador = 0;
                foreach (var item1 in item.empleo_anterior)
                {
                    contador++;
                    string empresa = item1.empresa;
                    if (empresa != string.Empty)
                    {
                        if (contador == 1)
                        {
                            txtEmpresa1.Text = empresa;
                            txtArea1.Text = item1.area;
                            txtCargo1.Text = item1.cargo;
                            txtAños1.Text = item1.años;
                            txtMeses1.Text = item1.meses;
                            txtEnfermadades1.Text = item1.enfermedades;
                        }
                        else if (contador == 2)
                        {
                            txtEmpresa2.Text = empresa;
                            txtArea2.Text = item1.area;
                            txtCargo2.Text = item1.cargo;
                            txtAños2.Text = item1.años;
                            txtMeses2.Text = item1.meses;
                            txtEnfermadades2.Text = item1.enfermedades;
                        }
                        else if (contador == 3)
                        {
                            txtEmpresa3.Text = empresa;
                            txtArea3.Text = item1.area;
                            txtCargo3.Text = item1.cargo;
                            txtAños3.Text = item1.años;
                            txtMeses3.Text = item1.meses;
                            txtEnfermadades3.Text = item1.enfermedades;
                        }
                    }
                }
                #endregion
            }

        }

        protected bool validarCampos()
        {
            bool resultado = true;

            string AñosAprobados = string.Empty;

            if (rblNivel.SelectedValue == "Otro")
            {
                NivelEscolaridad = txtNivel.Text;
                AñosAprobados = txtAnhosApro.Text;

                if (NivelEscolaridad == string.Empty || AñosAprobados == string.Empty)
                {
                    resultado = false;
                }
            }
            else if (rblNivel.SelectedValue == "Ninguno")
            {
                NivelEscolaridad = "Ninguno";
            }
            else
            {
                NivelEscolaridad = rblNivel.SelectedValue;
                AñosAprobados = txtAnhosApro.Text;
                if (NivelEscolaridad == string.Empty || AñosAprobados == string.Empty)
                {
                    resultado = false;
                }
            }

            string Social = rblCondicion.SelectedValue;

            if (Social == "Desplazado")
            {
                if (rblMotivo.SelectedValue != "Otro")
                {
                    MotivoDes = rblMotivo.SelectedValue;
                }
                else
                {
                    MotivoDes = txtOtroMotivo.Text;
                    if (MotivoDes == string.Empty)
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


            string SeguridadSocial =  dblSeguridad.SelectedValue;

            if (SeguridadSocial == "Si")
            {
                string Regimen = rblRegimen.SelectedValue;
                
                if (ddlEps.SelectedValue == string.Empty)
                {
                    resultado = false;
                }
            }
             

            TipoVivienda = dblTipoVivienda.SelectedValue;

            if (TipoVivienda == "Otro")
            {
                TipoVivienda = txtTipoVivienda.Text;
                if (TipoVivienda == string.Empty)
                {
                    resultado = false;
                }
            } 

            return resultado;
        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            if (validarCampos())
            {
                int id_fondo = 0, id_eps = 0;
                if (ddlFondo.SelectedValue != string.Empty)
                {
                    id_fondo = Convert.ToInt32(ddlFondo.SelectedValue);
                }
                if (ddlEps.SelectedValue != string.Empty)
                {
                    id_eps = Convert.ToInt32(ddlEps.SelectedValue);
                }

                GrupoLiEntities contexto = new GrupoLiEntities();

                desc_socio Edit = contexto.desc_socio.SingleOrDefault(b => b.id_desc_socio == idPerfil);
                if (Edit != null)
                {
                    Edit.lugar_nac = txtLugar.Text; 
                    Edit.nivel_escolaridad = NivelEscolaridad;
                    Edit.años_aprob = txtAnhosApro.Text;
                    Edit.cabeza_fam = rdlCabeza.SelectedValue;
                    Edit.num_hijos = ddlHijos.SelectedValue;
                    Edit.repart_resp = rblResponsabilidad.SelectedValue;
                    Edit.menores_dep = ddlMenores.SelectedValue;
                    Edit.cond_social = rblCondicion.SelectedValue;
                    Edit.mot_despl = MotivoDes;
                    Edit.tipo_vivienda = Vivienda;
                    Edit.serv_pub = Servicios;
                    Edit.sist_seg_soc = dblSeguridad.SelectedValue;
                    Edit.reg_afiliacion = rblRegimen.SelectedValue;
                    Edit.nivel_sisben = rblNivelSisben.SelectedValue;
                    Edit.id_eps = id_eps;
                    Edit.afi_sssp = rblPensiones.SelectedValue;
                    Edit.id_afp = id_fondo;
                    Edit.estrato = rblEstrato.SelectedValue;
                    Edit.vivienda = TipoVivienda;
                    Edit.industria = rblIndustria.SelectedValue;
                    Edit.ruido = rblRuido.SelectedValue;
                    Edit.contaminacion = rblContaminacion.SelectedValue;
                    Edit.descripcion = txtDescripcion.Text;
                }

                ObjUsuario.Error = CRUD.Edit_Fila(contexto);

                TextBox txtBuscar = new TextBox();
                Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

                if (ObjUsuario.Error)
                {
                    #region  GUARDAR EMPLEOS ANTERIORES...

                    limpiarCampos();

                    List<desc_socio> ListaDescSocio = new List<desc_socio>();
                    ListaDescSocio = Getter.DescripcionSociodemografica(Convert.ToInt32(ViewState["DescID"]));

                    foreach (var itemDesc in ListaDescSocio)
                    {
                        int contador = 0;
                        foreach (var item in itemDesc.empleo_anterior)
                        {
                            contador++;
                            string empresa = item.empresa;

                            if (contador == 1)
                            {
                                #region empresa1
                                if (empresa == string.Empty)
                                {
                                    empleo_anterior nuevo1 = new empleo_anterior()
                                    {
                                        empresa = txtEmpresa1.Text,
                                        area = txtArea1.Text,
                                        cargo = txtCargo1.Text,
                                        años = txtAños1.Text,
                                        meses = txtMeses1.Text,
                                        enfermedades = txtEnfermadades1.Text,
                                        id_desc_socio = Convert.ToInt32(ViewState["DescID"])
                                    };
                                    ObjUsuario.Error = CRUD.Add_Fila(nuevo1);
                                }
                                else
                                {
                                    GrupoLiEntities contexto1 = new GrupoLiEntities();
                                    int idEmpleoAnt = item.id_empleos_ant;
                                    empleo_anterior Edit1 = contexto.empleo_anterior.SingleOrDefault(b => b.id_empleos_ant == idEmpleoAnt);
                                    if (Edit != null)
                                    {
                                        Edit1.empresa = txtEmpresa1.Text;
                                        Edit1.area = txtArea1.Text;
                                        Edit1.cargo = txtCargo1.Text;
                                        Edit1.años = txtAños1.Text;
                                        Edit1.meses = txtMeses1.Text;
                                        Edit1.enfermedades = txtEnfermadades1.Text;
                                    }
                                    ObjUsuario.Error = CRUD.Edit_Fila(contexto1);
                                }
                                #endregion
                            }
                            else if (contador == 2)
                            {
                                #region empresa2
                                if (empresa == string.Empty)
                                {
                                    empleo_anterior nuevo2 = new empleo_anterior()
                                    {
                                        empresa = txtEmpresa2.Text,
                                        area = txtArea2.Text,
                                        cargo = txtCargo2.Text,
                                        años = txtAños2.Text,
                                        meses = txtMeses2.Text,
                                        enfermedades = txtEnfermadades2.Text,
                                        id_desc_socio = Convert.ToInt32(ViewState["DescID"])
                                    };
                                    ObjUsuario.Error = CRUD.Add_Fila(nuevo2);
                                }
                                else
                                {
                                    GrupoLiEntities contexto1 = new GrupoLiEntities();
                                    int idEmpleoAnt = item.id_empleos_ant;
                                    empleo_anterior Edit1 = contexto.empleo_anterior.SingleOrDefault(b => b.id_empleos_ant == idEmpleoAnt);
                                    if (Edit != null)
                                    {
                                        Edit1.empresa = txtEmpresa2.Text;
                                        Edit1.area = txtArea2.Text;
                                        Edit1.cargo = txtCargo2.Text;
                                        Edit1.años = txtAños2.Text;
                                        Edit1.meses = txtMeses2.Text;
                                        Edit1.enfermedades = txtEnfermadades2.Text;
                                    }
                                    ObjUsuario.Error = CRUD.Edit_Fila(contexto1);
                                }
                                #endregion

                            }
                            else if (contador == 3)
                            {
                                #region empresa3
                                if (empresa == string.Empty)
                                {
                                    empleo_anterior nuevo3 = new empleo_anterior()
                                    {
                                        empresa = txtEmpresa3.Text,
                                        area = txtArea3.Text,
                                        cargo = txtCargo3.Text,
                                        años = txtAños3.Text,
                                        meses = txtMeses3.Text,
                                        enfermedades = txtEnfermadades3.Text,
                                        id_desc_socio = Convert.ToInt32(ViewState["DescID"])
                                    };
                                    ObjUsuario.Error = CRUD.Add_Fila(nuevo3);
                                }
                                else
                                {
                                    GrupoLiEntities contexto1 = new GrupoLiEntities();
                                    int idEmpleoAnt = item.id_empleos_ant;
                                    empleo_anterior Edit1 = contexto.empleo_anterior.SingleOrDefault(b => b.id_empleos_ant == idEmpleoAnt);
                                    if (Edit != null)
                                    {
                                        Edit1.empresa = txtEmpresa3.Text;
                                        Edit1.area = txtArea3.Text;
                                        Edit1.cargo = txtCargo3.Text;
                                        Edit1.años = txtAños3.Text;
                                        Edit1.meses = txtMeses3.Text;
                                        Edit1.enfermedades = txtEnfermadades3.Text;
                                    }
                                    ObjUsuario.Error = CRUD.Edit_Fila(contexto1);
                                }
                                #endregion
                            }
                        }
                    }

                    Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
                    limpiarCampos();

                    Response.Redirect(Paginas.index_DescripcionSocioDemografica.Value); 
                    #endregion
                }
            }
        }

        private void limpiarCampos()
        {
            txtLugar.Text = string.Empty;
            txtNivel.Text = string.Empty;
            txtAnhosApro.Text = string.Empty;
        }
        #endregion

        #region eventos
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