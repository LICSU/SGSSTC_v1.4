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
    
    public partial class trabajador_estatus
    {
        public int id_trabajador_estatus { get; set; }
        public Nullable<int> id_estatus { get; set; }
        public Nullable<int> id_trabajador { get; set; }
        public Nullable<System.DateTime> fecha_registro { get; set; }
        public string motivo { get; set; }
        public Nullable<int> id_enfermedad { get; set; }
        public Nullable<int> id_sistema { get; set; }
        public Nullable<int> dias_reposo { get; set; }
        public Nullable<System.DateTime> fecha_constancia { get; set; }
        public string url_constancia { get; set; }
        public string tpo_enfermedad { get; set; }
    
        public virtual enfermedad enfermedad { get; set; }
        public virtual estatus estatus { get; set; }
        public virtual sistema sistema { get; set; }
        public virtual trabajador trabajador { get; set; }
    }
}
