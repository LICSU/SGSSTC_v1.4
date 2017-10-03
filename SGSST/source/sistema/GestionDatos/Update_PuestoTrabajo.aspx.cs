using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class Update_PuestoTrabajo : System.Web.UI.Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);
            phEmpresa1.Visible = BoolEmpSuc.Item1;
            phSucursal1.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            int idPuestos = 0;
            idPuestos = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            List<puesto_trabajo> ListaPuestos = new List<puesto_trabajo>();
            ListaPuestos = Getter.PuestoTrabajo(idPuestos, 0, "");

            foreach (var itemPuestos in ListaPuestos)
            {
                txtNombre.Text = itemPuestos.nombre;
                txtDescripcion.Text = itemPuestos.descripcion;
                txtRecursoHumano.Text = itemPuestos.recurso_humano;
                txtObjetoTrabajo.Text = itemPuestos.objeto_trabajo;
                txtInsumos.Text = itemPuestos.insumos;
                txtMaquinas.Text = itemPuestos.maquinas;
                txtHerramientas.Text = itemPuestos.herramientas;
                txtEmisiones.Text = itemPuestos.emisiones;
                txtProductos.Text = itemPuestos.productos;
                txtDesechos.Text = itemPuestos.desechos;

                ImgFoto.ImageUrl = itemPuestos.foto;
                ViewState["url"] = string.Empty + itemPuestos.foto;

                Listas.Empresa(ddlEmpresa);
                ddlEmpresa.SelectedValue = Convert.ToString(itemPuestos.area.sucursal.id_empresa);

                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ddlSucursal.SelectedValue = Convert.ToString(itemPuestos.area.id_sucursal);

                Listas.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
                ddlArea.SelectedValue = Convert.ToString(itemPuestos.id_area);
                Listas.Epp(ddlEpp);

                List<puesto_trabajo_epp> ListaPuestoTrabajo_Epp = new List<puesto_trabajo_epp>();
                ListaPuestoTrabajo_Epp = new List<puesto_trabajo_epp>();
                ListaPuestoTrabajo_Epp = Getter.PuestoEpp(idPuestos);

                foreach (ListItem li in ddlEpp.Items)
                {
                    for (int i = 0; i < ListaPuestoTrabajo_Epp.Count; i++)
                    {
                        if (Convert.ToInt32(li.Value) == ListaPuestoTrabajo_Epp.ElementAt(i).id_epp)
                        {
                            li.Selected = true;
                        }
                    }
                }
            }
        }

        private void CargarListas()
        {
            Listas.Epp(ddlEpp);
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int idPuestos = 0;
            idPuestos = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            string ruta = ViewState["url"].ToString();

            if (fuAnexo.HasFile)
                ruta = Utilidades.GuardarImagen(fuAnexo, txtNombre.Text + "PuestoTrabajo", "~/archivos/puesto_trabajo/");

            GrupoLiEntities contextoEdit = new GrupoLiEntities();
            puesto_trabajo Edit = contextoEdit.puesto_trabajo.SingleOrDefault(b => b.id_puesto_trabajo == idPuestos);

            if (Edit != null)
            {
                Edit.nombre = txtNombre.Text;
                Edit.descripcion = txtDescripcion.Text;
                Edit.recurso_humano = txtRecursoHumano.Text;
                Edit.objeto_trabajo = txtObjetoTrabajo.Text;
                Edit.insumos = txtInsumos.Text;
                Edit.maquinas = txtMaquinas.Text;
                Edit.herramientas = txtHerramientas.Text;
                Edit.emisiones = txtEmisiones.Text;
                Edit.productos = txtProductos.Text;
                Edit.desechos = txtDesechos.Text;
                Edit.foto = ruta;
                Edit.id_area = Convert.ToInt32(ddlArea.SelectedValue);
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contextoEdit);

            if (ObjUsuario.Error)
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                if (ddlEpp.SelectedValue != string.Empty)
                {
                    foreach (ListItem li in ddlEpp.Items)
                    {
                        int idEpp = Convert.ToInt32(li.Value);

                        if (li.Selected)
                        {
                            int existe = Getter.PuestoEppValue(idPuestos, idEpp);
                            if (existe == 0)
                            {
                                puesto_trabajo_epp nuevopuestoEpp = new puesto_trabajo_epp()
                                {
                                    id_puesto_trabajo = idPuestos,
                                    id_epp = idEpp
                                };
                                ObjUsuario.Error = CRUD.Add_Fila(nuevopuestoEpp);
                            }
                        }
                        else
                        {
                            int existe = Getter.PuestoEppValue(idPuestos, idEpp);
                            if (existe == 1)
                            {
                                int idPEpp = Getter.Trae_ID_PEPP(idPuestos, idEpp);
                                puesto_trabajo_epp tabla = new puesto_trabajo_epp();
                                ObjUsuario.Error = CRUD.Delete_Fila(tabla, idPEpp);
                            }
                        }
                    }
                }
            }


            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtNombre);

        }

        protected void ddlEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                Listas.Epp(ddlEpp);
            }
        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                Listas.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue));
            }
        }
    }
}