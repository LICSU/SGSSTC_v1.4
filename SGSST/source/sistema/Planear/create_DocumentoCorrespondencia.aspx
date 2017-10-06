<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_DocumentoCorrespondencia.aspx.cs" Inherits="SGSST.source.sistema.Planear.create_DocumentoCorrespondencia" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Planear</a></li>
                <li><a href="../Planear/index_DocumentoCorrespondencia.aspx">Documentos de Correspondencia</a></li>
                <li><a href="#">Crear Documento de Correspondencia</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Documento de correspondencia entre evaluaciones médicas</h1>
            </div>

            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row form-group">
                <asp:PlaceHolder runat="server" ID="phEmpresa" Visible="false">
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3 ">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <div class="col-md-3">
                    <h4 class="text-center">Cargo</h4>
                    <asp:DropDownList runat="server" ID="ddlCargo" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Cargo" class="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCargo_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <asp:PlaceHolder runat="server" ID="phInformacion" Visible="False">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <!-- Primer Panel -->
                        <asp:Table runat="server"  CssClass="table table-bordered ">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Sexo</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Edad</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Estatura</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Contextura</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Audición</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Visión</asp:TableHeaderCell>                                    
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableCell>Masculino</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb1" runat="server"  GroupName="sexo"/></asp:TableCell>
                                <asp:TableCell>Mínima</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb2" runat="server"  GroupName="edad"/></asp:TableCell>
                                <asp:TableCell>< 1.60m</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb3" runat="server"  GroupName="estatura"/></asp:TableCell>
                                <asp:TableCell>Delgado</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb4" runat="server"  GroupName="contextura"/></asp:TableCell>
                                <asp:TableCell>Optima</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb5" runat="server"  GroupName="audicion"/></asp:TableCell>
                                <asp:TableCell>Cercana/ Lejana</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb6" runat="server"  GroupName="vision"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Femenino</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb7" runat="server"  GroupName="sexo"/></asp:TableCell>
                                <asp:TableCell>Máxima </asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb8" runat="server"  GroupName="edad"/></asp:TableCell>
                                <asp:TableCell>> 1.60m</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb9" runat="server"  GroupName="estatura"/></asp:TableCell>
                                <asp:TableCell>Fornido</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb10" runat="server"  GroupName="contextura"/></asp:TableCell>
                                <asp:TableCell>No relevante</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb11" runat="server"  GroupName="audicion"/></asp:TableCell>
                                <asp:TableCell>Cromática</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb12" runat="server"  GroupName="vision"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>No relevante</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb13" runat="server"  GroupName="sexo"/></asp:TableCell>
                                <asp:TableCell>No relevante</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb14" runat="server"  GroupName="edad"/></asp:TableCell>
                                <asp:TableCell>No relevante</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb15" runat="server"  GroupName="estatura"/></asp:TableCell>
                                <asp:TableCell>No relevante</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb16" runat="server"  GroupName="contextura"/></asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>Uso de lentes</asp:TableCell>
                                <asp:TableCell><asp:RadioButton ID="rdb17" runat="server"  GroupName="vision"/></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>

                        <!-- Segunda tabla-->
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Table runat="server"  CssClass="table table-bordered ">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-left">Funcionalidad de Miembros  </asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Sup.</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Inf.</asp:TableHeaderCell>                                   
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Integridad de miembros indispensable</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb18" GroupName="1" runat="server"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb21" GroupName="1" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Compatible con disminución leve</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb19" runat="server" GroupName="2" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb22" runat="server" GroupName="2"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left"> Compatible con disminución marcada</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb20" runat="server" GroupName="3" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb23" runat="server" GroupName="3" /></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                            <div class="col-md-6">
                                <asp:Table runat="server"  CssClass="table table-bordered ">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-left">Compatibilidad del Cargo </asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">SI</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">NO</asp:TableHeaderCell>                                   
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left"> Compatible con lesiones de columna</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb24" runat="server" GroupName="4"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb27" runat="server" GroupName="4"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Compatible con limitaciones sensoriales</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb25" runat="server" GroupName="5"/></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb28" runat="server" GroupName="5"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Compatible con trastornos neurológicos</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb26" runat="server" GroupName="6"/></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb29" runat="server" GroupName="6"/></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                        <!-- fin -->
                         <!-- Segunda tabla-->
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Table runat="server"  CssClass="table table-bordered ">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-left">Posiciones requeridas </asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Frecuente</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Ocasional</asp:TableHeaderCell>                                   
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Bipedestación</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb30" GroupName="7" runat="server"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb37" GroupName="7" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Sedestación</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb31" GroupName="8" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb38" GroupName="8" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left"> Arrodillarse/agacharse/levantarse</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb32" GroupName="9" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb39" GroupName="9" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                     <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Alzar/empujar/halar </asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb33" GroupName="10" runat="server"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb40" GroupName="10" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Posiciones estáticas</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb34" GroupName="11" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb41" GroupName="11" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left"> Movimientos repetitivos  </asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb35" GroupName="12" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb42" GroupName="12" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                     <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left"> Caminar/correr</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb36" GroupName="13" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb43" GroupName="13" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                            <div class="col-md-6">
                                <asp:Table runat="server"  CssClass="table table-bordered ">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-left">Manipulación</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Frecuente</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Ocasional</asp:TableHeaderCell>                                   
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Movimiento mano-brazo</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb44" GroupName="14" runat="server"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb51" GroupName="14" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Posición estática de las piernas</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb45" GroupName="15" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb52" GroupName="15" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left"> Posición estática de los brazos</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb46" GroupName="16" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb53" GroupName="16" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                     <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Precisión con dedos</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb47" GroupName="17" runat="server"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb54" GroupName="17" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Coordinación oído-mano/pie</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb48" GroupName="18" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb55" GroupName="18" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left"> Movimiento de extremidades </asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb49" GroupName="19" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb56" GroupName="19" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                     <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left"> Coordinación vista-mano/pie</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb50" GroupName="20" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb57" GroupName="20" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                        <!-- fin -->
                        <!-- Segunda tabla-->
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Table runat="server"  CssClass="table table-bordered ">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-left">Ritmo de Trabajo </asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Frecuente</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Ocasional</asp:TableHeaderCell>                                   
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Actividades repetitivas</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb58" GroupName="21" runat="server"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb61" GroupName="21" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Actividades cíclicas</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb59" GroupName="22" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb62" GroupName="22" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left"> Actividades variadas</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb60" GroupName="23" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb63" GroupName="23" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                            <div class="col-md-6">
                                <asp:Table runat="server"  CssClass="table table-bordered ">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-left">Responsabilidades/exigencias</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Frecuente</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="bg-aqua color-palette text-center">Ocasional</asp:TableHeaderCell>                                   
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Sobre equipos/máquinas</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb64" GroupName="24" runat="server"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb71" GroupName="24" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Sobre materiales/productos</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb65" GroupName="25" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb72" GroupName="25" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Sobre personas</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb66" GroupName="26" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb73" GroupName="26" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                     <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Trabajo en equipo</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb67" GroupName="27" runat="server"/></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb74" GroupName="27" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell CssClass="text-left">Esfuerzo mental</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb68" GroupName="28" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb75" GroupName="28" runat="server"/></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Esfuerzo físico</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb69" GroupName="29" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb76" GroupName="29" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                     <asp:TableRow>
                                        <asp:TableCell  CssClass="text-left">Trabajo en equipo</asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb70" GroupName="30" runat="server" /></asp:TableCell>                                        
                                        <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb77" GroupName="30" runat="server" /></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                        <!-- fin -->
                        <!-- Inicio -->
                        <asp:Table runat="server"  CssClass="table table-bordered ">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell ColumnSpan="4" CssClass="bg-aqua color-palette text-left">Agentes Estresores (señalar los existentes)</asp:TableHeaderCell>                                 
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableCell>Ausencia de control sobre proceso</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb78" runat="server"/></asp:TableCell>
                                <asp:TableCell>Dispersión de actividades</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb79" runat="server"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Condiciones físicas del ambiente</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb80" runat="server"/></asp:TableCell>
                                <asp:TableCell>Situaciones imprevistas</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb81" runat="server"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Aislamiento del sitio de trabajo</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb82" runat="server"/></asp:TableCell>
                                <asp:TableCell>Trabajo monótono</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb83" runat="server"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Trabajo bajo presión</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb84" runat="server"/></asp:TableCell>
                                <asp:TableCell>Cambios de turno de trabajo</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb85" runat="server"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Atención al público</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb86" runat="server"/></asp:TableCell>
                                <asp:TableCell>Fatiga</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb87" runat="server"/></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <!--  fin -->
                        <!-- Inicio -->
                        <asp:Table runat="server"  CssClass="table table-bordered ">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell ColumnSpan="12" CssClass="bg-aqua color-palette text-center">Condiciones o factores de riesgos presente</asp:TableHeaderCell>                                 
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Exposición a </asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Temperatura </asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Humedad</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Ventilación</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Iluminación </asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Ruido </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Gases</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb88" runat="server" GroupName="gas"/></asp:TableCell>
                                <asp:TableCell>Baja</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb89" runat="server" GroupName="tem"/></asp:TableCell>
                                <asp:TableCell>Ambiente Seco</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb90" runat="server" GroupName="hum"/></asp:TableCell>
                                <asp:TableCell>Fuerte</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb91" runat="server" GroupName="ven"/></asp:TableCell>
                                <asp:TableCell>Intensa</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb92" runat="server" GroupName="ilu"/></asp:TableCell>
                                <asp:TableCell>Continuo</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb93" runat="server" GroupName="rui"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Nieblas</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb94" runat="server" GroupName="gas"/></asp:TableCell>
                                <asp:TableCell>Media</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb95" runat="server" GroupName="tem"/></asp:TableCell>
                                <asp:TableCell>Ambiente Medio</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb96" runat="server" GroupName="hum"/></asp:TableCell>
                                <asp:TableCell>Media</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb97" runat="server" GroupName="ven"/></asp:TableCell>
                                <asp:TableCell>Mediana</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb98" runat="server" GroupName="ilu"/></asp:TableCell>
                                <asp:TableCell>Variable</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb99" runat="server" GroupName="rui"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Polvo</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb100" runat="server" GroupName="gas"/></asp:TableCell>
                                <asp:TableCell>Elevada</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb101" runat="server" GroupName="tem"/></asp:TableCell>
                                <asp:TableCell>Ambiente Húmedo</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb102" runat="server" GroupName="hum"/></asp:TableCell>
                                <asp:TableCell>Escasa</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb103" runat="server" GroupName="ven"/></asp:TableCell>
                                <asp:TableCell>Escasa</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb104" runat="server" GroupName="ilu"/></asp:TableCell>
                                <asp:TableCell>Intermitente</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb105" runat="server" GroupName="rui"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Vapores</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb106" runat="server" GroupName="gas"/></asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>Contrastes</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb107" runat="server" GroupName="ilu"/></asp:TableCell>
                                <asp:TableCell>Impactos</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb108" runat="server" GroupName="rui"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Humos</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb109" runat="server" GroupName="gas"/></asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Vibraciones </asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Radiaciones </asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Condiciones Locativas</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="2" CssClass="bg-aqua color-palette text-center">Exposición Biológica</asp:TableHeaderCell>
                                <asp:TableHeaderCell ColumnSpan="4" CssClass="bg-aqua color-palette text-center">Sustancias Químicas </asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Mano-brazo</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb110" runat="server" GroupName="vib"/></asp:TableCell>
                                <asp:TableCell>Ionizantes</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb111" runat="server" GroupName="rad"/></asp:TableCell>
                                <asp:TableCell>Bajo techo</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb112" runat="server" GroupName="cl"/></asp:TableCell>
                                <asp:TableCell>Microorganismos</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb113" runat="server" GroupName="eb"/></asp:TableCell>
                                <asp:TableCell ColumnSpan="3">Exposición a solventes</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb114" runat="server" GroupName="sq"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Cuerpo entero</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb115" runat="server" GroupName="vib"/></asp:TableCell>
                                <asp:TableCell>No Ionizantes</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb116" runat="server" GroupName="rad"/></asp:TableCell>
                                <asp:TableCell>En alturas</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb117" runat="server" GroupName="cl"/></asp:TableCell>
                                <asp:TableCell>Virus</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb118" runat="server" GroupName="eb"/></asp:TableCell>
                                <asp:TableCell ColumnSpan="3">Contacto con productos cáusticos</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb119" runat="server" GroupName="sq"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>Áreas confinadas</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb120" runat="server" GroupName="cl"/></asp:TableCell>
                                <asp:TableCell>Bacterias</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb121" runat="server" GroupName="eb"/></asp:TableCell>
                                <asp:TableCell ColumnSpan="3">Contacto con productos corrosivos</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb122" runat="server" GroupName="sq"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>Expuesto al sol</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb123" runat="server" GroupName="cl"/></asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell>&nbsp;</asp:TableCell>
                                <asp:TableCell ColumnSpan="3">Exposición a solventes</asp:TableCell>
                                <asp:TableCell CssClass="text-center"><asp:RadioButton ID="rdb124" runat="server" GroupName="sq"/></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <!-- FIN-->
                        <div class="row">
                            <h3 class="bg-aqua color-palette">Observaciones Generales</h3>
                            <asp:TextBox TextMode="MultiLine" Rows="10" ID="txtObservaciones" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:ImageButton alt="-" ID="btnDocumento" runat="server" ImageUrl="~\ico\print.png"
                            OnClick="GenerarDocumento" />
                        <h4>Generar Documento</h4>
                    </div>
                </div>
            </asp:PlaceHolder>

</asp:Content>

