<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EncuestaPoliticaSST.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_EncuestaPoliticaSST" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel runat="server" ID="panel1">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_Encuesta_PoliticaSST.aspx">Encuesta De Conocimiento</a></li>
            <li><a href="#">Crear Encuesta</a></li>
        </ol>

        <div class="page-header">
            <h3 class="text-center">Encuesta De Conocimiento De La Política SGSST</h3>
        </div>
        <div class="row text-center">
                <div class="row">

                    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                        <div id="divAlerta" runat="server">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                        <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <div class="col-md-4">
                        <h4 class="text-center">Trabajador</h4>
                        <asp:DropDownList ID="ddlTrabajador" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="ddlTrabajador" runat="server"
                            ValidationGroup="ValidationAdd" />
                    </div>
                </div>

                <br />

                <div class="box-body no-padding">
                    <table class="table table-condensed">
                        <tbody>

                            <!-- fila 1 -->
                            <tr class="bg-aqua color-palette">
                                <th class="col-md-1 text-center">N°</th>
                                <th class="col-md-4 text-center">PREGUNTAS</th>
                                <th class="col-md-1 text-center">SI</th>
                                <th class="col-md-1 text-center">NO</th>
                                <th class="col-md-5 text-center">OBSERVACIONES</th>
                            </tr>

                            <tr>
                                <td class="text-center">1</td>

                                <td class="text-left">¿Es de su Conocimiento la Política de Seguridad y Salud en el Trabajo de la Organización?
                                </td>

                                <td>
                                    <input id="radio1" type="radio" name="rbf1" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio2" type="radio" name="rbf1" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox1" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">2</td>

                                <td class="text-left">¿Está publicado en Cartelera o en medios electrónicos el documento de la Política de Seguridad y Salud en el Trabajo de la Organización?
                                </td>

                                <td>
                                    <input id="radio3" type="radio" name="rbf2" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio4" type="radio" name="rbf2" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox2" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">3</td>

                                <td class="text-left">¿Es concisa y está redactada con claridad?
                                </td>

                                <td>
                                    <input id="radio5" type="radio" name="rbf3" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio6" type="radio" name="rbf3" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox3" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">4</td>

                                <td class="text-left">¿Está fechada y firmada por el representante legal de la Empresa?
                                </td>

                                <td>
                                    <input id="radio7" type="radio" name="rbf4" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio8" type="radio" name="rbf4" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox4" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">5</td>

                                <td class="text-left">¿La Política es específica para la Empresa? 
                                </td>

                                <td>
                                    <input id="radio9" type="radio" name="rbf5" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio10" type="radio" name="rbf5" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox5" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">6</td>

                                <td class="text-left">¿ Es apropiada para la naturaleza de los peligros y el tamaño de la organización?
                                </td>

                                <td>
                                    <input id="radio11" type="radio" name="rbf6" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio12" type="radio" name="rbf6" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox6" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">7</td>

                                <td class="text-left">¿Esta implícito en el Documento el compromiso de la alta dirección de la organización con la seguridad y la salud en el trabajo?
                                </td>

                                <td>
                                    <input id="radio13" type="radio" name="rbf7" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio14" type="radio" name="rbf7" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox7" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">8</td>

                                <td class="text-left">¿La organización se compromete a Proteger la seguridad y salud de todos los trabajadores, mediante la mejora continua del SG-SST?
                                </td>

                                <td>
                                    <input id="radio15" type="radio" name="rbf8" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio16" type="radio" name="rbf8" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox8" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">9</td>

                                <td class="text-left">¿Se compromete a cumplir la normatividad nacional vigente aplicable en materia de riesgos laborales?
                                </td>

                                <td>
                                    <input id="radio17" type="radio" name="rbf9" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio18" type="radio" name="rbf9" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox9" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">10</td>

                                <td class="text-left">¿Se Compromete a mantener el bienestar físico y mental de todos los trabajadores?
                                </td>

                                <td>
                                    <input id="radio19" type="radio" name="rbf10" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio20" type="radio" name="rbf10" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox10" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">11</td>

                                <td class="text-left">¿Se Compromete a establecer una cultura de prevención de Riesgos Laborales?
                                </td>

                                <td>
                                    <input id="radio21" type="radio" name="rbf11" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio22" type="radio" name="rbf11" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox11" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">12</td>

                                <td class="text-left">¿La Polìtica contempla  las normas y responsabilidades a todos los niveles de la organización?
                                </td>

                                <td>
                                    <input id="radio23" type="radio" name="rbf12" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio24" type="radio" name="rbf12" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox12" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">13</td>

                                <td class="text-left">¿Usted comprende las directrices descritas en la Política de Seguridad y Salud en el Trabajo?
                                </td>

                                <td>
                                    <input id="radio25" type="radio" name="rbf13" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio26" type="radio" name="rbf13" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox13" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">14</td>

                                <td class="text-left">¿Usted acata los lineamientos establecidos en la Política de Seguridad y Salud en el Trabajo?
                                </td>

                                <td>
                                    <input id="radio27" type="radio" name="rbf14" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio28" type="radio" name="rbf14" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox14" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">15</td>

                                <td class="text-left">¿Usted participa en la ejecución de la política de Seguridad y Salud en el Trabajo?
                                </td>

                                <td>
                                    <input id="radio29" type="radio" name="rbf15" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio30" type="radio" name="rbf15" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox15" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">16</td>

                                <td class="text-left">¿Usted Considera que la Política de Seguridad y Salud en el Trabajo complementa el logro de los objetivos de Seguridad y Salud en el Trabajo?
                                </td>

                                <td>
                                    <input id="radio31" type="radio" name="rbf16" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio32" type="radio" name="rbf16" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox16" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">17</td>

                                <td class="text-left">¿Se realizan grupos de trabajo para escuchar las opiniones de los trabajadores y las necesidades en materia de seguridad y salud en el trabajo? para posibles actualizaciones de la Política de Seguridad y Salud en el Trabajo
                                </td>

                                <td>
                                    <input id="radio33" type="radio" name="rbf17" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio34" type="radio" name="rbf17" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox17" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">18</td>

                                <td class="text-left">¿Es revisada como mínimo una vez al año y de ser necesario, actualizada con los cambios en materia de normatividad o por los requerimientos que aparezcan?
                                </td>

                                <td>
                                    <input id="radio35" type="radio" name="rbf18" value="1" runat="server">
                                </td>

                                <td>
                                    <input id="radio36" type="radio" name="rbf18" value="2" runat="server">
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="TextBox18" class="col-md-12"></asp:TextBox>
                                </td>
                            </tr>

                            <!-- resultados -->
                            <tr class="bg-aqua color-palette">
                                <th class="col-md-1 text-center"></th>
                                <th class="col-md-4 text-center">TOTAL DE CONDICIONES</th>
                                <th class="col-md-1 text-center">SI</th>
                                <th class="col-md-1 text-center">NO</th>
                                <th class="col-md-5 text-center">OBSERVACIONES</th>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="text-left">Sumatoria del total de respuestas</td>
                                <td>
                                    <asp:Label ID="lbTotalSi" runat="server" Text="---"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbTotalNo" runat="server" Text="---"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbObservaciones" runat="server" Text="---"></asp:Label>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <hr />
                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
                <script type="text/javascript" src="//www.google.com/jsapi"></script>

                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <asp:Literal ID="ltReporte" runat="server"></asp:Literal>
                        <div id="piechart"></div>
                    </div>
                    <asp:PlaceHolder runat="server" Visible="false">
                        <asp:Image alt="-" ID="ImgChart" runat="server" />
                    </asp:PlaceHolder>
                    <asp:HiddenField ID="rutaImg" runat="server"></asp:HiddenField>
                </div>

        </div>

        <div class="row text-center">

            <div class="col-md-4">
                <asp:ImageButton alt="-" ID="btnGenerar" runat="server" ImageUrl="~\ico\view.png"
                    OnClick="btnGenerar_Onclick" />
                <h4>Generar Resultados</h4>
            </div>

            <asp:PlaceHolder ID="phGuardar" runat="server" Visible="false">
                <div class="col-md-4">
                    <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\agregar.png"
                        OnClick="Guardar" ValidationGroup="ValidationAdd" />
                    <h4>Guardar Registro</h4>
                </div>
            </asp:PlaceHolder>
        </div>
    </asp:Panel>
</asp:Content>
