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
    
    public partial class empresa_itemdivision
    {
        public int id_emp_itemdiv { get; set; }
        public Nullable<int> id_empresa { get; set; }
        public Nullable<int> id_clase_ciiu { get; set; }
        public string num_actividad { get; set; }
    
        public virtual claseCiiu claseCiiu { get; set; }
        public virtual empresa empresa { get; set; }
    }
}
