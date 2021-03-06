﻿using System;
using Capa_Datos;
using System.Threading;
using System.Collections.Generic;
using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Norma;
using Capa_Datos.Manager.Medidas;
using Capa_Datos.Manager.Riesgos;

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

        public Boolean add_Riesgos_Default(string act1, string act2, string act3, string id_sucursal)
        {
            String[] valores = {
                ""+act1,
                ""+act2,
                ""+act3,
                ""+id_sucursal
            };

            if (Mgr_Riesgos.Add_Riesgos_Sucursal(valores))
            {
                return add_NormasSucursal( act1, act2, act3, id_sucursal);
            }
            else
            {
                return false;
            }

        }

        public Boolean add_NormasSucursal(string act1, string act2, string act3, string id_sucursal )
        {
            String[] valores = {
                ""+act1,
                ""+act2,
                ""+act3,
                ""+id_sucursal
            };

            if (Mgr_Norma.Add_Normas_Sucursal(valores))
            {
                return add_MedidasSucursal( id_sucursal);
            }
            else
            {
                return false;
            }
        }

        public Boolean add_MedidasSucursal(string id_sucursal)
        {
            if (Mgr_Medidas.Add_Medidas_Sucursal(Convert.ToInt32(id_sucursal)))
            {
                string empresa = "", correo = "";
                var _sucursal = Mgr_Sucursal.Get_Sucursal(Convert.ToInt32(id_sucursal));

                List<empresa> data_empresa = Mgr_Empresa.Get_EmpresaEmail(Convert.ToInt32(_sucursal.id_empresa));
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
