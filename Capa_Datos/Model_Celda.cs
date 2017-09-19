namespace Capa_Datos
{
    public class Model_Celda
    {
        private int negrita;
        private string tamanho;
        private string alinear;
        private string borde;
        private int colspan;
        private int rowspan;
        private string color;
        private string texto;

        public int Negrita
        {
            get { return negrita; }
            set { negrita = value; }
        }
        public string Tamanho
        {
            get { return tamanho; }
            set { tamanho = value; }
        }
        public string Alinear
        {
            get { return alinear; }
            set { alinear = value; }
        }
        public string Borde
        {
            get { return borde; }
            set { borde = value; }
        }
        public int Colspan
        {
            get { return colspan; }
            set { colspan = value; }
        }
        public int Rowspan
        {
            get { return rowspan; }
            set { rowspan = value; }
        }
        public string Color
        {
            get { return color; }
            set { color = value; }
        }
        public string Texto
        {
            get { return texto; }
            set { texto = value; }
        }

        public Model_Celda(
            int _negrita = 0, string _tamanho = "", string _alinear = "", string _borde = "", int _colspan = 0,
            int _rowspan = 0, string _color = "", string _texto = "")
        {
            negrita = _negrita;
            tamanho = _tamanho;
            alinear = _alinear;
            borde = _borde;
            colspan = _colspan;
            rowspan = _rowspan;
            color = _color;
            texto = _texto;
        }


    }
}
