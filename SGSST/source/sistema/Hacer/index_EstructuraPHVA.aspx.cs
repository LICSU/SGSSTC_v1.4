using System;
using Capa_Datos;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_EstructuraPHVA : Page
    {
        private Model_UsuarioSistema ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            //int IdSucursal = ObjUsuario.Id_sucursal;
            //Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
            //    IdSucursal,
            //    "EstructuraPHVA_",
            //    "ESTRUCTURA PHVA",
            //    this);

            //#region cuerpo
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H3", "C", "1|1|1|1", 12, 1, "azul", "ESTRUCTURA PHVA"));

            //for (int i = 1; i <= 174; i = i + 2)
            //{
            //    if (i == 1) { DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "EVALUACION INICIAL")); }
            //    if (i == 27) { DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "PLANEAR")); }
            //    if (i == 71) { DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "HACER")); }
            //    if (i == 137) { DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "VERIFICAR")); }
            //    if (i == 159) { DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "ACTUAR")); }

            //    Label milabel1 = (Label)form1.FindControl("label" + i);
            //    Label milabel2 = (Label)form1.FindControl("label" + (i + 1));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "", milabel1.Text));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 9, 1, "", milabel2.Text));

            //}
            //#endregion

            //ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, this);
        }
    }
}