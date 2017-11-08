<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="SGSSTC.source.sistema.HistoriaClinica.create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <asp:Button Text="Tab 1" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server" OnClick="Tab1_Click" />
        <asp:Button Text="Tab 2" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server" OnClick="Tab2_Click" />
        <asp:Button Text="Tab 3" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server" OnClick="Tab3_Click" />
        <br />
        <br />
        <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="vwHistoria1" runat="server">
                <div class="row text-center">
                    <asp:Label runat="server" CssClass="text-center" Text="Registro de Historia Clinica Ocupacional"></asp:Label>
                </div>
                <br />
                <div class="row text-center">
                    <div class="col-md-4">
                        <label>Empresa</label>
                        <asp:Label runat="server" ID="lblEmpresaNom" Text="Empresa"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <label>Ubicación</label>
                        <asp:Label runat="server" ID="lblEmpresaDir" Text="Dirección"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <label>Nro Historia</label>
                        <asp:Label runat="server" ID="lblNroHistoria" Text="10/08/2016"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row text-center">
                    <div class="col-md-4">
                        <label>Tipo</label>
                        <asp:DropDownList runat="server" ID="ddlTipo"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label>Fecha</label>
                        <asp:TextBox runat="server" ID="txtFecha" Text="-/-/-" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>Trabajador</label>
                        <asp:DropDownList runat="server" ID="ddlTrabajador"></asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row text-center">
                    <div class="col-md-3">
                        <asp:CheckBox runat="server" ID="chk1" /><br />
                        <label>Datos Personales</label>
                    </div>
                    <div class="col-md-3">
                        <asp:CheckBox runat="server" ID="chk2" /><br />
                        <label>Puesto de Trabajo</label>
                    </div>
                    <div class="col-md-3">
                        <asp:CheckBox runat="server" ID="chk3" /><br />
                        <label>Riesgos del Puesto</label>
                    </div>
                    <div class="col-md-3">
                        <asp:CheckBox runat="server" ID="chk4" /><br />
                        <label>Descripcion Socio Demografica</label>
                    </div>
                </div>
                <br />
                <div class="row text-center">
                    <div class="col-md-3">
                        <asp:CheckBox runat="server" ID="chk5" /><br />
                        <label>Enfermedades</label>
                    </div>
                    <div class="col-md-3">
                        <asp:CheckBox runat="server" ID="chk6" /><br />
                        <label>Examenes</label>
                    </div>
                    <div class="col-md-3">
                        <asp:CheckBox runat="server" ID="chk7" /><br />
                        <label>Equipos</label>
                    </div>
                    <div class="col-md-3">
                        <asp:CheckBox runat="server" ID="chk8" /><br />
                        <label>Accidentes Laborales</label>
                    </div>
                </div>
                <br />
                <div class="row text-center">
                    <div class="col-md-10 col-md-offset-1">
                        <asp:Table runat="server" ID="tbl1" Width="800px">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" ColumnSpan="5">
                                <label>HISTORIA CLINICA</label>
                                </asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>Oficios desempeñados Empresa/ Area</label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>Ocupacion/ Oficio</label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>Tiempo Años/ Meses</label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>Ha presentado una enfermedad causada por el trabajo</label>
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>1. </label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center">
                                    <label>
                                        <asp:CheckBox runat="server" ID="chSI" Text="Si" />
                                        <asp:CheckBox runat="server" ID="chNO" Text="No" />
                                    </label>
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>2. </label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center" RowSpan="6">
                                <label>
                                    
                                </label>
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>2. </label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>3. </label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>4. </label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>5. </label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label>Actual. </label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                                <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                                <label></label>
                                </asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </asp:View>
            <asp:View ID="vwHistoria2" runat="server">
                <div class="row text-center">
                    <asp:Label ID="Label4" runat="server" Text="Registro de Historia Clinica Ocupacional"></asp:Label><br />
                    <asp:Label ID="Label1" runat="server" Text="Para Ser llenado por el Médico"></asp:Label>
                </div>
                <br />
                <!-- Tabla #1 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="3">
                                    <label>EXAMEN FÍSICO</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Peso:_____Kg.</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Estatura:____ Mts. IMC:____</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>P.A:_____/_____ Pulso:______ F.R:______</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Estado General:______. Diestro:___. Zurdo:___. Ambidiestro:___.</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Estado Mental:________</label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #1 -->
                <!-- Tabla #2 -->
                <br />
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table1" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="7">
                                    <label>CABEZA</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    &nbsp;
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    &nbsp;
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Normal    Anormal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Describir</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    &nbsp;
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Normal    Anormal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Describir</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Craneo</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Mucosa Nasal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="5">
                                    <label>Ojos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Párpados</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Senos Paranasales</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Conjuntiva</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Paladar</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Escleras</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Mucosa Oral</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Córnea</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Dentadura</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Iris Pupila</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Amigdalas</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Pabellones</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Faringe</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
                                    <label>Oidos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Conductos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Lengua</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Timpanos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Paladar</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #2 -->
                <br />
                <!-- Tabla #3 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table2" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4">
                                    <label>Agudeza Visual</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Carta Snellen</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>OD</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>OI</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>AO</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Cercana</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>20/</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>20/</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>20/</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Lejana</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>20/</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>20/</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>20/</label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #3 -->
                <br />
                <!-- Tabla #4 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table3" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Cuello</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Normal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Anormal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Descripción</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Tórax</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Normal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Anormal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Descripción</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Inspección</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Auscultación</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Palpación</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Murmullo Vesicular</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Adenopatias</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Ruidos Cardiacos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Glándula Tiroides</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Soplos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #4 -->
                <br />
                <!-- Tabla #5 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table4" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" Width="400px">
                                    <label>Abdomen</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Normal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Anormal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Describir</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
                                    <label>Describir: </label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Mamas</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Piel</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Uñas</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
                                    <label>Hernia: </label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Cicatrices</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Tatuajes</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Varices</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #5 -->
                <br />
                <!-- Tabla #6 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table5" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
                                    <label>Arcos de Movimiento</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
                                    <label>Miembros Superiores</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
                                    <label>Arcos de Movimiento</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
                                    <label>Miembros Inferiores</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Hombro</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Codo</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Muñeca</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Dedos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Cadera</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Rodilla</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Pie</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Dedos</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>D</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>I</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>D</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>I</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>D</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>I</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>D</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>I</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>D</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>I</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>D</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>I</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>D</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>I</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>D</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>I</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Flexión</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Flexión</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Extensión</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Extensión</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Abducción</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Abducción</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Aducción</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Aducción</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Rotación Interna</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Rotación Interna</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Rotación Externa</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Rotación Externa</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Pronación</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Pronación</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Supinación</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Supinación</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Fuerza Muscular</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Fuerza Muscular</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #6 -->
                <br />
                <!-- Tabla #7 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table6" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
                                    <label>Arcos de Movimiento</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Cervical</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Dorso Lumbar</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Dolor</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Normal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Anormal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Normal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Anormal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Si</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>No</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Flexión</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Extensión</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Rotación Derecha</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Rotación Izquierda</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Inclinacion Lateral Derecha</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Inclinacion Lateral Izquierda</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #7 -->
                <br />
                <!-- Tabla #8 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table7" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
                                    <label>Escoliosis</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Cervical</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Dorsal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
                                    <label>Lumbar</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Si</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>No</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Si</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>No</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Si</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>No</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Derecha</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Izquierda</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #8 -->
            </asp:View>
            <asp:View ID="vwHistoria3" runat="server">
                <div class="row text-center">
                    <asp:Label ID="Label2" runat="server" Text="Registro de Historia Clinica Ocupacional"></asp:Label><br />
                </div>
                <br />
                <!-- Tabla #1 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table8" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Diagnosticos</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDiagnostico" Rows="7" Columns="110"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>

                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #1 -->
                <br />
                <!-- Tabla #2 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table9" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Recomendaciones</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtRecomendaciones" Rows="7" Columns="110"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #2 -->
                <br />
                <!-- Tabla #3 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table10" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3" Width="240px">
                                    <label>Uso de elementos de Proteccion recomendado para la labor asignada</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Ojos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Oidos</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Cara</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Cabeza</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Respiracion</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Traje</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Otro (¿Cúal?)</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #3 -->
                <br />
                <!-- Tabla #4 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table11" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Elegible</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Elegible con restricciones que no interfieren con su trabajo normal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Elegible con restricciones que difieren en su trabajo normal</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>No Elegible</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #4 -->
                <br />
                <!-- Tabla #5 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table12" runat="server" Style="margin: 0 auto;" Width="800px">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label>Requiere rebicación:   No___    Si____   Restricciones</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #5 -->
                <br />
                <!-- Tabla #6 -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <asp:Table ID="Table13" runat="server" Style="margin: 0 auto;" Width="800px" CssClass="text-center">
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
                                    <label>FECHA DEL EXAMEN</label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
                                    <label>FIRMA Y SELLO DEL MEDICO EXAMINADOR</label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
                                    <label></label>
                                </asp:TableCell>
                                <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
                                    <label></label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin de #6 -->
                <br />
                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:Button Text="GUARDAR" runat="server" ID="btnGuardar" OnClick="GuardarRegistro" />
                    </div>
                </div>

            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
