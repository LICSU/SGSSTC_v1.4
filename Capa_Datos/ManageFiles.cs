using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Collections.Generic;

namespace Capa_Datos
{
    /// <summary>
    ///Clase que se encarga del manejo de los archivos, guardar imagenes, generar archivos pdf, para word y excel
    /// tambien contiene metodos para la generacion de pdf de la libreria itextsharp
    /// </summary>
    public class ManageFiles
    {
        public ManageFiles() { }

        #region Metodos Exportar Gridview

        /// <summary>
        /// Metodod que se utiliza para generar un archivo .doc
        /// </summary>
        /// <param name="_page">El archivo ASPX de donde es solicitado el metodo</param>
        /// <param name="_Tabla">Elemento Gridview que se va a imprimir en el archivo</param>
        /// <param name="nombreArchivo">Nombre del archivo a exportar</param>
        /// <param name="Titulo">titulo que tendra dentro del archivo</param>
        /// <param name="color_cabecera">rojo, amarillo, azul, verder, gris, negro, color por defecto azul</param>
        /// <param name="color_cuerpo">rojo, amarillo, azul, verder, gris, negro, color por defecto blanco</param>
        public static void ExportToWord(Page _page, GridView _Tabla, string nombreArchivo, string Titulo, string color_cabecera = "azul", string color_cuerpo = "")
        {
            DateTime fechaActual = DateTime.Now;

            _page.EnableViewState = false;
            _page.Response.Clear();
            _page.Response.Buffer = true;
            _page.Response.ContentType = "application/vnd.ms-word charset=UTF-8";
            _page.Response.AddHeader("content-disposition", "attachment;filename=" + nombreArchivo + "(" + fechaActual.ToString("dd-MM-yyy h:mm:sss") + ").doc");
            _page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            _page.Response.ContentEncoding = System.Text.Encoding.Default;

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            _Tabla.AllowSorting = false;
            _Tabla.AllowPaging = false;
            _Tabla.DataBind();

            #region style
            //Change the Header Row back to white color
            _Tabla.HeaderRow.Style.Add("background-color", "#FFFFFF");

            //Apply style to Individual Cells
            _Tabla.HeaderRow.Cells[0].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[1].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[2].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[3].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[4].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[5].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[6].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[7].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[8].Style.Add("background-color", GetColorbackground(color_cabecera));

            for (int i = 0; i < _Tabla.Rows.Count; i++)
            {
                GridViewRow row = _Tabla.Rows[i];

                //Change Color back to white
                row.BackColor = System.Drawing.Color.White;

                //Apply text style to each Row
                row.Attributes.Add("class", "textmode");

                //Apply style to Individual Cells of Alternating Row
                if (i % 2 != 0)
                {
                    row.Cells[0].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[1].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[2].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[3].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[4].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[5].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[6].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[7].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[8].Style.Add("background-color", GetColorbackground(color_cuerpo));
                }
            }
            #endregion

            _Tabla.RenderControl(hw);

            _page.Response.Output.Write("<h1> " + Titulo + " </h1>");
            _page.Response.Output.Write(sw.ToString());
            _page.Response.Flush();
            _page.Response.End();
        }

