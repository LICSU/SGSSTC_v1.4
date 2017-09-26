using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SGSST.Services
{

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WS_Trabajador : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }

        [WebMethod]
        public List<string> SearchTrabajador(string prefixText, int count, string contextKey)
        {
            GrupoLiEntities _contexto = new GrupoLiEntities();
            int IdSucursal = Convert.ToInt32(contextKey);

            var Consulta = (
                from c in _contexto.trabajador
                where (
                c.puesto_trabajo.area.sucursal.id_sucursal == IdSucursal &&
                (c.primer_nombre.Contains(prefixText) || c.primer_apellido.Contains(prefixText)))
                select new
                {
                    c.id_puesto_trabajo,
                    c.id_trabajador,
                    nombre = c.primer_nombre + " " + c.primer_apellido + " " + c.cedula
                }).ToList();


            List<string> listTrabajadores = new List<string>();

            foreach (var item in Consulta)
            {
                listTrabajadores.Add(item.nombre);
            }

            return listTrabajadores;
        }

        [WebMethod]

        public string[] GetCompletionList(string prefixText, int count, string contextKey)
        {
            GrupoLiEntities _contexto = new GrupoLiEntities();
            int IdSucursal = Convert.ToInt32(contextKey);

            var Consulta = (
                from c in _contexto.trabajador
                where (
                c.puesto_trabajo.area.sucursal.id_sucursal == IdSucursal &&
                (c.primer_nombre.Contains(prefixText) || c.primer_apellido.Contains(prefixText)))
                select new
                {
                    c.id_puesto_trabajo,
                    c.id_trabajador,
                    nombre = c.primer_nombre + " " + c.primer_apellido + " " + c.cedula
                }).ToList();


            List<string> listTrabajadores = new List<string>();

            foreach (var item in Consulta)
            {
                listTrabajadores.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(item.nombre, item.id_trabajador.ToString()));
            }

            return listTrabajadores.ToArray();
        }

    }
}
