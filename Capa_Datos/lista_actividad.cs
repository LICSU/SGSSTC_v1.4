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
    
    public partial class lista_actividad
    {
        public int id_lista { get; set; }
        public Nullable<int> id_sucursal { get; set; }
        public string actividad { get; set; }
        public string estatus { get; set; }
        public Nullable<int> anho { get; set; }
        public string fase { get; set; }
        public string link { get; set; }
    
        public virtual sucursal sucursal { get; set; }
    }
}
