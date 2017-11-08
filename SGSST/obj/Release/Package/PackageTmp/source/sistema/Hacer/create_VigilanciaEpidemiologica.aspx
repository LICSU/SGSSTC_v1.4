<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_VigilanciaEpidemiologica.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_VigilanciaEpidemiologica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <div class="container" style="width: 100%;">

        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_VigilanciaEpidemiologica.aspx">Vigilancia Epidemiológica</a></li>
            <li><a href="#">Crear Vigilancia Epidemiológica</a></li>
        </ol>

        <div class="page-header">
            <h1 class="text-center">Vigilancia Epidemiológica</h1>
        </div>
        
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row form-group">

                    <div class="col-md-2 col-md-offset-2">
                        <h4 class="text-center">Año</h4>
                        <asp:DropDownList runat="server" ID="ddlYear" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <asp:PlaceHolder runat="server" ID="phEmpresa">
                        <div class="col-md-3">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" ID="phSucursal">
                        <div class="col-md-3">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <div class="col-md-2">
                        <h4 class="text-center">&nbsp;</h4>
                        <asp:Button ID="btnGenerar" Text="Generar Resultados" CssClass="btn btn-block btn-info"
                            OnClick="btnGenerarClic" runat="server" />
                    </div>

                </div>

                <asp:PlaceHolder runat="server" ID="phInformacion" Visible="false">
                    <!-- Informacion -->
                    <div class="row form-group text-center">
                        <asp:Label runat="server" Text="" CssClass="h4" ID="lblTotalTrab"></asp:Label>
                    </div>
                    <div class="row form-group">
                        <asp:Table runat="server" CssClass="table table-bordered" ID="tbFuerzaLaboral">
                            <asp:TableHeaderRow CssClass="text-center">
                                <asp:TableHeaderCell runat="server" ID="lb1" Text="# DE ACCIDENTES DE TRABAJO"></asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server" ID="lb2" Text="# DE ACCIDENTES COMÚNES"></asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server" ID="lb3" Text="# DE ENFERMEDADES COMUNES"></asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server" ID="lb4" Text="# DE ENFERMEDADES DE POSIBLE ORIGEN OCUPACIONAL"></asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server" ID="lb5" Text="# DE ENFERMEDADES OCUPACIONALES"></asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server" ID="lb6" Text="# DE TRABAJADORES REFERENCIADOS A CENTROS ESPECIALIZADOS"></asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server" ID="lb7" Text="# DE TRABAJADORES CON DISCAPACIDAD"></asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server" ID="lb8" Text="RESULTADOS DE EVALUACIONES CLÍNICAS"></asp:TableHeaderCell>
                                <asp:TableHeaderCell runat="server" ID="lb9" Text="MONITOREO DE REPOSOS MÉDICOS"></asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow CssClass="text-center">
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="nroAccTrab" Text="0"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="nroAccCom" Text="0"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="nroEnfCom" Text="0"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="nroEnfPOO" Text="0"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="nroEnfOcu" Text="0"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="nroTrabRef" Text="0"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="nroTrabDis" Text="0"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="nroResEvaCli" Text="0"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="monRepMed" Text="0"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-8 col-md-offset-2">
                            <asp:Chart ID="graficoFuerzaLab" runat="server" Height="466px" Width="800px" AntiAliasing="Graphics">
                                <Series>
                                    <asp:Series Name="fuerzaLaboral" CustomProperties="DrawingStyle=Cylinder"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <Area3DStyle Enable3D="true" WallWidth="0" />
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-6 text-center">
                            <asp:Label runat="server" ID="lblResEvaCli" Text="Resultados de Evaluaciones Clínicas"></asp:Label>
                            <asp:Table runat="server" CssClass="table" ID="Table1">
                                <asp:TableHeaderRow CssClass="text-center">
                                    <asp:TableHeaderCell runat="server" ID="cellEvaPreEmp" Text="Evaluación Pre empleo"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellEvaPreVac" Text="Evaluación Pre vacacional"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellEvaPosVac" Text="Evaluación Post vacacional"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellEvaPer" Text="Evaluación Periódica"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellEvaEsp" Text="Evaluación Especial"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellEvaPosEmp" Text="Evaluación Post Empleo"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellEvaAsi" Text="Evaluación Asistencial o curativa"></asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow CssClass="text-center">
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellEvaPreEmpV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellEvaPreVacV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellEvaPosVacV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellEvaPerV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellEvaEspV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellEvaPosEmpV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellEvaAsiV" Text="0"></asp:Label></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                        <div class="col-md-6 text-center">
                            <!-- Grafica -->
                            <asp:Chart ID="graficaEvaCli" runat="server" AntiAliasing="Graphics">
                                <Series>
                                    <asp:Series Name="serieEvaCli" CustomProperties="DrawingStyle=Cylinder"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <Area3DStyle Enable3D="true" WallWidth="0" />
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-6 text-center">
                            <asp:Label runat="server" ID="lblMonResMed" Text="Monitoreo de Reposos Médicos"></asp:Label>
                            <asp:Table runat="server" CssClass="table" ID="Table2">
                                <asp:TableHeaderRow CssClass="text-center">
                                    <asp:TableHeaderCell runat="server" ID="cellNroRep" Text="N° de Reposos"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellDiaRep" Text="Días de Reposos"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellNroRepEnfCom" Text="N° de Reposos por Enfermedad Común"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellRepEnfOcu" Text="N° de Reposos Enfermedad Ocupacional"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" ID="cellRepAccCom" Text="N° de Reposos Accidente Común"></asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow CssClass="text-center">
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellNroRepV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellDiaRepV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellNroRepEnfComV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellRepEnfOcuV" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="cellRepAccComV" Text="0"></asp:Label></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                        <div class="col-md-6 text-center">
                            <!-- Grafica -->
                            <asp:Chart ID="graficaRepMed" runat="server" AntiAliasing="Graphics">
                                <Series>
                                    <asp:Series Name="serieRepMed" CustomProperties="DrawingStyle=Cylinder"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <Area3DStyle Enable3D="true" WallWidth="0" />
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-6 text-center">
                            <asp:Label runat="server" ID="Label14" Text="Diagnósticos presentes en los Trabajadores"></asp:Label>
                            <asp:Panel ID="pnGraficaEnf" runat="server"></asp:Panel>

                        </div>
                        <div class="col-md-6 text-center">
                            <asp:Label runat="server" ID="Label15" Text="Sistema Orgánico Afectado"></asp:Label>
                            <asp:Panel ID="pnGraficaSis" runat="server"></asp:Panel>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-6 text-center">
                            <!-- Grafica -->
                            <asp:Chart ID="graficaDiagnostico" runat="server" AntiAliasing="Graphics">
                                <Series>
                                    <asp:Series Name="serieDiag1" LegendText="Trabajadores Atendidos" YValuesPerPoint="1"></asp:Series>
                                    <asp:Series Name="serieDiag2" LegendText="Trabajadores con Reposo" YValuesPerPoint="1"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </ChartAreas>
                                <Legends>
                                    <asp:Legend Name="LegendDiag">
                                        <Position Height="12.70903" Width="50" X="50" />
                                    </asp:Legend>
                                </Legends>
                            </asp:Chart>
                        </div>
                        <div class="col-md-6 text-center">
                            <!-- Grafica -->
                            <asp:Chart ID="graficaSistema" runat="server" AntiAliasing="Graphics">
                                <Series>
                                    <asp:Series Name="serieSist1" LegendText="Trabajadores Atendidos" YValuesPerPoint="1"></asp:Series>
                                    <asp:Series Name="serieSist2" LegendText="Trabajadores con Reposo" YValuesPerPoint="1"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </ChartAreas>
                                <Legends>
                                    <asp:Legend Name="LegendSis">
                                        <Position Height="12.70903" Width="50" X="50" />
                                    </asp:Legend>
                                </Legends>
                            </asp:Chart>
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col-md-4 col-md-offset-2">
                            <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png"
                                OnClick="GenerarDocumento" />
                            <h4>Generar Documento</h4>
                        </div>
                    </div>
                    <!--  Fin de Informacion -->

                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="phNoRegistros" Visible="false">
                    <div class="row form-group">
                        <div class="col-md-8 col-md-offset-2 text-center">
                            <strong>
                                <label>No existen trabajadores con reposos registrados.</label></strong>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnGuardar" />
            </Triggers>
        </asp:UpdatePanel>

    </div>

</asp:Content>
