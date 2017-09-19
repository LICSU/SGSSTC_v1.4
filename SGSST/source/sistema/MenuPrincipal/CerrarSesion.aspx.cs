using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;

namespace SGSSTC.source.sistema.MenuPrincipal
{
    public partial class CerrarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.Abandon();
            string sHttpCookie = FormsAuthentication.FormsCookieName;
            if (Request.Cookies[sHttpCookie] != null)
            {
                Response.Cookies[sHttpCookie].Expires = DateTime.Now.AddDays(-1);
            }
            Response.Cookies.Add(new System.Web.HttpCookie("ASP.NET_SessionId", ""));
            Response.Redirect("~/Default.aspx");
        }
    }
}