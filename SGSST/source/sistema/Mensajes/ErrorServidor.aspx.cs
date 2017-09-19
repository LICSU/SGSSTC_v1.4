using System;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;

public partial class source_sistema_Mensajes_ErrorServidor : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["aspxerrorpath"] != null)
        {
            string error = Request.QueryString["aspxerrorpath"];
        }

        if (!IsPostBack)
        {
            LoadError(Server.GetLastError());
        }
    }

    protected void LoadError(Exception objError)
    {
        if (objError != null)
        {
            StringBuilder lasterror = new StringBuilder();

            if (objError.Message != null)
            {
                lasterror.AppendLine("Message:");
                lasterror.AppendLine(objError.Message);
                lasterror.AppendLine();
            }

            if (objError.InnerException != null)
            {
                lasterror.AppendLine("InnerException:");
                lasterror.AppendLine(objError.InnerException.ToString());
                lasterror.AppendLine();
            }

            if (objError.Source != null)
            {
                lasterror.AppendLine("Source:");
                lasterror.AppendLine(objError.Source);
                lasterror.AppendLine();
            }

            if (objError.StackTrace != null)
            {
                lasterror.AppendLine("StackTrace:");
                lasterror.AppendLine(objError.StackTrace);
                lasterror.AppendLine();
            }

            ViewState.Add("LastError", lasterror.ToString());

            try
            {
                MailMessage msg = new MailMessage("admin_sgsst@licsu.com", "admin_sgsst@licsu.com");
                StringBuilder body = new StringBuilder();

                body.AppendLine("An unexcepted error has occurred.");
                body.AppendLine();

                body.AppendLine(ViewState["LastError"].ToString());

                msg.Subject = "Error";
                msg.Body = body.ToString();
                msg.IsBodyHtml = false;

                // se define el smtp
                SmtpClient smtp = new SmtpClient()
                {
                    Host = "webmail.licsu.com",
                    Port = 25,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential("admin_sgsst@licsu.com", "2Ijjh54_"),
                    EnableSsl = false
                };

                smtp.Send(msg);
                msg.Dispose();
            }
            catch { }
 

        }
    }
}