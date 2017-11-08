<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_InscripcionCandidatos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_InscripcionCandidatos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="../Planear/index_ActaCopasst.aspx">Actas Copasst</a></li>
        <li><a href="#">Crear Inscripción de Candidato</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Hoja de inscripción de los candidatos al comité paritario de seguridad y salud en el trabajo</h1>
    </div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <div class="row">
        <asp:PlaceHolder runat="server" ID="phEmpresa">
            <div class="col-md-4">
                <h4 class="text-center">Empresa</h4>
                <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
            <div class="col-md-4 col-md-offset-4">
                <h4 class="text-center">Sucursal</h4>
                <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                    Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
                    runat="server" ValidationGroup="ValidationAdd" />
            </div>
        </asp:PlaceHolder>
    </div>
    <br />
    <br />

    <div class="row">
        <div class="col-md-3 col-md-offset-1">
            <h3>Empresa: </h3>
            <asp:Label runat="server" ID="txtEmpresa" CssClass="control-label" Text="Nombre Empresa"></asp:Label>

        </div>
        <div class="col-md-3">
            <h3>Período: </h3>
            <asp:TextBox ID="txtPeriodo" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox1"
                runat="server" ValidationGroup="ValidationAdd" />
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-md-11 col-md-offset-1">
            <asp:Panel runat="server" ID="pnDatos">
                <table class="table table-condensed">

                    <tr class="bg-aqua color-palette">
                        <th class="col-md-3 text-center">NOMBRE</th>
                        <th class="col-md-3 text-center">OFICIO</th>
                        <th class="col-md-3 text-center">SECCION</th>
                        <th class="col-md-3 text-center">FECHA</th>
                    </tr>

                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox1" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox2" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox3" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox4" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox5" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox6" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox7" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox8" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox9" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox10" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox11" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox12" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox13" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox14" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox15" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox16" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox17" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox18" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox19" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox20" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox21" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox22" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox23" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox24" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox25" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox26" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox27" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox28" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox29" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox30" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox31" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox32" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox33" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox34" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox35" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox36" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox37" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox1" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox38" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox2" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox39" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox3" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                        <td class="col-md-3">
                            <asp:TextBox ID="Textbox40" runat="server" ClientIDMode="Static" type="date" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                ControlToValidate="Textbox4" runat="server" ValidationGroup="ValidationAdd" />
                        </td>
                    </tr>

                </table>
            </asp:Panel>
        </div>
    </div>
    <br />

    <div class="row text-center">

        <div class="col-md-4 col-md-offset-4">
            <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
                OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
            <h4>Generar Documento</h4>
        </div>

    </div>

</asp:Content>
