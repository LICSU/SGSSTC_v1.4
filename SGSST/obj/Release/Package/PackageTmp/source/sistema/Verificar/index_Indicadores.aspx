<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Indicadores.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.index_Indicadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Verificar</a></li>
                <li><a href="#">Indicadores</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Indicadores Definidos por la Empresa</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                    <div class="col-md-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                            ControlToValidate="ddlSucursal" runat="server" ValidationGroup="ValidationAdd" />
                    </div>
                </asp:PlaceHolder>
            </div>

            <br />

            <div class="row text-center">
                <div class="box">
                    <div class="panel-group" id="accordion">

                        <!-- Primer Panel -->
                        <div class="panel panel-default">
                            <div class="panel-heading bg-aqua color-palette">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#ContentPlaceHolder1_collapse1">INDICADOR DE ESTRUCTURA</a>
                                </h4>
                            </div>

                            <div id="collapse1" runat="server" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="box-body no-padding">
                                        <table class="table table-condensed" style="overflow: scroll;">
                                            <tbody>
                                                <!-- fila 1 -->
                                                <tr class="bg-aqua color-palette">
                                                    <th class="col-md-2 text-center">DEFINICIÓN</th>
                                                    <th class="col-md-2 text-center">INTERPRETACIÒN</th>
                                                    <th class="col-md-2 text-center">MÉTODO DE CÁLCULO</th>
                                                    <th class="col-md-2 text-center">FUENTE DEL CÁLCULO</th>
                                                    <th class="col-md-1 text-center">RESPONSABLE</th>
                                                    <th class="col-md-1 text-center">FRECUENCIA</th>
                                                    <th class="col-md-1 text-center">UNIDAD</th>
                                                    <th class="col-md-1 text-center">META</th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Política de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existe el documento de la Política de SST y está firmada, divulgada y fechada." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Documento de la Política de SST firmada y fechada." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:DropDownList ID="resultado1" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Existe" Value="Existe"></asp:ListItem>
                                                                    <asp:ListItem Text="No Existe" Value="No Existe"></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Compromiso de la Organización" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Evidenciar el compromiso de la Empresa con la Seguridad y Salud en el Trabajo a través de la declaración de la Política" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="La política incluya objetivos específicos en materia de SST de acuerdo a los riesgos, cumpliendo con la normatividad y garantizando la mejora continua " Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Inspeccionar la inclusión de los requerimientos en el documento de la política" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST Copasst" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento total" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:DropDownList ID="resultado2" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Política de  SST, comunicada." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="La Política de SST ha sido difundida al __% de los trabajadores." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Número de trabajadores que conocen la Política de SST / Número total de Trabajadores ) X 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Encuesta realizada a una muestra de trabajadores en donde se evalúan los conocimientos respecto a la política de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de los Trabajadores" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de trabajadores que conocen la Política SST
                                                                <asp:TextBox ID="Textbox1" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox1_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número total de Trabajadores<br />
                                                            <asp:Label ID="Label1" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado3" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Objetivos y metas, divulgados" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Los objetivos y metas de seguridad  se encuentran escritos y divulgados." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Número de Trabajadores que conocen los Objetivos y metas de seguridad informados por escrito /Número total de Trabajadores ) X 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Encuesta realizada a una muestra de trabajadores en donde se evalúan los conocimientos respecto a los objetivos de la política de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Mensual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de los Trabajadores" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de Trabajadores que conocen los Objetivos y Metas de seguridad informados por escrito
                                                                <asp:TextBox ID="Textbox2" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox2_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número total de Trabajadores<br />
                                                            <asp:Label ID="Label2" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado4" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Evaluación Inicial del SGSST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existe un Formato para la Evaluación Inicial del SGSST con los criterios contemplados en el Decreto 1072 en su Artículo 2.2.4.6.16" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Formato para la Evaluación Inicial del SGSST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST Gerencia" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:DropDownList ID="resultado5" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Existe" Value="Existe"></asp:ListItem>
                                                                    <asp:ListItem Text="No Existe" Value="No Existe"></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Plan de trabajo anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Establecer un Plan Anual de Trabajo en Seguridad y Salud en el Trabajo que evidencie el compromiso gerencial." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia del documento de plan de trabajo firmado por el Representante Legal." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST Gerencia" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:DropDownList ID="resultado6" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Existe" Value="Existe"></asp:ListItem>
                                                                    <asp:ListItem Text="No Existe" Value="No Existe"></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Responsabilidades" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Asignación de responsabilidades a los distintos niveles de la empresa frente al desarrollo del Sistema de Gestión de la Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° total de Jefes con delegación de responsabilidad en SST/Total de Jefes de la estructura) x100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100 % de Compromiso en todos los Niveles" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° total de Jefes con delegación de responsabilidad en SST
                                                                <asp:TextBox ID="Textbox3" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox3_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Total de Jefes de la estructura
                                                                <asp:TextBox ID="Textbox4" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox3_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado7" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Identificación de peligros y riesgos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Método definido para la identificación de peligros" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existe un Método definido para la identificación de peligros." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Identificación de peligros realizado" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:DropDownList ID="resultado8" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Reporte de las condiciones inseguras" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Instrumento para que los trabajadores reporten las condiciones de trabajo peligrosas" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existe un instrumento o formato para que los trabajadores reporten las condiciones de trabajo inseguras" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Trimestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia del Reporte" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:DropDownList ID="resultado9" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Copasst" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia del COPASST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="La empresa cuenta con un COPASST en funcionamiento y con delegación de funciones." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Copasst" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:DropDownList ID="resultado10" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Funcionamiento del Copasst" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Número de reuniones anuales del Copasst" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Nº de Reuniones ordinarias realizadas del Copasst/ 12) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Copasst" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Número de reuniones anuales del Copasst" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Reuniones ordinarias realizadas del Copasst
                                                                <asp:TextBox ID="Textbox5" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox5_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado11" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Asignación de Recursos Humanos requeridos para la implementación del Sistema de Gestión de la Seguridad y Salud en el Trabajo. ( Número de Comités en funcionamiento y número de encargados del SGSST)" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="N° de recursos humanos disponibles según el tamaño de la empresa, y especialistas requeridos en materia de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Gerente COPASST Coordinador SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Numérico" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Equipo de Trabajo Interdisciplinario" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:TextBox ID="resultado12" runat="server" class="form-control" type="number" step="0.01" placeholder="0"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Recursos Financieros" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="La asignación de recursos financieros y físicos  requeridos para la implementación del Sistema de Gestión de la Seguridad y Salud en el Trabajo." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Asignación de recursos aprobados para las necesidades contempladas por el SGSST / Recursos Necesarios para cubrir el total de necesidades del SGSST) X 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Empleador Gerente COPASST Coordinador SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de Recursos Aprobados" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Asignación de recursos aprobados para las necesidades contempladas por el SGSST
                                                                <asp:TextBox ID="Textbox6" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox6_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Recursos Necesarios para cubrir el total de necesidades del SGSST
                                                                <asp:TextBox ID="Textbox7" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox6_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado13" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Documentos de Soporte" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existen Documentos de Soporte de la Gestión de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Documentos en físico o en digital del respaldo en materia de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                                <asp:DropDownList ID="resultado14" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:DropDownList>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Diagnóstico de las Condiciones de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="La existencia de un procedimiento para efectuar el diagnóstico de las condiciones de salud de los trabajadores, para la definición de las prioridades de control e intervención" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° de inspecciones realizadas por Área / Total de Áreas) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Trimestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100 % de Cobertura de las áreas" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado
                                                               <asp:Label runat="server" ID="resultado15"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Plan de emergencias" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia de un plan para prevención y atención de emergencias en la organización ( y en sus sedes si aplica)" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text=" (N° de sedes con plan de emergencia/Nro. total de Sedes) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST Comité de emergencias" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual " Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Numérico" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia del Plan de Prevención" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° de sedes con plan de emergencia
                                                                <asp:TextBox ID="Textbox8" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox8_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número total de Sedes<br />
                                                            <asp:Label ID="Label3" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado16" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Capacitación en SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existe un Plan de Capacitación anual en SST (y en sus sedes si aplica)" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° de Áreas con plan de capacitación anual en SST/Total de áreas) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Existencia del Plan de Capacitación" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° de Áreas con plan de capacitación anual en SST
                                                                <asp:TextBox ID="Textbox9" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox9_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Total de áreas<br />
                                                            <asp:Label ID="Label4" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado17" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Segundo Panel -->
                        <div class="panel">

                            <div class="panel-heading bg-aqua color-palette">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#ContentPlaceHolder1_collapse2">INDICADOR DE PROCESO</a>
                                </h4>
                            </div>

                            <div runat="server" id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">

                                    <div class="box-body no-padding">
                                        <table class="table table-condensed" style="overflow: scroll;">
                                            <tbody>

                                                <tr class="bg-aqua color-palette">
                                                    <th class="col-md-2 text-center">DEFINICIÓN</th>
                                                    <th class="col-md-2 text-center">INTERPRETACIÒN</th>
                                                    <th class="col-md-2 text-center">MÉTODO DE CÁLCULO</th>
                                                    <th class="col-md-2 text-center">FUENTE DEL CÁLCULO</th>
                                                    <th class="col-md-1 text-center">RESPONSABLE</th>
                                                    <th class="col-md-1 text-center">FRECUENCIA</th>
                                                    <th class="col-md-1 text-center">UNIDAD</th>
                                                    <th class="col-md-1 text-center">META</th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Autoevaluación" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Evaluación inicial del SG-SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="( Nº de Criterios contemplados e implementados en el Formato de Evaluación Inicial / Número de Criterios mínimos establecidos para la evaluación inicial en el decreto 1072) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Instrumento de evaluación inicial del SG-SST diligenciado por el Coordinador del SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST Copasst  Otras áreas" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100%, de los aspectos contemplados en la evaluación inicial del SG-SST deben estar implementados en la empresa." Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Criterios contemplados e implementados en el Formato de Evaluación Inicial
                                                                <asp:TextBox ID="Textbox10" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox10_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de Criterios mínimos establecidos para la evaluación inicial en el decreto 1072<br />
                                                            <asp:TextBox ID="Textbox11" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox10_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado18" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Ejecución del plan de trabajo anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="% de actividades cumplidas del plan de trabajo  en el SGSST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° de Actividades Ejecutadas del Plan de Trabajo / Nº de Actividades programadas en el Plan de Trabajo) X 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Plan Anual de Trabajo" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100 % de las actividades programadas" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° de Actividades Ejecutadas del Plan de Trabajo
                                                                <asp:TextBox ID="Textbox12" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox12_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Actividades programadas en el Plan de Trabajo<br />
                                                            <asp:TextBox ID="Textbox13" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox12_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado19" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Intervención de peligros y riesgos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Intervención de los peligros identificados" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° Total De Riesgos Intervenidos en el Período/Total De Riesgos Identificados en el Período) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Inspecciones de Seguridad,Matriz de Riesgos,Investigaciones de AT,Reportes Del COPASST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de los Peligros intervenidos" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° Total De Riesgos Intervenidos en el Período
                                                                <asp:TextBox ID="Textbox14" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox14_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Total De Riesgos Identificados en el Período<br />
                                                            <asp:TextBox ID="Textbox15" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox14_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado20" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Ejecución del plan de capacitación en SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="% de Capacitaciones Desarrolladas en el Período" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° Total de Capacitaciones Ejecutadas en el período  / Nº de Capacitaciones programadas en el Plan de Capacitación para ese período) X 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Documento de Registro de Capacitaciones " Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Trimestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Ejecución del 100% de las Capacitaciones programadas en el Plan " Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° Total de Capacitaciones Ejecutadas en el período
                                                                <asp:TextBox ID="Textbox16" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox16_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Capacitaciones programadas en el Plan de Capacitación para ese período<br />
                                                            <asp:TextBox ID="Textbox17" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox16_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado21" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cultura de Prevención" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Generar comportamientos seguros y de autocuidado en los trabajadores de la empresa" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Nº de Capacitaciones ejecutadas de autocuidado/ Nº de Capacitaciones programadas en autocuidado) X 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Plan de Capacitación y Registro de Capacitaciones ejecutadas" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Ejecución del 100% de las Capacitaciones programadas en materia de auto cuidado personal" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Capacitaciones ejecutadas de autocuidado
                                                                <asp:TextBox ID="Textbox18" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox18_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Capacitaciones programadas en autocuidado<br />
                                                            <asp:TextBox ID="Textbox19" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox18_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado22" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Reducir accidentalidad" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Reducir la accidentalidad en general" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Acciones de Mejora implementadas en base a los Siniestros / Acciones de Mejora Identificadas en dicho Siniestro) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Reporte de Accidentes/ Incidentes" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Trimestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de Mejoras Implementadas" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Acciones de Mejora implementadas en base a los Siniestros
                                                                <asp:TextBox ID="Textbox20" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox20_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Acciones de Mejora Identificadas en dicho Siniestro<br />
                                                            <asp:TextBox ID="Textbox21" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox20_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado23" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Inspecciones" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="% de Inspecciones Realizadas" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Promedio((Nº de Inspecciones realizadas por área / Total de tipo de inspecciones del área) x 100)" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Control de Inspecciones	" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Trimestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100 % de cobertura de las áreas" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Inspecciones realizadas por área
                                                                <asp:TextBox ID="Textbox22" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox22_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Total de tipo de inspecciones del área<br />
                                                            <asp:TextBox ID="Textbox23" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox22_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado24" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Plan de accidentalidad" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Ejecución del plan de intervención de la accidentalidad, actividades cumplidas del Plan" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° De Actividades Desarrolladas En La Intervención De Los Riesgos Prioritarios/Actividades Propuestas Para La Intervención  De Los Riesgos Prioritarios) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Análisis De Causalidad,Investigación De Accidente de Trabajo,Reporte De Incidentes" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Jefes de Área,COPASST,Área de Gestión de la SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cumplimiento del 100% de las actividades propuestas en el Plan de Prevención" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° De Actividades Desarrolladas En La Intervención De Los Riesgos Prioritarios
                                                                <asp:TextBox ID="Textbox24" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox24_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Actividades Propuestas Para La Intervención De Los Riesgos Prioritarios<br />
                                                            <asp:TextBox ID="Textbox25" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox24_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado25" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Investigación de accidentes e incidentes" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Porcentaje de accidentes e incidentes investigados" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° De Accidentes e Incidentes investigados/Nro. De Accidentes e Incidentes Reportados) x 100%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Reporte de Accidentes e incidentes" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Gerente,Jefes de Área,COPASST,Área de Gestión de la SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de reportes realizados" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° De Accidentes e Incidentes investigados
                                                                <asp:TextBox ID="Textbox26" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox26_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nro. De Accidentes e Incidentes Reportados<br />
                                                            <asp:TextBox ID="Textbox27" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox26_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado26" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Reducción de Casos Médicos Musculo Esqueléticos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Reducir las enfermedades Musculo esqueléticas a través del Programa de Vigilancia Epidemiológica" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Nº de Casos Musculo Esqueléticos reportados en la Vigilancia Epidemiológica / N° Investigación realizada al Puesto de trabajo respecto a los casos ) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Vigilancia Epidemiológica,Inspecciones,Reporte de los Trabajadores" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Gerente,Jefes de Área,COPASST,Área de Gestión de la SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de investigaciones realizadas" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Casos Musculo Esqueléticos reportados en la Vigilancia Epidemiológica
                                                                <asp:TextBox ID="Textbox28" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox28_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° Investigación realizada al Puesto de trabajo respecto a los casos
                                                            <br />
                                                            <asp:TextBox ID="Textbox29" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox28_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado27" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Simulacros" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Porcentaje de simulacros ejecutados" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(N° De Simulacros Realizados / Nro. De Simulacros Programados) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Plan Anual De Trabajo En SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Gerente,Jefes de Área,COPASST,Área de Gestión de la SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de Simulacros Realizados en cuanto a la Programación" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° De Simulacros Realizados
                                                                <asp:TextBox ID="Textbox30" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox30_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nro. De Simulacros Programados<br />
                                                            <asp:TextBox ID="Textbox31" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox30_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado28" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>

                        <!-- Tercer Panel -->
                        <div class="panel">

                            <div class="panel-heading bg-aqua color-palette">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#ContentPlaceHolder1_collapse3">INDICADOR DE RESULTADO</a>
                                </h4>
                            </div>

                            <div runat="server" id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body">

                                    <div class="box-body no-padding">
                                        <table class="table table-condensed" style="overflow: scroll;">
                                            <tbody>

                                                <tr class="bg-aqua color-palette">
                                                    <th class="col-md-2 text-center">DEFINICIÓN</th>
                                                    <th class="col-md-2 text-center">INTERPRETACIÒN</th>
                                                    <th class="col-md-2 text-center">MÉTODO DE CÁLCULO</th>
                                                    <th class="col-md-2 text-center">FUENTE DEL CÁLCULO</th>
                                                    <th class="col-md-1 text-center">RESPONSABLE</th>
                                                    <th class="col-md-1 text-center">FRECUENCIA</th>
                                                    <th class="col-md-1 text-center">UNIDAD</th>
                                                    <th class="col-md-1 text-center">META</th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Frecuencia de los accidentes laborales." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Número de veces que ocurre un accidente laboral, en un período de tiempo" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Número de accidentes de trabajo que se presentaron en el período “Z” / Total de horas hombre trabajadas en el período “Z”) * 240.000." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Registros de Accidentalidad, Registro de Asistencia Dpto Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST, Jefe Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual " Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Numérico" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Numérico menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de accidentes de trabajo que se presentaron en el período "Z"
                                                                <asp:TextBox ID="Textbox32" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox32_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Total de horas hombre trabajadas en el período "Z"<br />
                                                            <asp:TextBox ID="Textbox33" runat="server" class="form-control" type="number" step="0.01" min="0"
                                                                AutoPostBack="true" OnTextChanged="Textbox32_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado29" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Severidad de los accidentes laborales." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Número de días perdidos y/o cargados por accidentes laborales en un período de tiempo." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Número de días de trabajo perdidos por accidente de trabajo en el período “Z” + número de días cargados en el período “Z” / Horas hombre trabajadas en el período “Z”) * 240.000" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST,Jefe Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="días" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Numérico menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de días de trabajo perdidos por accidente de trabajo en el período “Z” + número de días cargados en el período “Z”
                                                                <asp:TextBox ID="Textbox34" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox34_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Horas hombre trabajadas en el período “Z”)<br />
                                                            <asp:TextBox ID="Textbox35" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox34_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado30" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Mortalidad de los accidentes laborales." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Número de accidentes laborales mortales en un período de tiempo." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Número de accidentes de trabajo mortales que se presentaron en el período “Z” / Total de accidentes de trabajo que se presentaron en el período “Z”) * 100." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST,Jefe Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Númerico" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Numérico menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de accidentes de trabajo mortales que se presentaron en el período “Z”  
                                                                <asp:TextBox ID="Textbox36" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox36_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Total de accidentes de trabajo que se presentaron en el período “Z”<br />
                                                            <asp:TextBox ID="Textbox37" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox36_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado31" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Tasa Accidentalidad" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Relación del número de casos de accidentes de trabajo ocurridos durante el período respecto al  número de trabajadores en el mismo período " Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="TA = (N° de Accidente de Trabajo Ocurridos en el Período / N° De Trabajadores ) X 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cálculos Índices de Accidentalidad" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Mensual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="% menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° de Accidente de Trabajo Ocurridos en el Período  
                                                                <asp:TextBox ID="Textbox38" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox38_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            ISAT<br />
                                                            <asp:Label ID="Label5" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado32" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Índice de Ausentismo Laboral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Incluye Falta al trabajo por Enfermedad Común, enfermedad profesional, accidente de trabajo y consultas de salud." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="IAL= ( N° Total de Horas de Ausentismo Justificado Medicamente en el Período / Horas Hombre en el Período ) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Cálculos Índices de Accidentalidad" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="% menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            N° Total de Horas de Ausentismo Justificado Medicamente en el Período
                                                                <asp:TextBox ID="Textbox39" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox39_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Horas Hombre en el Período<br />
                                                            <asp:TextBox ID="Textbox40" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox39_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado33" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Gestión de Riesgos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="% de Disminución de Riesgos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="GR= (Riesgos críticos gestionados / Riesgos críticos identificados) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Matriz de Riesgos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Trimestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de Riesgos críticos gestionados" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Riesgos críticos gestionados
                                                                <asp:TextBox ID="Textbox41" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox41_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Riesgos críticos identificados<br />
                                                            <asp:TextBox ID="Textbox42" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox41_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado34" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="% Cubrimiento EPP " Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Proporción de trabajadores que reciben los Equipos de Protección Personal" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="EPP= (Número de EPP entregados / Número de EPP requeridos) x  100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Registro de Control de entregas de EPP,Inspecciones de Seguridad" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Trimestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de EPP entregados al personal" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de EPP entregados
                                                                <asp:TextBox ID="Textbox43" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox43_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de EPP requeridos<br />
                                                            <asp:TextBox ID="Textbox44" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox43_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado35" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="% uso EPP" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Muestra el % de personas que usan los EPP" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Nº de Trabajadores que usan EPP en el período Laboral / Número de EPP entregados)  x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Inspecciones de Seguridad" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Mensual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de Trabajadores Cumpliendo con el uso de EPP" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Trabajadores que usan EPP en el período Laboral
                                                                <asp:TextBox ID="Textbox45" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox45_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de EPP entregados<br />
                                                            <asp:TextBox ID="Textbox46" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox45_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado36" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Eficiencia del SGSST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="% de eficiencia del SGSST respecto a los reportes de los Trabajadores" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Deficiencias del SG-SST identificadas efectivamente gestionadas/ Deficiencias del SG-SST identificadas por los trabajadores) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Reporte de los Trabajadores" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="COPASST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de Deficiencias Gestionadas" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Deficiencias del SG-SST identificadas efectivamente gestionadas
                                                                <asp:TextBox ID="Textbox47" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox47_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Deficiencias del SG-SST identificadas por los trabajadores<br />
                                                            <asp:TextBox ID="Textbox48" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox47_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado37" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Acciones correctivas" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Indicador de las acciones correctivas realizadas" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Nº de Acciones correctivas implementadas / Nº de inconformidades encontradas) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST,Inspecciones,COPASST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de acciones correctivas implementadas" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de Acciones correctivas implementadas
                                                                <asp:TextBox ID="Textbox49" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox49_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de inconformidades encontradas<br />
                                                            <asp:TextBox ID="Textbox50" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox49_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado38" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="% Condiciones mejoradas" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Muestra el porcentaje de condiciones mejoradas" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="CM = ( Nº de condiciones mejoradas/ Nº de no conformidades encontradas) x  100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="SG-SST,inspecciones de Seguridad" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Semestral" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de condiciones mejoradas" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de condiciones mejoradas
                                                                <asp:TextBox ID="Textbox51" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox51_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Nº de no conformidades encontradas<br />
                                                            <asp:TextBox ID="Textbox52" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox51_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado39" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="% de Cumplimiento del Decreto 1072" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="% de Implementación del SGSST en cumplimiento de todos los requisitos del Decreto 1072" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Requisitos cumplidos del decreto 1072 / Totalidad de requisitos establecidos en el Decreto 1072) x 100" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Matriz Legal" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="%" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="100% de los lineamientos del Decreto 1072 cumplidos" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Requisitos cumplidos del decreto 1072 
                                                                <asp:TextBox ID="Textbox53" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox53_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Totalidad de requisitos establecidos en el Decreto 1072<br />
                                                            <asp:TextBox ID="Textbox54" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox53_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado40" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <asp:Label runat="server" Text="Ausentismo." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Ausentismo es la no asistencia al trabajo, con incapacidad médica." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="(Número de días de ausencia por incapacidad laboral y común / Número de días de trabajo programados) * 100." Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Coordinador de SST,Jefe Recursos Humanos" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Anual" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Númerico" Font-Size="Smaller"></asp:Label></th>
                                                    <th>
                                                        <asp:Label runat="server" Text="Valor Numérico menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:Label></th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de días de ausencia por incapacidad laboral y común 
                                                                <asp:TextBox ID="Textbox55" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                    AutoPostBack="true" OnTextChanged="Textbox55_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Número de días de trabajo programados<br />
                                                            <asp:TextBox ID="Textbox56" runat="server" class="form-control" type="number" step="0.01" min="0" max="100"
                                                                AutoPostBack="true" OnTextChanged="Textbox55_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </th>
                                                    <th>
                                                        <div class="external-event bg-green">
                                                            Resultado<br />
                                                            <asp:Label ID="resultado41" runat="server" Text="---"></asp:Label>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <div class="row text-center">
                <div class="col-md-4 col-md-offset-2">
                    <asp:ImageButton AlternateText="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
                        OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
                    <h4>Generar Documento</h4>
                </div>
                <div class="col-md-4">
                    <asp:PlaceHolder Visible="true" ID="PlaceHolder1" runat="server">
                        <asp:ImageButton alt="-" runat="server" ImageUrl="~\ico\upload.png"
                            data-toggle="modal" data-target="#addModal" />
                        <h4>Subir Documento</h4>
                    </asp:PlaceHolder>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Subir Documento</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <div class="row">
                                <label class="col-md-4 control-label">Nombre: </label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombre" runat="server"
                                        ValidationGroup="ValidationAdd1" />
                                </div>
                            </div>
                            <br />

                            <asp:PlaceHolder runat="server" ID="phEmpresaAdd">
                                <div class="row">
                                    <label class="col-md-4 control-label">Empresa: </label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlEmpresaAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server"
                                            ValidationGroup="ValidationAdd1" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phSucursalAdd">
                                <div class="row">
                                    <label class="col-md-4 control-label">Sucursal: </label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlSucursalAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server"
                                            ValidationGroup="ValidationAdd1" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <div class="row">
                                <label class="col-md-4 control-label">Archivo: </label>
                                <div class="col-md-6">
                                    <asp:FileUpload ID="flpArchivo" runat="server" ClientIDMode="Static" ></asp:FileUpload>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="flpArchivo" runat="server"
                                        ValidationGroup="ValidationAdd1" />
                                </div>
                            </div>
                            <br />
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="Guardar" ValidationGroup="ValidationAdd1" /></div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnAdd" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>

</asp:Content>
