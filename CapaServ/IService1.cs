using System;
using System.Runtime.Serialization;
using System.ServiceModel;
using Capa_Datos;

namespace CapaServ
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService1
    {

        [OperationContract]
        string GetData(int value);


        [OperationContract]
        string MsjAsync();

        [OperationContract]
        Boolean add_Riesgos_Default(string act1, string act2, string act3, string id_sucursal, Model_UsuarioSistema ObjUsuario);

        [OperationContract]
        Boolean add_NormasSucursal(string act1, string act2, string act3, string id_sucursal, Model_UsuarioSistema ObjUsuario);

        [OperationContract]
        Boolean add_MedidasSucursal(string id_sucursal, Model_UsuarioSistema ObjUsuario);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        // TODO: agregue aquí sus operaciones de servicio
    }


    // Utilice un contrato de datos, como se ilustra en el ejemplo siguiente, para agregar tipos compuestos a las operaciones de servicio.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }

}
