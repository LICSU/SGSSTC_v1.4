<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EvaluacionRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_EvaluacionRiesgos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_EvaluacionRiesgo.aspx">Evaluación de Riesgos</a></li>
                <li><a href="#">Crear Evaluación de Riesgos</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Nueva Evaluación de Riesgo Laboral</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Responsable del SGSST</h4>
                    <asp:TextBox ID="txtResponsableSGSST" CssClass="form-control" runat="server"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el responsable de la evaluacion de este Riesgo"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="txtResponsableSGSST" runat="server" ValidationGroup="ValidationAdd" />

                </div>

                <div class="col-md-3">
                    <h4>Fecha de Evaluación</h4>
                    <asp:TextBox ID="txtFechaEvaluacion" type="date" CssClass="form-control" runat="server"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese la fecha de la evaluacion de este Riesgo"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="txtFechaEvaluacion" runat="server" ValidationGroup="ValidationAdd" />
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Sucursal</h4>
                    <asp:Label runat="server" ID="txtSucursal"></asp:Label>
                </div>

                <div class="col-md-4">
                    <h4>Área</h4>
                    <asp:Label runat="server" ID="txtArea"></asp:Label>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Puesto de Trabajo</h4>
                    <asp:Label runat="server" ID="txtPuestos"></asp:Label>
                </div>

                <div class="col-md-4">
                    <h4>Descripción Puesto de Trabajo</h4>
                    <asp:Label runat="server" ID="txtDescripcionPuesto"></asp:Label>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center">Identificación del Peligro</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Tipo de Riesgo</h4>
                    <asp:Label ID="txtTipoRiesgo" runat="server"></asp:Label>

                </div>

                <div class="col-md-4">
                    <h4>Factor de Riesgo</h4>
                    <asp:Label ID="txtFactorRiesgo" type="date" runat="server"></asp:Label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Posibles Consecuencias</h4>
                    <asp:Label ID="txtConsecuencias" runat="server"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese las posibles consecuencias que tiene este Riesgo"></asp:Label>
                </div>

                <div class="col-md-4">
                    <h4>Tiempo de Exposición</h4>
                    <asp:Label ID="txtTiempoExposicion" runat="server"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el tiempo de exposición que tiene este Riesgo"></asp:Label>

                </div>
            </div>

            <hr />
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center">Evaluación del Riesgo</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <h4>Medidas en la Fuente</h4>
                    <asp:TextBox ID="txtControlFuente" MaxLength="5000" runat="server" TextMode="multiline" class="form-control"
                        Rows="8" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese las medidas en la fuente para este Riesgo"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <h4>Medidas en el Medio</h4>
                    <asp:TextBox ID="txtControlMedio" MaxLength="5000" runat="server" TextMode="multiline" class="form-control"
                        Rows="8" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese las medidas en el medio para este Riesgo"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <h4>Medidas en el Individuo</h4>
                    <asp:TextBox ID="txtControlIndividuo" MaxLength="5000" runat="server" TextMode="multiline" class="form-control"
                        Rows="8" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese las medidas en el individuo para este Riesgo"></asp:TextBox>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-2 col-md-offset-2">
                    <h4>Nivel de Deficiencia</h4>

                    <asp:DropDownList runat="server" ID="ddlNivelDeficiencia" CssClass="form-control"
                        AutoPostBack="true" OnSelectedIndexChanged="CalculoProbabilidad_SelectedIndexChanged"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione el nivel de deficiencia de este Riesgo">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Muy alto" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Alto" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Medio" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Bajo" Value="0"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlNivelDeficiencia" runat="server" ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-6">
                    <h4 class="text-center">Interpretación del Nivel de Deficiencia</h4>
                    <asp:Label ID="txtInterpretacionNivelDeficiencia" runat="server" Text="Sin Calcular"></asp:Label>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-2 col-md-offset-2">
                    <h4>Nivel de Exposición</h4>

                    <asp:DropDownList runat="server" ID="ddlNivelExposicion" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="CalculoProbabilidad_SelectedIndexChanged"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione el nivel de exposición para este Riesgo">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Continua" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Frecuente" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Ocasional" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Esporádica" Value="1"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlNivelExposicion" runat="server" ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-6">
                    <h4 class="text-center">Interpretación del Nivel de Exposición</h4>
                    <asp:Label ID="txtInterpretacionNivelExposicion" runat="server" Text="Sin Calcular"></asp:Label>

                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-2 col-md-offset-2">
                    <h4>Nivel de Probabilidad</h4>
                    <asp:Label ID="txtNivelProbabilidad" runat="server" Text="Sin Calcular"></asp:Label>
                </div>

                <div class="col-md-6">
                    <h4 class="text-center">Interpretación del Nivel de Probabilidad</h4>
                    <asp:Label ID="txtInterpretacionNivelProbabilidad" runat="server" Text="Sin Calcular"></asp:Label>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-2 col-md-offset-2">
                    <h4>Nivel de Consecuencia</h4>

                    <asp:DropDownList runat="server" ID="ddlNivelConsecuencia" CssClass="form-control"
                        AutoPostBack="true" OnSelectedIndexChanged="CalculoNivelRiesgo_SelectedIndexChanged"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione el nivel de consecuencia para este Riesgo">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Mortal o catastrófico(M)" Value="100"></asp:ListItem>
                        <asp:ListItem Text="Muy grave (MG)" Value="60"></asp:ListItem>
                        <asp:ListItem Text="Grave (G)" Value="25"></asp:ListItem>
                        <asp:ListItem Text="Leve (L)" Value="10"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlNivelConsecuencia" runat="server" ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-6">
                    <h4 class="text-center">Interpretación del Nivel de Consecuencia</h4>
                    <asp:Label ID="txtInterpretacionNivelConsecuencia" runat="server" Text="Sin Calcular"></asp:Label>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-1 col-md-offset-2">
                    <h4>Nivel de Riesgo</h4>

                    <asp:Label ID="txtNivelRiesgo" runat="server" Text="Sin Calcular"></asp:Label>
                </div>
                <div class="col-md-2">
                    <h4>Valor del Nivel de Riesgo</h4>

                    <asp:Label ID="txtValorNivelRiesgo" runat="server" Text="Sin Calcular"></asp:Label>
                </div>
                <div class="col-md-5">
                    <h4 class="text-center">Interpretación del Nivel de Riesgo</h4>
                    <asp:Label ID="txtInterpretacionNivelRiesgo" runat="server" Text="Sin Calcular"></asp:Label>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h4>Aceptabilidad de Riesgo</h4>

                    <asp:Label ID="txtAceptabilidadRiesgo" runat="server" Text="Sin Calcular"></asp:Label>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center">Criterios para Establecer Controles</h3>
                </div>
            </div>
            <br />

            <div class="row">
                <h3 class="text-center">N° Personal Expuesto</h3>
                <div class="col-md-2 col-md-offset-2">
                    <h4>Trabajadores</h4>
                    <asp:TextBox ID="txtPlanta" type="number" step="0.01" CssClass="form-control" runat="server" AutoPostBack="true"
                        OnTextChanged="txtPersonalExpuesto_TextChanged"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el N° de trabajdores expuestos para este Riesgo"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="txtPlanta" runat="server" ValidationGroup="ValidationAdd" />
                </div>
                <div class="col-md-2">
                    <h4>Contratistas</h4>
                    <asp:TextBox ID="txtContratistas" type="number" step="0.01" CssClass="form-control" runat="server" AutoPostBack="true"
                        OnTextChanged="txtPersonalExpuesto_TextChanged"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el N° de contratistas expuestos para este Riesgo"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <h4>Visitantes</h4>
                    <asp:TextBox ID="txtVisitantes" type="number" step="0.01" CssClass="form-control" runat="server" AutoPostBack="true"
                        OnTextChanged="txtPersonalExpuesto_TextChanged"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el N° de visitantes expuestos para este Riesgo"></asp:TextBox>

                </div>

                <div class="col-md-2">
                    <h4>Total</h4>
                    <asp:Label ID="txtTotalPersonalExpuesto" runat="server" Text="Sin Calcular"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Este es el totoal de personas expuestas de este Riesgo"></asp:Label>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h4>Peor Consecuencia</h4>
                    <asp:TextBox ID="txtPeorConsecuencia" CssClass="form-control" runat="server"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese la peor consecuencia que podría tener este Riesgo"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="txtPeorConsecuencia" runat="server" ValidationGroup="ValidationAdd" />
                </div>
            </div>
            <hr />

            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center">Medidas de Intervención</h3>
                </div>
            </div>

            <div class="row">

                <div class="col-md-4 col-md-offset-2">
                    <h4>Eliminación</h4>

                    <asp:TextBox ID="txtEliminación" CssClass="form-control" runat="server" MaxLength="5000"
                        TextMode="multiline" Rows="8" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese las medidas de elminicación de este Riesgo"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <h4>Sustitución</h4>
                    <asp:TextBox ID="txtSustitución" CssClass="form-control" runat="server" MaxLength="5000"
                        TextMode="multiline" Rows="8" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese las medidas de sustitución de este Riesgo"></asp:TextBox>
                </div>

            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Controles de Ingeniería</h4>
                    <asp:TextBox ID="txtIngenieria" CssClass="form-control" runat="server" MaxLength="5000"
                        TextMode="multiline" Rows="8" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese los controles de ingeniería de este Riesgo"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <h4>Controles Administrativos</h4>
                    <asp:TextBox ID="txtAdministrativos" CssClass="form-control" runat="server" MaxLength="5000"
                        TextMode="multiline" Rows="8" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese los controles administrativos de este Riesgo"></asp:TextBox>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <h4 class="text-center">Fecha de Ejecución</h4>
                    <asp:TextBox ID="txtFechaEjecucion" type="date" CssClass="form-control" runat="server"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese la fecha de ejecución de las medidas para este Riesgo"></asp:TextBox>
                </div>
            </div>
            <br />

            <hr />
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h3 class="text-center">Equipos de Proteccion Personal del Puesto de Trabajo</h3>
                </div>

                <asp:Label ID="txtEpp" runat="server" data-toggle="tooltip" data-placement="bottom"
                    title="Equipos de proteccion personal asociados al puesto de trabajo que está asociado riesgo"></asp:Label>
            </div>
            <br />
            <hr />

            <!-- Boton-->
            <div class="row">

                <div class="col-md-2 col-md-offset-5">
                    <asp:Button ID="btPrintSave" runat="server" Text="Guardar" class="btn btn-block btn-info"
                        OnClick="btPrintSave_Click" ValidationGroup="ValidationAdd" data-toggle="tooltip" data-placement="bottom"
                        title="Presione para registrar esta evaluación de Riesgo" />
                </div>
            </div>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>