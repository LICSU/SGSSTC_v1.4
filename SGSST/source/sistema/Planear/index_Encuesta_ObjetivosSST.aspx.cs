using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Encuesta_ObjetivosSST : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private static int IdSucursal = 0, IdSucursalEsp = 0, IdSucursalSub = 0;
        private static int IdTrabajador = 0, IdTrabajadorEsp = 0, IdTrabajadorSub = 0;
        private static int IdPuesto = 0, IdPuestoEsp = 0, IdPuestoSub = 0;

        #region index principal
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phSucursal.Visible = BoolEmpSuc.Item2;


            if (!IsPostBack)
            {
                ViewState["sWhere"] = "";
                LlenarGridView();
                CargarListas();
            }
        }
        private void CargarListas()
        {
            Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);

            if (!BoolEmpSuc.Item1)
            {
                Listas.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalGral, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                IdSucursal = Convert.ToInt32(ObjUsuario.Id_sucursal);
                IdSucursalEsp = Convert.ToInt32(ObjUsuario.Id_sucursal);
                IdSucursalSub = Convert.ToInt32(ObjUsuario.Id_sucursal);
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));
            string valor = string.Empty + ViewState["trabajador"];
            int id_trabajador = 0;
            if (!valor.Equals(string.Empty)) {
                id_trabajador = Convert.ToInt32(string.Empty + ViewState["trabajador"]);
            }
            Tabla.Encuesta_PoliticaSST(
                GridView1,
                IdEmpresa,
                IdSucursal,
                id_trabajador,
                "Conocimiento Objetivos PoliticaSST",
                string.Empty + ViewState["sWhere"].ToString()
                );
            
        }
        #endregion

        #region acciones
        protected void crearlistaGral(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalGral);

            List<sucursal> ListaSucursal = new List<sucursal>();
            List<trabajador> ListaTrabajador = new List<trabajador>();

            ListaSucursal = Getter.Sucursal(ObjUsuario.Id_sucursal, 0, "");
            ListaTrabajador = Getter.Trabajador(0, 0, ObjUsuario.Id_sucursal);

            string[] valores = {
            "¿Es de su Conocimiento la Política de Seguridad y Salud en el Trabajo de la Organización?",
            "¿Está publicado en Cartelera o en medios electrónicos el documento de la Política de Seguridad y Salud en el Trabajo de la Organización?",
            "¿Es concisa y está redactada con claridad?",
            "¿Está fechada y firmada por el representante legal de la Empresa?",
            "¿La Política es específica para la Empresa?",
            "¿ Es apropiada para la naturaleza de los peligros y el tamaño de la organización?",
            "¿Esta implícito en el Documento el compromiso de la alta dirección de la organización con la seguridad y la salud en el trabajo?",
            "¿La organización se compromete a Proteger la seguridad y salud de todos los trabajadores, mediante la mejora continua del SG-SST?",
            "¿Se compromete a cumplir la normatividad nacional vigente aplicable en materia de riesgos laborales?",
            "¿Se Compromete a mantener el bienestar físico y mental de todos los trabajadores?",
            "¿Se Compromete a establecer una cultura de prevención de Riesgos Laborales?",
            "¿La Polìtica contempla  las normas y responsabilidades a todos los niveles de la organización?",
            "¿Usted comprende las directrices descritas en la Política de Seguridad y Salud en el Trabajo?",
            "¿Usted acata los lineamientos establecidos en la Política de Seguridad y Salud en el Trabajo?",
            "¿Usted participa en la ejecución de la política de Seguridad y Salud en el Trabajo?",
            "¿Usted Considera que la Política de Seguridad y Salud en el Trabajo complementa el logro de los objetivos de Seguridad y Salud en el Trabajo?",
            "¿Se realizan grupos de trabajo para escuchar las opiniones de los trabajadores y las necesidades en materia de seguridad y salud en el trabajo? para posibles actualizaciones de la Política de Seguridad y Salud en el Trabajo",
            "¿Es revisada como mínimo una vez al año y de ser necesario, actualizada con los cambios en materia de normatividad o por los requerimientos que surjan ?"
        };

            string[] valores2 = {
                string.Empty + ObjUsuario.Id_sucursal
            };

            PrintFile.PrintEncuestaPoliticaSST2(valores2, valores, ListaTrabajador, this);

        }

        protected void Guardar(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalAdd);

            string[] valores2 = {
                string.Empty + ObjUsuario.Id_sucursal,
                txtTrabajadorEsp.Text
            };
            string[] valores = {
                "¿Es de su Conocimiento la Política de Seguridad y Salud en el Trabajo de la Organización?",
                "¿Está publicado en Cartelera o en medios electrónicos el documento de la Política de Seguridad y Salud en el Trabajo de la Organización?",
                "¿Es concisa y está redactada con claridad?",
                "¿Está fechada y firmada por el representante legal de la Empresa?",
                "¿La Política es específica para la Empresa?",
                "¿ Es apropiada para la naturaleza de los peligros y el tamaño de la organización?",
                "¿Esta implícito en el Documento el compromiso de la alta dirección de la organización con la seguridad y la salud en el trabajo?",
                "¿La organización se compromete a Proteger la seguridad y salud de todos los trabajadores, mediante la mejora continua del SG-SST?",
                "¿Se compromete a cumplir la normatividad nacional vigente aplicable en materia de riesgos laborales?",
                "¿Se Compromete a mantener el bienestar físico y mental de todos los trabajadores?",
                "¿Se Compromete a establecer una cultura de prevención de Riesgos Laborales?",
                "¿La Polìtica contempla  las normas y responsabilidades a todos los niveles de la organización?",
                "¿Usted comprende las directrices descritas en la Política de Seguridad y Salud en el Trabajo?",
                "¿Usted acata los lineamientos establecidos en la Política de Seguridad y Salud en el Trabajo?",
                "¿Usted participa en la ejecución de la política de Seguridad y Salud en el Trabajo?",
                "¿Usted Considera que la Política de Seguridad y Salud en el Trabajo complementa el logro de los objetivos de Seguridad y Salud en el Trabajo?",
                "¿Se realizan grupos de trabajo para escuchar las opiniones de los trabajadores y las necesidades en materia de seguridad y salud en el trabajo? para posibles actualizaciones de la Política de Seguridad y Salud en el Trabajo",
                "¿Es revisada como mínimo una vez al año y de ser necesario, actualizada con los cambios en materia de normatividad o por los requerimientos que surjan ?"
            };

            PrintFile.PrintEncuestaPoliticaSST(valores2, valores, this);
        }

        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            int IdEmpresa = ObjUsuario.Id_empresa;

            string _ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + "_Encuesta_" + IdTrabajadorSub, "~/source/archivos/encuesta_politicasst/");

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idEncuesta = Convert.ToInt32(hdfIDEsc.Value);
            encuesta_politica Edit = contexto.encuesta_politica.SingleOrDefault(b => b.id_encuesta == idEncuesta);

            if (Edit != null)
            {
                Edit.ruta = _ruta;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            encuesta_politica tabla = new encuesta_politica();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value));

            Modal.MostrarAlertaDelete(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
            LlenarGridView();
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_EncuestaPoliticaSST.Value);
        }

        protected void btnAgregarObj_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_Encuesta_ObjPoliticaSST.Value);
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
            else if (e.CommandName.Equals("Subir"))
            {
                hdfIDEsc.Value = Utilidades_GridView.DevolverIdRow(e, GridView1);
                Modal.registrarModal("EscaneadoModal", "EscaneadoModalScript", this);
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        #endregion

        #region registrar modales
        protected void btnAgregarEsp_Onclick(object sender, EventArgs e)
        {
            phEspecifico.Visible = true;
            phGeneral.Visible = false;
        }
        protected void btnAgregarGral_Onclick(object sender, EventArgs e)
        {
            phGeneral.Visible = true;
            phEspecifico.Visible = false;
        }
        protected void btnSubir_Onclick(object sender, EventArgs e)
        {
            phEspecifico.Visible = false;
            phGeneral.Visible = false;
        }
        protected void btnDescargar_Onclick(object sender, EventArgs e)
        {
            Modal.registrarModal("IndexAddModal", "AddModalScript", this);
        }
        #endregion

        #region filtros
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlTrabajador_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["trabajador"] = IdTrabajador.ToString();
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
        protected void ddlSucursalAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalAdd.SelectedValue != string.Empty)
            {
                IdSucursalEsp = Convert.ToInt32(ddlSucursalAdd.SelectedValue);
            }
        }
        
        #endregion

        protected void hdnValue_ValueChanged(object sender, EventArgs e)
        {
            ViewState["trabajador"] = IdTrabajador.ToString();
            LlenarGridView();
        }

        #region AutoCompletar
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal, ref IdTrabajador, IdPuesto);
            return listTrabajadores;
        }
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajadorEsp(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursalEsp, ref IdTrabajadorEsp, IdPuestoEsp);
            return listTrabajadores;
        }
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajadorSub(string prefixText, int count)
        {
            List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursalSub, ref IdTrabajadorSub, IdPuestoSub);
            return listTrabajadores;
        }
        #endregion
    }
}