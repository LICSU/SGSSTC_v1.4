<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_DescripcionSocioDemografica.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_DescripcionSocioDemografica" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_DescripcionSocioDemografica.aspx">Descripción SocioDemografica</a></li>
                <li><a href="#">Actualizar Descripción SocioDemografica</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Actualizar Descripción SocioDemografica</h1>
            </div>

            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>0) Seleccione el Trabajador</h5>
                    <asp:Label runat="server" ID="ddlTrabajador" CssClass="control-label" Font-Bold="True"></asp:Label>
                </div>

                <div class="col-md-4">
                    <h5>Lugar de Nacimiento</h5>
                    <asp:TextBox runat="server" MaxLength="1000" ID="txtLugar" CssClass="form-control" placeholder="Lugar de Nacimiento"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="txtLugar" runat="server" ValidationGroup="ValidationEdit" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>1) Seleccione el Nivel de escolaridad</h5>
                    <asp:DropDownList runat="server" ID="rblNivel" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="rblNivel_SelectedIndexChanged">
                        <asp:ListItem Text="Ninguno" Value="Ninguno"></asp:ListItem>
                        <asp:ListItem Text="Primaria Incompleta" Value="Primaria Incompleta"></asp:ListItem>
                        <asp:ListItem Text="Primaria Completa" Value="Primaria Completa"></asp:ListItem>
                        <asp:ListItem Text="Secundaria Incompleta" Value="Secundaria Incompleta"></asp:ListItem>
                        <asp:ListItem Text="Secundaria Completa" Value="Secundaria Completa"></asp:ListItem>
                        <asp:ListItem Text="Tecnica" Value="Texnica"></asp:ListItem>
                        <asp:ListItem Text="Universitario" Value="Universitario"></asp:ListItem>
                        <asp:ListItem Text="Diplomado" Value="Diplomado"></asp:ListItem>
                        <asp:ListItem Text="Especializacion" Value="Especializacion"></asp:ListItem>
                        <asp:ListItem Text="Maestria" Value="Maestria"></asp:ListItem>
                        <asp:ListItem Text="Doctorado" Value="Doctorado"></asp:ListItem>
                        <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblNivel" runat="server"
                        ValidationGroup="ValidationEdit" />

                    <br />
                    <asp:TextBox Visible="false" runat="server" MaxLength="450" placeholder="Nivel Escolar" ID="txtNivel" CssClass="form-control"></asp:TextBox>

                </div>

                <div class="col-md-4">
                    <h5>2) Años aprobados en ese último nivel</h5>
                    <asp:TextBox runat="server" ID="txtAnhosApro" CssClass="form-control" placeholder="Años Aprobados"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtAnhosApro" runat="server"
                        ValidationGroup="ValidationEdit" />

                </div>
            </div>

            <br />
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    3) ¿Es usted cabeza de familia?<br />
                    <asp:RadioButtonList runat="server" ID="rdlCabeza" CssClass="radio-inline">
                        <asp:ListItem Text="Si" Value="SI"></asp:ListItem>
                        <asp:ListItem Text="No" Value="NO"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="rdlCabeza" runat="server"
                        ValidationGroup="ValidationEdit" />
                </div>

                <div class="col-md-4">
                    <h5>4) ¿Cuantos hijos tiene?</h4>
                    <asp:DropDownList runat="server" ID="ddlHijos" CssClass="form-control">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    </asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                            ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlHijos" runat="server"
                            ValidationGroup="ValidationEdit" />
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>5) ¿Con quién comparte la responsabilidad económica de su familia?</h5>

                    <asp:DropDownList runat="server" ID="rblResponsabilidad" CssClass="form-control">
                        <asp:ListItem Text="Con Nadie" Value="Con Nadie"></asp:ListItem>
                        <asp:ListItem Text="Con el Conyugue" Value="Con el Conyugue"></asp:ListItem>
                        <asp:ListItem Text="Con Otros" Value="Con Otros"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblResponsabilidad" runat="server" ValidationGroup="ValidationEdit" />
                </div>

                <div class="col-md-4">
                    <h5>6) ¿Cuantos menores dependen económicamente de ud?</h5>
                    <asp:DropDownList runat="server" ID="ddlMenores" CssClass="form-control">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlMenores" runat="server" ValidationGroup="ValidationEdit" />
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>7) ¿Socialmente en que condición se encuentra usted?</h5>
                    <asp:RadioButtonList runat="server" ID="rblCondicion" CssClass="radio-inline" AutoPostBack="true"
                        OnSelectedIndexChanged="rblCondicion_SelectedIndexChanged">
                        <asp:ListItem Text="Desplazado" Value="Desplazado"></asp:ListItem>
                        <asp:ListItem Text="Desmovilizado" Value="Desmovilizado"></asp:ListItem>
                        <asp:ListItem Text="Ninguna" Value="Ninguna"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="rblCondicion" runat="server"
                        ValidationGroup="ValidationEdit" />
                </div>

                <asp:PlaceHolder ID="phDesplazado" runat="server" Visible="false">
                    <div class="col-md-4">
                        <h5>7.1) ¿Cual fue el motivo del desplazamiento?</h5>
                        <br />
                        <asp:DropDownList runat="server" ID="rblMotivo" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="rblMotivo_SelectedIndexChanged">
                            <asp:ListItem Text="Violencia sociopolítica" Value="Violencia sociopolítica"></asp:ListItem>
                            <asp:ListItem Text="Desastre natural" Value="Desastre natural"></asp:ListItem>
                            <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="rblMotivo" runat="server" ValidationGroup="ValidationEdit" />

                        <asp:TextBox ID="txtOtroMotivo" runat="server" MaxLength="450" CssClass="form-control" Visible="false" placeholder="Otro Motivo"></asp:TextBox><hr />

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="txtOtroMotivo" runat="server" ValidationGroup="ValidationEdit" />
                    </div>
                </asp:PlaceHolder>
            </div>

            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>8) La vivienda donde habita es:</h4>
                    
                    <asp:DropDownList runat="server" ID="dblVivienda" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="dblVivienda_SelectedIndexChanged">
                        <asp:ListItem Text="Propia" Value="Propia"></asp:ListItem>
                        <asp:ListItem Text="Alquilada" Value="Alquilada"></asp:ListItem>
                        <asp:ListItem Text="De un Familiar" Value="De un Familiar"></asp:ListItem>
                        <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                    </asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="dblVivienda" runat="server" ValidationGroup="ValidationEdit" />

                        <asp:TextBox runat="server" ID="txtOtroVivienda" MaxLength="450" CssClass="form-control" Visible="false"
                            placeholder="Otra Vivienda"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <h5>9) Seleccione con cuales servicios públicos cuenta su vivienda</h4><br />
                        <asp:CheckBoxList runat="server" ID="cblServicios" CssClass="checkbox-inline" RepeatColumns="1">
                            <asp:ListItem Text="Energia Electrica" Value="Energia Electrica"></asp:ListItem>
                            <asp:ListItem Text="Agua" Value="Agua"></asp:ListItem>
                            <asp:ListItem Text="Alcantarillado" Value="Alcantarillado"></asp:ListItem>
                            <asp:ListItem Text="Teléfono Fijo" Value="Telefono Fijo"></asp:ListItem>
                            <asp:ListItem Text="Teléfono Móvil" Value="Teléfono Móvil"></asp:ListItem>
                            <asp:ListItem Text="Gas" Value="Gas"></asp:ListItem>
                            <asp:ListItem Text="Internet" Value="Internet"></asp:ListItem>
                            <asp:ListItem Text="Ninguno" Value="Ninguno"></asp:ListItem>
                        </asp:CheckBoxList>
                </div>

            </div>

            <br />

            <!-- Su vivienda es:Esta Cerca de IndustriasHay mucho ruido:-->
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>10) Su vivienda es:</h4><br />
                        <asp:RadioButtonList runat="server" ID="dblTipoVivienda" CssClass="radio-inline" AutoPostBack="true" OnSelectedIndexChanged="dblTipoVivienda_SelectedIndexChanged">
                            <asp:ListItem Text="Apartamento" Value="Apartamento"></asp:ListItem>
                            <asp:ListItem Text="Casa" Value="Casa"></asp:ListItem>
                            <asp:ListItem Text="Habitación" Value="Habitacion"></asp:ListItem>
                            <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="dblTipoVivienda" runat="server"
                            ValidationGroup="ValidationEdit" />

                        <asp:TextBox runat="server" ID="txtTipoVivienda" MaxLength="450" CssClass="form-control" Visible="false" placeholder="Otra Vivienda"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <h5>11) Esta Cerca de Industrias</h5>
                    <br />
                    <asp:RadioButtonList runat="server" ID="rblIndustria" CssClass="radio-inline">
                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblIndustria" runat="server"
                        ValidationGroup="ValidationEdit" />
                </div>
            </div>

            <br />

            <!-- Hay Mucha Contaminación Describa el techo, paredes y piso -->
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>12) Hay mucho ruido:</h4><br />
                        <asp:RadioButtonList runat="server" ID="rblRuido" CssClass="radio-inline">
                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="rblRuido" runat="server"
                            ValidationGroup="ValidationEdit" />
                </div>

                <div class="col-md-4">
                    <h5>13) Hay Mucha Contaminación</h4><br />
                        <asp:RadioButtonList runat="server" ID="rblContaminacion" CssClass="radio-inline">
                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="rblContaminacion" runat="server"
                            ValidationGroup="ValidationEdit" />
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    13) Describa el techo, paredes y piso:<br />
                    <asp:TextBox runat="server" ID="txtDescripcion" MaxLength="1000" TextMode="MultiLine" Rows="3"
                        CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtDescripcion" runat="server"
                        ValidationGroup="ValidationEdit" />
                </div>
            </div>

            <br />

            <!-- 14) Se encuentra afiliado al sistema de seguridad social en salud
                 14.1) Régimen de Afiliación
                 14.1.1) Nivel de SISBEN -->
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>14) Se encuentra afiliado al sistema de seguridad social en salud</h4><br />
                        <asp:RadioButtonList runat="server" ID="dblSeguridad" CssClass="radio-inline" AutoPostBack="true"
                            OnSelectedIndexChanged="dblSeguridad_SelectedIndexChanged">
                            <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            <asp:ListItem Text="No sabe" Value="No sabe"></asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" runat="server"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="dblSeguridad" ValidationGroup="ValidationEdit" />
                </div>
            </div>

            <div class="row">
                <asp:PlaceHolder ID="phRegimen" runat="server" Visible="false">
                    <div class="col-md-4 col-md-offset-2">
                        <h5>14.1) Régimen de Afiliación</h4><br />
                            <asp:RadioButtonList runat="server" ID="rblRegimen" CssClass="checkbox-inline"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="rblRegimen_SelectedIndexChanged">
                                <asp:ListItem Text="Contributivo" Value="Contributivo"></asp:ListItem>
                                <asp:ListItem Text="Subsidiado" Value="Subsidiado"></asp:ListItem>
                            </asp:RadioButtonList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" runat="server"
                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                Font-Bold="true" ControlToValidate="rblRegimen" ValidationGroup="ValidationEdit" />
                    </div>
                </asp:PlaceHolder>


                <asp:PlaceHolder ID="phRegimen3" runat="server" Visible="false">
                    <div class="col-md-4">
                        <h5>14.2) ¿A qué EPS pertenece?</h5>
                        <br />
                        <asp:DropDownList runat="server" ID="ddlEps" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="ddlEps" runat="server" ValidationGroup="ValidationEdit" />
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="phRegimen2" runat="server" Visible="false">
                    <div class="col-md-4">
                        <h5>14.3) Nivel de SISBEN</h4><br />
                            <asp:RadioButtonList runat="server" ID="rblNivelSisben" TextAlign="Right" RepeatDirection="Vertical" RepeatLayout="Table" CssClass="radio-inline">
                                <asp:ListItem Text="Nivel 0" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Nivel 1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Nivel 2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Nivel 3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Nivel 4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Nivel 5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="Nivel 6" Value="6"></asp:ListItem>
                                <asp:ListItem Text="No sabe" Value="No sabe"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                Font-Bold="true" ControlToValidate="rblNivelSisben" runat="server" ValidationGroup="ValidationEdit" />
                    </div>
                </asp:PlaceHolder>


            </div>

            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>15) Se encuentra afiliado al sistema de seguridad social en pensiones</h5>
                    <br />
                    <asp:RadioButtonList runat="server" ID="rblPensiones" CssClass="radio-inline" AutoPostBack="true"
                        OnSelectedIndexChanged="rblPensiones_SelectedIndexChanged">
                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblPensiones" runat="server" ValidationGroup="ValidationEdit" />

                </div>

                <asp:PlaceHolder ID="phPensiones1" runat="server" Visible="false">
                    <div class="col-md-4">
                        <h5>15.1) ¿A qué fondo pertenece?</h5>
                        <br />
                        <asp:DropDownList runat="server" ID="ddlFondo" CssClass="form-control"></asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="ddlFondo" runat="server" ValidationGroup="ValidationEdit" />
                    </div>

                </asp:PlaceHolder>
            </div>

            <br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>16) ¿Cual es el estrato que registran sus facturas de los servicios públicos de la vivienda donde reside?</h5>
                    <br />
                    <asp:RadioButtonList runat="server" ID="rblEstrato" CssClass="radio-inline" RepeatColumns="1">
                        <asp:ListItem Text="Estrato 1" Value="Estrato 1"></asp:ListItem>
                        <asp:ListItem Text="Estrato 2" Value="Estrato 2"></asp:ListItem>
                        <asp:ListItem Text="Estrato 3" Value="Estrato 3"></asp:ListItem>
                        <asp:ListItem Text="Estrato 4" Value="Estrato 4"></asp:ListItem>
                        <asp:ListItem Text="Estrato 5" Value="Estrato 5"></asp:ListItem>
                        <asp:ListItem Text="Estrato 6" Value="Estrato 6"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblEstrato" runat="server"
                        ValidationGroup="ValidationEdit" />
                </div>
            </div>

            <br />

            <div class="row">
                <h5>17) Empleos Anteriores</h5>

                <asp:Table runat="server" ID="tblEmpleos" CssClass="table">
                    <asp:TableRow runat="server" ID="row1">
                        <asp:TableCell Text="Empresa"></asp:TableCell>
                        <asp:TableCell Text="Área"></asp:TableCell>
                        <asp:TableCell Text="Cargo u Oficio"></asp:TableCell>
                        <asp:TableCell Text="Años"></asp:TableCell>
                        <asp:TableCell Text="Meses"></asp:TableCell>
                        <asp:TableCell Text="Enfermedades adquiridas en el cargo Ninguna/Nombre Enfermedad"></asp:TableCell>

                    </asp:TableRow>
                    <asp:TableRow runat="server" ID="TableRow1">
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtEmpresa1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtArea1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtCargo1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtAños1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtMeses1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtEnfermadades1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>

                    </asp:TableRow>
                    <asp:TableRow runat="server" ID="TableRow2">
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtEmpresa2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtArea2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtCargo2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtAños2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtMeses2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtEnfermadades2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>

                    </asp:TableRow>
                    <asp:TableRow runat="server" ID="TableRow3">
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtEmpresa3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtArea3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtCargo3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtAños3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtMeses3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtEnfermadades3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>

                    </asp:TableRow>
                </asp:Table>
            </div>

            <br />

            <div class="col-md-12 text-center">
                <div class="col-md-4 col-md-offset-4">
                    <asp:ImageButton alt="-" ID="btnActualizar" runat="server" ImageUrl="~\ico\save.png" OnClick="EditarRegistro" ValidationGroup="ValidationEdit" />
                    <h4>
                    Actualizar</h5>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>