        /// <summary>
        /// Metodod que se utiliza para generar un archivo .xls
        /// </summary>
        /// <param name="_page">El archivo ASPX de donde es solicitado el metodo</param>
        /// <param name="_Tabla">Elemento Gridview que se va a imprimir en el archivo</param>
        /// <param name="nombreArchivo">Nombre del archivo a exportar</param>
        /// <param name="Titulo">titulo que tendra dentro del archivo</param>
        /// <param name="color_cabecera">rojo, amarillo, azul, verder, gris, negro, color por defecto azul</param>
        /// <param name="color_cuerpo">rojo, amarillo, azul, verder, gris, negro, color por defecto blanco</param>
        public static void ExportToExcel(Page _page, GridView _Tabla, string nombreArchivo, string Titulo, string color_cabecera = "azul", string color_cuerpo = "")
        {
            DateTime fechaActual = DateTime.Now;
            _page.EnableViewState = false;
            _page.Response.Clear();
            _page.Response.Buffer = true;
            _page.Response.AddHeader("content-disposition", "attachment;filename=" + nombreArchivo + "(" + fechaActual.ToString("dd-MM-yyy h:mm:sss") + ").xls");
            _page.Response.Charset = "UTF-8";
            _page.Response.ContentType = "application/vnd.ms-excel";
            _page.Response.ContentEncoding = System.Text.Encoding.Default;
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            _Tabla.AllowSorting = false;
            _Tabla.AllowPaging = false;
            _Tabla.DataBind();

            #region style
            //Change the Header Row back to white color
            _Tabla.HeaderRow.Style.Add("background-color", "#FFFFFF");

            //Apply style to Individual Cells
            _Tabla.HeaderRow.Cells[0].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[1].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[2].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[3].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[4].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[5].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[6].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[7].Style.Add("background-color", GetColorbackground(color_cabecera));
            _Tabla.HeaderRow.Cells[8].Style.Add("background-color", GetColorbackground(color_cabecera));

            for (int i = 0; i < _Tabla.Rows.Count; i++)
            {
                GridViewRow row = _Tabla.Rows[i];

                //Change Color back to white
                row.BackColor = System.Drawing.Color.White;

                //Apply text style to each Row
                row.Attributes.Add("class", "textmode");

                //Apply style to Individual Cells of Alternating Row
                if (i % 2 != 0)
                {
                    row.Cells[0].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[1].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[2].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[3].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[4].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[5].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[6].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[7].Style.Add("background-color", GetColorbackground(color_cuerpo));
                    row.Cells[8].Style.Add("background-color", GetColorbackground(color_cuerpo));
                }
            }
            #endregion

            _Tabla.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            _page.Response.Output.Write("<h1> " + Titulo + " </h1>");
            _page.Response.Write(style);
            _page.Response.Output.Write(sw.ToString());
            _page.Response.Flush();
            _page.Response.End();
        }

        /// <summary>
        /// Metodod que se utiliza para generar un archivo .pdf
        /// </summary>
        /// <param name="_page">El archivo ASPX de donde es solicitado el metodo</param>
        /// <param name="_Tabla">Elemento Gridview que se va a imprimir en el archivo</param>
        /// <param name="nombreArchivo">Nombre del archivo a exportar</param>
        /// <param name="Titulo">titulo que tendra dentro del archivo</param>
        /// <param name="color_cabecera">rojo, amarillo, azul, verder, gris, negro, color por defecto azul</param>
        /// <param name="color_cuerpo">rojo, amarillo, azul, verder, gris, negro, color por defecto blanco</param>
        public static void ExportToPdf(Page _page, GridView _Tabla, string nombreArchivo, string Titulo, string color_cabecera = "")
        {
            DateTime fechaActual = DateTime.Now;
            _page.EnableViewState = false;
            _page.Response.ContentType = "application/pdf";
            _page.Response.AddHeader("content-disposition", "attachment;filename=" + nombreArchivo + "(" + fechaActual.ToString("dd-MM-yyy h:mm:sss") + ").pdf");
            _page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            _page.Response.ContentEncoding = System.Text.Encoding.Default;
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            _Tabla.DataBind();
            _Tabla.RenderControl(hw);

            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 30f, 30f, 40f, 10f);
            //PdfWriter writer = new PdfWriter(pdfDoc);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);

            PdfWriter.GetInstance(pdfDoc, _page.Response.OutputStream);
            pdfDoc.Open();
            PdfPTable tablaPDF = new PdfPTable(12);
            tablaPDF.WidthPercentage = 100;

