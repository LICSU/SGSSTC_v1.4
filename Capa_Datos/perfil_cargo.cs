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
    
    public partial class perfil_cargo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public perfil_cargo()
        {
            this.trabajador = new HashSet<trabajador>();
        }
    
        public int id_perfil_cargo { get; set; }
        public string descripcion { get; set; }
        public Nullable<int> id_cno { get; set; }
        public Nullable<int> id_empresa { get; set; }
        public string nombre { get; set; }
    
        public virtual cno cno { get; set; }
        public virtual empresa empresa { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<trabajador> trabajador { get; set; }
    }
}
