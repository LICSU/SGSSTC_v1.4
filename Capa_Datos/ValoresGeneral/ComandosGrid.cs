namespace Capa_Datos
{
    public class ComandosGrid
    {
        private ComandosGrid(string value) { Value = value; }

        public string Value { get; set; }

        public static ComandosGrid Registrar { get { return new ComandosGrid("Registrar"); } }
        public static ComandosGrid Editar { get { return new ComandosGrid("Editar"); } }
        public static ComandosGrid Eliminar { get { return new ComandosGrid("Eliminar"); } }
        public static ComandosGrid Consultar { get { return new ComandosGrid("Consultar"); } }
        public static ComandosGrid AddReposo { get { return new ComandosGrid("AddReposo"); } }
        public static ComandosGrid Imprimir { get { return new ComandosGrid("Imprimir"); } }
        public static ComandosGrid Comunicado { get { return new ComandosGrid("Comunicado"); } }
        public static ComandosGrid Upload { get { return new ComandosGrid("Upload"); } }
        public static ComandosGrid Scan { get { return new ComandosGrid("Scan"); } }
        public static ComandosGrid ConsultaMedica { get { return new ComandosGrid("ConsultaMedica"); } }
        public static ComandosGrid Asistencia { get { return new ComandosGrid("Asistencia"); } }


        public static ComandosGrid Gestion_Entrega { get { return new ComandosGrid("Entrega de equipos"); } }
        public static ComandosGrid Gestion_Capacitacion { get { return new ComandosGrid("Capacitacion"); } }
        public static ComandosGrid Gestion_Jornada { get { return new ComandosGrid("Jornadas Examenes Laborales"); } }
        public static ComandosGrid Gestion_Recreativa { get { return new ComandosGrid("Actividades Recreativas"); } }


    }
}
