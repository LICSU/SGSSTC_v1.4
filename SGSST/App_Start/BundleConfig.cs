using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace SGSST
{
    public class BundleConfig
    {
        // Para obtener más información sobre las uniones, visite https://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                            "~/Scripts/WebForms/WebForms.js",
                            "~/Scripts/WebForms/WebUIValidation.js",
                            "~/Scripts/WebForms/MenuStandards.js",
                            "~/Scripts/WebForms/Focus.js",
                            "~/Scripts/WebForms/GridView.js",
                            "~/Scripts/WebForms/DetailsView.js",
                            "~/Scripts/WebForms/TreeView.js",
                            "~/Scripts/WebForms/WebParts.js"));

            // El orden es muy importante para el funcionamiento de estos archivos ya que tienen dependencias explícitas
            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            bundles.Add(new ScriptBundle("~/bundles/SplashJs").Include(
                            "~/splash/js/jquery.min.js",
                            "~/splash/js/jquery.easing.1.3.js",
                            "~/splash/js/bootstrap.min.js",
                            "~/splash/js/jquery.waypoints.min.js",
                            "~/splash/js/owl.carousel.min.js",
                            "~/splash/js/jquery.countTo.js",
                            "~/splash/js/jquery.magnific-popup.min.js",
                            "~/splash/js/magnific-popup-options.js",
                            "~/splash/js/main.js"));

            bundles.Add(new StyleBundle("~/bundles/SplashCss").Include(
                            "~/splash/css/animate.css",
                            "~/splash/css/icomoon.css",
                            "~/splash/css/themify-icons.css",
                            "~/splash/css/bootstrap.css",
                            "~/splash/css/magnific-popup.css",
                            "~/splash/css/owl.carousel.min.css",
                            "~/splash/css/owl.theme.default.min.css",
                            "~/splash/css/style.css"));

            bundles.Add(new StyleBundle("~/bundles/SGSSTCss").Include(
                            "~/Content/bootstrap.min.css",
                            "~/Content/Site.css"));

            bundles.Add(new ScriptBundle("~/bundles/SGSSTJs").Include(
                            "~/Scripts/jquery-3.1.1.slim.js",
                            "~/Scripts/jquery-3.1.1.min.js",
                            "~/Scripts/hideShowPassword.min.js",
                            "~/Scripts/bootstrap.min.js",
                            "~/Scripts/Custom.js"));

            // Use la versión de desarrollo de Modernizr para desarrollar y aprender. Luego, cuando esté listo
            // para la producción, use la herramienta de compilación disponible en https://modernizr.com para seleccionar solo las pruebas que necesite
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*"));

            ScriptManager.ScriptResourceMapping.AddDefinition(
                "respond",
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/respond.min.js",
                    DebugPath = "~/Scripts/respond.js",
                });
        }
    }
}