            Paragraph _titulo = new Paragraph(Titulo, GetFont(1, "H1"));
            _titulo.Alignment = GetAlineacion("C");
            pdfDoc.Add(_titulo);
            pdfDoc.Add(Chunk.NEWLINE);
            htmlparser.Parse(sr);
            pdfDoc.Close();

            _page.Response.Write(pdfDoc);
            _page.Response.End();
        }

        #endregion

        public enum Tamanho
        {
            H1 = 18,
            H2 = 16,
            H3 = 14,
            H4 = 12,
            H5 = 10
        };

        /// <summary>
        /// Metodo para obtener el tamaño de la letra y el tipo de letra (normal o bold)
        /// </summary>
        /// <param name="negrita">valor 0 si es normal, 1 si es negrita</param>
        /// <param name="tamanho">H1,H2,H3,H4 y H5 para definir el tamanho de la letra</param>
        /// <returns></returns>
        public static Font GetFont(int negrita, string tamanho)
        {
            Tamanho _tamanho = Tamanho.H1;
            switch (tamanho)
            {
                case "H1":
                    _tamanho = Tamanho.H1;
                    break;
                case "H2":
                    _tamanho = Tamanho.H2;
                    break;
                case "H3":
                    _tamanho = Tamanho.H3;
                    break;
                case "H4":
                    _tamanho = Tamanho.H4;
                    break;
                case "H5":
                    _tamanho = Tamanho.H5;
                    break;
                default:
                    _tamanho = Tamanho.H3;
                    break;
            }
            int tamanhoFuente = Convert.ToInt32(_tamanho);

            //negrita == Normal = 0, Bold = 1
            return FontFactory.GetFont("Arial", tamanhoFuente, negrita);
        }

        /// <summary>
        /// Metodo que se utiliza para obtener el tipo de alineacion del texto
        /// </summary>
        /// <param name="tipoAlineacion">indica el valor para establecer el tipo de alineacion que tendra el texto</param>
        /// <returns></returns>
        public static int GetAlineacion(string tipoAlineacion)
        {
            switch (tipoAlineacion)
            {
                case "L":
                    return Element.ALIGN_LEFT;
                case "C":
                    return Element.ALIGN_CENTER;
                case "R":
                    return Element.ALIGN_RIGHT;
                case "J":
                    return Element.ALIGN_JUSTIFIED;
                case "B":
                    return Element.ALIGN_BOTTOM;
                case "T":
                    return Element.ALIGN_TOP;
                default:
                    return Element.ALIGN_CENTER;
            }

        }

        /// <summary>
        /// Obtiene el tipo de color a usar en el fondo del texto
        /// </summary>
        /// <param name="color">el nombre del color a utilizar, por defecto es blanco</param>
        /// <returns></returns>
        public static BaseColor GetColor(string color)
        {
            switch (color)
            {
                case "rojo":
                    return BaseColor.RED;
                case "negro":
                    return BaseColor.BLACK;
                case "verde":
                    return BaseColor.GREEN;
                case "gris":
                    return new BaseColor(System.Drawing.ColorTranslator.FromHtml("#222d32"));
                case "amarillo":
                    return BaseColor.YELLOW;
                case "azul":
                    return new BaseColor(System.Drawing.ColorTranslator.FromHtml("#3c8dbc"));
                default:
                    return BaseColor.WHITE;
            }
        }

        /// <summary>
        /// Obtiene el tipo de color a usar en el fondo del texto
        /// </summary>
        /// <param name="color">el nombre del color a utilizar, por defecto es blanco</param>
        /// <returns></returns>
        public static string GetColorbackground(string color)
        {
            switch (color)
            {
                case "rojo":
                    return "red";
                case "negro":
                    return "black";
                case "verde":
                    return "green";
                case "gris":
                    return "gray";
                case "amarillo":
                    return "yellow";
                case "azul":
                    return "blue";
                default:
                    return "white";
            }
        }

