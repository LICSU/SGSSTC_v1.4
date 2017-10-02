<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionPuestos.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionPuestos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_Inspecciones.aspx">Inspecciones</a></li>
                <li><a href="#">Crear Inspección de Puesto de Trabajo</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Inspección de Puesto de Trabajo</h1>
            </div>

            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row form-group">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <div class="col-md-3">
                    <h4 class="text-center">Area</h4>
                    <asp:DropDownList runat="server" ID="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" class="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <h4 class="text-center">Puesto de Trabajo</h4>
                    <asp:DropDownList runat="server" ID="ddlPuesto" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Puesto de Trabajo" class="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlPuesto_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlPuesto" runat="server" ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-1"></div>
                <asp:PlaceHolder runat="server" ID="phTrabajdor" Visible="False">
                    <div class="col-md-3">
                        <h4 class="text-center">Trabajador</h4>
                        <asp:DropDownList ID="ddlTrabajador" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
            </div>

            <asp:PlaceHolder runat="server" ID="phInformacion" Visible="False">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <div class="panel-group" id="accordion">

                            <!-- Primer Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">ORGANIZACIÓN DE TRABAJO</a></h4>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿La jornada laboral semanal excede de 48 Horas? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi1" GroupName="chk1"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo1" GroupName="chk1"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt1" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿Se realizan horas extras luego de la jornada de trabajo? y esto es un factor estresante para el trabajador (a)? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi2" GroupName="chk2"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo2" GroupName="chk2"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt2" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿Existe rotación en los turnos de trabajo (día – noche), y esto es un factor estresante para el trabajador (a)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi3" GroupName="chk3"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo3" GroupName="chk3"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt3" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿Durante la jornada laboral, los descansos ó pausas son escasos ó nulos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi4" GroupName="chk4"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo4" GroupName="chk4"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt4" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿Se impone un ritmo de trabajo difícil de alcanzar para el trabajador ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi5" GroupName="chk5"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo5" GroupName="chk5"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt5" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Segundo Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">ASPECTO A EVALUAR DEL AMBIENTE</a></h4>
                                </div>
                                <div id="collapse2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿El trabajador está expuesto a temperaturas extremas? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi6" GroupName="chk6"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo6" GroupName="chk6"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt6" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>7</asp:TableCell>
                                                <asp:TableCell>¿Existen variaciones extremas de temperatura durante la jornada?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi7" GroupName="chk7"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo7" GroupName="chk7"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt7" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>8</asp:TableCell>
                                                <asp:TableCell>¿Es bajo el nivel de iluminación en el área de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi8" GroupName="chk8"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo8" GroupName="chk8"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt8" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>9</asp:TableCell>
                                                <asp:TableCell>¿Existen deslumbramientos en el área de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi9" GroupName="chk9"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo9" GroupName="chk9"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt9" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>10</asp:TableCell>
                                                <asp:TableCell>¿Existen sombras por falta de iluminación en el área de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi10" GroupName="chk10"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo10" GroupName="chk10"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt10" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>11</asp:TableCell>
                                                <asp:TableCell>¿Es baja la frecuencia de limpieza en la lámparas y ventanas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi11" GroupName="chk11"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo11" GroupName="chk11"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt11" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>12</asp:TableCell>
                                                <asp:TableCell>¿Las lámparas fundidas son sustituidas con baja frecuencia? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi12" GroupName="chk12"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo12" GroupName="chk12"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt12" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>13</asp:TableCell>
                                                <asp:TableCell>¿Hay ruido excesivo,constante y molesto?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi13" GroupName="chk13"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo13" GroupName="chk13"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt13" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>14</asp:TableCell>
                                                <asp:TableCell>¿Hay vibración de cuerpo completo o de las extremidades superiores?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi14" GroupName="chk14"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo14" GroupName="chk14"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt14" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>15</asp:TableCell>
                                                <asp:TableCell>¿Se emplean herramientas que produzcan vibraciones (martillo neumático, buril, pulidora, etc.), sin sistemas de amortiguación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi15" GroupName="chk15"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo15" GroupName="chk15"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt15" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>16</asp:TableCell>
                                                <asp:TableCell>¿Existen máquinas que producen vibraciones?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi16" GroupName="chk16"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo16" GroupName="chk16"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt16" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>17</asp:TableCell>
                                                <asp:TableCell>¿La circulación de aire en el área de trabajo es insuficiente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi17" GroupName="chk17"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo17" GroupName="chk17"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt17" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Tres -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">ASPECTO A EVALUAR CARGA FISICA DEL TRABAJO </a></h4>
                                </div>
                                <div id="collapse3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>18</asp:TableCell>
                                                <asp:TableCell>¿El trabajador mantiene una postura prolongada durante el 75% o más de la jornada laboral sin alternarla (de pie o sentado)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi18" GroupName="chk18"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo18" GroupName="chk18"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt18" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>19</asp:TableCell>
                                                <asp:TableCell>¿Existen rotaciones e inclinaciones repetidas de cuello?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi19" GroupName="chk19"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo19" GroupName="chk19"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt19" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>20</asp:TableCell>
                                                <asp:TableCell>¿Hay flexiones repetidas de la espalda o tronco mayores de 30°?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi20" GroupName="chk20"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo20" GroupName="chk20"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt20" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>21</asp:TableCell>
                                                <asp:TableCell>¿Hay rotaciones de la espalda o tronco?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi21" GroupName="chk21"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo21" GroupName="chk21"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt21" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>22</asp:TableCell>
                                                <asp:TableCell>¿El trabajador realiza de manera prolongada actividades arrodillado y/o en cuclillas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi22" GroupName="chk22"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo22" GroupName="chk22"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt22" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>23</asp:TableCell>
                                                <asp:TableCell>¿Existen posturas de los hombros en flexión mayor de 45°?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi23" GroupName="chk23"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo23" GroupName="chk23"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt23" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>24</asp:TableCell>
                                                <asp:TableCell>¿Existen posturas donde el hombro se encuentra en abducción mayor de 45°? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi24" GroupName="chk24"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo24" GroupName="chk24"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt24" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>25</asp:TableCell>
                                                <asp:TableCell>¿Existen posturas donde los codos se encuentren en flexión mayor de 90°?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi25" GroupName="chk25"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo25" GroupName="chk25"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt25" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>26</asp:TableCell>
                                                <asp:TableCell>¿Existen posturas donde se exija levantar y sostener el codo por encima del nivel de la mitad del pecho?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi26" GroupName="chk26"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo26" GroupName="chk26"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt26" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>27</asp:TableCell>
                                                <asp:TableCell>¿Existen posturas del tronco en contra de la gravedad?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi27" GroupName="chk27"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo27" GroupName="chk27"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt27" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>28</asp:TableCell>
                                                <asp:TableCell>¿Existen posturas de los miembros superiores en contra de la gravedad?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi28" GroupName="chk28"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo28" GroupName="chk28"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt28" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>29</asp:TableCell>
                                                <asp:TableCell>¿Hay desviaciones en manos con relación al eje neutro de la muñeca en la manipulación o agarre de herramientas u objetos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi29" GroupName="chk29"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo29" GroupName="chk29"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt29" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>30</asp:TableCell>
                                                <asp:TableCell>¿Hay repetitividad de movimientos idénticos o similares efectuados cada pocos segundos en los miembros superiores?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi30" GroupName="chk30"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo30" GroupName="chk30"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt30" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>31</asp:TableCell>
                                                <asp:TableCell>¿Hay movimientos del tronco con combinación de fuerza?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi31" GroupName="chk31"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo31" GroupName="chk31"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt31" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>32</asp:TableCell>
                                                <asp:TableCell>¿Existe movimientos repetidos para alcanzar algo que se encuentre detrás de la persona?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi32" GroupName="chk32"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo32" GroupName="chk32"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt32" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>33</asp:TableCell>
                                                <asp:TableCell>¿Hay movimientos de los miembros superiores con combinación de fuerza?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi33" GroupName="chk33"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo33" GroupName="chk33"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt33" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>34</asp:TableCell>
                                                <asp:TableCell>¿Existen posturas de elevación sostenida o repetida de los brazos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi34" GroupName="chk34"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo34" GroupName="chk34"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt34" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>35</asp:TableCell>
                                                <asp:TableCell>¿La tarea involucra posturas no-neutrales y repetidas de la mano ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi35" GroupName="chk35"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo35" GroupName="chk35"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt35" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>36</asp:TableCell>
                                                <asp:TableCell>¿La tarea involucra movimientos rápidos, fuertes o repentinos de los miembros superiores en posiciones forzadas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi36" GroupName="chk36"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo36" GroupName="chk36"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt36" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>37</asp:TableCell>
                                                <asp:TableCell>¿La tarea requiere esfuerzos enérgicos de la mano con el brazo extendido?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi37" GroupName="chk37"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo37" GroupName="chk37"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt37" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>38</asp:TableCell>
                                                <asp:TableCell>¿La tarea exige mover la cabeza repetidamente de un lado a otro?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi38" GroupName="chk38"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo38" GroupName="chk38"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt38" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>39</asp:TableCell>
                                                <asp:TableCell>¿La tarea exige flexión del tronco hacia adelante mas de 20º?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi39" GroupName="chk39"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo39" GroupName="chk39"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt39" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>40</asp:TableCell>
                                                <asp:TableCell>¿La tarea implica Inclinación lateral del tronco, repetidas veces?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi40" GroupName="chk40"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo40" GroupName="chk40"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt40" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>41</asp:TableCell>
                                                <asp:TableCell>¿Se debe  Rotar el tronco en más de 20º?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi41" GroupName="chk41"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo41" GroupName="chk41"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt41" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>42</asp:TableCell>
                                                <asp:TableCell>¿La tarea involucra movimientos rápidos, fuertes o repentinos de la espalda en posiciones forzadas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi42" GroupName="chk42"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo42" GroupName="chk42"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt42" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Cuatro -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">MANIPULACIÓN DE CARGA</a></h4>
                                </div>
                                <div id="collapse4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>43</asp:TableCell>
                                                <asp:TableCell>¿ El trabajo requiere levantar cargas compactas? (para hombres 25 kilos y mujeres 12.5 kilos)</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi43" GroupName="chk43"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo43" GroupName="chk43"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt43" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>44</asp:TableCell>
                                                <asp:TableCell>¿ Para aquellos trabajadores dedicados constantemente al levantamiento y transporte de carga,  los intervalos de pausa, o períodos libres de esfuerzo físico extraordinario son escasos o núlos  y esto no les permite una recuperación de la fátiga?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi44" GroupName="chk44"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo44" GroupName="chk44"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt44" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>45</asp:TableCell>
                                                <asp:TableCell>¿El trabajador levanta peso por debajo de las rodillas ó arriba de los hombros repetidas veces al día?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi45" GroupName="chk45"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo45" GroupName="chk45"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt45" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>46</asp:TableCell>
                                                <asp:TableCell>¿El trabajador empuja o hala 10 o más kilos durante 2 o más horas consecutivas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi46" GroupName="chk46"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo46" GroupName="chk46"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt46" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>47</asp:TableCell>
                                                <asp:TableCell>¿El trabajador manipula objetos o herramientas de un peso igual o mayor a 2 kilogramos por mano?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi47" GroupName="chk47"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo47" GroupName="chk47"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt47" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>48</asp:TableCell>
                                                <asp:TableCell>¿Hay manipulación de objetos o herramientas por encima de los hombros ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi48" GroupName="chk48"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo48" GroupName="chk48"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt48" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>49</asp:TableCell>
                                                <asp:TableCell>¿Hay manipulación de objetos o herramientas por debajo de la cintura ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi49" GroupName="chk49"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo49" GroupName="chk49"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt49" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>50</asp:TableCell>
                                                <asp:TableCell>¿Hay inclinación del tronco al manipular objetos o cargas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi50" GroupName="chk50"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo50" GroupName="chk50"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt50" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>51</asp:TableCell>
                                                <asp:TableCell>¿Hay giros o torsiones de tronco al manipular objetos o cargas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi51" GroupName="chk51"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo51" GroupName="chk51"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt51" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>52</asp:TableCell>
                                                <asp:TableCell>¿Hay desplazamientos del cuerpo mientras se manipulan los objetos o las cargas, y la manipulación se realiza de manera indecuada (la carga alejada del cuerpo y la misma no posee un agarre adecuado ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi52" GroupName="chk52"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo52" GroupName="chk52"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt52" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Cinco -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse5">CARGA MENTAL</a></h4>
                                </div>
                                <div id="collapse5" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>53</asp:TableCell>
                                                <asp:TableCell>¿El trabajo exige simultáneamente varias tareas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi53" GroupName="chk53"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo53" GroupName="chk53"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt53" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>54</asp:TableCell>
                                                <asp:TableCell>¿La tarea tiene un grado alto de concentración requiere de una elevada concentración sostenida y contínua, lo cual no es posible debido a factores externos ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi54" GroupName="chk54"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo54" GroupName="chk54"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt54" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>55</asp:TableCell>
                                                <asp:TableCell>¿Se requiere velocidad en el proceso para la realización de la tarea? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi55" GroupName="chk55"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo55" GroupName="chk55"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt55" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>56</asp:TableCell>
                                                <asp:TableCell>¿El trabajo implica el control de varias señales ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi56" GroupName="chk56"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo56" GroupName="chk56"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt56" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>57</asp:TableCell>
                                                <asp:TableCell>¿El trabajo es minucioso y requiere de precisión?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi57" GroupName="chk57"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo57" GroupName="chk57"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt57" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>58</asp:TableCell>
                                                <asp:TableCell>¿Existe un alto riesgo de accidentalidad en la manipulación de herramientas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi58" GroupName="chk58"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo58" GroupName="chk58"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt58" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>59</asp:TableCell>
                                                <asp:TableCell>¿La realización de la tarea prohíbe hablar con otros compañeros mientras se trabaja, y no se permiten pausas de descanso?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi59" GroupName="chk59"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo59" GroupName="chk59"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt59" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Seis -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse6">CONDICIONES DEL PUESTO DE TRABAJO</a></h4>
                                </div>
                                <div id="collapse6" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>60</asp:TableCell>
                                                <asp:TableCell>¿La altura del plano de trabajo genera inclinaciones de tronco?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi60" GroupName="chk60"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo60" GroupName="chk60"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt60" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>61</asp:TableCell>
                                                <asp:TableCell>¿Los elementos de trabajo se encuentran fuera del alcance del trabajador? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi61" GroupName="chk61"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo61" GroupName="chk61"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt61" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>62</asp:TableCell>
                                                <asp:TableCell>¿La visibilidad de todos los elementos de trabajo implica adoptar posturas inadecuadas o no confortables para el trabajador? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi62" GroupName="chk62"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo62" GroupName="chk62"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt62" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>63</asp:TableCell>
                                                <asp:TableCell>¿El espacio de trabajo limita el libre movimiento? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi63" GroupName="chk63"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo63" GroupName="chk63"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt63" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>64</asp:TableCell>
                                                <asp:TableCell>¿La manipulación de cargas se realiza sin ayudas mecánicas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi64" GroupName="chk64"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo64" GroupName="chk64"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt64" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>65</asp:TableCell>
                                                <asp:TableCell>¿Se carece de elementos que permitan alternar posturas y/o que brinden confort (silla, reposa pies o banca para alternar posturas)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi65" GroupName="chk65"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo65" GroupName="chk65"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt65" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>66</asp:TableCell>
                                                <asp:TableCell>¿La superficie de trabajo exige posturas de los miembros superiores en contra de la gravedad?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi66" GroupName="chk66"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo66" GroupName="chk66"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt66" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>67</asp:TableCell>
                                                <asp:TableCell>¿La silla utilizada es estática ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi67" GroupName="chk67"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo67" GroupName="chk67"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt67" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>68</asp:TableCell>
                                                <asp:TableCell>¿El asiento es inadecuado a las dimensiones del usuario (profundidad y anchura)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi68" GroupName="chk68"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo68" GroupName="chk68"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt68" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>69</asp:TableCell>
                                                <asp:TableCell>¿La silla es incómoda para el usuario?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi69" GroupName="chk69"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo69" GroupName="chk69"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt69" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>70</asp:TableCell>
                                                <asp:TableCell>¿La herramienta de trabajo es inadecuada a las necesidades del trabajador en cuanto a la funcionalidad para ejecutar la tarea?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi70" GroupName="chk70"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo70" GroupName="chk70"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt70" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>71</asp:TableCell>
                                                <asp:TableCell>¿Las dimensiones del mango y la naturaleza del agarre son inadecuados a las dimensiones de la mano del trabajador?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi71" GroupName="chk71"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo71" GroupName="chk71"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt71" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>72</asp:TableCell>
                                                <asp:TableCell>¿Se usan herramientas o equipos que tengan altos niveles de vibración (sierras eléctricas, martillos neumáticos, herramientas de percusión, martillos de remachado)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi72" GroupName="chk72"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo72" GroupName="chk72"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt72" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Siete -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse7">CONDICIONES TERMOHIGROMETRICAS</a></h4>
                                </div>
                                <div id="collapse7" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>73</asp:TableCell>
                                                <asp:TableCell>¿Existen focos de calor (hornos, calderas, etc.) sin aislar convenientemente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi73" GroupName="chk73"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo73" GroupName="chk73"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt73" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>74</asp:TableCell>
                                                <asp:TableCell>¿Existen condiciones inapropiadas de ventilación en el local?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi74" GroupName="chk74"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo74" GroupName="chk74"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt74" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>75</asp:TableCell>
                                                <asp:TableCell>¿En la operación se generan vapores o humedad? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi75" GroupName="chk75"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo75" GroupName="chk75"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt75" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>76</asp:TableCell>
                                                <asp:TableCell>¿La temperatura del local de trabajo es inadecuada?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi76" GroupName="chk76"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo76" GroupName="chk76"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt76" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>77</asp:TableCell>
                                                <asp:TableCell>¿La ropa de trabajo utilizada es inapropiada al tipo de trabajo y a la temperatura ambiental?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi77" GroupName="chk77"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo77" GroupName="chk77"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt77" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>78</asp:TableCell>
                                                <asp:TableCell>¿El  mantenimiento que se realiza  a los sistemas de ventilación es ineficaz?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi78" GroupName="chk78"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo78" GroupName="chk78"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt78" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Ocho -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse8">RADIACIONES (Abstenerse de realizar la selección si no existe el riesgo de radiación)</a></h4>
                                </div>
                                <div id="collapse8" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>79</asp:TableCell>
                                                <asp:TableCell>¿El trabajador(a) está expuesto a radiaciones ionizantes y se dota de Equipo de Protección adecuada?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi79" GroupName="chk79"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo79" GroupName="chk79"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt79" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>80</asp:TableCell>
                                                <asp:TableCell>¿Existe señalización del riesgo a exposición de radiaciones ionizantes ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi80" GroupName="chk80"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo80" GroupName="chk80"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt80" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>81</asp:TableCell>
                                                <asp:TableCell>¿Se realizan evaluaciones médicas periódicas deacuerdo al riesgo al que está expuesto el trabajador?<strong>(abstenerse de realizar la selección si no existe el riesgo de radiación)</strong></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi81" GroupName="chk81"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo81" GroupName="chk81"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt81" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Nueve -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse9">CONTAMINANTES QUÍMICOS ( Si no se emplean productos químicos abstenerse de responder estas preguntas)</a></h4>
                                </div>
                                <div id="collapse9" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>82</asp:TableCell>
                                                <asp:TableCell>¿Se utilizan productos químicos en su área de trabajo, y conoce que productos son los que emplea?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi82" GroupName="chk79"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo82" GroupName="chk79"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt82" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>83</asp:TableCell>
                                                <asp:TableCell>¿Los productos químicos están etiquetados adecuadamente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi83" GroupName="chk83"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo83" GroupName="chk83"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt83" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>84</asp:TableCell>
                                                <asp:TableCell>¿Existen normas establecidas para la utilización de productos químicos peligrosos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi84" GroupName="chk84"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo84" GroupName="chk84"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt84" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>85</asp:TableCell>
                                                <asp:TableCell>¿Se realizan mediciones periódicas de la concentración del contaminante?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi85" GroupName="chk85"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo85" GroupName="chk85"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt85" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>86</asp:TableCell>
                                                <asp:TableCell>¿Se realizan revisiones médicas periódicas a los trabajadores?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi86" GroupName="chk86"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo86" GroupName="chk86"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt86" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>87</asp:TableCell>
                                                <asp:TableCell>¿ Si se emplean productos tóxicos, ¿ El personal Mantiene condiciones mínimas de higiene? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi87" GroupName="chk87"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo87" GroupName="chk87"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt87" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>88</asp:TableCell>
                                                <asp:TableCell>¿ Antes de incorporar al proceso productivo una sustancia química, ¿Se informan a los trabajadores sobre la hoja de datos de seguridad del producto? ( donde el proveedor detalla los datos del producto, niveles de toxicidad y acciones a seguir en casos de emergencia)</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi88" GroupName="chk88"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo88" GroupName="chk88"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt88" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Diez -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse10">CONTAMINANTES BIOLÓGICOS</a></h4>
                                </div>
                                <div id="collapse10" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>89</asp:TableCell>
                                                <asp:TableCell>Si se trabaja con manipulación de productos origen animal, laboratorios biológicos y clínicos, hospitales, sanitarios, etc.: ¿Están los aseos, los comedores etc., aislados de la zona de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi89" GroupName="chk89"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo89" GroupName="chk89"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt89" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>90</asp:TableCell>
                                                <asp:TableCell>¿Se mantienen los lugares de trabajo, vestuarios, baños, comedores, etc., en perfectas condiciones de limpieza y desinfección?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi90" GroupName="chk90"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo90" GroupName="chk90"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt90" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>91</asp:TableCell>
                                                <asp:TableCell>¿Se mantienen condiciones mínimas de higiene personal? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi91" GroupName="chk91"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo91" GroupName="chk91"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt91" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Once -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse11">FATIGA FÍSICA</a></h4>
                                </div>
                                <div id="collapse11" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>92</asp:TableCell>
                                                <asp:TableCell>Los esfuerzos realizados en el desarrollo de la labor están adecuados al trabajador (a) respecto a: </asp:TableCell>
                                                <asp:TableCell></asp:TableCell>
                                                <asp:TableCell></asp:TableCell>
                                                <asp:TableCell></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>93</asp:TableCell>
                                                <asp:TableCell>¿Su capacidad física?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi93" GroupName="chk93"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo93" GroupName="chk93"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt93" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>94</asp:TableCell>
                                                <asp:TableCell>¿A la temperatura ambiental?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi94" GroupName="chk94"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo94" GroupName="chk94"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt94" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>95</asp:TableCell>
                                                <asp:TableCell>¿A su edad?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi95" GroupName="chk95"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo95" GroupName="chk95"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt95" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>96</asp:TableCell>
                                                <asp:TableCell>¿A su entrenamiento?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi96" GroupName="chk96"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo96" GroupName="chk96"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt96" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>97</asp:TableCell>
                                                <asp:TableCell>Si el trabajador realiza un trabajo muy pesado ¿ Se le hacen revisiones para controlar la frecuencia cardiaca?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi97" GroupName="chk97"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo97" GroupName="chk97"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt97" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>98</asp:TableCell>
                                                <asp:TableCell>¿Se realizan una evaluación de consumo metabólico con respecto a la actividad que realiza el trabajador(a)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi98" GroupName="chk98"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo98" GroupName="chk98"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt98" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Doce -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse12">DAÑOS A LA SALUD</a></h4>
                                </div>
                                <div id="collapse12" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>99</asp:TableCell>
                                                <asp:TableCell>¿Se informa sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi99" GroupName="chk99"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo99" GroupName="chk99"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt99" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>100</asp:TableCell>
                                                <asp:TableCell>¿Se informa de los accidentes de trabajo ocurridos en el último año?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi100" GroupName="chk100"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo100" GroupName="chk100"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt100" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>101</asp:TableCell>
                                                <asp:TableCell>¿ Se informa  a los trabjadores sobre las causas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi101" GroupName="chk101"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo101" GroupName="chk101"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt101" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>102</asp:TableCell>
                                                <asp:TableCell>¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi102" GroupName="chk102"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo102" GroupName="chk102"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt102" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>103</asp:TableCell>
                                                <asp:TableCell>¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi103" GroupName="chk103"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo103" GroupName="chk103"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt103" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>104</asp:TableCell>
                                                <asp:TableCell>Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi104" GroupName="chk104"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo104" GroupName="chk104"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt104" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>105</asp:TableCell>
                                                <asp:TableCell>Ante los Accidentes Laborales ¿Se realiza la investigación del evento?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi105" GroupName="chk105"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo105" GroupName="chk105"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt105" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>106</asp:TableCell>
                                                <asp:TableCell>¿Se le informa al personal sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi106" GroupName="chk106"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo106" GroupName="chk106"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt106" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>107</asp:TableCell>
                                                <asp:TableCell>¿Se informa de los accidentes de trabajo ocurridos en el último año?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi107" GroupName="chk107"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo107" GroupName="chk107"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt107" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>108</asp:TableCell>
                                                <asp:TableCell>¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi108" GroupName="chk108"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo108" GroupName="chk108"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt108" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>109</asp:TableCell>
                                                <asp:TableCell>Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi109" GroupName="chk109"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo109" GroupName="chk109"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt109" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>110</asp:TableCell>
                                                <asp:TableCell>Ante los Accidentes Laborales ¿Se realiza la investigación del evento?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi110" GroupName="chk110"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo110" GroupName="chk110"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt110" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Trece -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse13">EQUIPOS DE PROTECCIÓN PERSONAL</a></h4>
                                </div>
                                <div id="collapse13" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>111</asp:TableCell>
                                                <asp:TableCell>¿Se dota al personal de Equipos de Protección Personal?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi111" GroupName="chk111"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo111" GroupName="chk111"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt111" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>112</asp:TableCell>
                                                <asp:TableCell>¿Son adecuados al riesgo que deben proteger?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi112" GroupName="chk112"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo112" GroupName="chk112"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt112" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>113</asp:TableCell>
                                                <asp:TableCell>¿Son de uso personal?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi113" GroupName="chk113"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo113" GroupName="chk113"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt113" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>114</asp:TableCell>
                                                <asp:TableCell>¿Se revisan periódicamente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi114" GroupName="chk114"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo114" GroupName="chk114"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt114" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>115</asp:TableCell>
                                                <asp:TableCell>¿Se exige su uso obligatorio?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi115" GroupName="chk115"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo115" GroupName="chk115"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt115" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>116</asp:TableCell>
                                                <asp:TableCell>¿Se inspecciona el cumplimiento del uso del equipo de protección?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi116" GroupName="chk116"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo116" GroupName="chk116"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt116" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Catorce -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse14">CAPACITACIÓN O INFORMACIÓN</a></h4>
                                </div>
                                <div id="collapse14" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>117</asp:TableCell>
                                                <asp:TableCell>¿Se realizan capacitaciones respecto a temas de Seguridad y Salud en el Trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi117" GroupName="chk117"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo117" GroupName="chk117"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt117" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>118</asp:TableCell>
                                                <asp:TableCell>¿Se realizan simulacros de evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi118" GroupName="chk118"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo118" GroupName="chk118"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt118" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>119</asp:TableCell>
                                                <asp:TableCell>¿La empresa cumple con las señalizaciones de rutas de evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi119" GroupName="chk119"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo119" GroupName="chk119"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt119" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>120</asp:TableCell>
                                                <asp:TableCell>¿Existe definido un plan de evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi120" GroupName="chk120"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo120" GroupName="chk120"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt120" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>121</asp:TableCell>
                                                <asp:TableCell>¿Se exige su uso obligatorio?¿Están definidos cuales son los puntos de reunión después de una evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi121" GroupName="chk121"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo121" GroupName="chk121"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt121" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>122</asp:TableCell>
                                                <asp:TableCell>¿Se capacita al personal sobre el uso correcto de los equipos de extinción?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi122" GroupName="chk122"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo122" GroupName="chk122"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt122" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>123</asp:TableCell>
                                                <asp:TableCell>¿El personal conoce donde están ubicados los extintores?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi123" GroupName="chk123"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo123" GroupName="chk123"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt123" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>124</asp:TableCell>
                                                <asp:TableCell>¿Es de conocimiento del personal donde están ubicadas las tomas de manguera para incendio?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi124" GroupName="chk124"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo124" GroupName="chk124"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt124" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>125</asp:TableCell>
                                                <asp:TableCell>¿Se ha conformado la brigada de emergencia?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi125" GroupName="chk125"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo125" GroupName="chk125"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt125" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Quince -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse15">ASPECTOS PSICOSOCIALES</a></h4>
                                </div>
                                <div id="collapse15" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>126</asp:TableCell>
                                                <asp:TableCell>¿El trabajador tiene algún tipo de control sobre el proceso de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi126" GroupName="chk126"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo126" GroupName="chk126"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt126" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>127</asp:TableCell>
                                                <asp:TableCell>¿Los Programas a utilizar en sus tareas diarias son fáciles de utilizar?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi127" GroupName="chk127"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo127" GroupName="chk127"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt127" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>128</asp:TableCell>
                                                <asp:TableCell>¿Se entrena al trabajador (a) para utilizar un nuevo software?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi128" GroupName="chk128"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo128" GroupName="chk128"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt128" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>129</asp:TableCell>
                                                <asp:TableCell>¿Existe comunicación asertiva entre los trabajadores y el supervisor?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi129" GroupName="chk129"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo129" GroupName="chk129"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt129" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>130</asp:TableCell>
                                                <asp:TableCell>¿El trabajo está organizado de manera que no se exija simultáneamente varias tareas ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi130" GroupName="chk130"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo130" GroupName="chk130"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt130" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>131</asp:TableCell>
                                                <asp:TableCell>¿ Si la tarea requiere de una elevada concentración, se evitan los agentes distractores en el lugar de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi131" GroupName="chk131"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo131" GroupName="chk131"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt131" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>132</asp:TableCell>
                                                <asp:TableCell>¿ En la organización se evita laborar horas extras luego de la jornada de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi132" GroupName="chk132"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo132" GroupName="chk132"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt132" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Dieciseis -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse16">EQUIPOS DE EMERGENCIA</a></h4>
                                </div>
                                <div id="collapse16" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>133</asp:TableCell>
                                                <asp:TableCell>¿Existen equipos Extintores?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi133" GroupName="chk133"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo133" GroupName="chk133"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt133" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>134</asp:TableCell>
                                                <asp:TableCell>¿Existe botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi134" GroupName="chk134"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo134" GroupName="chk134"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt134" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>135</asp:TableCell>
                                                <asp:TableCell>¿ Está señalizada la vía de Evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi135" GroupName="chk135"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo135" GroupName="chk135"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt135" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>136</asp:TableCell>
                                                <asp:TableCell>¿ Existe alumbrado de Emergencia?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi136" GroupName="chk136"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo136" GroupName="chk136"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt136" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Diecisiete -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse17">ASPECTOS LOCATIVOS</a></h4>
                                </div>
                                <div id="collapse17" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>137</asp:TableCell>
                                                <asp:TableCell>¿Son óptimas las condiciones del Techo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi137" GroupName="chk137"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo137" GroupName="chk137"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt137" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>138</asp:TableCell>
                                                <asp:TableCell>¿ El piso de la instalación se en encuentra en buenas condiciones?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi138" GroupName="chk138"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo138" GroupName="chk138"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt138" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>139</asp:TableCell>
                                                <asp:TableCell>¿ Las paredes del local  son óptimas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi139" GroupName="chk139"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo139" GroupName="chk139"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt139" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>140</asp:TableCell>
                                                <asp:TableCell>¿ Las puertas se encuentran en buen estado?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi140" GroupName="chk140"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo140" GroupName="chk140"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt140" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>141</asp:TableCell>
                                                <asp:TableCell>¿ Las escaleras tienen pasa manos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi141" GroupName="chk141"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo141" GroupName="chk141"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt141" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>142</asp:TableCell>
                                                <asp:TableCell>¿ las áreas están señalizadas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi142" GroupName="chk142"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo142" GroupName="chk142"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt142" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>143</asp:TableCell>
                                                <asp:TableCell>¿ El sitio de trabajo tiene la ventilación adecuada?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi143" GroupName="chk143"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo143" GroupName="chk143"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt143" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel Dieciocho -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse18">INSTALACIONES ELÉCTRICAS</a></h4>
                                </div>
                                <div id="collapse18" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>144</asp:TableCell>
                                                <asp:TableCell>¿Es óptimo el Estado de los Cables (Entubado)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi144" GroupName="chk144"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo144" GroupName="chk144"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt144" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>145</asp:TableCell>
                                                <asp:TableCell>¿Es óptimo el Estado del toma corriente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi145" GroupName="chk145"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo145" GroupName="chk145"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt145" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>146</asp:TableCell>
                                                <asp:TableCell>¿Es óptimo el Estado del Tablero eléctrico?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi146" GroupName="chk146"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo146" GroupName="chk146"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt146" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>147</asp:TableCell>
                                                <asp:TableCell>¿Es óptimo el estado de los Bombillos/Tubos Fluorescentes?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi147" GroupName="chk147"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo147" GroupName="chk147"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt147" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Panel DieciNueve -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse19">OTRAS CONDICIONES</a></h4>
                                </div>
                                <div id="collapse19" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <asp:Table CssClass="table" runat="server">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>148</asp:TableCell>
                                                <asp:TableCell>¿Las instalaciones usadas para la alimentación son apropiadas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi148" GroupName="chk148"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo148" GroupName="chk148"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt148" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>149</asp:TableCell>
                                                <asp:TableCell>¿Se encuentran en estado óptimo de limpieza?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi149" GroupName="chk149"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo149" GroupName="chk149"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt149" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>150</asp:TableCell>
                                                <asp:TableCell>¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi150" GroupName="chk150"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo150" GroupName="chk150"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt150" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>151</asp:TableCell>
                                                <asp:TableCell>¿Los espacios sanitarios son adecuados?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi151" GroupName="chk151"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo151" GroupName="chk151"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt151" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>152</asp:TableCell>
                                                <asp:TableCell>¿Existe disponibilidad de Jabón en los espacios sanitarios?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi152" GroupName="chk152"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo152" GroupName="chk152"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt152" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>153</asp:TableCell>
                                                <asp:TableCell>¿Existe disponibilidad de papel  higiénico en los espacios sanitarios?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi153" GroupName="chk153"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo153" GroupName="chk153"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt153" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>154</asp:TableCell>
                                                <asp:TableCell>¿Existen filtros de agua potable en la empresa?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi154" GroupName="chk154"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo154" GroupName="chk154"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt154" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>155</asp:TableCell>
                                                <asp:TableCell>¿Posee la empresa áreas para el descanso y la recreación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi155" GroupName="chk155"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo155" GroupName="chk155"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt155" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>156</asp:TableCell>
                                                <asp:TableCell>¿En las instalaciones sanitarias se mantiene el orden y limpieza?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi156" GroupName="chk156"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo156" GroupName="chk156"></asp:RadioButton>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt156" CssClass="form-control"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- TextAraea de Observaciones -->
                        <h4>Observaciones Generales: </h4>
                        <br />
                        <asp:TextBox runat="server" ID="txtObsGenerales" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox><br />


                    </div>
                </div>
                <asp:PlaceHolder runat="server" ID="phGrafica" Visible="False">
                    <div class="row form-group">
                        <div class="col-md-10 col-md-offset-1">
                            <asp:Table runat="server" CssClass="table">
                                <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                    <asp:TableHeaderCell>Total de Condiciones</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Favorable </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Desfavorable </asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>Sumatoria del total de respuestas</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblSumaSi"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblSumaNo"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblResultado"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                    <!-- Grafica -->
                    <div class="text-center">
                        <asp:Chart ID="graficaPie" runat="server" AntiAliasing="Graphics">
                            <Series>
                                <asp:Series Name="seriesPie" ChartType="Pie" Legend="Legend1" Label="#PERCENT{P}"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <Area3DStyle Enable3D="true" WallWidth="0" />
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>
                </asp:PlaceHolder>
                <div class="row text-center">
                    <div class="col-md-3 col-md-offset-1">
                        <asp:ImageButton alt="-" ID="btnGenerarResultados" runat="server" 
                            ImageUrl="~\ico\calculator.png" OnClick="btnGenerarResultados_Click" />
                        <h4>Generar Resultados</h4>
                    </div>
                    <asp:PlaceHolder runat="server" ID="phDocumento" Visible="false">
                        <div class="col-md-4">
                            <asp:ImageButton alt="-" ID="btnDocumento" runat="server" ImageUrl="~\ico\print.png"
                                OnClick="GenerarDocumento" />
                            <h4>Generar Documento</h4>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" ID="phDocumento1" Visible="true">
                        <div class="col-md-4"></div>
                    </asp:PlaceHolder>

                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="phNoRegistros" Visible="false">
                <div class="row form-group">
                    <div class="col-md-8 text-center col-md-offset-2">
                        <h4><strong>No existen trabajadores con reposos registrados.</strong></h4>
                    </div>
                </div>
            </asp:PlaceHolder>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDocumento" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
