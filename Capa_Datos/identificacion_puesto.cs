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
    
    public partial class identificacion_puesto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public identificacion_puesto()
        {
            this.evaluacion_riesgo = new HashSet<evaluacion_riesgo>();
        }
    
        public int id_ide_puesto { get; set; }
        public Nullable<int> id_identificacion { get; set; }
        public Nullable<int> id_puesto { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<evaluacion_riesgo> evaluacion_riesgo { get; set; }
        public virtual identificacion_peligro identificacion_peligro { get; set; }
        public virtual puesto_trabajo puesto_trabajo { get; set; }
    }
}
