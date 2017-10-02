<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionPuestosAdmin.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionPuestosAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_Inspecciones.aspx">Inspecciones</a></li>
                <li><a href="#">Crear Inspección de Puesto de Trabajo Administrativo</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Inspección Puesto de Trabajo Administrativo</h1>
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
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Información General</a></h4>
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
                                                <asp:TableCell>¿Esta constituido el COPASST en la Empresa?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi1" GroupName="chk1"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo1" GroupName="chk1"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿El Copasst conoce las estadísticas de ausentismo, accidente de trabajo y enfermedades profesionales?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi2" GroupName="chk2"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo2" GroupName="chk2"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿El Copasst se reúne por lo menos una vez al mes?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi3" GroupName="chk3"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo3" GroupName="chk3"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿Realizan exámenes médicos pre empleo, periódicos y post empleo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi4" GroupName="chk4"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo4" GroupName="chk4"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿Se informa al trabajador de los resultados de los exámenes médicos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi5" GroupName="chk5"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo5" GroupName="chk5"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿Se realiza mantenimiento a los Equipos de Trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi6" GroupName="chk6"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo6" GroupName="chk6"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt6" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>7</asp:TableCell>
                                                <asp:TableCell>¿Se le realiza inducción al trabajador al ingresar a un puesto de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi7" GroupName="chk7"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo7" GroupName="chk7"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt7" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>8</asp:TableCell>
                                                <asp:TableCell>¿Se implementan pausas activas de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi8" GroupName="chk8"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo8" GroupName="chk8"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt8" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Segundo Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Superficie de Trabajo/ Espacio</a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿La disposición del puesto de trabajo permite al trabajador laborar sentado y alternar posturas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi9" GroupName="chk9"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo9" GroupName="chk9"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt9" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿La superficie de trabajo es estable?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi10" GroupName="chk10"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo10" GroupName="chk10"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt10" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿Es el ancho de la superficie de trabajo apropiada, de manera que los accesorios o herramientas puedan ser ubicados a un fácil alcance y visualización?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi11" GroupName="chk11"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo11" GroupName="chk11"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt11" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿La profundidad de la Superficie de Trabajo es la apropiada, de forma tal que el monitor y el teclado se ubican frente al usuario? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi12" GroupName="chk12"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo12" GroupName="chk12"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt12" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿La superficie de trabajo evita que existan posturas de los miembros superiores en contra de la gravedad?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi13" GroupName="chk13"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo13" GroupName="chk13"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt13" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿La superficie de trabajo es confortable con respecto a sus dimensiones? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi14" GroupName="chk14"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo14" GroupName="chk14"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt14" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>7</asp:TableCell>
                                                <asp:TableCell>¿Debajo del escritorio, el área es suficientemente amplia para acomodar las piernas del trabajador? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi15" GroupName="chk15"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo15" GroupName="chk15"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt15" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>8</asp:TableCell>
                                                <asp:TableCell>¿El puesto de trabajo cuenta con suficiente espacio para realizar movimientos libremente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi16" GroupName="chk16"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo16" GroupName="chk16"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt16" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>9</asp:TableCell>
                                                <asp:TableCell>¿La ubicación de los elementos de trabajo permite que no se originen movimientos forzados de espalda o hiperextensiones de los miembros superiores?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi17" GroupName="chk17"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo17" GroupName="chk17"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt17" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>10</asp:TableCell>
                                                <asp:TableCell>¿El área de trabajo no limita el libre movimiento?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi18" GroupName="chk18"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo18" GroupName="chk18"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt18" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>11</asp:TableCell>
                                                <asp:TableCell>¿Existen corredores libres entre los puestos de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi19" GroupName="chk19"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo19" GroupName="chk19"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt19" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>12</asp:TableCell>
                                                <asp:TableCell>¿los objetos, muebles, equipos están dispuestos de manera que no dificulten la utilización del espacio libre del puesto de  trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi20" GroupName="chk20"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo20" GroupName="chk20"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt20" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>13</asp:TableCell>
                                                <asp:TableCell>¿Las piezas, documentos, objetos, herramientas, equipos u otros están dispuestos en forma organizada que facilita su utilización?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi21" GroupName="chk21"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo21" GroupName="chk21"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt21" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>14</asp:TableCell>
                                                <asp:TableCell>¿La Superficie de Trabajo es de material mate, para prevenir reflejos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi22" GroupName="chk22"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo22" GroupName="chk22"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt22" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Tercer Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Superficie del Asiento </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ la altura del asiento es ajustable, de tal manera que permite graduar una altura confortable de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi23" GroupName="chk23"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo23" GroupName="chk23"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt23" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ la altura superficie del asiento es apropiada, de tal manera que el ancho y la profundidad  permiten alojarse confortablemente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi24" GroupName="chk24"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo24" GroupName="chk24"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt24" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ la inclinación del asiento es ajustable? ¿ permite inclinarse hacia adelante o hacia atrás según su conveniencia?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi25" GroupName="chk25"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo25" GroupName="chk25"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt25" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ El borde frontal del asiento es redondeado? De manera que evite la presión sobre la parte posterior de la rodilla?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi26" GroupName="chk26"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo26" GroupName="chk26"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt26" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿ Es el asiento es confortable en su totalidad?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi27" GroupName="chk27"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo27" GroupName="chk27"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt27" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Cuarto Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Silla </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Puede ajustar fácilmente el espaldar para obtener un apoyo lumbar apropiado?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi28" GroupName="chk28"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo28" GroupName="chk28"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt28" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ Puede ajustar la profundidad del asiento?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi29" GroupName="chk29"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo29" GroupName="chk29"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt29" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ Es el espaldar de la silla confortable en su totalidad?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi30" GroupName="chk30"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo30" GroupName="chk30"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt30" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ La silla empleada posee 5 patas y es móvil ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi31" GroupName="chk31"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo31" GroupName="chk31"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt31" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Quinto Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Condiciones ergonómicas para los Brazos </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Se puede trabajar con una postura adecuada de la cabeza, de tal manera que no produzca estrés en el cuello o en los hombros?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi32" GroupName="chk32"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo32" GroupName="chk32"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt32" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ Es posible trabajar con la cabeza orientada hacia el frente del plano del pecho, de tal manera que la rotación del cuello sea mínima? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi33" GroupName="chk33"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo33" GroupName="chk33"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt33" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ Se Puede trabajar con una posición confortable de los brazos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi34" GroupName="chk34"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo34" GroupName="chk34"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt34" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ Es posible trabajar con una posición cómoda de los codos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi35" GroupName="chk35"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo35" GroupName="chk35"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt35" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿ Se Puede trabajar con una postura neutral de los hombros?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi36" GroupName="chk36"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo36" GroupName="chk36"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt36" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿ Se Puede trabajar con una postura neutral de las muñecas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi37" GroupName="chk37"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo37" GroupName="chk37"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt37" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>7</asp:TableCell>
                                                <asp:TableCell>¿ Son mínimas las actividades que requieren extensión del tronco y brazos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi38" GroupName="chk38"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo38" GroupName="chk38"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt38" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Sexto Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Condiciones ergonómicas para  Piernas y pies </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Es posible apoyar los pies de manera confortable y totalmente sobre la superficie?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi39" GroupName="chk39"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo39" GroupName="chk39"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt39" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ El usuario está libre de obstrucciones o puntos de presión molestos en sus piernas? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi40" GroupName="chk40"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo40" GroupName="chk40"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt40" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿Existe un apoya pies disponible?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi41" GroupName="chk41"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo41" GroupName="chk41"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt41" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿Se ajusta fácilmente la altura del apoya pies? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi42" GroupName="chk42"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo42" GroupName="chk42"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt42" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿Se Puede ajustar la inclinación del apoya pies?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi43" GroupName="chk43"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo43" GroupName="chk43"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt43" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿ El ajuste de la altura de la silla permite que las rodillas del usuario no se encuentran por encima o debajo del nivel de la cadera?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi44" GroupName="chk44"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo44" GroupName="chk44"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt44" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Septimo Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse7">Soporte para los Brazos y Manos </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Se dispone de algún tipo de apoyabrazos en la silla ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi45" GroupName="chk45"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo45" GroupName="chk45"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt45" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ La persona tiene disponible algún tipo de soporte para sus manos al momento de hacer uso del teclado? ( apoya muñecas) </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi46" GroupName="chk46"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo46" GroupName="chk46"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt46" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ Los soportes empleados como apoyo evitan desviaciones en las manos con relación al eje neutro de la muñeca en procesos de utilización de mouse y digitación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi47" GroupName="chk47"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo47" GroupName="chk47"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt47" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ Se dispone de un mouse pad o almohadilla para el mouse, para evitar presión en la base de la muñeca por contacto con la  superficie de trabajo ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi48" GroupName="chk48"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo48" GroupName="chk48"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt48" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Octavo Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse8">Monitor </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Se Puede ajustar fácilmente la altura del monitor? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi49" GroupName="chk49"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo49" GroupName="chk49"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt49" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ Es posible ajustar fácilmente la distancia horizontal de ubicación del monitor? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi50" GroupName="chk50"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo50" GroupName="chk50"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿Se Puede ajustar fácilmente la inclinación de la pantalla del Monitor?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi51" GroupName="chk51"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo51" GroupName="chk51"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt51" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ Se ajustar con  facilidad la rotación a izquierda o derecha del monitor?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi52" GroupName="chk52"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo52" GroupName="chk52"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt52" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Noveno Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse9">Teclado </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Es posible ajustar el ángulo de inclinación? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi53" GroupName="chk53"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo53" GroupName="chk53"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt53" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ Es posible ajustar la altura del teclado? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi54" GroupName="chk54"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo54" GroupName="chk54"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt54" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ Es confortable la presión del teclado?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi55" GroupName="chk55"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo55" GroupName="chk55"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt55" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!-- Decimo Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse10">Mouse </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Es confortable la Forma y la activación de los botones del mouse? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi56" GroupName="chk56"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo56" GroupName="chk56"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt56" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ El Mouse es operativo sin necesidad de extender el brazo hacia adelante o hacia el costado del cuerpo de la persona? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi57" GroupName="chk57"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo57" GroupName="chk57"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt57" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿La ubicación y manipulación del mouse no requieren de movimientos forzados para la muñeca?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi58" GroupName="chk58"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo58" GroupName="chk58"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt58" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ Al emplear  el mouse, el antebrazo queda soportado por la superficie de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi59" GroupName="chk59"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo59" GroupName="chk59"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt59" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Once -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse11">Iluminación </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿La  iluminación en el área del monitor es suficiente? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi60" GroupName="chk60"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo60" GroupName="chk60"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt60" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿Está el monitor ubicado de tal manera que la iluminación de ventanas o lámparas no crean reflejos en la pantalla? </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi61" GroupName="chk61"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo61" GroupName="chk61"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt61" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ Se emplea algún método para impedir la luz directa de las ventanas y así evitar el deslumbramiento por visión directa a la fuente de luz?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi62" GroupName="chk62"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo62" GroupName="chk62"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt62" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿Las lámparas fundidas son sustituidas rápidamente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi63" GroupName="chk63"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo63" GroupName="chk63"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt63" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Doce -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse12">Temperatura </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Es confortable la temperatura del ambiente de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi64" GroupName="chk64"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo64" GroupName="chk64"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt64" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ El trabajador (a) Se siente en confort con el frío que genera el aire acondicionado?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi65" GroupName="chk65"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo65" GroupName="chk65"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt65" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ El trabajador (a) Se siente cómodo con la temperatura cuando el aire no está operativo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi66" GroupName="chk66"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo66" GroupName="chk66"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt66" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ El trabajador (a) Se siente bien con la temperatura de la superficie de objetos con los que debe tener contacto durante la jornada?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi67" GroupName="chk67"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo67" GroupName="chk67"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt67" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿ Existen altos niveles de humedad?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi68" GroupName="chk68"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo68" GroupName="chk68"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt68" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Trece -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse13">Vibración </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ El equipo de trabajo está libre de vibraciones generadas por el uso del mismo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi69" GroupName="chk69"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo69" GroupName="chk69"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt69" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ ha sido eliminada cualquier fuente de vibración en el área de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi70" GroupName="chk70"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo70" GroupName="chk70"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt70" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Catorce -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse14">Ruido ( En caso de que no exista ruido significativo abstenerse de responder) </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿El nivel de sonido que se genera habitualmente, permite la conversación entre los compañeros de trabajo sin un esfuerzo significativo o molestia?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi71" GroupName="chk71"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo71" GroupName="chk71"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt71" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿Existe un ruido constante procedente del exterior, y sin embargo esto permite al trabajador (a) concentrarse?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi72" GroupName="chk72"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo72" GroupName="chk72"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt72" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿Existe un ruido molesto y constante generado por los compañeros de trabajo,  y sin embargo esto le permite concentrarse al trabajador(a)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi73" GroupName="chk73"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo73" GroupName="chk73"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt73" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Quince -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse15">Fatiga Física </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ Se le permite a los trabajadores  tomar descansos frecuentes?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi74" GroupName="chk74"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo74" GroupName="chk74"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt74" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ Se realizan pausas activas durante la jornada laboral?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi75" GroupName="chk75"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo75" GroupName="chk75"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt75" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ los esfuerzos realizados están de acuerdo al entrenamiento del trabajador?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi76" GroupName="chk76"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo76" GroupName="chk76"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt76" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿La tarea permite no involucrar movimientos rápidos, fuertes o repentinos de los miembros superiores en posiciones forzadas, especialmente a nivel de manos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi77" GroupName="chk77"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo77" GroupName="chk77"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt77" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿Es posible manipular aquellos objetos que requieran ser levantados cerca del cuerpo, de manera que evite la extensión de los brazos, doblarse o girar el torso para su manipulación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi78" GroupName="chk78"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo78" GroupName="chk78"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt78" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Dieciseis -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse16">Visión </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿ El usuario del computador puede  ver el texto en el monitor sin necesidad de inclinar la cabeza hacia atrás?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi79" GroupName="chk79"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo79" GroupName="chk79"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt79" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ Los colores y el tamaño de las letras e imágenes del monitor, son fáciles de ver o leer?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi80" GroupName="chk80"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo80" GroupName="chk80"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt80" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Diesisiete -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse17">Capacitación e información </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿Se realizan capacitaciones respecto a temas de Seguridad y Salud en el Trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi81" GroupName="chk81"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo81" GroupName="chk81"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt81" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿Se realizan simulacros de evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi82" GroupName="chk82"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo82" GroupName="chk82"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt82" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿La empresa cumple con las señalizaciones de rutas de evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi83" GroupName="chk83"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo83" GroupName="chk83"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt83" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿Existe definido un plan de evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi84" GroupName="chk84"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo84" GroupName="chk84"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt84" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿Están definidos cuales son los puntos de reunión después de una evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi85" GroupName="chk85"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo85" GroupName="chk85"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt85" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿Se capacita al personal sobre el uso correcto de los equipos de extinción?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi86" GroupName="chk86"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo86" GroupName="chk86"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt86" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>7</asp:TableCell>
                                                <asp:TableCell>¿El personal conoce donde están ubicados los extintores?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi87" GroupName="chk87"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo87" GroupName="chk87"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt87" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>8</asp:TableCell>
                                                <asp:TableCell>¿Es de conocimiento del personal donde están ubicadas las tomas de manguera para incendio?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi88" GroupName="chk88"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo88" GroupName="chk88"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt88" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>9</asp:TableCell>
                                                <asp:TableCell>¿Se ha conformado la brigada de emergencia?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi89" GroupName="chk89"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo89" GroupName="chk89"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt89" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Diesiocho -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse18">Daños a la salud </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿Se le informa al personal sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi90" GroupName="chk90"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo90" GroupName="chk90"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt90" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿Se informa de los accidentes de trabajo ocurridos en el último año?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi91" GroupName="chk91"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo91" GroupName="chk91"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt91" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi92" GroupName="chk92"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo92" GroupName="chk92"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt92" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi93" GroupName="chk93"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo93" GroupName="chk93"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt93" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi94" GroupName="chk94"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo94" GroupName="chk94"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt94" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>Ante los Accidentes Laborales ¿Se realiza la investigación del evento?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi95" GroupName="chk95"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo95" GroupName="chk95"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt95" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>

                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Diesinueve -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse19">Aspectos Psicosociales </a></h4>
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
                                                <asp:TableCell>1</asp:TableCell>
                                                <asp:TableCell>¿El trabajador tiene algún tipo de control sobre el proceso de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi96" GroupName="chk96"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo96" GroupName="chk96"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt96" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿Los Programas a utilizar en sus tareas diarias son fáciles de utilizar?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi97" GroupName="chk97"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo97" GroupName="chk97"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt97" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿Se entrena al trabajador (a) para utilizar un nuevo software?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi98" GroupName="chk98"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo98" GroupName="chk98"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt98" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿Existe comunicación asertiva entre los trabajadores y el supervisor?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi99" GroupName="chk99"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo99" GroupName="chk99"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt99" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿El trabajo está organizado de manera que no se exija simultáneamente varias tareas ?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi100" GroupName="chk100"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo100" GroupName="chk100"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt100" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿ Si la tarea requiere de una elevada concentración, se evitan los agentes distractores en el lugar de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi101" GroupName="chk101"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo101" GroupName="chk101"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt101" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>7</asp:TableCell>
                                                <asp:TableCell>¿ En la organización se evita laborar horas extras luego de la jornada de trabajo?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi102" GroupName="chk102"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo102" GroupName="chk102"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt102" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Veinte -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse20">Equipos de Emergencia </a></h4>
                                </div>
                                <div id="collapse20" class="panel-collapse collapse">
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
                                                <asp:TableCell>¿Existen equipos Extintores?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi103" GroupName="chk103"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo103" GroupName="chk103"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt103" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿Existe botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi104" GroupName="chk104"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo104" GroupName="chk104"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt104" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ Está señalizada la vía de Evacuación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi105" GroupName="chk105"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo105" GroupName="chk105"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt105" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ Existe alumbrado de Emergencia?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi106" GroupName="chk106"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo106" GroupName="chk106"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt106" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Veintiuno -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse21">Aspectos Locativos </a></h4>
                                </div>
                                <div id="collapse21" class="panel-collapse collapse">
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
                                                <asp:TableCell>¿Son óptimas las condiciones del Techo de la oficina?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi107" GroupName="chk107"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo107" GroupName="chk107"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt107" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ El piso de la instalación se en encuentra en buenas condiciones?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi108" GroupName="chk108"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo108" GroupName="chk108"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt108" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ Las paredes del local  son óptimas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi109" GroupName="chk109"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo109" GroupName="chk109"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt109" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ Las puertas se encuentran en buen estado?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi110" GroupName="chk110"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo110" GroupName="chk110"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt110" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿ Las escaleras tienen pasa manos?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi111" GroupName="chk111"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo111" GroupName="chk111"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt111" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿ las áreas están señalizadas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi112" GroupName="chk112"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo112" GroupName="chk112"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt112" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>7</asp:TableCell>
                                                <asp:TableCell>¿ El sitio de trabajo tiene la ventilación adecuada?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi113" GroupName="chk113"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo113" GroupName="chk113"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt113" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <!--  Panel Veintidos -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse22">Instalaciones eléctricas </a></h4>
                                </div>
                                <div id="collapse22" class="panel-collapse collapse">
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
                                                <asp:TableCell>¿ Es óptimo el Estado de los Cables (Entubado)?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi114" GroupName="chk114"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo114" GroupName="chk114"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt114" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿ Es óptimo el Estado del toma corriente?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi115" GroupName="chk115"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo115" GroupName="chk115"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt115" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿ Es óptimo el Estado del Tablero eléctrico?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi116" GroupName="chk116"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo116" GroupName="chk116"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt116" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿ Es óptimo el estado de los Bombillos/Tubos Fluorescentes?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi117" GroupName="chk117"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo117" GroupName="chk117"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt117" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>
                            <!--  Panel Veintidos -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse23">Otras Condiciones </a></h4>
                                </div>
                                <div id="collapse23" class="panel-collapse collapse">
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
                                                <asp:TableCell>¿Las instalaciones usadas para la alimentación son apropiadas?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi118" GroupName="chk118"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo118" GroupName="chk118"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt118" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>2</asp:TableCell>
                                                <asp:TableCell>¿Se encuentran en estado óptimo de limpieza?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi119" GroupName="chk119"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo119" GroupName="chk119"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt119" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>3</asp:TableCell>
                                                <asp:TableCell>¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi120" GroupName="chk120"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo120" GroupName="chk120"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt120" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>4</asp:TableCell>
                                                <asp:TableCell>¿Los espacios sanitarios son adecuados?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi121" GroupName="chk121"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo121" GroupName="chk121"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt121" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>5</asp:TableCell>
                                                <asp:TableCell>¿Existe disponibilidad de Jabón en los espacios sanitarios?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi122" GroupName="chk122"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo122" GroupName="chk122"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt122" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>6</asp:TableCell>
                                                <asp:TableCell>¿Existe disponibilidad de papel  higiénico en los espacios sanitarios?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi123" GroupName="chk123"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo123" GroupName="chk123"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt123" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>7</asp:TableCell>
                                                <asp:TableCell>¿Existen filtros de agua potable en la empresa?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi124" GroupName="chk124"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo124" GroupName="chk124"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt124" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>8</asp:TableCell>
                                                <asp:TableCell>¿Posee la empresa áreas para el descanso y la recreación?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi125" GroupName="chk125"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo125" GroupName="chk125"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt125" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>9</asp:TableCell>
                                                <asp:TableCell>¿En las instalaciones sanitarias se mantiene el orden y limpieza?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkSi126" GroupName="chk126"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:RadioButton runat="server" ID="chkNo126" GroupName="chk126"></asp:RadioButton></asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox runat="server" ID="txt126" CssClass="form-control"></asp:TextBox></asp:TableCell>
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
                                    <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>Sumatoria del total de respuestas</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblSumaSi"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblSumaNo"></asp:Label></asp:TableCell>
                                    <asp:TableCell>Las respuestas Positivas (SI), indican condiciones de trabajo positivas para el trabajador  y las respuestas NO  indican que puede estar asociadas a alto riesgo de lesión o enfermedad.</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                    <!-- Grafica -->
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
                        <asp:Label ID="lbl1" runat="server" Text="IMAGEN: "></asp:Label>
                    </div>
                    <!-- Fin de Grafica -->
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

</asp:Content>
