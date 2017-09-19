namespace Capa_Datos
{
    public class Model_UsuarioSistema
    {
        private bool error;
        private int rol;
        private int id_empresa;
        private int id_usuario;
        private int id_sucursal;

        public bool Error
        {
            get { return error; }
            set { error = value; }
        }
        public int Rol
        {
            get { return rol; }
            set { rol = value; }
        }
        public int Id_empresa
        {
            get { return id_empresa; }
            set { id_empresa = value; }
        }
        public int Id_usuario
        {
            get { return id_usuario; }
            set { id_usuario = value; }
        }
        public int Id_sucursal
        {
            get { return id_sucursal; }
            set { id_sucursal = value; }
        }

        public Model_UsuarioSistema()
        {
        }
        public Model_UsuarioSistema(int _Usuario, int _Rol)
        {
            inicializarObjetos();
            Rol = _Rol;
            id_usuario = _Usuario;
        }
        public Model_UsuarioSistema(int _Usuario, int _Rol, int _id_empresa, int _id_sucursal)
        {
            inicializarObjetos();
            Rol = _Rol;
            Id_empresa = _id_empresa;
            id_usuario = _Usuario;
            id_sucursal = _id_sucursal;
        }

        public void inicializarObjetos()
        {
            Error = false;
        }

        public bool isAdm_Grupoli()
        {
            if (Rol == 1)
            {
                return true;
            }
            return false;
        }
        public bool isAdm_Empresa()
        {
            if (Rol == 2)
            {
                return true;
            }
            return false;
        }
        public bool isAdm_Sucursal()
        {
            if (Rol == 3)
            {
                return true;
            }
            return false;
        }
        public bool isAdmEmp_DptoSeg()
        {
            if (Rol == 4)
            {
                return true;
            }
            return false;
        }
        public bool isAdmEmp_DptoSalud()
        {
            if (Rol == 6)
            {
                return true;
            }
            return false;
        }
        public bool isAdm_SucSeg()
        {
            if (Rol == 5)
            {
                return true;
            }
            return false;
        }
        public bool isAdm_SucSalud()
        {
            if (Rol == 7)
            {
                return true;
            }
            return false;
        }
        public bool isResponsable()
        {
            if (Rol == 8)
            {
                return true;
            }
            return false;
        }

    }
}
