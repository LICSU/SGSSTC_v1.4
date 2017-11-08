using Capa_Datos.Manager.Acc_Inc;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Epp;
using Capa_Datos.Manager.GestionLaboral;
using Capa_Datos.Manager.PlanTrabajo;
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
        private static Model_Celda B_H3_C_N_12_1_Bl = new Model_Celda(1, "H3", "C", "0|0|0|0", 12, 1, "", "");
        private static Model_Celda B_H4_C_URDL_12_1_Ve = new Model_Celda(1, "H3", "C", "1|1|1|1", 12, 1, "verde", "");
        private static Model_Celda B_H4_C_URDL_12_1_Ro = new Model_Celda(1, "H3", "C", "1|1|1|1", 12, 1, "rojo", "");
        private static Model_Celda B_H4_C_URDL_12_1_Vi = new Model_Celda(1, "H3", "C", "1|1|1|1", 12, 1, "violeta", "");
        private static Model_Celda B_H3_C_N_3_1_Az = new Model_Celda(1, "H3", "C", "0|0|0|0", 3, 1, "azul", "");
        private static Model_Celda B_H3_C_N_8_1_Az = new Model_Celda(1, "H3", "C", "0|0|0|0", 8, 1, "azul", "");
        private static Model_Celda B_H3_C_RDL_6_1_Bl = new Model_Celda(1, "H3", "C", "0|1|1|1", 6, 1, "", "");
        private static Model_Celda B_H3_C_RL_6_1_Bl = new Model_Celda(1, "H3", "C", "0|1|0|1", 6, 1, "", "");
        private static Model_Celda B_H3_C_URDL_1_1_Az = new Model_Celda(1, "H3", "C", "1|1|1|1", 1, 1, "azul", "");
        private static Model_Celda B_H3_C_URDL_1_2_Az = new Model_Celda(1, "H3", "C", "1|1|1|1", 1, 2, "azul", "");
        private static Model_Celda B_H3_C_URDL_12_1_Bl = new Model_Celda(1, "H3", "C", "1|1|1|1", 12, 1, "", "");
        private static Model_Celda B_H3_C_URDL_3_1_Az = new Model_Celda(1, "H3", "C", "1|1|1|1", 3, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_3_1_Ro = new Model_Celda(1, "H3", "C", "1|1|1|1", 3, 1, "rojo", "");
        private static Model_Celda B_H3_C_URDL_3_1_Bl = new Model_Celda(1, "H3", "C", "1|1|1|1", 3, 1, "", "");
        private static Model_Celda B_H3_C_URDL_4_1_Az = new Model_Celda(1, "H3", "C", "1|1|1|1", 4, 1, "azul", "");
        private static Model_Celda B_H3_C_URL_6_1_Bl = new Model_Celda(1, "H3", "C", "1|1|0|1", 6, 1, "", "");
        private static Model_Celda B_H3_J_URDL_12_1_Bl = new Model_Celda(1, "H3", "J", "1|1|1|1", 12, 1, "", "");
        private static Model_Celda B_H3_J_URDL_4_1_Az = new Model_Celda(1, "H3", "J", "1|1|1|1", 4, 1, "azul", "");
        private static Model_Celda B_H3_J_URDL_4_1_Bl = new Model_Celda(1, "H3", "J", "1|1|1|1", 4, 1, "", "");
        private static Model_Celda B_H3_J_URDL_8_1_Bl = new Model_Celda(1, "H3", "J", "1|1|1|1", 8, 1, "", "");
        private static Model_Celda B_H3_R_N_12_1_Bl = new Model_Celda(1, "H3", "R", "0|0|0|0", 12, 1, "", "");
        private static Model_Celda B_H4_C_D_1_1_Am = new Model_Celda(1, "H4", "C", "0|0|1|0", 1, 1, "amarillo", "");
        private static Model_Celda B_H4_C_D_2_1_Am = new Model_Celda(1, "H4", "C", "0|0|1|0", 2, 1, "amarillo", "");
        private static Model_Celda B_H4_C_DL_1_1_Ro = new Model_Celda(1, "H4", "C", "0|0|1|1", 1, 1, "rojo", "");
        private static Model_Celda B_H4_C_DL_1_1_Ve = new Model_Celda(1, "H4", "C", "0|0|1|1", 1, 1, "verde", "");
        private static Model_Celda B_H4_C_N_1_1_Az = new Model_Celda(1, "H4", "C", "0|0|0|0", 1, 1, "azul", "");
        private static Model_Celda B_H4_C_N_12_1_Az = new Model_Celda(1, "H4", "C", "0|0|0|0", 12, 1, "azul", "");
        private static Model_Celda B_H4_C_N_2_1_Az = new Model_Celda(1, "H4", "C", "0|0|0|0", 2, 1, "azul", "");
        private static Model_Celda B_H4_C_RD_1_1_Ve = new Model_Celda(1, "H4", "C", "0|1|1|0", 1, 1, "verde", "");
        private static Model_Celda B_H4_C_RDL_1_1_Bl = new Model_Celda(1, "H4", "C", "0|1|1|1", 1, 1, "", "");
        private static Model_Celda B_H4_C_RDL_3_1_Bl = new Model_Celda(1, "H4", "C", "0|1|1|1", 3, 1, "", "");
        private static Model_Celda B_H4_C_RDL_4_1_Bl = new Model_Celda(1, "H4", "C", "0|1|1|1", 4, 1, "", "");
        private static Model_Celda B_H4_C_RL_4_1_Bl = new Model_Celda(1, "H4", "C", "0|1|0|1", 4, 1, "", "");
        private static Model_Celda B_H4_C_UDL_1_1_Az = new Model_Celda(1, "H4", "C", "1|0|1|1", 1, 1, "azul", "");
        private static Model_Celda B_H4_C_URD_1_1_Am = new Model_Celda(1, "H4", "C", "1|1|1|0", 1, 1, "amarillo", "");
        private static Model_Celda B_H4_C_URD_11_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|0", 11, 1, "azul", "");
        private static Model_Celda B_H4_C_URD_9_1_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 9, 1, "", "");
        private static Model_Celda B_H4_C_URDL_1_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_1_1_Vi = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "violeta", "");
        private static Model_Celda B_H4_C_URDL_1_1_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "", "");
        private static Model_Celda B_H4_C_URDL_1_1_Ro = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "rojo", "");
        private static Model_Celda B_H4_C_URDL_1_1_Ve = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 1, "verde", "");
        private static Model_Celda B_H4_C_URDL_1_11_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 11, "", "");
        private static Model_Celda B_H4_C_URDL_1_13_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 13, "", "");
        private static Model_Celda B_H4_C_URDL_1_14_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 14, "", "");
        private static Model_Celda B_H4_C_URDL_1_26_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 26, "", "");
        private static Model_Celda B_H4_C_URDL_1_4_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 4, "", "");
        private static Model_Celda B_H4_C_URDL_1_5_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 5, "", "");
        private static Model_Celda B_H4_C_URDL_1_51_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 1, 51, "", "");
        private static Model_Celda B_H4_C_URDL_12_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 12, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_12_1_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 12, 1, "", "");
        private static Model_Celda B_H4_C_URDL_12_1_Gr = new Model_Celda(1, "H4", "C", "1|1|1|1", 12, 1, "gris", "");
        private static Model_Celda B_H4_C_URDL_2_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_2_1_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "", "");
        private static Model_Celda B_H4_C_URDL_2_1_Ro = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "rojo", "");
        private static Model_Celda B_H4_C_URDL_2_1_Ve = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "verde", "");
        private static Model_Celda B_H4_C_URDL_2_1_Vi = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 1, "violeta", "");
        private static Model_Celda B_H4_C_URDL_2_2_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 2, 2, "azul", "");
        private static Model_Celda B_H4_C_URDL_3_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_3_1_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 1, "", "");
        private static Model_Celda B_H4_C_URDL_3_1_Ve = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 1, "verde", "");
        private static Model_Celda B_H4_C_URDL_3_2_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 2, "azul", "");
        private static Model_Celda B_H4_C_URDL_3_2_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 3, 2, "", "");
        private static Model_Celda B_H4_C_URDL_4_1_Am = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "amarillo", "");
        private static Model_Celda B_H4_C_URDL_4_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_4_1_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "", "");
        private static Model_Celda B_H4_C_URDL_4_1_Ve = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 1, "verde", "");
        private static Model_Celda B_H4_C_URDL_4_2_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 4, 2, "azul", "");
        private static Model_Celda B_H4_C_URDL_5_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 5, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_5_1_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 5, 1, "", "");
        private static Model_Celda B_H4_C_URDL_5_1_Ro = new Model_Celda(1, "H4", "C", "1|1|1|1", 5, 1, "rojo", "");
        private static Model_Celda B_H4_C_URDL_5_1_Ve = new Model_Celda(1, "H4", "C", "1|1|1|1", 5, 1, "verde", "");
        private static Model_Celda B_H4_C_URDL_5_1_Vi = new Model_Celda(1, "H4", "C", "1|1|1|1", 5, 1, "violeta", "");
        private static Model_Celda B_H4_C_URDL_6_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_6_2_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 2, "azul", "");
        private static Model_Celda B_H4_C_URDL_6_2_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 2, "", "");
        private static Model_Celda B_H4_C_URDL_6_4_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 4, "azul", "");
        private static Model_Celda B_H4_C_URDL_6_4_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 6, 4, "", "");
        private static Model_Celda B_H4_C_URDL_7_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 7, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_7_1_Bl = new Model_Celda(1, "H4", "C", "1|1|1|1", 7, 1, "", "");
        private static Model_Celda B_H4_C_URDL_9_1_Az = new Model_Celda(1, "H4", "C", "1|1|1|1", 9, 1, "azul", "");
        private static Model_Celda B_H4_C_URL_1_1_Bl = new Model_Celda(1, "H4", "C", "1|1|0|1", 1, 1, "", "");
        private static Model_Celda B_H4_C_URL_3_1_Bl = new Model_Celda(1, "H4", "C", "1|1|0|1", 3, 1, "", "");
        private static Model_Celda B_H4_C_URL_4_1_Bl = new Model_Celda(1, "H4", "C", "1|1|0|1", 4, 1, "", "");
        private static Model_Celda B_H4_L_N_3_1_Az = new Model_Celda(1, "H4", "L", "0|0|0|0", 3, 1, "azul", "");
        private static Model_Celda B_H4_L_N_6_1_Bl = new Model_Celda(1, "H4", "L", "0|0|0|0", 6, 1, "", "");
        private static Model_Celda B_H4_L_URDL_10_1_Az = new Model_Celda(1, "H4", "L", "1|1|1|1", 10, 1, "azul", "");
        private static Model_Celda B_H4_L_URDL_10_1_Bl = new Model_Celda(1, "H4", "L", "1|1|1|1", 10, 1, "", "");
        private static Model_Celda B_H4_L_URDL_10_2_Bl = new Model_Celda(1, "H4", "L", "1|1|1|1", 10, 2, "", "");
        private static Model_Celda B_H4_L_URDL_12_1_Bl = new Model_Celda(1, "H4", "L", "1|1|1|1", 12, 1, "", "");
        private static Model_Celda B_H4_L_URDL_3_1_Az = new Model_Celda(1, "H4", "L", "1|1|1|1", 3, 1, "azul", "");
        private static Model_Celda B_H4_C_URDL_3_1_Vi = new Model_Celda(1, "H4", "L", "1|1|1|1", 3, 1, "violeta", "");
        private static Model_Celda B_H4_L_URDL_5_2_Az = new Model_Celda(1, "H4", "L", "1|1|1|1", 5, 2, "azul", "");
        private static Model_Celda B_H4_L_URDL_6_1_Bl = new Model_Celda(1, "H4", "L", "1|1|1|1", 6, 1, "", "");
        private static Model_Celda B_H4_L_URDL_8_1_Bl = new Model_Celda(1, "H4", "L", "1|1|1|1", 8, 1, "", "");
        private static Model_Celda B_N_N_N_12_1_Bl = new Model_Celda(1, "", "", "0|0|0|0", 12, 1, "", "");
        private static Model_Celda N_H4_C_URDL_4_1_Bl = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, 1, "", "");
        private static Model_Celda N_H4_L_URDL_2_1_Bl = new Model_Celda(0, "H4", "L", "1|1|1|1", 2, 1, "", "");



        #region Evaluacion de Riesgos
        public static void PrintEvaluacionNRiesgos(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "EvaluacionRiesgos",
                "Nivel de Riesgos",
                _page,
                true);

            B_N_N_N_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

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

            B_N_N_N_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

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

            B_N_N_N_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

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

            B_N_N_N_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

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

            B_N_N_N_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

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

            B_H4_C_URDL_12_1_Bl.Texto = "Puesto de Trabajo: " + valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            B_H4_C_URDL_12_1_Bl.Texto = "Área de Trabajo: " + valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

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

            B_N_N_N_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }
        #endregion

        public static void PrintDocCorrespondencia(String[] valores, String[] encabezados1, String[] valores1, String[] tabla1, String[] encabezados2, String[] tabla2, String[] tabla3, String[] tabla4, String[] tabla5, String[] tabla6, String[] tabla7, String[] valores6, String[] valores7, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "DocCorrespondencia",
                "DOCUMENTO DE CORRESPONDENCIA",
                _page,
                true);

            #region encabezado
            B_H4_L_URDL_12_1_Bl.Texto = "El presente documento registra las características físicas y fisiológicas que debe poseer el ocupante de este cargo, para la respectiva correspondencia entre las evaluaciones médicas y los peligros a los que se encuentra expuesto el trabajador";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));

            B_H4_L_URDL_12_1_Bl.Texto = "Empresa /Sucursal: " + valores[1] + " /" + valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));

            B_H4_L_URDL_12_1_Bl.Texto = "Cargo: " + valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));

            B_H4_L_URDL_12_1_Bl.Texto = "Ubicación: ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));
            #endregion

            #region encabezadoss
            for (int i = 0; i < encabezados1.Length; i++)
            {
                B_H4_C_URDL_2_1_Az.Texto = encabezados1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            }

            for (int i = 0; i < valores1.Length; i++)
            {
                if (tabla1[i] == "X")
                {
                    B_H4_C_URDL_2_1_Ve.Texto = valores1[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Ve));
                }
                else
                {
                    N_H4_L_URDL_2_1_Bl.Texto = valores1[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
                }
            }
            int j = 0;

            B_H4_C_URDL_4_1_Az.Texto = encabezados2[j];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = encabezados2[j + 1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = encabezados2[j + 2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = encabezados2[j + 3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = encabezados2[j + 4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = encabezados2[j + 5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region tabla2
            bool band = true;
            j = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla2[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla2[j + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla2[j + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_4_1_Bl.Texto = tabla2[j + 3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla2[j + 4];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla2[j + 5];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                j = j + 6;
                if (j == tabla2.Length) band = false;
            }

            B_H4_C_URDL_4_1_Az.Texto = "Posiciones requeridas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Frecuente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Ocasional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Manipulación ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Frecuente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Ocasional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            #endregion

            #region tabla3
            band = true;
            j = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla3[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla3[j + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla3[j + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_4_1_Bl.Texto = tabla3[j + 3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla3[j + 4];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla3[j + 5];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                j = j + 6;
                if (j == tabla3.Length) band = false;
            }

            B_H4_C_URDL_4_1_Az.Texto = "Ritmo de Trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Frecuente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Ocasional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Responsabilidades/exigencias";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Frecuente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Ocasional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            #endregion

            #region tabla4
            band = true;
            j = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla4[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla4[j + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla4[j + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_4_1_Bl.Texto = tabla4[j + 3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla4[j + 4];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = tabla4[j + 5];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                j = j + 6;
                if (j == tabla4.Length) band = false;
            }

            B_H4_C_URDL_12_1_Az.Texto = "Agentes Estresores (señalar los existentes)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));


            band = true;
            j = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla5[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_2_1_Bl.Texto = tabla5[j + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                B_H4_C_URDL_4_1_Bl.Texto = tabla5[j + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_2_1_Bl.Texto = tabla5[j + 3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                j = j + 4;
                if (j == tabla5.Length) band = false;
            }
            #endregion

            #region ultimas 2 tablas
            B_H4_C_URDL_12_1_Az.Texto = "Condiciones o factores de riesgos presente";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Exposición a";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Temperatura";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Humedad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Ventilación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Iluminación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Ruido";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            for (int i = 0; i < tabla6.Length; i++)
            {
                if (valores6[i] == "X")
                {
                    B_H4_C_URDL_2_1_Ve.Texto = tabla6[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Ve));
                }
                else
                {
                    N_H4_L_URDL_2_1_Bl.Texto = tabla6[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
                }
            }

            B_H4_C_URDL_2_1_Az.Texto = "Vibraciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Radiaciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Condiciones Locativas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Exposición Biológica";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Sustancias Químicas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            for (int i = 0; i < tabla7.Length; i++)
            {
                if (i == 4 || i == 9 || i == 14 || i == 19)
                {
                    if (valores7[i] == "X")
                    {
                        B_H4_C_URDL_4_1_Ve.Texto = tabla7[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Ve));
                    }
                    else
                    {
                        B_H4_C_URDL_4_1_Bl.Texto = tabla7[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    }
                }
                else
                {
                    if (valores7[i] == "X")
                    {
                        B_H4_C_URDL_2_1_Ve.Texto = tabla7[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Ve));
                    }
                    else
                    {
                        N_H4_L_URDL_2_1_Bl.Texto = tabla7[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
                    }
                }
            }

            #endregion

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones Generales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

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

            B_H3_C_URDL_1_2_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H3_C_URDL_1_2_Az.Texto = "TIPO DE RIESGO DE ACUERDO CON LAS CARACTERISTICAS DE LA EMPRESA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H3_C_URDL_1_2_Az.Texto = "TEMA DE CAPACITACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H3_C_URDL_1_2_Az.Texto = "DURACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H3_C_URDL_1_2_Az.Texto = "POBLACIÓN OBJETO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H3_C_URDL_1_2_Az.Texto = "PONENTE O INSTRUCTOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H3_C_URDL_1_2_Az.Texto = "DOCUMENTO DE  SOPORTE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H3_C_URDL_1_2_Az.Texto = "FECHA PROGRAMADA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H4_C_URDL_2_1_Az.Texto = "ESTATUS DE CUMPLIMIENTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H3_C_URDL_1_2_Az.Texto = "LUGAR O SITIO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));
            B_H3_C_URDL_1_2_Az.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_2_Az));

            B_H4_C_URDL_1_1_Az.Texto = "SI";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            TableCell _cell;
            TextBox _textbox;
            RadioButton _radio;
            string _valor = string.Empty;
            bool band = true;

            #region Mecanicos (1 al 13)
            for (int pregunta = 1; pregunta <= 13; pregunta++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                if (band)
                {
                    B_H4_C_URDL_1_13_Bl.Texto = "Mecánicos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_13_Bl));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            }
            #endregion

            band = true;
            #region Físicos (14 al 18)
            for (int pregunta = 14; pregunta <= 18; pregunta++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                if (band)
                {
                    B_H4_C_URDL_1_5_Bl.Texto = "Físicos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_5_Bl));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            }
            #endregion

            band = true;
            #region Disergonómicos (19 al 32)
            for (int pregunta = 19; pregunta <= 32; pregunta++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                if (band)
                {
                    B_H4_C_URDL_1_14_Bl.Texto = "Disergonómicos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_14_Bl));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            }
            #endregion

            band = true;
            #region Químicos (33 al 43)
            for (int pregunta = 33; pregunta <= 43; pregunta++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                if (band)
                {
                    B_H4_C_URDL_1_11_Bl.Texto = "Quimicos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_11_Bl));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            }
            #endregion

            band = true;
            #region Eléctricos (44 al 47)
            for (int pregunta = 44; pregunta <= 47; pregunta++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                if (band)
                {
                    B_H4_C_URDL_1_4_Bl.Texto = "Eléctricos";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_4_Bl));
                    band = false;
                }

                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            }
            #endregion

            band = true;
            #region Psicosocial Desarrollo Conductual (48 al 98)
            for (int pregunta = 48; pregunta <= 98; pregunta++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                if (band)
                {
                    B_H4_C_URDL_1_51_Bl.Texto = "Psicosocial Desarrollo Conductual";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_51_Bl));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            }
            #endregion

            band = true;
            #region Prevención de Emergencias (99 al 124)
            for (int pregunta = 99; pregunta <= 124; pregunta++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                if (band)
                {
                    B_H4_C_URDL_1_26_Bl.Texto = "Prevención de Emergencias";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_26_Bl));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            }
            #endregion

            band = true;
            #region Generales (125 al 150)
            for (int pregunta = 125; pregunta <= 150; pregunta++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + pregunta;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                if (band)
                {
                    B_H4_C_URDL_1_26_Bl.Texto = "Generales";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_26_Bl));
                    band = false;
                }
                _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _cell.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
                if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = _valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintAutoevaluacion(String[] valores, String[] titulos,
            String[]  ciclo, String[] item, String[] cumplimiento, String[] calificacion, String[] evidencia, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]),
                "AutoEvaluacion_",
                "EVALUACIÓN INICIAL DEL SGSST",
                _page);

            #region cuerpo

            #region Planear
            int pos = 0;
            int posTitulos = 0;
            B_H4_C_URDL_12_1_Az.Texto = titulos[posTitulos];
            posTitulos++;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "CICLO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_5_1_Az.Texto = "ITEM DEL ESTÁNDAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "CUMPLIMIENTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "CALIFICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "EVIDENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            //Fase Planear
            for (int i = 0; i < 22; i++)
            {
                if (i == 7 || i == 11 || i == 12 || i == 13 || i == 14 || i == 15 || i == 16 || i == 17 || i == 18 || i == 19 || i == 20 || i == 21)
                {
                    B_H4_C_URDL_12_1_Az.Texto = titulos[posTitulos];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_C_URDL_1_1_Az.Texto = "CICLO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                    B_H4_C_URDL_5_1_Az.Texto = "ITEM DEL ESTÁNDAR";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

                    B_H4_C_URDL_2_1_Az.Texto = "CUMPLIMIENTO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

                    B_H4_C_URDL_1_1_Az.Texto = "CALIFICACIÓN";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                    B_H4_C_URDL_3_1_Az.Texto = "EVIDENCIA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

                    posTitulos++;
                }

                B_H4_C_URDL_1_1_Az.Texto = ciclo[0];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                B_H4_C_URDL_5_1_Bl.Texto = item[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

                B_H4_C_URDL_2_1_Bl.Texto = cumplimiento[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = calificacion[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_3_1_Bl.Texto = evidencia[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                pos++;

            }

            #endregion

            #region Hacer
            B_H4_C_URDL_12_1_Ve.Texto = titulos[posTitulos];
            posTitulos++;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Ve));

            B_H4_C_URDL_1_1_Ve.Texto = "CICLO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ve));

            B_H4_C_URDL_5_1_Ve.Texto = "ITEM DEL ESTÁNDAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Ve));

            B_H4_C_URDL_2_1_Ve.Texto = "CUMPLIMIENTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Ve));

            B_H4_C_URDL_1_1_Ve.Texto = "CALIFICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ve));

            B_H4_C_URDL_3_1_Ve.Texto = "EVIDENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Ve));

            for (int i = 0; i < 30; i++)
            {
                if (i == 8 || i == 11 || i == 18 || i == 22 || i == 28)
                {
                    B_H4_C_URDL_12_1_Ve.Texto = titulos[posTitulos];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Ve));

                    B_H4_C_URDL_1_1_Ve.Texto = "CICLO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ve));

                    B_H4_C_URDL_5_1_Ve.Texto = "ITEM DEL ESTÁNDAR";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Ve));

                    B_H4_C_URDL_2_1_Ve.Texto = "CUMPLIMIENTO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Ve));

                    B_H4_C_URDL_1_1_Ve.Texto = "CALIFICACIÓN";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ve));

                    B_H4_C_URDL_3_1_Ve.Texto = "EVIDENCIA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Ve));

                    posTitulos++;
                }

                B_H4_C_URDL_1_1_Ve.Texto = ciclo[1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ve));

                B_H4_C_URDL_5_1_Bl.Texto = item[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

                B_H4_C_URDL_2_1_Bl.Texto = cumplimiento[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = calificacion[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_3_1_Bl.Texto = evidencia[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                pos++;
            }

            #endregion

            #region Verificar
            B_H4_C_URDL_12_1_Ro.Texto = titulos[posTitulos];
            posTitulos++;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Ro));

            B_H4_C_URDL_1_1_Ro.Texto = "CICLO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ro));

            B_H4_C_URDL_5_1_Ro.Texto = "ITEM DEL ESTÁNDAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Ro));

            B_H4_C_URDL_2_1_Ro.Texto = "CUMPLIMIENTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Ro));

            B_H4_C_URDL_1_1_Ro.Texto = "CALIFICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ro));

            B_H4_C_URDL_3_1_Ro.Texto = "EVIDENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Ro));

            for (int i = 0; i < 4; i++)
            {
                B_H4_C_URDL_1_1_Ro.Texto = ciclo[2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ro));

                B_H4_C_URDL_5_1_Bl.Texto = item[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

                B_H4_C_URDL_2_1_Bl.Texto = cumplimiento[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = calificacion[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_3_1_Bl.Texto = evidencia[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                pos++;
            }

            #endregion


            #region Verificar
            B_H4_C_URDL_12_1_Vi.Texto = titulos[posTitulos];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Vi));

            B_H4_C_URDL_1_1_Vi.Texto = "CICLO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Vi));

            B_H4_C_URDL_5_1_Vi.Texto = "ITEM DEL ESTÁNDAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Vi));

            B_H4_C_URDL_2_1_Vi.Texto = "CUMPLIMIENTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Vi));

            B_H4_C_URDL_1_1_Vi.Texto = "CALIFICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Vi));

            B_H4_C_URDL_3_1_Vi.Texto = "EVIDENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Vi));

            for (int i = 0; i < 4; i++)
            {
                B_H4_C_URDL_1_1_Vi.Texto = ciclo[3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Vi));

                B_H4_C_URDL_5_1_Bl.Texto = item[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

                B_H4_C_URDL_2_1_Bl.Texto = cumplimiento[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                B_H4_C_URDL_1_1_Bl.Texto = calificacion[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                B_H4_C_URDL_3_1_Bl.Texto = evidencia[pos];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                pos++;
            }

            #endregion

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintGestionLaboral(String[] valores, Page _page)
        {
            List<gestion_laboral> ListaGestionLaboral = new List<gestion_laboral>();
            ListaGestionLaboral = Mgr_GestionLaboral.Get_GestionLaboral(Convert.ToInt32(valores[0]));

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

                B_H4_C_URDL_3_2_Az.Texto = "EMPRESA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Az));
                B_H4_C_URDL_3_2_Az.Texto = "FECHA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Az));
                B_H4_C_URDL_3_2_Az.Texto = "DESCRIPCIÓN";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Az));
                B_H4_C_URDL_3_2_Az.Texto = "RESPONSABLE";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Az));

                B_H4_C_URDL_3_2_Bl.Texto = Convert.ToString(itemGestionLaboral.usuario.trabajador.puesto_trabajo.area.sucursal.empresa.nombre);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Bl));
                B_H4_C_URDL_3_2_Bl.Texto = Convert.ToString(itemGestionLaboral.fecha);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Bl));
                B_H4_C_URDL_3_2_Bl.Texto = itemGestionLaboral.descripcion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Bl));
                B_H4_C_URDL_3_2_Bl.Texto = Convert.ToString(itemGestionLaboral.usuario.login);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Bl));

                if (tipoGestion == 2)
                {
                    B_H4_C_URDL_6_2_Az.Texto = "OBJETIVOS";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_2_Az));
                    B_H4_C_URDL_6_2_Az.Texto = "CANTIDAD DE HORAS";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_2_Az));
                    B_H4_C_URDL_6_2_Bl.Texto = itemGestionLaboral.objetivos;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_2_Bl));
                    B_H4_C_URDL_6_2_Bl.Texto = Convert.ToString(itemGestionLaboral.cant_horas);
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_2_Bl));
                }

                List<trabajador_gestion> ListaTrabajadorGestion = Mgr_Trabajador.Get_TrabajadorInGestion(0, Convert.ToInt32(valores[0]));
                B_H4_C_URDL_12_1_Az.Texto = "TRABAJADORES QUE ASISTIRAN";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                foreach (var item in ListaTrabajadorGestion)
                {
                    string ruta = item.trabajador.foto;
                    ruta = ruta.Replace("~/source", "../..");
                    ContadorTrabajadores++;

                    B_H4_C_URDL_6_2_Bl.Texto = "TRABAJADOR " + ContadorTrabajadores;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_2_Bl));
                    B_H4_C_URDL_6_2_Bl.Texto = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_2_Bl));
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
            B_H3_J_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_J_URDL_12_1_Bl));
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

            B_H4_C_URDL_12_1_Az.Texto = "Cronograma de Inspecciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Área";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Tipo de Inspección";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Fecha de Inspección Inicial";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Responsables";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Objetivo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            int filas = Convert.ToInt32(valores[1]);
            TextBox miTextBox;
            DropDownList miDropDownList;

            for (int i = 0; i <= filas; i++)
            {
                miDropDownList = (DropDownList)_Panel.FindControl("ddlArea" + i);
                N_H4_L_URDL_2_1_Bl.Texto = "" + miDropDownList.SelectedItem.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));

                miDropDownList = (DropDownList)_Panel.FindControl("ddlTipo" + i);
                N_H4_L_URDL_2_1_Bl.Texto = "" + miDropDownList.SelectedItem.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));

                miTextBox = (TextBox)_Panel.FindControl("txtFecha" + i);
                N_H4_L_URDL_2_1_Bl.Texto = "" + miTextBox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));

                miTextBox = (TextBox)_Panel.FindControl("txtResp" + i);
                N_H4_L_URDL_2_1_Bl.Texto = "" + miTextBox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));

                miTextBox = (TextBox)_Panel.FindControl("txtObj" + i);
                N_H4_C_URDL_4_1_Bl.Texto = "" + miTextBox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));
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

            B_H4_C_URDL_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_5_1_Az.Texto = "TIPO DE DOCUMENTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "RESPONSABLE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "REVISADO POR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "APROBADO POR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            for (int i = 0; i < 40; i++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = "" + (i + 1);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = tipoDoc[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_2_1_Bl.Texto = Responsable[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                B_H4_C_URDL_2_1_Bl.Texto = Revisado[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                B_H4_C_URDL_2_1_Bl.Texto = Aprobado[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
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
            List<Model_CEPP> epp_datos = Mgr_Epp.Get_Epp(Convert.ToInt32(ddlPuesto.SelectedValue));
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


            List<Model_CEPP> tipo_epp_datos = Mgr_Epp.Get_TipoEpp(Convert.ToInt32(ddlPuesto.SelectedValue));
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

        public static void PrintAnalisisVulnerabilidad(String[] valores, String[] valoresText, Page _page, TextBox _txtArea, TextBox _txtObjetivo, TextBox _txtAlcance, String total, String conclusiones, String fortalezas, String debilidades)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                Convert.ToInt32(valores[0]), "AnalisisVulnerabilidad_",
                "ANALISIS DE VULNERABILIDAD",
                _page);

            B_H4_C_URDL_12_1_Az.Texto = "Área de Evaluación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Az.Texto = _txtArea.Text;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Az.Texto = "Objetivo y alcance de la Evaluación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Az.Texto = _txtObjetivo.Text;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Az.Texto = "Álcance";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Az.Texto = _txtAlcance.Text;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Az.Texto = "Resultados de la Evaluación Interna";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_UDL_1_1_Az.Texto = "Nº";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_UDL_1_1_Az));

            B_H4_C_URD_11_1_Az.Texto = "Aspecto a Evaluar";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URD_11_1_Az));

            #region contenido

            #region fila 1 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "1";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Ruta de Evacuación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 2
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Existe una ruta exclusiva de evacuación, iluminada, señalizada con pasa manos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 3
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Presenta deficiencia en alguno de los aspectos anteriores.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 4
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No hay ruta exclusiva de evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 5 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "2";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Los visitantes del edificio conocen las rutas de evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 6
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Fácil y rápidamente gracias a la señalización visible desde todos los ángulos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 7
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Difícilmente por la poca señalización u orientación al respecto.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 8
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No las reconocerían fácilmente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 9 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "3";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Los puntos de reunion en una evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 10
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Se han establecido claramente y los conocen todos los ocupantes del edificio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 11
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Existen varios sitios posibles, pero ninguno se ha delimitado con claridad y nadie sabría hacia donde evacuar exactamente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 12
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existen puntos óptimos donde evacuar.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 13 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "4";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Los puntos de reunion en una evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 13
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Son amplios y seguros.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 14
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Son amplios pero con algunos riesgos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 15
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Son realmente pequeños para el número de personas a evacuar y realmente peligrosos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 16 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "5";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "La señalización para evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 17
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Se visualiza e identifica plenamente en todas las áreas del edificio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 18
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Esta muy oculta y apenas se observa en algunos sitios.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 19
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existen flechas o croquis de evacuación en ninguna parte visible.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 20 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "6";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Las rutas de evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 21
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Antideslizantes y seguras en todo recorrido.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 22
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Con obstáculos y tramos resbalosos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 23
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Altamente resbalosos, utilizados como bodegas o intransitables en algunos tramos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 24 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "7";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Las ruta principal de evacuación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 25
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Tiene ruta alterna optima y conocida.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 26
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Tiene una ruta alterna pero deficiente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 27
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No posee ninguna ruta alterna o no se conoce.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 28 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "8";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "La señal de alarma.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 29
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Se encuentra o se ve claramente en todos los sitios.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[22];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 30
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Algunas veces no se escuchan ni se ven claramente. Los ocupante no la conocen.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[23];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[22];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 31
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Usualmente no se escucha ni se ve.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[24];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[23];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 32 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "9";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Sistema de detección.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 33
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "El edificio posee sistemas de detección de incendio, revisado el último trimestre en todas las áreas.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[25];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[24];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 34
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Solo existen algunos detectores sin revisión y no en todas las áreas.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[26];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[25];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 35
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existe ningún tipo de detector.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[27];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[26];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 36 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "10";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "El sistema de iluminación de emergencia.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 37
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Es óptimo de día y noche (siempre se ve claramente, aun de noche)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[28];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[27];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 38
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Es optimo solo en el día (En la noche no se ve con claridad).";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[29];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[28];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 39
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Deficiente día y noche.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[30];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[29];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 40 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "11";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "El sistema de iluminación de emergencia.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 41
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Es de encendido automático en caso de corte de energía.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[31];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[30];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 42
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Es de encendido manual en caso de corte de energía.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[32];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[31];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 43
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existe.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[33];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[32];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 44 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "12";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "El sistema contra incendio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 45
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Es funcional.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[34];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[33];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 46
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Funciona parcialmente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[35];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[34];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 47
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existe o no funciona.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[36];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[35];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 48 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "13";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Los extintores para incendio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 49
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Están ubicados en las áreas críticas y son funcionales.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[37];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[36];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 50
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Existen pero no en número suficiente.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[38];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[37];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 51
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existe o no funciona.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[39];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[38];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 52 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "14";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Divulgación del plan de emergencia a los empleados.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 53
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Se ha desarrollado mínimo una por semestre.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[40];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[39];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 54
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Esporádicamente se ha divulgado para algunas áreas.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[41];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[40];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 55
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No se ha divulgado.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[42];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[41];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 56 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "15";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Coordinador del plan de emergencia.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 57
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Existe y está capacitado.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[43];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[42];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 58
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Existe pero no está capacitado.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[44];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[43];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 59
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existe.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[45];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[44];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 60 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "16";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "La brigada de emergencia.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 61
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Existe y está capacitada.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[46];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[45];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 62
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Existe pero no está capacitada.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[47];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[46];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 63
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existe.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[48];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[47];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 64 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "17";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Se han realizado simulacros.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 65
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Un simulacro en el último año.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[49];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[48];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 66
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Un simulacro en los dos últimos años.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[50];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[49];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 67
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Ningún simulacro.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[51];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[50];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 68 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "18";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Entidades de socorro externas.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 69
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Conocen y participan activamente en el plan de emergencia de la empresa.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[52];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[51];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 70
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Están identificadas las entidades de socorro pero no conocen el plan de emergencia de la empresa.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[53];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[52];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 71
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No se tienen en cuenta.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[54];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[53];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 72 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "19";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Los ocupantes del edificio son.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 73
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Siempre los mismos con muy poco s visitantes.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[55];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[54];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 74
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Con un 10 a 20% de visitantes nuevos cada día.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[56];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[55];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 75
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "El 90% de los ocupantes son visitantes.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[57];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[56];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 76 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "20";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "En la entrada del edificio o en cada piso.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 77
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Existe y es visible un plano de evacuación en cada piso.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[58];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[57];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 78
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existe un plano de evacuación en cada piso, pero alguien daría información.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[59];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[58];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 79
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "No existe un plano de evacuación y nadie esta responsabilizado de dar información al respecto.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[60];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[59];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 80 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "21";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Las rutas de circulación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 81
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "En general las rutas de acceso y circulación de los trabajadores y visitantes son amplias y seguras.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[61];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[60];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 82
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "En algún punto de las rutas no se circula con facilidad por falta de espacio u obstáculos al paso.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[62];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[61];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 83
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "En general las rutas y áreas de circulación son congestionadas y de difícil uso.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[63];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[62];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 84 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "22";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Las puertas de salida del edificio.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 85
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Las puertas cumplen con las medidas mínimas reglamentarias y de uso de cerraduras de seguridad.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[64];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[63];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 86
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Solo algunas puertas permiten una salida rápida y poseen cerraduras de seguridad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[65];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[64];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 87
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Ninguna puerta es lo suficientemente amplia o brinda garantías para salida segura.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[66];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[65];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 88 Encabezado
            B_H4_C_URDL_1_1_Az.Texto = "23";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_7_1_Az.Texto = "Estructura y tipo de construcción.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "Opciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Puntaje";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            #endregion

            #region fila 89
            B_H4_C_URDL_1_1_Bl.Texto = "A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "La estructura del edificio se soporta por estructuras de concreto y no presenta deterioro en paredes, columnas, techos o aditamentos internos.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[67];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[66];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 90
            B_H4_C_URDL_1_1_Bl.Texto = "B";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "Presenta deterioro observables en paredes y techos que hagan pensar en daños estructurales.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[68];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[67];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #region fila 91
            B_H4_C_URDL_1_1_Bl.Texto = "C";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_7_1_Bl.Texto = "La estructura no posee cimentación ni soportes de concreto y presenta deterioros estructurales observables en progreso durante los últimos seis meses.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_7_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[69];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valoresText[68];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            #endregion

            #endregion

            B_H4_C_URDL_4_1_Az.Texto = "TOTAL ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_L_URDL_8_1_Bl.Texto = total.ToString();
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));

            B_H4_C_URDL_4_1_Az.Texto = "CONCLUSIONES ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_L_URDL_8_1_Bl.Texto = conclusiones.ToString();
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));

            B_H4_C_URDL_4_1_Az.Texto = "FORTALEZAS ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_L_URDL_8_1_Bl.Texto = fortalezas.ToString();
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));

            B_H4_C_URDL_4_1_Az.Texto = "DEBILIDADES ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_L_URDL_8_1_Bl.Texto = debilidades.ToString();
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInspeccionExtintores(String[] valores, String[] especificacion, String[] condiciones, String[] titulos, String[] color, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]), "InspeccionDeExtintores_", "INSPECCIÓN DE LOS EXTINTORES", _page);

            #region cuerpo
            B_H4_C_URL_4_1_Bl.Texto = "NOMBRE DEL INSPECTOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URL_4_1_Bl));

            B_H4_C_URL_4_1_Bl.Texto = "FIRMA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URL_4_1_Bl));

            B_H4_C_URL_4_1_Bl.Texto = "FECHA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URL_4_1_Bl));

            B_H4_C_RL_4_1_Bl.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RL_4_1_Bl));

            B_H4_C_RL_4_1_Bl.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RL_4_1_Bl));

            B_H4_C_RL_4_1_Bl.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RL_4_1_Bl));

            B_H4_C_RDL_4_1_Bl.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RDL_4_1_Bl));

            B_H4_C_RDL_4_1_Bl.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RDL_4_1_Bl));

            B_H4_C_RDL_4_1_Bl.Texto = DateTime.Today.Date.ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RDL_4_1_Bl));

            B_H4_C_URDL_6_1_Az.Texto = "CARATERÍSTICA A INSPECCIONAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

            B_H4_C_URDL_6_1_Az.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

            B_H4_C_URDL_6_4_Az.Texto = especificacion[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_4_Az));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = especificacion[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            for (int i = 0; i < titulos.Length; i++)
            {
                B_H4_L_URDL_6_1_Bl.Texto = titulos[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

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
            ListaInvestigacionAccidente = Mgr_Acc_Inc.Get_Investigacion_Accidente(Convert.ToInt32(valores[0]));

            foreach (var itemInvestigacionAccidente in ListaInvestigacionAccidente)
            {
                List<at_it_el_pa> ListaAccidente = new List<at_it_el_pa>();
                ListaAccidente = Mgr_Acc_Inc.Get_Accidente(Convert.ToInt32(itemInvestigacionAccidente.id_at_it_el_pa));

                foreach (var itemAccidente in ListaAccidente)
                {
                    int IdSucursal = Convert.ToInt32(itemAccidente.trabajador.puesto_trabajo.area.id_sucursal);
                    Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                        Convert.ToInt32(itemAccidente.trabajador.puesto_trabajo.area.id_sucursal),
                        "InvestigacionAccidente_",
                        "INVESTIGACION DE ACCIDENTE",
                        _page);
                    #region datos del evento
                    B_H4_C_URDL_12_1_Az.Texto = "DATOS DEL EVENTO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_C_URDL_4_1_Az.Texto = "Fecha: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Hora: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Día de la semana: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                    B_H4_C_URDL_4_1_Bl.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_evento).ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = Convert.ToDateTime(itemInvestigacionAccidente.hora_evento).ToString("HH:mm:ss tt");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.dia_semana;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                    B_H4_C_URDL_6_1_Az.Texto = "Lugar donde ocurrió:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Tipo de suceso:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

                    B_H4_L_URDL_6_1_Bl.Texto = itemAccidente.sitio;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.tipo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    #endregion

                    #region datos del accidentado
                    B_H4_C_URDL_12_1_Az.Texto = "DATOS DEL ACCIDENTADO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_C_URDL_6_1_Az.Texto = "Nombre completo:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Cédula de Ciudadanía:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemAccidente.trabajador.primer_nombre + " " + itemAccidente.trabajador.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemAccidente.trabajador.cedula;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_6_1_Az.Texto = "Mano dominante:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Antigüedad en el puesto de trabajo:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemAccidente.trabajador.mano_dominante;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.antiguedad.ToString();
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_6_1_Az.Texto = "Cargo:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Supervisor inmediato:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemAccidente.trabajador.perfil_cargo.cno.ocupacion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.supervisor;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_4_1_Az.Texto = "Fecha de ingreso: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Tiempo en el cargo: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Salario devengado: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                    B_H4_C_URDL_4_1_Bl.Texto = Convert.ToDateTime(itemAccidente.trabajador.fecha_ingreso).ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.tiempo_cargo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = itemAccidente.trabajador.salario.ToString();
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                    B_H4_C_URDL_12_1_Az.Texto = "Actividad que realizaba";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                    B_H4_C_URDL_12_1_Bl.Texto = itemInvestigacionAccidente.actividad_realizaba;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
                    #endregion

                    #region DATOS DE EVALUACIÓN DEL MÉDICO
                    B_H4_C_URDL_12_1_Az.Texto = "DATOS DE EVALUACIÓN DEL MÉDICO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_C_URDL_6_1_Az.Texto = "Naturaleza de la lesión:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Gravedad:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.naturaleza_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.gravedad_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_12_1_Az.Texto = "DESCRIPCIÓN DE LA LESIÓN";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                    B_H4_C_URDL_12_1_Bl.Texto = itemInvestigacionAccidente.descripcion_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                    B_H4_C_URDL_4_1_Az.Texto = "Reposo: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "N°. Días: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Fecha de reintegro: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                    B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.reposo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = Convert.ToString(itemInvestigacionAccidente.dias_reposo);
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_reintegro).ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    #endregion

                    B_H4_C_URDL_12_1_Az.Texto = "DESCRIPCIÓN DEL ACCIDENTE";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                    B_H4_C_URDL_12_1_Bl.Texto = itemAccidente.descripcion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                    B_H4_C_URDL_12_1_Az.Texto = "ADIESTRAMIENTO RECIBIDO POR EL TRABAJADOR";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                    B_H4_C_URDL_12_1_Bl.Texto = itemInvestigacionAccidente.adiestramiento;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                    #region COSTOS
                    B_H4_C_URDL_12_1_Az.Texto = "COSTOS";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_C_URDL_6_1_Az.Texto = "Transporte:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Reemplazo:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.costo_transporte;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.costo_reemplazo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_6_1_Az.Texto = "Atención médica:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Reposo médico:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.costo_atencion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.costo_reposo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_6_1_Az.Texto = "Tratamiento:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Daños materiales:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.costo_tratamiento;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.costo_materiales;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_6_1_Az.Texto = "Indemnización:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Producción diferida:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.costo_indemizacion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.costo_produccion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    #endregion

                    #region ANÁLISIS DEL ACCIDENTE
                    B_H4_C_URDL_12_1_Az.Texto = "ANÁLISIS DEL ACCIDENTE";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                    B_H4_C_URDL_12_1_Bl.Texto = itemInvestigacionAccidente.actividad;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                    B_H4_C_URDL_12_1_Az.Texto = "IDENTIFICACIÓN DE POSIBLES CAUSAS DEL ACCIDENTE:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.porque1;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta1;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.porque2;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta2;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.porque3;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta3;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.porque4;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta4;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.porque5;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta5;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_12_1_Az.Texto = "RECONOCER CAUSAS GENERADORAS DEL ACCIDENTE:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.que;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta_que;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.porque;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta_porque;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.quien;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta_quien;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.donde;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta_donde;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.cuando;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta_cuando;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.como;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta_como;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.cuanto;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.respuesta_cuanto;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_3_1_Az.Texto = "Tipo de Accidente: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                    B_H4_C_URDL_3_1_Az.Texto = "Tipo de lesión: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                    B_H4_C_URDL_3_1_Az.Texto = "Agente de lesión: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                    B_H4_C_URDL_3_1_Az.Texto = "Parte del cuerpo afectada: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

                    B_H4_C_URDL_3_1_Bl.Texto = itemInvestigacionAccidente.tipo_accidente;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = itemInvestigacionAccidente.tipo_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = itemInvestigacionAccidente.agente_lesion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = itemInvestigacionAccidente.parte_cuerpo;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                    B_H4_C_URDL_12_1_Az.Texto = "MEDIDAS A ADOPTAR: ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_C_URDL_4_1_Az.Texto = "Acción ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Responsable ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Fecha ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                    B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.medida1;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.responsable1;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida1).ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                    if (itemInvestigacionAccidente.medida2 != string.Empty)
                    {
                        B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.medida2;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                        B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.responsable2;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                        B_H4_C_URDL_4_1_Bl.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida2).ToString("yyyy-MM-dd");
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    }

                    if (itemInvestigacionAccidente.medida3 != string.Empty)
                    {
                        B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.medida3;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                        B_H4_C_URDL_4_1_Bl.Texto = itemInvestigacionAccidente.responsable3;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                        B_H4_C_URDL_4_1_Bl.Texto = Convert.ToDateTime(itemInvestigacionAccidente.fecha_medida3).ToString("yyyy-MM-dd");
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    }

                    B_H4_C_URDL_6_1_Az.Texto = "Nota:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = itemInvestigacionAccidente.nota;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    #endregion

                    #region FIRMA DE LOS INVOLUCRADOS
                    B_H4_C_URDL_12_1_Az.Texto = "FIRMA DE LOS INVOLUCRADOS";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                    B_H4_C_URDL_3_1_Az.Texto = "Persona";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                    B_H4_C_URDL_3_1_Az.Texto = "Nombre";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                    B_H4_C_URDL_3_1_Az.Texto = "Cédula";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                    B_H4_C_URDL_3_1_Az.Texto = "Firma";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

                    B_H4_C_URDL_3_2_Bl.Texto = "Accidentado:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                    B_H4_C_URDL_3_2_Bl.Texto = "Sup. Inmediato:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                    B_H4_C_URDL_3_2_Bl.Texto = "Responsable de la Investigación:";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_2_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_3_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    #endregion

                    #region SOPORTES
                    B_H4_C_URDL_12_1_Az.Texto = "SOPORTES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                    foreach (var itemSoporte in itemAccidente.soporte)
                    {
                        B_H4_C_URDL_12_1_Bl.Texto = itemSoporte.url;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
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
            ListAccidentes = Mgr_Acc_Inc.Get_Accidente(Convert.ToInt32(valores[0]));

            #region contenido
            foreach (var item in ListAccidentes)
            {
                int IdSucursal = item.trabajador.puesto_trabajo.area.id_sucursal;
                Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                    IdSucursal,
                    "ComunicadoAccidente_",
                    "",
                    _page);

                B_H4_C_URDL_4_1_Az.Texto = "Sucursal";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Fecha Accidente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Hora Accidente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Bl.Texto = item.trabajador.puesto_trabajo.area.sucursal.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = item.fecha_accidente.Value.ToString("yyyy-MM-dd");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = item.hora_accidente.Value.ToString("hh:mm:ss");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_4_1_Az.Texto = "Trabajador";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Área";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Puesto de Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Az.Texto = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                if (item.id_area == 0)
                {
                    B_H4_C_URDL_4_1_Az.Texto = "Ninguno";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                }
                else
                {
                    B_H4_C_URDL_4_1_Az.Texto = item.area.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                }
                if (item.id_puesto == 0)
                {
                    B_H4_C_URDL_4_1_Az.Texto = "Ninguno";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                }
                else
                {
                    B_H4_C_URDL_4_1_Az.Texto = item.puesto_trabajo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                }

                B_H4_C_URDL_6_1_Az.Texto = "Sitio donde se presentó el caso";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_C_URDL_6_1_Az.Texto = "Breve descripción de los hechos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_L_URDL_6_1_Bl.Texto = item.sitio;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = item.descripcion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CAUSAS INMEDIATAS - Condiciones Inseguras";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item.condiciones_inseguras;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CAUSAS INMEDIATAS - Actos Inseguros";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item.actos_inseguros;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CAUSAS BÁSICAS - Factores del Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item.factores_inseguros;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CAUSAS BÁSICAS - Factores Personales";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item.factores_personales;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "Magnitud del Evento";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                if (item.fecha_muerte != null)
                {
                    B_H4_C_URDL_6_1_Az.Texto = "Fecha de Muerte (Si la Hubiere)";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_L_URDL_6_1_Bl.Texto = item.fecha_muerte.Value.ToString("yyyy-MM-dd");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                }

                B_H4_C_URDL_4_1_Az.Texto = "Días de incapacidad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Días cargados.";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Días perdidos por ausencia del trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Bl.Texto = string.Empty + item.dias_incapacidad;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = string.Empty + item.dias_cargados;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = string.Empty + item.dias_perdidos_ausencia;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_4_1_Az.Texto = "Días perdidos por actividad restringida";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Sin Tiempo Perdido";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Tipo de enfermedad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Bl.Texto = string.Empty + item.dias_perdidos_restingido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                if (Convert.ToString(item.dias_no_perdidos) == "true")
                {
                    B_H4_C_URDL_4_1_Bl.Texto = "Si";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }
                else
                {
                    B_H4_C_URDL_4_1_Bl.Texto = "No";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }

                string tipoEnf = "";
                if (Convert.ToString(item.tipo_enfermedad) == "A") { tipoEnf = "Enfermedades en la piel"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "B") { tipoEnf = "Enfermedades respiratorias"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "C") { tipoEnf = "Envenenamiento"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "D") { tipoEnf = "Enfermedades debidas a agentes físicos"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "E") { tipoEnf = "Enfermedades producidas por traumas repetitivos"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "F") { tipoEnf = "Otras enfermedades osteomusculares"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "G") { tipoEnf = "Demás enfermedades profesionales"; }

                B_H4_C_URDL_4_1_Bl.Texto = tipoEnf;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "COMUNICADO A TRABAJADORES";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                List<trabajador> ListaTrabajador = new List<trabajador>();
                ListaTrabajador = Mgr_Trabajador.Get_Trabajador(0, 0, IdSucursal);

                foreach (var item1 in ListaTrabajador)
                {
                    B_H4_C_URDL_4_1_Az.Texto = "Nombre y Apellido";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Cedula";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Firma";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                    B_H4_C_URDL_4_1_Bl.Texto = item1.primer_nombre + " " + item1.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = item1.cedula;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
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
            B_H4_C_URDL_12_1_Az.Texto = "INSPECCIÓN PUESTO OPERATIVO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_6_1_Az.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            int TotalFavorable = 0, TotalDesfavorable = 0, posicion = 0, pos_enca = 0, i = 0;
            while (posicion < titulos.Length)
            {
                if (i == 5 || i == 18 || i == 44 || i == 55 || i == 63 || i == 77 || i == 84 ||
                    i == 88 || i == 96 || i == 100 || i == 108 || i == 121 || i == 128 || i == 138 ||
                    i == 146 || i == 151 || i == 159 || i == 164)
                {
                    B_H4_C_URDL_1_1_Az.Texto = valores[5];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                    B_H4_C_URDL_6_1_Az.Texto = encabezado[pos_enca];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

                    B_H4_C_URDL_1_1_Az.Texto = valores[7];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                    B_H4_C_URDL_1_1_Az.Texto = valores[8];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                    B_H4_C_URDL_3_1_Az.Texto = valores[9];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

                    pos_enca++;
                }
                else
                {
                    B_H4_C_URDL_1_1_Bl.Texto = "" + (posicion + 1);
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_L_URDL_6_1_Bl.Texto = titulos[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    if (valoressi[posicion].Equals("X")) TotalDesfavorable++;
                    B_H4_C_URDL_1_1_Bl.Texto = valoressi[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    if (valoresno[posicion].Equals("X")) TotalFavorable++;
                    B_H4_C_URDL_1_1_Bl.Texto = valoresno[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_C_URDL_3_1_Bl.Texto = textos[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                    posicion++;
                }
                i++;
            }
            B_H4_L_URDL_12_1_Bl.Texto = "Observaciones Generales: " + valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "Total de Condiciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "FAVORABLE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "DESFAVORABLE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "Observaciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "Sumatoria total de respuestas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "" + TotalFavorable;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "" + TotalDesfavorable;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            int porcentaje = (TotalDesfavorable * 100) / (TotalFavorable + TotalDesfavorable);
            B_H4_C_URDL_3_1_Bl.Texto = "El " + porcentaje + " %, indican condiciones de trabajo que pueden estar asociadas a alto riesgo de lesión o enfermedad.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

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
            B_H4_C_URDL_12_1_Az.Texto = "HOJA DE INSPECCIONES DE LOS EQUIPOS DE PROTECCION PERSONAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Nombre del Inspector";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Firma";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Fecha";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            N_H4_C_URDL_4_1_Bl.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

            N_H4_C_URDL_4_1_Bl.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

            N_H4_C_URDL_4_1_Bl.Texto = DateTime.Today.Date.ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

            B_H4_L_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));

            B_H4_C_URDL_4_2_Az.Texto = "Caracteristica a Inspeccionar";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_2_Az));

            B_H4_C_URDL_4_2_Az.Texto = "Sector/Actividad/Material de Trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_2_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Existencia";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Estado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_1_1_Bl.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = "Apto";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = "No Apto";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            List<Model_CEPP> epp_datos = Mgr_Epp.Get_Epp(Convert.ToInt32(valores[2]));
            Model_Celda miCelda161 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, epp_datos.Count, "", "EQUIPO DE PROTECCIÓN PERSONAL E.P.P");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda161));
            int i = 0;
            String valor = string.Empty;
            RadioButton _radio;
            foreach (var dato in epp_datos)
            {
                N_H4_C_URDL_4_1_Bl.Texto = dato.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));
                _radio = (RadioButton)_panel.FindControl("eppSi" + i);
                if (_radio.Checked) { valor = "EXISTE"; } else { valor = "-"; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("eppNo" + i);
                if (_radio.Checked) { valor = "NO EXISTE"; } else { valor = "-"; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("eppApto" + i);
                if (_radio.Checked) { valor = "APTO"; } else { valor = "-"; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("eppNoApto" + i);
                if (_radio.Checked) { valor = "NO APTO"; } else { valor = "-"; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                i++;
            }
            List<Model_CEPP> epp_tipo_datos = Mgr_Epp.Get_TipoEpp(Convert.ToInt32(Convert.ToInt32(valores[2])));
            miCelda161 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, epp_tipo_datos.Count, "", "SEÑALIZACIÓN O AVISOS DE LOS E.P.P");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda161));
            i = 0;
            valor = string.Empty;
            foreach (var dato in epp_tipo_datos)
            {
                N_H4_C_URDL_4_1_Bl.Texto = dato.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));
                _radio = (RadioButton)_panel.FindControl("tpoSi" + i);
                if (_radio.Checked) { valor = "EXISTE"; } else { valor = "-"; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("tpoNo" + i);
                if (_radio.Checked) { valor = "NO EXISTE"; } else { valor = "-"; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("tpoApto" + i);
                if (_radio.Checked) { valor = "APTO"; } else { valor = "-"; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("tpoNoApto" + i);
                if (_radio.Checked) { valor = "NO APTO"; } else { valor = "-"; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                i++;
            }
            TableRow row = new TableRow();
            row = (TableHeaderRow)_panel.FindControl("EPPFaltante");
            i = 0;
            if (row.Visible)
            {
                epp_datos = Mgr_Epp.Get_Epp(Convert.ToInt32(valores[2]));
                miCelda161 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, Convert.ToInt32(valores[3]), "", "EQUIPO DE PROTECCIÓN PERSONAL FALTANTES");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda161));
                foreach (var dato in epp_datos)
                {
                    _radio = (RadioButton)_panel.FindControl("eppNo" + i);
                    if (_radio.Checked)
                    {
                        B_H4_L_URDL_8_1_Bl.Texto = dato.nombre;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
                    }
                    i++;
                }
            }

            row = new TableRow();
            row = (TableHeaderRow)_panel.FindControl("SenalFaltante");
            i = 0;
            if (row.Visible)
            {
                epp_datos = Mgr_Epp.Get_Epp(Convert.ToInt32(valores[2]));
                miCelda161 = new Model_Celda(0, "H4", "C", "1|1|1|1", 4, Convert.ToInt32(valores[4]), "", "SEÑALIZACIÓN DE EPP FALTANTE");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, miCelda161));
                foreach (var dato in epp_datos)
                {
                    _radio = (RadioButton)_panel.FindControl("tpoNo" + i);
                    if (_radio.Checked)
                    {
                        B_H4_L_URDL_8_1_Bl.Texto = dato.nombre;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
                    }
                    i++;
                }
            }

            B_H4_L_URDL_12_1_Bl.Texto = "Observaciones Generales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));

            TextBox _textbox = (TextBox)_panel.FindControl("txtObsGenerales");
            B_H4_L_URDL_12_1_Bl.Texto = _textbox.Text;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));

            #endregion
            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEvaluacionPuestos(String[] valores, Page _page)
        {

            #region contenido
            List<evaluacion_riesgo> Lista_EvaRiesgo = new List<evaluacion_riesgo>();
            Lista_EvaRiesgo = Mgr_Riesgos.Get_EvaluacionRiesgo(Convert.ToInt32(valores[1]));

            foreach (var itemEvaRiesgo in Lista_EvaRiesgo)
            {
                Tuple<Document, PdfPTable> DocumentoPDF =
                                         ManageFiles.PdfParte1(itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.id_sucursal,
                                         "EvaluacionRiesgos_", " ", _page);

                int id_puesto = Convert.ToInt32(itemEvaRiesgo.identificacion_puesto.id_puesto);

                B_H4_C_URDL_3_1_Az.Texto = "Puesto de Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_3_1_Az.Texto = "Área";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_6_1_Az.Texto = "Descripción del Puesto";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = itemEvaRiesgo.identificacion_puesto.puesto_trabajo.descripcion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "IDENTIFICACIÓN DEL PELIGRO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                foreach (var itemFactor in itemEvaRiesgo.identificacion_puesto.identificacion_peligro.factor_identificacion)
                {
                    B_H4_C_URDL_6_1_Az.Texto = "Tipo de Riesgo";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Factor de Riesgo";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

                    B_H4_L_URDL_6_1_Bl.Texto = itemFactor.factor_riesgo.tipo_riesgo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemFactor.factor_riesgo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    B_H4_C_URDL_6_1_Az.Texto = "Posibles Consecuencias";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                    B_H4_C_URDL_6_1_Az.Texto = "Tiempo de Exposición";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

                    B_H4_L_URDL_6_1_Bl.Texto = itemFactor.consecuencias;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                    B_H4_L_URDL_6_1_Bl.Texto = itemFactor.tiempo_exposicion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                }

                B_H4_C_URDL_12_1_Az.Texto = "EVALUACIÓN DEL RIESGO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                B_H4_C_URDL_4_1_Az.Texto = "Medidas en la Fuente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Medidas en el Medio";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Medidas en el Individuo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Bl.Texto = itemEvaRiesgo.control_fuente;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = itemEvaRiesgo.control_medio;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = itemEvaRiesgo.control_individuo;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_6_1_Az.Texto = "Responsable del SGSST";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_C_URDL_6_1_Az.Texto = "Fecha de Evaluación";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

                B_H4_L_URDL_6_1_Bl.Texto = itemEvaRiesgo.nombre_responsable;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = Convert.ToDateTime(itemEvaRiesgo.fecha_evaluacion).ToString("yyyy-MM-dd");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_4_1_Az.Texto = "Nivel de Deficiencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H3_C_N_8_1_Az.Texto = "Interpretación del Nivel de Deficiencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_8_1_Az));

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
                B_H4_C_URDL_4_1_Bl.Texto = nivel;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_L_URDL_8_1_Bl.Texto = interpretacion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
                #endregion

                #region nivel exposicion
                B_H4_C_URDL_4_1_Az.Texto = "Nivel de Exposición";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H3_C_N_8_1_Az.Texto = "Interpretacion del Nivel de Exposición";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_8_1_Az));
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
                B_H4_C_URDL_4_1_Bl.Texto = nivel;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_L_URDL_8_1_Bl.Texto = interpretacion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
                #endregion

                B_H4_C_URDL_3_1_Az.Texto = "Nivel de Probabilidad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_9_1_Az.Texto = "Interpretacion del Nivel de Probabilidad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_9_1_Az));

                int probabilidad = Convert.ToInt32(itemEvaRiesgo.nivel_probabilidad);

                if (probabilidad >= 24 && probabilidad <= 40) { interpretacion = "Situación deficiente con exposición continua.Normalmente la materialización del riesgo ocurre con frecuencia"; }
                else if (probabilidad >= 10 && probabilidad <= 20) { interpretacion = "Situación deficiente con exposición frecuente u ocasional, o bien situación muy deficiente con exposición ocasional o esporádica.La materialización del riesgo es posible que suceda varias veces durante la vida laboral "; }
                else if (probabilidad >= 6 && probabilidad <= 8) { interpretacion = "Situación deficiente con exposición esporádica, o bien situación mejorable con exposición continuada o frecuente. Es posible que suceda el daño alguna vez."; }
                else if (probabilidad >= 2 && probabilidad <= 4) { interpretacion = "Situación mejorable con exposición ocasional o esporádica, o situación sin anomalía destacable con cualquier nivel de exposición.No es esperable que se materialice el riesgo, aunque puede ser concebible."; }
                else if (probabilidad == 0) { interpretacion = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado."; }

                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.nivel_probabilidad;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URD_9_1_Bl.Texto = interpretacion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URD_9_1_Bl));

                #region nivel consecuencia
                B_H4_C_URDL_3_1_Az.Texto = "Nivel de Consecuencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_9_1_Az.Texto = "Interpretación del Nivel de Consecuencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_9_1_Az));
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
                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.nivel_consecuencia;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URD_9_1_Bl.Texto = interpretacion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URD_9_1_Bl));
                #endregion

                #region nivel riesgo
                B_H4_C_URDL_3_1_Az.Texto = "Nivel de Riesgo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_9_1_Az.Texto = "Interpretacion del Nivel de Riesgo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_9_1_Az));
                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.nivel_riesgo;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URD_9_1_Bl.Texto = itemEvaRiesgo.interpretacion_nivel_riesgo;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URD_9_1_Bl));
                #endregion

                B_H4_C_URDL_12_1_Az.Texto = "Aceptabilidad de Riesgo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = itemEvaRiesgo.aceptabilidad_riesgo;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CRITERIOS PARA ESTABLECER CONTROLES";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                B_H4_C_URDL_3_1_Az.Texto = "Planta";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_3_1_Az.Texto = "Contratista";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_3_1_Az.Texto = "Visitantes";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_3_1_Az.Texto = "Total";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.planta.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.contratistas.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.visitantes.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URDL_3_1_Bl.Texto = itemEvaRiesgo.total.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                B_H4_C_URDL_6_1_Az.Texto = "Peor Consecuencia";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_C_URDL_6_1_Az.Texto = "Existencia Requisito Legal";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_L_URDL_6_1_Bl.Texto = itemEvaRiesgo.peor_consecuencia.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = "" + itemEvaRiesgo.existencia_requisito_legal;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "MEDIDAS DE INTERVENCIÓN";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                B_H4_C_URDL_6_1_Az.Texto = "Eliminación";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_C_URDL_6_1_Az.Texto = "Sustitución";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_L_URDL_6_1_Bl.Texto = itemEvaRiesgo.eliminación.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = itemEvaRiesgo.sustitución.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_6_1_Az.Texto = "Controles de Ingeniería";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_C_URDL_6_1_Az.Texto = "Controles Administrativos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_L_URDL_6_1_Bl.Texto = itemEvaRiesgo.controles_ingenieria.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = itemEvaRiesgo.controles_administrativos.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_6_1_Az.Texto = "Fecha de Ejecucion";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_L_URDL_6_1_Bl.Texto = Convert.ToDateTime(itemEvaRiesgo.fecha_ejecucion).ToString("yyyy-MM-dd");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "EQUIPOS DE PROTECCIÓN PERSONAL DEL PUESTO DE TRABAJO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                int contadorEpp = 1;
                foreach (var itemEpp in itemEvaRiesgo.identificacion_puesto.puesto_trabajo.puesto_trabajo_epp)
                {
                    B_H4_C_URDL_4_1_Bl.Texto = "Epp N° " + contadorEpp;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = "Nombre: " + itemEpp.epp.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = "Tipo de Epp: " + itemEpp.epp.tipo_epp.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
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

            B_H4_L_URDL_6_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_C_URDL_4_2_Az.Texto = "EQUIPO DE PROTECCION PERSONAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_2_Az));

            B_H4_C_URDL_2_1_Az.Texto = "USO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "ESTADO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_4_2_Az.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_2_Az));

            B_H4_C_URDL_1_1_Az.Texto = "SI";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "APTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "NO APTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            int intContInspecciones = Convert.ToInt32(valores[4]);
            Label _label;
            RadioButton _radio;
            TextBox _textbox;
            for (int i = 0; i < intContInspecciones; i++)
            {
                _label = (Label)_panel.FindControl("lblEpp" + i);
                N_H4_C_URDL_4_1_Bl.Texto = _label.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));
                _radio = (RadioButton)_panel.FindControl("chkUsoSi" + i);
                if (_radio.Checked) { valor = "X"; } else { valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("chkUsoNo" + i);
                if (_radio.Checked) { valor = "X"; } else { valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("chkEstSi" + i);
                if (_radio.Checked) { valor = "X"; } else { valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _radio = (RadioButton)_panel.FindControl("chkEstNo" + i);
                if (_radio.Checked) { valor = "X"; } else { valor = string.Empty; }
                B_H4_C_URDL_1_1_Bl.Texto = valor;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)_panel.FindControl("txtObs" + i);
                N_H4_C_URDL_4_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInspeccionMediosEscape(String[] valores, String[] areaUbicacion, String[] edoConservacion, String[] fteIluminacion, String[] marcaLampara, String[] lucesLampara, String[] cajtaLampara, String[] senas, String[] exisSena, String[] obsEst, String[] senaSena, String[] txtPas, String[] obsEstPasi, String[] obsAccPasi, String[] obsAusPasi, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                      "InspeccionMediosEscape_", "INSPECCIÓN DE LOS MEDIOS DE ESCAPE", _page);

            #region contenido

            #region encabezado
            B_H4_C_URDL_12_1_Az.Texto = "INSPECCIÓN DE LOS MEDIOS DE ESCAPE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            N_H4_C_URDL_4_1_Bl.Texto = "Nombre del inspector";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

            N_H4_C_URDL_4_1_Bl.Texto = "Firma";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

            N_H4_C_URDL_4_1_Bl.Texto = "Fecha";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

            N_H4_C_URDL_4_1_Bl.Texto = "\n";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

            N_H4_C_URDL_4_1_Bl.Texto = "\n";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

            N_H4_C_URDL_4_1_Bl.Texto = "\n";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));
            #endregion

            #region AreaUbicacion
            B_H4_C_URDL_2_1_Az.Texto = areaUbicacion[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = areaUbicacion[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = areaUbicacion[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = areaUbicacion[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = areaUbicacion[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = areaUbicacion[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region cabecera
            B_H4_C_URDL_2_1_Az.Texto = "CARATERÍSTICA A INSPECCIONAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_L_URDL_10_1_Az.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_10_1_Az));
            #endregion

            #region Estado de conservacion
            B_H4_C_URDL_2_1_Az.Texto = edoConservacion[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = edoConservacion[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = edoConservacion[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = edoConservacion[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = edoConservacion[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = edoConservacion[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region Fuente de iluminacion
            B_H4_C_URDL_2_1_Az.Texto = fteIluminacion[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = fteIluminacion[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = fteIluminacion[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = fteIluminacion[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = fteIluminacion[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = fteIluminacion[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region Marcacion
            B_H4_C_URDL_2_1_Az.Texto = marcaLampara[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = marcaLampara[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = marcaLampara[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = marcaLampara[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = marcaLampara[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = marcaLampara[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region Luces de operacion
            B_H4_C_URDL_2_1_Az.Texto = lucesLampara[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = lucesLampara[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = lucesLampara[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = lucesLampara[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = lucesLampara[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = lucesLampara[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region Cajetin
            B_H4_C_URDL_2_1_Az.Texto = cajtaLampara[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = cajtaLampara[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = cajtaLampara[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = cajtaLampara[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = cajtaLampara[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = cajtaLampara[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region ÁREA DE UBICACIÓN
            B_H4_C_URDL_12_1_Az.Texto = "SEÑALIZACIÓN DE SEGURIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = senas[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = senas[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = senas[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = senas[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = senas[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = senas[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region cabecera
            B_H4_C_URDL_2_1_Az.Texto = "CARATERÍSTICA A INSPECCIONAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_L_URDL_10_1_Az.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_10_1_Az));
            #endregion

            #region Existencia
            B_H4_C_URDL_2_1_Az.Texto = exisSena[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = exisSena[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = exisSena[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = exisSena[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = exisSena[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = exisSena[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region Estado de conservacion
            B_H4_C_URDL_2_1_Az.Texto = obsEst[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = obsEst[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsEst[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsEst[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsEst[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsEst[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region Senal
            B_H4_C_URDL_2_1_Az.Texto = senaSena[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = senaSena[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = senaSena[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = senaSena[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = senaSena[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = senaSena[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region ÁREA DE UBICACIÓN
            B_H4_C_URDL_12_1_Az.Texto = "PASILLOS Y ESCALERAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = txtPas[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = txtPas[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = txtPas[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = txtPas[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = txtPas[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = txtPas[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region cabecera
            B_H4_C_URDL_2_1_Az.Texto = "CARATERÍSTICA A INSPECCIONAR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_L_URDL_10_1_Az.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_10_1_Az));
            #endregion

            #region Estado de conservacion
            B_H4_C_URDL_2_1_Az.Texto = obsEstPasi[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = obsEstPasi[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsEstPasi[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsEstPasi[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsEstPasi[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsEstPasi[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region Accesibilidad
            B_H4_C_URDL_2_1_Az.Texto = obsAccPasi[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = obsAccPasi[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsAccPasi[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsAccPasi[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsAccPasi[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsAccPasi[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #region Ausencia de Obstaculos
            B_H4_C_URDL_2_1_Az.Texto = obsAusPasi[0];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            N_H4_L_URDL_2_1_Bl.Texto = obsAusPasi[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsAusPasi[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsAusPasi[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsAusPasi[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            N_H4_L_URDL_2_1_Bl.Texto = obsAusPasi[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            #endregion

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInspeccionPuestosAdmin(String[] valores, String[] titulos, String[] valoressi, String[] valoresno, String[] textos, String[] encabezado, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InspeccionPuestoTrabajoAdmin_", "INSPECCIÓN PUESTO DE TRABAJO ADMINISTRATIVO", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "INSPECCIÓN PUESTO DE TRABAJO ADMINISTRATIVO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_3_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            int TotalSi = 0, TotalNo = 0, posicion = 0, pos_enca = 0, i = 0, nropregunta = 1;

            while (posicion < titulos.Length)
            {
                if (i == 0 || i == 9 || i == 24 || i == 30 || i == 35 || i == 43 || i == 50 || i == 55 || i == 60 || i == 64
                    || i == 69 || i == 74 || i == 80 || i == 83 || i == 87 || i == 93 || i == 96 || i == 106 || i == 113
                    || i == 121 || i == 126 || i == 134 || i == 139)
                {
                    B_H4_C_URDL_1_1_Az.Texto = valores[5];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                    B_H4_C_URDL_6_1_Az.Texto = encabezado[pos_enca];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

                    B_H4_C_URDL_1_1_Az.Texto = valores[7];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                    B_H4_C_URDL_1_1_Az.Texto = valores[8];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

                    B_H4_C_URDL_3_1_Az.Texto = valores[9];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

                    pos_enca++;
                    nropregunta = 1;
                }
                else
                {
                    B_H4_C_URDL_1_1_Bl.Texto = "" + nropregunta;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_L_URDL_6_1_Bl.Texto = titulos[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                    if (valoressi[posicion].Equals("X")) TotalSi++;
                    B_H4_C_URDL_1_1_Bl.Texto = valoressi[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    if (valoresno[posicion].Equals("X")) TotalNo++;
                    B_H4_C_URDL_1_1_Bl.Texto = valoresno[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_C_URDL_3_1_Bl.Texto = textos[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                    posicion++;
                    nropregunta++;
                }
                i++;
            }
            B_H4_L_URDL_12_1_Bl.Texto = "Observaciones Generales: " + valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "Total de Condiciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "SI";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "Observaciones";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "Sumatoria total de respuestas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "" + TotalSi;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "" + TotalNo;
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_3_1_Bl.Texto = "Las respuestas Negativas (NO) , indican condiciones de trabajo que pueden estar asociadas a alto riesgo de lesión o enfermedad.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

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

            B_H4_C_URDL_3_1_Az.Texto = "Insumo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Cantidad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Unidad";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Existencia";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Diferencia";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Motivo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "Reemplazado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            for (int i = 1; i <= cantidad; i++)
            {
                Label _label = (Label)_panel.FindControl(valores[3] + i);
                B_H4_C_URDL_3_1_Bl.Texto = _label.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                _label = (Label)_panel.FindControl(valores[4] + i);
                B_H4_C_URDL_1_1_Bl.Texto = _label.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _label = (Label)_panel.FindControl(valores[5] + i);
                N_H4_L_URDL_2_1_Bl.Texto = _label.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));

                TextBox _textbox = (TextBox)_panel.FindControl(valores[6] + i);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)_panel.FindControl(valores[7] + i);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                _textbox = (TextBox)_panel.FindControl(valores[8] + i);
                N_H4_L_URDL_2_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));

                DropDownList _drop = (DropDownList)_panel.FindControl(valores[9] + i);
                N_H4_L_URDL_2_1_Bl.Texto = _drop.SelectedValue;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
            }
            B_H4_C_URDL_12_1_Az.Texto = "OBSERVACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_L_URDL_12_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintIndicadores(String[] valores, String[] definicion, String[] interpretacion, String[] metodoCalculo, String[] fuenteCalculo, String[] responsable, String[] frecMedicion, String[] unidad, String[] meta, String[] resultados, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "IndicadorEmpresa_", "INDICADORES DE LA EMPRESA", _page);

            #region contenido
            int posicion = 0;
            for (int i = 0; i < 41; i++)
            {
                if (i == 0)
                {
                    B_H4_C_URDL_12_1_Az.Texto = "INDICADOR DE ESTRUCTURA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                }
                if (i == 19)
                {
                    B_H4_C_URDL_12_1_Az.Texto = "INDICADOR DE PROCESO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                }
                if (i == 32)
                {
                    B_H4_C_URDL_12_1_Az.Texto = "INDICADOR DE RESULTADO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                }
                else if (i == 1 || i == 20 || i == 33)
                {
                    B_H4_C_URDL_2_1_Az.Texto = "DEFINICIÓN";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                    B_H4_C_URDL_2_1_Az.Texto = "INTERPRETACIÒN";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                    B_H4_C_URDL_2_1_Az.Texto = "MÉTODO DE CÁLCULO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                    B_H4_C_URDL_2_1_Az.Texto = "FUENTE DEL CÁLCULO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

                    B_H4_C_URDL_1_1_Az.Texto = "RESPONSABLE";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "FRECUENCIA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "UNIDAD";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "META";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                }
                else
                {
                    N_H4_L_URDL_2_1_Bl.Texto = definicion[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
                    N_H4_L_URDL_2_1_Bl.Texto = interpretacion[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
                    N_H4_L_URDL_2_1_Bl.Texto = metodoCalculo[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
                    N_H4_L_URDL_2_1_Bl.Texto = fuenteCalculo[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));

                    B_H4_C_URDL_1_1_Bl.Texto = responsable[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = frecMedicion[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = unidad[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = meta[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_C_URDL_4_1_Am.Texto = "RESULTADO: " + resultados[posicion];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Am));
                    B_H4_L_URDL_8_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));

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
                    B_H4_L_URDL_5_2_Az.Texto = titulos[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_5_2_Az));

                    B_H4_C_URDL_4_2_Az.Texto = "FACTOR DE IMPACTO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_2_Az));

                    B_H4_L_URDL_3_1_Az.Texto = "SENSIBILIDAD";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_3_1_Az));

                    B_H4_C_URDL_1_1_Ro.Texto = "ALTA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ro));

                    B_H4_C_URD_1_1_Am.Texto = "MEDIA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URD_1_1_Am));

                    B_H4_C_URDL_1_1_Ve.Texto = "BAJA";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ve));
                }
                else
                {
                    DropDownList miDropdownList = (DropDownList)_panel.FindControl("Dropdownlist" + posDdl);
                    posDdl++;
                    HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;
                    HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;
                    HtmlInputRadioButton miradio3 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;

                    B_H4_C_URDL_5_1_Bl.Texto = titulos[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

                    N_H4_C_URDL_4_1_Bl.Texto = miDropdownList.SelectedValue;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_C_URDL_4_1_Bl));

                    B_H4_C_URDL_1_1_Bl.Texto = miradio1.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_C_URDL_1_1_Bl.Texto = miradio2.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_C_URDL_1_1_Bl.Texto = miradio3.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
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
                    B_H4_L_URDL_10_2_Bl.Texto = titulos[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_10_2_Bl));

                    B_H4_C_URDL_2_1_Az.Texto = "¿EXISTE?";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

                    B_H4_C_URDL_1_1_Ve.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ve));

                    B_H4_C_URDL_1_1_Ro.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Ro));
                }
                else
                {
                    HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;
                    HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)_panel.FindControl("radio" + posicion); posicion++;

                    B_H4_L_URDL_10_1_Bl.Texto = titulos[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_10_1_Bl));

                    B_H4_C_URDL_1_1_Bl.Texto = miradio1.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_C_URDL_1_1_Bl.Texto = miradio2.Checked ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
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

            B_H4_C_URDL_12_1_Az.Texto = "ESTRUCTURA INTERNA DE LA BRIGADA DE EMERGENCIAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            for (int i = 0; i < cadenas.Length; i++)
            {
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
            }


            B_H4_C_N_12_1_Az.Texto = "FUNCIONES DE LOS BRIGADISTAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_H4_C_N_12_1_Az.Texto = "ANTES,DURANTE Y DESPUES DE LA EMERGENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            cadenas = valores[2].Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
            }
            B_H4_C_N_12_1_Az.Texto = "BRIGADA DE COMUNICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_H4_C_N_12_1_Az.Texto = "FUNCIONES, ACTIVIDADES Y PROCEDIMIENTO DE COMUNICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            cadenas = valores[3].Split(delimitadores, StringSplitOptions.None);
            for (int i = 0; i < cadenas.Length; i++)
            {
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
            }

            B_H4_C_N_12_1_Az.Texto = "DIRECTORIO DE EMERGENCIAS INTERNO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_H4_C_N_12_1_Az.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_H4_C_N_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_1_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "NOMBRE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_N_2_1_Az.Texto = "CARGO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_2_1_Az));
            B_H4_C_N_2_1_Az.Texto = "TELEFONO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_2_1_Az));
            B_H4_L_N_3_1_Az.Texto = "LLAMAR A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_3_1_Az));

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
                        B_H4_C_URDL_1_1_Az.Texto = string.Empty + contador2;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                        B_H4_C_URDL_4_1_Az.Texto = miDDL.SelectedValue;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    }
                    if (contador == 2)
                    {
                        B_H4_C_URDL_2_1_Az.Texto = mitxt.Text;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                    }
                    if (contador == 3)
                    {
                        B_H4_C_URDL_2_1_Az.Texto = mitxt.Text;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                    }
                    if (contador == 4)
                    {
                        B_H4_C_URDL_3_1_Az.Texto = miDDL.SelectedValue;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                        contador2++;
                        contador = 0;
                    }
                }
            }
            B_H4_C_N_12_1_Az.Texto = "BRIGADA DE PRIMEROS AUXILIOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_H4_C_N_12_1_Az.Texto = "FUNCIONES Y ACTIVIDADES DE LA BRIGADA DE PRIMEROS AUXILIOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_N_N_N_12_1_Bl.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_H4_C_N_12_1_Az.Texto = "BRIGADA CONTRA INCENDIOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_H4_C_N_12_1_Az.Texto = "FUNCIONES Y ACTIVIDADES DE LA BRIGADA DE EVACUACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_N_N_N_12_1_Bl.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_H4_C_N_12_1_Az.Texto = "BRIGADA DE EVACUACION";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_H4_C_N_12_1_Az.Texto = "FUNCIONES Y ACTIVIDADES DE LA BRIGADA DE EVACUACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_N_12_1_Az));

            B_N_N_N_12_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
            ListaPlanTrabajo = Mgr_PlanTrabajo.Get_Plan_Trabajo(Convert.ToInt32(valores[0]), Convert.ToInt32(valores[1]));
            int contActividad = 0;

            B_H4_C_URDL_12_1_Az.Texto = "ACTIVIDADES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "Descripción";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "Objetivos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Fecha";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "Recursos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Responsable";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            foreach (var item in ListaPlanTrabajo)
            {
                DateTime fechaini = FirstDateOfWeekISO8601(Convert.ToInt32(valores[1]), Convert.ToInt32(item.semana_ini));
                DateTime fechafin = FirstDateOfWeekISO8601(Convert.ToInt32(valores[1]), Convert.ToInt32(item.semana_fin));
                contActividad++;
                B_H4_C_URDL_1_1_Bl.Texto = contActividad.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                B_H4_C_URDL_3_1_Bl.Texto = item.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URDL_3_1_Bl.Texto = item.objetivos;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                N_H4_L_URDL_2_1_Bl.Texto = "Del " + fechaini.ToString("dd/MM/yyy") + "Hasta el " + fechafin.AddDays(6).ToString("dd/MM/yyy");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
                B_H4_C_URDL_1_1_Bl.Texto = item.recursos_aprobados + " Pesos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                N_H4_L_URDL_2_1_Bl.Texto = item.usuario.trabajador.primer_nombre + " " + item.usuario.trabajador.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, N_H4_L_URDL_2_1_Bl));
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
            ListaPlanTrabajo = Mgr_PlanTrabajo.Get_Plan_Trabajo(Convert.ToInt32(valores[0]), Convert.ToInt32(valores[1]));
            int contActividad = 0;

            foreach (var item in ListaPlanTrabajo)
            {
                DateTime fechaini = FirstDateOfWeekISO8601(Convert.ToInt32(valores[1]), Convert.ToInt32(item.semana_ini));
                DateTime fechafin = FirstDateOfWeekISO8601(Convert.ToInt32(valores[1]), Convert.ToInt32(item.semana_fin));
                contActividad++;

                B_H4_C_URDL_12_1_Az.Texto = "ACTIVIDAD N° " + contActividad;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                B_H4_C_URDL_6_1_Az.Texto = "Descripción";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_C_URDL_6_1_Az.Texto = "Objetivos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_L_URDL_6_1_Bl.Texto = item.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = item.objetivos;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_3_1_Az.Texto = "Semana Inicial";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_3_1_Bl.Texto = "Semana N°: " + item.semana_ini;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URDL_3_1_Az.Texto = "Semana Final";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_3_1_Bl.Texto = "Semana N°: " + item.semana_fin;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                B_H4_C_URDL_3_1_Az.Texto = "Fecha Inicial";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_3_1_Bl.Texto = "Del " + fechaini.ToString("dd/MM/yyy");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URDL_3_1_Az.Texto = "Fecha Final";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
                B_H4_C_URDL_3_1_Bl.Texto = "Hasta el " + fechafin.AddDays(6).ToString("dd/MM/yyy");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                B_H4_C_URDL_2_1_Az.Texto = "Duración";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                B_H4_C_URDL_2_1_Bl.Texto = string.Empty + (item.semana_fin - item.semana_ini + 1) + " Semana(s)";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                B_H4_C_URDL_2_1_Az.Texto = "Recursos Aprobados";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                B_H4_C_URDL_2_1_Bl.Texto = item.recursos_aprobados + " Pesos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                B_H4_C_URDL_2_1_Az.Texto = "Responsable";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                B_H4_C_URDL_2_1_Bl.Texto = item.usuario.trabajador.primer_nombre + " " + item.usuario.trabajador.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                int contObligacion = 0;
                B_H4_C_URDL_2_1_Az.Texto = "OBLIGACION N°";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                B_H4_C_URDL_2_1_Az.Texto = "Fecha de Entrega";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                B_H4_C_URDL_2_1_Az.Texto = "Estatus";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                B_H4_C_URDL_2_1_Az.Texto = "Responsable";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Descripción";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                foreach (var item2 in item.obligacion)
                {
                    contObligacion++;

                    B_H4_C_URDL_2_1_Bl.Texto = contObligacion.ToString();
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                    B_H4_C_URDL_2_1_Bl.Texto = Convert.ToDateTime(item2.fecha_entrega).ToString("dd/MM/yyyy");
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                    B_H4_C_URDL_2_1_Bl.Texto = item2.estatus_obl;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                    B_H4_C_URDL_2_1_Bl.Texto = item2.usuario.trabajador.primer_nombre + " " + item2.usuario.trabajador.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = item2.descripcion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }
                B_H4_C_URDL_12_1_Gr.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Gr));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintRecursosEconomicos(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "RecursosEconomicos_", "RECURSOS ECONÓMICOS APROBADOS POR LA ALTA GERENCIA", _page);
            #region contenido
            B_H4_C_URDL_9_1_Az.Texto = "FICHA DE SOLICITUDES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_9_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_3_1_Az.Texto = "DESCRIPCION DE LA SOLICITUD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "UNIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "PROVEEDOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "COSTO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "CANTIDAD APROBADA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            for (int i = 1; i <= 60; i = i + 6)
            {
                TextBox miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i));
                B_H4_C_URDL_3_1_Bl.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 1));
                B_H4_C_URDL_2_1_Bl.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 2));
                B_H4_C_URDL_1_1_Bl.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 3));
                B_H4_C_URDL_2_1_Bl.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 4));
                B_H4_C_URDL_2_1_Bl.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

                miTextbox1 = (TextBox)_panel.FindControl("Textbox" + (i + 5));
                B_H4_C_URDL_2_1_Bl.Texto = miTextbox1.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            }
            B_H4_C_URDL_3_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_2_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_2_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

            B_H4_C_URDL_2_1_Az.Texto = "TOTAL REQUERIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "TOTAL APROBADO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_3_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_2_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_2_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

            B_H4_C_URDL_2_1_Az.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_6_1_Az.Texto = "FIRMA DEL EMPLEADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
            B_H4_C_URDL_6_1_Az.Texto = "FIRMA DEL COORDINADOR DE SST";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
            B_H4_L_URDL_6_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
            B_H4_L_URDL_6_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
            B_H4_L_URDL_6_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
            B_H4_L_URDL_6_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReunionCopasst(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ReunionActaCopasst_", "POLITICA DE SST", _page);
            #region contenido
            B_H4_C_URDL_2_1_Az.Texto = "N° de Acta";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_5_1_Az.Texto = "HORA DE INICIO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            B_H4_C_URDL_5_1_Az.Texto = "HORA DE FINALIZACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            B_H4_C_URDL_2_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "MIEMBROS PRINCIPALES DEL COMITÉ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "INVITADOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "SOLICITUDES DEL DÍA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "ESTATUS DE LAS SOLICITUDES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_5_1_Az.Texto = "REPRESENTANTES DEL EMPLEADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            B_H4_C_URDL_5_1_Az.Texto = "REPRESENTANTES DE LOS TRABAJADORES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = "__________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = "__________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " FIRMA            ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " FIRMA            ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = "__________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = "__________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " FIRMA            ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " FIRMA            ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComunicadoElecciones(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ComunicacionElecciones_", "Comunicado de Elecciones", _page);

            #region contenido
            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_J_URDL_4_1_Bl.Texto = "Ciudad y Fecha: ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Bl));
            B_H3_J_URDL_8_1_Bl.Texto = Convert.ToDateTime(valores[1]).ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_J_URDL_4_1_Bl.Texto = "Dirigido a:: ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Bl));
            B_H3_J_URDL_8_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_J_URDL_4_1_Bl.Texto = "De: ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Bl));
            B_H3_J_URDL_8_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "Asunto: Elección de candidatos en representación de los trabajadores para la " +
                              "conformación del Comité Paritario de Seguridad y Salud en el Trabajo con vigencia del año" +
                              valores[4] + " al año " + valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = valores[6] + " Dando cumplimiento a la legislación laboral relacionada con la conformación del " +
                              "Comité Paritario de Seguridad y Salud en el Trabajo, convoca a la inscripción de los " + valores[7] + "" +
                              "candidatos con sus respectivos suplentes en representación de los trabajadores.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "La hoja de inscripción de candidatos debe " +
                              "reclamarse en la oficina de " + valores[8] + " hasta el día " +
                              Convert.ToDateTime(valores[9]).ToString("dd/MM/yyyy") + " y " +
                              "deberá ser diligenciada y entregada nuevamente como fecha límite el día " +
                              Convert.ToDateTime(valores[10]).ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "Las planchas presentadas serán publicadas en cartelera para conocimiento de todos los trabajadores por " +
                               Convert.ToDateTime(valores[11]).ToString("dd/MM/yyyy");
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "La votación de las diferentes planchas que se presenten se realizará el día  " +
                              Convert.ToDateTime(valores[12]).ToString("dd/MM/yyyy") + " en " +
                              valores[13] + " a las " + valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "El conteo de votos se realizará el día  " +
                               Convert.ToDateTime(valores[15]).ToString("dd/MM/yyyy") + " a las " +
                               valores[16] + "en presencia de un representante de cada una de las planchas presentadas y el jurado de votación.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "Cordialmente:  " + valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintFormatoVotos(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "FormatoVotos_", "Formato de Votos", _page);

            #region contenido
            B_H3_J_URDL_12_1_Bl.Texto = "Votos por Candidatos Individuales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_12_1_Bl));
            B_H3_C_URDL_4_1_Az.Texto = "Candidato";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_4_1_Az));
            B_H3_C_URDL_4_1_Az.Texto = "Foto";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_4_1_Az));
            B_H3_C_URDL_4_1_Az.Texto = "Campo de Votación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_4_1_Az));
            if (valores[1] != string.Empty)
            {
                B_H4_C_URDL_4_1_Bl.Texto = valores[9];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = valores[5];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaFotos(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
            }
            if (valores[2] != string.Empty)
            {
                B_H4_C_URDL_4_1_Bl.Texto = valores[10];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = valores[6];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaFotos(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
            }
            if (valores[3] != string.Empty)
            {
                B_H4_C_URDL_4_1_Bl.Texto = valores[11];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = valores[7];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaFotos(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
            }
            if (valores[4] != string.Empty)
            {
                B_H4_C_URDL_4_1_Bl.Texto = valores[12];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = valores[8];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaFotos(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintRegistroVotantes(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "RegistroVotantes_", "Registro de votantes", _page);

            #region contenido
            B_H3_C_URDL_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_1_1_Az));
            B_H3_C_URDL_4_1_Az.Texto = "NOMBRE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_4_1_Az));
            B_H3_C_URDL_3_1_Az.Texto = "CEDULA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_3_1_Az));
            B_H3_C_URDL_4_1_Az.Texto = "FIRMA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_4_1_Az));

            List<trabajador> LisTrabajador = new List<trabajador>();
            LisTrabajador = Mgr_Trabajador.Get_Trabajador(0, 0, Convert.ToInt32(valores[1]));
            int contTrabajadortes = 0;

            foreach (var item in LisTrabajador)
            {
                contTrabajadortes++;
                B_H4_C_URL_1_1_Bl.Texto = contTrabajadortes.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URL_1_1_Bl));
                B_H4_C_URL_4_1_Bl.Texto = item.primer_nombre + " " + item.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URL_4_1_Bl));
                B_H4_C_URL_3_1_Bl.Texto = item.cedula;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URL_3_1_Bl));
                B_H4_C_URL_4_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URL_4_1_Bl));

                B_H4_C_RDL_1_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RDL_1_1_Bl));
                B_H4_C_RDL_4_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RDL_4_1_Bl));
                B_H4_C_RDL_3_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RDL_3_1_Bl));
                B_H4_C_RDL_4_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_RDL_4_1_Bl));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintResultadoVotos(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ResultadoVotacion_", "Resultado de Votación", _page);

            #region contenido
            B_H3_C_N_8_1_Az.Texto = "Nombre";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_8_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "N° de Votos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_L_URDL_8_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
            B_H4_C_URDL_4_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_L_URDL_8_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
            B_H4_C_URDL_4_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_L_URDL_8_1_Bl.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
            B_H4_C_URDL_4_1_Bl.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_L_URDL_8_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
            B_H4_C_URDL_4_1_Bl.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_L_URDL_8_1_Bl.Texto = "VOTOS EN BLANCO:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
            B_H4_C_URDL_4_1_Bl.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_L_URDL_8_1_Bl.Texto = "VOTOS ANULADOS:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
            B_H4_C_URDL_4_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_L_URDL_8_1_Bl.Texto = "RESULTADO DE LOS VOTOS:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_8_1_Bl));
            B_H4_C_URDL_4_1_Bl.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_2_Az.Texto = "NOMBRE:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_2_Az));
            B_H4_C_URDL_2_2_Az.Texto = "OFICIO:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_2_Az));
            B_H4_C_URDL_2_2_Az.Texto = "SECCIÓN:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_2_Az));
            B_H4_C_URDL_4_1_Az.Texto = "CATEGORÍA:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_2_1_Ve.Texto = "PRINCIPAL:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Ve));
            B_H4_C_D_2_1_Am.Texto = "SUPLENTE:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_D_2_1_Am));
            int valor = 11;
            TextBox _texbox = new TextBox();
            for (int i = 0; i < 10; i++)
            {
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                B_H4_C_URDL_4_1_Bl.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                valor++;
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                B_H4_C_URDL_2_1_Bl.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                valor++;
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                B_H4_C_URDL_2_1_Bl.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                valor++;
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                B_H4_C_URDL_2_1_Bl.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                valor++;
                _texbox = (TextBox)_panel.FindControl("Textbox" + valor);
                B_H4_C_URDL_2_1_Bl.Texto = _texbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                valor++;
            }

            B_H3_C_URL_6_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URL_6_1_Bl));
            B_H3_C_URL_6_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URL_6_1_Bl));
            B_H3_C_RL_6_1_Bl.Texto = "___________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_RL_6_1_Bl));
            B_H3_C_RL_6_1_Bl.Texto = "___________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_RL_6_1_Bl));
            B_H3_C_RDL_6_1_Bl.Texto = "Nombre y Firma del  Coordinador de la mesa de votación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_RDL_6_1_Bl));
            B_H3_C_RDL_6_1_Bl.Texto = "Nombre y Firma del  Coordinador de la mesa de votación";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_RDL_6_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintDesignacionVigia(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "DesignacionVigia_", "Acta de designación del Vigía en Seguridad y Salud en el Trabajo", _page);

            #region contenido
            B_N_N_N_12_1_Bl.Texto = "<p align='justify'><h3>" +
                                "En cumplimiento a lo establecido en el Decreto 1072 del 2015, se designa como Vigía en Seguridad y Salud en " +
                                "el Trabajo a: <strong>" + valores[1] + "</strong><br/> En virtud a lo anterior, el referido actuará como vigía en Seguridad " +
                                "y Salud en el trabajo por el término de 2 años de conformidad con el Decreto 1295 de 1994, período durante el cual el " +
                                "empleador se obliga a facilitar el tiempo necesario dentro de la jornada laboral para que realice sus " +
                                "respectivas funciones. <br/><br/> La presente se firma el <strong>" + valores[2] + "</strong>, con la" +
                                " aprobación de los trabajadores que integran la organización:</h3></p><br/><br/>";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_H4_C_URDL_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_6_1_Az.Texto = "Nombre";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
            B_H4_C_URDL_5_1_Az.Texto = "Cargo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            TextBox _textbox;
            for (int i = 1; i <= 18; i = i + 2)
            {

                B_H4_C_URDL_1_1_Bl.Texto = i.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)_panel.FindControl("Textbox" + i);
                B_H4_L_URDL_6_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                _textbox = (TextBox)_panel.FindControl("Textbox" + (i + 1));
                B_H4_C_URDL_5_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            }
            B_H3_J_URDL_4_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Bl));

            B_H3_J_URDL_8_1_Bl.Texto = "<strong><br/>__________________________________<br/>" +
                              "Vigía en Seguridad y Salud en el Trabajo<br/><br/>" +
                              "CC:<br/><br/>" +
                              "Cargo:<br/><br/></strong>";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInscripcionCandidatos(String[] valores, Panel _panel, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "InscripciónCandidatos_", "Inscripción de Candidatos", _page);

            #region contenido
            B_H3_J_URDL_4_1_Bl.Texto = "Empresa ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Bl));
            B_H3_J_URDL_8_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_J_URDL_4_1_Bl.Texto = "Período ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Bl));
            B_H3_J_URDL_8_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_C_N_3_1_Az.Texto = "NOMBRE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_3_1_Az));
            B_H3_C_N_3_1_Az.Texto = "OFICIO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_3_1_Az));
            B_H3_C_N_3_1_Az.Texto = "SECCIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_3_1_Az));
            B_H3_C_N_3_1_Az.Texto = "FECHA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_3_1_Az));
            TextBox _textbox;
            for (int i = 1; i <= 40; i = i + 4)
            {
                _textbox = (TextBox)_panel.FindControl("Textbox" + i);
                B_H3_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_3_1_Bl));
                _textbox = (TextBox)_panel.FindControl("Textbox" + (i + 1));
                B_H3_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_3_1_Bl));
                _textbox = (TextBox)_panel.FindControl("Textbox" + (i + 2));
                B_H3_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_3_1_Bl));
                _textbox = (TextBox)_panel.FindControl("Textbox" + (i + 3));
                B_H3_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_3_1_Bl));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintAperturaElecciones(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ActaApertura_", "Acta de Apertura", _page);

            #region contenido
            B_H3_C_N_12_1_Bl.Texto = "Acta de apertura de elecciones de los candidatos al comité paritario de seguridad y salud en el trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_J_URDL_4_1_Az.Texto = "Empresa ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Az));
            B_H3_J_URDL_8_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_J_URDL_4_1_Az.Texto = "Período ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Az));
            B_H3_J_URDL_8_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = "Siendo las " + valores[3] + " de la fecha " + valores[4] + ",  se dio apertura al proceso de votación para " +
                                "la elección de los candidatos al  COMITÉ PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO  para el período que va " +
                                "de " + valores[5] + " a " + valores[6] + ".";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = "En calidad de jurados de votación  se encargó a los señores:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintActaCierre(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ActaCierre_", "Acta de Cierre", _page);

            #region contenido
            B_H3_C_N_12_1_Bl.Texto = "Acta de cierre de las votaciones para elección de los candidatos al comité paritario de seguridad y salud en el trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_J_URDL_4_1_Az.Texto = "Empresa ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Az));
            B_H3_J_URDL_8_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_J_URDL_4_1_Az.Texto = "Período ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Az));
            B_H3_J_URDL_8_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = "Siendo las " + valores[3] + " de la fecha " + valores[4] + ",  se dio por finalizado el proceso de " +
                                "votación para elección de los candidatos al COMITÉ PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO  para el " +
                                "período  que va de " + valores[5] + " a " + valores[6] + ".";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = "Como jurados de mesa estuvieron presentes los señores (as):";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        #region Estructura de riesgos
        public static void PrintEstructuraInformacion(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraInformacion_", "Formato para la identificación de riesgos - Información", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Información";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = "Empresa: " + valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            B_H4_C_URDL_12_1_Bl.Texto = "Área: " + valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            B_H4_C_URDL_12_1_Bl.Texto = "Puesto de Trabajo: " + valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            B_H4_C_URDL_12_1_Bl.Texto = "Nombre del Trabajador: " + valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Materia Prima/ Maquinas/ Equipos/Herramientas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Procedimientos Existentes (secuencia de operaciones)";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Productos elaborados:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Emisiones atmosféricas/Desechos Líquidos/ sólidos:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Sustancias Empleadas:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Accidentes ocurridos en el puesto de trabajo:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Enfermedades o molestias de posible origen laboral:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraQuimica(String[] valores, String[] tabla1, String[] tabla2Etiquetas, String[] tabla2Valores,
                                                  String[] tabla3Etiquetas, String[] tabla3Valores, String[] tabla4Etiquetas, String[] tabla4Valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraQuimico_", "Formato para la identificación de riesgos - Químicos", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Químicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            bool band = true;
            int i = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            B_H4_C_URDL_4_1_Az.Texto = "Agente Químico";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Sustancias Asfixiantes";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Otras Sustancias";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            for (int j = 0; j < tabla2Etiquetas.Length; j++)
            {
                B_H4_C_URDL_3_1_Bl.Texto = tabla2Etiquetas[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                B_H4_C_URDL_1_1_Bl.Texto = tabla2Valores[j];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                if (j < 5)
                {
                    B_H4_C_URDL_3_1_Bl.Texto = tabla3Etiquetas[j];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = tabla3Valores[j];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

                    B_H4_C_URDL_3_1_Bl.Texto = tabla4Etiquetas[j];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = tabla4Valores[j];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                }
                else
                {
                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }

            }



            B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraFisicos(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraFisico_", "Formato para la identificación de riesgos - Físicos", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Físicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            bool band = true;
            int i = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraMecanicas(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraMecanico_", "Formato para la identificación de riesgos - Mecánicos", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Mecánicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            bool band = true;
            int i = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraBiologicas(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraBiologico_", "Formato para la identificación de riesgos - Biológicos", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Biológicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            bool band = true;
            int i = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraDisergonomica(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraDisergonomicos_", "Formato para la identificación de riesgos - Disergonómicos", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Disergonómicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            bool band = true;
            int i = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraPsicosociales(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraPsicosociales_", "Formato para la identificación de riesgos - Psicosociales", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Psicosociales";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            bool band = true;
            int i = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraElectricos(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraElectricos_", "Formato para la identificación de riesgos - Electricos", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Electricos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            bool band = true;
            int i = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintEstructuraLocativos(String[] valores, String[] tabla1, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "EstructuraLocativos_", "Formato para la identificación de riesgos - Locativos", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Formato para la identificación de riesgos durante el recorrido en las instalaciones - Locativos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "Factor de Riesgo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "SI/ NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "Tiempo de Exposición";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            bool band = true;
            int i = 0;
            while (band)
            {
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = tabla1[i + 2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                i = i + 3;
                if (i == tabla1.Length)
                    band = false;
            }

            B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Observaciones:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }
        #endregion

        public static void PrintConformacionCopasst(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ConformacionCopasst_", "Conformacion Copasst", _page);

            #region contenido
            B_H3_C_N_12_1_Bl.Texto = "Acta de conformación del comité paritario de seguridad y salud en el trabajo o vigía de seguridad y salud en el trabajo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_J_URDL_4_1_Bl.Texto = "Empresa ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Bl));
            B_H3_J_URDL_8_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_J_URDL_4_1_Bl.Texto = "Período ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_4_1_Bl));
            B_H3_J_URDL_8_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_J_URDL_8_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = "El día " + valores[3] + " se eligió el Comité Paritario de Seguridad y Salud en el Trabajo o el vigía de " +
                              "seguridad y salud en el trabajo dando así cumplimiento a las exigencias de la Resolución  2013 de 1986,  al " +
                              "Decreto 1295 de 1994 y a la División de Salud Ocupacional del Ministerio de Protección Social.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = "Como jurados de mesa estuvieron presentes los señores (as):";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = "La modalidad utilizada para su elección fue:" + valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = "Resultaron elegidos:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = "El representante legal de la empresa designa a :" + valores[12] + " Como presidente del comité y por votación del comité se nombra a " +
                             valores[12] + " Como secretario (a) del mismo.";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = "Nombre y Firma del Coordinador de la mesa de votación:";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = "______________________________________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            B_H3_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintProgramaInspecciones(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ProgramaInspecciones_", "PROGRAMA DE INSPECCIONES", _page);

            #region contenido
            B_N_N_N_12_1_Bl.Texto = "Realizar inspecciones en cada una de las áreas de la Empresa, a fin de determinar las condiciones en las que se encuentran los puestos de trabajo," +
                "los dispositivos de seguridad y el acatamiento de las normas y procedimientos seguros de trabajo" +
                "<h3> Metas. </h3><br/>" +
                "<ul>" +
                "<li> Realizar periódicamente seguimiento de los procesos de trabajo en cada una de las áreas productivas de la organización. </li>" +
                "<li> Involucrar a los trabajadores y a los supervisores en el desarrollo de las inspecciones en cada uno de los elementos a evaluar. </li>" +
                "<li> Según los resultados obtenidos realizar medidas preventivas, para minimizar el riesgo de ocurrencia de accidentes de trabajo y enfermedades ocupacionales. </li>" +
                "</ul> ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintIdentificacionPeligro(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "IdentificacionPeligro_", "IDENTIFICACIÓN DE PELIGRO", _page);

            List<identificacion_peligro> listta = Mgr_Riesgos.Get_IdentificacionPeligro(Convert.ToInt32(valores[1]));
            #region contenido
            foreach (var item in listta)
            {
                B_H4_C_URDL_12_1_Az.Texto = "Medidas de control Existentes";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_N_N_N_12_1_Bl.Texto = item.medidas_control_existentes;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "Observaciones";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_N_N_N_12_1_Bl.Texto = item.observaciones;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "Fecha";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_N_N_N_12_1_Bl.Texto = item.fecha_identificacion.ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
            }

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComunicacionPoliticaSST(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PoliticaSST_", "COMUNICADO POLITICA DE SST", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "AÑO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "COMPROMISO DE LA EMPRESA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "EN TAL SENTIDO AL EMPRESA SE COMPROMETE A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_5_1_Bl.Texto = "TRABAJADOR AL QUE FUE COMUNICADO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = "FIRMA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_5_1_Bl.Texto = string.Empty + valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComunicacionPoliticaSST2(String[] valores, List<trabajador> ListaTrabajador, Page _page)
        {
            foreach (var itemTrab in ListaTrabajador)
            {
                Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PoliticaSST_", "COMUNICADO POLITICA DE SST", _page);

                B_H4_C_URDL_12_1_Az.Texto = "AÑO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = valores[1];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "COMPROMISO DE LA EMPRESA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = valores[2];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "EN TAL SENTIDO AL EMPRESA SE COMPROMETE A";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = valores[3];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_5_1_Bl.Texto = "TRABAJADOR AL QUE FUE COMUNICADO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = "FIRMA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = string.Empty + itemTrab.primer_nombre + " " + itemTrab.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

                ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
            }
        }

        public static void PrintEncuestaPoliticaSST(String[] valores2, String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores2[0]),
                                        "EncuestaPoliticaSST_", "ENCUESTA SOBRE EL CONOCIMIENTO DE LA POLITICA DE SST", _page);

            #region contenido
            B_H4_C_URDL_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_4_1_Az.Texto = "PREGUNTAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "SI";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "NO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_5_1_Bl.Texto = "OBSERVACIONES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            for (int i = 0; i < 18; i++)
            {
                B_H4_C_URDL_1_1_Bl.Texto = string.Empty + (i + 1);
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = valores[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_1_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                B_H4_C_URDL_1_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                B_H4_C_URDL_5_1_Az.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            }

            B_H4_C_URDL_5_1_Bl.Texto = "TRABAJADOR AL QUE FUE COMUNICADO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = "FIRMA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = string.Empty + valores2[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

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

                B_H4_C_URDL_1_1_Az.Texto = "N°";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "PREGUNTAS";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_1_1_Az.Texto = "SI";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                B_H4_C_URDL_1_1_Az.Texto = "NO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                B_H4_C_URDL_5_1_Bl.Texto = "OBSERVACIONES";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

                for (int i = 0; i < 18; i++)
                {
                    B_H4_C_URDL_1_1_Bl.Texto = string.Empty + (i + 1);
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = valores[i];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_5_1_Az.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                }

                B_H4_C_URDL_5_1_Bl.Texto = "TRABAJADOR AL QUE FUE COMUNICADO";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = "FIRMA";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = string.Empty + itemTrab.primer_nombre + " " + itemTrab.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                B_H4_C_URDL_5_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

                ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores2[0]), _page);
            }

            #endregion


        }

        public static void PrintAsignacionResponsable(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "ActaResponsabilidad_", "Acta de asignación del responsable del SGSST", _page);

            #region contenido 
            B_H3_R_N_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_R_N_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H3_C_N_12_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

            B_H3_C_URDL_12_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintComunicadoIncidenteLaboral(String[] valores, Page _page)
        {
            #region contenido 
            List<at_it_el_pa> ListAccidentes = new List<at_it_el_pa>();
            ListAccidentes = Mgr_Acc_Inc.Get_Accidente(Convert.ToInt32(valores[0]));

            foreach (var item in ListAccidentes)
            {
                int IdSucursal = item.trabajador.puesto_trabajo.area.id_sucursal;
                Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
                                                            IdSucursal,
                                                            "ComunicadoIncidente_",
                                                            "",
                                                            _page);

                B_H4_C_URDL_4_1_Az.Texto = "Sucursal";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Fecha Incidente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Hora Incidente";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Bl.Texto = item.trabajador.puesto_trabajo.area.sucursal.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = item.fecha_accidente.Value.ToString("yyyy-MM-dd");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = item.hora_accidente.Value.ToString("hh:mm:ss");
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_4_1_Az.Texto = "Trabajador";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Área";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Puesto de Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Bl.Texto = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                if (item.id_area == 0)
                {
                    B_H4_C_URDL_4_1_Bl.Texto = "Ninguno";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }
                else
                {
                    B_H4_C_URDL_4_1_Bl.Texto = item.area.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }
                if (item.id_puesto == 0)
                {
                    B_H4_C_URDL_4_1_Bl.Texto = "Ninguno";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }
                else
                {
                    B_H4_C_URDL_4_1_Bl.Texto = item.puesto_trabajo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }

                B_H4_C_URDL_6_1_Az.Texto = "Sitio donde se presentó el caso.";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
                B_H4_C_URDL_6_1_Az.Texto = "Breve descripción de los hechos";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

                B_H4_L_URDL_6_1_Bl.Texto = item.sitio;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = item.descripcion;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CAUSAS INMEDIATAS - Condiciones Inseguras";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item.condiciones_inseguras;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CAUSAS INMEDIATAS - Actos Inseguros";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item.actos_inseguros;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CAUSAS BÁSICAS - Factores del Trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item.factores_inseguros;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "CAUSAS BÁSICAS - Factores Personales";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item.factores_personales;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "Magnitud del Evento";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                B_H4_C_URDL_4_1_Az.Texto = "Días de incapacidad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Días cargados";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Días perdidos por ausencia del trabajo";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Bl.Texto = string.Empty + item.dias_incapacidad;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = string.Empty + item.dias_cargados;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                B_H4_C_URDL_4_1_Bl.Texto = string.Empty + item.dias_perdidos_ausencia;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_4_1_Az.Texto = "Días perdidos por actividad restringida";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Sin Tiempo Perdido";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                B_H4_C_URDL_4_1_Az.Texto = "Tipo de enfermedad";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                B_H4_C_URDL_4_1_Bl.Texto = string.Empty + item.dias_perdidos_restingido;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                if (Convert.ToString(item.dias_no_perdidos) == "true")
                {
                    B_H4_C_URDL_4_1_Bl.Texto = "Si";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }
                else
                {
                    B_H4_C_URDL_4_1_Bl.Texto = "No";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                }
                string tipoEnf = "";
                if (Convert.ToString(item.tipo_enfermedad) == "A") { tipoEnf = "Enfermedades en la piel"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "B") { tipoEnf = "Enfermedades respiratorias"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "C") { tipoEnf = "Envenenamiento"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "D") { tipoEnf = "Enfermedades debidas a agentes físicos"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "E") { tipoEnf = "Enfermedades producidas por traumas repetitivos"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "F") { tipoEnf = "Otras enfermedades osteomusculares"; }
                else if (Convert.ToString(item.tipo_enfermedad) == "G") { tipoEnf = "Demás enfermedades profesionales"; }
                B_H4_C_URDL_4_1_Bl.Texto = tipoEnf;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                B_H4_C_URDL_12_1_Az.Texto = "COMUNICADO A TRABAJADORES";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

                List<trabajador> ListaTrabajador = new List<trabajador>();
                ListaTrabajador = Mgr_Trabajador.Get_Trabajador(0, 0, IdSucursal);

                foreach (var item1 in ListaTrabajador)
                {
                    B_H4_C_URDL_4_1_Az.Texto = "Nombre y Apellido";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Cédula";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));
                    B_H4_C_URDL_4_1_Az.Texto = "Firma";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

                    B_H4_C_URDL_4_1_Bl.Texto = item1.primer_nombre + " " + item1.primer_apellido;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = item1.cedula;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
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
                B_N_N_N_12_1_Bl.Texto = cadenas[i];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));
            }
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintIdentificacionAccidente(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "IdentificacionRiesgo_", "IDENTIFICACIÓN DE RIESGO", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "Puestos de Trabajo Afectados";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            List<identificacion_peligro> List_IdePel = new List<identificacion_peligro>();
            List_IdePel = Mgr_Riesgos.Get_IdentificacionPeligro(Convert.ToInt32(valores[1]));

            foreach (var item_IdePel in List_IdePel)
            {
                int contadorPuesto = 1;
                foreach (var item_IdePue in item_IdePel.identificacion_puesto)
                {
                    B_H4_C_URDL_2_1_Bl.Texto = "Puesto N°" + contadorPuesto;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = "Sucursal: " + item_IdePue.puesto_trabajo.area.sucursal.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = "Puesto de Trabajo: " + item_IdePue.puesto_trabajo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    contadorPuesto++;
                }
            }

            B_H4_C_URDL_12_1_Az.Texto = "Peligros";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            foreach (var item_IdePel in List_IdePel)
            {
                foreach (var item_fac_ide in item_IdePel.factor_identificacion)
                {
                    B_H4_C_URDL_2_1_Bl.Texto = "Tipo de Riesgo: " + item_fac_ide.factor_riesgo.tipo_riesgo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = "Factor de Riesgo:  " + item_fac_ide.factor_riesgo.nombre;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_4_1_Bl.Texto = "Posibles Efectos:  " + item_fac_ide.consecuencias;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));
                    B_H4_C_URDL_2_1_Bl.Texto = "Tiempo de Exposición:  " + item_fac_ide.tiempo_exposicion;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                }
                B_H4_C_URDL_12_1_Az.Texto = "Medidas de control existentes";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item_IdePel.medidas_control_existentes;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
                B_H4_C_URDL_12_1_Az.Texto = "Observaciones";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_12_1_Bl.Texto = item_IdePel.observaciones;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            }

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintMatrizResponsabilidades(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "MatrizResponsabilidad_", "MATRIZ DE RESPONSABILIDADES", _page);

            #region contenido
            B_N_N_N_12_1_Bl.Texto = "<br/><br/><br/><br/><br/><h1 align='center'>MATRIZ DE RESPONSABILIDADES Y COMPETENCIAS DE LA EMPRESA</h1>";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = "<h3><strong>ALTA GERENCIA, EMPLEADOR</strong></h3>" + valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = "<h3><strong>COORDINADOR DE SEGURIDAD Y SALUD EN EL TRABAJO</strong></h3>" + valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = "<h3><strong>JEFES DE ÁREA</strong></h3>" + valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = "<h3><strong>RESPONSABLE DE SALUD OCUPACIONAL</strong></h3>" + valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = "<h3><strong>TRABAJADORES</strong></h3>" + valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = "<h3><strong>COMITÉ PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO</strong></h3>" + valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = "<h3><strong>COMITÉ DE CONVIVENCIA</strong></h3>" + valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_N_N_N_12_1_Bl.Texto = "<h3><strong>COORDINADOR DE ALTURAS</strong></h3><br/>" + valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_N_N_N_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_L_N_6_1_Bl.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            B_H4_L_N_6_1_Bl.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_L_N_6_1_Bl.Texto = "ALTA GERENCIA, EMPLEADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            B_H4_L_N_6_1_Bl.Texto = "COORDINADOR DE SEGURIDAD Y SALUD EN EL TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_L_N_6_1_Bl.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            B_H4_L_N_6_1_Bl.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_L_N_6_1_Bl.Texto = "JEFES DE ÁREA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            B_H4_L_N_6_1_Bl.Texto = "RESPONSABLE DE SALUD OCUPACIONAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_L_N_6_1_Bl.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            B_H4_L_N_6_1_Bl.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_L_N_6_1_Bl.Texto = "TRABAJADORES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            B_H4_L_N_6_1_Bl.Texto = "COMITÉ PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_L_N_6_1_Bl.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            B_H4_L_N_6_1_Bl.Texto = "___________________________";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_L_N_6_1_Bl.Texto = "COMITÉ DE CONVIVENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            B_H4_L_N_6_1_Bl.Texto = "COORDINADOR DE ALTURAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H4_L_N_6_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintInventarioEPP(String[] valores, Panel pnExistencia, Panel pnIngresos, Panel pnEgresos, List<Model_CEPP> epps, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PlanillaInventarioEpp_", "PLANILLA DE INVENTARIO DE EPP", _page);

            #region contenido
            List<empresa> ListaEmpresa = new List<empresa>();
            ListaEmpresa = Mgr_Empresa.Get_Empresa(Convert.ToInt32(valores[1]));

            string nomEmpresa = string.Empty;
            foreach (var item in ListaEmpresa)
            {
                nomEmpresa = item.nombre;
            }

            B_H4_C_URDL_12_1_Az.Texto = "EXISTENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_5_1_Az.Texto = "EQUIPOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "UNIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "EXISTENCIA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            int cont_epp = 0;
            TextBox _textbox;
            foreach (var epp in epps)
            {
                B_H4_C_URDL_1_1_Bl.Texto = (cont_epp + 1).ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
                B_H4_C_URDL_5_1_Bl.Texto = epp.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                _textbox = (TextBox)pnExistencia.FindControl("lblUniExi" + cont_epp);
                B_H4_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                _textbox = (TextBox)pnExistencia.FindControl("txtCantExi" + cont_epp);
                B_H4_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                cont_epp++;
            }

            B_H4_C_URDL_12_1_Az.Texto = "INGRESOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "EQUIPOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "UNIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "FECHA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "PROVEEDOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            cont_epp = 0;
            foreach (var epp in epps)
            {
                B_H4_C_URDL_1_1_Bl.Texto = (cont_epp + 1).ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                B_H4_C_URDL_3_1_Bl.Texto = epp.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtUni" + cont_epp);
                B_H4_C_URDL_2_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtFech" + cont_epp);
                B_H4_C_URDL_2_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtCant" + cont_epp);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtProv" + cont_epp);
                B_H4_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
            }

            B_H4_C_URDL_12_1_Az.Texto = "EGRESOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "N°";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "EQUIPOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "UNIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "SOLICITANTE";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "FECHA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            cont_epp = 0;
            foreach (var epp in epps)
            {
                B_H4_C_URDL_1_1_Bl.Texto = (cont_epp + 1).ToString();
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                B_H4_C_URDL_3_1_Bl.Texto = epp.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                _textbox = (TextBox)pnIngresos.FindControl("ItxtUni" + cont_epp);
                B_H4_C_URDL_2_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                _textbox = (TextBox)pnEgresos.FindControl("EtxtCant" + cont_epp);
                B_H4_C_URDL_2_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                _textbox = (TextBox)pnEgresos.FindControl("EtxtSol" + cont_epp);
                B_H4_C_URDL_1_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                _textbox = (TextBox)pnEgresos.FindControl("EtxtFech" + cont_epp);
                B_H4_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
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
            ListaEmpresa = Mgr_Empresa.Get_Empresa(Convert.ToInt32(valores[1]));
            string nomEmpresa = string.Empty;
            foreach (var item in ListaEmpresa)
            {
                nomEmpresa = item.nombre;
            }
            List<trabajador> trabajador = Mgr_Trabajador.Get_Trabajador(Convert.ToInt32(valores[2]));
            List<sucursal> sucursal = Mgr_Sucursal.Get_Sucursal(Convert.ToInt32(valores[3]), 0, string.Empty);
            string direccion = string.Empty;
            foreach (var item in sucursal)
            {
                direccion = item.direccion;
            }

            foreach (var item in trabajador)
            {
                B_H4_L_URDL_6_1_Bl.Texto = "Nombres y Apellidos: " + valores[4];
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = "C.C: " + item.cedula;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = "Cargo: " + item.puesto_trabajo.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_6_1_Bl.Texto = "Código: ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));
                B_H4_L_URDL_12_1_Bl.Texto = "La Empresa " + nomEmpresa + ", domiciliada en " + direccion + ", en cumplimiento a lo dispuesto en el Decreto 1072 del año 2015, artículos: 2.2.4.6.12, Numeral 8 y artículo 2.2.4.6.24 Parágrafo 1, Por medio de la presente, hace entrega de los equipos de protección personal que en las páginas numeradas se señalan:";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));
                B_H4_L_URDL_12_1_Bl.Texto = "Y yo, " + valores[4] + " Titular de la Cédula de Ciudadanía Nº " + item.cedula + ", trabajador de la Empresa antes citada por medio de la presente declaro:";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));
                B_H4_L_URDL_12_1_Bl.Texto = "1.-Que recibo en perfecto estado de funcionamiento los Equipos de Protección Personal y, que los mismos son adecuados, y se corresponden con las actividades que realizo en esta Empresa. ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));
                B_H4_L_URDL_12_1_Bl.Texto = "2.-Que el empleador ha suministrado las instrucciones necesarias para el uso correcto de los equipos recibidos.";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));
                B_H4_L_URDL_12_1_Bl.Texto = "3.-Me comprometo, a hacer uso adecuado durante mi jornada de trabajo, incluso en jornadas extras laboradas de acuerdo a la ley de los equipos de protección personal dotados, y de acuerdo a las instrucciones que me han sido impartidas. ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));
                B_H4_L_URDL_12_1_Bl.Texto = "4.-Encontrándome conforme, firmo.";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_12_1_Bl));
            }
            B_H4_C_URDL_3_1_Az.Texto = "DOTACIÓN  ENTREGADA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "DETALLES DE LA DOTACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "CANTIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "FECHA DE ENTREGA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "FIRMA DE RECIBIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            int id_puesto_trabajo = Mgr_PuestoTrabajo.GetId_PuestoTrabajador(Convert.ToInt32(valores[2]));
            List<Model_CEPP> epps = Mgr_Epp.Get_Epp(id_puesto_trabajo);
            int cont = 0;
            TextBox _textbox;
            foreach (var epp in epps)
            {
                B_H4_C_URDL_3_1_Bl.Texto = epp.nombre;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("txtDet" + cont);
                B_H4_C_URDL_3_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("txtCant" + cont);
                B_H4_C_URDL_2_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                _textbox = (TextBox)pnDatos.FindControl("txtFech" + cont);
                B_H4_C_URDL_2_1_Bl.Texto = _textbox.Text;
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
                B_H4_C_URDL_2_1_Bl.Texto = " ";
                DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
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
            B_H4_C_URDL_1_1_Az.Texto = "# DE ACCIDENTES DE TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "# DE ACCIDENTES COMUNES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "# DE ENFERMEDADES COMUNES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "# DE ENFERMEDADES DE POSIBLE ORIGEN OCUPACIONAL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "# DE ENFERMEDADES OCUPACIONALES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "# DE TRABAJADORES REFERENCIADOS A  CENTROS ESPECIALIZADOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "# DE TRABAJADORES CON DISCAPACIDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "RESULTADOS DE EVALUACIONES CLÍNICAS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "MONITOREO DE REPOSOS MÉDICOS";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            B_H4_C_URDL_1_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            B_H4_C_URDL_1_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_1_1_Bl.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_1_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_1_1_Bl.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_12_1_Bl.Texto = "~/source/archivos/images_graf/graficoFuerzaLab.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            B_H4_C_URDL_12_1_Az.Texto = "Resultados de Evaluaciones Clínicas";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Evaluación Pre Empleo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Evaluación Pre Vacacional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Evaluación Post Vacacional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Evaluación Periódica";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Evaluación Especial";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Evaluación Post Empleo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_1_1_Az.Texto = "Evaluación Asistencial o Curativa";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_1_1_Bl.Texto = valores[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_12_1_Bl.Texto = "~/source/archivos/images_graf/graficaEvaCli.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            B_H4_C_URDL_12_1_Az.Texto = "Monitoreo de Reposos Médicos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "N° de Reposos";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "Días de Reposo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_2_1_Az.Texto = "N° Reposos por Enfermedad Común";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "N° Reposos por Enfermedad Ocupacional";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));
            B_H4_C_URDL_3_1_Az.Texto = "N° Reposos por Accidente Común";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Az));

            B_H4_C_URDL_2_1_Bl.Texto = valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_2_1_Bl.Texto = valores[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));
            B_H4_C_URDL_3_1_Bl.Texto = valores[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));
            B_H4_C_URDL_3_1_Bl.Texto = valores[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_3_1_Bl));

            B_H4_C_URDL_12_1_Bl.Texto = "~/source/archivos/images_graf/graficaRepMed.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Diagnósticos presentes en los Trabajadores";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = "~/source/archivos/images_graf/graficaDiagnostico.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Sistema Orgánico Afectado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H4_C_URDL_12_1_Bl.Texto = "~/source/archivos/images_graf/graficaSistema.jpg";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaImage(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
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
                    B_H4_C_URDL_5_1_Az.Texto = headers[PosHeader];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_5_1_Az.Texto = "OBSERVACIONES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                    PosHeader++;
                }
                else if (i == 150)
                {
                    B_H4_C_URDL_5_1_Bl.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = valores[1];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = valores[2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = valores[3];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                }
                else
                {
                    if (i == 1)
                    {

                        B_H4_C_URDL_5_1_Bl.Texto = columna1[i];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                        B_H4_C_URDL_1_1_Bl.Texto = " ";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                        B_H4_C_URDL_1_1_Bl.Texto = " ";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                        B_H4_C_URDL_5_1_Bl.Texto = " ";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    }
                    else
                    {
                        HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)_panel.FindControl("radio" + (posicionfila + 1));
                        HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)_panel.FindControl("radio" + (posicionfila + 2));

                        TextBox mitextbox = (TextBox)_panel.FindControl("txtf" + posicionTextbox);

                        B_H4_C_URDL_5_1_Bl.Texto = columna1[posicionfila / 2];
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                        B_H4_C_URDL_1_1_Bl.Texto = miradio1.Checked == true ? "X" : "";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                        B_H4_C_URDL_1_1_Bl.Texto = miradio2.Checked == true ? "X" : "";
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                        B_H4_C_URDL_5_1_Bl.Texto = mitextbox.Text;
                        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
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
                    B_H4_C_URDL_5_1_Az.Texto = headers[PosHeader];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_5_1_Az.Texto = "OBSERVACIONES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                    PosHeader++;
                }
                else if (i == 158)
                {
                    B_H4_C_URDL_5_1_Bl.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = valores[1];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = valores[2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = valores[3];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                }
                else
                {
                    HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)_panel.FindControl("radio" + (posicionfila + 1));
                    HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)_panel.FindControl("radio" + (posicionfila + 2));

                    TextBox mitextbox = (TextBox)_panel.FindControl("txtf" + posicionTextbox);

                    B_H4_C_URDL_5_1_Bl.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = miradio1.Checked == true ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = miradio2.Checked == true ? "X" : "";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = mitextbox.Text;
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

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
                    B_H4_C_URDL_5_1_Az.Texto = headers[PosHeader];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_5_1_Az.Texto = "OBSERVACIONES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                    PosHeader++;
                }
                else if (i == 150)
                {
                    B_H4_C_URDL_5_1_Bl.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                }
                else
                {
                    B_H4_C_URDL_5_1_Bl.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
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
                    B_H4_C_URDL_5_1_Az.Texto = headers[PosHeader];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "SI";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_1_1_Az.Texto = "NO";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));
                    B_H4_C_URDL_5_1_Az.Texto = "OBSERVACIONES";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));
                    PosHeader++;
                }
                else if (i == 158)
                {
                    B_H4_C_URDL_5_1_Bl.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                }
                else
                {
                    B_H4_C_URDL_5_1_Bl.Texto = columna1[posicionfila / 2];
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_1_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));
                    B_H4_C_URDL_5_1_Bl.Texto = " ";
                    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));
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
            B_H4_C_URDL_12_1_Az.Texto = "DATOS DEL TRABAJADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "PRIMER APELLIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "SEGUNDO APELLIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "NOMBRES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "N° DE IDENTIFICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_2_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

            B_H4_C_URDL_2_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

            B_H4_C_URDL_4_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_1_Az.Texto = "SEXO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "EDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "EDO CIVIL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Bl.Texto = valores[5];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_1_Bl.Texto = valores[6];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_1_Bl.Texto = valores[7];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "CCF";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[8];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_6_1_Az.Texto = "ÁREA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

            B_H4_C_URDL_6_1_Az.Texto = "PUESTO DE TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

            B_H4_L_URDL_6_1_Bl.Texto = valores[9];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = valores[10];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Qué equipos opera?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[11];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Actualmente presenta alguna enfermedad o esta en tratamiento médico? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[12];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Describa que síntoma(s) físico(s) o emocional(es) percibe y el tiempo de evolución";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[13];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Considera que tiene alguna relación estos síntomas con su trabajo? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[14];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Considera que tiene alguna relación éste síntoma con sus actividades fuera del trabajo? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[15];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_5_1_Az.Texto = "¿Ha consultado a su servicio de salud por estos síntomas?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_5_1_Az.Texto = "¿Porqué?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_5_1_Bl.Texto = valores[16];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valores[17];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valores[18];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_5_1_Bl.Texto = valores[19];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_5_1_Az.Texto = "¿Durante el último año ha sido incapacitado por esta causa?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_5_1_Az.Texto = "¿Porqué?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_5_1_Bl.Texto = valores[20];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valores[21];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = valores[22];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_5_1_Bl.Texto = valores[23];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Cuantos días de incapacidad médica?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[24];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Tiene Ud. algún hobbie, o practica algún deporte? ¿Cual(es)? ¿Qué tiempo le dedica a cada uno?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[25];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "SUGERENCIAS Y RECOMENDACIONES PARA EL MEJORAMIENTO DE LAS CONDICIONES DE SALUD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = valores[26];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintReporteTrabajadoresCGeneral(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                     "ReporteTrabajadores_", "REPORTE DE TRABAJADORES", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "DATOS DEL TRABAJADOR";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "PRIMER APELLIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_2_1_Az.Texto = "SEGUNDO APELLIDO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "NOMBRES";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "N° DE IDENTIFICACIÓN";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_2_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

            B_H4_C_URDL_2_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_2_1_Bl));

            B_H4_C_URDL_4_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_1_Az.Texto = "SEXO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "EDAD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Az.Texto = "EDO CIVIL";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Az));

            B_H4_C_URDL_4_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_4_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_4_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "CCF";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_6_1_Az.Texto = "ÁREA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

            B_H4_C_URDL_6_1_Az.Texto = "PUESTO DE TRABAJO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));

            B_H4_L_URDL_6_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_L_URDL_6_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Qué equipos opera?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Actualmente presenta alguna enfermedad o esta en tratamiento médico? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Describa que síntoma(s) físico(s) o emocional(es) percibe y el tiempo de evolución";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Considera que tiene alguna relación estos síntomas con su trabajo? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Considera que tiene alguna relación éste síntoma con sus actividades fuera del trabajo? Explique";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_5_1_Az.Texto = "¿Ha consultado a su servicio de salud por estos síntomas?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_5_1_Az.Texto = "¿Porqué?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_5_1_Az.Texto = "¿Durante el último año ha sido incapacitado por esta causa?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "Si";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_1_1_Az.Texto = "No";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Az));

            B_H4_C_URDL_5_1_Az.Texto = "¿Porqué?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Az));

            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_1_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_1_1_Bl));

            B_H4_C_URDL_5_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_5_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Cuantos días de incapacidad médica?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "¿Tiene Ud. algún hobbie, o practica algún deporte? ¿Cual(es)? ¿Qué tiempo le dedica a cada uno?";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "SUGERENCIAS Y RECOMENDACIONES PARA EL MEJORAMIENTO DE LAS CONDICIONES DE SALUD";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H4_C_URDL_12_1_Bl.Texto = " ";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Bl));
            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPoliticaSST(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PoliticaSST_", "POLITICA DE SST", _page);

            #region contenido
            B_H4_C_URDL_12_1_Az.Texto = "AÑO";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H3_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "COMPROMISO DE LA EMPRESA";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H3_C_URDL_12_1_Bl.Texto = valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "EN TAL SENTIDO AL EMPRESA SE COMPROMETE A";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H3_C_URDL_12_1_Bl.Texto = valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "ALCANCE DEL SST";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));

            B_H3_C_URDL_12_1_Bl.Texto = valores[4];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintProcedimientos(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "Procedimientos_", "PROCEDIMIENTOS DE INVESTIGACIÓN DE ACCIDENTES E INCIDENTES", _page);

            #region contenido

            B_H3_C_URDL_12_1_Bl.Texto = valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_C_URDL_12_1_Bl));

            #endregion

            ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, Convert.ToInt32(valores[0]), _page);
        }

        public static void PrintPerfilCargo(String[] valores, Page _page)
        {
            Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(Convert.ToInt32(valores[0]),
                                        "PerfilCargo_", "PERFIL DE CARGO", _page);

            #region contenido
            B_H4_C_URDL_6_1_Az.Texto = "Nombre del Cargo";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
            B_H4_L_URDL_6_1_Bl.Texto = string.Empty + valores[1];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_C_URDL_6_1_Az.Texto = "Código CNO Asociado";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_6_1_Az));
            B_H4_L_URDL_6_1_Bl.Texto = string.Empty + valores[2];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_L_URDL_6_1_Bl));

            B_H4_C_URDL_12_1_Az.Texto = "Descripción";
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, B_H4_C_URDL_12_1_Az));
            B_H3_C_N_12_1_Bl.Texto = string.Empty + valores[3];
            DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, B_H3_C_N_12_1_Bl));

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
