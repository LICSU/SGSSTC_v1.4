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
    
    public partial class plan_trabajo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public plan_trabajo()
        {
            this.obligacion = new HashSet<obligacion>();
        }
    
        public int id_plan_trabajo { get; set; }
        public string nombre { get; set; }
        public string objetivos { get; set; }
        public Nullable<int> anho { get; set; }
        public Nullable<int> id_responsable { get; set; }
        public Nullable<int> semana_ini { get; set; }
        public Nullable<int> semana_fin { get; set; }
        public Nullable<int> recursos_aprobados { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<obligacion> obligacion { get; set; }
        public virtual usuario usuario { get; set; }
    }
}
