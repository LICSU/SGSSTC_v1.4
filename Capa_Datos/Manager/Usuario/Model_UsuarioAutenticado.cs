using System;
using System.Web.Security;

namespace Capa_Datos
{
    public class Model_UsuarioAutenticado
    {
        private int usuarioID;
        private int empresaID;
        private int sucursalID;
        private int rolID;

        public int UsuarioID
        {
            get { return usuarioID; }
            set { usuarioID = value; }
        }
        public int EmpresaID
        {
            get { return empresaID; }
            set { empresaID = value; }
        }
        public int SucursalID
        {
            get { return sucursalID; }
            set { sucursalID = value; }
        }
        public int RolID
        {
            get { return rolID; }
            set { rolID = value; }
        }

        public Model_UsuarioAutenticado(FormsIdentity fIdentity)
        {
            string[] usuarioData = new string[4];
            usuarioData = fIdentity.Ticket.Name.Split('|');
            RolID = Convert.ToInt32(usuarioData[1]);

            if (RolID == 1)
            {
                UsuarioID = Convert.ToInt32(usuarioData[0]);
                RolID = Convert.ToInt32(usuarioData[1]);
            }
            else
            {
                UsuarioID = Convert.ToInt32(usuarioData[0]);
                RolID = Convert.ToInt32(usuarioData[1]);
                EmpresaID = Convert.ToInt32(usuarioData[2]);
                SucursalID = Convert.ToInt32(usuarioData[3]);
            }
        }

        public static Model_UsuarioSistema ValidarObjUsuario(Model_UsuarioAutenticado _autenticado)
        {
            if (_autenticado.RolID == 1)
            {
                return new Model_UsuarioSistema(_autenticado.UsuarioID, _autenticado.RolID);
            }
            else
            {
                return new Model_UsuarioSistema(_autenticado.UsuarioID, _autenticado.RolID, _autenticado.EmpresaID, _autenticado.SucursalID);
            }
        }
    }
}
