using Capa_Datos.Manager.Acc_Inc;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Riesgos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Trabajador;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Capa_Datos
{
    public class PrintFile
    {
        public static Model_Celda miCelda1 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "", "");
        public static Model_Celda miCelda58 = new Model_Celda(1, "H4", "C", "1|1|0|1", 1, 1, "", "");
        public static Model_Celda miCelda59 = new Model_Celda(1, "H4", "C", "0|1|1|1", 1, 1, "", "");
        public static Model_Celda miCelda20 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "azul", "");
        public static Model_Celda miCelda5 = new Model_Celda(1, "H4", "C", "0|0|1|1", 1, 1, "rojo", "");
        public static Model_Celda miCelda35 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "rojo", "");
        public static Model_Celda miCelda6 = new Model_Celda(1, "H4", "C", "0|0|1|0", 1, 1, "amarillo", "");
        public static Model_Celda miCelda36 = new Model_Celda(1, "H4", "C", "1|1|1|0", 1, 1, "amarillo", "");
        public static Model_Celda miCelda7 = new Model_Celda(1, "H4", "C", "0|1|1|0", 1, 1, "verde", "");
        public static Model_Celda miCelda63 = new Model_Celda(1, "H4", "C", "0|0|1|1", 1, 1, "verde", "");

        public static Model_Celda miCelda37 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "verde", "");
        public static Model_Celda miCelda17 = new Model_Celda(1, "H4", "C", "1|0|1|1", 1, 1, "azul", "");
        public static Model_Celda miCelda43 = new Model_Celda(1, "H4", "C", "0|0|0|0", 1, 1, "azul", "");
        public static Model_Celda miCelda55 = new Model_Celda(1, "H3", "C", "1|1|1|1", 1, 1, "azul", "");

        public static Model_Celda miCelda77 = new Model_Celda(1, "H3", "C", "1|1|1|1", 1, 2, "azul", "");


        public static Model_Celda miCelda2  = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "", "");
        public static Model_Celda miCelda15 = new Model_Celda(0, "H4", "L", "1|1|1|1", 2, 1, "", "");

        public static Model_Celda miCelda13 = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "azul", "");
        public static Model_Celda miCelda74 = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "verde", "");
        public static Model_Celda miCelda75 = new Model_Celda(1, "H4", "C", "0|0|1|0", 2, 1, "amarillo", "");
        public static Model_Celda miCelda45 = new Model_Celda(1, "H4", "C", "0|0|0|0", 2, 1, "azul", "");
        public static Model_Celda miCelda8 = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 2, "azul", "");

        public static Model_Celda miCelda3 = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 1, "", "");
        public static Model_Celda miCelda60 = new Model_Celda(1, "H4", "C", "1|1|0|1", 3, 1, "", "");
        public static Model_Celda miCelda61 = new Model_Celda(1, "H4", "C", "0|1|1|1", 3, 1, "", "");
        public static Model_Celda miCelda11 = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 1, "azul", "");
        public static Model_Celda miCelda34 = new Model_Celda(1, "H4", "L", "1|1|1|1", 3, 1, "azul", "");

        public static Model_Celda miCelda46 = new Model_Celda(1, "H4", "L", "0|0|0|0", 3, 1, "azul", "");

        public static Model_Celda miCelda68 = new Model_Celda(1, "H3", "C", "1|1|1|1", 3, 1, "", "");
        public static Model_Celda miCelda57 = new Model_Celda(1, "H3", "C", "1|1|1|1", 3, 1, "azul", "");
        public static Model_Celda miCelda67 = new Model_Celda(1, "H3", "C", "0|0|0|0", 3, 1, "azul", "");

        public static Model_Celda miCelda9 = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 2, "azul", "");
        public static Model_Celda miCelda76 = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 2, "", "");


        public static Model_Celda miCelda4  = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "", "");
        public static Model_Celda miCelda87 = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "verde", "");

        public static Model_Celda miCelda16 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, 1, "", "");
        public static Model_Celda miCelda14 = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "azul", "");
        public static Model_Celda miCelda32 = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "amarillo", "");
        public static Model_Celda miCelda22 = new Model_Celda(1, "H4", "C", "1|1|0|1", 4, 1, "", "");
        public static Model_Celda miCelda23 = new Model_Celda(1, "H4", "C", "0|1|0|1", 4, 1, "", "");
        public static Model_Celda miCelda24 = new Model_Celda(1, "H4", "C", "0|1|1|1", 4, 1, "", "");
        public static Model_Celda miCelda52 = new Model_Celda(1, "H3", "J", "1|1|1|1", 4, 1, "", "");
        public static Model_Celda miCelda54 = new Model_Celda(1, "H3", "J", "1|1|1|1", 4, 1, "azul", "");
        public static Model_Celda miCelda56 = new Model_Celda(1, "H3", "C", "1|1|1|1", 4, 1, "azul", "");
        public static Model_Celda miCelda44 = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "azul", "");
        public static Model_Celda miCelda10 = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 2, "azul", "");

        public static Model_Celda miCelda38 = new Model_Celda(1, "H4", "C", "1|1|1|1", 5, 1, "", "");
        public static Model_Celda miCelda50 = new Model_Celda(1, "H4", "C", "1|1|1|1", 5, 1, "azul", "");
        public static Model_Celda miCelda33 = new Model_Celda(1, "H4", "L", "1|1|1|1", 5, 2, "azul", "");

        public static Model_Celda miCelda27 = new Model_Celda(1, "H4", "L", "1|1|1|1", 6, 1, "", "");
        public static Model_Celda miCelda70 = new Model_Celda(1, "H4", "L", "0|0|0|0", 6, 1, "", "");
        public static Model_Celda miCelda64 = new Model_Celda(1, "H3", "C", "1|1|0|1", 6, 1, "", "");
        public static Model_Celda miCelda65 = new Model_Celda(1, "H3", "C", "0|1|0|1", 6, 1, "", "");
        public static Model_Celda miCelda66 = new Model_Celda(1, "H3", "C", "0|1|1|1", 6, 1, "", "");
        public static Model_Celda miCelda25 = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 1, "azul", "");
        public static Model_Celda miCelda85 = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 2, "azul", "");
        public static Model_Celda miCelda86 = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 2, "", "");

        public static Model_Celda miCelda28 = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 4, "azul", "");
        public static Model_Celda miCelda26 = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 4, "", "");

        public static Model_Celda miCelda19 = new Model_Celda(1, "H4", "C", "1|1|1|1", 7, 1, "azul", "");
        public static Model_Celda miCelda21 = new Model_Celda(1, "H4", "C", "1|1|1|1", 7, 1, "", "");

        public static Model_Celda miCelda30 = new Model_Celda(1, "H4", "L", "1|1|1|1", 8, 1, "", "");
        public static Model_Celda miCelda53 = new Model_Celda(1, "H3", "J", "1|1|1|1", 8, 1, "", "");

        public static Model_Celda miCelda62 = new Model_Celda(1, "H3", "C", "0|0|0|0", 8, 1, "azul", "");

        public static Model_Celda miCelda48 = new Model_Celda(1, "H4", "C", "1|1|1|1", 9, 1, "azul", "");
        public static Model_Celda miCelda71 = new Model_Celda(1, "H4", "C", "1|1|1|1", 9, 1, "", "");

        public static Model_Celda miCelda31 = new Model_Celda(1, "H4", "L", "1|1|1|1", 10, 1, "azul", "");
        public static Model_Celda miCelda40 = new Model_Celda(1, "H4", "L", "1|1|1|1", 10, 1, "", "");
        public static Model_Celda miCelda39 = new Model_Celda(1, "H4", "L", "1|1|1|1", 10, 2, "", "");

        public static Model_Celda miCelda18 = new Model_Celda(1, "H4", "C", "1|1|1|0", 11, 1, "azul", "");

        public static Model_Celda miCelda12 = new Model_Celda(1, "H4", "C", "1|1|1|1", 12, 1, "azul", "");
        public static Model_Celda miCelda49 = new Model_Celda(1, "H4", "C", "1|1|1|1", 12, 1, "", "");
        public static Model_Celda miCelda47 = new Model_Celda(1, "H4", "C", "1|1|1|1", 12, 1, "gris", "");
        public static Model_Celda miCelda42 = new Model_Celda(1, "H4", "C", "0|0|0|0", 12, 1, "azul", "");
        public static Model_Celda miCelda29 = new Model_Celda(1, "H4", "L", "1|1|1|1", 12, 1, "", "");
        public static Model_Celda miCelda41 = new Model_Celda(1, "", "", "0|0|0|0", 12, 1, "", "");
        public static Model_Celda miCelda51 = new Model_Celda(1, "H3", "C", "0|0|0|0", 12, 1, "", "");
        public static Model_Celda miCelda73 = new Model_Celda(1, "H3", "J", "1|1|1|1", 12, 1, "", "");
        public static Model_Celda miCelda69 = new Model_Celda(1, "H3", "C", "1|1|1|1", 12, 1, "", "");
        public static Model_Celda miCelda72 = new Model_Celda(1, "H3", "R", "0|0|0|0", 12, 1, "", "");

        public static Model_Celda miCelda78 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 13, "", "");
        public static Model_Celda miCelda79 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 5, "", "");
        public static Model_Celda miCelda80 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 14, "", "");
        public static Model_Celda miCelda81 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 4, "", "");
        public static Model_Celda miCelda82 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 51, "", "");
        public static Model_Celda miCelda83 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 26, "", "");
        public static Model_Celda miCelda84 = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 11, "", "");

        #region Evaluacion de Riesgos
        public static void PrintEvaluacionNRiesgos(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "EvaluacionRiesgos",
                "Nivel de Riesgos",
                _page,
                true);

            miCelda41.Texto =valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEvaluacionConsecuencias(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "EvaluacionRiesgos",
                "Nivel de Consecuencias",
                _page,
                true);

            miCelda41.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEvaluacionProbabilidad(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "EvaluacionRiesgos",
                "Nivel de Probabilidad",
                _page,
                true);

            miCelda41.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEvaluacionDeficiencia(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "EvaluacionRiesgos",
                "Nivel de Deficiencia",
                _page,
                true);

            miCelda41.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEvaluacionPeligros(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "EvaluacionRiesgos",
                "Clasificación de Peligros",
                _page,
                true);

            miCelda41.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEvaluacionModelo(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "EvaluacionRiesgos",
                "Descripción del proceso de trabajo",
                _page,
                true);

            miCelda49.Texto = "Puesto de Trabajo: "+valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda49));
            miCelda49.Texto = "Área de Trabajo: "+valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda49));

            miCelda41.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEvaluacionExposicion(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "EvaluacionRiesgos",
                "Nivel de Exposición",
                _page,
                true);

            miCelda41.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }
        #endregion


        public static void PrintDocCorrespondencia(String[] valores, String[] encabezados1, 
                                                   String[] valores1, String[] tabla1, 
                                                   String[] encabezados2, String[] tabla2,
                                                   String[] tabla3, String[] tabla4,
                                                   String[] tabla5, String[] tabla6,
                                                   String[] tabla7, String[] valores6,
                                                   String[] valores7, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "DocCorrespondencia",
                "DOCUMENTO DE CORRESPONDENCIA",
                _page,
                true);

            #region encabezado
            miCelda29.Texto = "El presente documento registra las características físicas y fisiológicas que debe poseer el ocupante de este cargo, para la respectiva correspondencia entre las evaluaciones médicas y los peligros a los que se encuentra expuesto el trabajador";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));

            miCelda29.Texto = "Empresa /Sucursal: "+valores[1]+" /"+valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));

            miCelda29.Texto = "Cargo: " + valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));

            miCelda29.Texto = "Ubicación: ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));
            #endregion

            #region encabezadoss
            for (int i = 0; i < encabezados1.Length; i++)
            {
                miCelda13.Texto = encabezados1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            }

            for (int i = 0; i < valores1.Length; i++)
            {
                if (tabla1[i] == "X")
                {
                    miCelda74.Texto = valores1[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda74));
                }
                else
                {
                    miCelda15.Texto = valores1[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
                }
            }
            int j = 0;

            miCelda14.Texto = encabezados2[j];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda20.Texto = encabezados2[j + 1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = encabezados2[j + 2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda14.Texto = encabezados2[j + 3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda20.Texto = encabezados2[j + 4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = encabezados2[j + 5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region tabla2
            bool band = true;
            j = 0;
            while (band)
            {
                miCelda4.Texto = tabla2[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda1.Texto = tabla2[j + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda1.Texto = tabla2[j + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda4.Texto = tabla2[j + 3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda1.Texto = tabla2[j + 4];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda1.Texto = tabla2[j + 5];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                j = j + 6;
                if (j == tabla2.Length) band = false;
            }

            miCelda14.Texto = "Posiciones requeridas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda20.Texto = "Frecuente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "Ocasional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda14.Texto = "Manipulación ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda20.Texto = "Frecuente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "Ocasional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            #endregion

            #region tabla3
            band = true;
            j = 0;
            while (band)
            {
                miCelda4.Texto = tabla3[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda1.Texto = tabla3[j + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda1.Texto = tabla3[j + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda4.Texto = tabla3[j + 3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda1.Texto = tabla3[j + 4];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda1.Texto = tabla3[j + 5];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                j = j + 6;
                if (j == tabla3.Length) band = false;
            }

            miCelda14.Texto = "Ritmo de Trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda20.Texto = "Frecuente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "Ocasional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda14.Texto = "Responsabilidades/exigencias";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda20.Texto = "Frecuente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "Ocasional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            #endregion

            #region tabla4
            band = true;
            j = 0;
            while (band)
            {
                miCelda4.Texto = tabla4[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda1.Texto = tabla4[j + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda1.Texto = tabla4[j + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda4.Texto = tabla4[j + 3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda1.Texto = tabla4[j + 4];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miCelda1.Texto = tabla4[j + 5];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                j = j + 6;
                if (j == tabla4.Length) band = false;
            }

            miCelda12.Texto = "Agentes Estresores (señalar los existentes)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));


            band = true;
            j = 0;
            while (band)
            {
                miCelda4.Texto = tabla5[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda2.Texto = tabla5[j + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

                miCelda4.Texto = tabla5[j + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda2.Texto = tabla5[j + 3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

                j = j + 4;
                if (j == tabla5.Length) band = false;
            }
            #endregion

            #region ultimas 2 tablas
            miCelda12.Texto = "Condiciones o factores de riesgos presente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda13.Texto = "Exposición a";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Temperatura";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Humedad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Ventilación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Iluminación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Ruido";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            for (int i = 0; i < tabla6.Length; i++)
            {
                if (valores6[i] == "X")
                {
                    miCelda74.Texto = tabla6[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda74));
                }
                else
                {
                    miCelda15.Texto = tabla6[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
                }
            }

            miCelda13.Texto = "Vibraciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Radiaciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Condiciones Locativas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Exposición Biológica";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda14.Texto = "Sustancias Químicas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            for (int i = 0; i < tabla7.Length; i++)
            {
                if (i == 4 || i == 9 || i == 14 || i == 19)
                {
                    if (valores7[i] == "X")
                    {
                        miCelda87.Texto = tabla7[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda87));
                    }
                    else
                    {
                        miCelda4.Texto = tabla7[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    }
                }
                else
                {
                    if (valores7[i] == "X")
                    {
                        miCelda74.Texto = tabla7[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda74));
                    }
                    else
                    {
                        miCelda15.Texto = tabla7[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
                    }
                }
            }

            #endregion

            miCelda12.Texto = "Observaciones Generales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

            public static void PrintPlanCapacitacion(String[] valores, Panel pnDatos, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "PlanCapacitacion_",
                "PLAN DE CAPACITACION",
                _page,
                true);

            miCelda77.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda77.Texto = "TIPO DE RIESGO DE ACUERDO CON LAS CARACTERISTICAS DE LA EMPRESA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda77.Texto = "TEMA DE CAPACITACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda77.Texto = "DURACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda77.Texto = "POBLACIÓN OBJETO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda77.Texto = "PONENTE O INSTRUCTOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda77.Texto = "DOCUMENTO DE  SOPORTE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda77.Texto = "FECHA PROGRAMADA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda13.Texto = "ESTATUS DE CUMPLIMIENTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda77.Texto = "LUGAR O SITIO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));
            miCelda77.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda77));

            miCelda20.Texto = "SI";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda20.Texto = "NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            TableCell _cell;
            TextBox _textbox;
            RadioButton _radio;
            string _valor = string.Empty;
            bool band = true;

            #region Mecanicos (1 al 13)
            for (int pregunta = 1; pregunta <= 13; pregunta++)
            {
                miCelda1.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                if (band)
                {
                    miCelda78.Texto = "Mecánicos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda78));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                miCelda1.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            }
            #endregion

            band = true;
            #region Físicos (14 al 18)
            for (int pregunta = 14; pregunta <= 18; pregunta++)
            {
                miCelda1.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                if (band)
                {
                    miCelda79.Texto = "Físicos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda79));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                miCelda1.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            }
            #endregion

            band = true;
            #region Disergonómicos (19 al 32)
            for (int pregunta = 19; pregunta <= 32; pregunta++)
            {
                miCelda1.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                if (band)
                {
                    miCelda80.Texto = "Disergonómicos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda80));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                miCelda1.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            }
            #endregion

            band = true;
            #region Químicos (33 al 43)
            for (int pregunta = 33; pregunta <= 43; pregunta++)
            {
                miCelda1.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                if (band)
                {
                    miCelda84.Texto = "Quimicos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda84));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                miCelda1.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            }
            #endregion

            band = true;
            #region Eléctricos (44 al 47)
            for (int pregunta = 44; pregunta <= 47; pregunta++)
            {
                miCelda1.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                if (band)
                {
                    miCelda81.Texto = "Eléctricos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda81));
                    band = false;
                }

                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                miCelda1.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            }
            #endregion

            band = true;
            #region Psicosocial Desarrollo Conductual (48 al 98)
            for (int pregunta = 48; pregunta <= 98; pregunta++)
            {
                miCelda1.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                if (band)
                {
                    miCelda82.Texto = "Psicosocial Desarrollo Conductual";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda82));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                miCelda1.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            }
            #endregion

            band = true;
            #region Prevención de Emergencias (99 al 124)
            for (int pregunta = 99; pregunta <= 124; pregunta++)
            {
                miCelda1.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                if (band)
                {
                    miCelda83.Texto = "Prevención de Emergencias";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda83));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                miCelda1.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            }
            #endregion

            band = true;
            #region Generales (125 al 150)
            for (int pregunta = 125; pregunta <= 150; pregunta++)
            {
                miCelda1.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                if (band)
                {
                    miCelda83.Texto = "Generales";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda83));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                miCelda1.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                miCelda1.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintAutoevaluacion(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "AutoEvaluacion_",
                "EVALUACIÓN INICIAL DEL SGSST",
                _page);

            #region cuerpo

            #region cabecera fila 1
            miCelda8.Texto = "FASE DEL SISTEMA CICLO PHVA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda8));

            miCelda9.Texto = "CRITERIO A REVISAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda9));

            miCelda11.Texto = "ESTADO DE IMPLEMENTACIÓN DEL SG-SST";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda10.Texto = "EVIDENCIA ACTUAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda10));
            #endregion

            #region cabecera fila 2
            miCelda5.Texto = "NINGUNO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda5));

            miCelda6.Texto = "PARCIAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda6));

            miCelda7.Texto = "TOTAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda7));
            #endregion


            #region fila1
            miCelda2.Texto = "PLANEAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Aspectos legales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Matriz legal actualizada y acorde a la naturaleza de la organización";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila2

            miCelda2.Texto = "PLANEAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Política de Seguridad y Salud en el Trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Existencia de la Política de seguridad y Salud en el Trabajo, documentada y publicada a todos los níveles de la organización";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila3
            miCelda2.Texto = "PLANEAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Identificación de los peligros, evaluación y valoración de los riesgos (el cual debe ser anual)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Panorama de Factores de Riesgo o la herramienta que haya empleado el servicio de seguridad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila4
            miCelda2.Texto = "PLANEAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Cumplimiento del programa de capacitación anual";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Evidenciar el porcentaje de cumplimiento del plan de capacitación anual, comprobando por medio de planillas de registro la asistencia de los trabajadores a las charlas respectivas y el estatus de su ausencia si es el caso (justificado o injustificado)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila5
            miCelda2.Texto = "PLANEAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Plan de Trabajo Anual";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Plan de Trabajo Anual para alcanzar cada uno de los objetivos del SG-SST, firmado por el empleador; éste debe contener los objetivos, metas, actividades, responsables, cronograma y recursos del Sistema de Gestión de la Seguridad y Salud en el Trabajo (SG-SST).";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila6
            miCelda2.Texto = "PLANEAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Indicadores de estructura, proceso y resultado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Registro de indicadores de estructura, proceso y resultado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila7
            miCelda2.Texto = "HACER";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "El plan de Prevención, preparación y respuesta ante emergencias, análisis de vulnerabilidad de la empresa (el cual debe ser anual)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Plan de prevención, preparación y respuesta ante emergencias ( en físico o digital), que incluya la identificación de amenazas y vulnerabilidad, demostrar los recursos destinados para su implementación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila8
            miCelda2.Texto = "HACER";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Conformación de las Brigadas de Emergencias";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[22];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[23];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[24];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Registro de conformación y capacitación de la brigada de emergencias, registros de simulacros.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila9
            miCelda2.Texto = "HACER";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Sistemas de vigilancia epidemiológica";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[25];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[26];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[27];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Documentación y registro de la morbilidad de los trabajadores (reposos por enfermedades comunes y/o ocupacionales, durante el mes en curso), registro de evaluaciones de ingreso y egreso, registro de evaluaciones pre y post vacacionales); la caracterización de sus condiciones de salud; así como, la evaluación y análisis de las estadísticas sobre la enfermedad y la accidentalidad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila10
            miCelda2.Texto = "HACER";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Descripción sociodemográfica";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[28];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[29];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[30];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Registrar La descripción sociodemográfica de los trabajadores y la caracterización de sus condiciones de salud";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila11
            miCelda2.Texto = "HACER";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Medidas de prevención y control";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[31];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[32];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[33];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Estándares de seguridad y demás medidas de prevención y control acordes al esquema de jerarquización (eliminación, sustitución, control de ingeniería, controles administrativos, equipos y elementos de protección personal y colectivo); es decir hacer seguimiento a las medidas o intervenciones para minimizar los reisgos, aplicadas en la fuente de orígen, en el medio o en el individuo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila12
            miCelda2.Texto = "VERIFICAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Evaluación de la efectividad de las medidas implementadas, para controlar los peligros, riesgos y amenazas; hacer evaluación y seguimiento a las medidas de prevención y control de los peligros y riesgos de la empresa";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[34];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[35];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[36];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Las investigaciones de accidentes de trabajo, inspecciones de seguridad, análisis de vulnerabilidad y el plan de trabajo anual; verificando con ellas si en el año en curso, éstas permitieron reducir, entre otros, los índices de frecuencia y severidad por ausentismo, accidentes de trabajo, vulnerabilidad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila13
            miCelda2.Texto = "VERIFICAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Indicadores de estructura, proceso y resultado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[37];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[38];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[39];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Seguimiento a los resultados de los indicadores definidos en el SGSST de la empresa del año inmediatamente anterior";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #region fila14
            miCelda2.Texto = "ACTUAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda3.Texto = "Acciones preventivas y correctivas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valores[40];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[41];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[42];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda4.Texto = "Divulgación a los niveles de la organización pertinentes al sistema, informándoles de las acciones preventivas y correctivas, con responsables y fechas de cumplimiento.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            #endregion

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintGestionLaboral(String[] valores, Page _page)
        {
            List<gestion_laboral> ListaGestionLaboral = new List<gestion_laboral>();
            ListaGestionLaboral = Getter.GestionLaboral(Convert.ToInt32(valores[0]));

            foreach (var itemGestionLaboral in ListaGestionLaboral)
            {
                int tipoGestion = Convert.ToInt32(itemGestionLaboral.tipo_gestion);
                string tituloGestion =
                        tipoGestion == 1 ? "ENTREGA DE EQUIPOS" :
                        tipoGestion == 2 ? "CAPACITACIÓN" :
                        tipoGestion == 3 ? "JORNADA DE EXAMENES" :
                        "ACTIVIDADES RECREATIVAS";
                int IdSucursal = Convert.ToInt32(itemGestionLaboral.usuario.trabajador.puesto_trabajo.area.id_sucursal);
                Tuple<iTextSharp.text.Document, iTextSharp.text.pdf.PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                                                IdSucursal,
                                                "GestionLaboral_",
                                                "GESTION LABORAL - " + tituloGestion,
                                                _page);
                int ContadorTrabajadores = 0;

                miCelda9.Texto = "EMPRESA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda9));
                miCelda9.Texto = "FECHA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda9));
                miCelda9.Texto = "DESCRIPCIÓN";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda9));
                miCelda9.Texto = "RESPONSABLE";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda9));

                miCelda76.Texto = Convert.ToString(itemGestionLaboral.usuario.trabajador.puesto_trabajo.area.sucursal.empresa.nombre);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda76));
                miCelda76.Texto = Convert.ToString(itemGestionLaboral.fecha);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda76));
                miCelda76.Texto = itemGestionLaboral.descripcion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda76));
                miCelda76.Texto = Convert.ToString(itemGestionLaboral.usuario.login);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda76));

                if (tipoGestion == 2)
                {
                    miCelda85.Texto = "OBJETIVOS";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda85));
                    miCelda85.Texto = "CANTIDAD DE HORAS";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda85));
                    miCelda86.Texto = itemGestionLaboral.objetivos;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda86));
                    miCelda86.Texto = Convert.ToString(itemGestionLaboral.cant_horas);
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda86));
                }

                List<trabajador_gestion> ListaTrabajadorGestion = Mgr_Trabajador.TrabajadorInGestion(0, Convert.ToInt32(valores[0]));
                miCelda12.Texto = "TRABAJADORES QUE ASISTIRAN";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                foreach (var item in ListaTrabajadorGestion)
                {
                    string ruta = item.trabajador.foto;
                    ruta = ruta.Replace("~/source", "../..");
                    ContadorTrabajadores++;

                    miCelda86.Texto = "TRABAJADOR " + ContadorTrabajadores;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda86));
                    miCelda86.Texto = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda86));
                }

                ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, _page);
            }
        }

        public static void PrintObjetivosSGSST(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "ObjetivosSGSST_",
                "OBJETIVOS SG-SST",
                _page);

            #region cuerpo
            miCelda73.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda73));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintCronogramaInspeccion(String[] valores, Page _page, Panel _Panel)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "CronogramaInspecciones_",
                "CRONOGRAMA DE INSPECCIONES",
                _page);

            #region cuerpo

            miCelda12.Texto = "Cronograma de Inspecciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda13.Texto = "Área";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "Tipo de Inspección";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "Fecha de Inspección Inicial";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "Responsables";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda14.Texto = "Objetivo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            int filas = Convert.ToInt32(valores[1]);
            TextBox miTextBox;
            DropDownList miDropDownList;

            for (int i = 0; i <= filas; i++)
            {
                miDropDownList = (DropDownList)_Panel.FindControl("ddlArea" + i);
                miCelda15.Texto = "" + miDropDownList.SelectedItem.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));

                miDropDownList = (DropDownList)_Panel.FindControl("ddlTipo" + i);
                miCelda15.Texto = "" + miDropDownList.SelectedItem.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));

                miTextBox = (TextBox)_Panel.FindControl("txtFecha" + i);
                miCelda15.Texto = "" + miTextBox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));

                miTextBox = (TextBox)_Panel.FindControl("txtResp" + i);
                miCelda15.Texto = "" + miTextBox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));

                miTextBox = (TextBox)_Panel.FindControl("txtObj" + i);
                miCelda16.Texto = "" + miTextBox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));
            }
            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
            #endregion
        }

        public static void PrintCrontolDocumentos(String[] valores, String[] tipoDoc, String[] Responsable, String[] Revisado, String[] Aprobado, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "ControlDocumentos_",
                "CONTROL DE DOCUMENTOS",
                _page);

            #region cuerpo

            miCelda20.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda50.Texto = "TIPO DE DOCUMENTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            miCelda13.Texto = "RESPONSABLE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "REVISADO POR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "APROBADO POR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            for (int i = 0; i < 40; i++)
            {
                miCelda1.Texto = "" + (i + 1);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                miCelda38.Texto = tipoDoc[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda2.Texto = Responsable[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                miCelda2.Texto = Revisado[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                miCelda2.Texto = Aprobado[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            }

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
            #endregion
        }

        public static void PrintDocumento_InspeccionEPP(Panel _Panel, DropDownList ddlArea, DropDownList ddlPuesto)
        {
            RadioButton _radio;
            Table _table;
            TableRow row = new TableRow();
            row = (TableHeaderRow)_Panel.FindControl("EPPFaltante");
            row.Visible = false;
            row = (TableHeaderRow)_Panel.FindControl("SenalFaltante");
            row.Visible = false;
            int i = 0;
            _table = (Table)_Panel.FindControl("tblEPP");
            List<Model_CEPP> epp_datos = Getter.Epp(Convert.ToInt32(ddlPuesto.SelectedValue));
            foreach (var dato in epp_datos)
            {
                _radio = (RadioButton)_Panel.FindControl("eppNo" + i);
                if (_radio.Checked)
                {
                    row = new TableRow();
                    TableCell cell = new TableCell();
                    cell.Text = " " + dato.nombre;
                    row.Controls.Add(cell);
                    _table.Controls.Add(row);
                    row = (TableHeaderRow)_Panel.FindControl("EPPFaltante");
                    row.Visible = true;
                }
                i++;
            }


            List<Model_CEPP> tipo_epp_datos = Getter.TipoEpp(Convert.ToInt32(ddlPuesto.SelectedValue));
            i = 0;
            _table = (Table)_Panel.FindControl("tblSenal");
            foreach (var dato in tipo_epp_datos)
            {
                _radio = (RadioButton)_Panel.FindControl("tpoNo" + i);
                if (_radio.Checked)
                {
                    row = new TableRow();
                    TableCell cell = new TableCell();
                    cell.Text = " " + dato.nombre;
                    row.Controls.Add(cell);
                    _table.Controls.Add(row);
                    row = (TableHeaderRow)_Panel.FindControl("SenalFaltante");
                    row.Visible = true;
                }
                i++;
            }
        }

        public static void PrintAnalisisVulnerabilidad(String[] valores, String[] valoresText, Page _page, TextBox _txtArea,
                                                       TextBox _txtObjetivo, TextBox _txtAlcance, String total, String conclusiones,
                                                       String fortalezas, String debilidades)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]), "AnalisisVulnerabilidad_",
                "ANALISIS DE VULNERABILIDAD",
                _page);

            miCelda12.Texto = "Área de Evaluación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda12.Texto = _txtArea.Text;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));

            miCelda12.Texto = "Objetivo y alcance de la Evaluación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda12.Texto = _txtObjetivo.Text;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));

            miCelda12.Texto = "Álcance";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda12.Texto = _txtAlcance.Text;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));

            miCelda12.Texto = "Resultados de la Evaluación Interna";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda17.Texto = "Nº";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda17));

            miCelda18.Texto = "Aspecto a Evaluar";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda18));

            #region contenido

            #region fila 1 Encabezado
            miCelda20.Texto = "1";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Ruta de Evacuación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 2
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Existe una ruta exclusiva de evacuación, iluminada, señalizada con pasa manos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 3
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Presenta deficiencia en alguno de los aspectos anteriores.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 4
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No hay ruta exclusiva de evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 5 Encabezado
            miCelda20.Texto = "2";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Los visitantes del edificio conocen las rutas de evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 6
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Fácil y rápidamente gracias a la señalización visible desde todos los ángulos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 7
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Difícilmente por la poca señalización u orientación al respecto.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 8
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No las reconocerían fácilmente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 9 Encabezado
            miCelda20.Texto = "3";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Los puntos de reunion en una evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 10
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Se han establecido claramente y los conocen todos los ocupantes del edificio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 11
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Existen varios sitios posibles, pero ninguno se ha delimitado con claridad y nadie sabría hacia donde evacuar exactamente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 12
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existen puntos óptimos donde evacuar.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 13 Encabezado
            miCelda20.Texto = "4";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Los puntos de reunion en una evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 13
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Son amplios y seguros.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 14
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Son amplios pero con algunos riesgos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 15
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Son realmente pequeños para el número de personas a evacuar y realmente peligrosos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 16 Encabezado
            miCelda20.Texto = "5";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "La señalización para evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 17
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Se visualiza e identifica plenamente en todas las áreas del edificio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 18
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Esta muy oculta y apenas se observa en algunos sitios.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 19
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existen flechas o croquis de evacuación en ninguna parte visible.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 20 Encabezado
            miCelda20.Texto = "6";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Las rutas de evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 21
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Antideslizantes y seguras en todo recorrido.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 22
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Con obstáculos y tramos resbalosos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 23
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Altamente resbalosos, utilizados como bodegas o intransitables en algunos tramos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 24 Encabezado
            miCelda20.Texto = "7";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Las ruta principal de evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 25
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Tiene ruta alterna optima y conocida.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 26
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Tiene una ruta alterna pero deficiente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 27
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No posee ninguna ruta alterna o no se conoce.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 28 Encabezado
            miCelda20.Texto = "8";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "La señal de alarma.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 29
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Se encuentra o se ve claramente en todos los sitios.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[22];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 30
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Algunas veces no se escuchan ni se ven claramente. Los ocupante no la conocen.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[23];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[22];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 31
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Usualmente no se escucha ni se ve.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[24];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[23];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 32 Encabezado
            miCelda20.Texto = "9";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Sistema de detección.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 33
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "El edificio posee sistemas de detección de incendio, revisado el último trimestre en todas las áreas.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[25];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[24];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 34
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Solo existen algunos detectores sin revisión y no en todas las áreas.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[26];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[25];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 35
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existe ningún tipo de detector.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[27];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[26];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 36 Encabezado
            miCelda20.Texto = "10";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "El sistema de iluminación de emergencia.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 37
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Es óptimo de día y noche (siempre se ve claramente, aun de noche)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[28];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[27];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 38
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Es optimo solo en el día (En la noche no se ve con claridad).";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[29];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[28];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 39
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Deficiente día y noche.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[30];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[29];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 40 Encabezado
            miCelda20.Texto = "11";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "El sistema de iluminación de emergencia.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 41
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Es de encendido automático en caso de corte de energía.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[31];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[30];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 42
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Es de encendido manual en caso de corte de energía.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[32];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[31];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 43
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existe.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[33];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[32];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 44 Encabezado
            miCelda20.Texto = "12";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "El sistema contra incendio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 45
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Es funcional.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[34];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[33];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 46
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Funciona parcialmente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[35];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[34];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 47
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existe o no funciona.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[36];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[35];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 48 Encabezado
            miCelda20.Texto = "13";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Los extintores para incendio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 49
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Están ubicados en las áreas críticas y son funcionales.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[37];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[36];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 50
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Existen pero no en número suficiente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[38];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[37];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 51
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existe o no funciona.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[39];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[38];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 52 Encabezado
            miCelda20.Texto = "14";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Divulgación del plan de emergencia a los empleados.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 53
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Se ha desarrollado mínimo una por semestre.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[40];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[39];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 54
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Esporádicamente se ha divulgado para algunas áreas.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[41];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[40];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 55
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No se ha divulgado.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[42];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[41];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 56 Encabezado
            miCelda20.Texto = "15";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Coordinador del plan de emergencia.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 57
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Existe y está capacitado.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[43];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[42];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 58
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Existe pero no está capacitado.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[44];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[43];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 59
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existe.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[45];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[44];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 60 Encabezado
            miCelda20.Texto = "16";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "La brigada de emergencia.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 61
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Existe y está capacitada.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[46];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[45];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 62
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Existe pero no está capacitada.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[47];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[46];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 63
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existe.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[48];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[47];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 64 Encabezado
            miCelda20.Texto = "17";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Se han realizado simulacros.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 65
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Un simulacro en el último año.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[49];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[48];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 66
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Un simulacro en los dos últimos años.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[50];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[49];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 67
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Ningún simulacro.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[51];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[50];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 68 Encabezado
            miCelda20.Texto = "18";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Entidades de socorro externas.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 69
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Conocen y participan activamente en el plan de emergencia de la empresa.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[52];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[51];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 70
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Están identificadas las entidades de socorro pero no conocen el plan de emergencia de la empresa.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[53];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[52];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 71
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No se tienen en cuenta.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[54];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[53];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 72 Encabezado
            miCelda20.Texto = "19";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Los ocupantes del edificio son.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 73
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Siempre los mismos con muy poco s visitantes.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[55];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[54];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 74
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Con un 10 a 20% de visitantes nuevos cada día.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[56];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[55];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 75
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "El 90% de los ocupantes son visitantes.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[57];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[56];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 76 Encabezado
            miCelda20.Texto = "20";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "En la entrada del edificio o en cada piso.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 77
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Existe y es visible un plano de evacuación en cada piso.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[58];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[57];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 78
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existe un plano de evacuación en cada piso, pero alguien daría información.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[59];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[58];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 79
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "No existe un plano de evacuación y nadie esta responsabilizado de dar información al respecto.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[60];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[59];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 80 Encabezado
            miCelda20.Texto = "21";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Las rutas de circulación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 81
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "En general las rutas de acceso y circulación de los trabajadores y visitantes son amplias y seguras.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[61];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[60];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 82
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "En algún punto de las rutas no se circula con facilidad por falta de espacio u obstáculos al paso.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[62];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[61];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 83
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "En general las rutas y áreas de circulación son congestionadas y de difícil uso.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[63];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[62];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 84 Encabezado
            miCelda20.Texto = "22";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Las puertas de salida del edificio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 85
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Las puertas cumplen con las medidas mínimas reglamentarias y de uso de cerraduras de seguridad.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[64];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[63];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 86
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Solo algunas puertas permiten una salida rápida y poseen cerraduras de seguridad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[65];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[64];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 87
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Ninguna puerta es lo suficientemente amplia o brinda garantías para salida segura.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[66];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[65];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 88 Encabezado
            miCelda20.Texto = "23";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda19.Texto = "Estructura y tipo de construcción.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda19));

            miCelda11.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            #endregion

            #region fila 89
            miCelda1.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "La estructura del edificio se soporta por estructuras de concreto y no presenta deterioro en paredes, columnas, techos o aditamentos internos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[67];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[66];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 90
            miCelda1.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "Presenta deterioro observables en paredes y techos que hagan pensar en daños estructurales.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[68];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[67];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #region fila 91
            miCelda1.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda21.Texto = "La estructura no posee cimentación ni soportes de concreto y presenta deterioros estructurales observables en progreso durante los últimos seis meses.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda21));

            miCelda3.Texto = valores[69];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda1.Texto = valoresText[68];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            #endregion

            #endregion

            miCelda14.Texto = "TOTAL ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda30.Texto = total.ToString();
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));

            miCelda14.Texto = "CONCLUSIONES ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda30.Texto = conclusiones.ToString();
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));

            miCelda14.Texto = "FORTALEZAS ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda30.Texto = fortalezas.ToString();
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));

            miCelda14.Texto = "DEBILIDADES ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda30.Texto = debilidades.ToString();
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInspeccionExtintores(String[] valores, String[] especificacion, String[] condiciones, String[] titulos, String[] color, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]), "InspeccionDeExtintores_", "INSPECCIÓN DE LOS EXTINTORES", _page);

            #region cuerpo
            miCelda22.Texto = "NOMBRE DEL INSPECTOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda22));

            miCelda22.Texto = "FIRMA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda22));

            miCelda22.Texto = "FECHA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda22));

            miCelda23.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda23));

            miCelda23.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda23));

            miCelda23.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda23));

            miCelda24.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda24));

            miCelda24.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda24));

            miCelda24.Texto = DateTime.Today.Date.ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda24));

            miCelda25.Texto = "CARATERÍSTICA A INSPECCIONAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

            miCelda25.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

            miCelda28.Texto = especificacion[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda28));

            miCelda27.Texto = especificacion[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = especificacion[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            for (int i = 0; i < titulos.Length; i++)
            {
                miCelda27.Texto = titulos[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                Model_Celda _miCelda = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 1, color[i], condiciones[i]);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, _miCelda));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInvestigacionAccidentes(String[] valores, Page _page)
        {
            #region cuerpo
            List<investigacion_ac_in> ListaInvestigacionAccidente = new List<investigacion_ac_in>();
            ListaInvestigacionAccidente = Mgr_Acc_Inc.InvestigacionAccidente(Convert.ToInt32(valores[0]));

            foreach (var itemInvestigacionAccidente in ListaInvestigacionAccidente)
            {
                List<at_it_el_pa> ListaAccidente = new List<at_it_el_pa>();
                ListaAccidente = Mgr_Acc_Inc.Accidente(Convert.ToInt32(itemInvestigacionAccidente.id_at_it_el_pa));

                foreach (var itemAccidente in ListaAccidente)
                {
                    int IdSucursal = Convert.ToInt32(itemAccidente.trabajador.puesto_trabajo.area.id_sucursal);
                    Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                        Convert.ToInt32(itemAccidente.trabajador.puesto_trabajo.area.id_sucursal),
                        "InvestigacionAccidente_",
                        "INVESTIGACION DE ACCIDENTE",
                        _page);
                    #region datos del evento
                    miCelda12.Texto = "DATOS DEL EVENTO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                    miCelda14.Texto = "Fecha: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Hora: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Día de la semana: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                    miCelda4.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_evento).ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = Convert.ToDateTime(itemInvestigacionAccidente.hora_evento).ToString("HH:mm:ss tt");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = itemInvestigacionAccidente.dia_semana;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                    miCelda25.Texto = "Lugar donde ocurrió:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Tipo de suceso:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

                    miCelda27.Texto = itemAccidente.sitio;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.tipo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    #endregion

                    #region datos del accidentado
                    miCelda12.Texto = "DATOS DEL ACCIDENTADO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                    miCelda25.Texto = "Nombre completo:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Cédula de Ciudadanía:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemAccidente.trabajador.primer_nombre + " " + itemAccidente.trabajador.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemAccidente.trabajador.cedula;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda25.Texto = "Mano dominante:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Antigüedad en el puesto de trabajo:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemAccidente.trabajador.mano_dominante;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.antiguedad.ToString();
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda25.Texto = "Cargo:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Supervisor inmediato:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemAccidente.trabajador.perfil_cargo.cno.ocupacion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.supervisor;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda14.Texto = "Fecha de ingreso: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Tiempo en el cargo: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Salario devengado: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                    miCelda4.Texto = Convert.ToDateTime(itemAccidente.trabajador.fecha_ingreso).ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = itemInvestigacionAccidente.tiempo_cargo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = itemAccidente.trabajador.salario.ToString();
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                    miCelda12.Texto = "Actividad que realizaba";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                    miCelda49.Texto = itemInvestigacionAccidente.actividad_realizaba;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
                    #endregion

                    #region DATOS DE EVALUACIÓN DEL MÉDICO
                    miCelda12.Texto = "DATOS DE EVALUACIÓN DEL MÉDICO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                    miCelda25.Texto = "Naturaleza de la lesión:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Gravedad:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemInvestigacionAccidente.naturaleza_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.gravedad_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda12.Texto = "DESCRIPCIÓN DE LA LESIÓN";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                    miCelda49.Texto = itemInvestigacionAccidente.descripcion_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                    miCelda14.Texto = "Reposo: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "N°. Días: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Fecha de reintegro: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                    miCelda4.Texto = itemInvestigacionAccidente.reposo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = Convert.ToString(itemInvestigacionAccidente.dias_reposo);
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_reintegro).ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    #endregion

                    miCelda12.Texto = "DESCRIPCIÓN DEL ACCIDENTE";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                    miCelda49.Texto = itemAccidente.descripcion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                    miCelda12.Texto = "ADIESTRAMIENTO RECIBIDO POR EL TRABAJADOR";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                    miCelda49.Texto = itemInvestigacionAccidente.adiestramiento;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                    #region COSTOS
                    miCelda12.Texto = "COSTOS";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                    miCelda25.Texto = "Transporte:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Reemplazo:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemInvestigacionAccidente.costo_transporte;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.costo_reemplazo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda25.Texto = "Atención médica:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Reposo médico:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemInvestigacionAccidente.costo_atencion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.costo_reposo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda25.Texto = "Tratamiento:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Daños materiales:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemInvestigacionAccidente.costo_tratamiento;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.costo_materiales;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda25.Texto = "Indemnización:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Producción diferida:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemInvestigacionAccidente.costo_indemizacion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.costo_produccion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    #endregion

                    #region ANÁLISIS DEL ACCIDENTE
                    miCelda12.Texto = "ANÁLISIS DEL ACCIDENTE";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                    miCelda49.Texto = itemInvestigacionAccidente.actividad;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                    miCelda12.Texto = "IDENTIFICACIÓN DE POSIBLES CAUSAS DEL ACCIDENTE:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                    miCelda27.Texto = itemInvestigacionAccidente.porque1;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta1;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.porque2;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta2;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.porque3;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta3;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.porque4;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta4;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.porque5;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta5;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda12.Texto = "RECONOCER CAUSAS GENERADORAS DEL ACCIDENTE:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                    miCelda27.Texto = itemInvestigacionAccidente.que;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta_que;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.porque;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta_porque;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.quien;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta_quien;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.donde;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta_donde;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.cuando;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta_cuando;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.como;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta_como;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.cuanto;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemInvestigacionAccidente.respuesta_cuanto;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda11.Texto = "Tipo de Accidente: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                    miCelda11.Texto = "Tipo de lesión: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                    miCelda11.Texto = "Agente de lesión: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                    miCelda11.Texto = "Parte del cuerpo afectada: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

                    miCelda3.Texto = itemInvestigacionAccidente.tipo_accidente;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = itemInvestigacionAccidente.tipo_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = itemInvestigacionAccidente.agente_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = itemInvestigacionAccidente.parte_cuerpo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                    miCelda12.Texto = "MEDIDAS A ADOPTAR: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                    miCelda14.Texto = "Acción ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Responsable ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Fecha ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                    miCelda4.Texto = itemInvestigacionAccidente.medida1;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = itemInvestigacionAccidente.responsable1;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida1).ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                    if (itemInvestigacionAccidente.medida2 != string.Empty)
                    {
                        miCelda4.Texto = itemInvestigacionAccidente.medida2;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                        miCelda4.Texto = itemInvestigacionAccidente.responsable2;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                        miCelda4.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida2).ToString("yyyy-MM-dd");
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    }

                    if (itemInvestigacionAccidente.medida3 != string.Empty)
                    {
                        miCelda4.Texto = itemInvestigacionAccidente.medida3;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                        miCelda4.Texto = itemInvestigacionAccidente.responsable3;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                        miCelda4.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida3).ToString("yyyy-MM-dd");
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    }

                    miCelda25.Texto = "Nota:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = itemInvestigacionAccidente.nota;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    #endregion

                    #region FIRMA DE LOS INVOLUCRADOS
                    miCelda12.Texto = "FIRMA DE LOS INVOLUCRADOS";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                    miCelda11.Texto = "Persona";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                    miCelda11.Texto = "Nombre";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                    miCelda11.Texto = "Cédula";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                    miCelda11.Texto = "Firma";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

                    miCelda76.Texto = "Accidentado:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda76));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                    miCelda76.Texto = "Sup. Inmediato:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda76));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                    miCelda76.Texto = "Responsable de la Investigación:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda76));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda3.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    #endregion

                    #region SOPORTES
                    miCelda12.Texto = "SOPORTES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                    foreach (var itemSoporte in itemAccidente.soporte)
                    {
                        miCelda49.Texto = itemSoporte.url;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
                    }
                    #endregion

                    ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
                }
            }



            #endregion
        }

        public static void PrintAccidenteLaboral(String[] valores, Page _page)
        {
            List<at_it_el_pa> ListAccidentes = new List<at_it_el_pa>();
            ListAccidentes = Mgr_Acc_Inc.Accidente(Convert.ToInt32(valores[0]));

            #region contenido
            foreach (var item in ListAccidentes)
            {
                int IdSucursal = item.trabajador.puesto_trabajo.area.id_sucursal;
                Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                    IdSucursal,
                    "ComunicadoAccidente_",
                    "",
                    _page);

                miCelda14.Texto = "Sucursal";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Fecha Accidente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Hora Accidente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda4.Texto = item.trabajador.puesto_trabajo.area.sucursal.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = item.fecha_accidente.Value.ToString("yyyy-MM-dd");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = item.hora_accidente.Value.ToString("hh:mm:ss");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda14.Texto = "Trabajador";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Área";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Puesto de Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda14.Texto = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                if (item.id_area == 0)
                {
                    miCelda14.Texto = "Ninguno";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                }
                else
                {
                    miCelda14.Texto = item.area.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                }
                if (item.id_puesto == 0)
                {
                    miCelda14.Texto = "Ninguno";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                }
                else
                {
                    miCelda14.Texto = item.puesto_trabajo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                }

                miCelda25.Texto = "Sitio donde se presentó el caso";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda25.Texto = "Breve descripción de los hechos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda27.Texto = item.sitio;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = item.descripcion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda12.Texto = "CAUSAS INMEDIATAS - Condiciones Inseguras";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item.condiciones_inseguras;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "CAUSAS INMEDIATAS - Actos Inseguros";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item.actos_inseguros;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "CAUSAS BÁSICAS - Factores del Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item.factores_inseguros;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "CAUSAS BÁSICAS - Factores Personales";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item.factores_personales;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "Magnitud del Evento";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                if (item.fecha_muerte != null)
                {
                    miCelda25.Texto = "Fecha de Muerte (Si la Hubiere)";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda27.Texto = item.fecha_muerte.Value.ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                }

                miCelda14.Texto = "Días de incapacidad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Días cargados.";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Días perdidos por ausencia del trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda4.Texto = string.Empty + item.dias_incapacidad;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = string.Empty + item.dias_cargados;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = string.Empty + item.dias_perdidos_ausencia;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda14.Texto = "Días perdidos por actividad restringida";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Sin Tiempo Perdido";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Tipo de enfermedad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda4.Texto = string.Empty + item.dias_perdidos_restingido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                if (Convert.ToString(item.dias_no_perdidos) == "true")
                {
                    miCelda4.Texto = "Si";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }
                else
                {
                    miCelda4.Texto = "No";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }

                string tipoEnf = "";
                if (Convert.ToString(item.tipo_enfermedad) == "A") { tipoEnf = "Enfermedades en la piel"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "B") { tipoEnf = "Enfermedades respiratorias"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "C") { tipoEnf = "Envenenamiento"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "D") { tipoEnf = "Enfermedades debidas a agentes físicos"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "E") { tipoEnf = "Enfermedades producidas por traumas repetitivos"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "F") { tipoEnf = "Otras enfermedades osteomusculares"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "G") { tipoEnf = "Demás enfermedades profesionales"; }

                miCelda4.Texto = tipoEnf;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda12.Texto = "COMUNICADO A TRABAJADORES";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                List<trabajador> ListaTrabajador = new List<trabajador>();
                ListaTrabajador = Mgr_Trabajador.Trabajador(0, 0, IdSucursal);

                foreach (var item1 in ListaTrabajador)
                {
                    miCelda14.Texto = "Nombre y Apellido";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Cedula";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Firma";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                    miCelda4.Texto = item1.primer_nombre + " " + item1.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = item1.cedula;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }

                ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, _page);
            }
            #endregion

        }


        public static void PrintInspeccionPuestos(String[] valores, String[] titulos, String[] valoressi, String[] valoresno, String[] textos, String[] encabezado, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InspeccionDePuestos_", "INSPECCIÓN DE LOS PUESTOS DE TRABAJO", _page);

            #region contenido
            miCelda12.Texto = "INSPECCIÓN PUESTO OPERATIVO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda11.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda11.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda11.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda11.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda25.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

            miCelda20.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda11.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            int TotalFavorable = 0, TotalDesfavorable = 0, posicion = 0, pos_enca = 0, i = 0;
            while (posicion < titulos.Length)
            {
                if (i == 5 || i == 18 || i == 44 || i == 55 || i == 63 || i == 77 || i == 84 ||
                    i == 88 || i == 96 || i == 100 || i == 108 || i == 121 || i == 128 || i == 138 ||
                    i == 146 || i == 151 || i == 159 || i == 164)
                {
                    miCelda20.Texto = valores[5];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

                    miCelda25.Texto = encabezado[pos_enca];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

                    miCelda20.Texto = valores[7];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

                    miCelda20.Texto = valores[8];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

                    miCelda11.Texto = valores[9];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

                    pos_enca++;
                }
                else
                {
                    miCelda1.Texto = "" + (posicion + 1);
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda27.Texto = titulos[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    if (valoressi[posicion].Equals("X")) TotalDesfavorable++;
                    miCelda1.Texto = valoressi[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    if (valoresno[posicion].Equals("X")) TotalFavorable++;
                    miCelda1.Texto = valoresno[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda3.Texto = textos[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                    posicion++;
                }
                i++;
            }
            miCelda29.Texto = "Observaciones Generales: " + valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));

            miCelda3.Texto = "Total de Condiciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "FAVORABLE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "DESFAVORABLE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "Observaciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "Sumatoria total de respuestas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "" + TotalFavorable;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "" + TotalDesfavorable;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            int porcentaje = (TotalDesfavorable * 100) / (TotalFavorable + TotalDesfavorable);
            miCelda3.Texto = "El " + porcentaje + " %, indican condiciones de trabajo que pueden estar asociadas a alto riesgo de lesión o enfermedad.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            //miCelda49.Texto = "~/source/archivos/images_graf/graficaInspPO.jpg";
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, miCelda49));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInspeccionEpp(String[] valores, Page _page, Panel _panel)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]), "InspeccionEPP_",
                                        "HOJA DE INSPECCIONES DE LOS EQUIPOS DE PROTECCION PERSONAL", _page);
            #region contenido
            miCelda12.Texto = "HOJA DE INSPECCIONES DE LOS EQUIPOS DE PROTECCION PERSONAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Nombre del Inspector";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda14.Texto = "Firma";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda14.Texto = "Fecha";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda16.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

            miCelda16.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

            miCelda16.Texto = DateTime.Today.Date.ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

            miCelda29.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));

            miCelda10.Texto = "Caracteristica a Inspeccionar";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda10));

            miCelda10.Texto = "Sector/Actividad/Material de Trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda10));

            miCelda13.Texto = "Existencia";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "Estado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda1.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = "Apto";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = "No Apto";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            List<Model_CEPP> epp_datos = Getter.Epp(Convert.ToInt32(valores[2]));
            Model_Celda miCelda161 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, epp_datos.Count, "", "EQUIPO DE PROTECCIÓN PERSONAL E.P.P");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda161));
            int i = 0;
            String valor = string.Empty;
            RadioButton _radio;
            foreach (var dato in epp_datos)
            {
                miCelda16.Texto = dato.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));
                _radio = (RadioButton)_panel.FindControl("eppSi" + i);
                if (_radio.Checked) { valor = "EXISTE"; } else { valor = "-"; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("eppNo" + i);
                if (_radio.Checked) { valor = "NO EXISTE"; } else { valor = "-"; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("eppApto" + i);
                if (_radio.Checked) { valor = "APTO"; } else { valor = "-"; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("eppNoApto" + i);
                if (_radio.Checked) { valor = "NO APTO"; } else { valor = "-"; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                i++;
            }
            List<Model_CEPP> epp_tipo_datos = Getter.TipoEpp(Convert.ToInt32(Convert.ToInt32(valores[2])));
            miCelda161 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, epp_tipo_datos.Count, "", "SEÑALIZACIÓN O AVISOS DE LOS E.P.P");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda161));
            i = 0;
            valor = string.Empty;
            foreach (var dato in epp_tipo_datos)
            {
                miCelda16.Texto = dato.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));
                _radio = (RadioButton)_panel.FindControl("tpoSi" + i);
                if (_radio.Checked) { valor = "EXISTE"; } else { valor = "-"; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("tpoNo" + i);
                if (_radio.Checked) { valor = "NO EXISTE"; } else { valor = "-"; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("tpoApto" + i);
                if (_radio.Checked) { valor = "APTO"; } else { valor = "-"; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("tpoNoApto" + i);
                if (_radio.Checked) { valor = "NO APTO"; } else { valor = "-"; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                i++;
            }
            TableRow row = new TableRow();
            row = (TableHeaderRow)_panel.FindControl("EPPFaltante");
            i = 0;
            if (row.Visible)
            {
                epp_datos = Getter.Epp(Convert.ToInt32(valores[2]));
                miCelda161 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, Convert.ToInt32(valores[3]), "", "EQUIPO DE PROTECCIÓN PERSONAL FALTANTES");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda161));
                foreach (var dato in epp_datos)
                {
                    _radio = (RadioButton)_panel.FindControl("eppNo" + i);
                    if (_radio.Checked)
                    {
                        miCelda30.Texto = dato.nombre;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
                    }
                    i++;
                }
            }

            row = new TableRow();
            row = (TableHeaderRow)_panel.FindControl("SenalFaltante");
            i = 0;
            if (row.Visible)
            {
                epp_datos = Getter.Epp(Convert.ToInt32(valores[2]));
                miCelda161 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, Convert.ToInt32(valores[4]), "", "SEÑALIZACIÓN DE EPP FALTANTE");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda161));
                foreach (var dato in epp_datos)
                {
                    _radio = (RadioButton)_panel.FindControl("tpoNo" + i);
                    if (_radio.Checked)
                    {
                        miCelda30.Texto = dato.nombre;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
                    }
                    i++;
                }
            }

            miCelda29.Texto = "Observaciones Generales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));

            TextBox _textbox = (TextBox)_panel.FindControl("txtObsGenerales");
            miCelda29.Texto = _textbox.Text;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));

            #endregion
            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEvaluacionPuestos(String[] valores, Page _page)
        {

            #region contenido
            List<evaluacion_riesgo> Lista_EvaRiesgo = new List<evaluacion_riesgo>();
            Lista_EvaRiesgo = Mgr_Riesgos.EvaluacionRiesgo(Convert.ToInt32(valores[1]));

            foreach (var itemEvaRiesgo in Lista_EvaRiesgo)
            {
                Tuple<Document, PdfPTable> DocumentoPDF =
                                         ManageFiles.PdfParte1(itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.id_sucursal,
                                         "EvaluacionRiesgos_", " ", _page);

                int id_puesto = Convert.ToInt32(itemEvaRiesgo.identificacion_puesto.id_puesto);

                miCelda11.Texto = "Puesto de Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda11.Texto = "Área";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda25.Texto = "Descripción del Puesto";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

                miCelda3.Texto = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda3.Texto = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda27.Texto = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.descripcion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda12.Texto = "IDENTIFICACIÓN DEL PELIGRO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                foreach (var itemFactor in itemEvaRiesgo.identificacion_puesto.identificacion_peligro.factor_identificacion)
                {
                    miCelda25.Texto = "Tipo de Riesgo";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Factor de Riesgo";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

                    miCelda27.Texto = itemFactor.factor_riesgo.tipo_riesgo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemFactor.factor_riesgo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    miCelda25.Texto = "Posibles Consecuencias";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                    miCelda25.Texto = "Tiempo de Exposición";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

                    miCelda27.Texto = itemFactor.consecuencias;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                    miCelda27.Texto = itemFactor.tiempo_exposicion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                }

                miCelda12.Texto = "EVALUACIÓN DEL RIESGO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                miCelda14.Texto = "Medidas en la Fuente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Medidas en el Medio";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Medidas en el Individuo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda4.Texto = itemEvaRiesgo.control_fuente;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = itemEvaRiesgo.control_medio;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = itemEvaRiesgo.control_individuo;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda25.Texto = "Responsable del SGSST";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda25.Texto = "Fecha de Evaluación";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

                miCelda27.Texto = itemEvaRiesgo.nombre_responsable;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = Convert.ToDateTime(itemEvaRiesgo.fecha_evaluacion).ToString("yyyy-MM-dd");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda14.Texto = "Nivel de Deficiencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda62.Texto = "Interpretación del Nivel de Deficiencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda62));

                string nivel = string.Empty;
                string interpretacion = string.Empty;

                #region nivel deficiencia
                if (itemEvaRiesgo.nivel_deficiencia == "10")
                {
                    nivel = "Muy alto";
                    interpretacion = "Se ha(n) detectado peligro(s) que determina(n) como posible la generación de incidentes, o la eficacia del conjunto de medidas preventivas existentes respecto al riesgo es nula no existe, o ambos";
                }
                else if (itemEvaRiesgo.nivel_deficiencia == "6")
                {
                    nivel = "Alto";
                    interpretacion = "Se ha(n) detectado algún(os) peligro(s) que puede(n) dar lugar a consecuencias significativa(s) o la eficacia del conjunto de medidas preventivas existentes es baja, o ambos";
                }
                else if (itemEvaRiesgo.nivel_deficiencia == "2")
                {
                    nivel = "Medio";
                    interpretacion = "Se han detectado peligros que pueden dar lugar a consecuencias poco significativa(s) o de menor importancia, o la eficacia del conjunto de medidas preventivas existentes es moderada, o ambos.";
                }
                else if (itemEvaRiesgo.nivel_deficiencia == "0")
                {
                    nivel = "Bajo";
                    interpretacion = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado.";
                }
                miCelda4.Texto = nivel;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda30.Texto = interpretacion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
                #endregion

                #region nivel exposicion
                miCelda14.Texto = "Nivel de Exposición";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda62.Texto = "Interpretacion del Nivel de Exposición";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda62));
                if (itemEvaRiesgo.nivel_exposicion == "4")
                {
                    nivel = "Continua";
                    interpretacion = "La situación de exposición se presenta sin interrupción o varias veces con tiempo prolongado durante la jornada laboral.";
                }
                else if (itemEvaRiesgo.nivel_exposicion == "3")
                {
                    nivel = "Frecuente";
                    interpretacion = "La situación de exposición se presenta varias veces durante la jornada laboral por tiempos cortos.";
                }
                else if (itemEvaRiesgo.nivel_exposicion == "2")
                {
                    nivel = "Ocasional";
                    interpretacion = "La situación de exposición se presenta alguna vez durante la jornada laboral y por un periodo de tiempo corto.";
                }
                else if (itemEvaRiesgo.nivel_exposicion == "1")
                {
                    nivel = "Esporádica";
                    interpretacion = "La situación de exposición se presenta de manera eventual.";
                }
                miCelda4.Texto = nivel;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda30.Texto = interpretacion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
                #endregion

                miCelda11.Texto = "Nivel de Probabilidad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda48.Texto = "Interpretacion del Nivel de Probabilidad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda48));

                int probabilidad = Convert.ToInt32(itemEvaRiesgo.nivel_probabilidad);

                if (probabilidad >= 24 && probabilidad <= 40) { interpretacion = "Situación deficiente con exposición continua.Normalmente la materialización del riesgo ocurre con frecuencia"; }
                else if (probabilidad >= 10 && probabilidad <= 20) { interpretacion = "Situación deficiente con exposición frecuente u ocasional, o bien situación muy deficiente con exposición ocasional o esporádica.La materialización del riesgo es posible que suceda varias veces durante la vida laboral "; }
                else if (probabilidad >= 6 && probabilidad <= 8) { interpretacion = "Situación deficiente con exposición esporádica, o bien situación mejorable con exposición continuada o frecuente. Es posible que suceda el daño alguna vez."; }
                else if (probabilidad >= 2 && probabilidad <= 4) { interpretacion = "Situación mejorable con exposición ocasional o esporádica, o situación sin anomalía destacable con cualquier nivel de exposición.No es esperable que se materialice el riesgo, aunque puede ser concebible."; }
                else if (probabilidad == 0) { interpretacion = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado."; }

                miCelda3.Texto = itemEvaRiesgo.nivel_probabilidad;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda71.Texto = interpretacion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda71));

                #region nivel consecuencia
                miCelda11.Texto = "Nivel de Consecuencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda48.Texto = "Interpretación del Nivel de Consecuencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda48));
                if (itemEvaRiesgo.nivel_consecuencia == "100")
                {
                    nivel = "Mortal o catastrófico(M)";
                    interpretacion = "Muerte(s)";
                }
                else if (itemEvaRiesgo.nivel_consecuencia == "60")
                {
                    nivel = "Muy grave (MG)";
                    interpretacion = "Lesiones o enfermedades graves irreparables (incapacidad permanente, parcial o invalidez).";
                }
                else if (itemEvaRiesgo.nivel_consecuencia == "25")
                {
                    nivel = "Grave (G)";
                    interpretacion = "Lesiones o enfermedades con incapacidad laboral temporal (ILT).";
                }
                else if (itemEvaRiesgo.nivel_consecuencia == "10")
                {
                    nivel = "Leve (L)";
                    interpretacion = "Lesiones o enfermedades que no requieren incapacidad.";
                }
                miCelda3.Texto = itemEvaRiesgo.nivel_consecuencia;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda71.Texto = interpretacion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda71));
                #endregion

                #region nivel riesgo
                miCelda11.Texto = "Nivel de Riesgo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda48.Texto = "Interpretacion del Nivel de Riesgo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda48));
                miCelda3.Texto = itemEvaRiesgo.nivel_riesgo;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda71.Texto = itemEvaRiesgo.interpretacion_nivel_riesgo;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda71));
                #endregion

                miCelda12.Texto = "Aceptabilidad de Riesgo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = itemEvaRiesgo.aceptabilidad_riesgo;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "CRITERIOS PARA ESTABLECER CONTROLES";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                miCelda11.Texto = "Planta";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda11.Texto = "Contratista";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda11.Texto = "Visitantes";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda11.Texto = "Total";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

                miCelda3.Texto = itemEvaRiesgo.planta.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda3.Texto = itemEvaRiesgo.contratistas.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda3.Texto = itemEvaRiesgo.visitantes.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda3.Texto = itemEvaRiesgo.total.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                miCelda25.Texto = "Peor Consecuencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda25.Texto = "Existencia Requisito Legal";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda27.Texto = itemEvaRiesgo.peor_consecuencia.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = "" + itemEvaRiesgo.existencia_requisito_legal;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda12.Texto = "MEDIDAS DE INTERVENCIÓN";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                miCelda25.Texto = "Eliminación";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda25.Texto = "Sustitución";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda27.Texto = itemEvaRiesgo.eliminación.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = itemEvaRiesgo.sustitución.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda25.Texto = "Controles de Ingeniería";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda25.Texto = "Controles Administrativos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda27.Texto = itemEvaRiesgo.controles_ingenieria.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = itemEvaRiesgo.controles_administrativos.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda25.Texto = "Fecha de Ejecucion";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda27.Texto = Convert.ToDateTime(itemEvaRiesgo.fecha_ejecucion).ToString("yyyy-MM-dd");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda12.Texto = "EQUIPOS DE PROTECCIÓN PERSONAL DEL PUESTO DE TRABAJO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                int contadorEpp = 1;
                foreach (var itemEpp in itemEvaRiesgo.identificacion_puesto.puesto_trabajo.puesto_trabajo_epp)
                {
                    miCelda4.Texto = "Epp N° " + contadorEpp;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = "Nombre: " + itemEpp.epp.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = "Tipo de Epp: " + itemEpp.epp.tipo_epp.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    contadorEpp++;
                }

                ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.id_sucursal, _page);
            }

            #endregion
        }

        public static void PrintInspeccionUsoEpp(String[] valores, Page _page, Panel _panel)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InspeccionUsoEpp_", "INSPECCIÓN USO EPP", _page);

            String valor = string.Empty;
            #region contenido

            miCelda27.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda10.Texto = "EQUIPO DE PROTECCION PERSONAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda10));

            miCelda13.Texto = "USO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "ESTADO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda10.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda10));

            miCelda20.Texto = "SI";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "APTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "NO APTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            int intContInspecciones = Convert.ToInt32(valores[4]);
            Label _label;
            RadioButton _radio;
            TextBox _textbox;
            for (int i = 0; i < intContInspecciones; i++)
            {
                _label = (Label)_panel.FindControl("lblEpp" + i);
                miCelda16.Texto = _label.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));
                _radio = (RadioButton)_panel.FindControl("chkUsoSi" + i);
                if (_radio.Checked) { valor = "X"; } else { valor = string.Empty; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("chkUsoNo" + i);
                if (_radio.Checked) { valor = "X"; } else { valor = string.Empty; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("chkEstSi" + i);
                if (_radio.Checked) { valor = "X"; } else { valor = string.Empty; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _radio = (RadioButton)_panel.FindControl("chkEstNo" + i);
                if (_radio.Checked) { valor = "X"; } else { valor = string.Empty; }
                miCelda1.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)_panel.FindControl("txtObs" + i);
                miCelda16.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInspeccionMediosEscape(String[] valores, String[] areaUbicacion, String[] edoConservacion, String[] fteIluminacion,
            String[] marcaLampara, String[] lucesLampara, String[] cajtaLampara, String[] senas,
            String[] exisSena, String[] obsEst, String[] senaSena, String[] txtPas, String[] obsEstPasi,
            String[] obsAccPasi, String[] obsAusPasi, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                      "InspeccionMediosEscape_", "INSPECCIÓN DE LOS MEDIOS DE ESCAPE", _page);

            #region contenido

            #region encabezado
            miCelda12.Texto = "INSPECCIÓN DE LOS MEDIOS DE ESCAPE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda16.Texto = "Nombre del inspector";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

            miCelda16.Texto = "Firma";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

            miCelda16.Texto = "Fecha";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

            miCelda16.Texto = "\n";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

            miCelda16.Texto = "\n";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

            miCelda16.Texto = "\n";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));
            #endregion

            #region AreaUbicacion
            miCelda13.Texto = areaUbicacion[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = areaUbicacion[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = areaUbicacion[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = areaUbicacion[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = areaUbicacion[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = areaUbicacion[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region cabecera
            miCelda13.Texto = "CARATERÍSTICA A INSPECCIONAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda31.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda31));
            #endregion

            #region Estado de conservacion
            miCelda13.Texto = edoConservacion[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = edoConservacion[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = edoConservacion[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = edoConservacion[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = edoConservacion[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = edoConservacion[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region Fuente de iluminacion
            miCelda13.Texto = fteIluminacion[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = fteIluminacion[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = fteIluminacion[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = fteIluminacion[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = fteIluminacion[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = fteIluminacion[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region Marcacion
            miCelda13.Texto = marcaLampara[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = marcaLampara[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = marcaLampara[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = marcaLampara[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = marcaLampara[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = marcaLampara[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region Luces de operacion
            miCelda13.Texto = lucesLampara[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = lucesLampara[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = lucesLampara[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = lucesLampara[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = lucesLampara[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = lucesLampara[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region Cajetin
            miCelda13.Texto = cajtaLampara[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = cajtaLampara[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = cajtaLampara[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = cajtaLampara[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = cajtaLampara[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = cajtaLampara[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region ÁREA DE UBICACIÓN
            miCelda12.Texto = "SEÑALIZACIÓN DE SEGURIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda13.Texto = senas[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = senas[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = senas[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = senas[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = senas[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = senas[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region cabecera
            miCelda13.Texto = "CARATERÍSTICA A INSPECCIONAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda31.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda31));
            #endregion

            #region Existencia
            miCelda13.Texto = exisSena[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = exisSena[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = exisSena[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = exisSena[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = exisSena[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = exisSena[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region Estado de conservacion
            miCelda13.Texto = obsEst[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = obsEst[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsEst[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsEst[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsEst[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsEst[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region Senal
            miCelda13.Texto = senaSena[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = senaSena[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = senaSena[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = senaSena[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = senaSena[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = senaSena[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region ÁREA DE UBICACIÓN
            miCelda12.Texto = "PASILLOS Y ESCALERAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda13.Texto = txtPas[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = txtPas[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = txtPas[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = txtPas[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = txtPas[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = txtPas[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region cabecera
            miCelda13.Texto = "CARATERÍSTICA A INSPECCIONAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda31.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda31));
            #endregion

            #region Estado de conservacion
            miCelda13.Texto = obsEstPasi[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = obsEstPasi[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsEstPasi[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsEstPasi[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsEstPasi[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsEstPasi[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region Accesibilidad
            miCelda13.Texto = obsAccPasi[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = obsAccPasi[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsAccPasi[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsAccPasi[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsAccPasi[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsAccPasi[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #region Ausencia de Obstaculos
            miCelda13.Texto = obsAusPasi[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda15.Texto = obsAusPasi[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsAusPasi[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsAusPasi[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsAusPasi[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            miCelda15.Texto = obsAusPasi[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            #endregion

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInspeccionPuestosAdmin(String[] valores, String[] titulos, String[] valoressi, String[] valoresno, String[] textos, String[] encabezado, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InspeccionPuestoTrabajoAdmin_", "INSPECCIÓN PUESTO DE TRABAJO ADMINISTRATIVO", _page);

            #region contenido
            miCelda12.Texto = "INSPECCIÓN PUESTO DE TRABAJO ADMINISTRATIVO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda3.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            int TotalSi = 0, TotalNo = 0, posicion = 0, pos_enca = 0, i = 0, nropregunta = 1;

            while (posicion < titulos.Length)
            {
                if (i == 0 || i == 9 || i == 24 || i == 30 || i == 35 || i == 43 || i == 50 || i == 55 || i == 60 || i == 64
                    || i == 69 || i == 74 || i == 80 || i == 83 || i == 87 || i == 93 || i == 96 || i == 106 || i == 113
                    || i == 121 || i == 126 || i == 134 || i == 139)
                {
                    miCelda20.Texto = valores[5];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

                    miCelda25.Texto = encabezado[pos_enca];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

                    miCelda20.Texto = valores[7];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

                    miCelda20.Texto = valores[8];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

                    miCelda11.Texto = valores[9];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

                    pos_enca++;
                    nropregunta = 1;
                }
                else
                {
                    miCelda1.Texto = "" + nropregunta;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda27.Texto = titulos[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                    if (valoressi[posicion].Equals("X")) TotalSi++;
                    miCelda1.Texto = valoressi[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    if (valoresno[posicion].Equals("X")) TotalNo++;
                    miCelda1.Texto = valoresno[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda3.Texto = textos[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                    posicion++;
                    nropregunta++;
                }
                i++;
            }
            miCelda29.Texto = "Observaciones Generales: " + valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));

            miCelda3.Texto = "Total de Condiciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "SI";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "Observaciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "Sumatoria total de respuestas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "" + TotalSi;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "" + TotalNo;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda3.Texto = "Las respuestas Negativas (NO) , indican condiciones de trabajo que pueden estar asociadas a alto riesgo de lesión o enfermedad.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            //miCelda49.Texto = "~/source/archivos/images_graf/graficaInspPA.jpg";
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, miCelda49));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInspeccionBotiquin(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InspeccionBotiquinPrimerosAuxilios_", "INSPECCIÓN DE BOTIQUÍN DE PRIMEROS AUXILIOS " + valores[1], _page);

            #region contenido
            int cantidad = Convert.ToInt32(valores[2]);

            miCelda11.Texto = "Insumo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda20.Texto = "Cantidad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda13.Texto = "Unidad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda20.Texto = "Existencia";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "Diferencia";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda13.Texto = "Motivo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "Reemplazado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            for (int i = 1; i <= cantidad; i++)
            {
                Label _label = (Label)_panel.FindControl(valores[3] + i);
                miCelda3.Texto = _label.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                _label = (Label)_panel.FindControl(valores[4] + i);
                miCelda1.Texto = _label.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _label = (Label)_panel.FindControl(valores[5] + i);
                miCelda15.Texto = _label.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));

                TextBox _textbox = (TextBox)_panel.FindControl(valores[6] + i);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)_panel.FindControl(valores[7] + i);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                _textbox = (TextBox)_panel.FindControl(valores[8] + i);
                miCelda15.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));

                DropDownList _drop = (DropDownList)_panel.FindControl(valores[9] + i);
                miCelda15.Texto = _drop.SelectedValue;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            }
            miCelda12.Texto = "OBSERVACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda29.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintIndicadores(String[] valores, String[] definicion, String[] interpretacion, String[] metodoCalculo, String[] fuenteCalculo,
                                            String[] responsable, String[] frecMedicion, String[] unidad, String[] meta, String[] resultados, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "IndicadorEmpresa_", "INDICADORES DE LA EMPRESA", _page);

            #region contenido
            int posicion = 0;
            for (int i = 0; i < 41; i++)
            {
                if (i == 0)
                {
                    miCelda12.Texto = "INDICADOR DE ESTRUCTURA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                }
                if (i == 19)
                {
                    miCelda12.Texto = "INDICADOR DE PROCESO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                }
                if (i == 32)
                {
                    miCelda12.Texto = "INDICADOR DE RESULTADO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                }
                else if (i == 1 || i == 20 || i == 33)
                {
                    miCelda13.Texto = "DEFINICIÓN";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                    miCelda13.Texto = "INTERPRETACIÒN";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                    miCelda13.Texto = "MÉTODO DE CÁLCULO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                    miCelda13.Texto = "FUENTE DEL CÁLCULO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

                    miCelda20.Texto = "RESPONSABLE";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda20.Texto = "FRECUENCIA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda20.Texto = "UNIDAD";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda20.Texto = "META";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                }
                else
                {
                    miCelda15.Texto = definicion[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
                    miCelda15.Texto = interpretacion[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
                    miCelda15.Texto = metodoCalculo[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
                    miCelda15.Texto = fuenteCalculo[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));

                    miCelda1.Texto = responsable[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = frecMedicion[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = unidad[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = meta[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda32.Texto = "RESULTADO: " + resultados[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda32));
                    miCelda30.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));

                    posicion++;
                }
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInventarioRiesgos(String[] valores, String[] titulos, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InventarioRiesgos_", "INVENTARIO DE RIESGOS", _page);

            #region contenido
            int posicion = 1;
            int posDdl = 1;

            for (int i = 0; i < 66; i++)
            {
                if (i == 0 || i == 8 || i == 15 || i == 23 || i == 30 || i == 38 || i == 45 || i == 54 || i == 61)
                {
                    miCelda33.Texto = titulos[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda33));

                    miCelda10.Texto = "FACTOR DE IMPACTO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda10));

                    miCelda34.Texto = "SENSIBILIDAD";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda34));

                    miCelda35.Texto = "ALTA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda35));

                    miCelda36.Texto = "MEDIA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda36));

                    miCelda37.Texto = "BAJA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda37));
                }
                else
                {
                    DropDownList miDropdownList = (DropDownList)_panel.FindControl("Dropdownlist" + posDdl);
                    posDdl++;
                    HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;
                    HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;
                    HtmlInputRadioButton miradio3 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;

                    miCelda38.Texto = titulos[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

                    miCelda16.Texto = miDropdownList.SelectedValue;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda16));

                    miCelda1.Texto = miradio1.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda1.Texto = miradio2.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda1.Texto = miradio3.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                }
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInventarioRecursos(String[] valores, String[] titulos, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InventarioRecursos_", "INVENTARIO DE RECURSOS", _page);
            #region contenido
            int posicion = 1;
            for (int i = 0; i < 36; i++)
            {
                if (i == 0 || i == 13 || i == 34)
                {
                    miCelda39.Texto = titulos[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda39));

                    miCelda13.Texto = "¿EXISTE?";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

                    miCelda37.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda37));

                    miCelda35.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda35));
                }
                else
                {
                    HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;
                    HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;

                    miCelda40.Texto = titulos[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda40));

                    miCelda1.Texto = miradio1.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda1.Texto = miradio2.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                }
            }
            #endregion
            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintBrigada(String[] valores, Panel pTrabajador, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "BrigadaEmergencias_", "BRIGADA DE EMERGENCIAS", _page);
            #region contenido
            string cadena = valores[1]; ;
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);

            miCelda12.Texto = "ESTRUCTURA INTERNA DE LA BRIGADA DE EMERGENCIAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }


            miCelda42.Texto = "FUNCIONES DE LOS BRIGADISTAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            miCelda42.Texto = "ANTES,DURANTE Y DESPUES DE LA EMERGENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            cadenas = valores[2].Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            miCelda42.Texto = "BRIGADA DE COMUNICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            miCelda42.Texto = "FUNCIONES, ACTIVIDADES Y PROCEDIMIENTO DE COMUNICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            cadenas = valores[3].Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }

            miCelda42.Texto = "DIRECTORIO DE EMERGENCIAS INTERNO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            miCelda42.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            miCelda43.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda43));
            miCelda44.Texto = "NOMBRE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda44));
            miCelda45.Texto = "CARGO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda45));
            miCelda45.Texto = "TELEFONO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda45));
            miCelda46.Texto = "LLAMAR A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda46));

            int contador = 0;
            int contador2 = 1;

            foreach (Control micontrol in pTrabajador.Controls)
            {
                if (micontrol is DropDownList || micontrol is TextBox)
                {
                    DropDownList miDDL = null;
                    TextBox mitxt = null;
                    if (micontrol is DropDownList) { miDDL = (DropDownList)micontrol; }
                    if (micontrol is TextBox) { mitxt = (TextBox)micontrol; }
                    contador++;
                    if (contador == 1)
                    {
                        miCelda20.Texto = string.Empty + contador2;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                        miCelda14.Texto = miDDL.SelectedValue;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    }
                    if (contador == 2)
                    {
                        miCelda13.Texto = mitxt.Text;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                    }
                    if (contador == 3)
                    {
                        miCelda13.Texto = mitxt.Text;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                    }
                    if (contador == 4)
                    {
                        miCelda11.Texto = miDDL.SelectedValue;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                        contador2++;
                        contador = 0;
                    }
                }
            }
            miCelda42.Texto = "BRIGADA DE PRIMEROS AUXILIOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda42));

            miCelda42.Texto = "FUNCIONES Y ACTIVIDADES DE LA BRIGADA DE PRIMEROS AUXILIOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda42));

            miCelda41.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda42.Texto = "BRIGADA CONTRA INCENDIOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            miCelda42.Texto = "FUNCIONES Y ACTIVIDADES DE LA BRIGADA DE EVACUACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            miCelda41.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda42.Texto = "BRIGADA DE EVACUACION";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            miCelda42.Texto = "FUNCIONES Y ACTIVIDADES DE LA BRIGADA DE EVACUACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda42));

            miCelda41.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintContingencias(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PlanEmergencia_", "PLAN DE EMERGENCIAS", _page);
            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPlanEvacuacion(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PlanEvacuacion_", "PLAN DE EVACUACIÓN", _page);
            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPlanTrabajo(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PlanTrabajo(Vista General)_", "PLAN DE TRABAJO ANUAL", _page);
            #region contenido
            List<plan_trabajo> ListaPlanTrabajo = new List<plan_trabajo>();
            ListaPlanTrabajo = Getter.Plan_Trabajo(Convert.ToInt32(valores[0]), Convert.ToInt32(valores[1]));
            int contActividad = 0;

            miCelda12.Texto = "ACTIVIDADES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda20.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda11.Texto = "Descripción";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            miCelda11.Texto = "Objetivos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            miCelda13.Texto = "Fecha";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda20.Texto = "Recursos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda13.Texto = "Responsable";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            foreach (var item in ListaPlanTrabajo)
            {
                DateTime fechaini = FirstDateOfWeekISO8601(Convert.ToInt32(valores[1]), Convert.ToInt32(item.semana_ini));
                DateTime fechafin = FirstDateOfWeekISO8601(Convert.ToInt32(valores[1]), Convert.ToInt32(item.semana_fin));
                contActividad++;
                miCelda1.Texto = contActividad.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                miCelda3.Texto = item.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda3.Texto = item.objetivos;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda15.Texto = "Del " + fechaini.ToString("dd/MM/yyy") + "Hasta el " + fechafin.AddDays(6).ToString("dd/MM/yyy");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
                miCelda1.Texto = item.recursos_aprobados + " Pesos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                miCelda15.Texto = item.usuario.trabajador.primer_nombre + " " + item.usuario.trabajador.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda15));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPlanTrabajoEspecifico(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PlanTrabajo(Vista Especifico)_", "PLAN DE TRABAJO ANUAL", _page);
            #region contenido
            List<plan_trabajo> ListaPlanTrabajo = new List<plan_trabajo>();
            ListaPlanTrabajo = Getter.Plan_Trabajo(Convert.ToInt32(valores[0]), Convert.ToInt32(valores[1]));
            int contActividad = 0;

            foreach (var item in ListaPlanTrabajo)
            {
                DateTime fechaini = FirstDateOfWeekISO8601(Convert.ToInt32(valores[1]), Convert.ToInt32(item.semana_ini));
                DateTime fechafin = FirstDateOfWeekISO8601(Convert.ToInt32(valores[1]), Convert.ToInt32(item.semana_fin));
                contActividad++;

                miCelda12.Texto = "ACTIVIDAD N° " + contActividad;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                miCelda25.Texto = "Descripción";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda25.Texto = "Objetivos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda27.Texto = item.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = item.objetivos;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda11.Texto = "Semana Inicial";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda3.Texto = "Semana N°: " + item.semana_ini;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda11.Texto = "Semana Final";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda3.Texto = "Semana N°: " + item.semana_fin;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                miCelda11.Texto = "Fecha Inicial";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda3.Texto = "Del " + fechaini.ToString("dd/MM/yyy");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda11.Texto = "Fecha Final";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
                miCelda3.Texto = "Hasta el " + fechafin.AddDays(6).ToString("dd/MM/yyy");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                miCelda13.Texto = "Duración";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                miCelda2.Texto = string.Empty + (item.semana_fin - item.semana_ini + 1) + " Semana(s)";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                miCelda13.Texto = "Recursos Aprobados";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                miCelda2.Texto = item.recursos_aprobados + " Pesos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                miCelda13.Texto = "Responsable";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                miCelda2.Texto = item.usuario.trabajador.primer_nombre + " " + item.usuario.trabajador.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

                int contObligacion = 0;
                miCelda13.Texto = "OBLIGACION N°";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                miCelda13.Texto = "Fecha de Entrega";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                miCelda13.Texto = "Estatus";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                miCelda13.Texto = "Responsable";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
                miCelda14.Texto = "Descripción";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                foreach (var item2 in item.obligacion)
                {
                    contObligacion++;

                    miCelda2.Texto = contObligacion.ToString();
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                    miCelda2.Texto = Convert.ToDateTime(item2.fecha_entrega).ToString("dd/MM/yyyy");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                    miCelda2.Texto = item2.estatus_obl;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                    miCelda2.Texto = item2.usuario.trabajador.primer_nombre + " " + item2.usuario.trabajador.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                    miCelda4.Texto = item2.descripcion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }
                miCelda47.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda47));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintRecursosEconomicos(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "RecursosEconomicos_", "RECURSOS ECONÓMICOS APROBADOS POR LA ALTA GERENCIA", _page);
            #region contenido
            miCelda48.Texto = "FICHA DE SOLICITUDES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda48));

            miCelda11.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda11.Texto = "DESCRIPCION DE LA SOLICITUD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda13.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda20.Texto = "UNIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda13.Texto = "PROVEEDOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "COSTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "CANTIDAD APROBADA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            for (int i = 1; i <= 60; i = i + 6)
            {
                TextBox miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i));
                miCelda3.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 1));
                miCelda2.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 2));
                miCelda1.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 3));
                miCelda2.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 4));
                miCelda2.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 5));
                miCelda2.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            }
            miCelda3.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda2.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda1.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda2.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda13.Texto = "TOTAL REQUERIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "TOTAL APROBADO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda3.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda2.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda1.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda2.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda13.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda25.Texto = "FIRMA DEL EMPLEADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
            miCelda25.Texto = "FIRMA DEL COORDINADOR DE SST";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
            miCelda27.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
            miCelda27.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
            miCelda27.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
            miCelda27.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReunionCopasst(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ReunionActaCopasst_", "POLITICA DE SST", _page);
            #region contenido
            miCelda13.Texto = "N° de Acta";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda50.Texto = "HORA DE INICIO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            miCelda50.Texto = "HORA DE FINALIZACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            miCelda2.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda38.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda12.Texto = "MIEMBROS PRINCIPALES DEL COMITÉ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "INVITADOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "SOLICITUDES DEL DÍA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "ESTATUS DE LAS SOLICITUDES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda49));

            miCelda50.Texto = "REPRESENTANTES DEL EMPLEADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            miCelda50.Texto = "REPRESENTANTES DE LOS TRABAJADORES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = "__________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = "__________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " FIRMA            ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " FIRMA            ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = "__________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = "__________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " FIRMA            ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " FIRMA            ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComunicadoElecciones(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ComunicacionElecciones_", "Comunicado de Elecciones", _page);

            #region contenido
            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda52.Texto = "Ciudad y Fecha: ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda52));
            miCelda53.Texto = Convert.ToDateTime(valores[1]).ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda52.Texto = "Dirigido a:: ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda52));
            miCelda53.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda52.Texto = "De: ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda52));
            miCelda53.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda51.Texto = "Asunto: Elección de candidatos en representación de los trabajadores para la " +
                              "conformación del Comité Paritario de Seguridad y Salud en el Trabajo con vigencia del año" +
                              valores[4] + " al año " + valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = valores[6] + " Dando cumplimiento a la legislación laboral relacionada con la conformación del " +
                              "Comité Paritario de Seguridad y Salud en el Trabajo, convoca a la inscripción de los " + valores[7] + "" +
                              "candidatos con sus respectivos suplentes en representación de los trabajadores.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = "La hoja de inscripción de candidatos debe " +
                              "reclamarse en la oficina de " + valores[8] + " hasta el día " +
                              Convert.ToDateTime(valores[9]).ToString("dd/MM/yyyy") + " y " +
                              "deberá ser diligenciada y entregada nuevamente como fecha límite el día " +
                              Convert.ToDateTime(valores[10]).ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = "Las planchas presentadas serán publicadas en cartelera para conocimiento de todos los trabajadores por " +
                               Convert.ToDateTime(valores[11]).ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = "La votación de las diferentes planchas que se presenten se realizará el día  " +
                              Convert.ToDateTime(valores[12]).ToString("dd/MM/yyyy") + " en " +
                              valores[13] + " a las " + valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = "El conteo de votos se realizará el día  " +
                               Convert.ToDateTime(valores[15]).ToString("dd/MM/yyyy") + " a las " +
                               valores[16] + "en presencia de un representante de cada una de las planchas presentadas y el jurado de votación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = "Cordialmente:  " + valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintFormatoVotos(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "FormatoVotos_", "Formato de Votos", _page);

            #region contenido
            miCelda73.Texto = "Votos por Candidatos Individuales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda73));
            miCelda56.Texto = "Candidato";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda56));
            miCelda56.Texto = "Foto";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda56));
            miCelda56.Texto = "Campo de Votación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda56));
            if (valores[1] != string.Empty)
            {
                miCelda4.Texto = valores[9];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = valores[5];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaFotos(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            }
            if (valores[2] != string.Empty)
            {
                miCelda4.Texto = valores[10];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = valores[6];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaFotos(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            }
            if (valores[3] != string.Empty)
            {
                miCelda4.Texto = valores[11];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = valores[7];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaFotos(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            }
            if (valores[4] != string.Empty)
            {
                miCelda4.Texto = valores[12];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = valores[8];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaFotos(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintRegistroVotantes(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "RegistroVotantes_", "Registro de votantes", _page);

            #region contenido
            miCelda55.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda55));
            miCelda56.Texto = "NOMBRE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda56));
            miCelda57.Texto = "CEDULA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda57));
            miCelda56.Texto = "FIRMA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda56));

            List<trabajador> LisTrabajador = new List<trabajador>();
            LisTrabajador = Mgr_Trabajador.Trabajador(0, 0, Convert.ToInt32(valores[1]));
            int contTrabajadortes = 0;

            foreach (var item in LisTrabajador)
            {
                contTrabajadortes++;
                miCelda58.Texto = contTrabajadortes.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda58));
                miCelda22.Texto = item.primer_nombre + " " + item.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda22));
                miCelda60.Texto = item.cedula;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda60));
                miCelda22.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda22));

                miCelda59.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda59));
                miCelda24.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda24));
                miCelda61.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda61));
                miCelda24.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda24));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }


        public static void PrintResultadoVotos(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ResultadoVotacion_", "Resultado de Votación", _page);

            #region contenido
            miCelda62.Texto = "Nombre";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda62));
            miCelda44.Texto = "N° de Votos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda44));

            miCelda30.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
            miCelda4.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda30.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
            miCelda4.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda30.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
            miCelda4.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda30.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
            miCelda4.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda30.Texto = "VOTOS EN BLANCO:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
            miCelda4.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda30.Texto = "VOTOS ANULADOS:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
            miCelda4.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda30.Texto = "RESULTADO DE LOS VOTOS:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda30));
            miCelda4.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda10.Texto = "NOMBRE:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda10));
            miCelda8.Texto = "OFICIO:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda8));
            miCelda8.Texto = "SECCIÓN:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda8));
            miCelda14.Texto = "CATEGORÍA:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda74.Texto = "PRINCIPAL:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda74));
            miCelda75.Texto = "SUPLENTE:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda75));
            int valor = 11;
            TextBox _texbox = new TextBox();
            for (int i = 0; i < 10; i++)
            {
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                miCelda4.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                valor++;
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                miCelda2.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                valor++;
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                miCelda2.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                valor++;
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                miCelda2.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                valor++;
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                miCelda2.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                valor++;
            }

            miCelda64.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda64));
            miCelda64.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda64));
            miCelda65.Texto = "___________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda65));
            miCelda65.Texto = "___________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda65));
            miCelda66.Texto = "Nombre y Firma del  Coordinador de la mesa de votación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda66));
            miCelda66.Texto = "Nombre y Firma del  Coordinador de la mesa de votación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda66));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintDesignacionVigia(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "DesignacionVigia_", "Acta de designación del Vigía en Seguridad y Salud en el Trabajo", _page);

            #region contenido
            miCelda41.Texto = "<p align='justify'><h3>" +
                                "En cumplimiento a lo establecido en el Decreto 1072 del 2015, se designa como Vigía en Seguridad y Salud en " +
                                "el Trabajo a: <strong>" + valores[1] + "</strong><br/> En virtud a lo anterior, el referido actuará como vigía en Seguridad " +
                                "y Salud en el trabajo por el término de 2 años de conformidad con el Decreto 1295 de 1994, período durante el cual el " +
                                "empleador se obliga a facilitar el tiempo necesario dentro de la jornada laboral para que realice sus " +
                                "respectivas funciones. <br/><br/> La presente se firma el <strong>" + valores[2] + "</strong>, con la" +
                                " aprobación de los trabajadores que integran la organización:</h3></p><br/><br/>";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda20.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda25.Texto = "Nombre";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
            miCelda50.Texto = "Cargo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            TextBox _textbox;
            for (int i = 1; i <= 18; i = i + 2)
            {

                miCelda1.Texto = i.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)_panel.FindControl("Textbox" + i);
                miCelda27.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                _textbox = (TextBox)_panel.FindControl("Textbox" + (i + 1));
                miCelda38.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            }
            miCelda52.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda52));

            miCelda53.Texto = "<strong><br/>__________________________________<br/>" +
                              "Vigía en Seguridad y Salud en el Trabajo<br/><br/>" +
                              "CC:<br/><br/>" +
                              "Cargo:<br/><br/></strong>";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda53));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInscripcionCandidatos(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InscripciónCandidatos_", "Inscripción de Candidatos", _page);

            #region contenido
            miCelda52.Texto = "Empresa ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda52));
            miCelda53.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda52.Texto = "Período ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda52));
            miCelda53.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda67.Texto = "NOMBRE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda67));
            miCelda67.Texto = "OFICIO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda67));
            miCelda67.Texto = "SECCIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda67));
            miCelda67.Texto = "FECHA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda67));
            TextBox _textbox;
            for (int i = 1; i <= 40; i = i + 4)
            {
                _textbox = (TextBox)_panel.FindControl("Textbox" + i);
                miCelda68.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda68));
                _textbox = (TextBox)_panel.FindControl("Textbox" + (i + 1));
                miCelda68.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda68));
                _textbox = (TextBox)_panel.FindControl("Textbox" + (i + 2));
                miCelda68.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda68));
                _textbox = (TextBox)_panel.FindControl("Textbox" + (i + 3));
                miCelda68.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda68));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintAperturaElecciones(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ActaApertura_", "Acta de Apertura", _page);

            #region contenido
            miCelda51.Texto = "Acta de apertura de elecciones de los candidatos al comité paritario de seguridad y salud en el trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda54.Texto = "Empresa ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda54));
            miCelda53.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda54.Texto = "Período ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda54));
            miCelda53.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda69.Texto = "Siendo las " + valores[3] + " de la fecha " + valores[4] + ",  se dio apertura al proceso de votación para " +
                                "la elección de los candidatos al  COMITÉ PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO  para el período que va " +
                                "de " + valores[5] + " a " + valores[6] + ".";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda69.Texto = "En calidad de jurados de votación  se encargó a los señores:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda69.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintActaCierre(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ActaCierre_", "Acta de Cierre", _page);

            #region contenido
            miCelda51.Texto = "Acta de cierre de las votaciones para elección de los candidatos al comité paritario de seguridad y salud en el trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda54.Texto = "Empresa ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda54));
            miCelda53.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda54.Texto = "Período ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda54));
            miCelda53.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda69.Texto = "Siendo las " + valores[3] + " de la fecha " + valores[4] + ",  se dio por finalizado el proceso de " +
                                "votación para elección de los candidatos al COMITÉ PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO  para el " +
                                "período  que va de " + valores[5] + " a " + valores[6] + ".";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda69.Texto = "Como jurados de mesa estuvieron presentes los señores (as):";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda69.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }


        #region Estructura de riesgos
        public static void PrintEstructuraInformacion(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraInformacion_", "Formato para la identificación de riesgos - Información", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Información";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = "Empresa: "+valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            miCelda49.Texto = "Área: " + valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            miCelda49.Texto = "Puesto de Trabajo: " + valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            miCelda49.Texto = "Nombre del Trabajador: " + valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Materia Prima/ Maquinas/ Equipos/Herramientas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Procedimientos Existentes (secuencia de operaciones)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Productos elaborados:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Emisiones atmosféricas/Desechos Líquidos/ sólidos:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Sustancias Empleadas:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Accidentes ocurridos en el puesto de trabajo:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Enfermedades o molestias de posible origen laboral:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraQuimica(String[] valores, String[] tabla1, String[] tabla2Etiquetas, String[] tabla2Valores,
                                                  String[] tabla3Etiquetas, String[] tabla3Valores, String[] tabla4Etiquetas, String[] tabla4Valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraQuimico_", "Formato para la identificación de riesgos - Químicos", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Químicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            bool band = true;
            int i = 0;
            while(band)
            {
                miCelda4.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i+1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i+2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            miCelda14.Texto = "Agente Químico";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Sustancias Asfixiantes";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Otras Sustancias";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            for (int j = 0; j < tabla2Etiquetas.Length; j++)
            {
                miCelda3.Texto = tabla2Etiquetas[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                miCelda1.Texto = tabla2Valores[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                if (j < 5)
                {
                    miCelda3.Texto = tabla3Etiquetas[j];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda1.Texto = tabla3Valores[j];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

                    miCelda3.Texto = tabla4Etiquetas[j];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                    miCelda1.Texto = tabla4Valores[j];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                }
                else
                {
                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }
               
            }



            miCelda12.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraFisicos(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraFisico_", "Formato para la identificación de riesgos - Físicos", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Físicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            bool band = true;
            int i = 0;
            while (band)
            {
                miCelda4.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            miCelda12.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraMecanicas(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraMecanico_", "Formato para la identificación de riesgos - Mecánicos", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Mecánicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            bool band = true;
            int i = 0;
            while (band)
            {
                miCelda4.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            miCelda12.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraBiologicas(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraBiologico_", "Formato para la identificación de riesgos - Biológicos", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Biológicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            bool band = true;
            int i = 0;
            while (band)
            {
                miCelda4.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            miCelda12.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraDisergonomica(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraDisergonomicos_", "Formato para la identificación de riesgos - Disergonómicos", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Disergonómicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            bool band = true;
            int i = 0;
            while (band)
            {
                miCelda4.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            miCelda12.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraPsicosociales(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraPsicosociales_", "Formato para la identificación de riesgos - Psicosociales", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Psicosociales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            bool band = true;
            int i = 0;
            while (band)
            {
                miCelda4.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            miCelda12.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraElectricos(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraElectricos_", "Formato para la identificación de riesgos - Electricos", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Electricos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            bool band = true;
            int i = 0;
            while (band)
            {
                miCelda4.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            miCelda12.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraLocativos(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraLocativos_", "Formato para la identificación de riesgos - Locativos", _page);

            #region contenido
            miCelda12.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Locativos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda14.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda14.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            bool band = true;
            int i = 0;
            while (band)
            {
                miCelda4.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            miCelda12.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }
        #endregion

        public static void PrintConformacionCopasst(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ConformacionCopasst_", "Conformacion Copasst", _page);

            #region contenido
            miCelda51.Texto = "Acta de conformación del comité paritario de seguridad y salud en el trabajo o vigía de seguridad y salud en el trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda69.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda52.Texto = "Empresa ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda52));
            miCelda53.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda52.Texto = "Período ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda52));
            miCelda53.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda53));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda69.Texto = "El día " + valores[3] + " se eligió el Comité Paritario de Seguridad y Salud en el Trabajo o el vigía de " +
                              "seguridad y salud en el trabajo dando así cumplimiento a las exigencias de la Resolución  2013 de 1986,  al " +
                              "Decreto 1295 de 1994 y a la División de Salud Ocupacional del Ministerio de Protección Social.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda69.Texto = "Como jurados de mesa estuvieron presentes los señores (as):";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));
            miCelda69.Texto = "La modalidad utilizada para su elección fue:" + valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda51.Texto = "Resultaron elegidos:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda51));

            miCelda69.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda69.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = "El representante legal de la empresa designa a :" + valores[12] + " Como presidente del comité y por votación del comité se nombra a " +
                             valores[12] + " Como secretario (a) del mismo.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda69.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            miCelda69.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }
        public static void PrintProgramaInspecciones(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ProgramaInspecciones_", "PROGRAMA DE INSPECCIONES", _page);

            #region contenido
            miCelda41.Texto = "Realizar inspecciones en cada una de las áreas de la Empresa, a fin de determinar las condiciones en las que se encuentran los puestos de trabajo," +
                "los dispositivos de seguridad y el acatamiento de las normas y procedimientos seguros de trabajo" +
                "<h3> Metas. </h3><br/>" +
                "<ul>" +
                "<li> Realizar periódicamente seguimiento de los procesos de trabajo en cada una de las áreas productivas de la organización. </li>" +
                "<li> Involucrar a los trabajadores y a los supervisores en el desarrollo de las inspecciones en cada uno de los elementos a evaluar. </li>" +
                "<li> Según los resultados obtenidos realizar medidas preventivas, para minimizar el riesgo de ocurrencia de accidentes de trabajo y enfermedades ocupacionales. </li>" +
                "</ul> ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPlanInduccion(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PlanInduccion_", "PLAN DE INDUCCIÓN", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }
        
        public static void PrintValidacionProvCont(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ValidacionProvCont_", "VALIDACIÓN DE PROVEEDORES Y CONTRATISTAS", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintConstanciaInduccion(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ConstanciaInduccion", "CONSTANCIA DE INDUCCIÓN", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintConstanciaReinduccionAdm(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ConstanciaReinduccionAdm", "CONSTANCIA DE REINDUCCIÓN DE AREA ADMINISTRATIVA", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintConstanciaReinduccionOpe(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ConstanciaReinduccionOpe", "CONSTANCIA DE REINDUCCIÓN DE AREA OPERATIVA", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPoliticaPrevencionAcoso(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PolPrevAcosoLaboral_", "PÓLITICA DE PREVENCIÓN DE ACOSO LABORAL", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }
        public static void PrintManualConvivencia(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ManualConvivencia", "MANUAL DE CONVIVENCIA", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }


        public static void PrintQuejas(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "FormatoQuejas", "QUEJA", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReunionComiteConvivencia(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ReunionComiteConvivencia", "REUNIÓN DEL COMITÉ DE CONVIVENCIA", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComiteConvivencia(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ComitéConvivencia", "COMITÉ DE CONVIVENCIA", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintIdentificacionPeligro(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "IdentificacionPeligro_", "IDENTIFICACIÓN DE PELIGRO", _page);

            List<identificacion_peligro> listta = Mgr_Riesgos.IdentificacionPeligro(Convert.ToInt32(valores[1]));
            #region contenido
            foreach (var item in listta)
            {
                miCelda12.Texto = "Medidas de control Existentes";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda41.Texto = item.medidas_control_existentes;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda41));

                miCelda12.Texto = "Observaciones";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda41.Texto = item.observaciones;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda41));

                miCelda12.Texto = "Fecha";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda41.Texto = item.fecha_identificacion.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda41));
            }

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComunicacionPoliticaSST(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PoliticaSST_", "COMUNICADO POLITICA DE SST", _page);

            #region contenido
            miCelda12.Texto = "AÑO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "COMPROMISO DE LA EMPRESA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "EN TAL SENTIDO AL EMPRESA SE COMPROMETE A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda38.Texto = "TRABAJADOR AL QUE FUE COMUNICADO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = "FIRMA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda38.Texto = string.Empty + valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComunicacionPoliticaSST2(String[] valores, List<trabajador> ListaTrabajador, Page _page)
        {
            foreach (var itemTrab in ListaTrabajador)
            {
                Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PoliticaSST_", "COMUNICADO POLITICA DE SST", _page);

                miCelda12.Texto = "AÑO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = valores[1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "COMPROMISO DE LA EMPRESA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = valores[2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "EN TAL SENTIDO AL EMPRESA SE COMPROMETE A";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = valores[3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda38.Texto = "TRABAJADOR AL QUE FUE COMUNICADO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = "FIRMA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = string.Empty + itemTrab.primer_nombre + " " + itemTrab.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

                ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
            }
        }


        public static void PrintEncuestaPoliticaSST(String[] valores2, String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores2[0]),
                                        "EncuestaPoliticaSST_", "ENCUESTA SOBRE EL CONOCIMIENTO DE LA POLITICA DE SST", _page);

            #region contenido
            miCelda20.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda14.Texto = "PREGUNTAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
            miCelda20.Texto = "SI";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda20.Texto = "NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda38.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            for (int i = 0; i < 18; i++)
            {
                miCelda1.Texto = string.Empty + (i + 1);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                miCelda4.Texto = valores[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda1.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                miCelda1.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                miCelda50.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            }

            miCelda38.Texto = "TRABAJADOR AL QUE FUE COMUNICADO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = "FIRMA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = string.Empty + valores2[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores2[0]), _page);
        }

        public static void PrintEncuestaPoliticaSST2(String[] valores2, String[] valores, List<trabajador> ListaTrabajador, Page _page)
        {


            #region contenido
            foreach (var itemTrab in ListaTrabajador)
            {
                Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores2[0]),
                                        "EncuestaPoliticaSST_", "ENCUESTA SOBRE EL CONOCIMIENTO DE LA POLITICA DE SST", _page);

                miCelda20.Texto = "N°";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                miCelda14.Texto = "PREGUNTAS";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda20.Texto = "SI";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                miCelda20.Texto = "NO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                miCelda38.Texto = "OBSERVACIONES";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

                for (int i = 0; i < 18; i++)
                {
                    miCelda1.Texto = string.Empty + (i + 1);
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda4.Texto = valores[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda50.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                }

                miCelda38.Texto = "TRABAJADOR AL QUE FUE COMUNICADO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = "FIRMA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = string.Empty + itemTrab.primer_nombre + " " + itemTrab.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                miCelda38.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

                ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores2[0]), _page);
            }

            #endregion


        }


        public static void PrintAsignacionResponsable(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ActaResponsabilidad_", "Acta de asignación del responsable del SGSST", _page);

            #region contenido 
            miCelda72.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda72));

            miCelda69.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda69));

            miCelda51.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda51));

            miCelda69.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda69));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComunicadoIncidenteLaboral(String[] valores, Page _page)
        {
            #region contenido 
            List<at_it_el_pa> ListAccidentes = new List<at_it_el_pa>();
            ListAccidentes = Mgr_Acc_Inc.Accidente(Convert.ToInt32(valores[0]));

            foreach (var item in ListAccidentes)
            {
                int IdSucursal = item.trabajador.puesto_trabajo.area.id_sucursal;
                Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                                                            IdSucursal,
                                                            "ComunicadoIncidente_",
                                                            "",
                                                            _page);

                miCelda14.Texto = "Sucursal";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Fecha Incidente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Hora Incidente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda4.Texto = item.trabajador.puesto_trabajo.area.sucursal.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = item.fecha_accidente.Value.ToString("yyyy-MM-dd");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = item.hora_accidente.Value.ToString("hh:mm:ss");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda14.Texto = "Trabajador";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Área";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Puesto de Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda4.Texto = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                if (item.id_area == 0)
                {
                    miCelda4.Texto = "Ninguno";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }
                else
                {
                    miCelda4.Texto = item.area.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }
                if (item.id_puesto == 0)
                {
                    miCelda4.Texto = "Ninguno";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }
                else
                {
                    miCelda4.Texto = item.puesto_trabajo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }

                miCelda25.Texto = "Sitio donde se presentó el caso.";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
                miCelda25.Texto = "Breve descripción de los hechos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

                miCelda27.Texto = item.sitio;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = item.descripcion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

                miCelda12.Texto = "CAUSAS INMEDIATAS - Condiciones Inseguras";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item.condiciones_inseguras;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "CAUSAS INMEDIATAS - Actos Inseguros";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item.actos_inseguros;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "CAUSAS BÁSICAS - Factores del Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item.factores_inseguros;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "CAUSAS BÁSICAS - Factores Personales";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item.factores_personales;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

                miCelda12.Texto = "Magnitud del Evento";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                miCelda14.Texto = "Días de incapacidad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Días cargados";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Días perdidos por ausencia del trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda4.Texto = string.Empty + item.dias_incapacidad;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = string.Empty + item.dias_cargados;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                miCelda4.Texto = string.Empty + item.dias_perdidos_ausencia;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda14.Texto = "Días perdidos por actividad restringida";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Sin Tiempo Perdido";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                miCelda14.Texto = "Tipo de enfermedad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                miCelda4.Texto = string.Empty + item.dias_perdidos_restingido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                if (Convert.ToString(item.dias_no_perdidos) == "true")
                {
                    miCelda4.Texto = "Si";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }
                else
                {
                    miCelda4.Texto = "No";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }
                string tipoEnf = "";
                if (Convert.ToString(item.tipo_enfermedad) == "A") { tipoEnf = "Enfermedades en la piel"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "B") { tipoEnf = "Enfermedades respiratorias"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "C") { tipoEnf = "Envenenamiento"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "D") { tipoEnf = "Enfermedades debidas a agentes físicos"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "E") { tipoEnf = "Enfermedades producidas por traumas repetitivos"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "F") { tipoEnf = "Otras enfermedades osteomusculares"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "G") { tipoEnf = "Demás enfermedades profesionales"; }
                miCelda4.Texto = tipoEnf;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                miCelda12.Texto = "COMUNICADO A TRABAJADORES";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

                List<trabajador> ListaTrabajador = new List<trabajador>();
                ListaTrabajador = Mgr_Trabajador.Trabajador(0, 0, IdSucursal);

                foreach (var item1 in ListaTrabajador)
                {
                    miCelda14.Texto = "Nombre y Apellido";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Cédula";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));
                    miCelda14.Texto = "Firma";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

                    miCelda4.Texto = item1.primer_nombre + " " + item1.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = item1.cedula;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                }

                ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
            }
            #endregion


        }



        public static void PrintMetodologiaIR(string[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "MetIdentificacionRiesgos_", "METODOLOGÍA DE RIESGOS", _page);

            #region contenido
            string cadena = valores[1];
            string[] delimitadores = { "#NOBORRAR#" };
            string[] cadenas = cadena.Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                miCelda41.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintIdentificacionAccidente(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "IdentificacionRiesgo_", "IDENTIFICACIÓN DE RIESGO", _page);

            #region contenido
            miCelda12.Texto = "Puestos de Trabajo Afectados";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            List<identificacion_peligro> List_IdePel = new List<identificacion_peligro>();
            List_IdePel = Mgr_Riesgos.IdentificacionPeligro(Convert.ToInt32(valores[1]));

            foreach (var item_IdePel in List_IdePel)
            {
                int contadorPuesto = 1;
                foreach (var item_IdePue in item_IdePel.identificacion_puesto)
                {
                    miCelda2.Texto = "Puesto N°" + contadorPuesto;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                    miCelda38.Texto = "Sucursal: " + item_IdePue.puesto_trabajo.area.sucursal.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    miCelda38.Texto = "Puesto de Trabajo: " + item_IdePue.puesto_trabajo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    contadorPuesto++;
                }
            }

            miCelda12.Texto = "Peligros";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            foreach (var item_IdePel in List_IdePel)
            {
                foreach (var item_fac_ide in item_IdePel.factor_identificacion)
                {
                    miCelda2.Texto = "Tipo de Riesgo: " + item_fac_ide.factor_riesgo.tipo_riesgo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                    miCelda4.Texto = "Factor de Riesgo:  " + item_fac_ide.factor_riesgo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda4.Texto = "Posibles Efectos:  " + item_fac_ide.consecuencias;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));
                    miCelda2.Texto = "Tiempo de Exposición:  " + item_fac_ide.tiempo_exposicion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                }
                miCelda12.Texto = "Medidas de control existentes";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item_IdePel.medidas_control_existentes;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
                miCelda12.Texto = "Observaciones";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda49.Texto = item_IdePel.observaciones;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            }

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintMatrizResponsabilidades(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "MatrizResponsabilidad_", "MATRIZ DE RESPONSABILIDADES", _page);

            #region contenido
            miCelda41.Texto = "<br/><br/><br/><br/><br/><h1 align='center'>MATRIZ DE RESPONSABILIDADES Y COMPETENCIAS DE LA EMPRESA</h1>";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = "<h3><strong>ALTA GERENCIA, EMPLEADOR</strong></h3>" + valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = "<h3><strong>COORDINADOR DE SEGURIDAD Y SALUD EN EL TRABAJO</strong></h3>" + valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = "<h3><strong>JEFES DE ÁREA</strong></h3>" + valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = "<h3><strong>RESPONSABLE DE SALUD OCUPACIONAL</strong></h3>" + valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = "<h3><strong>TRABAJADORES</strong></h3>" + valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = "<h3><strong>COMITÉ PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO</strong></h3>" + valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = "<h3><strong>COMITÉ DE CONVIVENCIA</strong></h3>" + valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda41.Texto = "<h3><strong>COORDINADOR DE ALTURAS</strong></h3><br/>" + valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda41));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));
            miCelda70.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            miCelda70.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));
            miCelda70.Texto = "ALTA GERENCIA, EMPLEADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            miCelda70.Texto = "COORDINADOR DE SEGURIDAD Y SALUD EN EL TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));
            miCelda70.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            miCelda70.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));
            miCelda70.Texto = "JEFES DE ÁREA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            miCelda70.Texto = "RESPONSABLE DE SALUD OCUPACIONAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));
            miCelda70.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            miCelda70.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));
            miCelda70.Texto = "TRABAJADORES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            miCelda70.Texto = "COMITÉ PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));
            miCelda70.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            miCelda70.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));

            miCelda12.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda12));
            miCelda70.Texto = "COMITÉ DE CONVIVENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            miCelda70.Texto = "COORDINADOR DE ALTURAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda70));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInventarioEPP(String[] valores, Panel pnExistencia, Panel pnIngresos, Panel pnEgresos, List<Model_CEPP> epps, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PlanillaInventarioEpp_", "PLANILLA DE INVENTARIO DE EPP", _page);

            #region contenido
            List<empresa> ListaEmpresa = new List<empresa>();
            ListaEmpresa = Mgr_Empresa.Empresa(Convert.ToInt32(valores[1]));

            string nomEmpresa = string.Empty;
            foreach (var item in ListaEmpresa)
            {
                nomEmpresa = item.nombre;
            }

            miCelda12.Texto = "EXISTENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda20.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda50.Texto = "EQUIPOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
            miCelda11.Texto = "UNIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            miCelda11.Texto = "EXISTENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            int cont_epp = 0;
            TextBox _textbox;
            foreach (var epp in epps)
            {
                miCelda1.Texto = (cont_epp + 1).ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
                miCelda38.Texto = epp.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                _textbox = (TextBox)pnExistencia.FindControl("lblUniExi" + cont_epp);
                miCelda3.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                _textbox = (TextBox)pnExistencia.FindControl("txtCantExi" + cont_epp);
                miCelda3.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                cont_epp++;
            }

            miCelda12.Texto = "INGRESOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda20.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda11.Texto = "EQUIPOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            miCelda13.Texto = "UNIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "FECHA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda20.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda11.Texto = "PROVEEDOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            cont_epp = 0;
            foreach (var epp in epps)
            {
                miCelda1.Texto = (cont_epp + 1).ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                miCelda3.Texto = epp.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtUni" + cont_epp);
                miCelda2.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtFech" + cont_epp);
                miCelda2.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtCant" + cont_epp);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtProv" + cont_epp);
                miCelda3.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
            }

            miCelda12.Texto = "EGRESOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda20.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda11.Texto = "EQUIPOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            miCelda13.Texto = "UNIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda20.Texto = "SOLICITANTE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda11.Texto = "FECHA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            cont_epp = 0;
            foreach (var epp in epps)
            {
                miCelda1.Texto = (cont_epp + 1).ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                miCelda3.Texto = epp.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtUni" + cont_epp);
                miCelda2.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                _textbox = (TextBox)pnEgresos.FindControl("EtxtCant" + cont_epp);
                miCelda2.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                _textbox = (TextBox)pnEgresos.FindControl("EtxtSol" + cont_epp);
                miCelda1.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                _textbox = (TextBox)pnEgresos.FindControl("EtxtFech" + cont_epp);
                miCelda3.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                cont_epp++;
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPlantillaEntregaEPP(String[] valores, Panel pnDatos, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PlanillaEntregaEpp_", "PLANILLA DE ENTREGA DE EPP", _page);

            #region contenido
            List<empresa> ListaEmpresa = new List<empresa>();
            ListaEmpresa = Mgr_Empresa.Empresa(Convert.ToInt32(valores[1]));
            string nomEmpresa = string.Empty;
            foreach (var item in ListaEmpresa)
            {
                nomEmpresa = item.nombre;
            }
            List<trabajador> trabajador = Mgr_Trabajador.Trabajador(Convert.ToInt32(valores[2]));
            List<sucursal> sucursal = Mgr_Sucursal.Sucursal(Convert.ToInt32(valores[3]), 0, string.Empty);
            string direccion = string.Empty;
            foreach (var item in sucursal)
            {
                direccion = item.direccion;
            }

            foreach (var item in trabajador)
            {
                miCelda27.Texto = "Nombres y Apellidos: " + valores[4];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = "C.C: " + item.cedula;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = "Cargo: " + item.puesto_trabajo.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda27.Texto = "Código: ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));
                miCelda29.Texto = "La Empresa " + nomEmpresa + ", domiciliada en " + direccion + ", en cumplimiento a lo dispuesto en el Decreto 1072 del año 2015, artículos: 2.2.4.6.12, Numeral 8 y artículo 2.2.4.6.24 Parágrafo 1, Por medio de la presente, hace entrega de los equipos de protección personal que en las páginas numeradas se señalan:";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));
                miCelda29.Texto = "Y yo, " + valores[4] + " Titular de la Cédula de Ciudadanía Nº " + item.cedula + ", trabajador de la Empresa antes citada por medio de la presente declaro:";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));
                miCelda29.Texto = "1.-Que recibo en perfecto estado de funcionamiento los Equipos de Protección Personal y, que los mismos son adecuados, y se corresponden con las actividades que realizo en esta Empresa. ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));
                miCelda29.Texto = "2.-Que el empleador ha suministrado las instrucciones necesarias para el uso correcto de los equipos recibidos.";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));
                miCelda29.Texto = "3.-Me comprometo, a hacer uso adecuado durante mi jornada de trabajo, incluso en jornadas extras laboradas de acuerdo a la ley de los equipos de protección personal dotados, y de acuerdo a las instrucciones que me han sido impartidas. ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));
                miCelda29.Texto = "4.-Encontrándome conforme, firmo.";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda29));
            }
            miCelda11.Texto = "DOTACIÓN  ENTREGADA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            miCelda11.Texto = "DETALLES DE LA DOTACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            miCelda13.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "FECHA DE ENTREGA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "FIRMA DE RECIBIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            int id_puesto_trabajo = Mgr_PuestoTrabajo.idPuestoTrabajador(Convert.ToInt32(valores[2]));
            List<Model_CEPP> epps = Getter.Epp(id_puesto_trabajo);
            int cont = 0;
            TextBox _textbox;
            foreach (var epp in epps)
            {
                miCelda3.Texto = epp.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                _textbox = (TextBox)pnDatos.FindControl("txtDet" + cont);
                miCelda3.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
                _textbox = (TextBox)pnDatos.FindControl("txtCant" + cont);
                miCelda2.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                _textbox = (TextBox)pnDatos.FindControl("txtFech" + cont);
                miCelda2.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                miCelda2.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
                cont++;
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintVigilanciaEpidemiologica(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "VigilanciaEpidemiologica_", "VIGILANCIA EPIDEMIOLÓGICA DE LA SALUD DE LOS TRABAJADORES", _page);

            #region contenido
            miCelda20.Texto = "# DE ACCIDENTES DE TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda20.Texto = "# DE ACCIDENTES COMUNES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda20.Texto = "# DE ENFERMEDADES COMUNES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda13.Texto = "# DE ENFERMEDADES DE POSIBLE ORIGEN OCUPACIONAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda20.Texto = "# DE ENFERMEDADES OCUPACIONALES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda13.Texto = "# DE TRABAJADORES REFERENCIADOS A  CENTROS ESPECIALIZADOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda20.Texto = "# DE TRABAJADORES CON DISCAPACIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda13.Texto = "RESULTADOS DE EVALUACIONES CLÍNICAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda20.Texto = "MONITOREO DE REPOSOS MÉDICOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda1.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            miCelda1.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            miCelda1.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            miCelda2.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda1.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            miCelda2.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda1.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            miCelda2.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda1.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda49.Texto = "~/source/archivos/images_graf/graficoFuerzaLab.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, miCelda49));
            miCelda12.Texto = "Resultados de Evaluaciones Clínicas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda20.Texto = "Evaluación Pre Empleo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
            miCelda13.Texto = "Evaluación Pre Vacacional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Evaluación Post Vacacional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Evaluación Periódica";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Evaluación Especial";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Evaluación Post Empleo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda20.Texto = "Evaluación Asistencial o Curativa";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda1.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
            miCelda2.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda2.Texto = valores[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda2.Texto = valores[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda2.Texto = valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda2.Texto = valores[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda1.Texto = valores[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda49.Texto = "~/source/archivos/images_graf/graficaEvaCli.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, miCelda49));
            miCelda12.Texto = "Monitoreo de Reposos Médicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda13.Texto = "N° de Reposos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "Días de Reposo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda13.Texto = "N° Reposos por Enfermedad Común";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));
            miCelda11.Texto = "N° Reposos por Enfermedad Ocupacional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));
            miCelda11.Texto = "N° Reposos por Accidente Común";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda11));

            miCelda2.Texto = valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda2.Texto = valores[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda2.Texto = valores[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));
            miCelda3.Texto = valores[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));
            miCelda3.Texto = valores[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda3));

            miCelda49.Texto = "~/source/archivos/images_graf/graficaRepMed.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Diagnósticos presentes en los Trabajadores";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = "~/source/archivos/images_graf/graficaDiagnostico.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Sistema Orgánico Afectado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda49.Texto = "~/source/archivos/images_graf/graficaSistema.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReporteTrabajadoresA(String[] valores, String[] headers, String[] columna1, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                     "ReporteTrabajadores_", "REPORTE DE TRABAJADORES", _page);

            #region contenido
            int PosHeader = 0;
            int posicionfila = 0;
            int posicionTextbox = 1;

            for (int i = 0; i < 151; i++)
            {
                if (i == 0 || i == 7 || i == 14 || i == 26 || i == 33 || i == 39 || i == 44 || i == 53 || i == 61 || i == 67 || i == 72 ||
                    i == 76 || i == 83 || i == 90 || i == 94 || i == 99 || i == 102 || i == 109 || i == 113 || i == 125 || i == 133 ||
                    i == 139 || i == 149)
                {
                    miCelda50.Texto = headers[PosHeader];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                    miCelda20.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda20.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda50.Texto = "OBSERVACIONES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                    PosHeader++;
                }
                else if (i == 150)
                {
                    miCelda38.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    miCelda1.Texto = valores[1];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = valores[2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda38.Texto = valores[3];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                }
                else
                {
                    if (i == 1)
                    {

                        miCelda38.Texto = columna1[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                        miCelda1.Texto = " ";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                        miCelda1.Texto = " ";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                        miCelda38.Texto = " ";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    }
                    else
                    {
                        HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)_panel.FindControl("radio" + (posicionfila + 1));
                        HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)_panel.FindControl("radio" + (posicionfila + 2));

                        TextBox mitextbox = (TextBox)_panel.FindControl("txtf" + posicionTextbox);

                        miCelda38.Texto = columna1[posicionfila / 2];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                        miCelda1.Texto = miradio1.Checked == true ? "X" : "";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                        miCelda1.Texto = miradio2.Checked == true ? "X" : "";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                        miCelda38.Texto = mitextbox.Text;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    }
                    posicionfila = posicionfila + 2;
                    posicionTextbox++;
                }

            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReporteTrabajadoresB(String[] valores, String[] headers, String[] columna1, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                     "ReporteTrabajadores_", "REPORTE DE CONDICIONES DE TRABAJO", _page);

            #region contenido
            int PosHeader = 0;
            int posicionfila = 0;
            int posicionTextbox = 1;

            for (int i = 0; i < 159; i++)
            {
                if (i == 0 || i == 9 || i == 20 || i == 29 || i == 37 || i == 51 || i == 69 || i == 74 || i == 83 || i == 91 || i == 96 ||
                    i == 106 || i == 111 || i == 120 || i == 129 || i == 136 || i == 146 || i == 157)
                {
                    miCelda50.Texto = headers[PosHeader];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                    miCelda20.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda20.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda50.Texto = "OBSERVACIONES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                    PosHeader++;
                }
                else if (i == 158)
                {
                    miCelda38.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    miCelda1.Texto = valores[1];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = valores[2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda38.Texto = valores[3];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                }
                else
                {
                    HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)_panel.FindControl("radio" + (posicionfila + 1));
                    HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)_panel.FindControl("radio" + (posicionfila + 2));

                    TextBox mitextbox = (TextBox)_panel.FindControl("txtf" + posicionTextbox);

                    miCelda38.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    miCelda1.Texto = miradio1.Checked == true ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = miradio2.Checked == true ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda38.Texto = mitextbox.Text;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

                    posicionfila = posicionfila + 2;
                    posicionTextbox++;
                }

            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReporteTrabajadoresAGeneral(String[] valores, String[] headers, String[] columna1, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                     "ReporteTrabajadores_", "REPORTE DE TRABAJADORES", _page);

            #region contenido
            int PosHeader = 0;
            int posicionfila = 0;


            for (int i = 0; i < 151; i++)
            {
                if (i == 0 || i == 7 || i == 14 || i == 26 || i == 33 || i == 39 || i == 44 || i == 53 || i == 61 || i == 67 || i == 72 ||
                    i == 76 || i == 83 || i == 90 || i == 94 || i == 99 || i == 102 || i == 109 || i == 113 || i == 125 || i == 133 ||
                    i == 139 || i == 149)
                {
                    miCelda50.Texto = headers[PosHeader];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                    miCelda20.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda20.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda50.Texto = "OBSERVACIONES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                    PosHeader++;
                }
                else if (i == 150)
                {
                    miCelda38.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda38.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                }
                else
                {
                    miCelda38.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda38.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    posicionfila = posicionfila + 2;
                }

            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReporteTrabajadoresBGeneral(String[] valores, String[] headers, String[] columna1, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                     "ReporteTrabajadores_", "REPORTE DE CONDICIONES DE TRABAJO", _page);

            #region contenido
            int PosHeader = 0;
            int posicionfila = 0;


            for (int i = 0; i < 159; i++)
            {
                if (i == 0 || i == 9 || i == 20 || i == 29 || i == 37 || i == 51 || i == 69 || i == 74 || i == 83 || i == 91 || i == 96 ||
                    i == 106 || i == 111 || i == 120 || i == 129 || i == 136 || i == 146 || i == 157)
                {
                    miCelda50.Texto = headers[PosHeader];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                    miCelda20.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda20.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));
                    miCelda50.Texto = "OBSERVACIONES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));
                    PosHeader++;
                }
                else if (i == 158)
                {
                    miCelda38.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda38.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                }
                else
                {
                    miCelda38.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda1.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));
                    miCelda38.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));
                    posicionfila = posicionfila + 2;
                }

            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReporteTrabajadoresC(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                     "ReporteTrabajadores_", "REPORTE DE TRABAJADORES", _page);

            #region contenido
            miCelda12.Texto = "DATOS DEL TRABAJADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda13.Texto = "PRIMER APELLIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "SEGUNDO APELLIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda14.Texto = "NOMBRES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda14.Texto = "N° DE IDENTIFICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda2.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda2.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda4.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda4.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda14.Texto = "SEXO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda14.Texto = "EDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda14.Texto = "EDO CIVIL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda4.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda4.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda4.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda12.Texto = "CCF";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda25.Texto = "ÁREA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

            miCelda25.Texto = "PUESTO DE TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

            miCelda27.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda12.Texto = "¿Qué equipos opera?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "¿Actualmente presenta alguna enfermedad o esta en tratamiento médico? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Describa que síntoma(s) físico(s) o emocional(es) percibe y el tiempo de evolución";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "¿Considera que tiene alguna relación estos síntomas con su trabajo? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "¿Considera que tiene alguna relación éste síntoma con sus actividades fuera del trabajo? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda50.Texto = "¿Ha consultado a su servicio de salud por estos síntomas?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));

            miCelda20.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda50.Texto = "¿Porqué?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));

            miCelda38.Texto = valores[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda1.Texto = valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda38.Texto = valores[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda50.Texto = "¿Durante el último año ha sido incapacitado por esta causa?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));

            miCelda20.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda50.Texto = "¿Porqué?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));

            miCelda38.Texto = valores[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda1.Texto = valores[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = valores[22];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda38.Texto = valores[23];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda12.Texto = "¿Cuantos días de incapacidad médica?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[24];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "¿Tiene Ud. algún hobbie, o practica algún deporte? ¿Cual(es)? ¿Qué tiempo le dedica a cada uno?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[25];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "SUGERENCIAS Y RECOMENDACIONES PARA EL MEJORAMIENTO DE LAS CONDICIONES DE SALUD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = valores[26];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReporteTrabajadoresCGeneral(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                     "ReporteTrabajadores_", "REPORTE DE TRABAJADORES", _page);

            #region contenido
            miCelda12.Texto = "DATOS DEL TRABAJADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda13.Texto = "PRIMER APELLIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda13.Texto = "SEGUNDO APELLIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda13));

            miCelda14.Texto = "NOMBRES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda14.Texto = "N° DE IDENTIFICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda2.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda2.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda2));

            miCelda4.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda4.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda14.Texto = "SEXO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda14.Texto = "EDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda14.Texto = "EDO CIVIL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda14));

            miCelda4.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda4.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda4.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda4));

            miCelda12.Texto = "CCF";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda25.Texto = "ÁREA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

            miCelda25.Texto = "PUESTO DE TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));

            miCelda27.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda27.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda12.Texto = "¿Qué equipos opera?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "¿Actualmente presenta alguna enfermedad o esta en tratamiento médico? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "Describa que síntoma(s) físico(s) o emocional(es) percibe y el tiempo de evolución";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "¿Considera que tiene alguna relación estos síntomas con su trabajo? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "¿Considera que tiene alguna relación éste síntoma con sus actividades fuera del trabajo? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda50.Texto = "¿Ha consultado a su servicio de salud por estos síntomas?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));

            miCelda20.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda50.Texto = "¿Porqué?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));

            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda1.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda50.Texto = "¿Durante el último año ha sido incapacitado por esta causa?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));

            miCelda20.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda20.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda20));

            miCelda50.Texto = "¿Porqué?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda50));

            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda1.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda1.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda1));

            miCelda38.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda38));

            miCelda12.Texto = "¿Cuantos días de incapacidad médica?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "¿Tiene Ud. algún hobbie, o practica algún deporte? ¿Cual(es)? ¿Qué tiempo le dedica a cada uno?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));

            miCelda12.Texto = "SUGERENCIAS Y RECOMENDACIONES PARA EL MEJORAMIENTO DE LAS CONDICIONES DE SALUD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda49.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda49));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPoliticaSST(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PoliticaSST_", "POLITICA DE SST", _page);

            #region contenido
            miCelda12.Texto = "AÑO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda69.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda69));

            miCelda12.Texto = "COMPROMISO DE LA EMPRESA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda69.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda69));

            miCelda12.Texto = "EN TAL SENTIDO AL EMPRESA SE COMPROMETE A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda69.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda69));

            miCelda12.Texto = "ALCANCE DEL SST";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));

            miCelda69.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda69));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPerfilCargo(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PerfilCargo_", "PERFIL DE CARGO", _page);

            #region contenido
            miCelda25.Texto = "Nombre del Cargo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
            miCelda27.Texto = string.Empty + valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda25.Texto = "Código CNO Asociado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda25));
            miCelda27.Texto = string.Empty + valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda27));

            miCelda12.Texto = "Descripción";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda12));
            miCelda51.Texto = string.Empty + valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, miCelda51));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }


        public static DateTime FirstDateOfWeekISO8601(int year, int weekOfYear)
        {
            DateTime jan1 = new DateTime(year, 1, 1);
            int daysOffset = DayOfWeek.Thursday - jan1.DayOfWeek;

            DateTime firstThursday = jan1.AddDays(daysOffset);
            var cal = CultureInfo.CurrentCulture.Calendar;
            int firstWeek = cal.GetWeekOfYear(firstThursday, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);

            var weekNum = weekOfYear;
            if (firstWeek <= 1)
            {
                weekNum -= 1;
            }
            var result = firstThursday.AddDays(weekNum * 7);
            return result.AddDays(-3);
        }

        public static string GetCheckValue(CheckBox _check)
        {
            return _check.Checked != false ? "X" : "";
        }

        public static string GetRadioValue(RadioButtonList _radio)
        {
            return _radio.SelectedValue != string.Empty ? "X" : "";
        }

        public static string GetRadioValue(RadioButton _radio)
        {
            return _radio.Checked ? "X" : "";
        }

        public static string GetRadioValue(HtmlInputRadioButton _radio)
        {
            return _radio.Checked ? "X" : "";
        }

        public static string GetInputValue(HtmlInputGenericControl _input)
        {
            return _input.Value != string.Empty ? _input.Value + "%" : "";
        }

        public static string GetTextValue(RadioButtonList _radio)
        {
            return _radio.SelectedValue == "APTO" ? "amarillo" : "rojo";
        }

    }
}
