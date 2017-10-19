using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Area;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_RecursosEconomicos : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private  Utilidades objUtilidades = new Utilidades();

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                LlenarGridView();
                CargarListas();
            }
        }
        private void CargarListas()
        {
            Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            Mgr_Sucursal.Sucursal(ddlSucursalSubir, ObjUsuario.Id_empresa);
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Mgr_Empresa.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Mgr_Sucursal.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.RecursosEconomicos(GridView1, IdEmpresa, IdSucursal, string.Empty + ViewState["sWhere"]);

        }
        #endregion

        #region acciones
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_RecursosEconomicos.Value);
        }
        protected void btnSubir_Click(object sender, EventArgs e)
        {
        }
        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            int IdEmpresa = ObjUsuario.Id_empresa;
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursalSubir);

            string _ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + "_InformeRecursosEconomicos_" + IdSucursal, "~/archivos/recursos_economicos/");

            documento nuevo = new documento()
            {
                nombre = txtNombreSubir.Text,
                id_tabla = IdSucursal,
                ruta = _ruta,
                tipo = "RecursosEconomicos"
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            if (ObjUsuario.Error)
            {
                int idRec = GetterMax.RecursosEconmicos(IdSucursal);

                if (fuSoporte.HasFile)
                {
                    int i = 0;
                    foreach (var archivo in fuSoporte.PostedFiles)
                    {
                        i++;
                        string ruta = Utilidades.GuardarArchivo(archivo, "Soporte_" + txtNombreSubir.Text + "_" + i, "~/archivos/recursos_economicos/");

                        soporte nuevoFA = new soporte()
                        {
                            url = ruta,
                            id_tabla = idRec,
                            tabla = "RecursosEconomicos"
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoFA);

                    }
                }
            }

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            documento tabla = new documento();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla,Convert.ToInt32(hdfIDDel.Value));

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                hdfIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            if (e.CommandName.Equals("soporte"))
            {
                hdSoporte.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                int contadorArchivos = 0;

                List<soporte> ListSopRec = new List<soporte>();
                ListSopRec = Getter.Soporte(Convert.ToInt32(hdSoporte.Value), "RecursosEconomicos");

                ControlesDinamicos.CrearLiteral("<ul class='list-group'>", pAnexo);

                HyperLink HyperLink1;
                foreach (var item1 in ListSopRec)
                {
                    contadorArchivos++;
                    if (contadorArchivos % 2 == 0)
                    {
                        ControlesDinamicos.CrearLiteral("<li class='list-group-item'>", pAnexo);
                    }
                    else
                    {
                        ControlesDinamicos.CrearLiteral("<li class='list-group-item list-group-item-info'>", pAnexo);
                    }
                    HyperLink1 = new HyperLink();
                    HyperLink1.NavigateUrl = item1.url;
                    HyperLink1.Target = "_blank";
                    HyperLink1.Text = "Ver Archivo " + contadorArchivos;
                    pAnexo.Controls.Add(HyperLink1);
                    ControlesDinamicos.CrearLiteral("</ li >", pAnexo);
                }
                ControlesDinamicos.CrearLiteral("</ ul > ", pAnexo);

                Modal.registrarModal("soporteModal", "SoporteModalScript", this);
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        #endregion

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
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
    }
}