using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_DescripcionSocioDemografica : System.Web.UI.Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = true;
            GridView1.Columns[5].Visible = BoolEmpSuc.Item2;
            GridView1.Columns[6].Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                LlenarGridView();
            }
        }
        private void LlenarGridView()
        {
            Tabla.DescSocio(GridView1, string.Empty + ViewState["sWhere"]);
        }

        #endregion

        #region acciones
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_DescripcionSocioDemografica.Value);
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            desc_socio tabla = new desc_socio();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfPerfilIDDel.Value));
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }
        protected void crearPDF(string id_desc_socio)
        {
            //int IdSucursal = ObjUsuario.Id_sucursal;
            //List<desc_socio> ListaDescSocio = new List<desc_socio>();
            //ListaDescSocio = Getter.DescripcionSociodemografica(Convert.ToInt32(id_desc_socio));

            //Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
            //    IdSucursal,
            //    "DescripcionSocioDemografica_",
            //    "DESCRIPCIÓN SOCIODEMOGRAFICA",
            //    this);

            //#region cuerpo

            //foreach (var itemDescSocio in ListaDescSocio)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", " "));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Empresa"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.trabajador.puesto_trabajo.area.sucursal.empresa.nombre));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Sucursal"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.trabajador.puesto_trabajo.area.sucursal.nombre));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Trabajador"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.trabajador.primer_nombre + " " + itemDescSocio.trabajador.primer_apellido));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Nivel de escolaridad"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.nivel_escolaridad));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Años aprobados en ese último nivel"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.años_aprob));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "¿Es usted cabeza de familia?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.cabeza_fam));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "¿Cuantos hijos tiene?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.num_hijos));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "¿Con quién reparte la responsabilidad económica de su familia?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.repart_resp));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "¿Cuantos menores dependen económicamente de ud?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.menores_dep));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "¿Socialmente en que condición se encuentra usted?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.cond_social));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "¿Cual fue el motivo del desplazamiento?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.mot_despl != null ? "No Aplica" : itemDescSocio.mot_despl));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "La vivienda donde habita es:"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.tipo_vivienda));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Seleccione con cuales servicios públicos cuenta su vivienda"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.serv_pub));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Su vivienda es:"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.vivienda));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Esta Cerca de Industrias"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.industria));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Hay mucho ruido"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.ruido));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Hay Mucha Contaminación"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.contaminacion));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Describa el techo, paredes y piso"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.descripcion));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Se encuentra afiliado al sistema de seguridad social en salud"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.sist_seg_soc));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Régimen de Afiliación"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.reg_afiliacion != null ? "No Aplica" : itemDescSocio.reg_afiliacion));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Nivel de SISBEN"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.nivel_sisben != null ? "No Aplica" : itemDescSocio.nivel_sisben));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "¿A qué EPS pertenece?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.eps.nombre != null ? "No Aplica" : itemDescSocio.eps.nombre));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "Se encuentra afiliado al sistema de seguridad social en pensiones"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.afi_sssp));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", " ¿A qué fondo pertenece?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.afp.nombre != null ? "No Aplica" : itemDescSocio.afp.nombre));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "azul", "¿Cual es el estrato que registran sus facturas de los servicios públicos de la vivienda donde reside?"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemDescSocio.estrato));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", " "));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", " "));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "azul", "EMPLEOS ANTERIORES"));

            //    foreach (var itemEmpleos in itemDescSocio.empleo_anterior)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "azul", "Empresa"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "", itemEmpleos.empresa));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "azul", "Área"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "", itemEmpleos.area));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "azul", "Cargo u Oficio"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "", itemEmpleos.cargo));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "azul", "Años"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "", itemEmpleos.años));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "azul", "Meses"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "", itemEmpleos.meses));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "azul", "Enfermedades adquiridas en el cargo "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 1, 1, "", itemEmpleos.enfermedades));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", " "));
            //    }

            //}
            //#endregion

            //ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, this);
        }
        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            string Hora = DateTime.Now.ToString("dd_MM_yyy_HH_mm");
            GridView grid = new GridView();
            Tabla.DescSocio(grid, string.Empty + ViewState["sWhere"]);

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            System.IO.StringWriter sw = new System.IO.StringWriter(sb);
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Page page = new Page();
            System.Web.UI.HtmlControls.HtmlForm form = new System.Web.UI.HtmlControls.HtmlForm();
            GridView Grid = new GridView();
            grid.AllowPaging = false;
            grid.DataBind();
            grid.EnableViewState = false;
            page.EnableEventValidation = false;
            page.DesignerInitialize();
            page.Controls.Add(form);
            form.Controls.Add(grid);
            page.RenderControl(htw);
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=perfil_socio_lista_" + Hora + ".xls");
            Response.Charset = "UTF-8";
            Response.ContentEncoding = System.Text.Encoding.Default;
            Response.Write(sb.ToString());
            Response.End();
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals(ComandosGrid.Editar.Value))
            {
                
                string id_trabajador = Utilidades_GridView.DevolverIdRow(e, GridView1);

                id_trabajador = objUtilidades.cifrarCadena(Convert.ToString(id_trabajador));
                Response.Redirect(Paginas.Update_DescripcionSocioDemografica.Value+"?id=" + id_trabajador);
            }
            if (e.CommandName.Equals(ComandosGrid.Consultar.Value))
            {
                
                string id_trabajador = Utilidades_GridView.DevolverIdRow(e, GridView1);
                id_trabajador = objUtilidades.cifrarCadena(Convert.ToString(id_trabajador));
                
                Response.Redirect(Paginas.View_DescripcionSocioDemografica.Value+"?id=" + id_trabajador);
            }
            if (e.CommandName.Equals(ComandosGrid.Eliminar.Value))
            {
                hdfPerfilIDDel.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
                
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }

        #endregion

        #region filtros
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