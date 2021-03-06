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
    
    public partial class obligacion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public obligacion()
        {
            this.soporte = new HashSet<soporte>();
        }
    
        public int id_obligacion { get; set; }
        public Nullable<int> id_medida_sucursal { get; set; }
        public Nullable<System.DateTime> fecha_creacion { get; set; }
        public Nullable<System.DateTime> fecha_entrega { get; set; }
        public Nullable<int> id_responsable { get; set; }
        public int id_categorias { get; set; }
        public string prioridad { get; set; }
        public int id_frecuencia_con { get; set; }
        public string descripcion { get; set; }
        public string acciones { get; set; }
        public string estatus_obl { get; set; }
        public Nullable<int> id_identificacion_peligro { get; set; }
        public Nullable<int> id_actividad { get; set; }
    
        public virtual categoria categoria { get; set; }
        public virtual frecuencia_control frecuencia_control { get; set; }
        public virtual identificacion_peligro identificacion_peligro { get; set; }
        public virtual medida_sucursal medida_sucursal { get; set; }
        public virtual plan_trabajo plan_trabajo { get; set; }
        public virtual usuario usuario { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<soporte> soporte { get; set; }
    }
}
