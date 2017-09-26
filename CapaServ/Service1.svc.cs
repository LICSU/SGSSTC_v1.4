using System;
using Capa_Datos;
using System.Threading;
using System.Collections.Generic;

namespace CapaServ
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service1 : IService1
    {
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }


        public string MsjAsync()
        {
            Thread.Sleep(5000);
            return "se guardo los registros";
        }

        public Boolean add_Riesgos_Default(string act1, string act2, string act3, string id_sucursal, Model_UsuarioSistema ObjUsuario)
        {
            String[] valores = {
                ""+act1,
                ""+act2,
                ""+act3,
                ""+id_sucursal
            };

            if (CRUD.Add_Riesgos_Sucursal(ObjUsuario, valores))
            {
                return add_NormasSucursal( act1, act2, act3, id_sucursal, ObjUsuario);
            }
            else
            {
                return false;
            }

        }

        public Boolean add_NormasSucursal(string act1, string act2, string act3, string id_sucursal, Model_UsuarioSistema ObjUsuario)
        {
            String[] valores = {
                ""+act1,
                ""+act2,
                ""+act3,
                ""+id_sucursal
            };

            if (CRUD.Add_Normas_Sucursal(ObjUsuario, valores))
            {
                return add_MedidasSucursal( id_sucursal,  ObjUsuario);
            }
            else
            {
                return false;
            }
        }

        public Boolean add_MedidasSucursal(string id_sucursal, Model_UsuarioSistema ObjUsuario)
        {
            if (CRUD.Add_Medidas_Sucursal(ObjUsuario, Convert.ToInt32(id_sucursal)))
            {
                string empresa = "", correo = "";
                var _sucursal = Getter.Sucursal(Convert.ToInt32(id_sucursal));

                List<empresa> data_empresa = Getter.EmpresaEmail(Convert.ToInt32(_sucursal.id_empresa));
                foreach (var datos in data_empresa)
                {
                    empresa = datos.nombre;
                    correo = datos.email;
                }
                Utilidades.enviarCorreoMatriz(correo, empresa, _sucursal.nombre);
                return true;
            }
            else
            {
                return false;
            }

        }

    }
}
