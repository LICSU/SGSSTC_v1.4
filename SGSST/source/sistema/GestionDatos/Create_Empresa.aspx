<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_Empresa.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Create_Empresa" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="../GestionDatos/index_Empresa.aspx">Empresas</a></li>
                <li><a href=".#">Crear Empresa</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Registrar Nueva Empresa</h1>
            </div>

            <div class="row text-left">
                <div class="col-md-6">
                    <h4>Nombre de la Empresa</h4>

                    <asp:TextBox runat="server" ID="txtNomEmpresa" CssClass="form-control" PlaceHolder="Nombre"
                        MaxLength="50"></asp:TextBox>

                    <asp:RequiredFieldValidator SetFocusOnError="true" runat="server" Font-Size="10" Font-Bold="true"
                        Display="Dynamic" ForeColor="#B50128" ControlToValidate="txtNomEmpresa"
                        ValidationGroup="ValidationAdd" ErrorMessage="<p>Campo Obligatorio!</p>" />
                </div>
            </div>

            <br />

            <div class="row text-left">
                <h4>Actividad Principal</h4>

                <div class="col-md-6">
                    <h5 class="text-info text-left">Sección</h5>

                    <asp:DropDownList runat="server" ID="ddlSeccion1" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="col-md-6">
                    <h5 class="text-info text-left">División</h5>
                    <asp:DropDownList runat="server" ID="ddlDivision1" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="col-md-6">
                    <h5 class="text-info text-left">Grupo</h5>
                    <asp:DropDownList runat="server" ID="ddlGrupo1" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="col-md-6">
                    <h5 class="text-info text-left">Clase</h5>
                    <asp:DropDownList runat="server" ID="ddlClase1" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" runat="server"
                        ControlToValidate="ddlClase1" ValidationGroup="ValidationAdd" />
                </div>
            </div>
            <br />

            <asp:PlaceHolder runat="server" ID="phActividad2" Visible="false">
                <div class="row text-left">
                    <h4>Actividad Secundaria</h4>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">Sección</h5>

                        <asp:DropDownList runat="server" ID="ddlSeccion2" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">División</h5>
                        <asp:DropDownList runat="server" ID="ddlDivision2" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">Grupo</h5>
                        <asp:DropDownList runat="server" ID="ddlGrupo2" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">Clase</h5>
                        <asp:DropDownList runat="server" ID="ddlClase2" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" runat="server"
                            ControlToValidate="ddlClase2" ValidationGroup="ValidationAdd" />
                    </div>

                </div>
                <br />
            </asp:PlaceHolder>

            <asp:PlaceHolder runat="server" ID="phActividad3" Visible="false">
                <div class="row text-left">
                    <h4>Otras Actividades</h4>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">Sección</h5>

                        <asp:DropDownList runat="server" ID="ddlSeccion3" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">División</h5>
                        <asp:DropDownList runat="server" ID="ddlDivision3" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">Grupo</h5>
                        <asp:DropDownList runat="server" ID="ddlGrupo3" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">Clase</h5>
                        <asp:DropDownList runat="server" ID="ddlClase3" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <br />
            </asp:PlaceHolder>

            <div class="row text-left">
                <div class="col-md-4">
                    <h4>Código de la Empresa</h4>

                    <asp:TextBox runat="server" ID="txtCodigoEmpresa" CssClass="form-control" PlaceHolder="Código"
                        MaxLength="50"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="txtCodigoEmpresa" runat="server" ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>NIT</h4>

                    <asp:TextBox runat="server" ID="txtNit" CssClass="form-control" PlaceHolder="NIT" MaxLength="50"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNit"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <style>
                        span.valerror[style*="inline"] {
                            display: block !Important;
                            background-color: #f56954;
                            border: 1px solid #f56954;
                            font-size: 1em;
                        }
                    </style>

                    <h4>Email</h4>

                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" MaxLength="100"
                        PlaceHolder="mi_correo@grupoli.com"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtEmail"
                        ValidationGroup="ValidationAdd" />

                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" SetFocusOnError="True" Display="Dynamic"
                        CssClass="valerror" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtEmail" ErrorMessage="Email inválido"></asp:RegularExpressionValidator>
                </div>
            </div>

            <br />

            <div class="row text-left">
                <div class="col-md-12">
                    <h4>Dirección</h4>

                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" PlaceHolder="Dirección"
                        MaxLength="100"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="txtDireccion" ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <br />

            <div class="row text-left">
                <div class="col-md-4">
                    <h4>Región</h4>

                    <asp:DropDownList runat="server" ID="ddlRegion" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlRegion" ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Departamento</h4>

                    <asp:DropDownList runat="server" ID="ddlDepartamento" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlDepartamento" ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Municipio</h4>

                    <asp:DropDownList runat="server" ID="ddlMunicipio" CssClass="form-control"></asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlMunicipio"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <br />

            <div class="row text-left">
                <div class="col-md-4">
                    <h4>Representante</h4>

                    <asp:TextBox runat="server" ID="txtRepresentante" CssClass="form-control" PlaceHolder="Representante"
                        MaxLength="100"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="txtRepresentante" ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Teléfono Fijo</h4>

                    <asp:TextBox runat="server" ID="txtTelFijo" CssClass="form-control" PlaceHolder="Numero Fijo"
                        TextMode="Number" MaxLength="50"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtTelFijo"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Teléfono Movil</h4>

                    <asp:TextBox runat="server" ID="txtTelMovil" CssClass="form-control" PlaceHolder="Movil" TextMode="Number"
                        MaxLength="50"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtTelMovil"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <br />

            <div class="row text-left">
                <div class="col-md-4">
                    <h4>ARL</h4>
                    <asp:DropDownList runat="server" ID="ddlArp" CssClass="form-control"></asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlArp"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Jornada Laboral</h4>

                    <asp:DropDownList runat="server" ID="ddlJornada" CssClass="form-control">
                        <asp:ListItem Text="Lunes a Viernes" Value="1" />
                        <asp:ListItem Text="Lunes a Sabado" Value="2" />
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlJornada"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Logo</h4>

                    <asp:FileUpload runat="server" ID="fuLogoEmpresa" />

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" runat="server"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="fuLogoEmpresa"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <br />

            <div class="row text-center">
                <div class="col-md-4 col-md-offset-4">
                    <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\save.png" OnClick="GuardarRegistro"
                        ValidationGroup="ValidationAdd" />
                    <h4>Registrar</h4>
                </div>
            </div>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGuardar" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