        /// <summary>
        /// metodo que se usa para establecer el borde de la celda
        /// </summary>
        /// <param name="celda">la celda a la cual se le aplciara el borde</param>
        /// <param name="valor">0 sin borde, 1 con borde, el valor va del siguiente orden Top|right|bottom|left</param>
        /// <returns></returns>
        public static PdfPCell SetBorde(PdfPCell celda, string valor)
        {
            string[] lineas = valor.Split('|');

            celda.BorderWidthTop = Convert.ToInt32(lineas[0]);
            celda.BorderWidthRight = Convert.ToInt32(lineas[1]);
            celda.BorderWidthBottom = Convert.ToInt32(lineas[2]);
            celda.BorderWidthLeft = Convert.ToInt32(lineas[3]);

            return celda;
        }

        /// <summary>
        /// Metodo para insertar un titulo en el archivo a generar
        /// </summary>
        public static void AddTitulo(Document pdfDoc, string alinear, string texto)
        {
            Paragraph Titulo = new Paragraph(texto, GetFont(1, "H1"));
            Titulo.Alignment = GetAlineacion(alinear);
            pdfDoc.Add(Titulo);
            pdfDoc.Add(Chunk.NEWLINE);
        }

        /// <summary>
        /// Metodo para agregar una celda al archivo
        /// </summary>
        /// <returns></returns>
        public static PdfPTable AddCelda(PdfPTable tabla, Model_Celda _celda)
        {
            PdfPCell celda = new PdfPCell();
            celda = new PdfPCell(new Phrase(_celda.Texto, GetFont(_celda.Negrita, _celda.Tamanho)));
            celda = SetBorde(celda, _celda.Borde);
            celda.Colspan = _celda.Colspan;
            celda.Rowspan = _celda.Rowspan;
            celda.HorizontalAlignment = GetAlineacion(_celda.Alinear);
            celda.BackgroundColor = GetColor(_celda.Color);
            tabla.AddCell(celda);
            return tabla;
        }

        /// <summary>
        /// Metodo para agregar una celda con contenido html a un archivo
        /// </summary>
        /// <returns></returns>
        public static PdfPTable AddCeldaHTML(PdfPTable tabla, Model_Celda _celda)
        {
            PdfPCell celda = new PdfPCell();
            StyleSheet styles = new StyleSheet();
            var htmlarraylist = HTMLWorker.ParseToList(new StringReader(_celda.Texto), styles);
            for (int k = 0; k < htmlarraylist.Count; k++)
            {
                var ele = htmlarraylist[k];
                celda.AddElement(ele);
            }
            celda = SetBorde(celda, _celda.Borde);
            celda.Colspan = _celda.Colspan;
            celda.Rowspan = _celda.Rowspan;
            tabla.AddCell(celda);
            return tabla;
        }

        /// <summary>
        /// Metodo para agregar una celda al archivo con imagen
        /// </summary>
        /// <returns></returns>
        public static PdfPTable AddCeldaImage(PdfPTable tabla, Model_Celda _celda)
        {
            iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(_celda.Texto));
            logo.ScalePercent(100);
            PdfPCell celda = new PdfPCell(logo);
            celda = SetBorde(celda, _celda.Borde);
            celda.Colspan = _celda.Colspan;
            celda.Rowspan = _celda.Rowspan;
            celda.HorizontalAlignment = GetAlineacion(_celda.Alinear);
            tabla.AddCell(celda);

