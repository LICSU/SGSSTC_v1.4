//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Capa_Datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class perfil_medico
    {
        public int id_perfil_medico { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public Nullable<int> id_empresa { get; set; }
        public Nullable<int> id_cargo { get; set; }
        public string ruta { get; set; }
    
        public virtual perfil_cargo perfil_cargo { get; set; }
    }
}
