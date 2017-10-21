using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using System;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Diagnostics;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Script.Services;
using System.IO;
using System.Linq;
using Capa_Datos.Manager.Usuario;

namespace Capa_Datos
{
    public class Utilidades
    {
        Modal objModal = new Modal();

        public static string FormatearPalabra(string palabra)
        {
            palabra = Regex.Replace(palabra, @"[^0-9A-Za-z]", "", RegexOptions.None);

            return palabra;
        }

        public static string GuardarArchivo(FileUpload archivo, string nombre, string ruta)
        {
            nombre = FormatearPalabra(nombre);
            string strRuta = "";
            if (archivo.HasFile)
            {
                string extension = "." + archivo.FileName.Substring(archivo.FileName.LastIndexOf('.') + 1).ToLower();
                string nombreArchivo = nombre + extension;
                strRuta = ruta + nombreArchivo;
                archivo.SaveAs(System.Web.HttpContext.Current.Server.MapPath(strRuta));
            }

            return strRuta;
        }
        public static string GuardarImagen(FileUpload archivo, string nombre, string ruta)
        {
            nombre = FormatearPalabra(nombre);
            string strRuta = "";
            if (archivo.HasFile)
            {
                Guid uid = Guid.NewGuid();

                string extension = "." + archivo.FileName.Substring(archivo.FileName.LastIndexOf('.') + 1).ToLower();
                string nombreArchivo = nombre + extension;
                strRuta = ruta + nombreArchivo;

                string SaveLocation = HttpContext.Current.Server.MapPath(strRuta);

                try
                {
                    string fileExtention = archivo.PostedFile.ContentType;
                    int fileLenght = archivo.PostedFile.ContentLength;

                    if (fileExtention == "image/png" || fileExtention == "image/jpeg" || fileExtention == "image/x-png" || fileExtention == "image / jpg")
                    {
                        if (fileLenght <= 1048576)
                        {
                            Bitmap bmpPostedImage = new Bitmap(archivo.PostedFile.InputStream);
                            System.Drawing.Image objImage = ScaleImage(bmpPostedImage, 81);
                            // Saving image in jpeg format
                            objImage.Save(SaveLocation, ImageFormat.Jpeg);
                            return strRuta;
                        }
                        else
                        {
                            return "ERR- La imagen debe pesar menor a 1 MB.";
                        }
                    }
                    else
                    {
                        return "ERR- Formato Inválido!";
                    }
                }
                catch (Exception e)
                {
                    return "ERR- Error de carga de la imagen (" + e + ")";
                }
            }

            return strRuta;
        }
        public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxHeight)
        {
            var ratio = (double)maxHeight / image.Height;
            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);
            var newImage = new Bitmap(128, 128);
            using (var g = Graphics.FromImage(newImage))
            {
                g.DrawImage(image, 0, 0, 128, 128);
            }
            return newImage;
        }
        public static string GuardarArchivo(HttpPostedFile archivo, string nombre, string ruta)
        {
            string strRuta = "";
            DateTime fechaActual = DateTime.Now;
            string extension = "." + archivo.FileName.Substring(archivo.FileName.LastIndexOf('.') + 1).ToLower();
            string nombreArchivo = nombre + fechaActual.ToString("dd-MM-yyy") + extension;
            strRuta = ruta + nombreArchivo;
            archivo.SaveAs(System.Web.HttpContext.Current.Server.MapPath(strRuta));

            return strRuta;
        }

        public string cifrarCadena(string mensaje)
        {
            string result = string.Empty;
            byte[] encryted = Encoding.Unicode.GetBytes(mensaje);
            result = Convert.ToBase64String(encryted);
            return result;
        }
        public int descifrarCadena(string mensaje)
        {
            string result = string.Empty;
            byte[] decryted = Convert.FromBase64String(mensaje);
            result = Encoding.Unicode.GetString(decryted);
            return Convert.ToInt32(result);
        }
        public string descifrarCadena2(string mensaje)
        {
            string result = string.Empty;
            byte[] decryted = Convert.FromBase64String(mensaje);
            result = Encoding.Unicode.GetString(decryted);
            return result;
        }

        public static Model_UsuarioSistema ValidarSesion(FormsIdentity UsuarioActual, Page _page)
        {
            Model_UsuarioSistema ObjUsuario = null;

            if (Mgr_Usuario.Get_ExisteUsuario(UsuarioActual))
            {
                ObjUsuario = Model_UsuarioAutenticado.ValidarObjUsuario(new Model_UsuarioAutenticado(UsuarioActual));
            }
            else
            {
                _page.Session.Abandon();
                string sHttpCookie = FormsAuthentication.FormsCookieName;
                if (_page.Request.Cookies[sHttpCookie] != null)
                {
                    _page.Response.Cookies[sHttpCookie].Expires = DateTime.Now.AddDays(-1);
                }
                _page.Response.Cookies.Add(new System.Web.HttpCookie("ASP.NET_SessionId", ""));
                _page.Response.Redirect("~/Default.aspx");
            }

            return ObjUsuario;
        }
        public static void LogMessage(string msg)
        {
            Debug.WriteLine("********************************************");
            Debug.WriteLine(msg);
            Debug.WriteLine("********************************************");
        }



        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchTrabajador(string prefixText, int count, int IdSucursal, ref int IdTrabajador, int IdPuesto = 0)
        {
            GrupoLiEntities _contexto = new GrupoLiEntities();

            var Consulta = (
                from c in _contexto.trabajador
                where (
                c.puesto_trabajo.area.sucursal.id_sucursal == IdSucursal &&
                (c.primer_nombre.Contains(prefixText) || c.primer_apellido.Contains(prefixText)))
                select new { c.id_puesto_trabajo, c.id_trabajador, nombre = c.primer_nombre + " " + c.primer_apellido +" "+c.cedula }).ToList();

            if (IdPuesto != 0)
            {
                Consulta = Consulta.Where(x => x.id_puesto_trabajo == IdPuesto).ToList();
            }

            List<string> listTrabajadores = new List<string>();

            foreach (var item in Consulta)
            {
                IdTrabajador = Convert.ToInt32(item.id_trabajador);
                listTrabajadores.Add(item.nombre);
            }

            return listTrabajadores;
        }

        #region Enviar registro de Sucursal
        public static bool enviarSucursal(string destino, string empresa, string sucursal, string login, string clave)
        {
            string url = "~/source/archivos/plantillasCorreo/enviarSucursal.html";
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("grupoliacademia@gmail.com", "Administrador", Encoding.UTF8);
                mail.IsBodyHtml = true;
                mail.Subject = "Registro de Sucursal";
                mail.To.Add(destino);
                using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath(url)))
                {
                    StringBuilder sb = new StringBuilder();
                    string mensaje = reader.ReadToEnd();
                    sb.Append(mensaje);
                    sb.Replace("[EMPRESA]", empresa);
                    sb.Replace("[SUCURSAL]", sucursal);
                    sb.Replace("[LOGIN]", login);
                    sb.Replace("[CLAVE]", clave);
                    mail.Body = sb.ToString();
                }
                return enviarCorreo(mail);
            }
            catch 
            {
                return false;
            }
        }

        public static bool enviarCorreoMatriz(string destino, string empresa, string sucursal)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("grupoliacademia@gmail.com", "Administrador", Encoding.UTF8);
                mail.IsBodyHtml = true;
                mail.Subject = "Generacion de Matrices (Legal y de Riesgos)";
                mail.To.Add(destino);

                StringBuilder sb = new StringBuilder();
                sb.Append("Las matrices (Legal y de riesgos) fueron generadas exitosamente! para la Sucursal "+ sucursal+" de la Empresa "+ empresa);
                mail.Body = sb.ToString();

                return enviarCorreo(mail);
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region Enviar registro de Empresa
        public static bool enviarEmpresa(string destino, string empresa, string login, string clave)
        {
            string url = "~/source/archivos/plantillasCorreo/enviarEmpresa.html";
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("grupoliacademia@gmail.com", "Administrador", Encoding.UTF8);
                mail.IsBodyHtml = true;
                mail.Subject = "Registro de Empresa";
                mail.To.Add(destino);
                using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath(url)))
                {
                    StringBuilder sb = new StringBuilder();
                    string mensaje = reader.ReadToEnd();
                    sb.Append(mensaje);
                    sb.Replace("[EMPRESA]", empresa);
                    sb.Replace("[LOGIN]", login);
                    sb.Replace("[CLAVE]", clave);
                    mail.Body = sb.ToString();
                }
                return enviarCorreo(mail);
            }
            catch 
            {
                return false;
            }
        }
        #endregion

        #region EnviarRecuperacion
        public static bool enviarRecuperacion(string destino, string usuario, string login, string clave)
        {
            string url = "~/source/archivos/plantillasCorreo/recuperacionClave.html";
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("grupoliacademia@gmail.com", "Administrador", Encoding.UTF8);
                mail.IsBodyHtml = true;
                mail.Subject = "Recuperación de Contraseña";
                mail.To.Add(destino);
                using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath(url)))
                {
                    StringBuilder sb = new StringBuilder();
                    string mensaje = reader.ReadToEnd();
                    sb.Append(mensaje);
                    sb.Replace("[USUARIO]", usuario);
                    sb.Replace("[LOGIN]", login);
                    sb.Replace("[CLAVE]", clave);
                    mail.Body = sb.ToString();
                }
                return enviarCorreo(mail);
            }
            catch 
            {
                return false;
            }
        }
        #endregion

        #region enviarCorreo
        public static bool enviarCorreo(MailMessage mail)
        {
            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                SmtpServer.Port = 587;
                SmtpServer.Credentials = new NetworkCredential("grupoliacademia@gmail.com", "GrupoLi_1234");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                mail.Dispose();
                return true;
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region registro de Usuario
        public static bool registroUsuario(string destino, string empresa, string trabajador, string login, string clave)
        {
            string url = "~/source/archivos/plantillasCorreo/registroUsuario.html";
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("grupoliacademia@gmail.com", "Administrador", Encoding.UTF8);
                mail.IsBodyHtml = true;
                mail.Subject = "Registro de Usuario";
                mail.To.Add(destino);
                using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath(url)))
                {
                    StringBuilder sb = new StringBuilder();
                    string mensaje = reader.ReadToEnd();
                    sb.Append(mensaje);
                    sb.Replace("[EMPRESA]", empresa);
                    sb.Replace("[TRABAJADOR]", trabajador);
                    sb.Replace("[LOGIN]", login);
                    sb.Replace("[CLAVE]", clave);
                    mail.Body = sb.ToString();
                }
                return enviarCorreo(mail);
            }
            catch 
            {
                return false;
            }
        }
        #endregion

        public static Boolean EmailValido(String email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        public static bool VerificarUsuario(int rol, string url)
        {
            if (rol > 8)
            { 
                //Comparar paginas
                string[] partes = url.Split('/');
                int tamanho = partes.Length - 1;
                if (!partes[tamanho].Equals("index.aspx"))
                {
                    return true;
                }
            }
            return false;
        }
    }
}
