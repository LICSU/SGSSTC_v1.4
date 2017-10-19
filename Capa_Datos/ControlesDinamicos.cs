using Capa_Datos.Manager.Empresa;
using Capa_Datos.Manager.Trabajador;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Capa_Datos
{
    public class ControlesDinamicos
    {
        public static void CrearLiteral(string etiqueta, Panel _panel)
        {
            Literal miLiteral = new Literal();
            miLiteral.Text = etiqueta;
            _panel.Controls.Add(miLiteral);
        }

        public static void CrearRequiredFieldValidator(string _miControl, Panel _panel, string _ValidationGroup)
        {
            RequiredFieldValidator miRequiredFieldValidator;
            miRequiredFieldValidator = new RequiredFieldValidator();
            miRequiredFieldValidator.ErrorMessage = "<p>Campo Obligatorio!</p>";
            miRequiredFieldValidator.SetFocusOnError = true;
            miRequiredFieldValidator.Display = ValidatorDisplay.Dynamic;
            miRequiredFieldValidator.ForeColor = ColorTranslator.FromHtml("#B50128");
            miRequiredFieldValidator.Font.Size = 10;
            miRequiredFieldValidator.Font.Bold = true;
            miRequiredFieldValidator.ControlToValidate = _miControl;
            miRequiredFieldValidator.ValidationGroup = _ValidationGroup;
            _panel.Controls.Add(miRequiredFieldValidator);
        }

        public static void CrearTextbox(string id, Panel _panel, TextBoxMode _TextBoxMode)
        {
            TextBox miTextBox;
            miTextBox = new TextBox();
            miTextBox.ID = id;
            miTextBox.CssClass = "form-control";
            miTextBox.TextMode = _TextBoxMode;

            if (_TextBoxMode == TextBoxMode.MultiLine)
            {
                miTextBox.Rows = 3;
            }

            _panel.Controls.Add(miTextBox);
        }

        public static void CrearButton(string id, Panel _panel, EventHandler _Metodo, string _texto)
        {
            Button miButton;
            miButton = new Button();
            miButton.ID = id;
            miButton.Text = _texto;
            miButton.Click += new EventHandler(_Metodo);

            _panel.Controls.Add(miButton);
        }

        public static void CrearButtonModal(string id, Panel _panel, EventHandler _Metodo, string _texto, string _Modal)
        {
            Button miButton;
            miButton = new Button();
            miButton.ID = id;
            miButton.Text = _texto;
            miButton.Click += new EventHandler(_Metodo);
            miButton.Attributes.Add("data-toggle", "modal");
            miButton.Attributes.Add("data-target", "#" + _Modal);
            miButton.Attributes.Add("ClientIDMode", "Static");
            miButton.CssClass = "btnLk";

            _panel.Controls.Add(miButton);
        }

        public static void CrearLinkButton(string id, Panel _panel, EventHandler _Metodo, string _texto)
        {
            LinkButton miLinkButton;
            miLinkButton = new LinkButton();
            miLinkButton.ID = id;
            miLinkButton.Text = _texto;
            miLinkButton.Click += _Metodo;

            _panel.Controls.Add(miLinkButton);
        }

        public static void CrearHyperLink(string id, Panel _panel, string _ruta, string _texto)
        {
            HyperLink miHyperLink;
            miHyperLink = new HyperLink();
            miHyperLink.ID = id;
            miHyperLink.Text = _texto;
            miHyperLink.NavigateUrl += _ruta;
            miHyperLink.Target = "_blank";

            _panel.Controls.Add(miHyperLink);
        }

        public static void CrearDropDownList(string id, Panel _panel, DropDownList _DropDownList)
        {
            _DropDownList = new DropDownList();
            _DropDownList.ID = id;
            _DropDownList.CssClass = "form-control";
        }

        public static void Llenar_DropdownList_Inspecciones(DropDownList miDropDownList)
        {
            miDropDownList.Items.Insert(0, new ListItem("Seleccione un Valor", ""));
            miDropDownList.Items.Insert(1, new ListItem("Extintores", "Extintores"));
            miDropDownList.Items.Insert(2, new ListItem("Areas", "Areas"));
            miDropDownList.Items.Insert(3, new ListItem("Medios de Escape", "MediosEscape"));
            miDropDownList.Items.Insert(4, new ListItem("Puesto de Trabajo Operativo", "PuestoOperativo"));
            miDropDownList.Items.Insert(5, new ListItem("Puesto de Trabajo Administrativo", "PuestoAdministrativo"));
            miDropDownList.Items.Insert(6, new ListItem("Inspección de Equipos de Protección", "InspeccionEpp"));
        }

        public static void Crear_Tabla_InspeccionEpp(Panel _panel, DropDownList ddlArea, DropDownList ddlPuesto)
        {
            TextBox _textbox;
            RadioButton _radio;

            Table _table;
            _table = new Table();
            _table.CssClass = "table";
            TableHeaderRow _header_row = new TableHeaderRow();
            TableHeaderCell _header_cell = new TableHeaderCell();

            _header_cell.Text = "Area: " + ddlArea.SelectedItem.Text;
            _header_cell.ColumnSpan = 6;
            _header_row.Controls.Add(_header_cell);
            _table.Controls.Add(_header_row);

            _header_row = new TableHeaderRow();
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "Caracteristica a Inspeccionar";
            _header_cell.RowSpan = 2;
            _header_row.Controls.Add(_header_cell);
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "Sector/Actividad/Material de Trabajo";
            _header_cell.RowSpan = 2;
            _header_row.Controls.Add(_header_cell);
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "Existencia";
            _header_cell.ColumnSpan = 2;
            _header_row.Controls.Add(_header_cell);
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "Estado";
            _header_cell.CssClass = "text-center";
            _header_cell.ColumnSpan = 2;
            _header_row.Controls.Add(_header_cell);
            _header_row.CssClass = "bg-aqua color-palette";
            _table.Controls.Add(_header_row);

            _header_row = new TableHeaderRow();
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "Si";
            _header_row.Controls.Add(_header_cell);
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "No";
            _header_row.Controls.Add(_header_cell);
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "Apto";
            _header_row.Controls.Add(_header_cell);
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "No Apto";
            _header_row.Controls.Add(_header_cell);
            _table.Controls.Add(_header_row);

            //Empezar a agregar de forma dinamica...
            List<Model_CEPP> epp_datos = Getter.Epp(Convert.ToInt32(ddlPuesto.SelectedValue));
            int cant = epp_datos.Count;
            TableCell _cell;
            _header_row = new TableHeaderRow();
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "EQUIPO DE PROTECCIÓN PERSONAL E.P.P";
            _header_cell.RowSpan = cant;
            _header_row.Controls.Add(_header_cell);
            int i = 0;
            foreach (var dato in epp_datos)
            {
                _cell = new TableCell();
                _cell.Text = dato.nombre;
                _header_row.Controls.Add(_cell);
                _cell = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "eppSi" + i;
                _radio.GroupName = "epp" + i;
                _cell.Controls.Add(_radio);
                _header_row.Controls.Add(_cell);
                _cell = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "eppNo" + i;
                _radio.GroupName = "epp" + i;
                _cell.Controls.Add(_radio);
                _header_row.Controls.Add(_cell);
                _cell = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "eppApto" + i;
                _radio.GroupName = "eppAp" + i;
                _cell.Controls.Add(_radio);
                _header_row.Controls.Add(_cell);
                _cell = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "eppNoApto" + i;
                _radio.GroupName = "eppAp" + i;
                _cell.Controls.Add(_radio);
                _header_row.Controls.Add(_cell);
                _table.Controls.Add(_header_row);
                _header_row = new TableHeaderRow();
                i++;
            }

            //Senalizaciones..
            i = 0;
            List<Model_CEPP> tipo_epp_datos = Getter.TipoEpp(Convert.ToInt32(ddlPuesto.SelectedValue));
            int cant_tipo = tipo_epp_datos.Count;
            _header_row = new TableHeaderRow();
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "SEÑALIZACIÓN O AVISOS DE LOS E.P.P";
            _header_cell.RowSpan = cant_tipo;
            _header_row.Controls.Add(_header_cell);
            foreach (var dato in tipo_epp_datos)
            {
                _cell = new TableCell();
                _cell.Text = dato.nombre;
                _header_row.Controls.Add(_cell);
                _cell = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "tpoSi" + i;
                _radio.GroupName = "tpo" + i;
                _cell.Controls.Add(_radio);
                _header_row.Controls.Add(_cell);
                _cell = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "tpoNo" + i;
                _radio.GroupName = "tpo" + i;
                _cell.Controls.Add(_radio);
                _header_row.Controls.Add(_cell);
                _cell = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "tpoApto" + i;
                _radio.GroupName = "tpoAp" + i;
                _cell.Controls.Add(_radio);
                _header_row.Controls.Add(_cell);
                _cell = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "tpoNoApto" + i;
                _radio.GroupName = "tpoAp" + i;
                _cell.Controls.Add(_radio);
                _header_row.Controls.Add(_cell);
                _table.Controls.Add(_header_row);
                _header_row = new TableHeaderRow();
                i++;
            }

            //EPP Faltantes...
            _header_row = new TableHeaderRow();
            _header_row.Visible = false;
            _header_row.ID = "EPPFaltante";
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "EQUIPOS DE PROTECCIÓN PERSONAL FALTANTES";
            _header_row.Controls.Add(_header_cell);

            /* Crear Tabla de EPP*/
            _cell = new TableCell();
            _cell.ColumnSpan = 5;
            Table _table_epp = new Table();
            _table_epp.ID = "tblEPP";
            _cell.Controls.Add(_table_epp);
            _header_row.Controls.Add(_cell);
            _table.Controls.Add(_header_row);

            //Senalizacion Faltantes...
            _header_row = new TableHeaderRow();
            _header_row.Visible = false;
            _header_row.ID = "SenalFaltante";
            _header_cell = new TableHeaderCell();
            _header_cell.Text = "SEÑALIZACIÓN DE EPP FALTANTE";
            _header_row.Controls.Add(_header_cell);
            /* Crear Tabla de Senales Faltantes*/
            _cell = new TableCell();
            _cell.ColumnSpan = 5;
            _table_epp = new Table();
            _table_epp.ID = "tblSenal";
            _cell.Controls.Add(_table_epp);
            _header_row.Controls.Add(_cell);
            _table.Controls.Add(_header_row);

            //Observaciones y Firma..
            _header_row = new TableHeaderRow();
            _cell = new TableCell();
            _textbox = new TextBox();
            _textbox.ID = "txtObsGenerales";
            //_textbox.Text = ViewState["txtObsGenerales"].ToString();
            _textbox.CssClass = "form-control";
            _textbox.Attributes.Add("PlaceHolder", "Observaciones Generales");
            _textbox.TextMode = TextBoxMode.MultiLine;
            _textbox.Rows = 5;
            _cell.ColumnSpan = 2;
            _cell.Controls.Add(_textbox);
            _header_row.Controls.Add(_cell);
            _cell = new TableCell();
            _cell.Text = "Firma del Vigía:";
            _cell.ColumnSpan = 4;
            _header_row.Controls.Add(_cell);
            _table.Controls.Add(_header_row);

            _panel.Controls.Add(_table);

        }

        public static void calcularDif(WebControl myControl, Panel pnDatosA, Panel pnDatosB, Panel pnDatosC)
        {
            TextBox _textbox;
            Label _label;

            string idElemento = myControl.ID.ToString();
            string panel = idElemento.Substring(3, 1);
            string num_fila = idElemento.Substring(7, idElemento.Length - 7);

            if (panel == "A")
            {
                _label = (Label)pnDatosA.FindControl("lblACant" + num_fila);
                int cantidad = Convert.ToInt32(_label.Text.Trim());
                _textbox = (TextBox)pnDatosA.FindControl("txtAExi" + num_fila);
                int existencia = Convert.ToInt32(_textbox.Text.Trim());
                int diferencia = cantidad - existencia;
                if (diferencia < 0)
                {
                    diferencia = 0;
                    _textbox.Text = _label.Text;
                }
                _textbox = (TextBox)pnDatosA.FindControl("txtADif" + num_fila);
                _textbox.Text = "" + diferencia;
            }
            else if (panel == "B")
            {
                _label = (Label)pnDatosB.FindControl("lblBCant" + num_fila);
                int cantidad = Convert.ToInt32(_label.Text.Trim());
                _textbox = (TextBox)pnDatosB.FindControl("txtBExi" + num_fila);
                int existencia = Convert.ToInt32(_textbox.Text.Trim());
                int diferencia = cantidad - existencia;
                if (diferencia < 0)
                {
                    diferencia = 0;
                    _textbox.Text = _label.Text;
                }
                _textbox = (TextBox)pnDatosB.FindControl("txtBDif" + num_fila);
                _textbox.Text = "" + diferencia;
            }
            else 
            {
                _label = (Label)pnDatosC.FindControl("lblCCant" + num_fila);
                int cantidad = Convert.ToInt32(_label.Text.Trim());
                _textbox = (TextBox)pnDatosC.FindControl("txtCExi" + num_fila);
                int existencia = Convert.ToInt32(_textbox.Text.Trim());
                int diferencia = cantidad - existencia;
                if (diferencia < 0)
                {
                    diferencia = 0;
                    _textbox.Text = _label.Text;
                }
                _textbox = (TextBox)pnDatosC.FindControl("txtCDif" + num_fila);
                _textbox.Text = "" + diferencia;
            }
        }

        public static int[] GenerarResultados_InspeccionPuestos(RadioButton[] Radios)
        {
            int[] valores = { 0, 0 };

            #region ORGANIZACIÓN DE TRABAJO
            if (Radios[0].Checked) { valores[1]++; }
            if (Radios[1].Checked) { valores[0]++; }
            if (Radios[2].Checked) { valores[1]++; }
            if (Radios[3].Checked) { valores[0]++; }
            if (Radios[5].Checked) { valores[1]++; }
            if (Radios[5].Checked) { valores[0]++; }
            if (Radios[6].Checked) { valores[1]++; }
            if (Radios[7].Checked) { valores[0]++; }
            if (Radios[8].Checked) { valores[1]++; }
            if (Radios[9].Checked) { valores[0]++; }
            #endregion

            #region ASPECTO A EVALUAR DEL AMBIENTE
            if (Radios[10].Checked) { valores[1]++; }
            if (Radios[11].Checked) { valores[0]++; }
            if (Radios[12].Checked) { valores[1]++; }
            if (Radios[13].Checked) { valores[0]++; }
            if (Radios[14].Checked) { valores[1]++; }
            if (Radios[15].Checked) { valores[0]++; }
            if (Radios[16].Checked) { valores[1]++; }
            if (Radios[17].Checked) { valores[0]++; }
            if (Radios[18].Checked) { valores[1]++; }
            if (Radios[19].Checked) { valores[0]++; }
            if (Radios[20].Checked) { valores[1]++; }
            if (Radios[21].Checked) { valores[0]++; }
            if (Radios[22].Checked) { valores[1]++; }
            if (Radios[23].Checked) { valores[0]++; }
            if (Radios[24].Checked) { valores[1]++; }
            if (Radios[25].Checked) { valores[0]++; }
            if (Radios[26].Checked) { valores[1]++; }
            if (Radios[27].Checked) { valores[0]++; }
            if (Radios[28].Checked) { valores[1]++; }
            if (Radios[29].Checked) { valores[0]++; }
            if (Radios[30].Checked) { valores[1]++; }
            if (Radios[31].Checked) { valores[0]++; }
            if (Radios[32].Checked) { valores[1]++; }
            if (Radios[33].Checked) { valores[0]++; }
            #endregion

            #region ASPECTO A EVALUAR CARGA FISICA DEL TRABAJO
            if (Radios[34].Checked) { valores[1]++; }
            if (Radios[35].Checked) { valores[0]++; }
            if (Radios[36].Checked) { valores[1]++; }
            if (Radios[37].Checked) { valores[0]++; }
            if (Radios[38].Checked) { valores[1]++; }
            if (Radios[39].Checked) { valores[0]++; }
            if (Radios[40].Checked) { valores[1]++; }
            if (Radios[41].Checked) { valores[0]++; }
            if (Radios[42].Checked) { valores[1]++; }
            if (Radios[43].Checked) { valores[0]++; }
            if (Radios[44].Checked) { valores[1]++; }
            if (Radios[45].Checked) { valores[0]++; }
            if (Radios[46].Checked) { valores[1]++; }
            if (Radios[47].Checked) { valores[0]++; }
            if (Radios[48].Checked) { valores[1]++; }
            if (Radios[49].Checked) { valores[0]++; }
            if (Radios[50].Checked) { valores[1]++; }
            if (Radios[51].Checked) { valores[0]++; }
            if (Radios[52].Checked) { valores[1]++; }
            if (Radios[53].Checked) { valores[0]++; }
            if (Radios[54].Checked) { valores[1]++; }
            if (Radios[55].Checked) { valores[0]++; }
            if (Radios[56].Checked) { valores[1]++; }
            if (Radios[57].Checked) { valores[0]++; }
            if (Radios[58].Checked) { valores[1]++; }
            if (Radios[59].Checked) { valores[0]++; }
            if (Radios[60].Checked) { valores[1]++; }
            if (Radios[61].Checked) { valores[0]++; }
            if (Radios[62].Checked) { valores[1]++; }
            if (Radios[63].Checked) { valores[0]++; }
            if (Radios[64].Checked) { valores[1]++; }
            if (Radios[65].Checked) { valores[0]++; }
            if (Radios[66].Checked) { valores[1]++; }
            if (Radios[67].Checked) { valores[0]++; }
            if (Radios[68].Checked) { valores[1]++; }
            if (Radios[69].Checked) { valores[0]++; }
            if (Radios[70].Checked) { valores[1]++; }
            if (Radios[71].Checked) { valores[0]++; }
            if (Radios[72].Checked) { valores[1]++; }
            if (Radios[73].Checked) { valores[0]++; }
            if (Radios[74].Checked) { valores[1]++; }
            if (Radios[75].Checked) { valores[0]++; }
            if (Radios[76].Checked) { valores[1]++; }
            if (Radios[77].Checked) { valores[0]++; }
            if (Radios[78].Checked) { valores[1]++; }
            if (Radios[79].Checked) { valores[0]++; }
            if (Radios[80].Checked) { valores[1]++; }
            if (Radios[81].Checked) { valores[0]++; }
            if (Radios[82].Checked) { valores[1]++; }
            if (Radios[83].Checked) { valores[0]++; }
            #endregion

            #region MANIPULACIÓN DE CARGA
            if (Radios[84].Checked) { valores[1]++; }
            if (Radios[85].Checked) { valores[0]++; }
            if (Radios[86].Checked) { valores[1]++; }
            if (Radios[87].Checked) { valores[0]++; }
            if (Radios[88].Checked) { valores[1]++; }
            if (Radios[89].Checked) { valores[0]++; }
            if (Radios[90].Checked) { valores[1]++; }
            if (Radios[91].Checked) { valores[0]++; }
            if (Radios[92].Checked) { valores[1]++; }
            if (Radios[93].Checked) { valores[0]++; }
            if (Radios[94].Checked) { valores[1]++; }
            if (Radios[95].Checked) { valores[0]++; }
            if (Radios[96].Checked) { valores[1]++; }
            if (Radios[97].Checked) { valores[0]++; }
            if (Radios[98].Checked) { valores[1]++; }
            if (Radios[99].Checked) { valores[0]++; }
            if (Radios[100].Checked) { valores[1]++; }
            if (Radios[101].Checked) { valores[0]++; }
            if (Radios[102].Checked) { valores[1]++; }
            if (Radios[103].Checked) { valores[0]++; }
            #endregion

            #region CARGA MENTAL
            if (Radios[104].Checked) { valores[1]++; }
            if (Radios[105].Checked) { valores[0]++; }
            if (Radios[106].Checked) { valores[1]++; }
            if (Radios[107].Checked) { valores[0]++; }
            if (Radios[108].Checked) { valores[1]++; }
            if (Radios[109].Checked) { valores[0]++; }
            if (Radios[110].Checked) { valores[1]++; }
            if (Radios[111].Checked) { valores[0]++; }
            if (Radios[112].Checked) { valores[1]++; }
            if (Radios[113].Checked) { valores[0]++; }
            if (Radios[114].Checked) { valores[1]++; }
            if (Radios[115].Checked) { valores[0]++; }
            if (Radios[116].Checked) { valores[1]++; }
            if (Radios[117].Checked) { valores[0]++; }
            #endregion

            #region CONDICIONES DEL PUESTO DE TRABAJO
            if (Radios[118].Checked) { valores[1]++; }
            if (Radios[119].Checked) { valores[0]++; }
            if (Radios[120].Checked) { valores[1]++; }
            if (Radios[121].Checked) { valores[0]++; }
            if (Radios[122].Checked) { valores[1]++; }
            if (Radios[123].Checked) { valores[0]++; }
            if (Radios[124].Checked) { valores[1]++; }
            if (Radios[125].Checked) { valores[0]++; }
            if (Radios[126].Checked) { valores[1]++; }
            if (Radios[127].Checked) { valores[0]++; }
            if (Radios[128].Checked) { valores[1]++; }
            if (Radios[129].Checked) { valores[0]++; }
            if (Radios[130].Checked) { valores[1]++; }
            if (Radios[131].Checked) { valores[0]++; }
            if (Radios[132].Checked) { valores[1]++; }
            if (Radios[133].Checked) { valores[0]++; }
            if (Radios[134].Checked) { valores[1]++; }
            if (Radios[135].Checked) { valores[0]++; }
            if (Radios[136].Checked) { valores[1]++; }
            if (Radios[137].Checked) { valores[0]++; }
            if (Radios[138].Checked) { valores[1]++; }
            if (Radios[139].Checked) { valores[0]++; }
            if (Radios[140].Checked) { valores[1]++; }
            if (Radios[141].Checked) { valores[0]++; }
            if (Radios[142].Checked) { valores[1]++; }
            if (Radios[143].Checked) { valores[0]++; }
            #endregion

            #region CONDICIONES TERMOHIGROMETRICAS
            if (Radios[144].Checked) { valores[1]++; }
            if (Radios[145].Checked) { valores[0]++; }
            if (Radios[146].Checked) { valores[1]++; }
            if (Radios[147].Checked) { valores[0]++; }
            if (Radios[148].Checked) { valores[1]++; }
            if (Radios[149].Checked) { valores[0]++; }
            if (Radios[150].Checked) { valores[1]++; }
            if (Radios[151].Checked) { valores[0]++; }
            if (Radios[152].Checked) { valores[1]++; }
            if (Radios[153].Checked) { valores[0]++; }
            if (Radios[154].Checked) { valores[1]++; }
            if (Radios[155].Checked) { valores[0]++; }
            #endregion

            #region RADIACIONES
            if (Radios[156].Checked) { valores[0]++; }
            if (Radios[157].Checked) { valores[1]++; }
            if (Radios[158].Checked) { valores[0]++; }
            if (Radios[159].Checked) { valores[1]++; }
            if (Radios[160].Checked) { valores[0]++; }
            if (Radios[161].Checked) { valores[1]++; }
            #endregion

            #region CONTAMINANTES QUÍMICOS ( Si no se emplean productos químicos abstenerse de responder estas preguntas)
            if (Radios[162].Checked) { valores[0]++; }
            if (Radios[163].Checked) { valores[1]++; }
            if (Radios[164].Checked) { valores[0]++; }
            if (Radios[165].Checked) { valores[1]++; }
            if (Radios[166].Checked) { valores[0]++; }
            if (Radios[167].Checked) { valores[1]++; }
            if (Radios[168].Checked) { valores[0]++; }
            if (Radios[169].Checked) { valores[1]++; }
            if (Radios[170].Checked) { valores[0]++; }
            if (Radios[171].Checked) { valores[1]++; }
            if (Radios[172].Checked) { valores[0]++; }
            if (Radios[173].Checked) { valores[1]++; }
            if (Radios[174].Checked) { valores[0]++; }
            if (Radios[175].Checked) { valores[1]++; }
            #endregion

            #region CONTAMINANTES BIOLÓGICOS
            if (Radios[176].Checked) { valores[0]++; }
            if (Radios[177].Checked) { valores[1]++; }
            if (Radios[178].Checked) { valores[0]++; }
            if (Radios[179].Checked) { valores[1]++; }
            if (Radios[180].Checked) { valores[0]++; }
            #endregion

            #region FATIGA FÍSICA
            if (Radios[181].Checked) { valores[1]++; }
            if (Radios[182].Checked) { valores[0]++; }
            if (Radios[183].Checked) { valores[1]++; }
            if (Radios[184].Checked) { valores[0]++; }
            if (Radios[185].Checked) { valores[1]++; }
            if (Radios[186].Checked) { valores[0]++; }
            if (Radios[187].Checked) { valores[1]++; }
            if (Radios[188].Checked) { valores[0]++; }
            if (Radios[189].Checked) { valores[1]++; }
            if (Radios[190].Checked) { valores[0]++; }
            if (Radios[191].Checked) { valores[1]++; }
            if (Radios[192].Checked) { valores[0]++; }
            if (Radios[193].Checked) { valores[1]++; }
            if (Radios[194].Checked) { valores[0]++; }
            if (Radios[195].Checked) { valores[1]++; }
            #endregion

            #region DAÑOS A LA SALUD
            if (Radios[196].Checked) { valores[0]++; }
            if (Radios[197].Checked) { valores[1]++; }
            if (Radios[198].Checked) { valores[0]++; }
            if (Radios[199].Checked) { valores[1]++; }
            if (Radios[200].Checked) { valores[0]++; }
            if (Radios[201].Checked) { valores[1]++; }
            if (Radios[202].Checked) { valores[0]++; }
            if (Radios[203].Checked) { valores[1]++; }
            if (Radios[204].Checked) { valores[0]++; }
            if (Radios[205].Checked) { valores[1]++; }
            if (Radios[206].Checked) { valores[0]++; }
            if (Radios[207].Checked) { valores[1]++; }
            if (Radios[208].Checked) { valores[0]++; }
            if (Radios[209].Checked) { valores[1]++; }
            if (Radios[210].Checked) { valores[0]++; }
            if (Radios[211].Checked) { valores[1]++; }
            if (Radios[212].Checked) { valores[0]++; }
            if (Radios[213].Checked) { valores[1]++; }
            if (Radios[214].Checked) { valores[0]++; }
            if (Radios[215].Checked) { valores[1]++; }
            if (Radios[216].Checked) { valores[0]++; }
            if (Radios[217].Checked) { valores[1]++; }
            if (Radios[218].Checked) { valores[0]++; }
            if (Radios[219].Checked) { valores[1]++; }
            #endregion

            #region EQUIPOS DE PROTECCIÓN PERSONAL
            if (Radios[220].Checked) { valores[0]++; }
            if (Radios[221].Checked) { valores[1]++; }
            if (Radios[222].Checked) { valores[0]++; }
            if (Radios[223].Checked) { valores[1]++; }
            if (Radios[224].Checked) { valores[0]++; }
            if (Radios[225].Checked) { valores[1]++; }
            if (Radios[226].Checked) { valores[0]++; }
            if (Radios[227].Checked) { valores[1]++; }
            if (Radios[228].Checked) { valores[0]++; }
            if (Radios[229].Checked) { valores[1]++; }
            if (Radios[230].Checked) { valores[0]++; }
            if (Radios[231].Checked) { valores[1]++; }
            #endregion

            #region CAPACITACIÓN O INFORMACIÓN
            if (Radios[232].Checked) { valores[0]++; }
            if (Radios[233].Checked) { valores[1]++; }
            if (Radios[234].Checked) { valores[0]++; }
            if (Radios[235].Checked) { valores[1]++; }
            if (Radios[236].Checked) { valores[0]++; }
            if (Radios[237].Checked) { valores[1]++; }
            if (Radios[238].Checked) { valores[0]++; }
            if (Radios[239].Checked) { valores[1]++; }
            if (Radios[240].Checked) { valores[0]++; }
            if (Radios[241].Checked) { valores[1]++; }
            if (Radios[242].Checked) { valores[0]++; }
            if (Radios[243].Checked) { valores[1]++; }
            if (Radios[244].Checked) { valores[0]++; }
            if (Radios[245].Checked) { valores[1]++; }
            if (Radios[246].Checked) { valores[0]++; }
            if (Radios[247].Checked) { valores[1]++; }
            if (Radios[248].Checked) { valores[0]++; }
            if (Radios[249].Checked) { valores[1]++; }
            #endregion

            #region ASPECTOS PSICOSOCIALES
            if (Radios[250].Checked) { valores[0]++; }
            if (Radios[251].Checked) { valores[1]++; }
            if (Radios[252].Checked) { valores[0]++; }
            if (Radios[253].Checked) { valores[1]++; }
            if (Radios[254].Checked) { valores[0]++; }
            if (Radios[255].Checked) { valores[1]++; }
            if (Radios[256].Checked) { valores[0]++; }
            if (Radios[257].Checked) { valores[1]++; }
            if (Radios[258].Checked) { valores[0]++; }
            if (Radios[259].Checked) { valores[1]++; }
            if (Radios[260].Checked) { valores[0]++; }
            if (Radios[261].Checked) { valores[1]++; }
            if (Radios[262].Checked) { valores[0]++; }
            if (Radios[263].Checked) { valores[1]++; }
            #endregion

            #region EQUIPOS DE EMERGENCIA
            if (Radios[264].Checked) { valores[0]++; }
            if (Radios[265].Checked) { valores[1]++; }
            if (Radios[266].Checked) { valores[0]++; }
            if (Radios[267].Checked) { valores[1]++; }
            if (Radios[268].Checked) { valores[0]++; }
            if (Radios[269].Checked) { valores[1]++; }
            if (Radios[270].Checked) { valores[0]++; }
            if (Radios[271].Checked) { valores[1]++; }
            #endregion

            #region ASPECTOS LOCATIVOS
            if (Radios[272].Checked) { valores[0]++; }
            if (Radios[273].Checked) { valores[1]++; }
            if (Radios[274].Checked) { valores[0]++; }
            if (Radios[275].Checked) { valores[1]++; }
            if (Radios[276].Checked) { valores[0]++; }
            if (Radios[277].Checked) { valores[1]++; }
            if (Radios[278].Checked) { valores[0]++; }
            if (Radios[279].Checked) { valores[1]++; }
            if (Radios[280].Checked) { valores[0]++; }
            if (Radios[281].Checked) { valores[1]++; }
            if (Radios[282].Checked) { valores[0]++; }
            if (Radios[283].Checked) { valores[1]++; }
            if (Radios[284].Checked) { valores[0]++; }
            if (Radios[285].Checked) { valores[1]++; }
            #endregion

            #region INSTALACIONES ELÉCTRICAS
            if (Radios[286].Checked) { valores[0]++; }
            if (Radios[287].Checked) { valores[1]++; }
            if (Radios[288].Checked) { valores[0]++; }
            if (Radios[289].Checked) { valores[1]++; }
            if (Radios[290].Checked) { valores[0]++; }
            if (Radios[291].Checked) { valores[1]++; }
            if (Radios[292].Checked) { valores[0]++; }
            if (Radios[293].Checked) { valores[1]++; }
            #endregion

            #region 
            if (Radios[294].Checked) { valores[0]++; }
            if (Radios[295].Checked) { valores[1]++; }
            if (Radios[296].Checked) { valores[0]++; }
            if (Radios[297].Checked) { valores[1]++; }
            if (Radios[298].Checked) { valores[0]++; }
            if (Radios[299].Checked) { valores[1]++; }
            if (Radios[300].Checked) { valores[0]++; }
            if (Radios[301].Checked) { valores[1]++; }
            if (Radios[302].Checked) { valores[0]++; }
            if (Radios[303].Checked) { valores[1]++; }
            if (Radios[304].Checked) { valores[0]++; }
            if (Radios[305].Checked) { valores[1]++; }
            if (Radios[306].Checked) { valores[0]++; }
            if (Radios[307].Checked) { valores[1]++; }
            if (Radios[308].Checked) { valores[0]++; }
            if (Radios[309].Checked) { valores[1]++; }
            //if (Radios[310].Checked) { valores[0]++; }
            //if (Radios[311].Checked) { valores[1]++; }
            #endregion

            return valores;

        }

        public static int[] GenerarResultados_InspeccionPuestosAdmin(RadioButton[] Radios)
        {
            int[] valores = { 0, 0 };

            #region informacion general
            if (Radios[0].Checked) { valores[0]++; }
            if (Radios[1].Checked) { valores[1]++; }
            if (Radios[2].Checked) { valores[0]++; }
            if (Radios[3].Checked) { valores[1]++; }
            if (Radios[4].Checked) { valores[0]++; }
            if (Radios[5].Checked) { valores[1]++; }
            if (Radios[6].Checked) { valores[0]++; }
            if (Radios[7].Checked) { valores[1]++; }
            if (Radios[8].Checked) { valores[0]++; }
            if (Radios[9].Checked) { valores[1]++; }
            if (Radios[10].Checked) { valores[0]++; }
            if (Radios[11].Checked) { valores[1]++; }
            if (Radios[12].Checked) { valores[0]++; }
            if (Radios[13].Checked) { valores[1]++; }
            if (Radios[14].Checked) { valores[0]++; }
            if (Radios[15].Checked) { valores[1]++; }
            #endregion

            #region Superficie de Trabajo/ Espacio
            if (Radios[16].Checked) { valores[0]++; }
            if (Radios[17].Checked) { valores[1]++; }
            if (Radios[18].Checked) { valores[0]++; }
            if (Radios[19].Checked) { valores[1]++; }
            if (Radios[20].Checked) { valores[0]++; }
            if (Radios[21].Checked) { valores[1]++; }
            if (Radios[22].Checked) { valores[0]++; }
            if (Radios[23].Checked) { valores[1]++; }
            if (Radios[24].Checked) { valores[0]++; }
            if (Radios[25].Checked) { valores[1]++; }
            if (Radios[26].Checked) { valores[0]++; }
            if (Radios[27].Checked) { valores[1]++; }
            if (Radios[28].Checked) { valores[0]++; }
            if (Radios[29].Checked) { valores[1]++; }
            if (Radios[30].Checked) { valores[0]++; }
            if (Radios[31].Checked) { valores[1]++; }
            if (Radios[32].Checked) { valores[0]++; }
            if (Radios[33].Checked) { valores[1]++; }
            if (Radios[34].Checked) { valores[0]++; }
            if (Radios[35].Checked) { valores[1]++; }
            if (Radios[36].Checked) { valores[0]++; }
            if (Radios[37].Checked) { valores[1]++; }
            if (Radios[38].Checked) { valores[0]++; }
            if (Radios[39].Checked) { valores[1]++; }
            if (Radios[40].Checked) { valores[0]++; }
            if (Radios[41].Checked) { valores[1]++; }
            if (Radios[42].Checked) { valores[0]++; }
            if (Radios[43].Checked) { valores[1]++; }
            #endregion

            #region Superficie del Asiento
            if (Radios[44].Checked) { valores[0]++; }
            if (Radios[45].Checked) { valores[1]++; }
            if (Radios[46].Checked) { valores[0]++; }
            if (Radios[47].Checked) { valores[1]++; }
            if (Radios[48].Checked) { valores[0]++; }
            if (Radios[49].Checked) { valores[1]++; }
            if (Radios[50].Checked) { valores[0]++; }
            if (Radios[51].Checked) { valores[1]++; }
            if (Radios[52].Checked) { valores[0]++; }
            if (Radios[53].Checked) { valores[1]++; }
            #endregion

            #region Silla
            if (Radios[54].Checked) { valores[0]++; }
            if (Radios[55].Checked) { valores[1]++; }
            if (Radios[56].Checked) { valores[0]++; }
            if (Radios[57].Checked) { valores[1]++; }
            if (Radios[58].Checked) { valores[0]++; }
            if (Radios[59].Checked) { valores[1]++; }
            if (Radios[60].Checked) { valores[0]++; }
            if (Radios[61].Checked) { valores[1]++; }
            #endregion

            #region Condiciones ergonómicas para los Brazos
            if (Radios[62].Checked) { valores[0]++; }
            if (Radios[63].Checked) { valores[1]++; }
            if (Radios[64].Checked) { valores[0]++; }
            if (Radios[65].Checked) { valores[1]++; }
            if (Radios[66].Checked) { valores[0]++; }
            if (Radios[67].Checked) { valores[1]++; }
            if (Radios[68].Checked) { valores[0]++; }
            if (Radios[69].Checked) { valores[1]++; }
            if (Radios[70].Checked) { valores[0]++; }
            if (Radios[71].Checked) { valores[1]++; }
            if (Radios[72].Checked) { valores[0]++; }
            if (Radios[73].Checked) { valores[1]++; }
            if (Radios[74].Checked) { valores[0]++; }
            if (Radios[75].Checked) { valores[1]++; }
            #endregion

            #region Condiciones ergonómicas para Piernas y pies
            if (Radios[76].Checked) { valores[0]++; }
            if (Radios[77].Checked) { valores[1]++; }
            if (Radios[78].Checked) { valores[0]++; }
            if (Radios[79].Checked) { valores[1]++; }
            if (Radios[80].Checked) { valores[0]++; }
            if (Radios[81].Checked) { valores[1]++; }
            if (Radios[82].Checked) { valores[0]++; }
            if (Radios[83].Checked) { valores[1]++; }
            if (Radios[84].Checked) { valores[0]++; }
            if (Radios[85].Checked) { valores[1]++; }
            if (Radios[86].Checked) { valores[0]++; }
            if (Radios[87].Checked) { valores[1]++; }
            #endregion

            #region Soporte para los Brazos y Manos
            if (Radios[88].Checked) { valores[0]++; }
            if (Radios[89].Checked) { valores[1]++; }
            if (Radios[90].Checked) { valores[0]++; }
            if (Radios[91].Checked) { valores[1]++; }
            if (Radios[92].Checked) { valores[0]++; }
            if (Radios[93].Checked) { valores[1]++; }
            if (Radios[94].Checked) { valores[0]++; }
            if (Radios[95].Checked) { valores[1]++; }
            #endregion

            #region Monitor
            if (Radios[96].Checked) { valores[0]++; }
            if (Radios[97].Checked) { valores[1]++; }
            if (Radios[98].Checked) { valores[0]++; }
            if (Radios[99].Checked) { valores[1]++; }
            if (Radios[100].Checked) { valores[0]++; }
            if (Radios[101].Checked) { valores[1]++; }
            if (Radios[102].Checked) { valores[0]++; }
            if (Radios[103].Checked) { valores[1]++; }
            #endregion

            #region Teclado
            if (Radios[104].Checked) { valores[0]++; }
            if (Radios[105].Checked) { valores[1]++; }
            if (Radios[106].Checked) { valores[0]++; }
            if (Radios[107].Checked) { valores[1]++; }
            if (Radios[108].Checked) { valores[0]++; }
            if (Radios[109].Checked) { valores[1]++; }
            #endregion

            #region Mouse
            if (Radios[110].Checked) { valores[0]++; }
            if (Radios[111].Checked) { valores[1]++; }
            if (Radios[112].Checked) { valores[0]++; }
            if (Radios[113].Checked) { valores[1]++; }
            if (Radios[114].Checked) { valores[0]++; }
            if (Radios[115].Checked) { valores[1]++; }
            if (Radios[116].Checked) { valores[0]++; }
            if (Radios[117].Checked) { valores[1]++; }
            #endregion

            #region Iluminación
            if (Radios[118].Checked) { valores[0]++; }
            if (Radios[119].Checked) { valores[1]++; }
            if (Radios[120].Checked) { valores[0]++; }
            if (Radios[121].Checked) { valores[1]++; }
            if (Radios[122].Checked) { valores[0]++; }
            if (Radios[123].Checked) { valores[1]++; }
            if (Radios[124].Checked) { valores[0]++; }
            if (Radios[125].Checked) { valores[1]++; }
            #endregion

            #region Temperatura
            if (Radios[126].Checked) { valores[0]++; }
            if (Radios[127].Checked) { valores[1]++; }
            if (Radios[128].Checked) { valores[0]++; }
            if (Radios[129].Checked) { valores[1]++; }
            if (Radios[130].Checked) { valores[0]++; }
            if (Radios[131].Checked) { valores[1]++; }
            if (Radios[132].Checked) { valores[0]++; }
            if (Radios[133].Checked) { valores[1]++; }
            if (Radios[134].Checked) { valores[0]++; }
            if (Radios[135].Checked) { valores[1]++; }
            #endregion

            #region Vibración
            if (Radios[136].Checked) { valores[0]++; }
            if (Radios[137].Checked) { valores[1]++; }
            if (Radios[138].Checked) { valores[0]++; }
            if (Radios[139].Checked) { valores[1]++; }
            #endregion

            #region Ruido
            if (Radios[140].Checked) { valores[0]++; }
            if (Radios[141].Checked) { valores[1]++; }
            if (Radios[142].Checked) { valores[0]++; }
            if (Radios[143].Checked) { valores[1]++; }
            if (Radios[144].Checked) { valores[0]++; }
            if (Radios[145].Checked) { valores[1]++; }
            #endregion

            #region Fatiga Física
            if (Radios[146].Checked) { valores[0]++; }
            if (Radios[147].Checked) { valores[1]++; }
            if (Radios[148].Checked) { valores[0]++; }
            if (Radios[149].Checked) { valores[1]++; }
            if (Radios[150].Checked) { valores[0]++; }
            if (Radios[151].Checked) { valores[1]++; }
            if (Radios[152].Checked) { valores[0]++; }
            if (Radios[153].Checked) { valores[1]++; }
            if (Radios[154].Checked) { valores[0]++; }
            if (Radios[155].Checked) { valores[1]++; }
            #endregion

            #region Visión
            if (Radios[156].Checked) { valores[0]++; }
            if (Radios[157].Checked) { valores[1]++; }
            if (Radios[158].Checked) { valores[0]++; }
            if (Radios[159].Checked) { valores[1]++; }
            #endregion

            #region Capacitación e información
            if (Radios[160].Checked) { valores[0]++; }
            if (Radios[161].Checked) { valores[1]++; }
            if (Radios[162].Checked) { valores[0]++; }
            if (Radios[163].Checked) { valores[1]++; }
            if (Radios[164].Checked) { valores[0]++; }
            if (Radios[165].Checked) { valores[1]++; }
            if (Radios[166].Checked) { valores[0]++; }
            if (Radios[167].Checked) { valores[1]++; }
            if (Radios[168].Checked) { valores[0]++; }
            if (Radios[169].Checked) { valores[1]++; }
            if (Radios[170].Checked) { valores[0]++; }
            if (Radios[171].Checked) { valores[1]++; }
            if (Radios[172].Checked) { valores[0]++; }
            if (Radios[173].Checked) { valores[1]++; }
            if (Radios[174].Checked) { valores[0]++; }
            if (Radios[175].Checked) { valores[1]++; }
            if (Radios[176].Checked) { valores[0]++; }
            if (Radios[177].Checked) { valores[1]++; }
            #endregion

            #region Daños a la salud
            if (Radios[178].Checked) { valores[0]++; }
            if (Radios[179].Checked) { valores[1]++; }
            if (Radios[180].Checked) { valores[0]++; }
            if (Radios[181].Checked) { valores[1]++; }
            if (Radios[182].Checked) { valores[0]++; }
            if (Radios[183].Checked) { valores[1]++; }
            if (Radios[184].Checked) { valores[0]++; }
            if (Radios[185].Checked) { valores[1]++; }
            if (Radios[186].Checked) { valores[0]++; }
            if (Radios[187].Checked) { valores[1]++; }
            if (Radios[188].Checked) { valores[0]++; }
            if (Radios[189].Checked) { valores[1]++; }
            #endregion

            #region Aspectos Psicosociales
            if (Radios[190].Checked) { valores[0]++; }
            if (Radios[191].Checked) { valores[1]++; }
            if (Radios[192].Checked) { valores[0]++; }
            if (Radios[193].Checked) { valores[1]++; }
            if (Radios[194].Checked) { valores[0]++; }
            if (Radios[195].Checked) { valores[1]++; }
            if (Radios[196].Checked) { valores[0]++; }
            if (Radios[197].Checked) { valores[1]++; }
            if (Radios[198].Checked) { valores[0]++; }
            if (Radios[199].Checked) { valores[1]++; }
            if (Radios[200].Checked) { valores[0]++; }
            if (Radios[201].Checked) { valores[1]++; }
            if (Radios[202].Checked) { valores[0]++; }
            if (Radios[203].Checked) { valores[1]++; }
            #endregion

            #region Equipos de Emergencia
            if (Radios[204].Checked) { valores[0]++; }
            if (Radios[205].Checked) { valores[1]++; }
            if (Radios[206].Checked) { valores[0]++; }
            if (Radios[207].Checked) { valores[1]++; }
            if (Radios[208].Checked) { valores[0]++; }
            if (Radios[209].Checked) { valores[1]++; }
            if (Radios[210].Checked) { valores[0]++; }
            if (Radios[211].Checked) { valores[1]++; }
            #endregion

            #region Aspectos Locativos
            if (Radios[212].Checked) { valores[0]++; }
            if (Radios[213].Checked) { valores[1]++; }
            if (Radios[214].Checked) { valores[0]++; }
            if (Radios[215].Checked) { valores[1]++; }
            if (Radios[216].Checked) { valores[0]++; }
            if (Radios[217].Checked) { valores[1]++; }
            if (Radios[218].Checked) { valores[0]++; }
            if (Radios[219].Checked) { valores[1]++; }
            if (Radios[220].Checked) { valores[0]++; }
            if (Radios[221].Checked) { valores[1]++; }
            if (Radios[222].Checked) { valores[0]++; }
            if (Radios[223].Checked) { valores[1]++; }
            if (Radios[224].Checked) { valores[0]++; }
            if (Radios[225].Checked) { valores[1]++; }
            #endregion

            #region Instalaciones eléctricas
            if (Radios[226].Checked) { valores[0]++; }
            if (Radios[227].Checked) { valores[1]++; }
            if (Radios[228].Checked) { valores[0]++; }
            if (Radios[229].Checked) { valores[1]++; }
            if (Radios[230].Checked) { valores[0]++; }
            if (Radios[231].Checked) { valores[1]++; }
            if (Radios[232].Checked) { valores[0]++; }
            if (Radios[233].Checked) { valores[1]++; }

            #endregion

            #region Otras Condiciones
            if (Radios[234].Checked) { valores[0]++; }
            if (Radios[235].Checked) { valores[1]++; }
            if (Radios[236].Checked) { valores[0]++; }
            if (Radios[237].Checked) { valores[1]++; }
            if (Radios[238].Checked) { valores[0]++; }
            if (Radios[239].Checked) { valores[1]++; }
            if (Radios[240].Checked) { valores[0]++; }
            if (Radios[241].Checked) { valores[1]++; }
            if (Radios[242].Checked) { valores[0]++; }
            if (Radios[243].Checked) { valores[1]++; }
            if (Radios[244].Checked) { valores[0]++; }
            if (Radios[245].Checked) { valores[1]++; }
            if (Radios[246].Checked) { valores[0]++; }
            if (Radios[247].Checked) { valores[1]++; }
            if (Radios[248].Checked) { valores[0]++; }
            if (Radios[249].Checked) { valores[1]++; }
            if (Radios[250].Checked) { valores[0]++; }
            if (Radios[251].Checked) { valores[1]++; }
            #endregion

            return valores;
        }

        public static void Add_Fila_InspeccionUsoEpp(Panel pnDatos, int intContInspecciones,  List<Model_CEPP> eppTrab)
        {
            Table _table;
            RadioButton _radio;
            TextBox _textbox;
            Label _label;


            _table = (Table)pnDatos.FindControl("tb_datos");

            for (int i = 0; i < intContInspecciones; i++)
            {
                TableRow row = new TableRow();

                TableCell cell = new TableCell();
                _label = new Label();
                _label.CssClass = "label-control";
                _label.ID = "lblEpp" + i;
                _label.Text = eppTrab.ElementAt(i).nombre;
                cell.Controls.Add(_label);

                TableCell cell1 = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "chkUsoSi" + i;
                _radio.GroupName = "chkUso" + i;
                cell1.CssClass = "text-center";
                cell1.Controls.Add(_radio);

                TableCell cell2 = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "chkUsoNo" + i;
                _radio.GroupName = "chkUso" + i;
                cell2.CssClass = "text-center";
                cell2.Controls.Add(_radio);

                TableCell cell3 = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "chkEstSi" + i;
                _radio.GroupName = "chkEst" + i;
                cell3.CssClass = "text-center";
                cell3.Controls.Add(_radio);

                TableCell cell4 = new TableCell();
                _radio = new RadioButton();
                _radio.ID = "chkEstNo" + i;
                _radio.GroupName = "chkEst" + i;
                cell4.CssClass = "text-center";
                cell4.Controls.Add(_radio);

                TableCell cell5 = new TableCell();
                _textbox = new TextBox();
                _textbox.ID = "txtObs" + i;
                _textbox.CssClass = "form-control";
                _textbox.TextMode = TextBoxMode.MultiLine;
                _textbox.Columns = 50;
                _textbox.Rows = 2;
                cell5.Controls.Add(_textbox);

                row.Controls.Add(cell);
                row.Controls.Add(cell1);
                row.Controls.Add(cell2);
                row.Controls.Add(cell3);
                row.Controls.Add(cell4);
                row.Controls.Add(cell5);

                _table.Controls.Add(row);
            }
        }

        public static Double[] Calcular_ReporteTrabajadores_A_B(Panel form1, string tipo)
        {
            Double totalSi = 0;
            Double totalNo = 0;

            if (tipo.Equals("A"))
            {
                for (int i = 3; i <= 254; i = i + 2)
                {
                    HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)form1.FindControl("radio" + i);
                    HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)form1.FindControl("radio" + (i + 1));

                    if (i == 39)
                    {
                        if (miradio1.Checked == true) { totalNo++; }
                        if (miradio2.Checked == true) { totalSi++; }
                    }
                    else
                    {
                        if (miradio1.Checked == true) { totalSi++; }
                        if (miradio2.Checked == true) { totalNo++; }
                    }
                }
            }
            else if (tipo.Equals("B"))
            {
                for (int i = 1; i <= 280; i = i + 2)
                {
                    HtmlInputRadioButton miradio1 = (HtmlInputRadioButton)form1.FindControl("radio" + i);
                    HtmlInputRadioButton miradio2 = (HtmlInputRadioButton)form1.FindControl("radio" + (i + 1));

                    if (miradio1.Checked == true) { totalSi++; }
                    if (miradio2.Checked == true) { totalNo++; }
                }
            }

            Double porcentaje = Math.Round(((totalNo * 100) / (totalSi + totalNo)), 2);

            Double[] valores = { totalSi, totalNo, porcentaje };

            return valores;
        }

        public static Double[] Calcular_ReporteTrabajadoresB(Panel form1)
        {
            Double totalSi = 0;
            Double totalNo = 0;


            Double porcentaje = Math.Round(((totalNo * 100) / (totalSi + totalNo)), 2);

            Double[] valores = { totalSi, totalNo, porcentaje };

            return valores;
        }

        public static Double Calcular_Porcentaje(Double valor1, Double valor2)
        {
            return ((valor1 / valor2) * 100);
        }
        public static Double Calcular_Porcentaje_K(Double valor1, Double valor2)
        {
            int K = 240000;
            return ((valor1 / valor2) * K);
        }

        public static void ListaUltimos10Anhos(DropDownList DropDownList1)
        {
            DateTime anho = DateTime.Now;
            int anhoActual = Convert.ToInt32(anho.Year);

            for (int i = anhoActual; i >= (anhoActual - 9); i--)
            {
                DropDownList1.Items.Add(new ListItem(string.Empty + i, string.Empty + i));
            }

        }

        public static void CargaMensual_ReporteAccidentalidad(GridView GridView1, int anhoActual, int MesActual, int IdSucursal, int IdEmpresa)
        {
            int jornada = 0;
            List<empresa> ListaEmpresa = new List<empresa>();
            List<trabajador> ListaTrabajador = new List<trabajador>();
            DataTable dtMensual = new DataTable();

            ListaEmpresa = Mgr_Empresa.Empresa(IdEmpresa);
            ListaTrabajador = Mgr_Trabajador.Trabajador(0, 0, IdSucursal);

            //encabezado grid
            if (dtMensual.Columns.Count == 0)
            {
                dtMensual.Columns.Add("Mes", typeof(string));
                dtMensual.Columns.Add("Nº de Trabajadores", typeof(string));
                dtMensual.Columns.Add("Nº de días Laborados", typeof(string));
                dtMensual.Columns.Add("Nº de Horas Laboradas", typeof(string));
                dtMensual.Columns.Add("Horas Hombre Laboradas", typeof(string));
                dtMensual.Columns.Add("Nº de Accidentes", typeof(string));

                dtMensual.Columns.Add("IF: Indice General de Frecuencia", typeof(string));
                dtMensual.Columns.Add("IS: Indice de Severidad Global", typeof(string));
                dtMensual.Columns.Add("IDP: Indice Medio de días perdidos por lesiones", typeof(string));
                dtMensual.Columns.Add("ILI: Indice de lesión incapacitante", typeof(string));
                dtMensual.Columns.Add("NCRP", typeof(string));
                dtMensual.Columns.Add("TDP", typeof(string));
                dtMensual.Columns.Add("TCDP", typeof(string));
            }

            DataRow NewRow = dtMensual.NewRow();
            string[] meses = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };

            for (int i = 0; i < MesActual; i++)
            {
                int contadorTrab = 0;
                int dias_habiles = 0;
                Double horasMes = 0;
                Double HorasHombreLab = 0;
                Double IndiceFrecuencia = 0;
                Double IndiceSeveridad = 0;
                Double IndiceMedio = 0;
                double IndiceLesion = 0;
                int NCRP = 0;
                int contadorAccidente = 0;
                int TDP = 0;
                int TCDP = 0;

                DateTime fechaConsultar = new DateTime(anhoActual, (i + 1), 01);
                fechaConsultar = fechaConsultar.AddMonths(1).AddDays(-1);

                int DiasMes = fechaConsultar.Day;

                foreach (var item in ListaTrabajador)
                {
                    DateTime fechaIngreso = item.fecha_ingreso.Value;

                    if (fechaConsultar >= fechaIngreso)
                    {
                        if (anhoActual > fechaIngreso.Year)
                        {
                            fechaIngreso = new DateTime(anhoActual, (i + 1), 1);
                        }

                        List<trabajador_estatus> ListaTrabajadorEstatus = new List<trabajador_estatus>();
                        ListaTrabajadorEstatus = Mgr_Trabajador.TrabajadorReposo(item.id_trabajador, fechaIngreso, fechaConsultar);

                        foreach (var itemTrabEst in ListaTrabajadorEstatus)
                        {
                            if (itemTrabEst.fecha_constancia > fechaIngreso)
                            {
                                fechaIngreso = Convert.ToDateTime(itemTrabEst.fecha_constancia).AddDays(Convert.ToDouble(itemTrabEst.dias_reposo));
                            }

                            if (itemTrabEst.dias_reposo > 0)
                            {
                                TDP = TDP + Convert.ToInt32(itemTrabEst.dias_reposo);
                            }
                            TCDP++;
                        }

                        if (fechaIngreso <= fechaConsultar)
                        {
                            contadorTrab++;
                        }
                    }
                }

                foreach (var itemEmpresa in ListaEmpresa)
                {
                    jornada = Convert.ToInt32(itemEmpresa.jornada);
                }

                string[] diasFeriados = {
                    anhoActual+"-01-01", anhoActual+"-01-09", anhoActual+"-03-20", anhoActual+"-04-13", anhoActual+"-04-14",
                    anhoActual+"-05-01", anhoActual+"-05-29", anhoActual+"-06-19", anhoActual+"-06-26", anhoActual+"-07-03",
                    anhoActual+"-07-20", anhoActual+"-08-07", anhoActual+"-08-21", anhoActual+"-10-16", anhoActual+"-11-06",
                    anhoActual+"-11-13", anhoActual+"-12-08", anhoActual+"-12-25"};


                for (int x = 1; x <= DiasMes; x++)
                {
                    DateTime desde = new DateTime(anhoActual, (i + 1), x);
                    int numero_dia = Convert.ToInt16(desde.DayOfWeek.ToString("d"));

                    if (numero_dia == 1 || numero_dia == 2 || numero_dia == 3 || numero_dia == 4 || numero_dia == 5)
                    {
                        dias_habiles++;

                        if (jornada == 1)//Lunes a viernes  
                        { horasMes = horasMes + 9.5; }
                        else if (jornada == 2)//Lunes a Sabado  
                        { horasMes = horasMes + 8; }


                        for (int df = 0; df < diasFeriados.Length; df++)
                        {
                            if (Convert.ToDateTime(diasFeriados[df]) == desde)
                            {
                                dias_habiles--;
                                horasMes = horasMes - 8;
                            }
                        }
                    }

                    if (numero_dia == 6)
                    {
                        if (jornada == 2)//Lunes a Sabado  
                        {
                            dias_habiles++;
                            horasMes = horasMes + 8;

                            for (int df = 0; df < diasFeriados.Length; df++)
                            {
                                if (Convert.ToDateTime(diasFeriados[df]) == desde)
                                {
                                    dias_habiles--;
                                }
                            }
                        }
                    }
                }

                HorasHombreLab = contadorTrab * horasMes;

                #region cuento los accidentes
                DateTime fechaInicio = new DateTime(anhoActual, (i + 1), 01);
                DateTime fechaFin = fechaInicio.AddMonths(1).AddDays(-1);
                List<at_it_el_pa> ListaAccidentes = new List<at_it_el_pa>();
                ListaAccidentes = Getter.Accidente_Empresa_Reportes(IdEmpresa, fechaInicio, fechaFin);

                foreach (var itemListaAccidentes in ListaAccidentes)
                {
                    contadorAccidente++;
                }
                #endregion

                NCRP = contadorAccidente;
                String IndF = "0";
                String IndS = "0";
                String IndDP = "0";
                String IndILI = "0";

                if (contadorAccidente > 0)
                {
                    IndiceFrecuencia = (NCRP * 200000) / HorasHombreLab;
                    IndF = IndiceFrecuencia.ToString("#.##");
                }

                if (TDP > 0)
                {
                    IndiceSeveridad = (TCDP * 200000) / HorasHombreLab;
                    IndS = IndiceSeveridad.ToString("#.##");
                }

                IndiceMedio = ((TDP + NCRP) * 200000);

                if (IndiceMedio > 0 && TCDP > 0)
                {
                    IndiceMedio = IndiceMedio / TCDP;
                    IndDP = IndiceMedio.ToString("#.##");
                }

                if (IndF != "0" && IndS != "0")
                {
                    IndiceLesion = (IndiceFrecuencia + IndiceSeveridad) / TCDP;
                    IndILI = IndiceLesion.ToString("#.##");
                }

                if (contadorTrab == 0)
                {
                    dias_habiles = 0;
                    horasMes = 0;
                }

                NewRow = dtMensual.NewRow();
                NewRow[0] = meses[i] + "/" + fechaFin.Year;
                NewRow[1] = "" + contadorTrab;
                NewRow[2] = "" + dias_habiles;
                NewRow[3] = "" + horasMes;
                NewRow[4] = "" + HorasHombreLab;
                NewRow[5] = "" + contadorAccidente;
                NewRow[6] = "" + IndF;
                NewRow[7] = "" + IndS;
                NewRow[8] = "" + IndDP;
                NewRow[9] = "" + IndILI;
                NewRow[10] = "" + NCRP;
                NewRow[11] = "" + TDP;
                NewRow[12] = "" + TCDP;
                dtMensual.Rows.Add(NewRow);
            }

            GridView1.DataSource = dtMensual;
            GridView1.DataBind();
        }

        public static void CargaTrimestral_ReporteAccidentalidad(GridView GridView3, int anhoActual, int MesActual, int IdSucursal, int IdEmpresa)
        {
            int jornada = 0;
            List<empresa> ListaEmpresa = new List<empresa>();
            List<trabajador> ListaTrabajador = new List<trabajador>();

            int[] vc_contadorTrab = { 0, 0, 0, 0 };
            int[] vc_dias_habiles = { 0, 0, 0, 0 };
            Double[] vc_horasMes = { 0, 0, 0, 0 };
            Double[] vc_HorasHombreLab = { 0, 0, 0, 0 };
            Double[] vc_IndiceFrecuencia = { 0, 0, 0, 0 };
            Double[] vc_IndiceSeveridad = { 0, 0, 0, 0 };
            Double[] vc_IndiceMedio = { 0, 0, 0, 0 };
            Double[] vc_IndiceLesion = { 0, 0, 0, 0 };
            String[] IndF = { "0", "0", "0", "0" };
            String[] IndS = { "0", "0", "0", "0" };
            String[] IndDP = { "0", "0", "0", "0" };
            String[] IndILI = { "0", "0", "0", "0" };
            int[] vc_NCRP = { 0, 0, 0, 0 };
            int[] vc_contadorAccidente = { 0, 0, 0, 0 };
            int[] vc_TDP = { 0, 0, 0, 0 };
            int[] vc_TCDP = { 0, 0, 0, 0 };
            int posicion = 0;

            ListaEmpresa = Mgr_Empresa.Empresa(IdEmpresa);
            ListaTrabajador = Mgr_Trabajador.Trabajador(0, 0, IdSucursal);

            for (int i = 0; i < MesActual; i++)
            {
                int contadorTrab = 0;
                int dias_habiles = 0;
                Double horasMes = 0;
                Double HorasHombreLab = 0;
                int NCRP = 0;
                int contadorAccidente = 0;
                int TDP = 0;
                int TCDP = 0;

                DateTime fechaConsultar = new DateTime(anhoActual, (i + 1), 01);
                fechaConsultar = fechaConsultar.AddMonths(1).AddDays(-1);

                int DiasMes = fechaConsultar.Day;

                foreach (var item in ListaTrabajador)
                {
                    DateTime fechaIngreso = item.fecha_ingreso.Value;

                    if (fechaConsultar >= fechaIngreso)
                    {
                        if (anhoActual > fechaIngreso.Year)
                        {
                            fechaIngreso = new DateTime(anhoActual, (i + 1), 1);
                        }

                        List<trabajador_estatus> ListaTrabajadorEstatus = new List<trabajador_estatus>();
                        ListaTrabajadorEstatus = Mgr_Trabajador.TrabajadorReposo(item.id_trabajador, fechaIngreso, fechaConsultar);

                        foreach (var itemTrabEst in ListaTrabajadorEstatus)
                        {
                            if (itemTrabEst.fecha_constancia > fechaIngreso)
                            {
                                fechaIngreso = Convert.ToDateTime(itemTrabEst.fecha_constancia).AddDays(Convert.ToDouble(itemTrabEst.dias_reposo));
                            }

                            if (itemTrabEst.dias_reposo > 0)
                            {
                                TDP = TDP + Convert.ToInt32(itemTrabEst.dias_reposo);
                            }
                            TCDP++;
                        }

                        if (fechaIngreso <= fechaConsultar)
                        {
                            contadorTrab++;
                        }
                    }
                }

                foreach (var itemEmpresa in ListaEmpresa)
                {
                    jornada = Convert.ToInt32(itemEmpresa.jornada);
                }

                string[] diasFeriados = {
                    anhoActual+"-01-01", anhoActual+"-01-09", anhoActual+"-03-20", anhoActual+"-04-13", anhoActual+"-04-14",
                    anhoActual+"-05-01", anhoActual+"-05-29", anhoActual+"-06-19", anhoActual+"-06-26", anhoActual+"-07-03",
                    anhoActual+"-07-20", anhoActual+"-08-07", anhoActual+"-08-21", anhoActual+"-10-16", anhoActual+"-11-06",
                    anhoActual+"-11-13", anhoActual+"-12-08", anhoActual+"-12-25"};

                for (int x = 1; x <= DiasMes; x++)
                {
                    DateTime desde = new DateTime(anhoActual, (i + 1), x);
                    int numero_dia = Convert.ToInt16(desde.DayOfWeek.ToString("d"));


                    if (numero_dia == 1 || numero_dia == 2 || numero_dia == 3 || numero_dia == 4 || numero_dia == 5)
                    {
                        dias_habiles++;

                        if (jornada == 1)//Lunes a viernes  
                        { horasMes = horasMes + 9.5; }
                        else if (jornada == 2)//Lunes a Sabado  
                        { horasMes = horasMes + 8; }


                        for (int df = 0; df < diasFeriados.Length; df++)
                        {
                            if (Convert.ToDateTime(diasFeriados[df]) == desde)
                            {
                                dias_habiles--;
                                horasMes = horasMes - 8;
                            }
                        }
                    }

                    if (numero_dia == 6)
                    {
                        if (jornada == 2)//Lunes a Sabado  
                        {
                            dias_habiles++;
                            horasMes = horasMes + 8;

                            for (int df = 0; df < diasFeriados.Length; df++)
                            {
                                if (Convert.ToDateTime(diasFeriados[df]) == desde)
                                {
                                    dias_habiles--;
                                }
                            }
                        }
                    }
                }

                HorasHombreLab = contadorTrab * horasMes;

                #region cuento los accidentes
                DateTime fechaInicio = new DateTime(anhoActual, (i + 1), 01);
                DateTime fechaFin = fechaInicio.AddMonths(1).AddDays(-1);
                List<at_it_el_pa> ListaAccidentes = new List<at_it_el_pa>();
                ListaAccidentes = Getter.Accidente_Empresa_Reportes(IdEmpresa, fechaInicio, fechaFin);

                foreach (var itemListaAccidentes in ListaAccidentes)
                {
                    contadorAccidente++;
                }
                #endregion

                NCRP = contadorAccidente;

                if (contadorTrab == 0)
                {
                    dias_habiles = 0;
                    horasMes = 0;
                }

                if (i < 3)
                {
                    posicion = 0;
                    vc_dias_habiles[posicion] = vc_dias_habiles[posicion] + dias_habiles;
                    vc_horasMes[posicion] = vc_horasMes[posicion] + horasMes;
                    vc_HorasHombreLab[posicion] = vc_HorasHombreLab[posicion] + HorasHombreLab;
                    vc_NCRP[posicion] = vc_NCRP[posicion] + NCRP;
                    vc_contadorAccidente[posicion] = vc_contadorAccidente[posicion] + contadorAccidente;
                    vc_TDP[posicion] = vc_TDP[posicion] + TDP;
                    vc_TCDP[posicion] = vc_TCDP[posicion] + TCDP;

                    if (i == 2)
                    {
                        //IndiceFrecuencia
                        if (vc_contadorAccidente[posicion] > 0)
                        {
                            vc_IndiceFrecuencia[posicion] = (vc_NCRP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndF[posicion] = vc_IndiceFrecuencia[posicion].ToString("#.##");
                        }
                        //IndiceSeveridad
                        if (TDP > 0)
                        {
                            vc_IndiceSeveridad[posicion] = (vc_TCDP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndS[posicion] = vc_IndiceSeveridad[posicion].ToString("#.##");
                        }
                        //IndiceMedio
                        vc_IndiceMedio[posicion] = ((vc_TDP[posicion] + vc_NCRP[posicion]) * 200000);
                        if (vc_IndiceMedio[posicion] > 0 && vc_TDP[posicion] > 0)
                        {
                            vc_IndiceMedio[posicion] = vc_IndiceMedio[posicion] / vc_TDP[posicion];
                            IndDP[posicion] = vc_IndiceMedio[posicion].ToString("#.##");
                        }
                        //IndiceLesion
                        if (IndF[posicion] != "0" && IndS[posicion] != "0")
                        {
                            vc_IndiceLesion[posicion] = (vc_IndiceFrecuencia[posicion] + vc_IndiceSeveridad[posicion]) / TCDP;
                            IndILI[posicion] = vc_IndiceLesion[posicion].ToString("#.##");
                        }
                    }
                }
                else if (i > 3 && i < 6)
                {
                    if (i == 5)
                    {
                        //IndiceFrecuencia
                        if (vc_contadorAccidente[posicion] > 0)
                        {
                            vc_IndiceFrecuencia[posicion] = (vc_NCRP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndF[posicion] = vc_IndiceFrecuencia[posicion].ToString("#.##");
                        }
                        //IndiceSeveridad
                        if (TDP > 0)
                        {
                            vc_IndiceSeveridad[posicion] = (vc_TCDP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndS[posicion] = vc_IndiceSeveridad[posicion].ToString("#.##");
                        }
                        //IndiceMedio
                        vc_IndiceMedio[posicion] = ((vc_TDP[posicion] + vc_NCRP[posicion]) * 200000);
                        if (vc_IndiceMedio[posicion] > 0 && vc_TDP[posicion] > 0)
                        {
                            vc_IndiceMedio[posicion] = vc_IndiceMedio[posicion] / vc_TDP[posicion];
                            IndDP[posicion] = vc_IndiceMedio[posicion].ToString("#.##");
                        }
                        //IndiceLesion
                        if (IndF[posicion] != "0" && IndS[posicion] != "0")
                        {
                            vc_IndiceLesion[posicion] = (vc_IndiceFrecuencia[posicion] + vc_IndiceSeveridad[posicion]) / TCDP;
                            IndILI[posicion] = vc_IndiceLesion[posicion].ToString("#.##");
                        }

                    }
                    posicion = 1;
                    vc_dias_habiles[posicion] = vc_dias_habiles[posicion] + dias_habiles;
                    vc_horasMes[posicion] = vc_horasMes[posicion] + horasMes;
                    vc_HorasHombreLab[posicion] = vc_HorasHombreLab[posicion] + HorasHombreLab;
                    vc_NCRP[posicion] = vc_NCRP[posicion] + NCRP;
                    vc_contadorAccidente[posicion] = vc_contadorAccidente[posicion] + contadorAccidente;
                    vc_TDP[posicion] = vc_TDP[posicion] + TDP;
                    vc_TCDP[posicion] = vc_TCDP[posicion] + TCDP;
                }
                else if (i > 5 && i < 9)
                {
                    if (i == 8)
                    {
                        //IndiceFrecuencia
                        if (vc_contadorAccidente[posicion] > 0)
                        {
                            vc_IndiceFrecuencia[posicion] = (vc_NCRP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndF[posicion] = vc_IndiceFrecuencia[posicion].ToString("#.##");
                        }
                        //IndiceSeveridad
                        if (TDP > 0)
                        {
                            vc_IndiceSeveridad[posicion] = (vc_TCDP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndS[posicion] = vc_IndiceSeveridad[posicion].ToString("#.##");
                        }
                        //IndiceMedio
                        vc_IndiceMedio[posicion] = ((vc_TDP[posicion] + vc_NCRP[posicion]) * 200000);
                        if (vc_IndiceMedio[posicion] > 0 && vc_TDP[posicion] > 0)
                        {
                            vc_IndiceMedio[posicion] = vc_IndiceMedio[posicion] / vc_TDP[posicion];
                            IndDP[posicion] = vc_IndiceMedio[posicion].ToString("#.##");
                        }
                        //IndiceLesion
                        if (IndF[posicion] != "0" && IndS[posicion] != "0")
                        {
                            vc_IndiceLesion[posicion] = (vc_IndiceFrecuencia[posicion] + vc_IndiceSeveridad[posicion]) / TCDP;
                            IndILI[posicion] = vc_IndiceLesion[posicion].ToString("#.##");
                        }

                    }
                    posicion = 2;
                    vc_dias_habiles[posicion] = vc_dias_habiles[posicion] + dias_habiles;
                    vc_horasMes[posicion] = vc_horasMes[posicion] + horasMes;
                    vc_HorasHombreLab[posicion] = vc_HorasHombreLab[posicion] + HorasHombreLab;
                    vc_NCRP[posicion] = vc_NCRP[posicion] + NCRP;
                    vc_contadorAccidente[posicion] = vc_contadorAccidente[posicion] + contadorAccidente;
                    vc_TDP[posicion] = vc_TDP[posicion] + TDP;
                    vc_TCDP[posicion] = vc_TCDP[posicion] + TCDP;
                }
                else if (i > 8)
                {
                    if (i == 11)
                    {
                        //IndiceFrecuencia
                        if (vc_contadorAccidente[posicion] > 0)
                        {
                            vc_IndiceFrecuencia[posicion] = (vc_NCRP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndF[posicion] = vc_IndiceFrecuencia[posicion].ToString("#.##");
                        }
                        //IndiceSeveridad
                        if (TDP > 0)
                        {
                            vc_IndiceSeveridad[posicion] = (vc_TCDP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndS[posicion] = vc_IndiceSeveridad[posicion].ToString("#.##");
                        }
                        //IndiceMedio
                        vc_IndiceMedio[posicion] = ((vc_TDP[posicion] + vc_NCRP[posicion]) * 200000);
                        if (vc_IndiceMedio[posicion] > 0 && vc_TDP[posicion] > 0)
                        {
                            vc_IndiceMedio[posicion] = vc_IndiceMedio[posicion] / vc_TDP[posicion];
                            IndDP[posicion] = vc_IndiceMedio[posicion].ToString("#.##");
                        }
                        //IndiceLesion
                        if (IndF[posicion] != "0" && IndS[posicion] != "0")
                        {
                            vc_IndiceLesion[posicion] = (vc_IndiceFrecuencia[posicion] + vc_IndiceSeveridad[posicion]) / TCDP;
                            IndILI[posicion] = vc_IndiceLesion[posicion].ToString("#.##");
                        }

                    }
                    posicion = 3;
                    vc_dias_habiles[posicion] = vc_dias_habiles[posicion] + dias_habiles;
                    vc_horasMes[posicion] = vc_horasMes[posicion] + horasMes;
                    vc_HorasHombreLab[posicion] = vc_HorasHombreLab[posicion] + HorasHombreLab;
                    vc_NCRP[posicion] = vc_NCRP[posicion] + NCRP;
                    vc_contadorAccidente[posicion] = vc_contadorAccidente[posicion] + contadorAccidente;
                    vc_TDP[posicion] = vc_TDP[posicion] + TDP;
                    vc_TCDP[posicion] = vc_TCDP[posicion] + TCDP;
                }
            }

            #region vista trimestral
            DataTable dtTrimestral = new DataTable();

            if (dtTrimestral.Columns.Count == 0)
            {
                dtTrimestral.Columns.Add("Trimestre", typeof(string));
                dtTrimestral.Columns.Add("Nº de días Laborados", typeof(string));
                dtTrimestral.Columns.Add("Nº de Horas Laboradas", typeof(string));
                dtTrimestral.Columns.Add("Horas Hombre Laboradas", typeof(string));
                dtTrimestral.Columns.Add("Nº de Accidentes", typeof(string));

                dtTrimestral.Columns.Add("IF: Indice General de Frecuencia", typeof(string));
                dtTrimestral.Columns.Add("IS: Indice de Severidad Global", typeof(string));
                dtTrimestral.Columns.Add("IDP: Indice Medio de días perdidos por lesiones", typeof(string));
                dtTrimestral.Columns.Add("ILI: Indice de lesión incapacitante", typeof(string));
                dtTrimestral.Columns.Add("NCRP", typeof(string));
                dtTrimestral.Columns.Add("TDP", typeof(string));
                dtTrimestral.Columns.Add("TCDP", typeof(string));
            }

            DataRow NewRow;
            string[] trimestres = { "Enero-Marzo", "Abril-Junio", "Julio-Septiembre", "Octubre-Dciembre" };

            //trimestre
            for (int i = 0; i < trimestres.Length; i++)
            {
                NewRow = dtTrimestral.NewRow();
                NewRow[0] = trimestres[i];
                NewRow[1] = "" + vc_dias_habiles[i];
                NewRow[2] = "" + vc_horasMes[i];
                NewRow[3] = "" + vc_HorasHombreLab[i];
                NewRow[4] = "" + vc_contadorAccidente[i];
                NewRow[5] = "" + IndF[i];
                NewRow[6] = "" + IndS[i];
                NewRow[7] = "" + IndDP[i];
                NewRow[8] = "" + IndILI[i];
                NewRow[9] = "" + vc_NCRP[i];
                NewRow[10] = "" + vc_TDP[i];
                NewRow[11] = "" + vc_TCDP[i];
                dtTrimestral.Rows.Add(NewRow);
            }

            GridView3.DataSource = dtTrimestral;
            GridView3.DataBind();
            #endregion

        }

        public static void CargarSemestral_ReporteAccidentalidad(GridView GridView2, int anhoActual, int MesActual, int IdSucursal, int IdEmpresa)
        {

            int jornada = 0;
            List<empresa> ListaEmpresa = new List<empresa>();
            List<trabajador> ListaTrabajador = new List<trabajador>();

            int[] vc_contadorTrab = { 0, 0 };
            int[] vc_dias_habiles = { 0, 0 };
            Double[] vc_horasMes = { 0, 0 };
            Double[] vc_HorasHombreLab = { 0, 0 };
            Double[] vc_IndiceFrecuencia = { 0, 0 };
            Double[] vc_IndiceSeveridad = { 0, 0 };
            Double[] vc_IndiceMedio = { 0, 0 };
            Double[] vc_IndiceLesion = { 0, 0 };
            String[] IndF = { "0", "0" };
            String[] IndS = { "0", "0" };
            String[] IndDP = { "0", "0" };
            String[] IndILI = { "0", "0" };
            int[] vc_NCRP = { 0, 0 };
            int[] vc_contadorAccidente = { 0, 0 };
            int[] vc_TDP = { 0, 0 };
            int[] vc_TCDP = { 0, 0 };
            int posicion = 0;

            ListaEmpresa = Mgr_Empresa.Empresa(IdEmpresa);
            ListaTrabajador = Mgr_Trabajador.Trabajador(0, 0, IdSucursal);

            for (int y = 0; y < MesActual; y++)
            {
                int contadorTrab = 0;
                int dias_habiles = 0;
                Double horasMes = 0;
                Double HorasHombreLab = 0;
                int NCRP = 0;
                int contadorAccidente = 0;
                int TDP = 0;
                int TCDP = 0;

                DateTime fechaConsultar = new DateTime(anhoActual, (y + 1), 01);
                fechaConsultar = fechaConsultar.AddMonths(1).AddDays(-1);

                int DiasMes = fechaConsultar.Day;

                foreach (var item in ListaTrabajador)
                {
                    DateTime fechaIngreso = item.fecha_ingreso.Value;

                    if (fechaConsultar >= fechaIngreso)
                    {
                        if (anhoActual > fechaIngreso.Year)
                        {
                            fechaIngreso = new DateTime(anhoActual, (y + 1), 1);
                        }

                        List<trabajador_estatus> ListaTrabajadorEstatus = new List<trabajador_estatus>();
                        ListaTrabajadorEstatus = Mgr_Trabajador.TrabajadorReposo(item.id_trabajador, fechaIngreso, fechaConsultar);

                        foreach (var itemTrabEst in ListaTrabajadorEstatus)
                        {
                            if (itemTrabEst.fecha_constancia > fechaIngreso)
                            {
                                fechaIngreso = Convert.ToDateTime(itemTrabEst.fecha_constancia).AddDays(Convert.ToDouble(itemTrabEst.dias_reposo));
                            }

                            if (itemTrabEst.dias_reposo > 0)
                            {
                                TDP = TDP + Convert.ToInt32(itemTrabEst.dias_reposo);
                            }
                            TCDP++;
                        }

                        if (fechaIngreso <= fechaConsultar)
                        {
                            contadorTrab++;
                        }
                    }
                }

                foreach (var itemEmpresa in ListaEmpresa)
                {
                    jornada = Convert.ToInt32(itemEmpresa.jornada);
                }

                string[] diasFeriados = {
                    anhoActual+"-01-01", anhoActual+"-01-09", anhoActual+"-03-20", anhoActual+"-04-13", anhoActual+"-04-14",
                    anhoActual+"-05-01", anhoActual+"-05-29", anhoActual+"-06-19", anhoActual+"-06-26", anhoActual+"-07-03",
                    anhoActual+"-07-20", anhoActual+"-08-07", anhoActual+"-08-21", anhoActual+"-10-16", anhoActual+"-11-06",
                    anhoActual+"-11-13", anhoActual+"-12-08", anhoActual+"-12-25"};

                for (int x = 1; x <= DiasMes; x++)
                {
                    DateTime desde = new DateTime(anhoActual, (y + 1), x);
                    int numero_dia = Convert.ToInt16(desde.DayOfWeek.ToString("d"));


                    if (numero_dia == 1 || numero_dia == 2 || numero_dia == 3 || numero_dia == 4 || numero_dia == 5)
                    {
                        dias_habiles++;

                        if (jornada == 1)//Lunes a viernes  
                        { horasMes = horasMes + 9.5; }
                        else if (jornada == 2)//Lunes a Sabado  
                        { horasMes = horasMes + 8; }


                        for (int df = 0; df < diasFeriados.Length; df++)
                        {
                            if (Convert.ToDateTime(diasFeriados[df]) == desde)
                            {
                                dias_habiles--;
                                horasMes = horasMes - 8;
                            }
                        }
                    }

                    if (numero_dia == 6)
                    {
                        if (jornada == 2)//Lunes a Sabado  
                        {
                            dias_habiles++;
                            horasMes = horasMes + 8;

                            for (int df = 0; df < diasFeriados.Length; df++)
                            {
                                if (Convert.ToDateTime(diasFeriados[df]) == desde)
                                {
                                    dias_habiles--;
                                }
                            }
                        }
                    }
                }

                HorasHombreLab = contadorTrab * horasMes;

                #region cuento los accidentes
                DateTime fechaInicio = new DateTime(anhoActual, (y + 1), 01);
                DateTime fechaFin = fechaInicio.AddMonths(1).AddDays(-1);
                List<at_it_el_pa> ListaAccidentes = new List<at_it_el_pa>();
                ListaAccidentes = Getter.Accidente_Empresa_Reportes(IdEmpresa, fechaInicio, fechaFin);

                foreach (var itemListaAccidentes in ListaAccidentes)
                {
                    contadorAccidente++;
                }
                #endregion

                NCRP = contadorAccidente;

                if (contadorTrab == 0)
                {
                    dias_habiles = 0;
                    horasMes = 0;
                }

                if (y < 6)
                {
                    posicion = 0;
                    vc_dias_habiles[posicion] = vc_dias_habiles[posicion] + dias_habiles;
                    vc_horasMes[posicion] = vc_horasMes[posicion] + horasMes;
                    vc_HorasHombreLab[posicion] = vc_HorasHombreLab[posicion] + HorasHombreLab;
                    vc_NCRP[posicion] = vc_NCRP[posicion] + NCRP;
                    vc_contadorAccidente[posicion] = vc_contadorAccidente[posicion] + contadorAccidente;
                    vc_TDP[posicion] = vc_TDP[posicion] + TDP;
                    vc_TCDP[posicion] = vc_TCDP[posicion] + TCDP;

                    if (y == 5)
                    {
                        //IndiceFrecuencia
                        if (vc_contadorAccidente[posicion] > 0)
                        {
                            vc_IndiceFrecuencia[posicion] = (vc_NCRP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndF[posicion] = vc_IndiceFrecuencia[posicion].ToString("#.##");
                        }
                        //IndiceSeveridad
                        if (TDP > 0)
                        {
                            vc_IndiceSeveridad[posicion] = (vc_TCDP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndS[posicion] = vc_IndiceSeveridad[posicion].ToString("#.##");
                        }
                        //IndiceMedio
                        vc_IndiceMedio[posicion] = ((vc_TDP[posicion] + vc_NCRP[posicion]) * 200000);
                        if (vc_IndiceMedio[posicion] > 0 && vc_TDP[posicion] > 0)
                        {
                            vc_IndiceMedio[posicion] = vc_IndiceMedio[posicion] / vc_TDP[posicion];
                            IndDP[posicion] = vc_IndiceMedio[posicion].ToString("#.##");
                        }
                        //IndiceLesion
                        if (IndF[posicion] != "0" && IndS[posicion] != "0")
                        {
                            vc_IndiceLesion[posicion] = (vc_IndiceFrecuencia[posicion] + vc_IndiceSeveridad[posicion]) / TCDP;
                            IndILI[posicion] = vc_IndiceLesion[posicion].ToString("#.##");
                        }
                    }
                }
                else if (y > 5)
                {
                    posicion = 1;
                    vc_dias_habiles[posicion] = vc_dias_habiles[posicion] + dias_habiles;
                    vc_horasMes[posicion] = vc_horasMes[posicion] + horasMes;
                    vc_HorasHombreLab[posicion] = vc_HorasHombreLab[posicion] + HorasHombreLab;
                    vc_NCRP[posicion] = vc_NCRP[posicion] + NCRP;
                    vc_contadorAccidente[posicion] = vc_contadorAccidente[posicion] + contadorAccidente;
                    vc_TDP[posicion] = vc_TDP[posicion] + TDP;
                    vc_TCDP[posicion] = vc_TCDP[posicion] + TCDP;
                    if (y == 11)
                    {
                        //IndiceFrecuencia
                        if (vc_contadorAccidente[posicion] > 0)
                        {
                            vc_IndiceFrecuencia[posicion] = (vc_NCRP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndF[posicion] = vc_IndiceFrecuencia[posicion].ToString("#.##");
                        }
                        //IndiceSeveridad
                        if (TDP > 0)
                        {
                            vc_IndiceSeveridad[posicion] = (vc_TCDP[posicion] * 200000) / vc_HorasHombreLab[posicion];
                            IndS[posicion] = vc_IndiceSeveridad[posicion].ToString("#.##");
                        }
                        //IndiceMedio
                        vc_IndiceMedio[posicion] = ((vc_TDP[posicion] + vc_NCRP[posicion]) * 200000);
                        if (vc_IndiceMedio[posicion] > 0 && vc_TDP[posicion] > 0)
                        {
                            vc_IndiceMedio[posicion] = vc_IndiceMedio[posicion] / vc_TDP[posicion];
                            IndDP[posicion] = vc_IndiceMedio[posicion].ToString("#.##");
                        }
                        //IndiceLesion
                        if (IndF[posicion] != "0" && IndS[posicion] != "0")
                        {
                            vc_IndiceLesion[posicion] = (vc_IndiceFrecuencia[posicion] + vc_IndiceSeveridad[posicion]) / TCDP;
                            IndILI[posicion] = vc_IndiceLesion[posicion].ToString("#.##");
                        }

                    }
                }

                #region vista semestral
                DataTable dtSemestral = new DataTable();

                if (dtSemestral.Columns.Count == 0)
                {
                    dtSemestral.Columns.Add("Semestre", typeof(string));
                    dtSemestral.Columns.Add("Nº de días Laborados", typeof(string));
                    dtSemestral.Columns.Add("Nº de Horas Laboradas", typeof(string));
                    dtSemestral.Columns.Add("Horas Hombre Laboradas", typeof(string));
                    dtSemestral.Columns.Add("Nº de Accidentes", typeof(string));

                    dtSemestral.Columns.Add("IF: Indice General de Frecuencia", typeof(string));
                    dtSemestral.Columns.Add("IS: Indice de Severidad Global", typeof(string));
                    dtSemestral.Columns.Add("IDP: Indice Medio de días perdidos por lesiones", typeof(string));
                    dtSemestral.Columns.Add("ILI: Indice de lesión incapacitante", typeof(string));
                    dtSemestral.Columns.Add("NCRP", typeof(string));
                    dtSemestral.Columns.Add("TDP", typeof(string));
                    dtSemestral.Columns.Add("TCDP", typeof(string));
                }

                DataRow NewRow;
                string[] semestres = { "Enero-Junio", "Julio-Diciembre" };

                for (int x = 0; x < semestres.Length; x++)
                {
                    NewRow = dtSemestral.NewRow();
                    NewRow[0] = semestres[x];
                    NewRow[1] = "" + vc_dias_habiles[x];
                    NewRow[2] = "" + vc_horasMes[x];
                    NewRow[3] = "" + vc_HorasHombreLab[x];
                    NewRow[4] = "" + vc_contadorAccidente[x];
                    NewRow[5] = "" + IndF[x];
                    NewRow[6] = "" + IndS[x];
                    NewRow[7] = "" + IndDP[x];
                    NewRow[8] = "" + IndILI[x];
                    NewRow[9] = "" + vc_NCRP[x];
                    NewRow[10] = "" + vc_TDP[x];
                    NewRow[11] = "" + vc_TCDP[x];
                    dtSemestral.Rows.Add(NewRow);
                }

                GridView2.DataSource = dtSemestral;
                GridView2.DataBind();
                #endregion

            }
        }

        public static void CargaAnual_ReporteAccidentalidad(GridView GridView4, int IdSucursal, int IdEmpresa)
        {

            #region vista anual

            DateTime fechaActual = DateTime.Now;
            int anhoActual = fechaActual.Year;
            int MesActual = fechaActual.Month;

            DataTable dtAnual = new DataTable();
            int jornada = 0;

            List<empresa> ListaEmpresa = new List<empresa>();
            List<trabajador> ListaTrabajador = new List<trabajador>();
            ListaEmpresa = Mgr_Empresa.Empresa(IdEmpresa);
            ListaTrabajador = Mgr_Trabajador.Trabajador(0, 0, IdSucursal);

            if (dtAnual.Columns.Count == 0)
            {
                dtAnual.Columns.Add("Año", typeof(string));
                dtAnual.Columns.Add("Nº de días Laborados", typeof(string));
                dtAnual.Columns.Add("Nº de Horas Laboradas", typeof(string));
                dtAnual.Columns.Add("Horas Hombre Laboradas", typeof(string));
                dtAnual.Columns.Add("Nº de Accidentes", typeof(string));

                dtAnual.Columns.Add("IF: Indice General de Frecuencia", typeof(string));
                dtAnual.Columns.Add("IS: Indice de Severidad Global", typeof(string));
                dtAnual.Columns.Add("IDP: Indice Medio de días perdidos por lesiones", typeof(string));
                dtAnual.Columns.Add("ILI: Indice de lesión incapacitante", typeof(string));
                dtAnual.Columns.Add("NCRP", typeof(string));
                dtAnual.Columns.Add("TDP", typeof(string));
                dtAnual.Columns.Add("TCDP", typeof(string));
            }

            for (int i = anhoActual; i > (anhoActual - 10); i--)
            {
                if (i != anhoActual)
                {
                    MesActual = 12;
                }

                int dias_habiles_Anual = 0;
                Double horasMes_Anual = 0;
                Double HorasHombreLab_Anual = 0;
                Double IndiceFrecuencia_Anual = 0;
                Double IndiceSeveridad_Anual = 0;
                Double IndiceMedio_Anual = 0;
                Double IndiceLesion_Anual = 0;
                String IndF_Anual = "0";
                String IndS_Anual = "0";
                String IndDP_Anual = "0";
                String IndILI_Anual = "0";
                int NCRP_Anual = 0;
                int contadorAccidente_Anual = 0;
                int TDP_Anual = 0;
                int TCDP_Anual = 0;

                for (int y = 0; y < MesActual; y++)
                {
                    int contadorTrab = 0;
                    int dias_habiles = 0;
                    int NCRP = 0;
                    int contadorAccidente = 0;
                    int TDP = 0;
                    int TCDP = 0;
                    Double horasMes = 0;
                    Double HorasHombreLab = 0;

                    DateTime fechaConsultar = new DateTime(i, (y + 1), 01);
                    fechaConsultar = fechaConsultar.AddMonths(1).AddDays(-1);

                    int DiasMes = fechaConsultar.Day;

                    foreach (var item in ListaTrabajador)
                    {
                        DateTime fechaIngreso = item.fecha_ingreso.Value;

                        if (fechaConsultar >= fechaIngreso)
                        {
                            if (i > fechaIngreso.Year)
                            {
                                fechaIngreso = new DateTime(i, (y + 1), 1);
                            }

                            List<trabajador_estatus> ListaTrabajadorEstatus = new List<trabajador_estatus>();
                            ListaTrabajadorEstatus = Mgr_Trabajador.TrabajadorReposo(item.id_trabajador, fechaIngreso, fechaConsultar);

                            foreach (var itemTrabEst in ListaTrabajadorEstatus)
                            {
                                if (itemTrabEst.fecha_constancia > fechaIngreso)
                                {
                                    fechaIngreso = Convert.ToDateTime(itemTrabEst.fecha_constancia).AddDays(Convert.ToDouble(itemTrabEst.dias_reposo));
                                }

                                if (itemTrabEst.dias_reposo > 0)
                                {
                                    TDP = TDP + Convert.ToInt32(itemTrabEst.dias_reposo);
                                }
                                TCDP++;
                            }

                            if (fechaIngreso <= fechaConsultar)
                            {
                                contadorTrab++;
                            }
                        }
                    }

                    foreach (var itemEmpresa in ListaEmpresa)
                    {
                        jornada = Convert.ToInt32(itemEmpresa.jornada);
                    }

                    string[] diasFeriados = {
                    i+"-01-01", i+"-01-09", i+"-03-20", i+"-04-13", i+"-04-14",
                    i+"-05-01", i+"-05-29", i+"-06-19", i+"-06-26", i+"-07-03",
                    i+"-07-20", i+"-08-07", i+"-08-21", i+"-10-16", i+"-11-06",
                    i+"-11-13", i+"-12-08", i+"-12-25"};

                    for (int x = 1; x <= DiasMes; x++)
                    {
                        DateTime desde = new DateTime(i, (y + 1), x);
                        int numero_dia = Convert.ToInt16(desde.DayOfWeek.ToString("d"));


                        if (numero_dia == 1 || numero_dia == 2 || numero_dia == 3 || numero_dia == 4 || numero_dia == 5)
                        {
                            dias_habiles++;

                            if (jornada == 1)//Lunes a viernes  
                            { horasMes = horasMes + 9.5; }
                            else if (jornada == 2)//Lunes a Sabado  
                            { horasMes = horasMes + 8; }


                            for (int df = 0; df < diasFeriados.Length; df++)
                            {
                                if (Convert.ToDateTime(diasFeriados[df]) == desde)
                                {
                                    dias_habiles--;
                                    horasMes = horasMes - 8;
                                }
                            }
                        }

                        if (numero_dia == 6)
                        {
                            if (jornada == 2)//Lunes a Sabado  
                            {
                                dias_habiles++;
                                horasMes = horasMes + 8;

                                for (int df = 0; df < diasFeriados.Length; df++)
                                {
                                    if (Convert.ToDateTime(diasFeriados[df]) == desde)
                                    {
                                        dias_habiles--;
                                    }
                                }
                            }
                        }
                    }

                    HorasHombreLab = contadorTrab * horasMes;

                    #region cuento los accidentes
                    DateTime fechaInicio = new DateTime(i, (y + 1), 01);
                    DateTime fechaFin = fechaInicio.AddMonths(1).AddDays(-1);
                    List<at_it_el_pa> ListaAccidentes = new List<at_it_el_pa>();
                    ListaAccidentes = Getter.Accidente_Empresa_Reportes(IdEmpresa, fechaInicio, fechaFin);

                    foreach (var itemListaAccidentes in ListaAccidentes)
                    {
                        contadorAccidente++;
                    }
                    #endregion

                    NCRP = contadorAccidente;

                    if (contadorTrab == 0)
                    {
                        dias_habiles = 0;
                        horasMes = 0;
                    }

                    dias_habiles_Anual = dias_habiles_Anual + dias_habiles;
                    horasMes_Anual = horasMes_Anual + horasMes;
                    HorasHombreLab_Anual = HorasHombreLab_Anual + HorasHombreLab;
                    NCRP_Anual = NCRP_Anual + NCRP;
                    contadorAccidente_Anual = contadorAccidente_Anual + contadorAccidente;
                    TDP_Anual = TDP_Anual + TDP;
                    TCDP_Anual = TCDP_Anual + TCDP;

                    if (y == 11)
                    {
                        //IndiceFrecuencia
                        if (contadorAccidente_Anual > 0)
                        {
                            IndiceFrecuencia_Anual = (NCRP_Anual * 200000) / HorasHombreLab_Anual;
                            IndF_Anual = IndiceFrecuencia_Anual.ToString("#.##");
                        }
                        //IndiceSeveridad
                        if (TDP > 0)
                        {
                            IndiceSeveridad_Anual = (TCDP_Anual * 200000) / HorasHombreLab_Anual;
                            IndS_Anual = IndiceSeveridad_Anual.ToString("#.##");
                        }
                        //IndiceMedio
                        IndiceMedio_Anual = ((TDP_Anual + NCRP_Anual) * 200000);
                        if (IndiceMedio_Anual > 0 && TDP_Anual > 0)
                        {
                            IndiceMedio_Anual = IndiceMedio_Anual / TDP_Anual;
                            IndDP_Anual = IndiceMedio_Anual.ToString("#.##");
                        }
                        //IndiceLesion
                        if (IndF_Anual != "0" && IndS_Anual != "0")
                        {
                            IndiceLesion_Anual = (IndiceFrecuencia_Anual + IndiceSeveridad_Anual) / TCDP_Anual;
                            IndILI_Anual = IndiceLesion_Anual.ToString("#.##");
                        }
                    }
                }

                DataRow NewRow;

                NewRow = dtAnual.NewRow();
                NewRow[0] = "" + i;
                NewRow[1] = "" + dias_habiles_Anual;
                NewRow[2] = "" + horasMes_Anual;
                NewRow[3] = "" + HorasHombreLab_Anual;
                NewRow[4] = "" + contadorAccidente_Anual;
                NewRow[5] = "" + IndF_Anual;
                NewRow[6] = "" + IndS_Anual;
                NewRow[7] = "" + IndDP_Anual;
                NewRow[8] = "" + IndILI_Anual;
                NewRow[9] = "" + NCRP_Anual;
                NewRow[10] = "" + TDP_Anual;
                NewRow[11] = "" + TCDP_Anual;
                dtAnual.Rows.Add(NewRow);
            }

            GridView4.DataSource = dtAnual;
            GridView4.DataBind();
            #endregion
        }

        public static void AlarmasDia(Model_UsuarioSistema ObjUsuario, Panel pAlarmas, DateTime fechaBuscar)
        {
            int contalarmas = 1;
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<alarma> ListaAlarmas = new List<alarma>();
            ListaAlarmas = contexto.alarma.Where(x =>
            x.id_usuario == ObjUsuario.Id_usuario &&
            x.fecha == fechaBuscar
            ).ToList();

            string strFecha = fechaBuscar.ToString("dd/MM/yyyy");

            foreach (var item in ListaAlarmas)
            {
                if (contalarmas < 9)
                {
                    string clase = string.Empty;
                    if (item.prioridad == "Baja") { clase = "label bg-aqua"; }
                    else if (item.prioridad == "Media") { clase = "label bg-yellow"; }
                    else if (item.prioridad == "Alta") { clase = "label bg-red"; }

                    CrearLiteral("<tr>" +
                       "<td>" + item.descripcion + "</td>" +
                       "<td>" + strFecha + "</td>" +
                       "<td><span class='" + clase + "'>" + item.prioridad + "</span></td>" +
                       "</tr>"
                       , pAlarmas);
                }
                if (contalarmas == 10)
                {
                    CrearLiteral("<tr><td><a target='_blnk' href='../Hacer/index_Alarmas.aspx' >Ver Todas las Alarmas</a><td></tr>", pAlarmas);
                }
                contalarmas++;
            }
        }

    }
}
