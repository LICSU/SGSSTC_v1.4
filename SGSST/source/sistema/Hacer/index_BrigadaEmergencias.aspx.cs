using Capa_Datos;
using Capa_Datos.Manager.Trabajador;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Datos.Manager.Documento;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_BrigadaEmergencias : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private string NodoPrincipal = string.Empty;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                ViewState["contador"] = "2";
                CargarListas();
            }
            else
            {
                foreach (var ctlID in Page.Request.Form.AllKeys)
                {
                    if (ctlID != null)
                    {
                        Control c = Page.FindControl(ctlID) as Control;
                        if (c is Button || c is ImageButton)
                        {
                            if (c.ClientID.Contains("btnAgregarFila"))
                            {
                                //collapse3.Attributes.Add("class", "panel-collapse collapse in");
                                crearCampos(Convert.ToInt32(ViewState["contador"]));
                            }
                            if (c.ClientID.Contains("btnCalculate"))
                            {
                                //collapse3.Attributes.Add("class", "panel-collapse collapse in");
                                int valor = Convert.ToInt32(ViewState["contador"]) - 1;
                                ViewState["contador"] = string.Empty + valor;
                                crearCampos(Convert.ToInt32(ViewState["contador"]));
                            }
                            if (c.ClientID.Contains("btnGuardar"))
                            {
                                int valor = Convert.ToInt32(ViewState["contador"]) - 1;
                                ViewState["contador"] = string.Empty + valor;
                                crearCampos(Convert.ToInt32(ViewState["contador"]));
                            }
                            if (c.ClientID.Contains("btnPrint"))
                            {
                                int valor = Convert.ToInt32(ViewState["contador"]) - 1;
                                ViewState["contador"] = string.Empty + valor;
                                crearCampos(Convert.ToInt32(ViewState["contador"]));
                            }
                        }
                    }
                }
            }
        }
        private void cargarBigrada()
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            int idBrigada = Mgr_Documento.Get_BrigadaEmergencias(IdSucursal);

            if (idBrigada != 0)
            {
                List<brigada_emergencia> ListaBrigadaEmergencia = new List<brigada_emergencia>();
                ListaBrigadaEmergencia = Mgr_Documento.Get_BrigadaEmergencia(idBrigada);

                if (ListaBrigadaEmergencia.Count > 0)
                {
                    foreach (var item in ListaBrigadaEmergencia)
                    {
                        txtPerfiles.Text = item.perfiles;
                        txtFuncBrig.Text = item.func_brigadistas;
                        txtBrigCom.Text = item.brigada_comunicacion;
                        txtDirEmeInt.Text = item.dir_emergencia_int;
                        txtBrigPriAux.Text = item.brigada_prim_aux;
                        txtBrigIncendio.Text = item.brigada_incendio;
                        txtBrigEvacuacion.Text = item.brigada_evacuacion;
                    }
                }

                List<procedimiento_comunicacion> ListaProcedimientoComunicacion = new List<procedimiento_comunicacion>();
                ListaProcedimientoComunicacion = Mgr_Documento.Get_ProcedimientoComunicacion(idBrigada);

                crearCampos((ListaProcedimientoComunicacion.Count));

                int contador = 1;
                int posicion = 3;

                if (ListaProcedimientoComunicacion.Count > 0)
                {
                    foreach (var item in ListaProcedimientoComunicacion)
                    {
                        if (contador == 1)
                        {
                            ddlTrabjador1.SelectedValue = item.nombre;
                            txtCargo1.Text = item.cargo;
                            txtTelefono1.Text = item.num_telefono;
                            ddlTrabjador2.SelectedValue = item.llamar;
                        }
                        else
                        {
                            DropDownList miDropDownList1 = (DropDownList)pTrabajador.FindControl("ddlTrabjador" + posicion);
                            miDropDownList1.SelectedValue = item.nombre;
                            posicion++;

                            TextBox miTextBox1 = (TextBox)pTrabajador.FindControl("txtCargo" + contador);
                            miTextBox1.Text = item.cargo;

                            TextBox miTextBox2 = (TextBox)pTrabajador.FindControl("txtTelefono" + contador);
                            miTextBox2.Text = item.num_telefono;

                            DropDownList miDropDownList2 = (DropDownList)pTrabajador.FindControl("ddlTrabjador" + posicion);
                            miDropDownList2.SelectedValue = item.nombre;
                            posicion++;
                        }
                        contador++;
                    }

                    #region grafica
                    List<NodosArbol> nodos = new List<NodosArbol>();
                    contador = 0;
                    string valorNodo = string.Empty;
                    NodoPrincipal = ddlTrabjador1.SelectedItem.ToString().Replace(" ", "_");

                    foreach (Control micontrol in pTrabajador.Controls)
                    {
                        if (micontrol is DropDownList)
                        {
                            DropDownList miDDL = (DropDownList)micontrol;
                            contador++;

                            if (contador % 2 == 1)
                            {
                                valorNodo = miDDL.SelectedItem.ToString().Replace(" ", "_");
                            }
                            else
                            {
                                nodos.Add(new NodosArbol()
                                {
                                    Nodo1 = valorNodo,
                                    Nodo2 = miDDL.SelectedItem.ToString().Replace(" ", "_"),
                                    valor = valorNodo + " " + miDDL.SelectedItem.ToString().Replace(" ", "_")
                                });
                            }
                        }
                    }

                    var groupedList = nodos.GroupBy(x => new { x.Nodo1, x.Nodo2 }).Select(grp => grp.ToList()).ToList();

                    string[] valores = CrearLista(groupedList, NodoPrincipal);


                    StringBuilder str = new StringBuilder();
                    str.Append(@"<script type=*text/javascript*>
                    google.charts.load('current', { packages:['wordtree']});
                    google.charts.setOnLoadCallback(drawSimpleNodeChart);
                    
                    function drawSimpleNodeChart()
                    {
                    var nodeListData = new google.visualization.arrayToDataTable([
                    ['id', 'childLabel', 'parent', 'size', { role: 'style' }],");

                    for (int i = 0; i < valores.Length; i++)
                    {
                        if (i == (valores.Length - 1))
                        {
                            str.Append(@"[" + valores[i] + "]]); ");
                        }
                        else
                        {
                            str.Append(@"[" + valores[i] + "],");
                        }

                    }


                    str.Append(@"var options = {
                      colors: ['black', 'black', 'black'],
                      wordtree: {
                        format: 'explicit',
                        type: 'suffix'
                      }
                    };
        
        var wordtree = new google.visualization.WordTree(document.getElementById('TreeChart'));
        wordtree.draw(nodeListData, options);
        }
        </script>");

                    string Myscript = str.ToString().Replace('*', '"');
                    ltReporte.Text = Myscript;
                    btnCalculate.Focus();
                    #endregion
                }

                if (ListaProcedimientoComunicacion.Count > 1)
                {
                    ViewState["contador"] = string.Empty + ListaProcedimientoComunicacion.Count;
                }
                else
                {
                    ViewState["contador"] = "2";
                }
            }
        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            }
            if (BoolEmpSuc.Item2)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Mgr_Trabajador.Lista_Trabajadores_Sucursal(ddlTrabjador1, ObjUsuario.Id_sucursal);
                Mgr_Trabajador.Lista_Trabajadores_Sucursal(ddlTrabjador2, ObjUsuario.Id_sucursal);
            }
        }
        #endregion


        #region campos dinamicos
        private void crearCampos(int valor)
        {
            int ContFilas = 0;
            ContFilas = valor;
            int posicion = 3;

            for (int i = 2; i <= ContFilas; i++)
            {
                ControlesDinamicos.CrearLiteral("<tr><td align='center'>" + i + "</td>", pTrabajador);
                ControlesDinamicos.CrearLiteral("<td>", pTrabajador); CrearDropDownList("ddlTrabjador" + posicion, pTrabajador);
                ControlesDinamicos.CrearRequiredFieldValidator("ddlTrabjador" + posicion, pTrabajador, "ValidationArbol");
                ControlesDinamicos.CrearLiteral("</td>", pTrabajador);
                posicion++;

                ControlesDinamicos.CrearLiteral("<td>", pTrabajador);
                ControlesDinamicos.CrearTextbox("txtCargo" + i, pTrabajador, TextBoxMode.SingleLine);
                ControlesDinamicos.CrearRequiredFieldValidator("txtCargo" + i, pTrabajador, "ValidationArbol");
                ControlesDinamicos.CrearLiteral("</td>", pTrabajador);
                 
                ControlesDinamicos.CrearLiteral("<td>", pTrabajador);
                ControlesDinamicos.CrearTextbox("txtTelefono" + i, pTrabajador, TextBoxMode.SingleLine);
                ControlesDinamicos.CrearRequiredFieldValidator("txtTelefono" + i, pTrabajador, "ValidationArbol");
                ControlesDinamicos.CrearLiteral("</td>", pTrabajador);
                 
                ControlesDinamicos.CrearLiteral("<td>", pTrabajador);
                CrearDropDownList("ddlTrabjador" + posicion, pTrabajador);
                ControlesDinamicos.CrearRequiredFieldValidator("ddlTrabjador" + posicion, pTrabajador, "ValidationArbol");
                ControlesDinamicos.CrearLiteral("</td></tr>", pTrabajador);
                posicion++;
            }
            ViewState["contador"] = string.Empty + (Convert.ToInt32(ViewState["contador"]) + 1);

        }
        private void CrearDropDownList(string id, Panel _panel)
        {
            DropDownList miDropDownList;
            miDropDownList = new DropDownList();
            miDropDownList.ID = id;
            miDropDownList.CssClass = "form-control";
            Mgr_Trabajador.Lista_Trabajadores_Sucursal(miDropDownList, ObjUsuario.Id_sucursal);
            _panel.Controls.Add(miDropDownList);
        }
        #endregion

        #region acciones
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                txtPerfiles.Text,
                txtFuncBrig.Text,
                txtBrigCom.Text,
                txtDirEmeInt.Text,
                txtBrigPriAux.Text,
                txtBrigIncendio.Text,
                txtBrigEvacuacion.Text
            };

            PrintFile.PrintBrigada(valores, pTrabajador, this);
        }
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            brigada_emergencia nuevo = new brigada_emergencia()
            {
                id_sucursal = IdSucursal,
                perfiles = txtPerfiles.Text,
                func_brigadistas = txtFuncBrig.Text,
                brigada_comunicacion = txtBrigCom.Text,
                dir_emergencia_int = txtDirEmeInt.Text,
                brigada_prim_aux = txtBrigPriAux.Text,
                brigada_incendio = txtBrigIncendio.Text,
                brigada_evacuacion = txtBrigEvacuacion.Text
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            if (ObjUsuario.Error)
            {
                int IdBrigada = Mgr_Documento.Get_BrigadaEmergencias(IdSucursal);

                int contador = 0;
                string _nombre = string.Empty;
                string _cargo = string.Empty;
                string _telefono = string.Empty;
                string _llamar = string.Empty;

                foreach (Control micontrol in pTrabajador.Controls)
                {
                    if (micontrol is DropDownList || micontrol is TextBox)
                    {
                        DropDownList miDDL = null;
                        TextBox mitxt = null;

                        if (micontrol is DropDownList) { miDDL = (DropDownList)micontrol; }
                        if (micontrol is TextBox) { mitxt = (TextBox)micontrol; }

                        contador++;

                        if (contador == 1) { _nombre = miDDL.SelectedValue; }
                        if (contador == 2) { _cargo = mitxt.Text; }
                        if (contador == 3) { _telefono = mitxt.Text; }
                        if (contador == 4)
                        {
                            _llamar = miDDL.SelectedValue;

                            procedimiento_comunicacion nuevoProc = new procedimiento_comunicacion()
                            {
                                id_brigada = IdBrigada,
                                nombre = _nombre,
                                cargo = _cargo,
                                num_telefono = _telefono,
                                llamar = _llamar
                            };
                            ObjUsuario.Error = CRUD.Add_Fila(nuevoProc);
                            contador = 0;
                        }

                    }
                }

                if (ObjUsuario.Error)
                {
                    //Response.Redirect(Paginas.index_BrigadaEmergencias.Value);
                    cargarBigrada();
                    Modal.MostrarAlertaEdit(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txtBuscar);
                }
            }
        }
        protected void btnAgregarFila_Onclick(object sender, EventArgs e)
        {

        }
        protected void btnCalculate_Onclick(object sender, EventArgs e)
        {
            List<NodosArbol> nodos = new List<NodosArbol>();
            int contador = 0;
            string valorNodo = string.Empty;
            NodoPrincipal = ddlTrabjador1.SelectedItem.ToString().Replace(" ", "_");

            foreach (Control micontrol in pTrabajador.Controls)
            {
                if (micontrol is DropDownList)
                {
                    DropDownList miDDL = (DropDownList)micontrol;
                    contador++;

                    if (contador % 2 == 1)
                    {
                        valorNodo = miDDL.SelectedItem.ToString().Replace(" ", "_");
                    }
                    else
                    {
                        nodos.Add(new NodosArbol()
                        {
                            Nodo1 = valorNodo,
                            Nodo2 = miDDL.SelectedItem.ToString().Replace(" ", "_"),
                            valor = valorNodo + " " + miDDL.SelectedItem.ToString().Replace(" ", "_")
                        });
                    }
                }
            }

            var groupedList = nodos.GroupBy(x => new { x.Nodo1, x.Nodo2 }).Select(grp => grp.ToList()).ToList();

            string[] valores = CrearLista(groupedList, NodoPrincipal);


            StringBuilder str = new StringBuilder();
            str.Append(@"<script type=*text/javascript*>
                    google.charts.load('current', { packages:['wordtree']});
                    google.charts.setOnLoadCallback(drawSimpleNodeChart);
                    
                    function drawSimpleNodeChart()
                    {
                    var nodeListData = new google.visualization.arrayToDataTable([
                    ['id', 'childLabel', 'parent', 'size', { role: 'style' }],");

            for (int i = 0; i < valores.Length; i++)
            {
                if (i == (valores.Length - 1))
                {
                    str.Append(@"[" + valores[i] + "]]); ");
                }
                else
                {
                    str.Append(@"[" + valores[i] + "],");
                }

            }


            str.Append(@"var options = {
                      colors: ['black', 'black', 'black'],
                      wordtree: {
                        format: 'explicit',
                        type: 'suffix'
                      }
                    };
        
        var wordtree = new google.visualization.WordTree(document.getElementById('TreeChart'));
        wordtree.draw(nodeListData, options);
        }
        </script>");

            string Myscript = str.ToString().Replace('*', '"');
            ltReporte.Text = Myscript;
            btnCalculate.Focus();
        }
        private string[] CrearLista(List<List<NodosArbol>> groupedList, string _NodoPrincipal)
        {
            int cont = 0;
            int posicion = -1;
            string[] valores = new string[(groupedList.Count + 1)];

            valores[cont] = cont + ",'" + _NodoPrincipal + "'," + posicion + "," + "1,'black'";


            foreach (var item in groupedList)
            {
                posicion = GetPosicion(valores, item[0].Nodo1);
                cont++;

                string nodo;
                if (posicion == -2) { posicion = 0; nodo = " VER FILA" + cont + ": (Error_Nodo de" + item[0].Nodo1 + " con " + item[0].Nodo2 + ")"; }
                else { nodo = item[0].Nodo2; }
                valores[cont] = cont + ",'" + nodo + "'," + posicion + "," + "1,'black'";
            }

            return valores;

        }
        private int GetPosicion(string[] ArrNodos, string nodo)
        {
            int posicion = -2;

            for (int i = 0; i < ArrNodos.Length; i++)
            {
                if (ArrNodos[i] != null)
                {
                    if (ArrNodos[i].Contains(nodo))
                    {
                        string[] valores = ArrNodos[i].Split(',');
                        posicion = Convert.ToInt32(valores[0]);
                        i = ArrNodos.Length;
                    }
                }
            }

            return posicion;
        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Lista_Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                Mgr_Trabajador.Lista_Trabajadores_Sucursal(ddlTrabjador1, Convert.ToInt32(ddlSucursal.SelectedValue));
                Mgr_Trabajador.Lista_Trabajadores_Sucursal(ddlTrabjador2, Convert.ToInt32(ddlSucursal.SelectedValue));
                chEditor.Visible = true;
                chEditorNo.Visible = false;
                cargarBigrada();
            }
        }
        #endregion
    }
}