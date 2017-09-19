namespace Capa_Datos
{
    public class TipoDocumento
    {
        private TipoDocumento(string value) { Value = value; }

        public string Value { get; set; }

        public static TipoDocumento Analisis_Vulnerabilidad { get { return new TipoDocumento("AnalisisVulnerabilidad"); } }
        public static TipoDocumento Auto_Evaluacion { get { return new TipoDocumento("AutoEvaluacion"); } }
    }
}