            return tabla;
        }

        /// <summary>
        /// Metodo para agregar una celda al archivo con una foto de una persona
        /// </summary>
        /// <returns></returns>
        public static PdfPTable AddCeldaFotos(PdfPTable tabla, Model_Celda _celda)
        {
            iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(_celda.Texto));
            logo.ScaleAbsolute(100f, 100f);
            PdfPCell celda = new PdfPCell(logo);
            celda = SetBorde(celda, _celda.Borde);
            celda.Colspan = _celda.Colspan;
            celda.Rowspan = _celda.Rowspan;
            celda.HorizontalAlignment = GetAlineacion(_celda.Alinear);
            tabla.AddCell(celda);
            return tabla;
        }

        /// <summary>
        /// Metodo que se utiliza para inicializar la configuracion de un pdf
        /// </summary>
        public static Document InicializarPDF(List<sucursal> objSucursal, Page _page, string NombreArchivo, bool horizontal)
        {
            DateTime fechaActual = DateTime.Now;
            string nomEmpresa = string.Empty;

            foreach (var item in objSucursal)
            {
                nomEmpresa = item.empresa.nombre;
            }

            _page.Response.ContentType = "application/pdf";
            _page.Response.AddHeader("content-disposition", "attachment;filename=" + NombreArchivo + fechaActual + nomEmpresa + ".pdf");
            _page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            StringReader sr = new StringReader(sw.ToString());

            Document pdfDoc;

            if (horizontal)
            {
                pdfDoc = new Document(PageSize.A4.Rotate(), 50, 50, 25, 25);
            }
            else
            {
                pdfDoc = new Document(PageSize.A4, 50, 50, 25, 25);
            }

            PdfWriter.GetInstance(pdfDoc, _page.Response.OutputStream);

            return pdfDoc;
        }

        /// <summary>
        /// Metodo que se utiliza para crear el membrete del pdf
        /// </summary>
        public static PdfPTable AddMembrete(PdfPTable tabla, List<sucursal> objSucursal, int _NumTrab)
        {
            string nomEmpresa = "", nomSucursal = "", NIT = "", dpto = "", mcpio = "", NumTrab = "", CodCiiu = "", direccion = "", telefono = "", URL = "";

            foreach (var item in objSucursal)
            {
                List<claseCiiu> objCodCiiu = new List<claseCiiu>();
                objCodCiiu = Getter.CodigoCiiu(Convert.ToInt32(item.actividad_ppal));

                foreach (var item1 in objCodCiiu)
                {
                    nomEmpresa = item.empresa.nombre;
                    nomSucursal = item.nombre;
                    NIT = item.empresa.nit;
                    dpto = item.municipio.departamento.nombre;
                    mcpio = item.municipio.nombre;
                    NumTrab = Convert.ToString(_NumTrab);
                    CodCiiu = item1.nombre;
                    direccion = item.direccion;
                    telefono = item.fijo;
                    URL = item.empresa.logo_url;
                }
            }

            Model_Celda miCeldaLogo = new Model_Celda(0, "", "C", "0|0|0|0", 3, 5, "", URL);
            Model_Celda miCelda0 = new Model_Celda(1, "H4", "C", "1|1|1|1", 9, 1, "azul", "NOMBRE DE LA ORGANIZACIÓN: " + nomEmpresa);

            Model_Celda miCelda3 = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 1, "azul", "");
            Model_Celda miCelda2 = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "azul", "");
            Model_Celda miCelda1 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "azul", "");

            Model_Celda miCelda3_1 = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 1, "", "");
            Model_Celda miCelda2_1 = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "", "");
            Model_Celda miCelda1_1 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "", "");

            #region membrete fila 1
            tabla = AddCeldaImage(tabla, miCeldaLogo);
            tabla = AddCelda(tabla, miCelda0);
            #endregion

            #region membrete fila 2
            miCelda3.Texto = "SUCURSAL";
            tabla = AddCelda(tabla, miCelda3);

            miCelda2.Texto = "NIT";
            tabla = AddCelda(tabla, miCelda2);

            miCelda2.Texto = "DEPARTAMENTO";
            tabla = AddCelda(tabla, miCelda2);

            miCelda2.Texto = "MUNICIPIO";
            tabla = AddCelda(tabla, miCelda2);
            #endregion

            #region membrete fila 3
            miCelda3_1.Texto = nomSucursal;
            tabla = AddCelda(tabla, miCelda3_1);

            miCelda2_1.Texto = NIT;
            tabla = AddCelda(tabla, miCelda2_1);

            miCelda2_1.Texto = dpto;
            tabla = AddCelda(tabla, miCelda2_1);

            miCelda2_1.Texto = mcpio;
            tabla = AddCelda(tabla, miCelda2_1);
            #endregion

            #region membrete fila 4
            miCelda3.Texto = "SECTOR ECONÓMICO:";
            tabla = AddCelda(tabla, miCelda3);

            miCelda3.Texto = "DIRECCIÓN:";
            tabla = AddCelda(tabla, miCelda3);

            miCelda2.Texto = "N° CONTACTO:";
            tabla = AddCelda(tabla, miCelda2);

            miCelda1.Texto = "N° DE TRAB:";
            tabla = AddCelda(tabla, miCelda1);
            #endregion

            #region membrete fila 5
            miCelda3_1.Texto = CodCiiu;
            tabla = AddCelda(tabla, miCelda3_1);

            miCelda3_1.Texto = direccion;
            tabla = AddCelda(tabla, miCelda3_1);

            miCelda2_1.Texto = telefono;
            tabla = AddCelda(tabla, miCelda2_1);

            miCelda1_1.Texto = NumTrab;
            tabla = AddCelda(tabla, miCelda1_1);
            #endregion


            return tabla;
        }

        /// <summary>
        /// metodo  que se usa para crear el pdf , asignarle la configuracion y membrete
        /// </summary>
        public static Tuple<Document, PdfPTable> PdfParte1(int IdSucursal, string Titulo1, string titulo2, Page _page, bool _Horizontal = true)
        {
            List<sucursal> objSucursal = new List<sucursal>();
            List<trabajador> objTrabajador = new List<trabajador>();

            objSucursal = Getter.Sucursal(IdSucursal);
            objTrabajador = Getter.Trabajador(0, 0, IdSucursal);

            Document pdfDoc = InicializarPDF(objSucursal, _page, Titulo1, _Horizontal);
            pdfDoc.Open();

            PdfPTable tablaPDF = new PdfPTable(12);
            tablaPDF.WidthPercentage = 100;

            AddTitulo(pdfDoc, "C", titulo2);

            tablaPDF = AddMembrete(tablaPDF, objSucursal, objTrabajador.Count);


            return Tuple.Create(pdfDoc, tablaPDF);
        }

        /// <summary>
        /// Parte final de la generacion del pdf, le asigna un footer y cierra el archivo ya creado
        /// </summary>
        public static void PdfPart2(Document pdfDoc, PdfPTable tablaPDF, int IdSucursal, Page _page, iTextSharp.text.Image[] arrayChart = null)
        {
            List<trabajador> objTrabajador = new List<trabajador>();
            objTrabajador = Getter.Trabajador(0, 0, IdSucursal);
            tablaPDF = Footer(tablaPDF, objTrabajador.Count);
            pdfDoc.Add(tablaPDF);

            if (arrayChart !=null)
            {
                foreach (var item in arrayChart)
                {
                    pdfDoc.Add(item);
                }
            }

            pdfDoc.Close();

            _page.Response.Write(pdfDoc);
            _page.Response.End();
        }

        /// <summary>
        /// Establece el footer del archivo dependiendo del numero de trabajadores de la sucursal
        /// </summary>
        public static PdfPTable Footer(PdfPTable tablaPDF, int _NumTrab)
        {
            DateTime fechaActual = DateTime.Now;

            Model_Celda miCelda1 = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "azul", "");
            Model_Celda miCelda7 = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "", "");

            Model_Celda miCelda2 = new Model_Celda(1, "H4", "C", "1|1|0|1", 4, 1, "", " ");
            Model_Celda miCelda3 = new Model_Celda(1, "H4", "C", "0|1|1|1", 4, 1, "", " ");

            Model_Celda miCelda4 = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 1, "azul", "");
            Model_Celda miCelda5 = new Model_Celda(1, "H4", "C", "1|1|0|1", 6, 1, "", " ");
            Model_Celda miCelda6 = new Model_Celda(1, "H4", "C", "0|1|1|1", 6, 1, "", " ");

            if (_NumTrab >= 10)
            {
                miCelda1.Texto = "EVALUADO POR: Responsable del SG-SST";
                tablaPDF = AddCelda(tablaPDF, miCelda1);

                miCelda1.Texto = "AUTORIZADO POR: Comité Paritario";
                tablaPDF = AddCelda(tablaPDF, miCelda1);

                miCelda1.Texto = "COMITÉ PARITARIO de SST";
                tablaPDF = AddCelda(tablaPDF, miCelda1);
                
                tablaPDF = AddCelda(tablaPDF, miCelda2);
                tablaPDF = AddCelda(tablaPDF, miCelda2);
                tablaPDF = AddCelda(tablaPDF, miCelda2);

                tablaPDF = AddCelda(tablaPDF, miCelda3);
                tablaPDF = AddCelda(tablaPDF, miCelda3);
                tablaPDF = AddCelda(tablaPDF, miCelda3);

                miCelda1.Texto = "FECHA DE EMISIÓN :";
                tablaPDF = AddCelda(tablaPDF, miCelda1);

                miCelda1.Texto = "FECHA DE APROBACIÓN:";
                tablaPDF = AddCelda(tablaPDF, miCelda1);

                miCelda1.Texto = "REPRESENTANTE PATRONAL:";
                tablaPDF = AddCelda(tablaPDF, miCelda1);

                miCelda2.Texto = fechaActual.ToString("dd-MM-yyy");
                tablaPDF = AddCelda(tablaPDF, miCelda2);
                miCelda2.Texto = " ";
                tablaPDF = AddCelda(tablaPDF, miCelda2);
                miCelda2.Texto = fechaActual.ToString("dd-MM-yyy");
                tablaPDF = AddCelda(tablaPDF, miCelda2);

                tablaPDF = AddCelda(tablaPDF, miCelda3);
                tablaPDF = AddCelda(tablaPDF, miCelda3);
                tablaPDF = AddCelda(tablaPDF, miCelda3);
            }
            else
            {
                miCelda4.Texto = "EVALUADO POR: Responsable del SG-SST";
                tablaPDF = AddCelda(tablaPDF, miCelda4);
                miCelda4.Texto = "VIGÍA DE SEGURIDAD Y SALUD EN EL TRABAJO:";
                tablaPDF = AddCelda(tablaPDF, miCelda4);

                tablaPDF = AddCelda(tablaPDF, miCelda5);
                tablaPDF = AddCelda(tablaPDF, miCelda5);

                tablaPDF = AddCelda(tablaPDF, miCelda6);
                tablaPDF = AddCelda(tablaPDF, miCelda6);

                miCelda1.Texto = "FECHA DE EMISIÓN :";
                tablaPDF = AddCelda(tablaPDF, miCelda1);
                miCelda1.Texto = "FECHA DE APROBACIÓN:";
                tablaPDF = AddCelda(tablaPDF, miCelda1);
                miCelda1.Texto = "REPRESENTANTE PATRONAL:";
                tablaPDF = AddCelda(tablaPDF, miCelda1);

                miCelda2.Texto = fechaActual.ToString("dd-MM-yyy");
                tablaPDF = AddCelda(tablaPDF, miCelda2);
                miCelda2.Texto = " ";
                tablaPDF = AddCelda(tablaPDF, miCelda2);
                miCelda2.Texto = fechaActual.ToString("dd-MM-yyy");
                tablaPDF = AddCelda(tablaPDF, miCelda2);

                tablaPDF = AddCelda(tablaPDF, miCelda3);
                tablaPDF = AddCelda(tablaPDF, miCelda3);
                tablaPDF = AddCelda(tablaPDF, miCelda3);
            }

            return tablaPDF;
        }
    }
}
