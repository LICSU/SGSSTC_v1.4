using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Area : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private int strNivel = 0;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
            phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;
            phSucursalEdit.Visible = BoolEmpSuc.Item2;

            if (ObjUsuario.isAdm_Sucursal())
            {
                phAgregar.Visible = true;
            }
            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
            }

        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
                Listas.Empresa(ddlEmpresaAdd);
            }
            else
            {
                Listas.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalEdit, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.Area_Sucursal(ddlAreasAdd, ObjUsuario.Id_sucursal);
                Listas.Area_Sucursal(ddlAreasEdit, ObjUsuario.Id_sucursal);
            }
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Area_General(GridView1,
                IdEmpresa,
                IdSucursal,
                string.Empty + ViewState["nivel"],
                string.Empty + ViewState["Num1"],
                string.Empty + ViewState["Num2"],
                string.Empty + ViewState["sWhere"]);
        }
        #endregion

        #region acciones
        protected void AgregarRegistroModal(object sender, EventArgs e)
        {
            
            Modal.registrarModal("addModal", "AddModalScript", this);
        }

        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            int IdSucursal = 0;

            if (BoolEmpSuc.Item1)
            {
                IdSucursal = Convert.ToInt32(ddlSucursalAdd.SelectedValue);
            }
            else
            {
                IdSucursal = ObjUsuario.Id_sucursal;
            }
            
            if (Getter.AreaByNombre(txtNombre.Text, IdSucursal) == 0)
            {
                IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalAdd);

                String[] valores = {
                    ddlAreasAdd.SelectedValue,
                    ""+strNivel,
                    txtNombre.Text,
                    ""+IdSucursal,
                    ddlTipoAreaAdd.SelectedValue
                };

                ObjUsuario.Error = CRUD.Add_Area(ObjUsuario, chkAreaPadre, valores);

                Modal.CerrarModal("addModal", "AddModalScript", this);

                Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

                limpiarCampos();

                LlenarGridView();
            }
            else
            {
                txtNombre.BorderColor = Color.Red;
                Modal.MostrarMsjModal(MensajeError.Error_Existe_Area_Nombre.Value, "ERR", this);
            }


        }

        protected void limpiarCampos()
        {
            txtNombre.Text = "";
            ddlTipoAreaAdd.SelectedValue = "";
            ddlEmpresaAdd.SelectedValue = "";
            ddlSucursalAdd.SelectedValue = "";
            chkAreaPadre.Checked = false;
        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalEdit);

            int id_area_padre = 0;

            if (!chkAreaEdit.Checked || ddlAreasEdit.SelectedValue == string.Empty)
            {
                strNivel = 1;
            }
            else
            {
                id_area_padre = Convert.ToInt32(ddlAreasEdit.SelectedValue);

                List<area> ListaArea = new List<area>();
                ListaArea = Getter.Area(0, Convert.ToInt32(ddlAreasEdit.SelectedValue), "");

                foreach (var item in ListaArea)
                {
                    strNivel = Convert.ToInt32(item.nivel.ToString());
                }

                if (strNivel == 3) { strNivel = 4; }
                if (strNivel == 2) { strNivel = 3; }
                if (strNivel == 1) { strNivel = 2; }
            }

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idArea = Convert.ToInt32(hdfAreaID.Value);
            area Edit = contexto.area.SingleOrDefault(b => b.id_area == idArea);
            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_sucursal = IdSucursal;
                Edit.id_area_padre = id_area_padre;
                Edit.nivel = strNivel;
                Edit.tipo = ddlTipoAreaEdit.SelectedValue;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.CerrarModal("editModal", "EditModalScript", this);

            Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

            LlenarGridView();
            CargarListas();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            area tabla = new area();
            int idArea = 0;
            List<usuario> usuarioData = Getter.AreaByUsuario(ObjUsuario.Id_usuario);
            foreach (var user in usuarioData)
            {
                idArea = user.trabajador.puesto_trabajo.area.id_area;
            }

            if (idArea != Convert.ToInt32(hdfAreaIDDel.Value))
            {
                ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfAreaIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            }

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);

            LlenarGridView();
        }
        #endregion

        #region Exportar listas
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        private void incializarExports()
        {
            LlenarGridView();
            GridView1.Columns[9].Visible = false;
            GridView1.Columns[10].Visible = false;
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "ListadeAreas", "Lista de Areas");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "ListadeAreas", "Lista de Areas");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "ListadeAreas", "Lista de Areas");
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfAreaID.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                phSeleccion.Visible = false;
                Listas.Empresa(ddlEmpresaEdit);

                List<area> ListaArea = new List<area>();
                ListaArea = Getter.Area(0, Convert.ToInt32(hdfAreaID.Value), "");

                foreach (var item in ListaArea)
                {
                    ddlEmpresaEdit.SelectedValue = Convert.ToString(item.sucursal.id_empresa);
                    txtNombreEdit.Text = item.nombre;

                    Listas.Sucursal(ddlSucursalEdit, Convert.ToInt32(item.sucursal.id_empresa));
                    ddlSucursalEdit.SelectedValue = Convert.ToString(item.id_sucursal);

                    string areaSuperior = (gvrow.FindControl("nombreSup") as Label).Text;

                    if (areaSuperior != "Ninguno")
                    {
                        Listas.Area_Sucursal(ddlAreasEdit, Convert.ToInt32(ddlSucursalEdit.SelectedValue));
                        ddlAreasEdit.SelectedValue = Convert.ToString(item.id_area_padre);
                        phSeleccion.Visible = true;
                    }
                    else
                    {
                        phAreasEditChk.Visible = true;
                    }

                    ddlTipoAreaEdit.SelectedValue = item.tipo;
                }

                Modal.registrarModal("editModal", "EditModalScript", this);

                
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                hdfAreaIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario != null)
            {
				if (ObjUsuario.isAdmEmp_DptoSeg() || ObjUsuario.isAdmEmp_DptoSalud())
				{
					GridView1.Columns[10].Visible = false;
					GridView1.Columns[11].Visible = false;
				}
				else if (ObjUsuario.isAdm_SucSeg() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isResponsable())
				{
					GridView1.Columns[10].Visible = false;
					GridView1.Columns[11].Visible = false;
				}
			}
        }
        #endregion

        #region eventos Checkbox
        protected void chkAreaPadre_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAreaPadre.Checked)
            {
                phAreaPadre.Visible = true;
            }
            else
                phAreaPadre.Visible = false;
        }
        protected void chkAreaEdit_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAreaEdit.Checked)
            {
                phSeleccion.Visible = true;
            }
            else
                phSeleccion.Visible = false;

        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
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
        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
            LlenarGridView();
        }
        protected void ddlSucursalAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalAdd.SelectedValue != string.Empty)
            {
                Listas.Area_Sucursal(ddlAreasAdd, Convert.ToInt32(ddlSucursalAdd.SelectedValue));
            }
        }
        protected void ddlEmpresaEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaEdit.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursalEdit, Convert.ToInt32(ddlEmpresaEdit.SelectedValue));
            }
            LlenarGridView();
        }
        protected void ddlSucursalEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalEdit.SelectedValue != string.Empty)
            {
                Listas.Area_Sucursal(ddlAreasEdit, Convert.ToInt32(ddlSucursalEdit.SelectedValue));
            }
        }
        protected void ddlNivelArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlNivelArea.SelectedValue != string.Empty)
            {
                ViewState["nivel"] = ddlNivelArea.SelectedValue;
            }
            else
            {
                ViewState["nivel"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void ddlTrabajadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTrabajadores.SelectedValue != string.Empty)
            {
                if (ddlTrabajadores.SelectedValue == "10")
                {
                    ViewState["Num1"] = "0";
                    ViewState["Num2"] = ddlTrabajadores.SelectedValue;
                }
                if (ddlTrabajadores.SelectedValue == "50")
                {
                    ViewState["Num1"] = "10";
                    ViewState["Num2"] = ddlTrabajadores.SelectedValue;
                }
                if (ddlTrabajadores.SelectedValue == "100")
                {
                    ViewState["Num1"] = "50";
                    ViewState["Num2"] = ddlTrabajadores.SelectedValue;
                }
                if (ddlTrabajadores.SelectedValue == "101")
                {
                    ViewState["Num1"] = "101";
                    ViewState["Num2"] = "10000";
                }
            }
            else
            {
                ViewState["Num1"] = string.Empty;
                ViewState["Num2"] = string.Empty;
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
        #endregion
    }
}